/* SmartFridge.  Much todo
*/
/obj/machinery/smartfridge
	name = "\improper SmartFridge"
	icon = 'icons/obj/vending.dmi'
	icon_state = "smartfridge"
	layer = BELOW_OBJ_LAYER
	density = 1
	anchored = 1
	use_power = IDLE_POWER_USE
	idle_power_usage = 5
	active_power_usage = 100
	reagent_flags = NO_REACT
	var/global/max_n_of_items = 999 // Sorry but the BYOND infinite loop detector doesn't look things over 1000.
	var/icon_on = "smartfridge"
	var/icon_off = "smartfridge-off"
	var/icon_panel = "smartfridge-panel"
	var/icon_fill10 = "smartfridge-fill10"
	var/icon_fill20 = "smartfridge-fill20"
	var/icon_fill30 = "smartfridge-fill30"
	var/seconds_electrified = 0
	var/shoot_inventory = 0
	var/locked = 0
	var/scan_id = 1
	var/is_secure = 0
	var/datum/wires/smartfridge/wires = null

	atmos_canpass = CANPASS_NEVER



/obj/machinery/smartfridge/secure
	name = "\improper Secure SmartFridge"
	is_secure = 1




/*******************
*   Seed Storage
********************/
/obj/machinery/smartfridge/seeds
	name = "\improper Refrigerated Seeds Storage"
	desc = "When you need seeds fast!"

/obj/machinery/smartfridge/seeds/accept_check(var/obj/item/O as obj)
	if(istype(O,/obj/item/seeds/))
		return 1
	return 0

/obj/machinery/smartfridge/kitchen
	name = "\improper Agro-Club Fridge"
	desc = "The panel says it won't allow anyone without access to the kitchen or hydroponics."
	req_one_access = list(access_hydroponics, access_kitchen)

/obj/machinery/smartfridge/kitchen/church
	name = "\improper Church Fridge"
	desc = "The panel says it won't allow anyone without access to the church."
	req_one_access = list(access_nt_disciple)

/obj/machinery/smartfridge/kitchen/church/public
	name = "\improper Public Church Fridge"
	desc = "The panel says anyone may take what they like."
	req_one_access = null


/*******************
*   Xenobio Slime Fridge
********************/
/obj/machinery/smartfridge/secure/extract
	name = "\improper slime extract SmartFridge"
	desc = "A refrigerated storage unit for slime extracts and potions."
	req_access = list(access_moebius)

/obj/machinery/smartfridge/secure/extract/accept_check(var/obj/item/O as obj)
	if(istype(O,/obj/item/slime_extract))
		return 1
	if(istype(O,/obj/item/slime_potion))
		return 1
	return 0



/*******************
*   Chemistry Medicine Storage
********************/
/obj/machinery/smartfridge/secure/medbay
	name = "\improper medicine SmartFridge"
	desc = "A refrigerated storage unit for storing medicine and chemicals."
	req_one_access = list(access_moebius,access_chemistry)

/obj/machinery/smartfridge/secure/medbay/accept_check(var/obj/item/O as obj)
	if(istype(O,/obj/item/reagent_containers/glass/))
		return 1
	if(istype(O,/obj/item/storage/pill_bottle/))
		return 1
	if(istype(O,/obj/item/reagent_containers/pill/))
		return 1
	return 0

/obj/machinery/smartfridge/chemistry
	name = "\improper chemical SmartFridge"
	desc = "A refrigerated storage unit for medicine and chemical storage."

/obj/machinery/smartfridge/chemistry/accept_check(var/obj/item/O as obj)
	if(istype(O,/obj/item/storage/pill_bottle) || istype(O,/obj/item/reagent_containers))
		return 1
	return 0

/*************************
*   Bar Drinks Showcase
**************************/
/obj/machinery/smartfridge/drinks
	name = "\improper drink showcase"
	desc = "A refrigerated storage unit for tasty tasty alcohol."
	icon_state = "showcase"
	icon_on = "showcase"
	icon_off = "showcase-off"
	icon_panel = "showcase-panel"
	var/icon_fill = "showcase-fill"
	density = FALSE // For placing atop tables as a proper storage, like on the old layout. - Seb

/obj/machinery/smartfridge/drinks/accept_check(var/obj/item/O as obj)
	if(istype(O,/obj/item/reagent_containers/glass) || istype(O,/obj/item/reagent_containers/food/drinks) || istype(O,/obj/item/reagent_containers/food/condiment))
		return 1

/obj/machinery/smartfridge/drinks/update_icon()
	cut_overlays()
	if(stat & (BROKEN|NOPOWER))
		icon_state = icon_off
	else
		icon_state = icon_on

	if(panel_open && icon_panel)
		add_overlay(image(icon, icon_panel))

	if(contents.len && !(stat & NOPOWER))
		add_overlay(image(icon, icon_fill))

/***************************
*   Hydroponics Drying Rack
****************************/
/obj/machinery/smartfridge/drying_rack
	name = "\improper drying rack"
	desc = "A machine for drying plants."
	icon_state = "drying_rack"
	icon_on = "drying_rack_on"
	icon_off = "drying_rack"
	use_power = NO_POWER_USE
	idle_power_usage = 0
	active_power_usage = 0
	var/drying_power = 0.1 //should take a bit but. why make people wait a lifetime to DRY PLANTS
	var/currently_drying = FALSE

/obj/machinery/smartfridge/drying_rack/accept_check(var/obj/item/O as obj)
	if(istype(O, /obj/item/reagent_containers/food/snacks/))
		var/obj/item/reagent_containers/food/snacks/S = O
		if (S.dried_type)
			return 1
	return 0

/obj/machinery/smartfridge/drying_rack/Process()
	..()
	if(inoperable())
		return
	if(contents.len)
		dry()

/obj/machinery/smartfridge/drying_rack/update_icon()
	cut_overlays()
	if(inoperable())
		icon_state = icon_off
	else
		icon_state = icon_on
	if(contents.len)
		add_overlay("drying_rack_filled")
		if(!inoperable() && currently_drying)
			add_overlay("drying_rack_drying")

/obj/machinery/smartfridge/drying_rack/proc/dry()
	var/drying_something = FALSE //While we're here, check if anything is undried and still processing
	for(var/obj/item/reagent_containers/food/snacks/S in contents)
		if(S.dry)
			continue
		S.dryness += drying_power
		if (S.dryness >= 1)
			if(S.dried_type == S.type || !S.dried_type)
				S.dry = 1
				S.name = "dried [S.name]"
				S.color = "#AAAAAA"
			else
				var/D = S.dried_type
				D = new D(src)
				if (istype(D, /obj/item/reagent_containers/food/snacks))
					var/obj/item/reagent_containers/food/snacks/SD = D
					SD.dry = TRUE //So we dont get stuck in an endless loop of drying, transforming and drying again
				qdel(S)
		else
			drying_something = TRUE

	if (drying_something != currently_drying)
		currently_drying = drying_something
		update_icon() //Only update the icon if we have to
	currently_drying = drying_something
	return


/*******************
*   Disk Storage
********************/
/obj/machinery/smartfridge/disk
	name = "\improper Disk Storage"
	desc = "For cataloging the tech you have acquired."
	idle_power_usage = 5
	active_power_usage = 5 //not a ''fridge'' just holds disk. Some lil lights to power and thats all.
	density = FALSE
	icon_state = "disktoaster" // Sprites by Jamini

/obj/machinery/smartfridge/disk/accept_check(var/obj/item/O as obj)
	if(istype(O,/obj/item/computer_hardware/hard_drive/portable))
		return 1
	return 0

/obj/machinery/smartfridge/disk/update_icon()
	cut_overlays()
	if(stat & (BROKEN|NOPOWER))
		icon_state = "disktoaster-off"
	else
		icon_state = "disktoaster"

	if(panel_open && icon_panel)
		add_overlay("disktoaster-panel")
	if(!icon_state)
		icon_state = "disktoaster"
	return icon_state

/obj/machinery/smartfridge/New()
	..()
	if(is_secure)
		wires = new/datum/wires/smartfridge/secure(src)
	else
		wires = new/datum/wires/smartfridge(src)

/obj/machinery/smartfridge/Destroy()
	qdel(wires)
	wires = null
	return ..()

/obj/machinery/smartfridge/proc/accept_check(var/obj/item/O as obj)
	if(istype(O,/obj/item/reagent_containers/food/snacks/grown/) || istype(O,/obj/item/seeds/) || istype(O,/obj/item/reagent_containers/food/snacks/meat/) || istype(O,/obj/item/reagent_containers/food/snacks/egg/ || istype(O,/obj/item/reagent_containers/food/snacks/chickenbreast)))
		return 1
	return 0


/obj/machinery/smartfridge/Process()
	if(stat & (BROKEN|NOPOWER))
		return
	if(src.seconds_electrified > 0)
		src.seconds_electrified--
	if(src.shoot_inventory && prob(2))
		src.throw_item()

/obj/machinery/smartfridge/power_change()
	var/old_stat = stat
	..()
	if(old_stat != stat)
		update_icon()

/obj/machinery/smartfridge/update_icon()
	cut_overlays()
	if(stat & (BROKEN|NOPOWER))
		icon_state = icon_off
	else
		icon_state = icon_on

	if(panel_open && icon_panel)
		add_overlay(image(icon, icon_panel))

	if(contents.len)
		if(contents.len <= 10)
			add_overlay(image(icon, icon_fill10))
		else if(contents.len <= 20)
			add_overlay(image(icon, icon_fill20))
		else
			add_overlay(image(icon, icon_fill30))

/*******************
*   Item Adding
********************/

/obj/machinery/smartfridge/attackby(var/obj/item/O as obj, var/mob/user as mob)
	if(istype(O, /obj/item/tool/screwdriver))
		panel_open = !panel_open
		user.visible_message("[user] [panel_open ? "opens" : "closes"] the maintenance panel of \the [src].", "You [panel_open ? "open" : "close"] the maintenance panel of \the [src].")
		update_icon()
		SStgui.update_uis(src)
		return

	if(istype(O, /obj/item/tool/multitool)||istype(O, /obj/item/tool/wirecutters))
		if(panel_open)
			attack_hand(user)
		return

	if(stat & NOPOWER)
		to_chat(user, SPAN_NOTICE("\The [src] is unpowered and useless."))
		return

	if(accept_check(O))
		if(contents.len >= max_n_of_items)
			to_chat(user, SPAN_NOTICE("\The [src] is full."))
			return 1
		else
			user.remove_from_mob(O)
			O.forceMove(src)
			user.visible_message(SPAN_NOTICE("[user] has added \the [O] to \the [src]."), SPAN_NOTICE("You add \the [O] to \the [src]."))
			update_icon()
			SStgui.update_uis(src)

	else if(istype(O, /obj/item/storage/bag))
		var/obj/item/storage/bag/P = O
		var/plants_loaded = 0
		for(var/obj/G in P.contents)
			if(accept_check(G))
				if(contents.len >= max_n_of_items)
					to_chat(user, SPAN_NOTICE("\The [src] is full."))
					return 1
				else
					P.remove_from_storage(G,src)
					plants_loaded++
		P.refresh_all()
		if(plants_loaded)
			update_icon()
			user.visible_message(SPAN_NOTICE("[user] loads \the [src] with \the [P]."), SPAN_NOTICE("You load \the [src] with \the [P]."))
			if(P.contents.len > 0)
				to_chat(user, SPAN_NOTICE("Some items are refused."))

		SStgui.update_uis(src)

	else
		to_chat(user, SPAN_NOTICE("\The [src] smartly refuses [O]."))
		return 1

/obj/machinery/smartfridge/secure/emag_act(var/remaining_charges, var/mob/user)
	if(!emagged)
		emagged = 1
		to_chat(user, "You short out the product lock on [src].")
		return 1

/obj/machinery/smartfridge/attack_hand(mob/user as mob)
	if(stat & (NOPOWER|BROKEN))
		return
	wires.Interact(user)
	ui_interact(user)

/*******************
*   SmartFridge Menu
********************/
/obj/machinery/smartfridge/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "Smartfridge", name)
		ui.open()

/obj/machinery/smartfridge/ui_data(mob/user)
	var/list/data = list()

	data["emagged"] = emagged
	data["secure"] = is_secure
	data["allowed"] = allowed(user)

	var/list/items = list()

	for(var/obj/item/I in src)
		// TODO: If we have smart fridges use component_parts, uncomment this
		// if(item in component_parts)
		// 	continue

		if(!QDELETED(I))
			if(items[I.name])
				items[I.name]++
			else
				items[I.name] = 1

	data["items"] = items

	return data

/obj/machinery/smartfridge/ui_act(action, list/params, datum/tgui/ui, datum/ui_state/state)
	. = ..()
	if(.)
		return

	if(is_secure)
		if(!allowed(usr) && !emagged)
			to_chat(usr, SPAN_WARNING("Access denied."))
			return TRUE

	switch(action)
		if("vend")
			var/count = text2num(params["count"])

			for(var/obj/item/I in src)
				if(count <= 0)
					break

				if(format_text(I.name) == format_text(params["name"]))
					// TODO: If we have smart fridges use component_parts, uncomment this
					// if(dispensed_item in component_parts)
					// 	CRASH("Attempted removal of [dispensed_item] component_part from smartfridge via smartfridge interface.")
					I.forceMove(drop_location())
					count--

			update_icon()
			playsound(loc, 'sound/machines/vending_drop.ogg', 100, 1)
			. = TRUE

/obj/machinery/smartfridge/throw_item()
	var/obj/throw_item = null
	var/mob/living/target = locate() in view(7,src)
	if(!target)
		return 0

	for(var/obj/item/I in src)
		// TODO: If we have smart fridges use component_parts, uncomment this
		// if(item in component_parts)
		// 	continue
		I.forceMove(drop_location())
		throw_item = I
		break

	if(!throw_item)
		return 0

	spawn(0)
		throw_item.throw_at(target, 16, 3, src)

	visible_message(SPAN_WARNING("[src] launches [throw_item] at [target]!"))
	return 1
