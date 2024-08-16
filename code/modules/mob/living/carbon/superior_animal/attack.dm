/mob/living/carbon/superior_animal/attack_ui(slot_id)
	return

/mob/living/carbon/superior_animal/UnarmedAttack(var/atom/A, var/proximity)
	if(!..())
		return
	if(weakened)
		return

	var/damage = rand(melee_damage_lower, melee_damage_upper)

	if(moved)
		damage *= move_attack_mult

//Here we handle blocking chance against superior mobs, yeah.
	if(isliving(A))
		var/mob/living/L = A
		if(istype(L, /mob/living/carbon/human))
			var/mob/living/carbon/human/target_human = L
			if(target_human.check_shields(damage, null, src, null, attacktext))
				return 0

	. = A.attack_generic(user = src, damage = damage, attack_message = attacktext, damagetype = melee_damage_type, attack_flag = attacking_armor_type, sharp = melee_sharp, edge = melee_sharp)

	if(.)
		if (attack_sound && loc && prob(attack_sound_chance))
			playsound(loc, attack_sound, attack_sound_volume, 1)

/mob/living/carbon/superior_animal/verb/break_around()
	set name = "Attack Surroundings "
	set desc = "Lash out on the your surroundings | Forcefully attack your surroundings."
	set category = "Mob verbs"

	src.destroySurroundings()

/mob/living/carbon/superior_animal/RangedAttack()
	if(!check_if_alive())
		return
	if(weakened)
		return
	var/atom/targetted_mob = (target_mob?.resolve())

	if(ranged)
		if(get_dist(src, targetted_mob) <= 6 && !istype(src, /mob/living/simple_animal/hostile/megafauna))
			OpenFire(targetted_mob)
		else
			set_glide_size(DELAY2GLIDESIZE(move_to_delay))
			if (stat != DEAD)
				SSmove_manager.move_to(src, targetted_mob, 1, move_to_delay)
		if(ranged && istype(src, /mob/living/simple_animal/hostile/megafauna))
			var/mob/living/simple_animal/hostile/megafauna/megafauna = src
			sleep(rand(megafauna.megafauna_min_cooldown,megafauna.megafauna_max_cooldown))
			if(istype(src, /mob/living/simple_animal/hostile/megafauna/one_star))
				if(prob(rand(15,25)))
					stance = HOSTILE_STANCE_ATTACKING
					set_glide_size(DELAY2GLIDESIZE(move_to_delay))
					if (stat != DEAD)
						SSmove_manager.move_to(src, targetted_mob, 1, move_to_delay)
				else
					OpenFire(targetted_mob)
			else
				if(prob(45))
					stance = HOSTILE_STANCE_ATTACKING
					set_glide_size(DELAY2GLIDESIZE(move_to_delay))
					if (stat != DEAD)
						SSmove_manager.move_to(src, targetted_mob, 1, move_to_delay)
				else
					OpenFire(targetted_mob)
		else
			return

/mob/living/carbon/superior_animal/proc/OpenFire(var/atom/firing_target, var/obj/item/projectile/trace_arg)
	if(!check_if_alive())
		return
	if(weakened)
		return

	var/atom/target = firing_target

	if(QDELETED(firing_target))
		loseTarget()
		return

	if(rapid)
		for(var/shotsfired = 0, shotsfired < rapid_fire_shooting_amount, shotsfired++)
			addtimer(CALLBACK(src, PROC_REF(Shoot), target, loc, src, 0, trace_arg), (delay_for_rapid_range * shotsfired))
			handle_ammo_check()
	else
		Shoot(target, loc, src, trace = trace_arg)
		handle_ammo_check()

	if (!firing_target)
		loseTarget()
		return

	if (!firing_target.check_if_alive(TRUE))
		loseTarget()
		return

	if (firing_target.z != src.z)
		loseTarget()
		return

	return

/mob/living/carbon/superior_animal/proc/handle_ammo_check()
	if(!limited_ammo)
		return //Quick return
	rounds_left -= rounds_per_fire //modular, tho likely will always be one
	if(rounds_left <= 0 && mags_left >= 1) //If were out of ammo and can reload
		mags_left -= 1
		rounds_left = initial(rounds_left)
		visible_message(reload_message)
		if(mag_drop)
			new mag_type(get_turf(src))
		return
	if(rounds_left <= 0 && mags_left <= 0) //If were out of ammo and can't reload
		ranged = FALSE
		rapid = FALSE

/mob/living/carbon/superior_animal/proc/Shoot(var/target, var/start, var/user, var/bullet = 0, var/obj/item/projectile/trace)
	if(weakened)
		return
	if(target == start)
		return
	if (is_dead(src))
		return

	var/obj/item/projectile/A = new projectiletype(user:loc)
	if(!A)
		return

	var/def_zone = get_exposed_defense_zone(target)

	var/datum/penetration_holder/trace_penetration

	if (trace && trace.penetration_holder && ((!QDELETED(trace.penetration_holder)) && (!QDESTROYING(trace.penetration_holder))))
		trace_penetration = trace.penetration_holder

	var/do_we_shoot = TRUE

	var/obj/item/projectile/new_trace = check_trajectory_raytrace(target, src, projectiletype)

	spawn(0)

		if (new_trace)
			if (new_trace.impact_atom)
				var/list/possible_targets = list()
				if (trace_penetration && trace_penetration.force_penetration_on.len)
					possible_targets = trace_penetration.force_penetration_on
				possible_targets += new_trace.impact_atom
				for (var/atom/entry in possible_targets)
					var/mob/possible_target
					if (ismecha(entry))
						var/obj/mecha/mechtarget = entry
						possible_target = mechtarget.occupant
					else if (ismob(entry))
						possible_target = entry
					if (possible_target)
						if (possible_target == target)
							continue //we made the concious choice to attack them
						else if (!(prob(do_friendly_fire_chance)) && !friendly_to_colony && (((!attack_same && (possible_target.faction == faction)) || (possible_target in friends))))
							do_we_shoot = FALSE
							break

			if (do_we_shoot)
				if (trace_penetration && trace_penetration.force_penetration_on && trace_penetration.force_penetration_on.len)
					var/datum/penetration_holder/penetrator = A.penetration_holder

					for (var/atom/penetrated in trace_penetration.force_penetration_on)
						penetrator.force_penetration_on += penetrated

		if (do_we_shoot)
			var/offset_temp = right_before_firing()
			A.original_firer = src
			if(friendly_to_colony)
				A.friendly_to_colony = TRUE
			A.launch(target, def_zone, firer_arg = src, angle_offset = offset_temp) //this is where we actually shoot the projectile
			right_after_firing()
			SEND_SIGNAL(src, COMSIG_SUPERIOR_FIRED_PROJECTILE, A)
			visible_message(SPAN_DANGER("<b>[src]</b> [fire_verb] at [target]!"))
			if(casingtype)
				new casingtype(get_turf(src))
			playsound(user, projectilesound, projectilevolume, 1)
		else
			QDEL_NULL(A)

		if (trace)
			if (trace.penetration_holder)
				qdel(trace.penetration_holder)
				trace.penetration_holder = null
			QDEL_NULL(trace)

		if (new_trace)
			if (new_trace.penetration_holder)
				qdel(new_trace.penetration_holder)
				new_trace.penetration_holder = null
			QDEL_NULL(new_trace)

/// Ran right before A.launch in /mob/living/carbon/superior_animal/proc/Shoot. On base, is used for firing offset calculations.
/mob/living/carbon/superior_animal/proc/right_before_firing(offset_positive = current_firing_offset, round_offset = FALSE)
	if (round_offset)
		offset_positive = round(offset_positive) //just to be safe

	offset_positive = abs(offset_positive) //it should be positive, but lets just be safe

	if (!offset_positive) //the rest of the code doesnt matter if we're just 0 or null
		return offset_positive

	var/offset_negative = INVERT_SIGN(offset_positive) //invert the sign, so it becomes negative

	var/offset_to_return = rand(offset_negative, offset_positive) //now get a random value from between the two. the numbers between positive and negative are now our firing arc

	return offset_to_return

/// Ran right after A.launch in /mob/living/carbon/superior_animal/proc/Shoot. On base, does nothing.
/mob/living/carbon/superior_animal/proc/right_after_firing()
	return FALSE

/mob/living/carbon/superior_animal/MiddleClickOn(mob/targetDD as mob) //Letting Mobs Fire when middle clicking as someone controlling it.
	if(weakened) return
	var /mob/living/carbon/superior_animal/shooter = src //TODO: Make it work for alt click in perfs like rig code
	if(ranged_middlemouse_cooldown >= world.time) //Modula for admins to set them at different things
		to_chat(src, "You gun isnt ready to fire!.")
		return
	if(shooter.ranged ==1)
		shooter.OpenFire(targetDD)
