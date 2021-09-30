/mob/living/carbon/superior_animal/robot/mining
	name = "Generic Mining Drone"
	desc = "A small, unbranded drone, it has a drill and a deep thirst for shiny rocks."
	gender = NEUTER
	icon = 'icons/mob/battle_roomba.dmi'
	icon_state = "mining_drone"
	faction = "neutral"
	viewRange = 6
	move_to_delay = 3
	randpixel = 0
	mob_size = MOB_SMALL
	do_gibs = TRUE
	light_range = 5
	light_color = COLOR_LIGHTING_CYAN_BRIGHT
	cleaning = FALSE

	// Unique vars
	var/target // Where we want to go
	var/wandering = TRUE // Do we wandering around?
	var/pickup = TRUE // Do we pick up the ore?
	var/mining = TRUE // Do we mine rocks?

/mob/living/carbon/superior_animal/robot/mining/examine(mob/user)
	..()
	to_chat(user, SPAN_NOTICE("[src]'s screen flashes and show \his operating parameters : "))
	to_chat(user, SPAN_NOTICE("	Wandering : [wandering ? "Active" : "Not Active"]"))
	to_chat(user, SPAN_NOTICE("	Ore Gathering : [pickup ? "Active" : "Not Active"]"))
	to_chat(user, SPAN_NOTICE("	Mining : [mining ? "Active" : "Not Active"]"))

/mob/living/carbon/superior_animal/robot/mining/Life()
	..()

	if(!look_around() && wandering) // If we didn't find anything of value and can wandering
		target = pick(oview(viewRange + 1, src)) // Go somewhere random

	// Are we going to a minable turf despite not being supposed to?
	if(istype(target, /turf/simulated/mineral && !mining))
		target = null // reset the target

	// Are we going to ores on the ground despite not being supposed to?
	if(istype(target, /obj/item/ore && !pickup))
		target = null // reset the target

	if(target) // Do we have a destination?
		walk_to(src, target, 1, move_to_delay) // Go there
	else
		walk_to(src, 0) // Or else stop

/mob/living/carbon/superior_animal/robot/mining/death()
	drop_loot()
	..()

/mob/living/carbon/superior_animal/robot/mining/attack_hand(mob/user as mob)
	if(user.a_intent == I_HELP) // Are we on help intent?
		var/possible_choices = list("Wandering", "Ore Gathering", "Ore Mining")
		var/choice = input(user, "Which parameter do you want to toggle in the mining bot?", "Parameters", null) as null|anything in possible_choices
		switch(choice)
			if("Wandering")
				wandering = !wandering
				to_chat(user, "[src] will [wandering ? "" : "no longer"] wander.")
			if("Ore Gathering")
				pickup = !pickup
				to_chat(user, "[src] will [pickup ? "" : "no longer"] take ore on the ground.")
			if("Ore Mining")
				mining = !mining
				to_chat(user, "[src] will [mining ? "" : "no longer"] mine ore.")
	else ..()

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
		if(mining && istype(O, /turf/simulated/mineral)) // Is it a turf?
			var/turf/simulated/mineral/M = O
			if(M.mineral) // Does it have stuff to mine?
				mine(M) // Mine the turf
				target = null
				. = TRUE // We'll return later, keep looping.
				continue

		if(pickup && istype(O, /obj/item/ore)) // Is it ore on the ground?
			var/obj/item/ore/Ore = O
			pick_ore(Ore) // Pick it up
			target = null
			. = TRUE // We'll return later, keep looping.
			continue

	if(.) // Did we mine or pick up stuff earlier on?
		return . // return TRUE

	for(var/O in oview(viewRange, src)) // Check everything we can see
		if(pickup && istype(O, /obj/item/ore)) // Is it ore on the ground?
			var/obj/item/ore/Ore = O
			target = Ore // Let's go there
			return TRUE

		if(mining && istype(O, /turf/simulated/mineral)) // Is it a turf?
			var/turf/simulated/mineral/M = O
			if(M.mineral) // Does it have stuff to mine?
				target = M // We want to go to M
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
	visible_message("[src] empties \his storage bin.") // Visible message
	var/turf/T = get_turf(src)
	for(var/obj/O in contents) // Empty everything
		O.forceMove(T) // Move the item on the ground
	return TRUE
