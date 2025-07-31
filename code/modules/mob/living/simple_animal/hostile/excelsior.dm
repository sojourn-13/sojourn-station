/mob/living/simple/hostile/megafauna/excelsior_cosmonaught
	name = "OKB-1"
	desc = "For the people! The excelsior's heaviest option for dealing with enemies of their glorious communist revolution."

	faction = "excelsior"

	icon = 'icons/mob/40x40.dmi'
	icon_state = "excelatomiton_unpowered"
	icon_living = "excelatomiton_unpowered"
	pixel_x = -4
	ranged = TRUE

	health = 800
	maxHealth = 800
	break_stuff_probability = 100
	stop_automated_movement = 1
	armor = list(
		melee = 7,
		bullet = 7,
		energy = 4,
		bomb = 10,
		bio = 100, //robot
		rad = 100, //ROBOT
		agony = 100 ///robot
	)

	aggro_vision_range = 16 //No more cheesing
	vision_range = 40 //No more cheesing

	melee_damage_lower = 40
	melee_damage_upper = 50
	megafauna_min_cooldown = 30
	megafauna_max_cooldown = 60

	wander = FALSE //No more sleepwalking

	projectiletype = /obj/item/projectile/bullet/heavy_rifle_408/hv

	needs_environment = FALSE
	research_value = 3000

/mob/living/simple/hostile/megafauna/excelsior_cosmonaught/death(gibbed, var/list/force_grant)
	if(health <= death_threshold)
		visible_message("<b>[src]</b> blows apart in an explosion!")
		explosion(src.loc, 0,1,3)
		new /obj/effect/decal/cleanable/blood/gibs/robot(src.loc)
		var/datum/effect/effect/system/spark_spread/s = new /datum/effect/effect/system/spark_spread
		s.set_up(3, 1, src)
		s.start()
		..()


/mob/living/simple/hostile/megafauna/excelsior_cosmonaught/LoseTarget()
	..()
	icon_state = initial(icon_state)

/mob/living/simple/hostile/megafauna/excelsior_cosmonaught/LostTarget()
	..()
	icon_state = initial(icon_state)

/mob/living/simple/hostile/megafauna/excelsior_cosmonaught/FindTarget()
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
		icon_state = "excelatomiton"
	else
		icon_state = initial(icon_state)

/mob/living/simple/hostile/megafauna/excelsior_cosmonaught/AttackingTarget()
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

/mob/living/simple/hostile/megafauna/excelsior_cosmonaught/proc/shoot_rocket(turf/marker, set_angle)
	if(!isnum(set_angle) && (!marker || marker == loc))
		return
	var/turf/startloc = get_turf(src)
	var/obj/item/projectile/P = new /obj/item/projectile/bullet/rocket(startloc)
	P.firer = src
	if(target)
		P.original = target
	P.launch( get_step(marker, pick(SOUTH, NORTH, WEST, EAST, SOUTHEAST, SOUTHWEST, NORTHEAST, NORTHWEST)) )


/mob/living/simple/hostile/megafauna/excelsior_cosmonaught/OpenFire()
	var/mob/living/targetted_mob = (target_mob?.resolve())

	anger_modifier = CLAMP(((maxHealth - health)/50),0,20)
	ranged_cooldown = world.time + 30
	SSmove_manager.stop_looping(src)
	telegraph()
	icon_state = "excelatomiton"
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
