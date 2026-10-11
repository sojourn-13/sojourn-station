/*
o = tanker
b = blueprinter
i = inputer
p = printer

o p b
  i


*/
//parrent to have vars
/obj/structure/os_assemly
	name = "Greyson Positronic mechine frame"
	desc = "A frame for GP mechines without proper instuctions for its self replication."

	icon = 'icons/obj/machines/one_star/machines.dmi'
	icon_state = "osframe" // sprite by Infrared Baron

	layer = BELOW_OBJ_LAYER
	anchored = 1
	density = 1
	var/moveable = 1

/obj/structure/os_assemly/attackby(obj/item/I, mob/user)
	var/tool_type = I.get_tool_type(user, list(QUALITY_BOLT_TURNING), src)
	switch(tool_type)
		if(QUALITY_BOLT_TURNING)
			if(!moveable)
				to_chat(user, SPAN_NOTICE("[src] is unable to be moved and still function."))
				return
			if(I.use_tool(user, src, WORKTIME_NORMAL, tool_type, FAILCHANCE_VERY_EASY, required_stat = STAT_MEC))
				to_chat(user, SPAN_NOTICE("You [anchored? "un" : ""]secured \the [src]!"))
				anchored = !anchored
				update_connector(user)
				update_icon()
			return
	..()

/obj/structure/os_assemly/proc/update_connector()
	return

//The tanker

/obj/structure/os_assemly/tanker
	name = "Greyson Positronic Slurry Tanker"
	desc = "A tank of liquid nanites, metals and heaten for flash printing, used for 3d printers. Can't be refilled."
	icon_state = "liquid_tank"

	var/slurry = 100
	var/connect_to_printer

/obj/structure/os_assemly/tanker/examine(mob/user)
	..()
	to_chat(user, SPAN_NOTICE("A small display on the side reads [slurry]."))

/obj/structure/os_assemly/tanker/Initialize()
	..()
	slurry = rand(0, 300)
	update_icon()

/obj/structure/os_assemly/tanker/Destroy()
	connect_to_printer = null
	..()

/obj/structure/os_assemly/tanker/update_connector(mob/user)
	if(connect_to_printer)
		connect_to_printer = null
		return
	if(!anchored)
		return

	var/turf/T = get_step(src, EAST)

	if(T)
		for(var/obj/structure/os_assemly/printer/P in T.contents)
			if(P)
				if(!P.anchored)
					to_chat(user, SPAN_NOTICE("The [src] will not connect to a unsecured [P.name] it seems."))
					return
				icon_state = "liquid_tank_active"
				to_chat(user, SPAN_NOTICE("The [src] automatically connects to [P.name] after a slight tap."))
				connect_to_printer = P
				P.connected_tanker = src

		if(!connect_to_printer)
			to_chat(user, SPAN_NOTICE("The [src] can not to connect to anything."))

		return
	to_chat(user, SPAN_NOTICE("Nothing to connect to."))



/obj/structure/os_assemly/tanker/update_icon()
	..()

	icon_state = "liquid_tank"

	if(connect_to_printer)
		icon_state = "liquid_tank_active"

	if(slurry <= 0)
		icon_state = "liquid_tank_unuseable"


/obj/structure/os_assemly/tanker/attack_hand(mob/user)
	..()

	if(slurry <= 0)
		to_chat(user, SPAN_NOTICE("The [src]'s handle refuses to turn."))
	else
		update_connector(user)


//Printer

/obj/structure/os_assemly/printer
	name = "Greyson Positronic Flash Printer"
	desc = "An advanced printer that connects to a tanker and inputer."
	var/obj/structure/os_assemly/tanker/connected_tanker
	icon_state = "os_autolathe"
	var/money = 0
	var/handleing_fees = 25

/obj/structure/os_assemly/printer/Destroy()
	connected_tanker = null
	..()

/obj/structure/os_assemly/printer/Initialize()
	..()
	money = rand(0, 60)
	handleing_fees = rand(20, 30)

/obj/structure/os_assemly/printer/attackby(obj/item/I, mob/user)
	..()
	if(istype(I, /obj/item/stack/os_cash))
		var/obj/item/stack/os_cash/yuan = I
		var/coins_to_add = input("How many coins?", "Yuan Coin Slot") as num | null
		if(coins_to_add > yuan.amount)
			to_chat(user, SPAN_NOTICE("You dont have that many coins."))
			return
		if(0 > coins_to_add)
			to_chat(user, SPAN_NOTICE("The [src] seems to not give refunds."))
			return

		if(0 == coins_to_add)
			to_chat(user, SPAN_NOTICE("You deside not to slide a coin into the slot."))
			return

		yuan.amount -= coins_to_add
		money += coins_to_add

		if(yuan.amount <= 0)
			usr.drop_from_inventory(yuan)
			qdel(yuan)
		to_chat(user, SPAN_NOTICE("After sliding a coin into the slot makes the [src]'s main console blink and lights flash for a moment."))

/obj/structure/os_assemly/printer/examine(mob/user)
	..()
	var/blueprints = FALSE
	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		if(istype(user.l_hand , /obj/item/oddity/common/blueprint) ||istype(user.r_hand , /obj/item/oddity/common/blueprint) || H.stats.getPerk(PERK_NO_OBFUSCATION))
			blueprints = TRUE

	if(blueprints)
		to_chat(user, SPAN_NOTICE("This unit's fee is [handleing_fees] current balance is [money]."))
		to_chat(user, SPAN_NOTICE("A small slot on the side can be fed in Yaun for printing."))
	else
		to_chat(user, SPAN_NOTICE("A small box showing the number [handleing_fees] flashes above the number [money] next to a coin slot."))

/obj/structure/os_assemly/printer/proc/print_item(item_to_print, slurry_needed)
	if(!connected_tanker || !item_to_print)
		return
	connected_tanker.slurry -= slurry_needed
	connected_tanker.update_icon()
	money -= handleing_fees

	icon_state = "os_autolathe_active"
	sleep(3)
	icon_state = "os_autolathe"

	switch(item_to_print)
		if("matter bin")
			new /obj/item/stock_parts/matter_bin/one_star/advanced(src.loc)
		if("micro laser")
			new /obj/item/stock_parts/micro_laser/one_star/advanced(src.loc)
		if("scanning module")
			new /obj/item/stock_parts/scanning_module/one_star/advanced(src.loc)
		if("manipulator")
			new /obj/item/stock_parts/manipulator/one_star/advanced(src.loc)
		if("capacitor")
			new /obj/item/stock_parts/capacitor/one_star/advanced(src.loc)

/obj/structure/os_assemly/printer/proc/print_attempt(item_to_print, slurry_needed, mob/user)
	var/error_sheet = FALSE
	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		if(istype(user.l_hand , /obj/item/oddity/common/blueprint) ||istype(user.r_hand , /obj/item/oddity/common/blueprint) || H.stats.getPerk(PERK_NO_OBFUSCATION))
			error_sheet = TRUE

	if(!connected_tanker)
		to_chat(user, SPAN_NOTICE("The console flashes an error, T-503."))

		if(error_sheet)
			to_chat(user, SPAN_NOTICE("T-503: Missing tanker, or not connected, or not on west side of [src]."))

		return FALSE

	if(0 >= connected_tanker.slurry || slurry_needed > connected_tanker.slurry)
		to_chat(user, SPAN_NOTICE("The console flashes an error, T-404."))

		if(error_sheet)
			to_chat(user, SPAN_NOTICE("T-404: Tanker Connected, missing required resources for printing inside Connected Tanker."))

		return FALSE

	if(money < handleing_fees) //Charge per use
		to_chat(user, SPAN_NOTICE("The console flashes an error, P-404."))

		if(error_sheet)
			to_chat(user, SPAN_NOTICE("P-404: Printer missing required Yuan to operate."))

		return FALSE

	if(!item_to_print || item_to_print == "error")

		to_chat(user, SPAN_NOTICE("The console flashes an error, B-400."))

		if(error_sheet)
			to_chat(user, SPAN_NOTICE("B-400: Invailed Blueprint Request."))

		return FALSE

	var/turf/T = get_step(src, EAST)

	for(var/obj/structure/os_assemly/blueprinter/B in T.contents)

		if(B.prints_left <= 0)
			to_chat(user, SPAN_NOTICE("The console flashes an error, B-410."))

			if(error_sheet)
				to_chat(user, SPAN_NOTICE("B-410: Blueprinter has index pointers are Gone. \
				Add at most 30 Yaun to the Blueprinter to gain an additional index pointer."))

			return FALSE

	return TRUE

/obj/structure/os_assemly/inputer
	name = "Greyson Positronic Printer Inputer"
	desc = "Repaired or untouched by time, a working Greyson Positronic inteneral console, only used for interfacing with Flash Printers."
	moveable = FALSE
	icon_state = "os_console_interface"

/obj/structure/os_assemly/inputer/attack_hand(mob/user)
	..()

	//Hint to use a blueprint oddity on it.
	to_chat(user, SPAN_NOTICE("A small notice flashes stating that to operate this console you must scan a Greyson Positronic logo. \
	The console runs through a debug mode shortly after"))

	var/turf/T = get_step(src, NORTH)

	if(T)
		var/printer_found = FALSE
		var/blueprinter_found = FALSE
		for(var/obj/structure/os_assemly/printer/P in T.contents)
			var/turf/secondt = get_step(P, EAST)
			printer_found = TRUE

			if(!P.anchored)
				to_chat(user, SPAN_NOTICE("The [src] will not be able to detect a unsecured [P.name] it seems."))
				return

			for(var/obj/structure/os_assemly/blueprinter/B in secondt.contents)
				printer_found = TRUE

				if(!B.anchored)
					to_chat(user, SPAN_NOTICE("The [src] can't detect a unsecured [B.name] it seems."))
					return

				if(P.print_attempt(B.blueprint, B.cost, user))
					to_chat(user, SPAN_NOTICE("The console's screen shows no errors."))

		if(!printer_found)
			to_chat(user, SPAN_NOTICE("A small error notice stating no printer detected north of console."))
			return
		if(!blueprinter_found)
			to_chat(user, SPAN_NOTICE("A small error notice stating no data unit detected north east of console."))
			return

	to_chat(user, SPAN_NOTICE("A small error notice stating nothing is detected north of console."))

/obj/structure/os_assemly/inputer/attackby(obj/item/I, mob/user)
	..()

	if(istype(I, /obj/item/oddity/common/blueprint))
		var/turf/T = get_step(src, NORTH)

		if(T)
			var/printer_found = FALSE
			var/blueprinter_found = FALSE
			for(var/obj/structure/os_assemly/printer/P in T.contents)
				var/turf/secondt = get_step(P, EAST)
				printer_found = TRUE

				if(!P.anchored)
					to_chat(user, SPAN_NOTICE("The [src] will not be able to detect a unsecured [P.name] it seems."))
					return

				for(var/obj/structure/os_assemly/blueprinter/B in secondt.contents)
					blueprinter_found = TRUE
					if(P.print_attempt(B.blueprint, B.cost, user))
						if(!B.anchored)
							to_chat(user, SPAN_NOTICE("The [src] can't detect a unsecured [B.name] it seems."))
							return

						P.print_item(B.blueprint, B.cost)
						B.prints_left -= 1
						B.update_icon()

			if(!blueprinter_found)
				to_chat(user, SPAN_NOTICE("A small error notice stating no data unit detected north east of console."))

			if(!printer_found)
				to_chat(user, SPAN_NOTICE("A small error notice stating no printer detected north of console."))
		return


/obj/structure/os_assemly/blueprinter
	name = "Greyson Positronic Data Racker"
	desc = "Repaired or untouched by time, a working Greyson Positronic data rack holding a few designs for Flash Printers."
	var/blueprint = "error" //this is what we print, has a hard list
	var/cost = 999 //How much sluge we need to print said items
	var/prints_left = 3 //How many times this blueprinter is allowed to print before turning off
	icon_state = "os-data_active"
	var/money_spent = 0 //Used for rerolls

/obj/structure/os_assemly/blueprinter/Initialize()
	..()
	cycle_blueprints()
	prints_left = rand(0, 6)
	update_icon()

/obj/structure/os_assemly/blueprinter/update_icon()
	..()

	icon_state = "os-data_active"

	if(prints_left)
		if(prints_left >= 1)
			icon_state = "os-data_1_active"
		if(prints_left >= 2)
			icon_state = "os-data_2_active"
		if(prints_left >= 3)
			icon_state = "os-data_3_active"

	if(prints_left <= 0)
		icon_state = "os-data_unuseable"


/obj/structure/os_assemly/blueprinter/proc/cycle_blueprints(mob/user)
	var/old_print = blueprint
	var/list/blueprints_to_pick = list("matter bin", "micro laser", "scanning module", "manipulator", "capacitor")
	blueprint = pick_n_take(blueprints_to_pick)
	if(blueprint == old_print)
		blueprint = pick_n_take(blueprints_to_pick)

	switch(blueprint)
		if("matter bin")
			cost = 15
		if("micro laser")
			cost = 20
		if("scanning module")
			cost = 5
		if("manipulator")
			cost = 25
		if("capacitor")
			cost = 25

	if(money_spent > 30)
		prints_left += 1
		money_spent -= 30
		to_chat(user, SPAN_NOTICE("The [src] plinks and stutters a moment as it tabulates."))
		update_icon()

/obj/structure/os_assemly/blueprinter/examine(mob/user)
	..()
	var/blueprints = FALSE
	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		if(istype(user.l_hand , /obj/item/oddity/common/blueprint) ||istype(user.r_hand , /obj/item/oddity/common/blueprint) || H.stats.getPerk(PERK_NO_OBFUSCATION))
			blueprints = TRUE

	if(blueprints)
		to_chat(user, SPAN_NOTICE("The blueprint selected for flash printing is [blueprint]."))
		to_chat(user, SPAN_NOTICE("The blueprint selected needs [cost] for each item printed."))
		to_chat(user, SPAN_NOTICE("This can only print [prints_left] before automatically wiping all data inside the unit."))
		to_chat(user, SPAN_NOTICE("A small slot on the side can be fed in Yaun to cycle blueprints."))
	else
		to_chat(user, SPAN_NOTICE("On the side of the [src] there is a small slot for coins."))

/obj/structure/os_assemly/blueprinter/attackby(obj/item/I, mob/user)
	..()
	if(istype(I, /obj/item/stack/os_cash))
		var/obj/item/stack/os_cash/yuan = I
		yuan.amount -= 1
		if(yuan.amount <= 0)
			usr.drop_from_inventory(yuan)
			qdel(yuan)
		to_chat(user, SPAN_NOTICE("After sliding a coin into the slot makes the [src]'s main console blink and lights flash for a moment."))
		cycle_blueprints()
