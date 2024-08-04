/**
 * Datum used to hold information about a product in a vending machine
 */
/datum/data/vending_product
	var/product_name = "generic" // Display name for the product
	var/product_desc
	var/product_path = null
	var/amount = 0      // The original amount held in the vending machine
	var/price = 0       // Price to buy one
	var/display_color = null  // Display color for vending machine listing
	var/category = CAT_NORMAL // CAT_HIDDEN for contraband, CAT_COIN for premium
	var/obj/machinery/vending/vending_machine  // The vending machine we belong to
	var/list/instances = list()		  // Stores inserted items. Instances are only used for things added during the round, and not for things spawned at initialize

/datum/data/vending_product/New(vending_machine, path, name = null, amount = 1, price = 0, color = null, category = CAT_NORMAL)
	..()

	product_path = path
	product_name = name
	src.price = price
	src.amount = amount
	display_color = color
	src.category = category

	var/obj/tmp = path

	if(!product_name)
		product_name = initial(tmp.name)
		if(ispath(tmp, /obj/item/computer_hardware/hard_drive/portable))
			var/obj/item/computer_hardware/hard_drive/portable/tmp_disk = tmp
			if(initial(tmp_disk.disk_name))
				product_name = initial(tmp_disk.disk_name)

	product_desc = initial(tmp.desc)

	src.vending_machine = vending_machine

	if(src.price <= 0 && src.vending_machine.auto_price)
		src.price = initial(tmp.price_tag)

/datum/data/vending_product/Destroy()
	vending_machine.product_records.Remove(src)
	vending_machine = null
	. = ..()

/datum/data/vending_product/proc/get_amount()
	return amount

/datum/data/vending_product/proc/add_product(var/atom/movable/product)
	if(product.type != product_path)
		return 0
	playsound(vending_machine.loc, 'sound/machines/vending_drop.ogg', 100, 1)
	instances.Add(product)
	product.forceMove(vending_machine)
	amount += 1

/datum/data/vending_product/proc/get_product(var/product_location)
	if(get_amount() <= 0 || !product_location)
		return
	var/atom/movable/product
	if (instances && instances.len)
		product = instances[instances.len]
		instances.Remove(product)
	else
		product = new product_path
	amount -= 1
	if(vending_machine.oldified && prob(30))
		product.make_old()
	product.forceMove(product_location)
	return product

// Used for custom vendors safely pooping out everything they have
/datum/data/vending_product/proc/remove_all_items(var/product_location)
	if(!product_location)
		return
	for(var/atom/movable/product in instances)
		product.forceMove(product_location)
		// do not check amount, if this isn't handled properly elsewhere then whatever, instances should never get lost
		amount -= 1
		// not sure this check matters
		if(vending_machine.oldified && prob(30))
			product.make_old()
	instances.Cut()
	// Spawn whatever is left in `amount`
	while(amount > 0)
		var/atom/movable/product = new product_path
		amount -= 1
		// not sure this check matters
		if(vending_machine.oldified && prob(30))
			product.make_old()
		product.forceMove(product_location)


/**
 * A vending machine
 */
/obj/machinery/vending
	name = "Vendomat"
	desc = "A generic vending machine."
	icon = 'icons/obj/vending.dmi'
	icon_state = "generic"
	layer = BELOW_OBJ_LAYER
	anchored = 1
	density = 1

	var/icon_vend //Icon_state when vending
	var/icon_deny //Icon_state when denying access
	var/icon_type //For over-lays after remodeling a custom vending machine

	// Power
	use_power = IDLE_POWER_USE
	idle_power_usage = 10
	var/vend_power_usage = 150 //actuators and stuff

	// Vending-related
	var/active = 1 //No sales pitches if off!
	var/vend_ready = 1 //Are we ready to vend?? Is it time??
	var/vend_delay = 10 //How long does it take to vend?
	var/categories = CAT_NORMAL // Bitmask of cats we're currently showing
	var/datum/data/vending_product/currently_vending = null // What we're requesting payment for right now

	// UI-related
	var/management_message = ""
	var/management_error = FALSE

	var/purchase_message = ""
	var/purchase_error = FALSE

	/*
		Variables used to initialize the product list
		These are used for initialization only, and so are optional if
		product_records is specified
	*/
	var/list/products	= list() // For each, use the following pattern:
	var/list/contraband	= list() // list(/type/path = amount,/type/path2 = amount2)
	var/list/premium 	= list() // No specified amount = only one in stock
	var/list/prices   = list() // Prices for each item, list(/type/path = price), items not in the list don't have a price.

	//Vars for task_mastery
	var/give_discounts = TRUE
	var/give_discount_points = TRUE

	// List of vending_product items available.
	var/list/product_records = list()


	// Variables used to initialize advertising
	var/product_slogans = "" //String of slogans spoken out loud, separated by semicolons
	var/product_ads = "" //String of small ad messages in the vending screen

	var/list/ads_list = list()

	// Stuff relating vocalizations
	var/list/slogan_list = list()
	var/shut_up = 0 //Let spouting those godawful pitches!
	var/vend_reply //Thank you for shopping!
	var/last_reply = 0
	var/last_slogan = 0 //When did we last pitch?
	var/slogan_delay = 6000 //How long until we can pitch again?

	// Things that can go wrong
	emagged = 0 //Ignores if somebody doesn't have card access to that machine.
	var/seconds_electrified = 0 //Shock customers like an airlock.
	var/shoot_inventory = 0 //Fire items at customers! We're broken!

	var/custom_vendor = FALSE //If it's custom, it can be loaded with stuff as long as it's unlocked.
	var/locked = TRUE
	var/datum/money_account/machine_vendor_account //Owner of this vendomat. Used for access.
	var/datum/money_account/earnings_account //Money flows in and out of this account.
	var/vendor_department = DEPARTMENT_LSS  //If set, members can manage this vendomat. earnings_account is set to the department's account automatically.
	var/buying_percentage = 0 //If set, the vendomat will accept people selling items to it, and in return will give (percentage * listed item price) in cash
	var/scan_id = 1
	var/auto_price = TRUE //The vendomat will automatically set prices on products if their price is not specified.
	var/obj/item/coin/coin
	var/datum/wires/vending/wires = null
	var/always_open	=	FALSE // If true, this machine allows products to be inserted without requirinf the maintenance hatch to be screwed open first
	var/list/can_stock = list()	//A whitelist of objects which can be stocked into this vendor
	//Note that a vendor can always accept restocks of things it has had in the past. This is in addition to that
	var/no_criminals = FALSE //If true, the machine asks if you're wanted by security when you try to order.
	var/alt_currency_path	// If set, this machine will only take items of the given path as currency.

/obj/machinery/vending/New()
	..()
	wires = new(src)
	icon_type = initial(icon_state)
	power_change()


/obj/machinery/vending/Initialize()
	..()
	return INITIALIZE_HINT_LATELOAD

/obj/machinery/vending/LateInitialize()
	..()
	if(product_slogans)
		slogan_list += splittext(product_slogans, ";")

		// So not all machines speak at the exact same time.
		// The first time this machine says something will be at slogantime + this random value,
		// so if slogantime is 10 minutes, it will say it at somewhere between 10 and 20 minutes after the machine is crated.
		last_slogan = world.time + rand(0, slogan_delay)

	if(product_ads)
		ads_list += splittext(src.product_ads, ";")

	build_inventory()
	power_change()

/**
 * Add item to the machine
 *
 * Checks if item is vendable in this machine should be performed before
 * calling. W is the item being inserted, R is the associated vending_product entry.
 	R can be null, in which case the user is inserting something that wasnt previously here.
 	In that case we create a new inventory record for the item
 */
/obj/machinery/vending/proc/stock(obj/item/W, var/datum/data/vending_product/R, var/mob/user)
	if(!user.unEquip(W))
		return

	to_chat(user, SPAN_NOTICE("You insert \the [W] in the product receptor."))
	if (R)
		R.add_product(W)
	else
		new_inventory(W)

	return TRUE

/obj/machinery/vending/proc/try_to_buy(obj/item/W, var/datum/data/vending_product/R, var/mob/user)
	if(!earnings_account)
		to_chat(user, SPAN_WARNING("[src] flashes a message: Vendomat not registered to an account."))
		return
	if(vendor_department)
		to_chat(user, SPAN_WARNING("[src] flashes a message: Vendomat not authorized to accept sales. Please contact a member of [GLOB.all_departments[vendor_department]]."))
		return
	if(buying_percentage <= 0)
		to_chat(user, SPAN_WARNING("[src] flashes a message: Vendomat not accepting sales."))
		return

	if(!user.unEquip(W))
		return

	var/buying_price = round(R.price * buying_percentage/100,5)
	if(earnings_account.money < buying_price)
		to_chat(user, SPAN_WARNING("[src] flashes a message: Account is unable to make this purchase."))
		return
	var/datum/transaction/T = new(-buying_price, "[user.name]", "Sale of [R.product_name]", src)
	T.apply_to(earnings_account)

	R.add_product(W)

	spawn_money(buying_price,loc,usr)

	to_chat(user, SPAN_NOTICE("[src] accepts the sale of [W] and dispenses [buying_price] credits."))

/**
 * Build src.produdct_records from the products lists
 *
 * src.products, src.contraband, src.premium, and src.prices allow specifying
 * products that the vending machine is to carry without manually populating
 * src.product_records.
 */
/obj/machinery/vending/proc/build_inventory()
	var/list/all_products = list(
		list(products, CAT_NORMAL),
		list(contraband, CAT_HIDDEN),
		list(premium, CAT_COIN))

	for(var/current_list in all_products)
		var/category = current_list[2]

		for(var/entry in current_list[1])
			var/datum/data/vending_product/product = new/datum/data/vending_product(src, entry)

			product.price = (entry in prices) ? prices[entry] : product.price
			product.amount = (current_list[1][entry]) ? current_list[1][entry] : 1
			product.category = category

			product_records.Add(product)


//This is used when a user inserts something during the round which wasn't previously a product
/obj/machinery/vending/proc/new_inventory(var/obj/item/I)
	var/datum/data/vending_product/product = new/datum/data/vending_product(src, I.type, I.name)
	product.amount = 1
	product.price = I.get_item_cost()
	playsound(loc, 'sound/machines/vending_drop.ogg', 100, 1)
	product_records.Add(product)
	product.instances.Add(I)
	I.forceMove(src)
	return product

/obj/machinery/vending/Destroy()
	qdel(wires)
	wires = null
	qdel(coin)
	coin = null
	for(var/datum/data/vending_product/R in product_records)
		qdel(R)
	product_records.Cut()
	return ..()

/obj/machinery/vending/ex_act(severity)
	switch(severity)
		if(1.0)
			qdel(src)
			return
		if(2.0)
			if (prob(50))
				qdel(src)
				return
		if(3.0)
			if (prob(25))
				spawn(0)
					malfunction()
					return
				return
		else
	return

/obj/machinery/vending/emag_act(var/remaining_charges, var/mob/user)
	if (machine_vendor_account || vendor_department || earnings_account)
		to_chat(user, "You override the ownership protocols on \the [src] and unlock it. You can now register it in your name.")
		machine_vendor_account = null
		vendor_department = null
		earnings_account = null
		return 1
	if (!emagged)
		emagged = 1
		to_chat(user, "You short out the product lock on \the [src]")
		return 1

/obj/machinery/vending/attackby(obj/item/I, mob/user)

	var/tool_type = I.get_tool_type(user, list(QUALITY_BOLT_TURNING, QUALITY_SCREW_DRIVING, QUALITY_WELDING), src)
	switch(tool_type)

		if(QUALITY_BOLT_TURNING)
			if(I.use_tool(user, src, WORKTIME_NORMAL, tool_type, FAILCHANCE_VERY_EASY, required_stat = STAT_MEC))
				to_chat(user, SPAN_NOTICE("You [anchored? "un" : ""]secured \the [src]!"))
				anchored = !anchored
				power_change()
			return

		if(QUALITY_SCREW_DRIVING)
			var/used_sound = panel_open ? 'sound/machines/Custom_screwdriveropen.ogg' : 'sound/machines/Custom_screwdriverclose.ogg'
			if(I.use_tool(user, src, WORKTIME_NEAR_INSTANT, tool_type, FAILCHANCE_VERY_EASY, required_stat = STAT_MEC, instant_finish_tier = 30, forced_sound = used_sound))
				panel_open = !panel_open
				to_chat(user, SPAN_NOTICE("You [panel_open ? "open" : "close"] the maintenance panel."))
				cut_overlays()
				if(panel_open)
					add_overlay(image(icon, "[icon_type]-panel")) //we have to use add_overlay here as opposed to overlay += due to the latter adding another layer onto the icon with each use of the screwdriver
			return

		if(QUALITY_WELDING)
			if(custom_vendor)
				if(!panel_open)
					to_chat(usr, SPAN_WARNING("The maintenance panel on \the [src] needs to be open before deconstructing it."))
					return
				if(I.use_tool(user, src, WORKTIME_EXTREMELY_LONG, tool_type, FAILCHANCE_NORMAL, required_stat = STAT_MEC))
					visible_message(SPAN_WARNING("\The [src] has been dismantled by [user]!"),"You hear welding.")
					new /obj/item/stack/material/steel(loc, 8)
					for(var/datum/data/vending_product/R in product_records)
						for(var/obj/O in R.instances)
							O.forceMove(loc)
					new /obj/item/circuitboard/vending(loc)
					qdel(src)

		if(ABORT_CHECK)
			return

	var/obj/item/card/id/ID = I.GetIdCard()

	if (currently_vending && earnings_account && !earnings_account.suspended)
		var/paid = FALSE
		var/handled = FALSE

		if(alt_currency_path)
			if(istype(I, alt_currency_path))
				paid = pay_with_item(I, user)
			else
				var/atom/movable/AM = alt_currency_path
				to_chat(user, SPAN_WARNING("This vending machine only accepts [initial(AM.name)] as currency."))
			handled = TRUE
		else
			if(ID) //for IDs and PDAs and wallets with IDs
				paid = pay_with_card(ID,I)
				handled = TRUE
				playsound(usr.loc, 'sound/machines/id_swipe.ogg', 100, 1)
			else if(istype(I, /obj/item/spacecash/ewallet))
				var/obj/item/spacecash/ewallet/C = I
				paid = pay_with_ewallet(C, user)
				handled = TRUE
				playsound(usr.loc, 'sound/machines/id_swipe.ogg', 100, 1)
			else if(istype(I, /obj/item/spacecash/bundle))
				var/obj/item/spacecash/bundle/C = I
				paid = pay_with_cash(C)
				handled = TRUE

		if(paid)
			vend(currently_vending, user)
			return

		else if(handled)
			return // don't smack that machine with your 2 credits

	if (custom_vendor && ID)
		var/datum/money_account/user_account = get_account(ID.associated_account_number)
		if(!user_account)
			to_chat(user, SPAN_WARNING("Unable to access account! Please contact technical support if problem persists."))
			return

		if(user_account.suspended)
			to_chat(user, SPAN_WARNING("Unable to access account! Account is suspended."))
			return

		if(machine_vendor_account == user_account || !machine_vendor_account || vendor_department)
			if(vendor_department)
				var/datum/computer_file/report/crew_record/CR = get_crewmember_record(user_account.owner_name)
				var/datum/job/userjob = SSjob.GetJob(CR.get_job())
				if(userjob.department == vendor_department)
					locked = !locked
					to_chat(user, SPAN_NOTICE("\The [src] has been [locked ? "" : "un"]locked."))
				else
					to_chat(user, SPAN_NOTICE("You are not authorized to manage \the [src]."))
				return
			// Enter PIN, so you can't loot a vending machine with only the owner's ID card (as long as they increased the sec level)
			if(user_account.security_level != 0)
				var/attempt_pin = input("Enter pin code", "Vendor transaction") as num | null
				user_account = attempt_account_access(ID.associated_account_number, attempt_pin, 2)

				if(!user_account)
					to_chat(user, SPAN_WARNING("Unable to access account! Credentials are incorrect."))
					return
			if(!machine_vendor_account)
				machine_vendor_account = user_account
				earnings_account = user_account

			locked = !locked
			playsound(usr.loc, 'sound/machines/id_swipe.ogg', 60, 1)
			to_chat(user, SPAN_NOTICE("You [locked ? "" : "un"]lock \the [src]."))
			visible_message("<span class='info'>\The [usr] swipes \the [ID] through \the [src], [locked ? "" : "un"]locking it.</span>")
			return

	if (I && istype(I, /obj/item/spacecash))
		power_change()
		attack_hand(user)
		return

	else if((QUALITY_CUTTING in I.tool_qualities) || (QUALITY_WIRE_CUTTING in I.tool_qualities) || (QUALITY_PULSING in I.tool_qualities))
		if(panel_open)
			attack_hand(user)
			power_change()
		return
	else if(istype(I, /obj/item/coin) && premium.len > 0)
		power_change()
		user.drop_item()
		I.loc = src
		coin = I
		categories |= CAT_COIN
		to_chat(user, SPAN_NOTICE("You insert \the [I] into \the [src]."))
		return

	for(var/datum/data/vending_product/R in product_records)
		if(I.type == R.product_path && I.name == R.product_name)
			if (!locked || always_open || (panel_open && !custom_vendor))
				stock(I, R, user)
				return 1
			else if (custom_vendor)
				try_to_buy(I, R, user)
				return 1

	for (var/a in can_stock)
		if (istype(I, a))
			if (!locked || always_open || !custom_vendor)
				stock(I, null, user)
				return 1
	..()

/**
 * Receive payment with cashmoney.
 */
/obj/machinery/vending/proc/pay_with_cash(obj/item/spacecash/bundle/cashmoney)
	if(currently_vending.price > cashmoney.worth)
		// This is not a status display message, since it's something the character
		// themselves is meant to see BEFORE putting the money in
		to_chat(usr, "\icon[cashmoney] <span class='warning'>That is not enough money.</span>")
		return 0

	visible_message("<span class='info'>\The [usr] inserts some cash into \the [src].</span>")
	cashmoney.worth -= currently_vending.price

	if(cashmoney.worth <= 0)
		usr.drop_from_inventory(cashmoney)
		qdel(cashmoney)
	else
		cashmoney.update_icon()

	// Vending machines have no idea who paid with cash
	credit_purchase("(cash)")
	return 1

/**
 * Scan a chargecard and deduct payment from it.
 *
 * Takes payment for whatever is the currently_vending item. Returns 1 if
 * successful, 0 if failed.
 */
/obj/machinery/vending/proc/pay_with_ewallet(obj/item/spacecash/ewallet/wallet, mob/user)
	visible_message("<span class='info'>\The [usr] swipes \the [wallet] through \the [src].</span>")
	if(currently_vending.price > wallet.worth)
		purchase_message = "Insufficient funds on chargecard."
		purchase_error = TRUE
		return FALSE

	if(give_discounts && give_discount_points)
		if(isliving(user))
			var/mob/living/H = user
			if(currently_vending.price)
				var/points_rewarded = (currently_vending.price / 100) //Shockingly this is MORE fair then a flat value as it rewards better for high spenders well still punishing low value endless transations
				H.learnt_tasks.attempt_add_task_mastery(/datum/task_master/task/vender_e_shopper, "VENDER_E_SHOPPER", skill_gained = points_rewarded, learner = H)
			//Small order of operations here to prevent first time buyers being SCAMMED out of point rewards and such.
			var/task_level = H.learnt_tasks.get_task_mastery_level("VENDER_E_SHOPPER")

			if(task_level < currently_vending.price) //so free stuff dosnt get discounted/givepoints
				currently_vending.price -= task_level
				wallet.worth -= currently_vending.price
				credit_purchase("[wallet.owner_name] (chargecard)")
				currently_vending.price += task_level //So we dont perma lower the price of things
				return TRUE

			wallet.worth -= currently_vending.price
			credit_purchase("[wallet.owner_name] (chargecard)")
			return TRUE


	wallet.worth -= currently_vending.price
	credit_purchase("[wallet.owner_name] (chargecard)")
	return TRUE

/**
 * Scan a card and attempt to transfer payment from associated account.
 *
 * Takes payment for whatever is the currently_vending item. Returns 1 if
 * successful, 0 if failed
 */
/obj/machinery/vending/proc/pay_with_card(var/obj/item/card/id/I, var/obj/item/ID_container)
	if(I==ID_container || ID_container == null)
		visible_message("<span class='info'>\The [usr] swipes \the [I] through \the [src].</span>")
	else
		visible_message("<span class='info'>\The [usr] swipes \the [ID_container] through \the [src].</span>")
	var/datum/money_account/customer_account = get_account(I.associated_account_number)
	if(!customer_account)
		purchase_message = "Error: Unable to access account. Please contact technical support if problem persists."
		purchase_error = TRUE
		return FALSE

	if(customer_account.suspended)
		purchase_message = "Unable to access account: account suspended."
		purchase_error = TRUE
		return FALSE

	// Have the customer punch in the PIN before checking if there's enough money. Prevents people from figuring out acct is
	// empty at high security levels
	if(customer_account.security_level != 0) //If card requires pin authentication (ie seclevel 1 or 2)
		var/attempt_pin = input("Enter pin code", "Vendor transaction") as num
		customer_account = attempt_account_access(I.associated_account_number, attempt_pin, 2)

		if(!customer_account)
			purchase_message = "Unable to access account: incorrect credentials."
			purchase_error = TRUE
			return FALSE

	if(currently_vending.price > customer_account.money)
		purchase_message = "Insufficient funds in account."
		purchase_error = TRUE
		return FALSE
	else
		// Okay to move the money at this point

		// create entry in the purchaser's account log
		var/datum/transaction/T = new(-currently_vending.price, earnings_account.get_name(), "Purchase of [currently_vending.product_name]", src)
		T.apply_to(customer_account)

		// Give the vendor the money. We use the account owner name, which means
		// that purchases made with stolen/borrowed card will look like the card
		// owner made them
		credit_purchase(customer_account.owner_name)
		return 1

// Pay with an alternative currency
/obj/machinery/vending/proc/pay_with_item(obj/item/I, mob/user)
	var/should_qdel = TRUE
	var/amount_to_spend = currently_vending.price

	if(istype(I, /obj/item/stack))
		var/obj/item/stack/S = I
		if(S.amount >= amount_to_spend)
			S.use(amount_to_spend)
			if(S.amount)
				should_qdel = FALSE		// Don't qdel a stack with remaining charges
		else
			to_chat(user, SPAN_WARNING("\icon[I] That is not enough money."))
			return FALSE
	else
		return FALSE

	visible_message(SPAN_NOTICE("\The [user] inserts ["[amount_to_spend]"] [I.name] into \the [src]."))

	if(should_qdel)
		user.drop_from_inventory(I)
		qdel(I)

	return TRUE

/**
 * Add money for current purchase to the vendor account.
 *
 * Called after the money has already been taken from the customer.
 */
/obj/machinery/vending/proc/credit_purchase(target)
	var/datum/transaction/T = new(currently_vending.price, target, "Purchase of [currently_vending.product_name]", src)
	T.apply_to(earnings_account)

/obj/machinery/vending/attack_ai(mob/user as mob)
	return attack_hand(user)

/obj/machinery/vending/attack_hand(mob/user as mob)
	if(stat & (BROKEN|NOPOWER))
		return

	if(seconds_electrified != 0)
		if(src.shock(user, 100))
			return

	wires.Interact(user)
	ui_interact(user)

/**
 *  Display the TGUI window for the vending machine.
 *
 *  See TGUI documentation for details.
 */
/obj/machinery/vending/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "Vending")
		ui.set_autoupdate(TRUE)
		ui.open()

/obj/machinery/vending/ui_static_data(mob/user)
	var/list/data = list(
		"advertisement" = length(ads_list) ? pick(ads_list) : null
	)
	return data

/obj/machinery/vending/ui_data(mob/user)
	var/list/data = list()

	data["name"] = name
	data["panel"] = panel_open
	data["isCustom"] = custom_vendor

	if(custom_vendor && machine_vendor_account)
		data["ownerData"] = list(
			"name" = machine_vendor_account?.get_name(),
			"dept" = vendor_department
		)

	data["isManaging"] = !locked
	data["managingData"] = list(
		"message" = management_message,
		"isError" = management_error
	)

	data["isVending"] = currently_vending ? TRUE : FALSE
	data["vendingData"] = list(
		"name" = currently_vending?.product_name,
		"desc" = currently_vending?.product_desc,
		"price" = currently_vending?.price,
		"message" = purchase_message,
		"isError" = purchase_error
	)

	var/list/listed_products = list()
	for(var/key = 1 to length(product_records))
		var/datum/data/vending_product/I = product_records[key]

		if(!(I.category & categories))
			continue

		listed_products.Add(list(list(
			"key" = key,
			"name" = strip_improper(I.product_name),
			"icon" = icon2base64html(I.product_path),
			"price" = I.price,
			"color" = I.display_color,
			"amount" = I.get_amount())))

	data["products"] = listed_products
	data["markup"] = buying_percentage

	if(panel_open)
		data["speaker"] = !shut_up

	return data

/obj/machinery/vending/ui_act(action, list/params, datum/tgui/ui, datum/ui_state/state)
	. = ..()
	if(.)
		return TRUE

	switch(action)
		if("vend")
			if(!vend_ready || currently_vending)
				return TRUE

			if((!allowed(usr)) && !emagged && scan_id)	//For SECURE VENDING MACHINES YEAH
				to_chat(usr, SPAN_WARNING("Access denied!"))	//Unless emagged of course
				flick(icon_deny, src)
				return TRUE

			var/key = text2num(params["key"])
			var/datum/data/vending_product/R = product_records[key]

			// This should not happen unless the request from TGUI was bad
			if(!(R.category & categories))
				return TRUE

			if(R.price <= 0 || !locked)
				vend(R, usr)
			else if(issilicon(usr)) //If the item is not free, provide feedback if a synth is trying to buy something.
				to_chat(usr, SPAN_DANGER("Artificial unit recognized.  Artificial units cannot complete this transaction.  Purchase canceled."))
				return TRUE

			else
				currently_vending = R
				if(!earnings_account || earnings_account.suspended)
					purchase_message = "This machine is currently unable to process payments due to problems with the associated account."
					purchase_error = TRUE
				else
					purchase_message = "Please swipe a card or insert cash to pay for the item."
					if(no_criminals)
						purchase_message += " We are legally required to ask if you are currently wanted by any law enforcement organizations. If so, please cancel the purchase, announce your location to local law enforcement and wait for them to collect you."
					purchase_error = FALSE
			return TRUE

		if("setprice")
			if(locked)
				return TRUE

			var/key = text2num(params["key"])
			var/datum/data/vending_product/R = product_records[key]

			R.price = input("Enter item price.", "Item price") as num | null
			return TRUE

		if("remove")
			if(locked)
				return TRUE

			var/key = text2num(params["key"])
			var/datum/data/vending_product/R = product_records[key]
			R.remove_all_items(get_turf(src))

			qdel(R)
			return TRUE

		if("setaccount")
			var/datum/money_account/newaccount = get_account(input("Please enter the number of the account that will handle transactions for this Vendomat.", "Vendomat Account", null) as num | null)
			if(!newaccount)
				management_message = "No account specified. No change to earnings account has been made."
				management_error = TRUE
			else
				var/input_pin = input("Please enter the PIN for this account.", "Account PIN", null) as num | null
				if(input_pin == newaccount.remote_access_pin)
					management_message = "This Vendomat will now use the specified account, owned by [newaccount.get_name()]."
					management_error = FALSE
					earnings_account = newaccount
				else
					management_message = "Error: PIN incorrect. No change to earnings account has been made."
					management_error = TRUE
			return TRUE

		if("markup")
			if(vendor_department)
				management_message = "Error: Department Vendomats are not authorized to buy items for fraud concerns."
				management_error = TRUE
			else
				var/newpercent = input("Please enter the percentage of the sale value the Vendomat should offer when purchasing items. Set to 0 to deny sales.", "Markup", null) as num | null
				if(newpercent)
					buying_percentage = max(0, min(newpercent,100))
			return TRUE

		if("setdepartment")
			set_department()
			return TRUE

		if("unregister")
			machine_vendor_account = null
			earnings_account = null
			return TRUE

		if("cancelpurchase")
			currently_vending = null
			return TRUE

		if("togglevoice")
			if(!panel_open)
				return TRUE

			shut_up = !shut_up
			return TRUE

	add_fingerprint(usr)
	playsound(usr.loc, 'sound/machines/button.ogg', 100, 1)

/obj/machinery/vending/proc/vend(datum/data/vending_product/R, mob/user)
	if((!allowed(usr)) && !emagged && scan_id)	//For SECURE VENDING MACHINES YEAH
		to_chat(usr, SPAN_WARNING("Access denied."))	//Unless emagged of course
		flick(icon_deny,src)
		return
	vend_ready = 0 //One thing at a time!!
	purchase_message = "Vending..."
	purchase_error = FALSE

	if (R.category & CAT_COIN)
		if(!coin)
			to_chat(user, SPAN_NOTICE("You need to insert a coin to get this item."))
			return
		if(coin.string_attached)
			if(prob(50))
				to_chat(user, SPAN_NOTICE("You successfully pull the coin out before \the [src] could swallow it."))
			else
				to_chat(user, SPAN_NOTICE("You weren't able to pull the coin out fast enough, the machine ate it, string and all."))
				qdel(coin)
				categories &= ~CAT_COIN
		else
			qdel(coin)
			categories &= ~CAT_COIN

	if(((last_reply + (vend_delay + 200)) <= world.time) && vend_reply)
		spawn(0)
			speak(vend_reply)
			last_reply = world.time

	use_power(vend_power_usage)	//actuators and stuff
	if (icon_vend) //Show the vending animation if needed
		flick(icon_vend,src)
	spawn(vend_delay)
		if(R.get_product(get_turf(src)))
			playsound(loc, 'sound/machines/vending_drop.ogg', 100, 1)
		purchase_message = ""
		purchase_error = FALSE
		vend_ready = 1
		currently_vending = null

/obj/machinery/vending/Process()
	if(stat & (BROKEN|NOPOWER))
		return

	if(!active)
		return

	if(seconds_electrified > 0)
		seconds_electrified--

	//Pitch to the people! Really sell it!
	if(((last_slogan + slogan_delay) <= world.time) && (slogan_list.len > 0 || custom_vendor) && (!shut_up) && prob(5))
		if(slogan_list.len)
			var/slogan = pick(slogan_list)
			speak(slogan)
			last_slogan = world.time
		else if(custom_vendor && product_records.len)
			var/datum/data/vending_product/advertised = pick(product_records)
			if(advertised)
				var/advertisement = "[pick("Come get","Come buy","Buy","Sale on","We have")] \an [advertised.product_name], [pick("for only","only","priced at")] [advertised.price] credits![pick(" What a deal!"," Can you believe it?","")]"
				speak(advertisement)
				last_slogan = world.time

	if(shoot_inventory && prob(2))
		throw_item()

	return

/obj/machinery/proc/speak(message)
	if(stat & NOPOWER)
		return

	if (!message)
		return

	for(var/mob/O in hearers(src, null))
		O.show_message("<span class='game say'><span class='name'>\The [src]</span> beeps, \"[message]\"</span>",2)
	return

/obj/machinery/vending/power_change()
	..()
	if(stat & BROKEN)
		icon_state = "[icon_type]-broken"
	else
		if( !(stat & NOPOWER) )
			icon_state = icon_type
		else
			spawn(rand(0, 15))
				icon_state = "[icon_type]-off"

//Oh no we're malfunctioning! Dump out some product and break.
/obj/machinery/vending/proc/malfunction()
	for(var/datum/data/vending_product/R in product_records)
		while(R.get_amount()>0)
			R.get_product(loc)
		break

	stat |= BROKEN
	icon_state = "[icon_type]-broken"
	return

//Somebody cut an important wire and now we're following a new definition of "pitch."
/obj/machinery/proc/throw_item()
	var/mob/living/target = locate() in view(7,src)
	if(!target)
		return FALSE
	var/obj/item/projectile/P = new /obj/item/projectile/coin(get_turf(src))
	P.shot_from = src
	playsound(src, 'sound/weapons/Gunshot_light.ogg', 60, 1) // Please no more actual gunshot sounds from a vending machine
	P.launch(target)
	visible_message(SPAN_WARNING("\The [src] launches \a [P] at \the [target]!"))
	return TRUE

/obj/machinery/vending/proc/set_department()
	var/list/possible_departments = list("Privately Owned" = null)
	for(var/d in GLOB.all_departments)
		possible_departments[GLOB.all_departments[d]] = department_accounts[d]
	var/newdepartment = input("Which organization should be considered the owner of this Vendomat? This will also allow members to manage it.", "Vendomat Department", null) in possible_departments
	if(!newdepartment)
		return
	if(newdepartment == "Privately Owned")
		management_message = "This Vendomat now belongs only to you."
		desc = "A custom Vendomat."
		vendor_department = null
		earnings_account = null
	else
		management_message = "This Vendomat is now property of \"[newdepartment]\"."
		desc = "A custom Vendomat. It bears the logo of [newdepartment]."
		vendor_department = newdepartment:id
		earnings_account = department_accounts[vendor_department]
		buying_percentage = 0
	management_error = FALSE

/*
 * Vending machine types
 */

/*

/obj/machinery/vending/[vendors name here]  // --vending machine template  :)
	name = ""
	desc = ""
	icon = ''
	icon_state = ""
	vend_delay = 15
	products = list()
	contraband = list()
	premium = list()
------------------------
/obj/machinery/vending/atmospherics //Commenting this out until someone ponies up some actual working, broken, and unpowered sprites - Quarxink
	name = "Tank Vendor"
	desc = "A vendor with a wide variety of masks and gas tanks."
	icon = 'icons/obj/objects.dmi'
	icon_state = "dispenser"
	product_paths = "/obj/item/tank/oxygen;/obj/item/tank/plasma;/obj/item/tank/emergency_oxygen;/obj/item/tank/emergency_oxygen/engi;/obj/item/clothing/mask/breath"
	productamounts = "10;10;10;5;25"
	vend_delay = 0
*/

/obj/machinery/vending/custom
	name = "Custom Vendomat"
	desc = "A custom vending machine."
	vendor_department = null //Anyone can make a custom vendor
	custom_vendor = TRUE
	locked = TRUE
	can_stock = list(/obj/item)
	//No.
	give_discounts = FALSE
	give_discount_points = FALSE

/obj/machinery/vending/custom/verb/remodel()
	set name = "Remodel Vendomat"
	set category = "Object"
	set src in oview(1)

	if(locked)
		to_chat(usr, SPAN_WARNING("[src] needs to be unlocked to remodel it."))
		return
	var/choice = input(usr, "How do you want your Vendomat to look? You can remodel it again later.", "Vendomat Remodeling", null) in CUSTOM_VENDOMAT_MODELS
	if(!choice)
		return
	icon_type = CUSTOM_VENDOMAT_MODELS[choice]
	power_change()

/obj/machinery/vending/custom/verb/rename()
	set name = "Rename Vendomat"
	set category = "Object"
	set src in oview(1)

	if(locked)
		to_chat(usr, SPAN_WARNING("[src] needs to be unlocked to rename it."))
		return

	var/choice = sanitize(input("What do you want to name your Vendomat? You can rename it again later.", "Vendomat Renaming", name) as text|null, MAX_NAME_LEN)
	if(choice)
		SetName(choice)


#undef CUSTOM_VENDOMAT_MODELS
