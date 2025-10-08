/obj/item/device/transfer_valve
	name = "tank transfer valve"
	desc = "Regulates the transfer of air between two tanks"
	icon = 'icons/obj/assemblies.dmi'
	icon_state = "valve_1"
	var/obj/item/tank/tank_one
	var/obj/item/tank/tank_two
	var/obj/item/device/attached_device
	var/mob/attacher = null
	var/valve_open = 0
	var/toggle = 1
	flags = PROXMOVE

	// #TODO-ISKHOD: Probably add the assembly holders to this, as referenced on line 42, which will properly solve the runtime
	var/obj/item/device/assembly/left_assembly = null
	var/obj/item/device/assembly/right_assembly = null

/obj/item/device/transfer_valve/proc/process_activation(var/obj/item/device/D)

/obj/item/device/transfer_valve/attackby(obj/item/item, mob/user)
	var/turf/location = get_turf(src) // For admin logs
	if(istype(item, /obj/item/tank))
		if(tank_one && tank_two)
			to_chat(user, SPAN_WARNING("There are already two tanks attached, remove one first."))
			return

		if(!tank_one)
			tank_one = item
			user.drop_item()
			item.loc = src
			to_chat(user, SPAN_NOTICE("You attach the tank to the transfer valve."))
		else if(!tank_two)
			tank_two = item
			user.drop_item()
			item.loc = src
			to_chat(user, SPAN_NOTICE("You attach the tank to the transfer valve."))
			message_admins("[key_name_admin(user)] attached both tanks to a transfer valve. (<A HREF='?_src_=holder;adminplayerobservecoodjump=1;X=[location.x];Y=[location.y];Z=[location.z]'>JMP</a>)")
			log_game("[key_name_admin(user)] attached both tanks to a transfer valve.")

		update_icon()
		SSnano.update_uis(src) // update all UIs attached to src
//TODO: Have this take an assemblyholder
	else if(is_assembly(item))
		var/obj/item/device/assembly/A = item
		if(A.secured)
			to_chat(user, SPAN_NOTICE("The device is secured."))
			return
		if(attached_device)
			to_chat(user, SPAN_WARNING("There is already an device attached to the valve, remove it first."))
			return
		user.remove_from_mob(item)
		attached_device = A
		A.loc = src
		to_chat(user, SPAN_NOTICE("You attach the [item] to the valve controls and secure it."))
		A.holder = src
		A.toggle_secure()	//this calls update_icon(), which calls update_icon() on the holder (i.e. the bomb).

		bombers += "[key_name(user)] attached a [item] to a transfer valve."
		message_admins("[key_name_admin(user)] attached a [item] to a transfer valve. (<A HREF='?_src_=holder;adminplayerobservecoodjump=1;X=[location.x];Y=[location.y];Z=[location.z]'>JMP</a>)")
		log_game("[key_name_admin(user)] attached a [item] to a transfer valve.")
		attacher = user
		SSnano.update_uis(src) // update all UIs attached to src
	return


/obj/item/device/transfer_valve/HasProximity(atom/movable/AM as mob|obj)
	if(!attached_device)	return
	attached_device.HasProximity(AM)
	return


/obj/item/device/transfer_valve/attack_self(mob/user as mob)
	nano_ui_interact(user)

/obj/item/device/transfer_valve/nano_ui_interact(mob/user, ui_key = "main", var/datum/nanoui/ui = null, var/force_open = NANOUI_FOCUS)

	// this is the data which will be sent to the ui
	var/data[0]
	data["attachmentOne"] = tank_one ? tank_one.name : null
	data["attachmentTwo"] = tank_two ? tank_two.name : null
	data["valveAttachment"] = attached_device ? attached_device.name : null
	data["valveOpen"] = valve_open ? 1 : 0

	// update the ui if it exists, returns null if no ui is passed/found
	ui = SSnano.try_update_ui(user, src, ui_key, ui, data, force_open)
	if (!ui)
		// the ui does not exist, so we'll create a new() one
        // for a list of parameters and their descriptions see the code docs in \code\modules\nano\nanoui.dm
		ui = new(user, src, ui_key, "transfer_valve.tmpl", "Tank Transfer Valve", 460, 280)
		// when the ui is first opened this is the data it will use
		ui.set_initial_data(data)
		// open the new ui window
		ui.open()
		// auto update every Master Controller tick
		//ui.set_auto_update(1)

/obj/item/device/transfer_valve/Topic(href, href_list)
	..()
	if ( usr.stat || usr.restrained() )
		return 0
	if (src.loc != usr)
		return 0
	if(tank_one && href_list["tankone"])
		remove_tank(tank_one)
	else if(tank_two && href_list["tanktwo"])
		remove_tank(tank_two)
	else if(href_list["open"])
		toggle_valve()
	else if(attached_device)
		if(href_list["rem_device"])
			attached_device.loc = get_turf(src)
			attached_device:holder = null
			attached_device = null
			update_icon()
		if(href_list["device"])
			attached_device.attack_self(usr)
	src.add_fingerprint(usr)
	return 1 // Returning 1 sends an update to attached UIs

/obj/item/device/transfer_valve/process_activation(var/obj/item/device/D)
	if(toggle)
		toggle = 0
		toggle_valve()
		spawn(50) // To stop a signal being spammed from a proxy sensor constantly going off or whatever
			toggle = 1

/obj/item/device/transfer_valve/update_icon()
	cut_overlays()
	underlays = null

	if(!tank_one && !tank_two && !attached_device)
		icon_state = "valve_1"
		return
	icon_state = "valve"

	if(tank_one)
		add_overlay("[tank_one.icon_state]")
	if(tank_two)
		var/icon/J = new(icon, icon_state = "[tank_two.icon_state]")
		J.Shift(WEST, 13)
		underlays += J
	if(attached_device)
		add_overlay("device")

/obj/item/device/transfer_valve/proc/remove_tank(obj/item/tank/T)
	if(tank_one == T)
		split_gases()
		tank_one = null
	else if(tank_two == T)
		split_gases()
		tank_two = null
	else
		return

	T.loc = get_turf(src)
	update_icon()

/obj/item/device/transfer_valve/proc/merge_gases()
	if(valve_open)
		return
	check_ttv_explosion()
	valve_open = 1

/obj/item/device/transfer_valve/proc/split_gases()
	if(!valve_open)
		return

	valve_open = 0

	if(QDELETED(tank_one) || QDELETED(tank_two))
		return

	var/ratio1 = tank_one.air_contents.volume/tank_two.air_contents.volume
	var/datum/gas_mixture/temp
	temp = tank_two.air_contents.remove_ratio(ratio1)
	tank_one.air_contents.merge(temp)
	tank_two.air_contents.volume -=  tank_one.air_contents.volume


	/*
	Exadv1: I know this isn't how it's going to work, but this was just to check
	it explodes properly when it gets a signal (and it does).
	*/

/obj/item/device/transfer_valve/proc/toggle_valve()
	if(!valve_open && (tank_one && tank_two))
		var/turf/bombturf = get_turf(src)
		var/area/A = get_area(bombturf)

		var/attacher_name = ""
		if(!attacher)
			attacher_name = "Unknown"
		else
			attacher_name = "[attacher.name]([attacher.ckey])"

		var/log_str = "Bomb valve opened in <A HREF='?_src_=holder;adminplayerobservecoodjump=1;X=[bombturf.x];Y=[bombturf.y];Z=[bombturf.z]'>[A.name]</a> "
		log_str += "with [attached_device ? attached_device : "no device"] attacher: [attacher_name]"

		if(attacher)
			log_str += "(<A HREF='?_src_=holder;adminmoreinfo=\ref[attacher]'>?</A>)"

		var/mob/mob = get_mob_by_key(src.fingerprintslast)
		var/last_touch_info = ""
		if(mob)
			last_touch_info = "(<A HREF='?_src_=holder;adminmoreinfo=\ref[mob]'>?</A>)"

		log_str += " Last touched by: [src.fingerprintslast][last_touch_info]"
		bombers += log_str
		message_admins(log_str, 0, 1)
		log_game(log_str)
		merge_gases()

	else if(valve_open==1 && (tank_one && tank_two))
		split_gases()

	src.update_icon()

// Check for TTV explosion using traditional fuel_moles formula with pressure scaling
// The gases have already been merged at this point
/obj/item/device/transfer_valve/proc/check_ttv_explosion()
	if(!tank_two || !tank_two.air_contents)
		return

	// React the gases multiple times to simulate combustion and build up pressure/temperature
	// This is what makes plasma + oxygen explode
	tank_two.air_contents.react()
	tank_two.air_contents.react()
	tank_two.air_contents.react()

	// Calculate fuel_moles using the traditional formula: plasma + oxygen/6
	var/fuel_moles = tank_two.air_contents.gas["plasma"] + tank_two.air_contents.gas["oxygen"] / 6
	var/strength = 1

	// Calculate total pressure in kPa after reactions
	var/total_pressure_kpa = tank_two.air_contents.return_pressure() / 101.325

	// Apply pressure-based scaling factor to match empirical data
	// Tuned to match the target chart: 400kPa→10, 500→17, 600→21, 700→25, 800→31, 900→35
	var/pressure_multiplier = 1.0
	if(total_pressure_kpa >= 400)  // Only scale for pressures that would cause explosions
		// Linear scaling: 400 kPa = 10x, 900 kPa = 14x
		pressure_multiplier = 10.0 + ((total_pressure_kpa - 400) / 500) * 4.0
		pressure_multiplier = min(pressure_multiplier, 14.0)  // Cap at 14x
	
	var/turf/ground_zero = get_turf(src)
	
	// Use temperature tiers like assembly bombs, but with pressure multiplier
	if(tank_two.air_contents.temperature > (T0C + 400))
		strength = (fuel_moles/15) * pressure_multiplier

		if(strength >= 1)
			explosion(ground_zero, round(strength,1), round(strength*2,1), round(strength*3,1), round(strength*4,1))
		else if(strength >= 0.5)
			explosion(ground_zero, 0, 1, 2, 4)
		else if(strength >= 0.2)
			explosion(ground_zero, 0, 0, 1, 2)
		else
			// Too weak to explode
			qdel(src)
			return

	else if(tank_two.air_contents.temperature > (T0C + 250))
		strength = (fuel_moles/20) * pressure_multiplier

		if(strength >= 1)
			explosion(ground_zero, 0, round(strength,1), round(strength*2,1), round(strength*3,1))
		else if(strength >= 0.5)
			explosion(ground_zero, 0, 0, 1, 2)
		else
			// Too weak to explode
			qdel(src)
			return

	else if(tank_two.air_contents.temperature > (T0C + 100))
		strength = (fuel_moles/25) * pressure_multiplier

		if(strength >= 1)
			explosion(ground_zero, 0, 0, round(strength,1), round(strength*3,1))
		else
			// Too weak to explode
			qdel(src)
			return
	else
		// Too cold to explode
		qdel(src)
		return

	// If we got here, we exploded - clean up and log
	qdel(src)
	message_admins("A TTV explosion has occurred! last key to touch the tank was [src.fingerprintslast].")
	log_game("A TTV explosion has occurred! last key to touch the tank was [src.fingerprintslast].")

// this doesn't do anything but the timer etc. expects it to be here
/obj/item/device/transfer_valve/proc/c_state()
	return
