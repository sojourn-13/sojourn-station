/mob/living/simple_animal/hostile/excelsior
	name = "Excelsior Slave"
	desc = "An excelsior rank and file, often converted unwillingly, making them nothing more than cannon fodder as they fight against the implant controlling them. These ones are too far gone, \
	worn down from years of abuse, death is the only mercy they can have."
	icon = 'icons/mob/mobs-humanoid.dmi'
	icon_state = "excel_makarov"
	speak_chance = 5
	turns_per_move = 5
	response_help = "pushes"
	response_disarm = "shoves"
	response_harm = "hits"
	speed = 4
	stop_automated_movement_when_pulled = 1
	wander = 0
	maxHealth = 200
	health = 200
	ranged = 1
	rapid = 1
	ranged_cooldown = 3
	projectiletype = /obj/item/projectile/bullet/pistol_35/hv
	projectilesound = 'sound/weapons/guns/fire/pistol_fire.ogg'
	vision_range = 12
	harm_intent_damage = 5
	melee_damage_lower = 10
	melee_damage_upper = 15
	attacktext = "slashed"
	attack_sound = 'sound/weapons/bladeslice.ogg'
	min_oxy = 0
	max_oxy = 0
	min_tox = 0
	max_tox = 0
	min_co2 = 0
	max_co2 = 0
	min_n2 = 0
	max_n2 = 0
	unsuitable_atoms_damage = 0
	meat_amount = 0
	meat_type = null
	leather_amount = 0
	bones_amount = 0

//Drops
	meat_amount = 4
	meat_type = /obj/item/weapon/reagent_containers/food/snacks/meat/human

	var/weapon1 = /obj/item/weapon/gun/projectile/clarissa/makarov
	faction = "excelsior"

/mob/living/simple_animal/hostile/excelsior/excel_ppsh
	icon_state = "excel_ppsh"
	projectiletype = /obj/item/projectile/bullet/pistol_35/hv
	weapon1 = /obj/item/weapon/gun/projectile/automatic/ppsh
	projectilesound = 'sound/weapons/guns/fire/grease_fire.ogg'

/mob/living/simple_animal/hostile/excelsior/excel_ak
	icon_state = "excel_ak"
	projectiletype = /obj/item/ammo_casing/light_rifle_257/hv
	weapon1 = /obj/item/weapon/gun/projectile/automatic/ak47
	projectilesound = 'sound/weapons/guns/fire/ltrifle_fire.ogg'

/mob/living/simple_animal/hostile/excelsior/excel_vintorez
	icon_state = "excel_vintorez"
	projectiletype = /obj/item/projectile/bullet/rifle_75/hv
	weapon1 = /obj/item/weapon/gun/projectile/automatic/vintorez
	projectilesound = 'sound/weapons/guns/fire/ltrifle_fire.ogg'

/mob/living/simple_animal/hostile/excelsior/excel_drozd
	icon_state = "excel_drozd"
	projectiletype = /obj/item/projectile/bullet/pistol_35/hv
	weapon1 = /obj/item/weapon/gun/projectile/automatic/drozd
	projectilesound = 'sound/weapons/guns/fire/smg_fire.ogg'

/mob/living/simple_animal/hostile/excelsior/death(gibbed, deathmessage = "drops its weapon as it explodes in a shower of gore when their death implant detonates!")
	..()
	new /obj/effect/gibspawner/human(src.loc)
	playsound(src, 'sound/effects/Explosion2.ogg', 75, 1, -3)
	if(weapon1)
		new weapon1(src.loc)
		weapon1 = null
	qdel(src)
	return

/mob/living/simple_animal/hostile/megafauna/excelsior_cosmonaught
	name = "OKB-1"
	desc = "For the people! The excelsior's heaviest option for dealing with enemies of their glorious communist revolution."

	faction = "excelsior"

	icon = 'icons/mob/40x40.dmi'
	icon_state = "excelatomiton_unpowered"
	icon_living = "excelatomiton_unpowered"
	pixel_x = -4
	ranged = TRUE

	health = 1700
	maxHealth = 1700
	break_stuff_probability = 100
	stop_automated_movement = 1

	aggro_vision_range = 16 //No more cheesing
	vision_range = 40 //No more cheesing

	melee_damage_lower = 40
	melee_damage_upper = 50
	megafauna_min_cooldown = 30
	megafauna_max_cooldown = 60

	wander = FALSE //No more sleepwalking

	projectiletype = /obj/item/projectile/bullet/heavy_rifle_408/hv

/mob/living/simple_animal/hostile/megafauna/excelsior_cosmonaught/death(gibbed, var/list/force_grant)
	if(health <= 0)
		visible_message("<b>[src]</b> blows apart in an explosion!")
		explosion(src.loc, 0,1,3)
		new /obj/effect/decal/cleanable/blood/gibs/robot(src.loc)
		var/datum/effect/effect/system/spark_spread/s = new /datum/effect/effect/system/spark_spread
		s.set_up(3, 1, src)
		s.start()
		..()


/mob/living/simple_animal/hostile/megafauna/excelsior_cosmonaught/LoseTarget()
	..()
	icon_state = initial(icon_state)

/mob/living/simple_animal/hostile/megafauna/excelsior_cosmonaught/LostTarget()
	..()
	icon_state = initial(icon_state)

/mob/living/simple_animal/hostile/megafauna/excelsior_cosmonaught/FindTarget()
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

/mob/living/simple_animal/hostile/megafauna/excelsior_cosmonaught/AttackingTarget()
	if(!Adjacent(target_mob))
		return
	if(isliving(target_mob))
		var/mob/living/L = target_mob
		L.attack_generic(src,rand(melee_damage_lower,melee_damage_upper),attacktext)
		return L
	if(istype(target_mob,/obj/mecha))
		var/obj/mecha/M = target_mob
		M.attack_generic(src,rand(melee_damage_lower,melee_damage_upper),attacktext)
		return M
	if(istype(target_mob,/obj/machinery/bot))
		var/obj/machinery/bot/B = target_mob
		B.attack_generic(src,rand(melee_damage_lower,melee_damage_upper),attacktext)
		return B
	if(istype(target_mob,/obj/machinery/porta_turret))
		var/obj/machinery/porta_turret/P = target_mob
		P.attack_generic(src,rand(melee_damage_lower,melee_damage_upper),attacktext)
		return P

/mob/living/simple_animal/hostile/megafauna/excelsior_cosmonaught/proc/shoot_rocket(turf/marker, set_angle)
	if(!isnum(set_angle) && (!marker || marker == loc))
		return
	var/turf/startloc = get_turf(src)
	var/obj/item/projectile/P = new /obj/item/projectile/bullet/rocket(startloc)
	P.firer = src
	if(target)
		P.original = target
	P.launch( get_step(marker, pick(SOUTH, NORTH, WEST, EAST, SOUTHEAST, SOUTHWEST, NORTHEAST, NORTHWEST)) )


/mob/living/simple_animal/hostile/megafauna/excelsior_cosmonaught/OpenFire()
	anger_modifier = CLAMP(((maxHealth - health)/50),0,20)
	ranged_cooldown = world.time + 30
	walk(src, 0)
	telegraph()
	icon_state = "excelatomiton"
	if(prob(35))
		shoot_rocket(target_mob.loc, rand(0,90))
		move_to_delay = initial(move_to_delay)
		MoveToTarget()
		return
	if(prob(45))
		select_spiral_attack()
		move_to_delay = initial(move_to_delay)
		MoveToTarget()
		return
	if(target_mob)
		if(prob(75))
			wave_shots()
			move_to_delay = initial(move_to_delay)
			MoveToTarget()
			return
		else
			shoot_projectile(target_mob.loc, rand(0,90))
			MoveToTarget()
	move_to_delay = initial(move_to_delay)
