/mob/living/simple/hostile/megafauna/one_star
	name = "Type - 0315"
	desc = "Love and concrete."

	faction = "greyson"

	icon = 'icons/mob/64x64.dmi'
	icon_state = "onestar_boss_unpowered"
	icon_living = "onestar_boss_unpowered"
	icon_dead = "onestar_boss_wrecked"
	pixel_x = -16
	ranged = TRUE

	health = 1700
	maxHealth = 1700
	break_stuff_probability = 95
	stop_automated_movement = 1

	aggro_vision_range = 16 //No more cheesing
	vision_range = 40 //No more cheesing

	melee_damage_lower = 40
	melee_damage_upper = 50
	megafauna_min_cooldown = 30
	megafauna_max_cooldown = 60

	wander = FALSE //No more sleepwalking
	mob_classification = CLASSIFICATION_SYNTHETIC
	emp_proof = TRUE

	projectiletype = /obj/item/projectile/bullet/light_rifle_257/nomuzzle

/mob/living/simple/hostile/megafauna/one_star/death(gibbed, var/list/force_grant)
	if(health <= death_threshold)
		visible_message("<b>[src]</b> blows apart in an explosion!")
		explosion(src.loc, 0,1,3)
		new /obj/effect/decal/cleanable/blood/gibs/robot(src.loc)
		var/datum/effect/effect/system/spark_spread/s = new /datum/effect/effect/system/spark_spread
		s.set_up(3, 1, src)
		s.start()
		if(prob(10))
			new /obj/item/gun_upgrade/mechanism/greyson_master_catalyst(src.loc)
		..()


/mob/living/simple/hostile/megafauna/one_star/LoseTarget()
	..()
	icon_state = initial(icon_state)

/mob/living/simple/hostile/megafauna/one_star/LostTarget()
	..()
	icon_state = initial(icon_state)

/mob/living/simple/hostile/megafauna/one_star/FindTarget()
	if(istype(src.loc, /turf))
		var/turf/TURF = src.loc
		if(TURF.get_lumcount() < 1)
			vision_range = 10
		else
			vision_range = 20
	else
		vision_range = 30
	. = ..()
	if(.)
		icon_state = "onestar_boss"
	else
		icon_state = initial(icon_state)

/mob/living/simple/hostile/megafauna/one_star/AttackingTarget()
	var/mob/living/targetted_mob = (target_mob?.resolve())

	if(!Adjacent(targetted_mob))
		return
	if(isliving(targetted_mob))
		var/mob/living/L = targetted_mob
		L.attack_generic(src,rand(melee_damage_lower,melee_damage_upper),attacktext)
		return L
	if(istype(targetted_mob,/obj/mecha))
		var/obj/mecha/M = targetted_mob
		M.attack_generic(src,rand(melee_damage_lower,melee_damage_upper),attacktext)
		return M
	if(istype(targetted_mob,/obj/machinery/bot))
		var/obj/machinery/bot/B = targetted_mob
		B.attack_generic(src,rand(melee_damage_lower,melee_damage_upper),attacktext)
		return B
	if(istype(targetted_mob,/obj/machinery/porta_turret))
		var/obj/machinery/porta_turret/P = targetted_mob
		P.attack_generic(src,rand(melee_damage_lower,melee_damage_upper),attacktext)
		return P

/mob/living/simple/hostile/megafauna/one_star/proc/shoot_rocket(turf/marker, set_angle)
	if(!isnum(set_angle) && (!marker || marker == loc))
		return
	var/turf/startloc = get_turf(src)
	var/obj/item/projectile/P = new /obj/item/projectile/bullet/rocket(startloc)
	P.firer = src
	if(target)
		P.original = target
	P.launch( get_step(marker, pick(SOUTH, NORTH, WEST, EAST, SOUTHEAST, SOUTHWEST, NORTHEAST, NORTHWEST)) )


/mob/living/simple/hostile/megafauna/one_star/OpenFire()
	var/mob/living/targetted_mob = (target_mob?.resolve())

	anger_modifier = CLAMP(((maxHealth - health)/50),0,20)
	ranged_cooldown = world.time + 30
	SSmove_manager.stop_looping(src)
	telegraph()
	icon_state = "onestar_boss"
	if(prob(35))
		shoot_rocket(targetted_mob.loc, rand(0,90))
		move_to_delay = initial(move_to_delay)
		MoveToTarget()
		return
	if(prob(45))
		select_spiral_attack()
		move_to_delay = initial(move_to_delay)
		MoveToTarget()
		return
	if(targetted_mob)
		if(prob(75))
			wave_shots()
			move_to_delay = initial(move_to_delay)
			MoveToTarget()
			return
		else
			shoot_projectile(targetted_mob.loc, rand(0,90))
			MoveToTarget()
	move_to_delay = initial(move_to_delay)
