/obj/machinery/mining/slab_consol
	icon = 'icons/obj/mining.dmi'
	anchored = 1
	density = 1
	icon_state = "slab_console"
	name = "Slate Mining Console M.E.H A"
	desc = "A glorifed claw mechine that lets you pick up pre-quorterd slabs of mining slabs. \
	The console when in operation tells you in big letters to be careful as golems and crystals could be pulled up."
	var/stored_points = 0
	var/target_area_name = "Slate Mining Pad MEH A"
	circuit = /obj/item/circuitboard/slab_consol
	dir = NORTH
	var/all_cleared = FALSE
	var/point_reward = 100
	var/first_time = TRUE //So we dont give a free 1k on first spawn

/obj/item/circuitboard/slab_consol
	build_name = "SMC M.E.M A"
	build_path = /obj/machinery/mining/slab_consol
	board_type = "machine"
	origin_tech = list(TECH_DATA = 5) //Random number
	req_components = list(
		/obj/item/stack/cable_coil = 2,
		/obj/item/stock_parts/scanning_module = 5
	)

/obj/machinery/mining/slab_consol/examine(mob/user)
	..()
	if(stored_points)
		to_chat(user, SPAN_NOTICE("Current unclaimed points: [stored_points]"))
		to_chat(user, SPAN_NOTICE("Clearing a full slab gains [point_reward] mining points."))

/obj/machinery/mining/slab_consol/attackby(obj/item/W, mob/user)
	if(stored_points)
		if(istype(W,/obj/item/card/id))
			var/obj/item/card/id/swiping_id = W
			swiping_id.mining_points += stored_points
			to_chat(user, SPAN_NOTICE("Added Points:[stored_points]."))
			to_chat(user, SPAN_NOTICE("Points On Card:[swiping_id.mining_points]."))
			stored_points = 0
			return
	..()

/obj/machinery/mining/slab_consol/attack_hand(mob/user)
	add_fingerprint(user)
	var/user_is_choosing = TRUE

	while(user_is_choosing)
		var/action = alert(user, "Load new slab?", "Load a new slab?", "Yes!", "Checking!", "Cancel")

		switch(action)
			if("Yes!")
				if(run_checks(user))
					process_new_slab(user)
				return
			if("Checking!")
				run_checks(user)
				user_is_choosing = FALSE
				return
			if("Cancel")
				user_is_choosing = FALSE
				return
	..()

	user_is_choosing = FALSE

/obj/machinery/mining/slab_consol/proc/run_checks(mob/user)
	var/area/work_area = get_area(get_step(src, dir))
	var/area/my_area = get_area(src.loc)
	var/passes_checked = TRUE
	var/mineral_all_mined = TRUE

	if(my_area == work_area)
		to_chat(user, SPAN_NOTICE("ERROR: Location of Console is same as Work Area"))
		return FALSE //Early false return as we cant check anything if we dont see are work area
	if(work_area.name != target_area_name)
		to_chat(user, SPAN_NOTICE("ERROR: Unable to see [target_area_name]. \
		Console is required be eather just south of work area or otherwise next to the defined area."))
		return FALSE //Wrong work area
	to_chat(user, SPAN_NOTICE("Successfully able to see and target work area."))

	//We only care about rock walls and living mobs
	//This one is only for the bonus points
	for(var/turf/simulated/mineral/MW in work_area.contents)
		if(MW)
			to_chat(user, SPAN_NOTICE("Leftover Mineral Walls detected!"))
			mineral_all_mined = FALSE
			break

	all_cleared = mineral_all_mined

	//This the next two PREVENT the slab from being made, we dont want to have ameridiancrystal stuck in walls nor people
	for(var/mob/living/SPECTOR in work_area.contents)
		if(SPECTOR)
			to_chat(user, SPAN_NOTICE("Lifeforms detected in the mining area!"))
			passes_checked = FALSE
			break

	for(var/obj/structure/ameridian_crystal/AC in work_area.contents)
		if(AC)
			to_chat(user, SPAN_NOTICE("Crystals detected in the mining area!"))
			passes_checked = FALSE
			break

	return passes_checked

/obj/machinery/mining/slab_consol/proc/process_new_slab(mob/user)
	var/area/work_area = get_area(get_step(src, dir)) //Yes do this again
	if(all_cleared)
		all_cleared = FALSE
		stored_points += point_reward
		if(isliving(user))
			var/mob/living/clearer = user
			clearer.learnt_tasks.attempt_add_task_mastery(/datum/task_master/task/slab_clearer, "SLAB_CLEARER", skill_gained = 1, learner = clearer)

	if(first_time) //"Why not just map it filled in?" then you dont get the dymantic rng + furture proofing, you goof! You fool, you baffoon, you silly person you for asking that!
		first_time = FALSE
		stored_points = 0

	//Quite bad at statistics so grain of salt ya? - Trilby
	//60 out of 450 so 8ish% chance of nothing (refills soil digging)
	//250 out of 450 so 71ish% chance of normal rockwalls basically useless
	//139 out of 450 so 19ish% to be mineral wall could be any materal - as of commiting the weights are 100% to spawn with
	//list(ORE_URANIUM = 5, ORE_PLATINUM = 5, ORE_IRON = 35, ORE_CARBON = 35, ORE_DIAMOND = 1, ORE_GOLD = 5, ORE_SILVER = 5, ORE_PLASMA = 10, ORE_HYDROGEN = 1)

	//And then a 1 out of 300 or about 0.3% chance of a rocky friend :3c
	for(var/turf/simulated/floor/asteroid/MS in work_area.contents)
		switch (pickweight(list("nothing" = 60, "rockwall" = 499, "mineral_wall" = 139, "ameridian_crystal" = 1)))
			if("nothing")
				if(MS.dug)
					MS.dug = FALSE
			if("mineral_wall")
				new /obj/effect/flooring_type_spawner/mining_wall_oreful(MS)
			if("rockwall")
				new /obj/effect/flooring_type_spawner/mining_wall(MS)
			if("ameridian_crystal")
				new /obj/random/structures/ameridian_crystal(MS)
