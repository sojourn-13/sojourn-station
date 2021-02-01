/obj/machinery/mining
	icon = 'icons/obj/mining_drill.dmi'
	anchored = 0
	use_power = NO_POWER_USE //The drill takes power directly from a cell.
	density = 1
	layer = MOB_LAYER+0.1 //So it draws over mobs in the tile north of it.

/obj/machinery/mining/drill
	name = "mining drill head"
	desc = "An enormous drill."
	icon_state = "mining_drill"
	circuit = /obj/item/weapon/circuitboard/miningdrill
	var/braces_needed = 2
	var/list/supports = list()
	var/supported = 0
	var/active = 0
	var/list/resource_field = list()

	var/ore_types = list(
		MATERIAL_IRON  = /obj/item/weapon/ore/iron,
		MATERIAL_URANIUM = /obj/item/weapon/ore/uranium,
		MATERIAL_GOLD = /obj/item/weapon/ore/gold,
		MATERIAL_SILVER = /obj/item/weapon/ore/silver,
		MATERIAL_DIAMOND = /obj/item/weapon/ore/diamond,
		MATERIAL_PLASMA  = /obj/item/weapon/ore/plasma,
		MATERIAL_OSMIUM  = /obj/item/weapon/ore/osmium,
		MATERIAL_TRITIUM  = /obj/item/weapon/ore/hydrogen,
		MATERIAL_GLASS  = /obj/item/weapon/ore/glass,
		MATERIAL_PLASTIC  = /obj/item/weapon/ore/coal
		)

	//Upgrades
	var/harvest_speed
	var/capacity
	var/charge_use
	var/radius
	var/obj/item/weapon/cell/large/cell = null

	//Flags
	var/need_update_field = 0
	var/need_player_check = 0


/obj/machinery/mining/drill/Destroy()
	for(var/obj/machinery/mining/brace/b in supports)
		b.disconnect()
	return ..()

/obj/machinery/mining/drill/Process()
	if(!active)
		return

	check_supports()

	if(!anchored || !use_cell_power())
		system_error("system configuration or charge error")
		return

	if(need_update_field)
		get_resource_field()

	//Drill through the flooring, if any.
	if(istype(get_turf(src), /turf/simulated/floor/asteroid))
		var/turf/simulated/floor/asteroid/T = get_turf(src)
		if(!T.dug)
			T.gets_dug()
	else if(istype(get_turf(src), /turf/simulated/floor))
		var/turf/simulated/floor/T = get_turf(src)
		T.ex_act(2.0)

	dig_ore()

/obj/machinery/mining/drill/proc/dig_ore()

	//Dig out the tasty ores.
	if(!resource_field.len)
		system_error("resources depleted")
		return

	var/turf/simulated/harvesting = pick(resource_field)

	//remove emty trufs
	while(resource_field.len && !harvesting.resources)
		harvesting.has_resources = FALSE
		harvesting.resources = null
		resource_field -= harvesting
		if(resource_field.len)
			harvesting = pick(resource_field)

	if(!harvesting)
		system_error("resources depleted")
		return

	var/total_harvest = harvest_speed //Ore harvest-per-tick.
	var/found_resource = FALSE

	for(var/metal in ore_types)

		if(contents.len >= capacity)
			system_error("insufficient storage space")

		if(contents.len + total_harvest >= capacity)
			total_harvest = capacity - contents.len

		if(total_harvest <= 0)
			break

		if(harvesting.resources[metal])

			found_resource = TRUE

			var/create_ore = 0
			if(harvesting.resources[metal] >= total_harvest)
				harvesting.resources[metal] -= total_harvest
				create_ore = total_harvest
				total_harvest = 0
			else
				total_harvest -= harvesting.resources[metal]
				create_ore = harvesting.resources[metal]
				harvesting.resources[metal] = 0

			for(var/i = 1, i <= create_ore, i++)
				var/oretype = ore_types[metal]
				new oretype(src)

	if(!found_resource)
		harvesting.has_resources = FALSE
		harvesting.resources = null
		resource_field -= harvesting

/obj/machinery/mining/drill/attackby(obj/item/I, mob/user as mob)

	if(!active)
		if(default_deconstruction(I, user))
			return

		if(default_part_replacement(I, user))
			return

	if(!panel_open || active)
		return ..()

	if(istype(I, /obj/item/weapon/cell/large))
		if(cell)
			to_chat(user, "The drill already has a cell installed.")
		else
			user.drop_item()
			I.loc = src
			cell = I
			component_parts += I
			to_chat(user, "You install \the [I].")
		return
	..()

/obj/machinery/mining/drill/attack_hand(mob/user as mob)
	check_supports()

	if (panel_open && cell)
		to_chat(user, "You take out \the [cell].")
		cell.loc = get_turf(user)
		component_parts -= cell
		cell = null
		return
	else if(need_player_check)
		to_chat(user, "You hit the manual override and reset the drill's error checking.")
		need_player_check = 0
		if(anchored)
			get_resource_field()
		update_icon()
		return
	else if(supported && !panel_open)
		if(use_cell_power())
			active = !active
			if(active)
				visible_message(SPAN_NOTICE("\The [src] lurches downwards, grinding noisily."))
				need_update_field = 1
			else
				visible_message(SPAN_NOTICE("\The [src] shudders to a grinding halt."))
		else
			to_chat(user, SPAN_NOTICE("The drill is unpowered."))
	else
		to_chat(user, SPAN_NOTICE("Turning on a piece of industrial machinery without sufficient bracing or wires exposed is a bad idea."))

	update_icon()

/obj/machinery/mining/drill/update_icon()
	if(need_player_check)
		icon_state = "mining_drill_error"
	else if(active)
		icon_state = "mining_drill_active"
	else if(supported)
		icon_state = "mining_drill_braced"
	else
		icon_state = "mining_drill"
	return

/obj/machinery/mining/drill/RefreshParts()
	..()
	harvest_speed = 0
	capacity = 0
	charge_use = 50
	radius = 0

	for(var/obj/item/weapon/stock_parts/P in component_parts)
		if(istype(P, /obj/item/weapon/stock_parts/micro_laser))
			harvest_speed = P.rating
		if(istype(P, /obj/item/weapon/stock_parts/matter_bin))
			capacity = 200 * P.rating
		if(istype(P, /obj/item/weapon/stock_parts/capacitor))
			charge_use -= 10 * (P.rating - harvest_speed)
			charge_use = max(charge_use, 0)
		if(istype(P, /obj/item/weapon/stock_parts/scanning_module))
			radius = 1 + P.rating
	cell = locate(/obj/item/weapon/cell/large) in component_parts

/obj/machinery/mining/drill/proc/check_supports()
	if(supports && supports.len >= braces_needed)
		return TRUE

	return FALSE

/obj/machinery/mining/drill/proc/system_error(var/error)

	if(error)
		src.visible_message(SPAN_NOTICE("\The [src] flashes a '[error]' warning."))
	need_player_check = 1
	active = 0
	update_icon()

/obj/machinery/mining/drill/proc/get_resource_field()

	resource_field = list()
	need_update_field = FALSE

	var/turf/T = get_turf(src)
	if(!istype(T))
		return

	for(var/turf/simulated/mine_trufs in range(T, radius))
		if(mine_trufs.has_resources)
			resource_field += mine_trufs

	if(!resource_field.len)
		system_error("resources depleted")

/obj/machinery/mining/drill/proc/use_cell_power()
	if(!cell)
		return FALSE
	if(cell.charge >= charge_use)
		cell.use(charge_use)
		return 1
	return 0

/obj/machinery/mining/drill/verb/unload()
	set name = "Unload Drill"
	set category = "Object"
	set src in oview(1)

	if(usr.stat)
		return

	var/obj/structure/ore_box/B = locate() in orange(1)
	if(B)
		for(var/obj/item/weapon/ore/O in contents)
			O.loc = B
		to_chat(usr, SPAN_NOTICE("You unload the drill's storage cache into the ore box."))
	else
		to_chat(usr, SPAN_NOTICE("You must move an ore box up to the drill before you can unload it."))

/obj/machinery/mining/drill/proc/connect_brace(obj/machinery/mining/brace/brace)
	if(!supports)
		supports = list()
	supports += brace
	anchored = TRUE

	if(supports && supports.len >= braces_needed)

		supported = TRUE

	update_icon()

/obj/machinery/mining/drill/proc/disconnect_brace(obj/machinery/mining/brace/brace)
	if(!supports)
		supports = list()

	supports -= brace

	if((!supports || !supports.len))
		anchored = FALSE
	else
		anchored = TRUE

	if(supports && supports.len >= braces_needed)
		supported = TRUE
	else
		supported = FALSE

	update_icon()

/obj/machinery/mining/brace
	name = "mining drill brace"
	desc = "A machinery brace for an industrial drill. It looks easily half-meter thick."
	icon_state = "mining_brace"
	circuit = /obj/item/weapon/circuitboard/miningdrillbrace
	var/obj/machinery/mining/drill/connected

/obj/machinery/mining/brace/Destroy()
	if(connected)
		connected.disconnect_brace(src)
	return ..()

/obj/machinery/mining/brace/attackby(var/obj/item/I, mob/user as mob)
	if(connected && connected.active)
		to_chat(user, SPAN_NOTICE("You can't work with the brace of a running drill!"))
		return

	var/tool_type = I.get_tool_type(user, list(QUALITY_PRYING, QUALITY_SCREW_DRIVING, QUALITY_BOLT_TURNING), src)
	switch(tool_type)

		if(QUALITY_PRYING)
			if(!panel_open)
				to_chat(user, SPAN_NOTICE("You cant get to the components of \the [src], remove the cover."))
				return
			if(I.use_tool(user, src, WORKTIME_NORMAL, tool_type, FAILCHANCE_EASY, required_stat = STAT_MEC))
				to_chat(user, SPAN_NOTICE("You remove the components of \the [src] with [I]."))
				dismantle()
				return

		if(QUALITY_SCREW_DRIVING)
			var/used_sound = panel_open ? 'sound/machines/Custom_screwdriveropen.ogg' :  'sound/machines/Custom_screwdriverclose.ogg'
			if(I.use_tool(user, src, WORKTIME_NEAR_INSTANT, tool_type, FAILCHANCE_VERY_EASY, required_stat = STAT_MEC, instant_finish_tier = 30, forced_sound = used_sound))
				panel_open = !panel_open
				to_chat(user, SPAN_NOTICE("You [panel_open ? "open" : "close"] the maintenance hatch of \the [src] with [I]."))
				update_icon()
				return

		if(QUALITY_BOLT_TURNING)
			if(istype(get_turf(src), /turf/space))
				to_chat(user, SPAN_NOTICE("You can't anchor something to empty space. Idiot."))
				return
			if(I.use_tool(user, src, WORKTIME_NORMAL, tool_type, FAILCHANCE_VERY_EASY, required_stat = STAT_MEC))
				to_chat(user, SPAN_NOTICE("You [anchored ? "un" : ""]anchor the brace with [I]."))
				anchored = !anchored
				if(anchored)
					connect()
				else
					disconnect()

		if(ABORT_CHECK)
			return

/obj/machinery/mining/brace/proc/connect()
	connected = locate(/obj/machinery/mining/drill, get_step(src, dir))

	if(!connected)
		return

	icon_state = "mining_brace_active"
	connected.connect_brace(src)

/obj/machinery/mining/brace/proc/disconnect()

	if(!connected)
		return

	icon_state = "mining_brace"

	connected.disconnect_brace(src)

	connected = null


/obj/machinery/mining/brace/verb/rotate()
	set name = "Rotate"
	set category = "Object"
	set src in oview(1)

	if(usr.stat)
		return

	if (anchored)
		to_chat(usr, "It is anchored in place!")
		return

	set_dir(turn(dir, 90))
	return