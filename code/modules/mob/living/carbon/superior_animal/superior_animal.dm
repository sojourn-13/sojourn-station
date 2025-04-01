// superior_animal and definition moved to superior_defines.dm
/mob/living/carbon/superior/New()
	..()
	if(!icon_living)
		icon_living = icon_state
	if(!icon_dead)
		icon_dead = "[icon_state]_dead"

	objectsInView = new

	full_reload_message  = "[reload_message]"
	reload_message = "[name] [full_reload_message]"

	remove_verb(src, /mob/verb/observe)
	pixel_x = RAND_DECIMAL(-randpixel, randpixel)
	pixel_y = RAND_DECIMAL(-randpixel, randpixel)

	GLOB.superior_animal_list += src

	for(var/language as anything in known_languages)
		add_language(language)

/mob/living/carbon/superior/Initialize(var/mapload)
	if (get_stat_modifier)
		for (var/key as anything in allowed_stat_modifiers)
			var/datum/stat_modifier/mod = key
			if (initial(mod.stattags) & NOTHING_STATTAG)
				continue
			if (initial(mod.stattags) & DEFENSE_STATTAG)
				continue
			if ((!(initial(mod.stattags) & MELEE_STATTAG)) && (!ranged))
				allowed_stat_modifiers -= mod
				continue
			if ((!(initial(mod.stattags) & RANGED_STATTAG)) && (ranged))
				allowed_stat_modifiers -= mod
				continue

	.=..()
	if (mapload && can_burrow)
		find_or_create_burrow(get_turf(src))
		if (prob(extra_burrow_chance))
			create_burrow(get_turf(src))

	if(move_and_attack)
		RegisterSignal(src, COMSIG_MOVABLE_MOVED, PROC_REF(movement_tech))


	RegisterSignal(src, COMSIG_ATTACKED, PROC_REF(react_to_attack))

/mob/living/carbon/superior/Destroy()
	GLOB.superior_animal_list -= src

	target_mob = null

	LAZYCLEARLIST(objectsInView)
	LAZYCLEARLIST(friends)

	UnregisterSignal(src, COMSIG_ATTACKED)

	lastarea = null

	known_languages = null
	. = ..()

/mob/living/carbon/superior/u_equip(obj/item/W as obj)
	return

/mob/living/carbon/superior/proc/visible_emote(message)
	if(islist(message))
		message = safepick(message)
	if(message)
		visible_message("<span class='name'>[src]</span> [message]")

/mob/living/carbon/superior/update_icons()
	. = ..()
	if (stat == DEAD)
		icon_state = icon_dead
	else if ((stat == UNCONSCIOUS) || resting || lying)
		if (icon_rest)
			icon_state = icon_rest
		else
			if (icon_living)
				icon_state = icon_living
		add_new_transformation(/datum/transform_type/prone)
	else
		remove_transformation(PRONE_TRANSFORM)
		if (icon_living)
			icon_state = icon_living

/mob/living/carbon/superior/regenerate_icons()
	. = ..()
	update_icons()

/mob/living/carbon/superior/updateicon()
	. = ..()

/mob/living/carbon/superior/examine(mob/user)
	..()
	if (is_dead(src))
		to_chat(user, SPAN_DANGER("It is completely motionless, likely dead."))
	else if (health < maxHealth * 0.10)
		to_chat(user, SPAN_DANGER("It looks like they are on their last legs!"))
	else if (health < maxHealth * 0.20)
		to_chat(user, SPAN_DANGER("It's grievously wounded!"))
	else if (health < maxHealth * 0.30)
		to_chat(user, SPAN_DANGER("It's badly wounded!"))
	else if (health < maxHealth * 0.40)
		to_chat(user, SPAN_WARNING("Its wounds are mounting."))
	else if (health < maxHealth * 0.50)
		to_chat(user, SPAN_WARNING("It looks half dead."))
	else if (health < maxHealth * 0.60)
		to_chat(user, SPAN_WARNING("It looks like its been beaten up quite badly."))
	else if (health < maxHealth * 0.70)
		to_chat(user, SPAN_WARNING("It has accrued some lasting injuries."))
	else if (health < maxHealth * 0.80)
		to_chat(user, SPAN_WARNING("It has had minor damage done to it."))
	else if (health < maxHealth)
		to_chat(user, SPAN_WARNING("It has a few cuts and bruses."))

/**
 * To be used when we attempt to target a mob outside of view_range.
 * Args:
 * target: The target we are attempting to target.
 * distance: The distance between our target and us. Defaults to just that value. Here for override purposes.
 * target_mode: Defaults to target_out_of_sight_mode. Here for override purposes.
 *
 * If target_mode == ALWAYS_SEE, just returns target. If target_mode == GUESS_LOCATION_WITH_AREA, returns RANGE_TURFS, radius being the distance outside of viewrange.
 * Trims said list to remove any turfs that are dense, or turfs that have dense objects in them. If out_of_sight_turf_LOS_check is true, also removes and turfs
 * that fail a can_see check.
 *
 * If target_mode == GUESS_TARGET_WITH_LINE, does above, except it returns a list of turfs generated from a line drawn from the edge of viewrange to
 *
 * out_of_viewrange_line_distance_mult the distance from said distance to the target.
**/
/mob/living/carbon/superior/proc/target_outside_of_view_range(var/atom/target, distance = get_dist(src, target), target_mode = target_out_of_sight_mode)

	var/tiles_out_of_viewrange = (distance - viewRange) //self explanatory
	if (tiles_out_of_viewrange <= 0)
		return FALSE //they are within our viewrange

	var/list/possible_locations //initialize the var
	switch (target_mode)
		if (ALWAYS_SEE) // if this is true we can always detect our target
			return target

		if (GUESS_LOCATION_WITH_AURA)
			possible_locations = RANGE_TURFS(tiles_out_of_viewrange, target) // the further away the target, the more inaccurate our targetting

		if (GUESS_LOCATION_WITH_LINE, GUESS_LOCATION_WITH_END_OF_LINE)
			var/turf/viewrange_edge = get_turf_at_edge_of_viewRange(target)
			possible_locations = get_turfs_in_line_toward_target(viewrange_edge, target, out_of_viewrange_line_distance_mult)

			if (target_mode == GUESS_LOCATION_WITH_END_OF_LINE)
				if (out_of_sight_turf_LOS_check)
					for (var/i = possible_locations.len, i > 0, i--) //start from the last entry added
						var/atom/possible_location = possible_locations[i]
						if (can_see(possible_location, target, get_dist(possible_location, target))) //if this turf can see the target,
							return possible_location // this is a valid target
						else
							continue
				var/index = possible_locations.len
				return possible_locations[index] //return the last entry in the list

	for (var/turf/possible_location as anything in possible_locations) // iterate through each turf we are considering
		if (density == TRUE) // if the turf is dense, aka we cant walk through it...
			possible_locations -= possible_location // ...no way they're in it
			continue
		if (out_of_sight_turf_LOS_check)
			if (!(can_see(possible_location, target, get_dist(possible_location, target)))) // if it cant see the target...
				possible_locations -= possible_location // then theres no way the target was there
				continue
		for (var/atom/movable/entity in possible_location)
			if (entity.density == TRUE) //the 1st check but for the contents
				possible_locations -= possible_location
				continue

	return safepick(possible_locations) //return one at random

// branchless isincapacited check made for roaches.
/mob/living/carbon/superior/proc/cheap_incapacitation_check() // This works based off constants ,override it if you want it to be dynamic . Based off isincapacited
	return stunned > 0 || weakened > 0 || resting || pinned.len > 0 || stat || paralysis || sleeping || (status_flags & FAKEDEATH) || buckled() > 0

/*/mob/living/carbon/superior/update_lying_buckled_and_verb_status()

	if(cheap_incapacitation_check())
		lying = FALSE
		canmove = TRUE
	else
		canmove = FALSE
		if(buckled)
			anchored = buckled.buckle_movable
			lying = buckled.buckle_lying
	if(lying)
		set_density(FALSE)
	if(stat == DEAD)
		set_density(FALSE)
	else
		canmove = TRUE
		set_density(initial(density))*/

/mob/living/carbon/superior/proc/adjustFiringOffset(var/value)

	current_firing_offset += value

	return TRUE

/mob/living/carbon/superior/proc/resetFiringOffset()

	current_firing_offset = initial_firing_offset

	return TRUE

/mob/living/carbon/superior/proc/handle_ai()

	if(weakened)
		return

	if(ckey) //prevents players from having process on a mob theyre controlling
		return

	if (AI_inactive)
		return

	objectsInView = null

	//CONSCIOUS UNCONSCIOUS DEAD

	if (!check_AI_act())
		return

	var/atom/targetted_mob
	if (target_mob)
		targetted_mob = (target_mob?.resolve())
	if (!targetted_mob) //will be false if there is no target_mob or if the resolved value is null
		loseTarget()
	else if (!targetted_mob.check_if_alive(TRUE)) //else if because we dont want a runtime
		loseTarget()

	switch(stance)
		if(HOSTILE_STANCE_IDLE)
			if (!busy) // if not busy with a special task
				stop_automated_movement = FALSE
			if (!targetted_mob)
				target_mob = WEAKREF(findTarget()) //no target? try to find one
				targetted_mob = (target_mob?.resolve())
			if (targetted_mob) // is it still null?
				stance = HOSTILE_STANCE_ATTACK
				handle_hostile_stance(targetted_mob)

		if(HOSTILE_STANCE_ATTACK)
			handle_hostile_stance(targetted_mob)

		if(HOSTILE_STANCE_ATTACKING)
			if (delayed == 0) // is our targetting delayed still?
				delayed = delayed_initial // if not, reset the value
				handle_attacking_stance(targetted_mob) // and attack
			else
				delayed-- // decrement it, we'll check again next tick

	//random movement
	if(wander && !stop_automated_movement && !anchored)
		if(isturf(loc) && !resting && !buckled && canmove)
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

/mob/living/carbon/superior/proc/handle_hostile_stance(var/atom/targetted_mob) //here so we can jump instantly to it if hostile stance is established
	var/already_destroying_surroundings = FALSE
	var/calculated_walk = (comfy_range - comfy_distance) //the distance for walk_to() we will use on ranged mobs
	var/can_see = TRUE
	var/ran_see_check = FALSE
	if(destroy_surroundings)
		destroySurroundings()
		already_destroying_surroundings = TRUE //setting this var prevents double destruction when handle_attacking_stance is called

	var/mob/living/targetted_mob_real

	if (isliving(targetted_mob))
		targetted_mob_real = targetted_mob

	if (!ran_see_check)
		if (!(can_see_check(targetted_mob, targetted_mob_real)))
			can_see = FALSE
			lost_sight = TRUE
		ran_see_check = TRUE

	var/atom/targetted = targetted_mob

	if (!can_see)
		targetted = (target_location?.resolve())

	if(ranged)
		stop_automated_movement = TRUE
		stance = HOSTILE_STANCE_ATTACKING
		set_glide_size(DELAY2GLIDESIZE(move_to_delay))
		if (stat != DEAD)
			SSmove_manager.move_to(src, targetted_mob, calculated_walk, move_to_delay) //lets get a little closer than our optimal range

		if (delayed > 0)
			if (!(retarget_rush_timer > world.time)) //Only true if the timer is less than the world.time
				visible_message(SPAN_WARNING("[src] [target_telegraph] <font color = 'green'>[targetted]</font>!"), target = targetted, message_target = always_telegraph_to_target)
				delayed--
				return //return to end the switch early, so we delay our attack by one tick. does not happen if rush timer is less than world.time
			else
				visible_message(SPAN_WARNING("[src] [rush_target_telegraph] <font color = 'green'>[targetted]</font>!"), target = targetted, message_target = always_telegraph_to_target)

	else if (!ranged)
		stop_automated_movement = TRUE
		stance = HOSTILE_STANCE_ATTACKING
		set_glide_size(DELAY2GLIDESIZE(move_to_delay))
		if (stat != DEAD)
			SSmove_manager.move_to(src, targetted_mob, 1, move_to_delay)
	handle_attacking_stance(targetted_mob, already_destroying_surroundings, can_see, ran_see_check)

/mob/living/carbon/superior/proc/handle_attacking_stance(var/atom/targetted_mob, var/already_destroying_surroundings = FALSE, can_see = TRUE, ran_see_check = FALSE)
	var/calculated_walk = (comfy_range - comfy_distance) //the distance for walk_to() we will use on ranged mobs
	var/fire_through_lost_sight = FALSE //will we continue to fire, even if we cant see them?
	var/mob/targetted_mob_real = null // the true value of target_mob?.resolve(), if its a mob, needed for determining if we will use hearers or can_see in our see check
	var/target_location_resolved = (target_location?.resolve()) // we will target this if this tick's can_see is FALSE
	var/obj/item/projectile/trace // the projectile that ranged mobs use when testing trajectory

	retarget_rush_timer += ((world.time) + retarget_rush_timer_increment) //we put it here because we want mobs currently angry to be vigilant
	if(destroy_surroundings && !already_destroying_surroundings) // the second check prevents handle_hostile_stance from causing double destruction
		destroySurroundings()

	if (!(isburrow(targetted_mob))) //we dont want mobs failing to use the burrows
		// This block controls random retargetting

		if (ismob(targetted_mob))
			targetted_mob_real = targetted_mob

		else if (ismecha(targetted_mob))
			var/obj/mecha/targetted_mecha = targetted_mob
			if (targetted_mecha.occupant && ismob(targetted_mecha.occupant))
				targetted_mob_real = targetted_mecha.occupant

		if (!ran_see_check) //have we already run this check?
			can_see = can_see_check(targetted_mob, targetted_mob_real)
			ran_see_check = TRUE

		if (can_see)
			lost_sight = FALSE

		if (!lost_sight) // if we've, in a previous iteration of this proc, lost sight of our target, lets not update the location of the target
			target_location = WEAKREF(get_turf(targetted_mob)) //the choice to not just store the location unconditionally every tick is intentional, i want mobs to have a chance to reacquire their target
		target_location_resolved = (target_location?.resolve())
		if (retarget) // do we randomly retarget?
			var/retarget_prioritize = retarget_prioritize_current //local var so that we can make temporary changes
			if (retarget_timer <= 0) // has our timer reached its end?
				if (!can_see) // if so, we can remove the override so we dont target onto something we cant even see
					retarget_prioritize = FALSE //removing override
				var/target_mob_cache = target_mob //we store the value of target_mob so we can reference the new value with the previous value
				target_mob = WEAKREF(findTarget(retarget_prioritize)) // find a new target
				retarget_timer = retarget_timer_initial //reset the timer
				if (!target_mob) // if we found nothing...
					target_mob = target_mob_cache //...we have code for handling a mob we cant see
				else // if we found something...
					if (target_mob != target_mob_cache) //...and it isnt our last target...
						lost_sight = FALSE //...we can probably see them, since hearers() found them, and hearers() is the ideal see check
					targetted_mob = (target_mob?.resolve()) //regardless of the last if statement, we need to reset targetted_mob
			else
				retarget_timer-- //if it hasnt, lets decrement it and check next tick
		// This block controls losing line of sight and targetting the last known location of the enemy
		if (!can_see) // if we cant see our current target...
			if (patience <= 0)
				loseTarget()
				patience = patience_initial
				return
			else //this is where we handle mobs losing LOS and forgetting where the target is
				lost_sight = TRUE
				patience--

				if (wander_if_lost_sight)
					var/moving_to = pick(cardinal)
					set_dir(moving_to)
					step_glide(src, moving_to, DELAY2GLIDESIZE(0.5 SECONDS)) //we can potentially pathfind if we do this
			if (fire_through_walls)
				fire_through_lost_sight = TRUE
		else
			lost_sight = FALSE

		// This block only runs if the above can_see check is true, fires a trace projectile to see if we can hit our target
		if (projectiletype && advance) //are we allowed to advance?
			if (can_see || advance_if_cant_see) //if so, lets try to advance if we can see, or if we cant but we're allowed to advance if we cant see
				if (ranged) // 2. if we cant see, but!
					trace = check_trajectory_raytrace(targetted_mob, src, projectiletype)
					spawn(0) //the projectile needs time to process
					handle_trace_impact(trace, delete_trace = FALSE) //and now, we check to see if we should advance, using the trace

		//if (!can_see && (!fire_through_walls))
		//	return

		if (can_see)
			patience = patience_initial
		// This block controls our attack/range logic
		var/atom/targetted = targetted_mob
		if (!(targetted_mob.check_if_alive(TRUE)))
			loseTarget()
			return
		if (lost_sight)
			targetted = target_location_resolved
		if (stat == DEAD)
			return
		if(!ranged)
			prepareAttackOnTarget()
			if (stat != DEAD)
				SSmove_manager.move_to(src, targetted, 1, move_to_delay)
		else if(ranged)

			var/distance = (get_dist(src, targetted))

			if (!(targetted_mob.check_if_alive(TRUE)))
				loseTarget()
				return
			if (stat == DEAD)
				return

			var/shoot = TRUE

			if (targetted == target_location_resolved) //this isnt our target. its useless to shoot at it

				if (distance > viewRange) //if it's not in our viewrange...
					var/turf/viewrange_edge = get_turf_at_edge_of_viewRange(targetted)
					if (viewrange_edge?.opacity || !(can_see_check(viewrange_edge))) //... and if itself blocks LOS or we cant see it...
						if (!fire_through_walls) //...and we arent allowed to fire through walls...
							shoot = FALSE //...lets not shoot
				else if (!fire_through_walls)
					shoot = FALSE

			else if (targetted == targetted_mob)
				if (!can_see && (!fire_through_lost_sight))
					shoot = FALSE

			if (shoot) // should we shoot?
				if (prepareAttackPrecursor(RANGED_TYPE, TRUE, TRUE, targetted))
					if(!QDELETED(src))
						addtimer(CALLBACK(src, PROC_REF(OpenFire), targetted, trace), delay_for_range)

			if (advancement_timer <= world.time)  //we dont want to prematurely end a advancing walk
				if (stat != DEAD)
					SSmove_manager.move_to(src, targetted, calculated_walk, move_to_delay) //we still want to reset our walk
				set_glide_size(DELAY2GLIDESIZE(move_to_delay))
	else
		prepareAttackOnTarget()
		if (stat != DEAD)
			SSmove_manager.move_to(src, targetted_mob, 1, move_to_delay)

/mob/living/carbon/superior/proc/get_turf_at_edge_of_viewRange(var/atom/target, view_range = viewRange)
	var/turf/viewrange_edge = get_turf(src)
	if (!target)
		return null
	for (var/i = 0, i < view_range, i++)
		viewrange_edge = get_step_towards(viewrange_edge, target) // need to loop here since get_step_to avoids obstacles

	return viewrange_edge

/mob/living/carbon/superior/proc/can_see_check(var/atom/targetted_mob, var/mob/living/targetted_mob_real, can_see = FALSE, use_hearers = FALSE)

	if (!see_through_walls) // we can skip these checks if we can always see our target
		var/distance = (min(get_dist(src, targetted_mob), viewRange))
		if ((targetted_mob_real && (targetted_mob_real.client) && (ismob(targetted_mob))) || use_hearers) // is our target_mob a mob with a player controlling it?
			if (targetted_mob in hearers(distance, src)) //we can afford a more expensive proc for the sake of making the player experience with ai better
				can_see = TRUE
		else if (can_see(src, targetted_mob, distance)) // if not, lets use a inaccurate cheap proc
			can_see = TRUE
	else
		if (see_past_viewRange || (targetted_mob in range(viewRange, src)))
			can_see = TRUE

	return can_see

/// If critcheck = FALSE, will check if health is more than 0. Otherwise, if is a human, will check if theyre in hardcrit.
/atom/proc/check_if_alive(var/critcheck = FALSE) //A simple yes no if were alive
	if (critcheck)
		if (ishuman(src))
			var/mob/living/carbon/human/H = src
			if(H.health > HEALTH_THRESHOLD_CRIT) //only matters for humans
				return TRUE
			if(!H.resting && stat == CONSCIOUS)
				return TRUE

			return FALSE
	if(health > 0)
		return TRUE
	return FALSE

// Same as overridden proc but -3 instead of -1 since its 3 times less frequently envoked, if checks removed
/mob/living/carbon/superior/handle_status_effects()
	paralysis = max(paralysis-3,0)

	if (stunned)
		stunned = max(stunned-3,0)
		if(!stunned)
			update_icons()

	if(weakened)
		weakened = max(weakened-3,0)
		if(!weakened)
			update_icons()

/mob/living/carbon/superior/handle_regular_status_updates()
	health = maxHealth - oxyloss - toxloss - fireloss - bruteloss - cloneloss - halloss
	if(health <= death_threshold && stat != DEAD)
		death()
		blinded = TRUE
		silent = FALSE
		return TRUE
	return FALSE

/mob/living/carbon/superior/handle_chemicals_in_body()
	if(reagents)
		chem_effects.Cut()
		if(touching)
			touching.metabolize()
		if(bloodstr)
			bloodstr.metabolize()

	/*
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
	if (hunger_factor && (nutrition > 0) && (stat != DEAD))
		nutrition = max (0, nutrition - hunger_factor)
	updatehealth()
	*/

/mob/living/carbon/superior/Life()
	ticks_processed++
	handle_regular_hud_updates()
	if(!reagent_immune)
		handle_chemicals_in_body() //not under ai_inactive, because of shit like blattedin

	// is this optimal? no. do i like this? no. if i could, would i rip it up and make it better? yes.
	// but this is eriscode. i cant make a clean change on fucking anything. i am so goddamn tired of trying
	// to optimize this mess, taht at this point, im willing to just shove all this shit in here. and you know what?
	// this isnt even that bad. im disgusted by this too, and by god, i beg of whoever the hell is reading this,
	// MAKE THIS BETTER. we have SO many goddamn superior mobs that this shit NEEDS to be optimal but i am a goddamn
	// sophmore in college about to get a goddamn job so im pretty tired of workin on this shit.
	if(!(ticks_processed%3))
		if (!AI_inactive)
			handle_status_effects()
			update_lying_buckled_and_verb_status()
		if(!never_stimulate_air && stat != DEAD)//Dead things dont breath
			sa_handle_breath()
		//Fire handling , not passing the whole list because thats unefficient.
		if(on_fire)
			handle_fire()
		// this one in particular im very unhappy about. every 3 ticks, if a superior mob is dead to something that doesnt directly apply damage, it dies. i hate this.
		handle_regular_status_updates() // we should probably still do this even if we're dead or something
		ticks_processed = 0

	if (!weakened)

		if(!AI_inactive) //we dont need to handle ai if we're disabled
			handle_ai()
			//Speaking

			if(speak_chance && prob(speak_chance))
				visible_emote(emote_see)

			if (following)
				if (!target_mob) // Are we following someone and not attacking something?
					if (stat != DEAD)
						SSmove_manager.move_to(src, following, follow_distance, move_to_delay) // Follow the mob referenced in 'following' and stand almost next to them.
			else if (!target_mob && last_followed)
				SSmove_manager.stop_looping(src)
				last_followed = null // this exists so we only stop the following once, no need to constantly end our walk

	if(life_cycles_before_sleep)
		life_cycles_before_sleep--
		return TRUE
	if(!(AI_inactive && life_cycles_before_sleep))
		AI_inactive = TRUE

	if(life_cycles_before_scan)
		life_cycles_before_scan--
		return FALSE
	if(check_surrounding_area(viewRange))
		activate_ai()
		life_cycles_before_scan = initial(life_cycles_before_scan)/6 //So it doesn't fall asleep just to wake up the next tick
		return TRUE
	life_cycles_before_scan = initial(life_cycles_before_scan)
	return FALSE

/**
 *  Handles telegraphing attacks, and attack delays. It does not handle the attacks themselves.
 *
 *	Returns a boolean, FALSE meaning the proc has come to the conclusion that the mob should not fire this tick.
 *
 *	Args:
 *	attack_type-The delay that will be used for this timer. Defines used by this defined in mobs.dm. Example: MELEE_TYPE.
 *	telegraph-Boolean. If false, no visual emote will be made.
 *	cast_beam-Boolean. If true, a beam will be cast from src to targetted_mob as a visual telegraph.
 *	atom/movable/targetted-The target of the telegraphs.
**/
/mob/living/carbon/superior/proc/prepareAttackPrecursor(attack_type, telegraph = TRUE, cast_beam = TRUE, var/atom/movable/targetted)
	if (check_if_alive()) //sanity
		var/time_to_expire
		var/attack_telegraph
		switch(attack_type)
			if (MELEE_TYPE)

				time_to_expire = delay_for_melee
				attack_telegraph = melee_telegraph

				if (melee_delay <= 0)
					melee_delay = melee_delay_initial
				else
					melee_delay--
					if (telegraph)
						visible_message(SPAN_WARNING("\the [src] [melee_charge_telegraph] \the <font color = 'orange'>[targetted]</font>!"), target = targetted, message_target = always_telegraph_to_target)
					return FALSE

			if (RANGED_TYPE, RANGED_RAPID_TYPE)

				time_to_expire = delay_for_range
				attack_telegraph = range_telegraph

				if (fire_delay <= 0)
					fire_delay = fire_delay_initial
				else
					fire_delay--
					if (telegraph)
						visible_message(SPAN_WARNING("\the [src] [range_charge_telegraph] \the <font color = 'orange'>[targetted]</font>!"), target = targetted, message_target = always_telegraph_to_target)
					return FALSE

		if (cast_beam)
			Beam(targetted, icon_state = "1-full", time=(time_to_expire/10), maxdistance=(get_dist(src, targetted) + 10), alpha_arg=telegraph_beam_alpha, color_arg = telegraph_beam_color)
		if (telegraph)
			visible_message(SPAN_WARNING("\the [src] [attack_telegraph] \the <font color = 'blue'>[targetted]</font>!"), target = targetted, message_target = always_telegraph_to_target)

		return TRUE
	else
		return FALSE

/// Called in findTarget() if the found target is not the same as the one we already have.
/mob/living/carbon/superior/proc/doTargetMessage()
	return

/**
 * To be used in conjunction with check_trajectory_raytrace. Make sure to spawn(0) before this proc so the projectile processes. spawn(0) does not work WITHIN the proc, sadly.
 *
 * If trace.impact_atom is not targetted_mob, and it is not in trace.force_penetration_on, we will advance advancement tiles towards our target.
 *
 * If there is no impact atom, it will assume it was deleted, and only pass penetration data.
 *
 * Args:
 * obj/item/projectile/trace: The trace we are registered to.
 * atom/impact_atom: The atom the trace impacted.
**/
/mob/living/carbon/superior/proc/handle_trace_impact(var/obj/item/projectile/trace, var/delete_trace = TRUE)

	if (stat == DEAD)
		return FALSE

	var/targetted_mob = (target_mob?.resolve())
	var/boolean = TRUE
	var/datum/penetration_holder/holder = null

	if (trace.penetration_holder)
		holder = trace.penetration_holder

	if (((trace.impact_atom) && (trace.impact_atom == targetted_mob)) || ((holder) && (holder.force_penetration_on) && (targetted_mob in holder.force_penetration_on)))
		boolean = FALSE
	else
		boolean = TRUE

	if (delete_trace)
		qdel(trace.penetration_holder)
		trace.penetration_holder = null
		QDEL_NULL(trace)
	if (boolean)
		advance_towards(targetted_mob)
	return boolean

/mob/living/carbon/superior/proc/advance_towards(var/atom/target)

	var/calculated_walk = (comfy_range - comfy_distance)

	var/distance = (get_dist(src, target))
	if (distance <= calculated_walk) //if we are within our comfy range but we cant attack, we need to reposition
		advance_steps = (distance - advancement)
		if (advance_steps <= 0)
			advance_steps = 1 //1 is minimum
		if (stat != DEAD)
			SSmove_manager.move_to(src, target, advance_steps, move_to_delay) //advance forward, forcing us to pathfind
		advancement_timer = (world.time += advancement_increment) // we dont want this overridden instantly

/mob/living/carbon/superior/CanPass(atom/mover)
	if(istype(mover, /obj/item/projectile))
		return stat ? TRUE : FALSE
	. = ..()

/mob/living/carbon/superior/UnarmedAttack(atom/A, proximity)
	. = ..()
	if(!.)
		return

	if(poison_per_bite > 0)

		if(isliving(A))
			var/mob/living/L = A
			if(istype(L) && L.reagents)
				var/zone_armor =  L.getarmor(targeted_organ, ARMOR_MELEE)
				var/poison_injected = zone_armor ? poison_per_bite * (-0.01 * zone_armor + 1) : poison_per_bite
				L.reagents.add_reagent(poison_type, poison_injected)
