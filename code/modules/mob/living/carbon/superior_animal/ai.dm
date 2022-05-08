
//NOTE: Don't use this proc for finding specific mobs or a very certain object; ultilize GLOBs instead of view()/mob/living/carbon/superior_animal/proc/getObjectsInView()
/mob/living/carbon/superior_animal/proc/getObjectsInView()
	objectsInView = objectsInView || view(src, viewRange)
	return objectsInView

//Use this for all mobs per zlevel, get_dist() checked
/mob/living/carbon/superior_animal/proc/getPotentialTargets()
	var/turf/T = get_turf(src)
	if(!T)
		return //We're contained inside something, a locker perhaps.
	return hearers(src, viewRange)


	/* There was an attempt at optimization, but it was unsanitized, and was more expensive than just checking hearers.
	var/list/list_to_return = new
	for(var/atom/thing in SSmobs.mob_living_by_zlevel[((get_turf(src)).z)])
		if(get_dist(src, thing) <= viewRange)
			list_to_return += thing
	return list_to_return*/

/mob/living/carbon/superior_animal/proc/findTarget()
	var/list/filteredTargets = new

	for(var/atom/O in getPotentialTargets())
		if (isValidAttackTarget(O))
			filteredTargets += O

	for (var/obj/mecha/M in GLOB.mechas_list)
		if ((M.z == src.z) && (get_dist(src, M) <= viewRange) && isValidAttackTarget(M))
			filteredTargets += M

	return safepick(nearestObjectsInList(filteredTargets, src, acceptableTargetDistance))

/mob/living/carbon/superior_animal/proc/attemptAttackOnTarget()
	var/atom/targetted_mob = (target_mob?.resolve())

	if(isnull(targetted_mob))
		return

	if (!Adjacent(targetted_mob))
		return

	return UnarmedAttack(targetted_mob,1)

/mob/living/carbon/superior_animal/proc/prepareAttackOnTarget()
	var/atom/targetted_mob = (target_mob?.resolve())

	if (isnull(targetted_mob))
		return

	stop_automated_movement = 1

	if (!(targetted_mob) || !isValidAttackTarget(targetted_mob))
		loseTarget()
		return

	if ((get_dist(src, targetted_mob) >= viewRange) || src.z != targetted_mob.z && !istype(targetted_mob, /obj/mecha))
		loseTarget()
		return

	attemptAttackOnTarget()

/mob/living/carbon/superior_animal/proc/loseTarget()
	stop_automated_movement = 0
	walk(src, 0)
	target_mob = null
	stance = HOSTILE_STANCE_IDLE

/mob/living/carbon/superior_animal/proc/isValidAttackTarget(var/atom/O)

	if (isliving(O))
		var/mob/living/L = O
		if((L.stat != CONSCIOUS) || (L.health <= (ishuman(L) ? HEALTH_THRESHOLD_CRIT : 0)) || (!attack_same && (L.faction == src.faction)) || (L in friends))
			return
		if(L.friendly_to_colony && src.friendly_to_colony) //If are target and areselfs have the friendly to colony tag, used for chtmant protection
			return
		return 1

	if (istype(O, /obj/mecha))
		var/obj/mecha/M = O
		return isValidAttackTarget(M.occupant)

	if (istype(O, /obj/machinery/mining/drill))
		return isValidAttackTarget(O)

/mob/living/carbon/superior_animal/proc/destroySurroundings() //todo: make this better - Trilby
/*
			if (obstacle.dir == reverse_dir[dir]) // this here is so we can target what were are attacking
*/

	if (prob(break_stuff_probability))

		for (var/obj/structure/window/obstacle in src.loc) // To destroy directional windows that are on the creature's tile
			obstacle.attack_generic(src,rand(melee_damage_lower,melee_damage_upper),attacktext)
			return

		for (var/obj/machinery/door/window/obstacle in src.loc) // To destroy windoors that are on the creature's tile
			obstacle.attack_generic(src,rand(melee_damage_lower,melee_damage_upper),attacktext)
			return

		for (var/dir in cardinal) // North, South, East, West
			for (var/obj/structure/window/obstacle in get_step(src, dir))
				if ((obstacle.is_full_window()) || (obstacle.dir == reverse_dir[dir])) // So that directional windows get smashed in the right order
					obstacle.attack_generic(src,rand(melee_damage_lower,melee_damage_upper),attacktext)
					return

			for (var/obj/machinery/door/window/obstacle in get_step(src, dir))
				if (obstacle.dir == reverse_dir[dir]) // So that windoors get smashed in the right order
					obstacle.attack_generic(src,rand(melee_damage_lower,melee_damage_upper),attacktext)
					return

			for(var/obj/structure/closet/obstacle in get_step(src, dir))//A locker as a block? We will brake it.
				if(obstacle.opened == FALSE || obstacle.density == TRUE) //Are we closed or dence? then attack!
					obstacle.attack_generic(src,rand(melee_damage_lower,melee_damage_upper),attacktext)
					return

			for(var/obj/structure/table/obstacle in get_step(src, dir))//Tables do not save you.
				if(obstacle.density == TRUE) //In cases were its flipped and its walking past it
					obstacle.attack_generic(src,rand(melee_damage_lower,melee_damage_upper),attacktext)
					return

			for(var/obj/structure/low_wall/obstacle in get_step(src, dir))//This is only a miner issue... We will brake it
				if(obstacle.density == TRUE) //Almost never will do anything, but in cases were theirs a non-dence lower wall
					obstacle.attack_generic(src,rand(melee_damage_lower,melee_damage_upper) * 3,attacktext) //Lots of health
					return

			for(var/obj/structure/girder/obstacle in get_step(src, dir))//We know your tricks, they will now fail.
				if(obstacle.density == TRUE)
					obstacle.attack_generic(src,rand(melee_damage_lower,melee_damage_upper) * 2,attacktext) //A bit of health
					return

			for(var/obj/structure/railing/obstacle in get_step(src, dir))//Bulkwork defence... Easy to brake
				if(obstacle.density == TRUE)
					obstacle.attack_generic(src,rand(melee_damage_lower,melee_damage_upper),attacktext)
					return

			for(var/obj/mecha/obstacle in get_step(src, dir))//Hmm, notable but not everlasting.
				if(obstacle.density == TRUE) //will always likely be dence but in cases were its somehow not
					obstacle.attack_generic(src,rand(melee_damage_lower,melee_damage_upper),attacktext)
					return

			for(var/obj/structure/barricade/obstacle in get_step(src, dir))//Steel will not stop us, then why would planks?
				if(obstacle.density == TRUE)
					obstacle.attack_generic(src,rand(melee_damage_lower,melee_damage_upper),attacktext)
					return

			for(var/obj/machinery/deployable/obstacle in get_step(src, dir))//Steel will not stop us, then why would planks?
				if(obstacle.density == TRUE)
					obstacle.attack_generic(src,rand(melee_damage_lower,melee_damage_upper),attacktext)
					return

			for(var/obj/structure/grille/obstacle in get_step(src, dir))//An insult to defences... We will make you pay
				if(obstacle.density == TRUE)
					obstacle.attack_generic(src,rand(melee_damage_lower,melee_damage_upper),attacktext)
					return

			for(var/obj/machinery/door/obstacle in get_step(src,dir)) //Doors, will stop us when closed, but we will brake it
				if(obstacle.density == TRUE)
					obstacle.attack_generic(src,rand(melee_damage_lower,melee_damage_upper),attacktext)
					return

			for(var/obj/structure/plasticflaps/obstacle in get_step(src,dir)) //Weak plastic will not bar us
				if(obstacle.density == TRUE)
					obstacle.attack_generic(src,rand(melee_damage_lower,melee_damage_upper),attacktext)
					return

			for(var/obj/structure/shield_deployed/obstacle in get_step(src,dir))
				obstacle.attack_generic(src,rand(melee_damage_lower,melee_damage_upper),attacktext)
				return

/mob/living/carbon/superior_animal/hear_say(var/message, var/verb = "says", var/datum/language/language = null, var/alt_name = "", var/italics = 0, var/mob/living/speaker = null, var/sound/speech_sound, var/sound_vol, speech_volume)
	..()
	if(obey_check(speaker)) // Are we only obeying the one talking?
		if(findtext(message, "Follow") && findtext(message, "[src.name]") && !following && !anchored) // Is he telling us to follow?
			following = speaker
			visible_emote("[follow_message]")
		if(findtext(message, "Stop") && findtext(message, "[src.name]") && following) // Else, is he telling us to stop?
			following = null
			visible_emote("[stop_message]")

// Check if we obey the person talking.
/mob/living/carbon/superior_animal/proc/obey_check(var/mob/living/speaker = null)
	if(!obey_friends) // Are we following anyone who ask?
		return TRUE // We obey them

	if(speaker in friends) // Is the one talking a friend?
		return TRUE

	return FALSE

//Putting this here do to no idea were it would fit other then here
/mob/living/carbon/superior_animal/verb/toggle_AI()
	set name = "Toggle AI"
	set desc = "Toggles on/off the mobs AI."
	set category = "Mob verbs"

	if (AI_inactive)
		activate_ai()
		to_chat(src, SPAN_NOTICE("You toggle the mobs default AI to ON."))
		return
	else
		AI_inactive = TRUE
		to_chat(src, SPAN_NOTICE("You toggle the mobs default AI to OFF."))
