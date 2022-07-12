// superior_animal and definition moved to superior_defines.dm
/mob/living/carbon/superior_animal/New()
	..()
	if(!icon_living)
		icon_living = icon_state
	if(!icon_dead)
		icon_dead = "[icon_state]_dead"

	objectsInView = new

	full_reload_message  = "[reload_message]"
	reload_message = "[name] [full_reload_message]"

	verbs -= /mob/verb/observe
	pixel_x = RAND_DECIMAL(-randpixel, randpixel)
	pixel_y = RAND_DECIMAL(-randpixel, randpixel)

	GLOB.superior_animal_list += src

	for(var/language in known_languages)
		add_language(language)

/mob/living/carbon/superior_animal/Initialize(var/mapload)
	if (get_stat_modifier)
		for (var/key in allowed_stat_modifiers)
			var/datum/stat_modifier/mod = key
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

/mob/living/carbon/superior_animal/Destroy()
	GLOB.superior_animal_list -= src

	target_mob = null

	friends.Cut()
	. = ..()

/mob/living/carbon/superior_animal/u_equip(obj/item/W as obj)
	return

/mob/living/carbon/superior_animal/proc/visible_emote(message)
	if(islist(message))
		message = safepick(message)
	if(message)
		visible_message("<span class='name'>[src]</span> [message]")

/mob/living/carbon/superior_animal/update_icons()
	. = ..()
	transform = null
	if (stat == DEAD)
		icon_state = icon_dead
	else if ((stat == UNCONSCIOUS) || resting || lying)
		if (icon_rest)
			icon_state = icon_rest
		else
			if (icon_living)
				icon_state = icon_living
			var/matrix/M = matrix()
			M.Turn(180)
			//M.Translate(1,-6)
			transform = M
	else if (icon_living)
		icon_state = icon_living


/mob/living/carbon/superior_animal/regenerate_icons()
	. = ..()
	update_icons()

/mob/living/carbon/superior_animal/updateicon()
	. = ..()

/mob/living/carbon/superior_animal/examine(mob/user)
	..()
	if (is_dead())
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


// Same as breath but with innecesarry code removed and damage tripled. Environment pressure damage moved here since we handle moles.

/mob/living/carbon/superior_animal/proc/handle_cheap_breath(datum/gas_mixture/breath as anything)
	var/breath_pressure = (breath.total_moles*R_IDEAL_GAS_EQUATION*breath.temperature)/BREATH_VOLUME
	var/breath_required = breath_pressure > 15 && (breath_required_type || breath_poison_type)
	if(!breath_required) // 15 KPA Minimum
		return FALSE
	adjustOxyLoss(breath.gas[breath_required_type] ? 0 : ((((breath.gas[breath_required_type] / breath.total_moles) * breath_pressure) < min_breath_required_type) ? 0 : 6))
	adjustToxLoss(breath.gas[breath_poison_type] ? 0 : ((((breath.gas[breath_poison_type] / breath.total_moles) * breath_pressure) < min_breath_poison_type) ? 0 : 6))

/mob/living/carbon/superior_animal/proc/handle_cheap_environment(datum/gas_mixture/environment as anything)
	var/pressure = environment.return_pressure()
	var/enviro_damage = (bodytemperature < min_bodytemperature) || (pressure < min_air_pressure) || (pressure > max_air_pressure)
	if(enviro_damage) // its like this to avoid extra processing further below without using goto
		bodytemperature += (bodytemperature - environment.temperature) * (environment.total_moles / MOLES_CELLSTANDARD) * (bodytemperature < min_bodytemperature ? 1 - heat_protection : -1 + cold_protection)
		adjustFireLoss(bodytemperature < min_bodytemperature ? 0 : 15)
		adjustBruteLoss((pressure < min_air_pressure  || pressure > max_air_pressure) ? 0 : 6)
		bad_environment = TRUE
		return FALSE
	bad_environment = FALSE
	if (!contaminant_immunity)
		for(var/g in environment.gas)
			if(gas_data.flags[g] & XGM_GAS_CONTAMINANT && environment.gas[g] > gas_data.overlay_limit[g] + 1)
				pl_effects()
				break

	if (overkill_dust && (getFireLoss() >= maxHealth*2))
		dust()
		return FALSE

// branchless isincapacited check made for roaches.
/mob/living/carbon/superior_animal/proc/cheap_incapacitation_check() // This works based off constants ,override it if you want it to be dynamic . Based off isincapacited
	return stunned > 0 || weakened > 0 || resting || pinned.len > 0 || stat || paralysis || sleeping || (status_flags & FAKEDEATH) || buckled() > 0

/mob/living/carbon/superior_animal/proc/cheap_update_lying_buckled_and_verb_status_()

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
		set_density(initial(density))

/mob/living/carbon/superior_animal/proc/handle_ai()

	if(weakened)
		return

	if(ckey)
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
			if (delayed == 0)
				delayed = delayed_initial
				handle_attacking_stance(targetted_mob)
			else
				delayed--

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

/mob/living/carbon/superior_animal/proc/handle_hostile_stance(var/atom/targetted_mob) //here so we can jump instantly to it if hostile stance is established
	var/already_destroying_surroundings = FALSE
	var/calculated_walk = (comfy_range - comfy_distance)
	if(destroy_surroundings)
		destroySurroundings()
		already_destroying_surroundings = TRUE
	if(ranged)

		stop_automated_movement = TRUE
		stance = HOSTILE_STANCE_ATTACKING
		set_glide_size(DELAY2GLIDESIZE(move_to_delay))
		walk_to_wrapper(src, targetted_mob, calculated_walk, move_to_delay, deathcheck = TRUE) //lets get a little closer than our optimal range

		if (delayed > 0)
			if (!(retarget_rush_timer > world.time)) //Only true if the timer is less than the world.time
				visible_message(SPAN_WARNING("[src] [target_telegraph] <font color = 'green'>[targetted_mob]</font>!"), target = targetted_mob, message_target = always_telegraph_to_target)
				delayed--
				return //return to end the switch early, so we delay our attack by one tick. does not happen if rush timer is less than world.time
			else
				visible_message(SPAN_WARNING("[src] [rush_target_telegraph] <font color = 'green'>[targetted_mob]</font>!"), target = targetted_mob, message_target = always_telegraph_to_target)

	else if (!ranged)
		stop_automated_movement = TRUE
		stance = HOSTILE_STANCE_ATTACKING
		set_glide_size(DELAY2GLIDESIZE(move_to_delay))
		walk_to_wrapper(src, targetted_mob, 1, move_to_delay, deathcheck = TRUE)
		moved = 1
	handle_attacking_stance(targetted_mob, already_destroying_surroundings)

/mob/living/carbon/superior_animal/proc/handle_attacking_stance(var/atom/targetted_mob, var/already_destroying_surroundings = FALSE)
	var/calculated_walk = (comfy_range - comfy_distance)
	var/datum/penetration_holder/trace_holder = null
	var/fire_through_lost_sight = FALSE
	var/can_see = TRUE
	var/ran_see_check = FALSE
	var/mob/targetted_mob_real = null
	var/obj/mecha/targetted_mecha = null
	var/target_location_resolved = (target_location?.resolve())
	retarget_rush_timer += ((world.time) + retarget_rush_timer_increment) //we put it here because we want mobs currently angry to be vigilant
	if(destroy_surroundings && !already_destroying_surroundings)
		destroySurroundings()

	if (!(isburrow(targetted_mob))) //we dont want mobs failing to use the burrows
		// This block controls random retargetting

		if (ismob(targetted_mob))
			targetted_mob_real = targetted_mob

		else if (ismecha(targetted_mob))
			targetted_mecha = targetted_mob
			if (targetted_mecha.occupant && ismob(targetted_mecha.occupant))
				targetted_mob_real = targetted_mecha.occupant

		if (!ran_see_check)
			if (!see_through_walls)
				if (targetted_mob_real && (targetted_mob_real.client))
					if (!(targetted_mob in hearers(get_dist(src, targetted_mob), src)))
						can_see = FALSE
				else if (!((can_see(src, targetted_mob, get_dist(src, targetted_mob))) && !see_through_walls)) //if we cant see them, hearers() wont show them, so lets remove the override
					can_see = FALSE
				ran_see_check = TRUE

		if (!lost_sight)
			target_location = WEAKREF(targetted_mob.loc) //the choice to not just store the location unconditionally every tick is intentional, i want mobs to have a chance to reacquire their target
		target_location_resolved = (target_location?.resolve())
		if (retarget)
			var/retarget_prioritize = retarget_prioritize_current //local var so that we can make temporary changes
			if (retarget_timer <= 0)
				if (!can_see)
					retarget_prioritize = FALSE //removing override
				var/target_mob_cache = target_mob
				target_mob = WEAKREF(findTarget(retarget_prioritize))
				retarget_timer = retarget_timer_initial //reset the timer
				if (!target_mob)
					target_mob = target_mob_cache //lets let the rest of the code handle this
				else
					if (target_mob != target_mob_cache)
						lost_sight = FALSE // we dont want any weird stuff happening, so lets be safe and set it to false
					targetted_mob = (target_mob?.resolve())
			else
				retarget_timer--
		// This block controls losing line of sight and targetting the last known location of the enemy
		if (!can_see)
			if (patience <= 0)
				loseTarget()
				patience = patience_initial
				return
			else //this is where we handle mobs losing LOS and forgetting where the target is
				if (!lost_sight) //lets only do this if we havent lost sight of them, so we dont constantly go to their new position
					if (cant_see_timer <= world.time) //prevents any weirdness
						if (ranged) //only ranged mobs can advance, currently
							if (advancement_timer > world.time) //we are advancing, so lets use our advance_steps var
								walk_to_wrapper(src, target_location_resolved, advance_steps, move_to_delay, deathcheck = TRUE)
							else
								walk_to_wrapper(src, target_location_resolved, calculated_walk, move_to_delay, deathcheck = TRUE)
						else
							walk_to_wrapper(src, target_location_resolved, 1, move_to_delay, deathcheck = TRUE) // melee mobs only need to go to one tile away

				lost_sight = TRUE
				patience--

				if (wander_if_lost_sight)
					var/moving_to = pick(cardinal)
					set_dir(moving_to)
					step_glide(src, moving_to, DELAY2GLIDESIZE(0.5 SECONDS)) //we can potentially pathfind if we do this
			if (fire_through_walls)
				cant_see_timer = (world.time)++ //just to make sure we dont walk towards them
				fire_through_lost_sight = TRUE

		// This block only runs if the above can_see check is true, fires a trace projectile to see if we can hit our target
		if ((projectiletype && advance) || (!can_see && advance_if_cant_see)) // if we can see, let's prepare to see if we can hit
			if (ranged)
				var/trace = check_trajectory_raytrace(targetted_mob, src, projectiletype, TRUE)
				spawn(0)
				handle_trace_impact(trace)

		if (!can_see && (!fire_through_walls))
			return

	if (!fire_through_lost_sight) //can only be true if src does not have fire_through_walls
		lost_sight = FALSE
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
		walk_to_wrapper(src, targetted, 1, move_to_delay, deathcheck = TRUE)
	else if(ranged)
		if (!(targetted_mob.check_if_alive(TRUE)))
			loseTarget()
			return
		if (stat == DEAD)
			return
		if(get_dist(src, targetted) <= comfy_range)
			if (prepareAttackPrecursor(RANGED_TYPE, TRUE, TRUE, targetted))
				addtimer(CALLBACK(src, .proc/OpenFire, targetted, trace_holder), delay_for_range)
			if ((advancement_timer <= world.time) && (cant_see_timer <= world.time))  //we dont want to prematurely end a advancing walk
				walk_to_wrapper(src, targetted, calculated_walk, move_to_delay, deathcheck = TRUE) //we still want to reset our walk
		else
			if (prepareAttackPrecursor(RANGED_TYPE, TRUE, TRUE, targetted))
				addtimer(CALLBACK(src, .proc/OpenFire, targetted, trace_holder), delay_for_range)
			if ((advancement_timer <= world.time) && (cant_see_timer <= world.time))
				set_glide_size(DELAY2GLIDESIZE(move_to_delay))
				walk_to_wrapper(src, targetted, calculated_walk, move_to_delay, deathcheck = TRUE)

/// If critcheck = FALSE, will check if health is more than 0. Otherwise, if is a human, will check if theyre in hardcrit.
/atom/proc/check_if_alive(var/critcheck = FALSE) //A simple yes no if were alive
	if (critcheck)
		if (istype(src, /mob/living/carbon/human))
			if(health > HEALTH_THRESHOLD_CRIT) //only matters for humans
				return TRUE
			else
				return FALSE
	if(health > 0)
		return TRUE
	return FALSE

// Same as overridden proc but -3 instead of -1 since its 3 times less frequently envoked, if checks removed
/mob/living/carbon/superior_animal/handle_status_effects()
	paralysis = max(paralysis-3,0)
	stunned = max(stunned-3,0)
	weakened = max(weakened-3,0)

/mob/living/carbon/superior_animal/proc/handle_cheap_regular_status_updates()
	health = maxHealth - getOxyLoss() - getToxLoss() - getFireLoss() - getBruteLoss() - getCloneLoss() - halloss
	if(health <= 0 && stat != DEAD)
		death()
		// STOP_PROCESSING(SSmobs, src) This is handled in Superior animal Life().
		blinded = TRUE
		silent = FALSE
		return TRUE
	return FALSE

/mob/living/carbon/superior_animal/proc/handle_cheap_chemicals_in_body()
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

/mob/living/carbon/superior_animal/Life()
	ticks_processed++
	handle_regular_hud_updates()
	if(!reagent_immune)
		handle_cheap_chemicals_in_body()

	if(!(ticks_processed%3))
		// handle_status_effects() this is handled here directly to save a bit on procedure calls
		//if((weakened - 3 <= 1 && weakened > 1) || (stunned - 3 <= 1 && stunned > 1)) - Soj edit, we already update icon just 13 lines down form this, no point
		//	spawn(5) update_icons()
		paralysis = max(paralysis-3,0)
		stunned = max(stunned-3,0)
		weakened = max(weakened-3,0)
		cheap_update_lying_buckled_and_verb_status_()
		if(!never_stimulate_air)
			var/datum/gas_mixture/environment = loc.return_air_for_internal_lifeform()
			var/datum/gas_mixture/breath = environment.remove_volume(BREATH_VOLUME)
			handle_cheap_breath(breath)
			handle_cheap_environment(environment)
			//Fire handling , not passing the whole list because thats unefficient.
			handle_fire(environment.gas["oxygen"], loc)
		updateicon()
		ticks_processed = 0
	if(handle_cheap_regular_status_updates()) // They have died after all of this, do not scan or do not handle AI anymore.
		return PROCESS_KILL

	if (can_burrow && bad_environment)
		evacuate()

	if (!weakened)

		if(!AI_inactive) //we dont need to handle ai if we're disabled
			handle_ai()
			//Speaking

			if(speak_chance && prob(speak_chance))
				visible_emote(emote_see)

			if (following)
				if (!target_mob) // Are we following someone and not attacking something?
					walk_to_wrapper(src, following, follow_distance, move_to_delay, deathcheck = TRUE) // Follow the mob referenced in 'following' and stand almost next to them.
			else if (!target_mob && last_followed)
				walk_to_wrapper(src, 0)
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
/mob/living/carbon/superior_animal/proc/prepareAttackPrecursor(attack_type, telegraph = TRUE, cast_beam = TRUE, var/atom/movable/targetted)
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
/mob/living/carbon/superior_animal/proc/doTargetMessage()
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
/mob/living/carbon/superior_animal/proc/handle_trace_impact(var/obj/item/projectile/trace, var/delete_trace = TRUE)

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

/mob/living/carbon/superior_animal/proc/advance_towards(var/atom/target)

	var/calculated_walk = (comfy_range - comfy_distance)

	var/distance = (get_dist(src, target))
	if (distance <= calculated_walk) //if we are within our comfy range but we cant attack, we need to reposition
		advance_steps = (distance - advancement)
		if (advance_steps <= 0)
			advance_steps = 1 //1 is minimum
		walk_to_wrapper(src, target, advance_steps, move_to_delay, deathcheck = TRUE) //advance forward, forcing us to pathfind
		advancement_timer = (world.time += advancement_increment) // we dont want this overridden instantly

/mob/living/carbon/superior_animal/CanPass(atom/mover)
	if(istype(mover, /obj/item/projectile))
		return stat ? TRUE : FALSE
	. = ..()
