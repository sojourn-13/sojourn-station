/obj/machinery/power/am_control_unit
	name = "antimatter control unit"
	desc = "This device injects antimatter into connected shielding units, the more antimatter injected the more power produced.  Wrench the device to set it up."
	icon = 'icons/obj/machines/antimatter.dmi'
	icon_state = "control"
	anchored = FALSE
	density = TRUE
	use_power = IDLE_POWER_USE
	idle_power_usage = 100
	active_power_usage = 1000

	var/list/obj/machinery/am_shielding/linked_shielding
	var/list/obj/machinery/am_shielding/linked_cores
	var/obj/item/am_containment/fueljar
	var/update_shield_icons = 0
	var/stability = 100
	var/exploding = FALSE
	var/list/explosion_strength = list(8, 12, 18, 12)

	var/active = FALSE//On or not
	var/fuel_injection = 2//How much fuel to inject
	var/shield_icon_delay = FALSE//delays resetting for a short time
	var/reported_core_efficiency = 0

	var/power_cycle = 0
	var/power_cycle_delay = 4//How many ticks till produce_power is called
	var/stored_core_stability = 0
	var/stored_core_stability_delay = FALSE

	var/stored_power = 0//Power to deploy per tick

	var/obj/item/device/radio/radio
	var/announce_stability = TRUE

/obj/machinery/power/am_control_unit/New()
	..()
	linked_shielding = list()
	linked_cores = list()
	radio = new /obj/item/device/radio{channels=list("Engineering", "Command")}(src)

/obj/machinery/power/am_control_unit/Destroy() //Perhaps damage and run stability checks rather than just qdel on the others
	for(var/obj/machinery/am_shielding/AMS in linked_shielding)
		qdel(AMS)
	. = ..()

/obj/machinery/power/am_control_unit/Process()
	if(exploding)
		explosion(get_turf(src), explosion_strength[1], explosion_strength[2], explosion_strength[3], explosion_strength[4])
		if(src)
			qdel(src)

	if(update_shield_icons && !shield_icon_delay)
		check_shield_icons()
		update_shield_icons = 0

	if(stat & (NOPOWER|BROKEN) || !active) // Can update the icons even without power
		return

	if(!fueljar)//No fuel but we are on, shutdown
		toggle_power()
		playsound(src.loc, 'sound/machines/buzz-two.ogg', 50, 0)
		return

	add_avail(stored_power)

	power_cycle++
	if(power_cycle >= power_cycle_delay)
		produce_power()
		power_cycle = 0

	return

/obj/machinery/power/am_control_unit/proc/produce_power()
	playsound(src.loc, 'sound/effects/magnetclamp.ogg', 25, 1)
	var/core_power = reported_core_efficiency //Effectively how much fuel we can safely deal with
	if(core_power <= 0)
		return 0 //Something is wrong
	var/core_damage = 0
	var/fuel = fueljar.usefuel(fuel_injection)

	stored_power = fuel * 300000 // 300 kW per unit of fuel injected, or 600 kW per Core
	stored_power *= 100 / stored_core_stability // Produce progressively more power the more unstable the engine is.
	//Now check if the cores could deal with it safely, this is done after so you can overload for more power if needed, still a bad idea
	if(fuel > (2 * core_power))//More fuel has been put in than the current cores can deal with
		if(prob(50))
			core_damage = 1//Small chance of damage
		if((fuel - 2 * core_power) > 5)
			core_damage = 5//Now its really starting to overload the cores
		if((fuel - 2 * core_power) > 10)
			core_damage = 20//Welp now you did it, they wont stand much of this
		if(core_damage == 0)
			return
		for(var/obj/machinery/am_shielding/AMS in linked_cores)
			AMS.stability -= core_damage
			AMS.check_stability(TRUE)
		playsound(src.loc, 'sound/effects/bang.ogg', 50, 1)
	check_stability()
	return


/obj/machinery/power/am_control_unit/emp_act(severity)
	switch(severity)
		if(1)
			if(active)	toggle_power()
			stability -= rand(15,30)
		if(2)
			if(active)	toggle_power()
			stability -= rand(10,20)
	..()
	return 0

/obj/machinery/power/am_control_unit/ex_act(severity, target)
	switch(severity)
		if(1.0)
			stability -= 60
		if(2.0)
			stability -= 40
		if(3.0)
			stability -= 20
	check_stability()
	return

/obj/machinery/power/am_control_unit/bullet_act(var/obj/item/projectile/Proj)
	if (!(Proj.testing))
		if(Proj.check_armour != ARMOR_BULLET)
			stability -= Proj.force
	return FALSE

/obj/machinery/power/am_control_unit/power_change()
	..()
	if(stat & NOPOWER && active)
		toggle_power()
	return

/obj/machinery/power/am_control_unit/update_icon()
	if(active)
		icon_state = "control_on"
	else
		icon_state = "control"
	//No other icons for it atm

/obj/machinery/power/am_control_unit/attackby(obj/item/I, mob/user, params)
	if(QUALITY_BOLT_TURNING in I.tool_qualities)
		if(anchored || linked_shielding.len)
			to_chat(user, "\red Once bolted and linked to a shielding unit it the [src.name] is unable to be moved! However a pulsing tool might make the whole construction fall apart safely and easily.")
		if(I.use_tool(user, src, WORKTIME_FAST, QUALITY_BOLT_TURNING, FAILCHANCE_EASY,  required_stat = STAT_MEC))
			if(!anchored)
				user.visible_message("[user.name] secures the [src.name] to the floor.", \
					"You secure the anchor bolts to the floor.", \
					"You hear a ratchet")
				src.anchored = 1
				connect_to_network()
			else if(!linked_shielding.len > 0)
				user.visible_message("[user.name] unsecures the [src.name].", \
					"You remove the anchor bolts.", \
					"You hear a ratchet")
				src.anchored = 0
				disconnect_from_network()
			return

	if(QUALITY_PULSING in I.tool_qualities)
		if((anchored || linked_shielding.len) && I.use_tool(user, src, WORKTIME_FAST, QUALITY_PULSING, FAILCHANCE_EASY,  required_stat = STAT_MEC))
			user.visible_message("[user.name] deactivate the Antimatter engine.", \
								"You deactivate the Antimatter engine.")
			disconnect_from_network()
			for(var/obj/machinery/am_shielding/AMS in linked_shielding)
				AMS.collapse()
				remove_shielding(AMS)
			return

	if(istype(I, /obj/item/gripper)) // Are we attacking with a borg gripper?
		var/obj/item/gripper/G = I
		if(istype(G.wrapped, /obj/item/am_containment))
			attackby(G.wrapped, user, params)

	else if(istype(I, /obj/item/am_containment))
		if(fueljar)
			to_chat(user, "\red There is already a [fueljar] inside!")
			return
		fueljar = I
		user.remove_from_mob(I)
		I.loc = src
		user.update_icons()
		user.visible_message("[user.name] loads an [I.name] into the [src.name].", \
				"You load an [I.name].", \
				"You hear a thunk.")
		return

	else if(I.force >= 20)
		stability -= I.force/2
		check_stability()
	..()
	return

/obj/machinery/power/am_control_unit/attack_hand(mob/user as mob)
	if(anchored)
		interact(user)
	else
		to_chat(user, SPAN_NOTICE("The console need to be anchored first."))
	return

/obj/machinery/power/am_control_unit/attack_ai(mob/user as mob)
	if(anchored)
		interact(user)
	else
		to_chat(user, SPAN_NOTICE("The console need to be anchored first."))

/obj/machinery/power/am_control_unit/proc/add_shielding(obj/machinery/am_shielding/AMS, AMS_linking = FALSE)
	if(!istype(AMS))
		return FALSE
	if(!anchored)
		return FALSE
	if(!AMS_linking && !AMS.link_control(src))
		return FALSE
	linked_shielding.Add(AMS)
	update_shield_icons = 1
	return TRUE

/obj/machinery/power/am_control_unit/proc/remove_shielding(obj/machinery/am_shielding/AMS)
	if(!istype(AMS))
		return 0
	linked_shielding.Remove(AMS)
	update_shield_icons = 2
	if(active)
		toggle_power()
	return 1

/obj/machinery/power/am_control_unit/proc/check_stability()//TODO: make it break when low also might want to add a way to fix it like a part or such that can be replaced
	check_core_stability()
	if(stability <= 0)
		qdel(src)
	return

/obj/machinery/power/am_control_unit/proc/toggle_power()
	active = !active
	var/alert_msg = "Antimatter Engine [active ? "starting up.":"shutting down."]"
	if(active)
		use_power = 2
		visible_message("The [src.name] starts up.")
		for(var/obj/machinery/am_shielding/Core in linked_cores)
			flick("core_activating", Core)
			Core.icon_state = "core_activated"
	else
		use_power = IDLE_POWER_USE
		visible_message("The [src.name] shuts down.")
		for(var/obj/machinery/am_shielding/Core in linked_cores)
			flick("core_desactivating", Core)
			Core.icon_state = "core_inactive"
	if(announce_stability)
		radio.autosay(alert_msg, "Antimatter Automated Announcement", "Engineering")
	update_icon()
	check_stability()
	return

/obj/machinery/power/am_control_unit/proc/check_shield_icons()//Forces icon_update for all shields
	if(shield_icon_delay)
		return
	shield_icon_delay = TRUE
	if(update_shield_icons == 2)//2 means to clear everything and rebuild
		for(var/obj/machinery/am_shielding/AMS in linked_shielding)
			if(AMS.processing)
				AMS.shutdown_core()
			AMS.control_unit = null
			spawn(10)
				AMS.controllerscan()
		linked_shielding = list()
	else
		for(var/obj/machinery/am_shielding/AMS in linked_shielding)
			AMS.update_icon()
	spawn(20)
		shield_icon_delay = FALSE

/obj/machinery/power/am_control_unit/proc/check_core_stability()
	if(stored_core_stability_delay || linked_cores.len <= 0)
		return
	stored_core_stability_delay = TRUE
	stored_core_stability = 0
	for(var/obj/machinery/am_shielding/AMS in linked_cores)
		stored_core_stability += AMS.stability
	stored_core_stability/=linked_cores.len
	spawn(40)
		stored_core_stability_delay = 0

	if(announce_stability)
		var/alert_msg = "WARNING, Antimatter Engine Stability at [stored_core_stability]%!"
		if(stored_core_stability <= 75)
			radio.autosay(alert_msg, "Antimatter Automated Announcement", "Engineering")
		if(stored_core_stability <= 50)
			radio.autosay(alert_msg, "Antimatter Automated Announcement", "Command")
		if(stored_core_stability <= 25)
			radio.autosay(alert_msg, "Antimatter Automated Announcement")

/obj/machinery/power/am_control_unit/proc/toggle_announcement()
	announce_stability = !announce_stability
	to_chat(usr, "announce_stability is now set to [announce_stability]")

/obj/machinery/power/am_control_unit/proc/reset_stored_core_stability_delay()
	stored_core_stability_delay = FALSE

/obj/machinery/power/am_control_unit/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "AntimatterControl", name)
		ui.open()

/obj/machinery/power/am_control_unit/ui_data(mob/user)
	var/list/data = list()

	data["active"] = active
	data["instability"] = stability
	data["linked_shielding"] = linked_shielding.len
	data["cores"] = linked_cores.len
	data["efficiency"] = reported_core_efficiency
	data["stability"] = stored_core_stability
	data["stored_power"] = stored_power
	data["fuel"] = fueljar?.fuel
	data["fuel_max"] = fueljar?.fuel_max
	data["fuel_injection"] = fuel_injection

	return data

/obj/machinery/power/am_control_unit/ui_act(action, list/params, datum/tgui/ui, datum/ui_state/state)
	. = ..()
	if(.)
		return

	switch(action)
		if("togglestatus")
			toggle_power()

		if("refreshicons")
			update_shield_icons = 1

		if("ejectjar")
			if(fueljar)
				fueljar.forceMove(loc)
				fueljar = null

		if("set_fuel_injection")
			var/value = params["value"]
			fuel_injection = max(value, 0)

		if("refreshstability")
			if(stored_core_stability_delay)
				to_chat(usr, SPAN_WARNING("You cannot probe the stability again so soon."))
				// No return, check_core_stability rejects it automatically
			check_core_stability()

// TODO : Allow users to turn off announce_stability. -R4d6
/obj/machinery/power/am_control_unit/interact(mob/user)
	ui_interact(user)
