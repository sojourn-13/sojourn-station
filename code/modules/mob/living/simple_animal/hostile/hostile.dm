#define ENVIRONMENT_SMASH_NONE			0
#define ENVIRONMENT_SMASH_STRUCTURES	(1<<0) 	//crates, lockers, ect
#define ENVIRONMENT_SMASH_WALLS			(1<<1)  //walls
#define ENVIRONMENT_SMASH_RWALLS		(1<<2)	//rwalls
var/list/mydirs = list(NORTH, SOUTH, EAST, WEST, SOUTHWEST, NORTHWEST, NORTHEAST, SOUTHEAST)

/mob/living/simple/hostile
	faction = "hostile"
	var/stance = HOSTILE_STANCE_IDLE	//Used to determine behavior

	var/attack_same = FALSE

	var/ranged = FALSE
	var/rapid = FALSE
	var/projectiletype
	var/projectilesound
	var/casingtype

	var/list/friends = list()

	var/break_stuff_probability = 100
	var/ranged_ignores_vision
	stop_automated_movement_when_pulled = 0
	var/destroy_surroundings = 1
	var/fire_verb = "fires"
	a_intent = I_HURT
	can_burrow = FALSE
	hunger_enabled = 0//Until automated eating mechanics are enabled, disable hunger for hostile mobs

	var/research_value = 100

	var/minimum_distance = 1 //Minimum approach distance, so ranged mobs chase targets down, but still keep their distance set in tiles
	var/atom/targets_from = null //all range/attack/etc. calculations should be done from this atom, defaults to the mob itself, useful for Vehicles and such

	var/vision_range = 9 //How big of an area to search for targets in, a vision of 9 attempts to find targets as soon as they walk into screen view
	var/aggro_vision_range = 9 //If a mob is aggro, we search in this radius. Defaults to 9 to keep in line with original  mob aggro radius
	var/approaching_target = FALSE //We should dodge now

	var/poison_per_bite = 0 //To handle poisonous bigguns
	var/poison_type

	var/list/zone_hit_rates = list(BP_HEAD = 10, BP_CHEST = 50, BP_GROIN = 35, BP_R_ARM = 30, BP_L_ARM = 30, BP_R_LEG = 20, BP_L_LEG = 20)

/mob/living/simple/hostile/Destroy()
	target_mob = null

	. = ..()


/mob/living/simple/hostile/proc/FindTarget()
	var/atom/T = null
	stop_automated_movement = 0
	for(var/atom/A in ListTargets(vision_range))

		if(A == src)
			continue

		var/atom/F = Found(A)
		if(F)
			T = F
			break

		if(isliving(A))
			var/mob/living/L = A
			if(L.faction == src.faction && !attack_same)
				continue
			if(L.colony_friend && src.colony_friend)
				continue
			else if(L in friends)
				continue
			if(L.target_dummy) //So we target these over normal lists
				if(!SA_attackable(L))
					stance = HOSTILE_STANCE_ATTACK
					T = L
					break
			else
				if(!SA_attackable(L))
					stance = HOSTILE_STANCE_ATTACK
					T = L
					break

		else if(istype(A, /obj/mecha) && !friendly_to_colony) // Our line of sight stuff was already done in ListTargets().
			var/obj/mecha/M = A
			if (M.occupant)
				stance = HOSTILE_STANCE_ATTACK
				T = M
				break

		if(istype(A, /obj/machinery/bot) && !friendly_to_colony)
			var/obj/machinery/bot/B = A
			if (B.health > 0)
				stance = HOSTILE_STANCE_ATTACK
				T = B
				break

		if(istype(A, /obj/machinery/porta_turret) && !friendly_to_colony)
			var/obj/machinery/porta_turret/P = A
			if (P.health > 0)
				stance = HOSTILE_STANCE_ATTACK
				T = P
				break

	return T


/mob/living/simple/hostile/proc/Found(var/atom/A)
	return

/mob/living/simple/hostile/proc/MoveToTarget()
	var/mob/living/target = (target_mob?.resolve())

	stop_automated_movement = TRUE
	if(!target || SA_attackable(target))
		stance = HOSTILE_STANCE_IDLE
	if(target in ListTargets(10))
		if(!anchored)
			if(ranged)
				if(prob(45))
					stance = HOSTILE_STANCE_ATTACKING
					set_glide_size(DELAY2GLIDESIZE(move_to_delay))
					SSmove_manager.move_to(src, target, 1, move_to_delay)
				else
					OpenFire(target)
			else
				stance = HOSTILE_STANCE_ATTACKING
				set_glide_size(DELAY2GLIDESIZE(move_to_delay))
				SSmove_manager.move_to(src, target, 1, move_to_delay)
	return FALSE

/mob/living/simple/hostile/proc/DestroyPathToTarget()
	var/mob/living/target = (target_mob?.resolve())

	if(environment_smash)
		EscapeConfinement()
		var/dir_to_target = get_dir(targets_from, target)
		var/dir_list = list()
		if(dir_to_target in mydirs) //it's diagonal, so we need two directions to hit
			for(var/direction in mydirs)
				if(direction & dir_to_target)
					dir_list += direction
		else
			dir_list += dir_to_target
		for(var/direction in dir_list) //now we hit all of the directions we got in this fashion, since it's the only directions we should actually need
			DestroyObjectsInDirection(direction)

/mob/living/simple/hostile/proc/EscapeConfinement()
	if(!isturf(targets_from.loc) && targets_from.loc != null)//Did someone put us in something?
		var/atom/A = targets_from.loc
		UnarmedAttack(A)//Bang on it till we get out

/mob/living/simple/hostile/proc/DestroyObjectsInDirection(direction)
	var/turf/T = get_step(targets_from, direction)
	if(QDELETED(T))
		return
	if(T.Adjacent(targets_from))
		UnarmedAttack(T)
		return
	for(var/obj/O in T.contents)
		if(!O.Adjacent(targets_from))
			continue
		if((istype(O, /obj/machinery) || istype(O, /obj/structure) && O.density && environment_smash >= ENVIRONMENT_SMASH_STRUCTURES))
			UnarmedAttack(O)
			return

/mob/living/simple/hostile/proc/AttackTarget()
	var/atom/target = (target_mob?.resolve())

	stop_automated_movement = 1
	if(!target || SA_attackable(target))
		LoseTarget()
		return 0
	if(!(target in ListTargets(10)))
		LostTarget()
		return 0
	if(get_dist(src, target) <= 1)	//Attacking
		AttackingTarget()
		return 1

/mob/living/simple/hostile/proc/AttackingTarget()
	var/atom/target = (target_mob?.resolve())

	if(!Adjacent(target))
		return
	if(isliving(target))
		if(ishuman(target))
			var/mob/living/carbon/human/H = target
			if(H.check_shields(rand(melee_damage_lower,melee_damage_upper), null, src, null, attacktext)) //Do they block us?
				return H

			if(poison_per_bite > 0)
				if(H.reagents)
					var/zone_armor =  H.getarmor(targeted_organ, ARMOR_MELEE)
					var/poison_injected = zone_armor ? poison_per_bite * (-0.01 * zone_armor + 1) : poison_per_bite
					H.reagents.add_reagent(poison_type, poison_injected)

		target.attack_generic(src,rand(melee_damage_lower,melee_damage_upper),attacktext)
		playsound(src.loc, attack_sound, 50, 1)
		return target

	if(istype(target,/obj/mecha))
		var/obj/mecha/M = target
		M.attack_generic(src,rand(melee_damage_lower,melee_damage_upper),attacktext)
		playsound(src.loc, attack_sound, 50, 1)
		return M
	if(istype(target,/obj/machinery/bot))
		var/obj/machinery/bot/B = target
		B.attack_generic(src,rand(melee_damage_lower,melee_damage_upper),attacktext)
		playsound(src.loc, attack_sound, 50, 1)
		return B
	if(istype(target,/obj/machinery/porta_turret))
		var/obj/machinery/porta_turret/P = target
		P.attack_generic(src,rand(melee_damage_lower,melee_damage_upper),attacktext)
		playsound(src.loc, attack_sound, 50, 1)
		return P
	if(istype(target,/obj/machinery/tesla_turret))
		var/obj/machinery/tesla_turret/T = target
		T.attack_generic(src,rand(melee_damage_lower,melee_damage_upper),attacktext)
		playsound(src.loc, attack_sound, 50, 1)
		return T


/mob/living/simple/hostile/proc/LoseTarget()
	stance = HOSTILE_STANCE_IDLE
	target_mob = null
	SSmove_manager.stop_looping(src)

/mob/living/simple/hostile/proc/LostTarget()
	stance = HOSTILE_STANCE_IDLE
	SSmove_manager.stop_looping(src)


/mob/living/simple/hostile/proc/ListTargets(var/dist = 7)
	var/list/L = hearers(src, dist)

	for (var/obj/mecha/M in GLOB.mechas_list)
		if (M.z == src.z && get_dist(src, M) <= dist)
			L += M

	return L

/mob/living/simple/hostile/Life()
	. = ..()

	if(ckey)
		return

	if(!stasis && !AI_inactive)
		if(!.)
			SSmove_manager.stop_looping(src)
			return 0
		if(client)
			return 0

		if(!stat)
			switch(stance)
				if(HOSTILE_STANCE_IDLE)
					target_mob = WEAKREF(FindTarget())

				if(HOSTILE_STANCE_ATTACK)
					if(destroy_surroundings)
						DestroySurroundings()
					MoveToTarget()

				if(HOSTILE_STANCE_ATTACKING)
					if(destroy_surroundings)
						DestroySurroundings()
					AttackTarget()

/mob/living/simple/hostile/proc/OpenFire(atom/target_mob)
	var/target = target_mob

	if(QDELETED(target_mob))
		stance = HOSTILE_STANCE_IDLE
		target_mob = null
		return

	visible_message("\red <b>[src]</b> [fire_verb] at [target]!", 1)


	if(rapid)
		spawn(1)
			Shoot(target, src.loc, src)
			if(casingtype)
				new casingtype(get_turf(src))
		spawn(4)
			Shoot(target, src.loc, src)
			if(casingtype)
				new casingtype(get_turf(src))
		spawn(6)
			Shoot(target, src.loc, src)
			if(casingtype)
				new casingtype(get_turf(src))
	else
		Shoot(target, src.loc, src)
		if(casingtype)
			new casingtype

	stance = HOSTILE_STANCE_IDLE
	target_mob = null
	return

/mob/living/simple/hostile/proc/Shoot(var/target, var/start, var/user, var/bullet = 0)
	if(target == start)
		return

	var/obj/item/projectile/A = new projectiletype(src.loc)
	playsound(user, projectilesound, 100, 1)
	if(!A)	return
	var/def_zone = pickweight(zone_hit_rates)
	A.original_firer = src
	A.predetermed = def_zone
	A.launch(target, def_zone)

/mob/living/simple/hostile/MiddleClickOn(mob/targetDD as mob) //Letting Mobs Fire when middle clicking as someone controlling it.
	var /mob/living/simple/hostile/shooter = src //TODO: Make it work for alt click in perfs like rig code
	if(ranged_cooldown >= world.time) //Modula for admins to set them at different things
		to_chat(src, "You gun isnt ready to fire!.")
		return
	if(shooter.ranged ==1)
		shooter.OpenFire(targetDD)

/mob/living/simple/hostile/proc/DestroySurroundings()
	var/atom/target = (target_mob?.resolve())

	if(istype(src, /mob/living/simple/hostile/megafauna))
		set_dir(get_dir(src,target))
		for(var/turf/simulated/wall/obstacle in get_step(src, dir))
			if(prob(35))
				obstacle.dismantle_wall(1)
		for(var/obj/machinery/obstacle in get_step(src, dir))
			if(prob(65))
				obstacle.Destroy()
		for(var/obj/structure/obstacle in get_step(src, dir))
			if(prob(95))
				qdel(obstacle)

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
					obstacle.attack_generic(src,rand(melee_damage_lower,melee_damage_upper) * 5,attacktext) //Lots of health
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

			for(var/obj/machinery/tesla_turret/obstacle in get_step(src,dir)) //Weak plastic will not bar us
				if(obstacle.density == TRUE)
					obstacle.attack_generic(src,rand(melee_damage_lower,melee_damage_upper),attacktext)
					return

/mob/living/simple/hostile/verb/break_around()
	set name = "Attack Surroundings "
	set desc = "Lash out on the your surroundings | Forcefully attack your surroundings."
	set category = "Mob verbs"

	src.DestroySurroundings()
