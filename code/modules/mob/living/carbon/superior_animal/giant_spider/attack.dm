/mob/living/carbon/superior/spider/UnarmedAttack(atom/A, proximity)
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

/mob/living/carbon/superior/spider/fortress/emperor/UnarmedAttack(atom/A, proximity, allow_attack_build = TRUE)
	. = ..()
	if(!.)
		return
	if(allow_attack_build)
		attack_build_up += CLAMP(GLOB.chaos_level, 0, 2) //If were at chaos level 2 then is at every other attack, otherwise every 3rd attack
		if(attack_build_up >= 3)
			attack_build_up = 0
			if(ismob(A))
				var/mob/M = A
				dir = reverse_direction(M.dir) //face to face comferation (required for how we handle being attacked)
				var/turf/T = get_turf(A)
				var/turf/T2 = get_step(T, dir)
				var/turf/starter = get_turf(src)

				var/allow_skitter_skit = TRUE
				var/obj/structure/catwalk/kitty
				if(istype(T2, /turf/simulated/open))
					if(!(kitty in T2.contents.len))
						allow_skitter_skit = FALSE

				if(istype(T, /turf/simulated/open))
					if(!(kitty in T.contents.len))
						allow_skitter_skit = FALSE

				if(!allow_skitter_skit)
					return
				if(T2.Enter(src)) //We can walk into the tile behind then we do are supper cool attack!
					sleep(1)
					forceMove(T)
					var/melee_damage_lower_save = melee_damage_lower
					var/melee_damage_upper_save = melee_damage_upper
					melee_damage_lower *= 0.2
					melee_damage_upper *= 0.2
					UnarmedAttack(M, proximity, allow_attack_build = FALSE)
					sleep(2)
					forceMove(T2)
					dir = M.dir
					sleep(2)
					forceMove(T)
					UnarmedAttack(M, proximity, allow_attack_build = FALSE)
					melee_damage_lower = melee_damage_lower_save
					melee_damage_upper = melee_damage_upper_save
					forceMove(starter)
					dir = reverse_direction(M.dir)
