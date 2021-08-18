/mob/living/carbon/superior_animal/attack_ui(slot_id)
	return

/mob/living/carbon/superior_animal/UnarmedAttack(var/atom/A, var/proximity)
	if(!..())
		return

	var/damage = rand(melee_damage_lower, melee_damage_upper)

	if(moved) damage *= move_attack_mult

	. = A.attack_generic(src, damage, attacktext, environment_smash)

	if(.)
		if (attack_sound && loc && prob(attack_sound_chance))
			playsound(loc, attack_sound, attack_sound_volume, 1)

/mob/living/carbon/superior_animal/verb/break_around()
	set name = "Attack Surroundings "
	set desc = "Lash out on the your surroundings | Forcefully attack your surroundings."
	set category = "Mob verbs"

	src.destroySurroundings()

/mob/living/carbon/superior_animal/RangedAttack()
	if(ranged)
		if(get_dist(src, target_mob) <= 6 && !istype(src, /mob/living/simple_animal/hostile/megafauna))
			OpenFire(target_mob)
		else
			set_glide_size(DELAY2GLIDESIZE(move_to_delay))
			walk_to(src, target_mob, 1, move_to_delay)
		if(ranged && istype(src, /mob/living/simple_animal/hostile/megafauna))
			var/mob/living/simple_animal/hostile/megafauna/megafauna = src
			sleep(rand(megafauna.megafauna_min_cooldown,megafauna.megafauna_max_cooldown))
			if(istype(src, /mob/living/simple_animal/hostile/megafauna/one_star))
				if(prob(rand(15,25)))
					stance = HOSTILE_STANCE_ATTACKING
					set_glide_size(DELAY2GLIDESIZE(move_to_delay))
					walk_to(src, target_mob, 1, move_to_delay)
				else
					OpenFire(target_mob)
			else
				if(prob(45))
					stance = HOSTILE_STANCE_ATTACKING
					set_glide_size(DELAY2GLIDESIZE(move_to_delay))
					walk_to(src, target_mob, 1, move_to_delay)
				else
					OpenFire(target_mob)
		else
			return

/mob/living/carbon/superior_animal/proc/OpenFire(target_mob)
	var/target = target_mob
	visible_message(SPAN_DANGER("<b>[src]</b> [fire_verb] at [target]!"), 1)

	if(rapid)
		spawn(6)
			Shoot(target, loc, src)
			handle_ammo_check()
		spawn(10)
			Shoot(target, loc, src)
			handle_ammo_check()
		spawn(14)
			Shoot(target, loc, src)
			handle_ammo_check()
	else
		Shoot(target, loc, src)
		handle_ammo_check()

	stance = HOSTILE_STANCE_IDLE
	target_mob = null
	return

/mob/living/carbon/superior_animal/proc/handle_ammo_check()
	if(casingtype)
		new casingtype(get_turf(src))
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

/mob/living/carbon/superior_animal/proc/Shoot(var/target, var/start, var/user, var/bullet = 0)
	if(target == start)
		return

	var/obj/item/projectile/A = new projectiletype(user:loc)
	if(casingtype)
		new casingtype(get_turf(src))
	playsound(user, projectilesound, 100, 1)
	if(!A)	return
	var/def_zone = get_exposed_defense_zone(target)
	A.launch(target, def_zone)

/mob/living/carbon/superior_animal/MiddleClickOn(mob/targetDD as mob) //Letting Mobs Fire when middle clicking as someone controlling it.
	var /mob/living/carbon/superior_animal/shooter = src //TODO: Make it work for alt click in perfs like rig code
	if(ranged_middlemouse_cooldown >= world.time) //Modula for admins to set them at different things
		to_chat(src, "You gun isnt ready to fire!.")
		return
	if(shooter.ranged ==1)
		shooter.OpenFire(targetDD)
