// A vendor machine for modular computer portable devices - Laptops and Tablets

/obj/machinery/lapvend
	name = "computer vendor"
	desc = "A vending machine with a built-in microfabricator, capable of dispensing various computers."
	icon = 'icons/obj/vending.dmi'
	icon_state = "robotics"
	layer = BELOW_OBJ_LAYER
	anchored = 1
	density = 1

	// The actual laptop/tablet
	var/obj/item/modular_computer/fabricated_device = null

	var/datum/transaction/transaction_template = null

	// Utility vars
	var/state = 0 							// 0: Select device type, 1: Select loadout, 2: Payment, 3: Thankyou screen
	var/devtype = 0 						// 0: None(unselected), 1: Laptop, 2: Tablet
	var/total_price = 0						// Price of currently vended device.

	// Device loadout
	var/dev_cpu = 1							// 1: Default, 2: Upgraded
	var/dev_battery = 1						// 1: Default, 2: Upgraded, 3: Advanced
	var/dev_disk = 1						// 1: Default, 2: Upgraded, 3: Advanced
	var/dev_netcard = 0						// 0: None, 1: Basic, 2: Long-Range
	var/dev_tesla = 0						// 0: None, 1: Standard
	var/dev_nanoprint = 0					// 0: None, 1: Standard
	var/dev_card = 0						// 0: None, 1: Standard
	var/dev_aislot = 0						// 0: None, 1: Standard

/obj/machinery/lapvend/New()
	..()
	transaction_template = new(
		0, "Computer Manufacturer (via [src.name])",
		null, src.name
	)

// Removes all traces of old order and allows you to begin configuration from scratch.
/obj/machinery/lapvend/proc/reset_order()
	state = 0
	devtype = 0
	if(fabricated_device)
		QDEL_NULL(fabricated_device)
	dev_cpu = 1
	dev_battery = 1
	dev_disk = 1
	dev_netcard = 0
	dev_tesla = 0
	dev_nanoprint = 0
	dev_card = 0
	dev_aislot = 0

// Recalculates the price and optionally even fabricates the device.
/obj/machinery/lapvend/proc/fabricate_and_recalc_price(var/fabricate = 0)
	total_price = 0
	if(devtype == 1) 		// Laptop, generally cheaper to make it accessible for most station roles
		if(fabricate)
			fabricated_device = new /obj/item/modular_computer/laptop(src)
		total_price = 99
		switch(dev_cpu)
			if(1)
				if(fabricate)
					fabricated_device.processor_unit = new/obj/item/weapon/computer_hardware/processor_unit/small(fabricated_device)
			if(2)
				if(fabricate)
					fabricated_device.processor_unit = new/obj/item/weapon/computer_hardware/processor_unit(fabricated_device)
				total_price += 299
		switch(dev_battery)
			if(1) // Basic(750C)
				if(fabricate)
					fabricated_device.cell = new /obj/item/weapon/cell/medium(fabricated_device)
			if(2) // Upgraded(1100C)
				if(fabricate)
					fabricated_device.cell = new /obj/item/weapon/cell/medium/high(fabricated_device)
				total_price += 199
			if(3) // Advanced(1500C)
				if(fabricate)
					fabricated_device.cell = new /obj/item/weapon/cell/medium/super(fabricated_device)
				total_price += 499
		switch(dev_disk)
			if(1) // Basic(128GQ)
				if(fabricate)
					fabricated_device.hard_drive = new/obj/item/weapon/computer_hardware/hard_drive(fabricated_device)
			if(2) // Upgraded(256GQ)
				if(fabricate)
					fabricated_device.hard_drive = new/obj/item/weapon/computer_hardware/hard_drive/advanced(fabricated_device)
				total_price += 99
			if(3) // Advanced(512GQ)
				if(fabricate)
					fabricated_device.hard_drive = new/obj/item/weapon/computer_hardware/hard_drive/super(fabricated_device)
				total_price += 299
		switch(dev_netcard)
			if(1) // Basic(Short-Range)
				if(fabricate)
					fabricated_device.network_card = new/obj/item/weapon/computer_hardware/network_card(fabricated_device)
				total_price += 99
			if(2) // Advanced (Long Range)
				if(fabricate)
					fabricated_device.network_card = new/obj/item/weapon/computer_hardware/network_card/advanced(fabricated_device)
				total_price += 299
		if(dev_tesla)
			total_price += 399
			if(fabricate)
				fabricated_device.tesla_link = new/obj/item/weapon/computer_hardware/tesla_link(fabricated_device)
		if(dev_nanoprint)
			total_price += 99
			if(fabricate)
				fabricated_device.printer = new/obj/item/weapon/computer_hardware/printer(fabricated_device)
		if(dev_card)
			total_price += 199
			if(fabricate)
				fabricated_device.card_slot = new/obj/item/weapon/computer_hardware/card_slot(fabricated_device)
		if(dev_aislot)
			total_price += 499
			if(fabricate)
				fabricated_device.ai_slot = new/obj/item/weapon/computer_hardware/ai_slot(fabricated_device)

		return total_price
	else if(devtype == 2) 	// Tablet, more expensive, not everyone could probably afford this.
		if(fabricate)
			fabricated_device = new /obj/item/modular_computer/tablet(src)
			fabricated_device.processor_unit = new/obj/item/weapon/computer_hardware/processor_unit/small(fabricated_device)
		total_price = 199
		switch(dev_battery)
			if(1) // Basic(300C)
				if(fabricate)
					fabricated_device.cell = new /obj/item/weapon/cell/small(fabricated_device)
			if(2) // Upgraded(500C)
				if(fabricate)
					fabricated_device.cell = new /obj/item/weapon/cell/small/high(fabricated_device)
				total_price += 199
			if(3) // Advanced(750C)
				if(fabricate)
					fabricated_device.cell = new /obj/item/weapon/cell/small/super(fabricated_device)
				total_price += 499
		switch(dev_disk)
			if(1) // Basic(32GQ)
				if(fabricate)
					fabricated_device.hard_drive = new/obj/item/weapon/computer_hardware/hard_drive/micro(fabricated_device)
			if(2) // Upgraded(64GQ)
				if(fabricate)
					fabricated_device.hard_drive = new/obj/item/weapon/computer_hardware/hard_drive/small(fabricated_device)
				total_price += 99
			if(3) // Advanced(128GQ)
				if(fabricate)
					fabricated_device.hard_drive = new/obj/item/weapon/computer_hardware/hard_drive(fabricated_device)
				total_price += 299
		switch(dev_netcard)
			if(1) // Basic(Short-Range)
				if(fabricate)
					fabricated_device.network_card = new/obj/item/weapon/computer_hardware/network_card(fabricated_device)
				total_price += 99
			if(2) // Advanced (Long Range)
				if(fabricate)
					fabricated_device.network_card = new/obj/item/weapon/computer_hardware/network_card/advanced(fabricated_device)
				total_price += 299
		if(dev_nanoprint)
			total_price += 99
			if(fabricate)
				fabricated_device.printer = new/obj/item/weapon/computer_hardware/printer(fabricated_device)
		if(dev_card)
			total_price += 199
			if(fabricate)
				fabricated_device.card_slot = new/obj/item/weapon/computer_hardware/card_slot(fabricated_device)
		if(dev_tesla)
			total_price += 399
			if(fabricate)
				fabricated_device.tesla_link = new/obj/item/weapon/computer_hardware/tesla_link(fabricated_device)
		if(dev_aislot)
			total_price += 499
			if(fabricate)
				fabricated_device.ai_slot = new/obj/item/weapon/computer_hardware/ai_slot(fabricated_device)
		return total_price
	return FALSE





/obj/machinery/lapvend/Topic(href, href_list)
	if(..())
		return TRUE

	if(href_list["pick_device"])
		if(state) // We've already picked a device type
			return FALSE
		devtype = text2num(href_list["pick_device"])
		state = 1
		fabricate_and_recalc_price(0)
		return TRUE
	if(href_list["clean_order"])
		reset_order()
		return TRUE
	if((state != 1) && devtype) // Following IFs should only be usable when in the Select Loadout mode
		return FALSE
	if(href_list["confirm_order"])
		state = 2 // Wait for ID swipe for payment processing
		fabricate_and_recalc_price(0)
		return TRUE
	if(href_list["hw_cpu"])
		dev_cpu = text2num(href_list["hw_cpu"])
		fabricate_and_recalc_price(0)
		return TRUE
	if(href_list["hw_battery"])
		dev_battery = text2num(href_list["hw_battery"])
		fabricate_and_recalc_price(0)
		return TRUE
	if(href_list["hw_disk"])
		dev_disk = text2num(href_list["hw_disk"])
		fabricate_and_recalc_price(0)
		return TRUE
	if(href_list["hw_netcard"])
		dev_netcard = text2num(href_list["hw_netcard"])
		fabricate_and_recalc_price(0)
		return TRUE
	if(href_list["hw_tesla"])
		dev_tesla = text2num(href_list["hw_tesla"])
		fabricate_and_recalc_price(0)
		return TRUE
	if(href_list["hw_nanoprint"])
		dev_nanoprint = text2num(href_list["hw_nanoprint"])
		fabricate_and_recalc_price(0)
		return TRUE
	if(href_list["hw_card"])
		dev_card = text2num(href_list["hw_card"])
		fabricate_and_recalc_price(0)
		return TRUE
	if(href_list["hw_aislot"])
		dev_aislot = text2num(href_list["hw_aislot"])
		fabricate_and_recalc_price(0)
		return TRUE
	return FALSE

/obj/machinery/lapvend/attack_hand(var/mob/user)
	ui_interact(user)

/obj/machinery/lapvend/ui_interact(mob/user, ui_key = "main", var/datum/nanoui/ui = null, var/force_open = NANOUI_FOCUS)
	if(stat & (BROKEN | NOPOWER | MAINT))
		if(ui)
			ui.close()
		return FALSE

	var/list/data[0]
	data["state"] = state
	if(state == 1)
		data["devtype"] = devtype
		data["hw_battery"] = dev_battery
		data["hw_disk"] = dev_disk
		data["hw_netcard"] = dev_netcard
		data["hw_tesla"] = dev_tesla
		data["hw_nanoprint"] = dev_nanoprint
		data["hw_card"] = dev_card
		data["hw_cpu"] = dev_cpu
		data["hw_aislot"] = dev_aislot
	if(state == 1 || state == 2)
		data["totalprice"] = total_price

	ui = SSnano.try_update_ui(user, src, ui_key, ui, data, force_open)
	if (!ui)
		ui = new(user, src, ui_key, "computer_fabricator.tmpl", "Personal Computer Vendor", 500, 400)
		ui.set_initial_data(data)
		ui.open()
		ui.set_auto_update(1)


obj/machinery/lapvend/attackby(obj/item/weapon/W as obj, mob/user as mob)
	if(inoperable())
		to_chat(user, SPAN_WARNING("[src] is not responding."))
		return
	var/obj/item/weapon/card/id/I = W.GetIdCard()
	// Awaiting payment state
	if(state == 2)
		if(process_payment(I,W))
			fabricate_and_recalc_price(1)
			if(fabricated_device)
				fabricated_device.forceMove(src.loc)
				fabricated_device.update_icon()
				fabricated_device.update_verbs()

				if(devtype == 1)
					fabricated_device.screen_on = 0
					fabricated_device.anchored = 0

				fabricated_device = null
			ping("Enjoy your new product!")
			state = 3
			return TRUE
		return FALSE
	return ..()


// Simplified payment processing, returns 1 on success.
/obj/machinery/lapvend/proc/process_payment(var/obj/item/weapon/card/id/I, var/obj/item/ID_container)
	if(I==ID_container || ID_container == null)
		visible_message("<span class='info'>\The [usr] swipes \the [I] through \the [src].</span>")
	else
		visible_message("<span class='info'>\The [usr] swipes \the [ID_container] through \the [src].</span>")
	var/datum/money_account/customer_account = get_account(I.associated_account_number)
	if (!customer_account || customer_account.suspended)
		ping("Connection error. Unable to connect to account.")
		return FALSE

	if(customer_account.security_level != 0) //If card requires pin authentication (ie seclevel 1 or 2)
		var/attempt_pin = input("Enter pin code", "Vendor transaction") as num
		customer_account = attempt_account_access(I.associated_account_number, attempt_pin, 2)

		if(!customer_account)
			ping("Unable to access account: incorrect credentials.")
			return FALSE

	if(total_price > customer_account.money)
		ping("Insufficient funds in account.")
		return FALSE
	else
		transaction_template.set_amount(-total_price)
		transaction_template.purpose = "Purchase of [(devtype == 1) ? "laptop computer" : "tablet microcomputer"]."
		return transaction_template.apply_to(customer_account)


/obj/machinery/slotmachine
	name = "slotmachine"
	desc = "Wasting your credits with style."
	icon = 'icons/obj/vending.dmi'
	icon_state = "slotmachine"
	density = 1
	anchored = 1.0
	var/spinning = 0
	var/bet = 0
	var/jackpot = 0
	var/plays = 0
	var/slots = list()
	var/icon_type
	use_power = IDLE_POWER_USE
	idle_power_usage = 10
	//var/list/fruits = list("Cherry","Apple","Blueberry","Bell","Watermelon","JACKPOT")

/obj/machinery/slotmachine/New()
	..()
	icon_type = initial(icon_state)
	power_change()

/obj/machinery/slotmachine/Initialize()
	. = ..()
	jackpot = rand(20000,50000);
	plays = rand(1,50)
	slots = list("1" = "Seven","2" = "Seven","3" = "Seven")
	update_icon()

/obj/machinery/slotmachine/power_change()
	..()
	if(stat & BROKEN)
		icon_state = "[icon_type]_broken"
	else
		if( !(stat & NOPOWER) )
			icon_state = icon_type
		else
			spawn(rand(0, 15))
				icon_state = "[icon_type]_off"

/obj/machinery/slotmachine/update_icon()
	overlays.Cut()
	//From left to right
	var/offset = -6
	var/image/img
	for(var/slot in slots)
		img = new/image(src.icon, "slot_[slots[slot]]")
		img.pixel_x += offset
		overlays += img
		offset += 6

/obj/machinery/slotmachine/proc/check_win()
	var/win_slot = null
	for(var/slot in slots)
		if(win_slot == null)
			win_slot = slots[slot]
		else if (win_slot != slots[slot])
			return 0
	return 1

/obj/machinery/slotmachine/attack_hand(mob/user as mob)
	if (spinning)
		to_chat(user, SPAN_WARNING("It is currently spinning."))
		return
	if (bet == 0)
		to_chat(user, SPAN_NOTICE("Today's jackpot: $[jackpot]. Insert 1-1000 Credits."))
	else
		spinning = 1
		plays++
		for(var/slot in slots)
			slots[slot] = "spin"
		update_icon()
		src.visible_message("<b>[name]</b> states, \"Your bet is $[bet]. Goodluck, buddy!\"")
		playsound(src.loc, 'sound/machines/click.ogg', 50, 1)
		icon_state = "[icon_type]_pull"
		update_icon()
		var/last_slot = null
		for(var/slot in slots)
			sleep(10)
			if(prob(plays) && (last_slot != null))
				plays = 0
				slots[slot] = last_slot
			else
				slots[slot] = pick("Seven", "Diamond", "Cherry","Bar","Lemon","Heart","Watermelon")
				last_slot = slots[slot]
			icon_state = "[icon_type]"
			update_icon()
			src.visible_message(SPAN_NOTICE("The reel stops at... \the [slots[slot]]!"))
			playsound(src.loc, 'sound/machines/ping.ogg', 50, 1)
		sleep(5)
		if (check_win())
			playsound(src.loc, 'sound/machines/ping.ogg', 50, 1)
			var/list/fruits = list("Diamond" = 10, "Heart" = 8, "Cherry" = 8,"Bar" = 6,"Lemon" = 4, "Watermelon" = 2, "Seven" = 1)
			var/prize = bet*fruits[slots["1"]]
			if (slots["1"] == "Seven")
				prize = jackpot
				jackpot = 0
				src.visible_message("<b>[name]</b> states, \"Damn son! JACKPOT!!! Congratulations!\"")
			else
				src.visible_message("<b>[name]</b> states, \"Congratulations! You won [prize] Credits!\"")
			spawn_money(prize,src.loc,user)
		else
			playsound(src.loc, 'sound/machines/buzz-sigh.ogg', 50, 1)
			src.visible_message("<b>[name]</b> states, \"Sorry, maybe, next time..\"")
			jackpot += bet

	src.add_fingerprint(user)
	update_icon()
	bet = 0
	spinning = 0

/obj/machinery/slotmachine/attackby(obj/item/S as obj, mob/user as mob)
	if (spinning)
		return
	if (istype(S, /obj/item/weapon/spacecash))
		var/obj/item/weapon/spacecash/cash = S
		if ((cash.worth > 0) && (cash.worth<=1000) && (bet + cash.worth <= 1000))
			to_chat(user, SPAN_NOTICE("You insert [cash.worth] Credits into [src]."))
			bet += cash.worth
			user.drop_from_inventory(cash)
			qdel(cash)
		else
			to_chat(user, SPAN_WARNING("You must bet 1-1000 Credits!"))
	else if (istype(S, /obj/item/weapon/coin))
		to_chat(user, SPAN_NOTICE("You add the [S.name] into the [src]. It will slightly increase chance to win."))
		user.drop_from_inventory(S)
		bet = 100
		plays = 45
		qdel(S)
	src.add_fingerprint(user)
	return