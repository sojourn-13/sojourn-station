/mob/living/carbon/superior_animal/proc/check_AI_act()
	if ((stat != CONSCIOUS) || !canmove || resting || lying || stasis || client || grabbed_by_friend)
		stance = HOSTILE_STANCE_IDLE
		target_mob = null
		lost_sight = FALSE
		target_location = null
		SSmove_manager.stop_looping(src)
		return

	return 1

/*

/mob/living/carbon/superior_animal/Life()
	. = ..()

	moved = FALSE

	objectsInView = null

	if(client || AI_inactive)
		return

	//CONSCIOUS UNCONSCIOUS DEAD

	if (!check_AI_act())
		return

	if(stance == HOSTILE_STANCE_IDLE)
		if (!busy) // if not busy with a special task
			stop_automated_movement = 0
		target_mob = findTarget()
		if (target_mob)
			stance = HOSTILE_STANCE_ATTACK

	if(stance == HOSTILE_STANCE_ATTACK)
		if(destroy_surroundings)
			destroySurroundings()
		if(!ranged)
			stop_automated_movement = 1
			stance = HOSTILE_STANCE_ATTACKING
			set_glide_size(DELAY2GLIDESIZE(move_to_delay))
			walk_to(src, target_mob, 1, move_to_delay)
			moved = 1
		if(ranged)
			stop_automated_movement = 1
			if(get_dist(src, target_mob) <= comfy_range)
				stance = HOSTILE_STANCE_ATTACKING
				return //We do a safty return
			else
				set_glide_size(DELAY2GLIDESIZE(move_to_delay))
				walk_to(src, target_mob, 4, move_to_delay)
			stance = HOSTILE_STANCE_ATTACKING

	if(stance == HOSTILE_STANCE_ATTACKING)
		if(destroy_surroundings)
			destroySurroundings()
		if(!ranged)
			prepareAttackOnTarget()
		if(ranged)
			if(get_dist(src, target_mob) <= 6)
				OpenFire(target_mob)
			else
				set_glide_size(DELAY2GLIDESIZE(move_to_delay))
				walk_to(src, target_mob, 4, move_to_delay)
				OpenFire(target_mob)

	//random movement
	if(wander && !stop_automated_movement && !anchored)
		if(isturf(src.loc) && !resting && !buckled && canmove)
			turns_since_move++
			if(turns_since_move >= turns_per_move)
				if(!(stop_automated_movement_when_pulled && pulledby))
					var/moving_to = pick(cardinal)
					set_dir(moving_to)
					step_glide(src, moving_to, DELAY2GLIDESIZE(0.5 SECONDS))
					turns_since_move = 0

	//Speaking
	if(speak_chance && prob(speak_chance))
		visible_emote(emote_see)

	if((following) && !(findTarget())) // Are we following someone and not attacking something?
		walk_to(src, following, follow_distance, move_to_delay) // Follow the mob referenced in 'following' and stand almost next to them.

	if(!following && !(findTarget())) // Stop following
		walk_to(src, 0)

*/

/mob/living/carbon/superior_animal/handle_chemicals_in_body()
	if(reagent_immune)
		return FALSE
	if(reagents)
		chem_effects.Cut()
		analgesic = 0

		//If a mob dosnt have one of these then something is wrong with that mob!
		touching.metabolize()
		ingested.metabolize()
		bloodstr.metabolize()

		metabolism_effects.process()

		if(CE_PAINKILLER in chem_effects)
			analgesic = chem_effects[CE_PAINKILLER]

	if(status_flags & GODMODE)
		return FALSE

	if(light_dam)
		var/light_amount = 0
		if(isturf(loc))
			var/turf/T = loc
			light_amount = round((T.get_lumcount()*10)-5)

		if(light_amount > light_dam) //if there's enough light, start dying
			take_overall_damage(1,1)
		else //heal in the dark
			heal_overall_damage(1,1)

	// nutrition decrease
	if(stat != DEAD)
		if (hunger_factor && (nutrition > 0))
			nutrition = max (0, nutrition - hunger_factor)

	updatehealth()
