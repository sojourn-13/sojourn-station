
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

/mob/living/carbon/superior_animal/proc/findTarget(prioritizeCurrent = FALSE)

	if (prioritizeCurrent)
		if (target_mob)
			if (prob(retarget_chance))
				return //if we already have a target_mob and we want to not untarget, lets just return

	var/list/filteredTargets = list()

	var/turf/our_turf = get_turf(src)
	if (our_turf) //If we're not in anything, continue
		for(var/mob/living/target_mob in hearers(src, viewRange)) //as anything : Removed do optimization
			if(isValidAttackTarget(target_mob))
				if(target_mob.target_dummy && prioritize_dummies) //Target me over anyone else
					return target_mob
				filteredTargets += target_mob

		for(var/obj/machinery/tesla_turret/tesla_turret in view(src, viewRange))
			if(isValidAttackTarget(tesla_turret))
				filteredTargets += tesla_turret

		for(var/obj/machinery/porta_turret/porta_turret in view(src, viewRange))
			if(isValidAttackTarget(porta_turret))
				filteredTargets += porta_turret

		for(var/obj/machinery/power/os_turret/os_turret in view(src, viewRange))
			if(isValidAttackTarget(os_turret))
				filteredTargets += os_turret

		for(var/obj/mecha/M in GLOB.mechas_list)
			//As goofy as this looks its more optimized as were not looking at every mech outside are z-level if they are around us. - Trilby
			if(M.z == z)
				if(get_dist(src, M) <= viewRange)
					if(isValidAttackTarget(M))
						filteredTargets += M

	var/atom/filteredTarget = safepick(getTargets(filteredTargets, src))

	if ((filteredTarget != target_mob) && filteredTarget)
		doTargetMessage()

	if (filteredTarget)
		target_location = WEAKREF(get_turf(filteredTarget))

	return filteredTarget

/// Returns a list of objects, using a method dependant on the prioritization_type var of the mob.
/mob/living/carbon/superior_animal/proc/getTargets(list/L, sourceLocation)
	if (L.len == 1)
		return L.Copy()

	switch(prioritization_type)
		if (RANDOM)
			return L
		if (CLOSEST)
			return getClosestObjects(L, sourceLocation, viewRange)
		if (FURTHEST)
			return getFurthestObjects(L, sourceLocation, viewRange)

/mob/living/carbon/superior_animal/proc/attemptAttackOnTarget()
	var/atom/targetted_mob = (target_mob?.resolve())

	if(weakened) return

	if(isnull(targetted_mob))
		return

	if(!Adjacent(targetted_mob))
		return

	return UnarmedAttack(targetted_mob,1)

/mob/living/carbon/superior_animal/proc/prepareAttackOnTarget()
	var/atom/targetted_mob = (target_mob?.resolve())

	if(weakened) return

	if (isnull(targetted_mob))
		return

	stop_automated_movement = 1

	if (!(targetted_mob) || !isValidAttackTarget(targetted_mob))
		loseTarget()
		return

	if ((get_dist(src, targetted_mob) >= viewRange) || z != targetted_mob.z && !istype(targetted_mob, /obj/mecha))
		loseTarget()
		return
	if (check_if_alive())
		if (prepareAttackPrecursor(MELEE_TYPE, FALSE, FALSE, targetted_mob))
			addtimer(CALLBACK(src, PROC_REF(attemptAttackOnTarget)), delay_for_melee)


/mob/living/carbon/superior_animal/proc/loseTarget(stop_pursuit = TRUE, simply_losetarget = FALSE)
	if (stop_pursuit)
		stop_automated_movement = 0
		if (move_packet)
			var/datum/move_loop/our_loop = move_packet.existing_loops[SSmovement] //niko todo: replace with something better
			if (our_loop && our_loop.priority < MOVEMENT_PATHMODE_PRIORITY)
				SSmove_manager.stop_looping(src)
	if (!simply_losetarget)
		fire_delay = fire_delay_initial
		melee_delay = melee_delay_initial
		patience = patience_initial
		retarget_timer = retarget_timer_initial
		stance = HOSTILE_STANCE_IDLE
		delayed = delayed_initial
	lost_sight = FALSE
	target_mob = null
	target_location = null

/mob/living/carbon/superior_animal/proc/isValidAttackTarget(atom/O)

//Soj optimizations: Faster returns rather then mega returns
//Even if this looks a bit more mess and has more lines (sob) - Trilby

	if (isliving(O))
		var/mob/living/L = O
		if(L.stat != CONSCIOUS)
			return FALSE
		if(L.health <= (ishuman(L) ? HEALTH_THRESHOLD_CRIT : 0))
			return FALSE
		if((!attack_same && (L.faction == faction)) || (L in friends)) //just cuz your a friend dosnt mean it magically will no longer attack same
			return FALSE
		if(L.friendly_to_colony && friendly_to_colony) //If are target and areselfs have the friendly to colony tag, used for chtmant protection
			return FALSE
		return TRUE

	if (istype(O, /obj/mecha))
		if (can_see(src, O, get_dist(src, O))) //can we even see it?
			var/obj/mecha/M = O
			return isValidAttackTarget(M.occupant)

	if (istype(O, /obj/machinery/tesla_turret))
		var/obj/machinery/tesla_turret/TT = O
		if(TT.stat & (BROKEN | NOPOWER))
			return FALSE
		if(TT.colony_allied_turret && friendly_to_colony) //dont target your own turret unless they are haywire
			return FALSE
		if(!TT.colony_allied_turret && !friendly_to_colony) //its on are side!
			return FALSE
		return TRUE

	if (istype(O, /obj/machinery/power/os_turret))
		var/obj/machinery/power/os_turret/OST = O
		if(OST.faction_iff == faction) //What are you doing fool?!
			return FALSE
		if(OST.stat & (BROKEN | NOPOWER))
			return FALSE
		if(!OST.should_target_players && friendly_to_colony) //dont target your own turret unless they are haywire
			return FALSE
		return TRUE

	if (istype(O, /obj/machinery/porta_turret))
		var/obj/machinery/porta_turret/PO = O
		if(PO.faction_iff == faction) //What are you doing fool?!
			return FALSE
		if(PO.stat & (BROKEN | NOPOWER))
			return FALSE
		if(PO.colony_allied_turret && friendly_to_colony)
			return FALSE
		//So we dont try and attack turrets that are not attacking us
		if(!PO.colony_allied_turret && !friendly_to_colony)
			return FALSE
		return TRUE

	return FALSE


/mob/living/carbon/superior_animal/proc/destroySurroundings() //todo: make this better - Trilby
/*
			if (obstacle.dir == reverse_dir[dir]) // this here is so we can target what were are attacking
*/

	if (prob(break_stuff_probability))

		for (var/obj/structure/window/obstacle in loc) // To destroy directional windows that are on the creature's tile
			obstacle.attack_generic(src,rand(melee_damage_lower,melee_damage_upper),pick(attacktext))
			return

		for (var/obj/machinery/door/window/obstacle in loc) // To destroy windoors that are on the creature's tile
			obstacle.attack_generic(src,rand(melee_damage_lower,melee_damage_upper),pick(attacktext))
			return

		for (var/dir in cardinal) // North, South, East, West
			for (var/obj/structure/window/obstacle in get_step(src, dir))
				if ((obstacle.is_full_window()) || (obstacle.dir == reverse_dir[dir])) // So that directional windows get smashed in the right order
					obstacle.attack_generic(src,rand(melee_damage_lower,melee_damage_upper),pick(attacktext))
					return

			for (var/obj/machinery/door/window/obstacle in get_step(src, dir))
				if (obstacle.dir == reverse_dir[dir]) // So that windoors get smashed in the right order
					obstacle.attack_generic(src,rand(melee_damage_lower,melee_damage_upper),pick(attacktext))
					return

			for(var/obj/structure/closet/obstacle in get_step(src, dir))//A locker as a block? We will brake it.
				if(obstacle.opened == FALSE || obstacle.density == TRUE) //Are we closed or dence? then attack!
					obstacle.attack_generic(src,rand(melee_damage_lower,melee_damage_upper),pick(attacktext))
					return

			for(var/obj/structure/table/obstacle in get_step(src, dir))//Tables do not save you.
				if(obstacle.density == TRUE) //In cases were its flipped and its walking past it
					obstacle.attack_generic(src,rand(melee_damage_lower,melee_damage_upper),pick(attacktext))
					return

			for(var/obj/structure/low_wall/obstacle in get_step(src, dir))//This is only a miner issue... We will brake it
				if(obstacle.density == TRUE) //Almost never will do anything, but in cases were theirs a non-dence lower wall
					obstacle.attack_generic(src,rand(melee_damage_lower,melee_damage_upper) * 3,pick(attacktext)) //Lots of health
					return

			for(var/obj/structure/girder/obstacle in get_step(src, dir))//We know your tricks, they will now fail.
				if(obstacle.density == TRUE)
					obstacle.attack_generic(src,rand(melee_damage_lower,melee_damage_upper) * 2,pick(attacktext)) //A bit of health
					return

			for(var/obj/structure/railing/obstacle in get_step(src, dir))//Bulkwork defence... Easy to brake
				if(obstacle.density == TRUE)
					obstacle.attack_generic(src,rand(melee_damage_lower,melee_damage_upper),pick(attacktext))
					return

			for(var/obj/mecha/obstacle in get_step(src, dir))//Hmm, notable but not everlasting.
				if(obstacle.density == TRUE) //will always likely be dence but in cases were its somehow not
					obstacle.attack_generic(src,rand(melee_damage_lower,melee_damage_upper),pick(attacktext))
					return

			for(var/obj/structure/barricade/obstacle in get_step(src, dir))//Steel will not stop us, then why would planks?
				if(obstacle.density == TRUE)
					obstacle.attack_generic(src,rand(melee_damage_lower,melee_damage_upper),pick(attacktext))
					return

			for(var/obj/machinery/deployable/obstacle in get_step(src, dir))//Steel will not stop us, then why would planks?
				if(obstacle.density == TRUE)
					obstacle.attack_generic(src,rand(melee_damage_lower,melee_damage_upper),pick(attacktext))
					return

			for(var/obj/structure/grille/obstacle in get_step(src, dir))//An insult to defences... We will make you pay
				if(obstacle.density == TRUE)
					obstacle.attack_generic(src,rand(melee_damage_lower,melee_damage_upper),pick(attacktext))
					return

			for(var/obj/machinery/door/obstacle in get_step(src,dir)) //Doors, will stop us when closed, but we will brake it
				if(obstacle.density == TRUE)
					obstacle.attack_generic(src,rand(melee_damage_lower,melee_damage_upper),pick(attacktext))
					return

			for(var/obj/structure/plasticflaps/obstacle in get_step(src,dir)) //Weak plastic will not bar us
				if(obstacle.density == TRUE)
					obstacle.attack_generic(src,rand(melee_damage_lower,melee_damage_upper),pick(attacktext))
					return

			for(var/obj/structure/shield_deployed/obstacle in get_step(src,dir))
				obstacle.attack_generic(src,rand(melee_damage_lower,melee_damage_upper),pick(attacktext))
				return

			for(var/obj/machinery/tesla_turret/obstacle in get_step(src,dir)) //Weak plastic will not bar us
				if(obstacle.density == TRUE)
					obstacle.attack_generic(src,rand(melee_damage_lower,melee_damage_upper),pick(attacktext))
					return

/mob/living/carbon/superior_animal/hear_say(var/message, var/verb = "says", var/datum/language/language = null, var/alt_name = "", var/italics = 0, var/mob/living/speaker = null, var/sound/speech_sound, var/sound_vol, speech_volume)
	..()
	if(obey_check(speaker)) // Are we only obeying the one talking?
		if(findtext(message, "Follow") && findtext(message, "[name]") && !following && !anchored) // Is he telling us to follow?
			following = speaker
			last_followed = speaker
			visible_emote("[follow_message]")
		if(findtext(message, "Stop") && findtext(message, "[name]") && following) // Else, is he telling us to stop?
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

/**
 * Signal handler. Called whenever a superior mob is attacked.
 * On base, will target the mob that attacked them if they dont currently have a target.
 *
 * Args:
 * source: src.
 * obj/item/attacked_with: The item they were attacked with. Optional.
 * atom/attacker: The atom that attacked them. Optional.
 * params: A legacy arg that I only added because a proc that would send this signal had that arg.
**/
/mob/living/carbon/superior_animal/proc/react_to_attack(var/mob/living/carbon/superior_animal/source = src, var/obj/item/attacked_with, var/atom/attacker, params)
	SIGNAL_HANDLER

	if (attacked_with && (isprojectile(attacked_with)))
		var/obj/item/projectile/Proj = attacked_with
		if (Proj.testing) //sanity
			return FALSE

	if (!react_to_attack)
		return FALSE

	if (attacker && !target_mob) //no target? target this guy
		if (isValidAttackTarget(attacker))
			var/atom/new_target = attacker
			var/atom/new_target_location = get_turf(attacker)
			var/distance = (get_dist(src, attacker))
			if (distance > viewRange) // are they out of our viewrange? TODO: maybe add a see/hear check
				new_target_location = target_outside_of_view_range(attacker, distance) //this is where we think they might be
			target_mob = WEAKREF(new_target)
			target_location = WEAKREF(new_target_location)

			lost_sight = TRUE //not sure if this is necessary

			if (retaliation_type)
				if (retaliation_type & APPROACH_ATTACKER)
					if (stat != DEAD)
						INVOKE_ASYNC(SSmove_manager, /datum/controller/subsystem/move_manager/proc/move_to, src, target_location, (comfy_range - comfy_distance), move_to_delay)


/mob/living/carbon/superior_animal/proc/movement_tech()
	moved = TRUE