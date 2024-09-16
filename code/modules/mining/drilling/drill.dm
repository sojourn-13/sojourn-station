#define RADIUS 7
#define DRILL_COOLDOWN 1 MINUTE

/obj/machinery/mining
	icon = 'icons/obj/mining_drill.dmi'
	anchored = 0
	use_power = NO_POWER_USE //The drill takes power directly from a cell.
	density = 1
	layer = MOB_LAYER+0.1 //So it draws over mobs in the tile north of it.

/obj/machinery/mining/drill
	name = "mining drill head"
	desc = "An enormous drill."
	description_info = "The Seismic Stimulator can set the minimum termite aggression for any mining operation, overriden by the local seismic activity if it is higher. \
	This machine's micro laser, matter bin, capacitor and scanning module can be upgraded to enhance the harvest rate, capacity, power efficiency and range, respectively."
	icon_state = "mining_drill"
	circuit = /obj/item/circuitboard/miningdrill
	var/braces_needed = 2
	var/list/supports = list()
	var/supported = 0
	var/max_health = 1000
	health = 1000
	var/active = 0
	var/list/resource_field = list()
	var/datum/termite_controller/TC
	var/last_use = 0.0
	var/mob/living/soul = null
	var/ore_types = list(
		MATERIAL_IRON  = /obj/item/stack/ore/iron,
		MATERIAL_URANIUM = /obj/item/stack/ore/uranium,
		MATERIAL_GOLD = /obj/item/stack/ore/gold,
		MATERIAL_SILVER = /obj/item/stack/ore/silver,
		MATERIAL_DIAMOND = /obj/item/stack/ore/diamond,
		MATERIAL_PLASMA  = /obj/item/stack/ore/plasma,
		MATERIAL_OSMIUM  = /obj/item/stack/ore/osmium,
		MATERIAL_TRITIUM  = /obj/item/stack/ore/hydrogen,
		MATERIAL_GLASS  = /obj/item/stack/ore/glass,
		MATERIAL_PLASTIC  = /obj/item/stack/ore/coal
		)

	//Upgrades
	var/harvest_speed
	var/capacity
	var/charge_use
	var/radius
	var/obj/item/cell/large/cell = null

	//Flags
	var/need_update_field = 0
	var/need_player_check = 0
	var/need_new_harvest = TRUE

	// Used to manually stimulate termite waves
	var/seismic_stimulation = 1

	//The turf being harvested
	var/turf/simulated/harvesting

/obj/machinery/mining/drill/Destroy()
	for(var/obj/machinery/mining/brace/b in supports)
		b.disconnect()

	if(TC)
		TC.stop()
		TC = null

	if(soul)
		QDEL_NULL(soul)
	return ..()

/obj/machinery/mining/drill/Initialize()
	. = ..()
	var/mob/living/simple_animal/soul/S = new(src)
	soul = S
	var/obj/item/cell/large/high/C = new(src)
	component_parts += C
	cell = C
	update_icon()

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

	if(need_new_harvest) //Do we have no target tile, or our target tile ran out?
		harvesting = pick(resource_field) //Get a new tile
		need_new_harvest = FALSE //Set the flag to false to prevent grabbing tiles until we've run out

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

	if(!found_resource) //no resources found?
		harvesting.has_resources = FALSE
		harvesting.resources = null
		resource_field -= harvesting
		need_new_harvest = TRUE //set this flag to TRUE to call for a new tile next dig_ore()

/obj/machinery/mining/drill/attackby(obj/item/I, mob/user as mob)

	if(!active)
		if(default_deconstruction(I, user))
			return

		if(default_part_replacement(I, user))
			return

	if(!panel_open || active)
		return ..()

	if(istype(I, /obj/item/cell/large))
		if(cell)
			to_chat(user, "The drill already has a cell installed.")
		else
			user.drop_item()
			I.loc = src
			cell = I
			component_parts += I
			to_chat(user, "You install \the [I].")
		return

	if (user.a_intent == I_HURT && user.Adjacent(src))
		if(!(I.flags & NOBLUDGEON))
			user.do_attack_animation(src)
			var/damage = I.force * I.structure_damage_factor
			var/volume =  min(damage * 3.5, 15)
			if (I.hitsound)
				playsound(src, I.hitsound, volume, 1, -1)
			visible_message(SPAN_DANGER("[src] has been hit by [user] with [I]."))
			take_damage(damage)
			user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN * 1.5)

	var/damage = max_health - health
	if(damage && (QUALITY_WELDING in I.tool_qualities))
		if(active)
			to_chat(user, SPAN_WARNING("Turn \the [src] off first!"))
			return
		to_chat(user, "<span class='notice'>You start repairing the damage to [src].</span>")
		if(I.use_tool(user, src, WORKTIME_LONG, QUALITY_WELDING, FAILCHANCE_EASY, required_stat = STAT_ROB))
			playsound(src, 'sound/items/Welder.ogg', 100, 1)
			to_chat(user, "<span class='notice'>You finish repairing the damage to [src].</span>")
			take_damage(-damage)
		return
	..()


/obj/machinery/mining/drill/attack_hand(mob/user as mob)
	check_supports()

	if (panel_open && cell)
		to_chat(user, "You take out \the [cell].")
		user.put_in_hands(cell)
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
		if(health == 0)
			to_chat(user, SPAN_NOTICE("The drill is too damaged to be turned on."))
		else if (!active && check_surroundings())
			to_chat(user, SPAN_NOTICE("The space around the drill has to be clear of obstacles!"))
		else if(world.time - last_use < DRILL_COOLDOWN)
			to_chat(user, SPAN_WARNING("\The [src] needs some time to cool down! [round((last_use + DRILL_COOLDOWN - world.time) / 10)] seconds remaining."))
		if(use_cell_power())
			active = !active
			toggle_drilling_combat()

		else
			to_chat(user, SPAN_NOTICE("The drill is unpowered."))
	else
		to_chat(user, SPAN_NOTICE("Turning on a piece of industrial machinery without sufficient bracing or wires exposed is a bad idea."))
	update_icon()


/obj/machinery/mining/drill/proc/toggle_drilling_combat(mob/user as mob)
	if(active)
		var/turf/simulated/T = get_turf(loc)
		var/seismic_score = max(T.seismic_activity, seismic_stimulation) //Pick the highest seismic score between the drill's and the turf's
		TC = new /datum/termite_controller(location=T, seismic=seismic_score, drill=src)
		visible_message(SPAN_NOTICE("\The [src] lurches downwards, grinding noisily."))
		need_update_field = 1
		if(!soul)
			var/mob/living/simple_animal/soul/S = new(src)
			soul = S
		soul.loc = src.loc
	else
		TC.stop()
		TC = null
		visible_message(SPAN_NOTICE("\The [src] shudders to a grinding halt."))
		if(!soul)
			var/mob/living/simple_animal/soul/S = new(src)
			soul = S
		soul.loc = src.contents



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
	charge_use = 37
	radius = RADIUS

	for(var/obj/item/stock_parts/P in component_parts)
		if(istype(P, /obj/item/stock_parts/micro_laser))
			harvest_speed = 2 * P.rating
		if(istype(P, /obj/item/stock_parts/matter_bin))
			capacity = 200 * P.rating
		if(istype(P, /obj/item/stock_parts/capacitor))
			charge_use -= 8 * (P.rating - (harvest_speed / 2))
			charge_use = max(charge_use, 0)
		if(istype(P, /obj/item/stock_parts/scanning_module))
			radius = RADIUS + P.rating
	cell = locate(/obj/item/cell/large) in component_parts

/obj/machinery/mining/drill/proc/check_supports()
	if(supports && supports.len >= braces_needed)
		return TRUE

	return FALSE

/obj/machinery/mining/drill/proc/system_error(var/error)

	if(error)
		src.visible_message(SPAN_NOTICE("\The [src] flashes a '[error]' warning."))
	need_player_check = 1
	active = FALSE
	toggle_drilling_combat()
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

/obj/machinery/mining/drill/proc/check_surroundings()
	// Check if there is no dense obstacles around the drill to avoid blocking access to it
	for(var/turf/F in block(locate(x - 1, y - 1, z), locate(x + 1, y + 1, z)))
		if(F != loc)
			if(F.density)
				return TRUE
			for(var/atom/A in F)
				if(A.density && !(A.flags & ON_BORDER) && !ismob(A))
					return TRUE
	return FALSE

/obj/machinery/mining/drill/attack_generic(mob/user, damage, attack_message, damagetype = BRUTE, attack_flag = ARMOR_MELEE, sharp = FALSE, edge = FALSE)
	user.do_attack_animation(src)
	visible_message(SPAN_DANGER("\The [user] smashes into \the [src]!"))
	take_damage(damage)
	user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN * 1.5)

/obj/machinery/mining/drill/bullet_act(obj/item/projectile/Proj)
	..()
	if (!(Proj.testing))
		var/damage = Proj.get_structure_damage()
		take_damage(damage)

/obj/machinery/mining/drill/proc/take_damage(value)
	health = min(max(health - value, 0), max_health)
	if(0 >= health)
		system_error("critical damage")
		var/turf/O = get_turf(src)
		if(O)
			explosion(O, -1, 1, 4, 10)
			if(TC)
				TC.stop()
				TC = null
			if(soul)
				QDEL_NULL(soul)
			qdel(src)
			return
		else
			if(TC)
				TC.stop()
				TC = null
			if(soul)
				QDEL_NULL(soul)
			qdel(src)

/obj/machinery/mining/drill/examine(mob/user)
	. = ..()
	if(health <= 0)
		to_chat(user, "\The [src] is wrecked.")
	else if(health < max_health * 0.25)
		to_chat(user, "<span class='danger'>\The [src] looks like it's about to break!</span>")
	else if(health < max_health * 0.5)
		to_chat(user, "<span class='danger'>\The [src] looks seriously damaged!</span>")
	else if(health < max_health * 0.75)
		to_chat(user, "\The [src] shows signs of damage!")
	to_chat(usr, SPAN_NOTICE("The seismic stimulator is set to [seismic_stimulation]."))


/obj/machinery/mining/drill/verb/configure_seismic()
	set name = "Configure Seismic Stimulator"
	set category = "Object"
	set src in oview(1)

	if(usr.stat)
		return

	var/list/seismic_scores = list(1,2,3,4,5,6)
	var/selection = input(usr, "Set the minimum seismic activity to?", "Seismic Activity") as null|anything in seismic_scores

	if(!selection)
		to_chat(usr, SPAN_NOTICE("You leave the stimulator alone."))
		return

	seismic_stimulation = selection
	to_chat(usr, SPAN_NOTICE("You set the stimulator to [selection]."))

/obj/machinery/mining/drill/verb/unload()
	set name = "Unload Drill"
	set category = "Object"
	set src in oview(1)

	if(usr.stat)
		return

	var/obj/structure/ore_box/B = locate() in orange(1)
	if(B)
		for(var/obj/item/stack/ore/O in contents)
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
	circuit = /obj/item/circuitboard/miningdrillbrace
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

#undef RADIUS
#undef DRILL_COOLDOWN