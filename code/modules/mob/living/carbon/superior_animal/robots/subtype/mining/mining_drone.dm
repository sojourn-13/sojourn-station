/mob/living/carbon/superior_animal/robot/mining
	name = "\improper Generic Mining Drone"
	desc = "A small, unbranded drone, it has a drill and seem to search for shiny stuff."
	gender = NEUTER
	icon = 'icons/mob/battle_roomba.dmi'
	icon_state = "mining_drone"
	faction = "neutral"
	viewRange = 6
	move_to_delay = 3
	randpixel = 0
	mob_size = MOB_SMALL
	do_gibs = TRUE

	// Unique vars
	var/target // Where we want to go

/mob/living/carbon/superior_animal/robot/mining/Life()
	..()
	if(!look_around()) // If we didn't find anything of value
		target = pick(oview(viewRange + 1, src)) // Go somewhere random

	if(target) // Do we have a destination?
		walk_to(src, target, 1, move_to_delay) // Go there
	else
		walk_to(src, 0) // Or else stop

/mob/living/carbon/superior_animal/robot/mining/attackby(obj/item/W as obj, mob/user as mob)
	var/obj/item/T // Define the tool variable early on to avoid compilation problem and to allow us to use tool-unique variables
	if(user.a_intent == I_HELP) // Are we helping ?

		// If it is a tool, assign it to the tool variable defined earlier.
		if(istype(W, /obj/item/tool))
			T = W

		if(QUALITY_PULSING in T.tool_qualities) // We pulse the drone to get the loot
			drop_loot() // Drop the loot
			return

	// If nothing was ever triggered, continue as normal
	..()

/mob/living/carbon/superior_animal/robot/mining/proc/look_around()
	for(var/O in oview(1, src)) // Check our surroundings.
		if(istype(O, /turf/simulated/mineral)) // Is it a turf?
			var/turf/simulated/mineral/M = O
			if(M.mineral) // Does it have stuff to mine?
				mine(M) // Mine the turf
				target = null
				. = TRUE // We'll return later, keep looping.
				continue

		if(istype(O, /obj/item/ore)) // Is it ore on the ground?
			var/obj/item/ore/Ore = O
			pick_ore(Ore) // Pick it up
			target = null
			. = TRUE // We'll return later, keep looping.
			continue

	if(.) // Did we mine or pick up stuff earlier on?
		return . // return TRUE

	for(var/O in oview(viewRange, src)) // Check everything we can see
		if(istype(O, /turf/simulated/mineral)) // Is it a turf?
			var/turf/simulated/mineral/M = O
			if(M.mineral) // Does it have stuff to mine?
				target = M // We want to go to M
				return TRUE
		if(istype(O, /obj/item/ore)) // Is it ore on the ground?
			var/obj/item/ore/Ore = O
			target = Ore // Let's go there
			return TRUE

/mob/living/carbon/superior_animal/robot/mining/proc/mine(var/turf/simulated/mineral/M)
	visible_message("[src] mine [M]") // Visible message
	M.GetDrilled() // Mine the turf
	return TRUE

/mob/living/carbon/superior_animal/robot/mining/proc/pick_ore(var/obj/item/ore/O)
	visible_message("[src] pick up [O]") // Visible message
	O.forceMove(src) // Pick up the item
	return TRUE

/mob/living/carbon/superior_animal/robot/mining/proc/drop_loot()
	visible_message("[src] empty \his storage bin.") // Visible message
	var/turf/T = get_turf(src)
	for(var/obj/O in contents) // Empty everything
		O.forceMove(T) // Move the item on the ground
	return TRUE
