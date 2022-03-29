/obj/machinery/recharge_station
	name = "cyborg recharging station"
	desc = "A heavy duty rapid charging system, designed to quickly recharge cyborg power reserves."
	icon = 'icons/obj/objects.dmi'
	icon_state = "borgcharger0"
	density = 1
	anchored = 1
	use_power = IDLE_POWER_USE
	idle_power_usage = 50
	circuit = /obj/item/circuitboard/recharge_station
	var/mob/occupant = null
	var/obj/item/cell/large/cell = null
	var/icon_update_tick = 0	// Used to rebuild the overlay only once every 10 ticks
	var/charging = 0
	var/efficiency = 0.9
	var/charging_power			// W. Power rating used for charging the cyborg. 120 kW if un-upgraded
	var/restore_power_active	// W. Power drawn from APC when an occupant is charging. 40 kW if un-upgraded
	var/restore_power_passive	// W. Power drawn from APC when idle. 7 kW if un-upgraded
	var/weld_rate = 0			// How much brute damage is repaired per tick
	var/wire_rate = 0			// How much burn damage is repaired per tick

	var/weld_power_use = 2300	// power used per point of brute damage repaired. 2.3 kW ~ about the same power usage of a handheld arc welder
	var/wire_power_use = 500	// power used per point of burn damage repaired.

	var/exit_timer

/obj/machinery/recharge_station/Initialize()
	. = ..()
	RefreshParts()
	update_icon()

/obj/machinery/recharge_station/robotics

/obj/machinery/recharge_station/robotics/Initialize()
	. = ..()
	component_parts = list()
	component_parts += new /obj/item/stock_parts/capacitor/super(null)
	component_parts += new /obj/item/stock_parts/manipulator/pico(null)
	component_parts += new /obj/item/stock_parts/manipulator/pico(null)
	component_parts += new /obj/item/stock_parts/capacitor/super(null)
	component_parts += new /obj/item/cell/large/moebius/super(null) //has better cell do to being for robotics
	component_parts += new /obj/item/stack/cable_coil{amount = 5}(null)
	RefreshParts()
	update_icon()

/obj/machinery/recharge_station/upgraded_t_three

/obj/machinery/recharge_station/upgraded_t_three/Initialize()
	. = ..()
	component_parts = list()
	component_parts += new /obj/item/stock_parts/capacitor/super(null)
	component_parts += new /obj/item/stock_parts/manipulator/pico(null)
	component_parts += new /obj/item/stock_parts/manipulator/pico(null)
	component_parts += new /obj/item/stock_parts/capacitor/super(null)
	component_parts += new /obj/item/cell/large/moebius(null)
	component_parts += new /obj/item/stack/cable_coil{amount = 5}(null)
	RefreshParts()
	update_icon()

/obj/machinery/recharge_station/proc/has_cell_power()
	return cell && cell.percent() > 0

/obj/machinery/recharge_station/Process()
	if(stat & (BROKEN))
		return
	if(!cell) // Shouldn't be possible, but sanity check
		return

	if((stat & NOPOWER) && !has_cell_power()) // No power and cell is dead.
		if(icon_update_tick)
			icon_update_tick = 0 //just rebuild the overlay once more only
			update_icon()
		return

	//First, draw from the internal power cell to recharge/repair/etc the occupant
	if(occupant)
		process_occupant()

	//Then, if external power is available, recharge the internal cell
	var/recharge_amount = 0
	if(!(stat & NOPOWER))
		// Calculating amount of power to draw
		recharge_amount = (occupant ? restore_power_active : restore_power_passive) * CELLRATE

		recharge_amount = cell.give(recharge_amount* efficiency)
		use_power(recharge_amount / CELLRATE)

	if(icon_update_tick >= 10)
		icon_update_tick = 0
	else
		icon_update_tick++

	if(occupant || recharge_amount)
		update_icon()

//since the recharge station can still be on even with NOPOWER. Instead it draws from the internal cell.
/obj/machinery/recharge_station/auto_use_power()
	if(!(stat & NOPOWER))
		return ..()

	if(!has_cell_power())
		return 0
	if(src.use_power == 1)
		cell.use(idle_power_usage * CELLRATE)
	else if(src.use_power >= 2)
		cell.use(active_power_usage * CELLRATE)
	return 1

//Processes the occupant, drawing from the internal power cell if needed.
/obj/machinery/recharge_station/proc/process_occupant()
	if(isrobot(occupant))
		var/mob/living/silicon/robot/R = occupant

		if(R.module)
			R.module.respawn_consumable(R, charging_power * CELLRATE / 250) //consumables are magical, apparently
		if(R.cell && !R.cell.fully_charged())
			var/diff = min(R.cell.maxcharge - R.cell.charge, charging_power * CELLRATE) // Capped by charging_power / tick
			var/charge_used = cell.use(diff)
			R.cell.give(charge_used*efficiency)

		//Lastly, attempt to repair the cyborg if enabled
		if(weld_rate && R.getBruteLoss() && cell.checked_use(weld_power_use * weld_rate * CELLRATE))
			R.adjustBruteLoss(-weld_rate)
		if(wire_rate && R.getFireLoss() && cell.checked_use(wire_power_use * wire_rate * CELLRATE))
			R.adjustFireLoss(-wire_rate)

/obj/machinery/recharge_station/examine(mob/user)
	..(user)
	to_chat(user, "The charge meter reads: [round(chargepercentage())]%")

/obj/machinery/recharge_station/proc/chargepercentage()
	if(!cell)
		return 0
	return cell.percent()

/obj/machinery/recharge_station/relaymove(mob/user as mob)
	if(user.incapacitated())
		return
	if(world.time < exit_timer)
		return
	go_out()
	return

/obj/machinery/recharge_station/emp_act(severity)
	if(occupant)
		occupant.emp_act(severity)
		go_out()
	if(cell)
		cell.emp_act(severity)
	..(severity)

/obj/machinery/recharge_station/attackby(var/obj/item/I, var/mob/user as mob)
	if(occupant)
		to_chat(user, SPAN_NOTICE("You cant do anything with [src] while someone inside of it."))
		return

	if(default_deconstruction(I, user))
		return

	if(default_part_replacement(I, user))
		return

	..()

/obj/machinery/recharge_station/RefreshParts()
	..()
	var/man_rating = 0
	var/cap_rating = 0

	for(var/obj/item/stock_parts/P in component_parts)
		if(istype(P, /obj/item/stock_parts/capacitor))
			cap_rating += P.rating
		if(istype(P, /obj/item/stock_parts/manipulator))
			man_rating += P.rating
	cell = locate(/obj/item/cell/large) in component_parts

	charging_power = 40000 + 40000 * cap_rating
	restore_power_active = 10000 + 15000 * cap_rating
	restore_power_passive = 5000 + 1000 * cap_rating
	weld_rate = max(0, man_rating - 3)
	wire_rate = max(0, man_rating - 5)

	desc = initial(desc)
	desc += " Uses a dedicated internal power cell to deliver [charging_power]W when in use."
	if(weld_rate)
		desc += "<br>It is capable of repairing structural damage."
	if(wire_rate)
		desc += "<br>It is capable of repairing burn damage."

/obj/machinery/recharge_station/proc/build_overlays()
	cut_overlays()
	switch(round(chargepercentage()))
		if(1 to 20)
			add_overlay(image('icons/obj/objects.dmi', "statn_c0"))
		if(21 to 40)
			add_overlay(image('icons/obj/objects.dmi', "statn_c20"))
		if(41 to 60)
			add_overlay(image('icons/obj/objects.dmi', "statn_c40"))
		if(61 to 80)
			add_overlay(image('icons/obj/objects.dmi', "statn_c60"))
		if(81 to 98)
			add_overlay(image('icons/obj/objects.dmi', "statn_c80"))
		if(99 to 110)
			add_overlay(image('icons/obj/objects.dmi', "statn_c100"))

/obj/machinery/recharge_station/update_icon()
	..()
	if(stat & BROKEN)
		icon_state = "borgcharger0"
		return

	if(occupant)
		if((stat & NOPOWER) && !has_cell_power())
			icon_state = "borgcharger2"
		else
			icon_state = "borgcharger1"
	else
		icon_state = "borgcharger0"

	if(icon_update_tick == 0)
		build_overlays()

/obj/machinery/recharge_station/Bumped(var/mob/living/silicon/robot/R)
	go_in(R)

/obj/machinery/recharge_station/proc/go_in(var/mob/M)
	if(occupant)
		return
	if(!hascell(M))
		return

	add_fingerprint(M)
	M.reset_view(src)
	M.forceMove(src)
	occupant = M
	update_icon()
	exit_timer = world.time + 10 //magik numbers, yey
	return 1

/obj/machinery/recharge_station/proc/hascell(var/mob/M)
	if(isrobot(M))
		var/mob/living/silicon/robot/R = M
		if(R.cell)
			return 1
	return 0

/obj/machinery/recharge_station/proc/go_out()
	if(!occupant)
		return

	occupant.forceMove(loc)
	occupant.reset_view()
	occupant = null
	update_icon()

/obj/machinery/recharge_station/verb/move_eject()
	set category = "Object"
	set name = "Eject Recharger"
	set src in oview(1)

	if(usr.incapacitated())
		return

	go_out()
	add_fingerprint(usr)
	return

/obj/machinery/recharge_station/verb/move_inside()
	set category = "Object"
	set name = "Enter Recharger"
	set src in oview(1)

	if(!usr.incapacitated())
		return
	go_in(usr)

/obj/machinery/recharge_station/MouseDrop_T(var/mob/target, var/mob/user)
	if(!CanMouseDrop(target, user))
		return
	if(!istype(target,/mob/living/silicon))
		return
	if(target.buckled)
		to_chat(user, "<span class='warning'>Unbuckle the robot before attempting to move it.</span>")
		return
	user.visible_message("<span class='notice'>\The [user] started hauling \the [target] into \the [src].</span>",
							"<span class='notice'>You started hauling \the [target] into \the [src].</span>")
	if(user.stat != DEAD && do_after(user,rand(150,200),src))
		go_in(target, user)


#define REPAIR_HULL 1
#define REPAIR_COMPONENTS 2

/obj/machinery/repair_station
	name = "cyborg auto-repair platform"
	desc = "An automated repair system, designed to repair drones and cyborgs that stand on it."
	icon = 'icons/mecha/mech_bay.dmi'
	icon_state = "recharge_floor_robotic"
	anchored = TRUE
	density = FALSE
	layer = TURF_LAYER + 0.1

	circuit = /obj/item/circuitboard/repair_station

	use_power = IDLE_POWER_USE
	idle_power_usage = 4
	active_power_usage = 4000

	var/mob/living/silicon/robot/repairing

	var/repair_amount = 0 //How much we can heal something for.
	var/repair_rate = 5 //How much HP we restore per second
	var/repair_complexity = REPAIR_HULL //How complex we get regarding repairing things

/obj/machinery/repair_station/Initialize()
	..()
	repair_amount = 500

/obj/machinery/repair_station/examine(mob/user)
	..()
	to_chat(user, "It has [SPAN_NOTICE("[repair_amount]")] repair points remaining.")

/obj/machinery/repair_station/Crossed(var/mob/living/silicon/robot/R)
	. = ..()
	if(istype(R) && repairing != R)
		start_repairing(R)

/obj/machinery/repair_station/Uncrossed(var/mob/living/silicon/R)
	. = ..()
	if(R == repairing)
		stop_repairing()

/obj/machinery/repair_station/RefreshParts()
	..()
	idle_power_usage = initial(idle_power_usage)
	active_power_usage = initial(active_power_usage)
	var/manip_level = 1
	var/scan_level = 1
	for(var/obj/item/stock_parts/P in component_parts)
		if(istype(P, /obj/item/stock_parts/scanning_module))
			scan_level += P.rating-1
		if(istype(P, /obj/item/stock_parts/manipulator))
			manip_level += P.rating-1

	repair_rate = initial(repair_rate)+(manip_level*max(1, scan_level/2))
	if(scan_level >= 3)
		repair_complexity |= REPAIR_COMPONENTS
	idle_power_usage *= manip_level*scan_level
	active_power_usage *= manip_level*scan_level

/obj/machinery/repair_station/Process()
	..()
	if(!repairing)
		return

	if(repairing.loc != loc)
		stop_repairing()
		return

	if(!repair_amount)
		visible_message("\The [src] buzzes \"Insufficient material remaining to continue repairs.\".")
		stop_repairing()
		return

	for(var/V in repairing.components)
		var/datum/robot_component/C = repairing.components[V]
		if(C.brute_damage + C.electronics_damage >= C.max_damage)
			visible_message("\The [src] buzzes \"[C.name] too damaged to repair, aborting.\".")
			stop_repairing()
			return

	var/repair_count = 0
	if(repair_complexity & REPAIR_HULL && (repairing.getBruteLoss() || repairing.getFireLoss()))
		var/amount_to_heal = min(repair_amount, repair_rate)
		repairing.adjustBruteLoss(-amount_to_heal)
		repairing.adjustFireLoss(-amount_to_heal)
		repairing.updatehealth()
		repair_amount = max(0, repair_amount-amount_to_heal)
		repair_count += amount_to_heal

	if(!repair_amount)
		return

	if(repair_complexity & REPAIR_COMPONENTS)
		for(var/V in repairing.components)
			var/datum/robot_component/C = repairing.components[V]
			if(C.brute_damage || C.electronics_damage)
				var/amount_to_heal = min(repair_amount, repair_rate)
				C.heal_damage(amount_to_heal/2,amount_to_heal/2)
				repair_amount = max(0, repair_amount-amount_to_heal)
				repair_count += amount_to_heal
				break

	if(!repair_count)
		to_chat(repairing, SPAN_NOTICE("Repairs complete. Shutting down."))
		stop_repairing()

/obj/machinery/repair_station/proc/start_repairing(var/mob/living/silicon/robot/R)
	if(stat & (NOPOWER | BROKEN))
		to_chat(R, SPAN_WARNING("Repair system not responding. Terminating."))
		return

	to_chat(R, SPAN_NOTICE("Commencing repairs. Please stand by."))
	repairing = R
	update_use_power(ACTIVE_POWER_USE)

/obj/machinery/repair_station/proc/stop_repairing()
	if(!repairing)
		return

	repairing = null
	update_use_power(IDLE_POWER_USE)

/obj/machinery/repair_station/attackby(var/obj/item/O, var/mob/user)

	if(default_deconstruction(O, user))
		return

	if(default_part_replacement(O, user))
		return

	if(istype(O,/obj/item/stack/material) && O.get_material_name() == MATERIAL_STEEL)
		var/obj/item/stack/material/S = O
		if(S.use(1))
			to_chat(user, SPAN_NOTICE("You insert a sheet of \the [S]. \The [src] now has [repair_amount] repair points remaining."))
			repair_amount += 25
	..()

#undef REPAIR_HULL
#undef REPAIR_COMPONENTS
