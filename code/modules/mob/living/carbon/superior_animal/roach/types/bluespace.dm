/mob/living/carbon/superior_animal/roach/bluespace
	name = "Unbekannt roach"
	desc = "This shimmering insectoid-like creature greatly resembles a giant cockroach. It flickers in and out of reality, as if it didn't really belong here."
	icon_state = "bluespaceroach"
	maxHealth = 25 * ROACH_HEALTH_MOD
	health = 25 * ROACH_HEALTH_MOD
	meat_type = /obj/item/bluespace_crystal
	melee_damage_lower = 3
	melee_damage_upper = 10
	sanity_damage = 1

/* TODO: Make these a threat and not free loot
	waring_faction = "" //It was a inside job
	waring_faction_multy = 5 //We know your weakness
*/
	price_tag = 1500
	flash_resistances = 15 //We are the light
	armor_divisor = 10 //We teleport past the armor

	//spawn_blacklisted = TRUE
	var/change_tele_to_mob = 25
	var/chance_tele_to_eat = 25
	var/chance_tele_to_random = 10

/mob/living/carbon/superior_animal/roach/bluespace/Initialize(mapload)
	. = ..()
	do_sparks(3, 0, src.loc)

/mob/living/carbon/superior_animal/roach/bluespace/handle_ai()
	..()

	var/atom/targetted_mob = (target_mob?.resolve())

	var/turf/target
	if((stance == HOSTILE_STANCE_ATTACK || stance == HOSTILE_STANCE_ATTACKING) && targetted_mob && !Adjacent(targetted_mob) && prob(change_tele_to_mob))
		target = get_turf(targetted_mob)
	else if(eat_target && busy == 1 && eat_target && !Adjacent(eat_target) && prob(chance_tele_to_eat))
		target = get_turf(eat_target)
	else if(stance == HOSTILE_STANCE_IDLE && !busy && prob(chance_tele_to_random))
		target = get_random_secure_turf_in_range(src, 7, 1)
	if(target)
		playsound(src, 'sound/voice/insect_battle_screeching.ogg', 30, 1, -3)
		do_sparks(3, 0, src.loc)
		do_teleport(src, target, 1)
		playsound(src, 'sound/voice/insect_battle_screeching.ogg', 30, 1, -3)

/mob/living/carbon/superior_animal/roach/bluespace/attackby(obj/item/W, mob/user, params)
	var/atom/targetted_mob = (target_mob?.resolve())

	if(prob(change_tele_to_mob))
		var/source = src
		if(targetted_mob)
			source = targetted_mob
		var/turf/T = get_random_secure_turf_in_range(source, 2, 1)
		do_sparks(3, 0, src.loc)
		do_teleport(src, T)
		return FALSE
	. = ..()

/mob/living/carbon/superior_animal/roach/bluespace/attack_hand(mob/living/carbon/M)
	var/atom/targetted_mob = (target_mob?.resolve())

	if(M.a_intent != I_HELP && prob(change_tele_to_mob))
		var/source = src
		if(targetted_mob)
			source = targetted_mob
		var/turf/T = get_random_secure_turf_in_range(source, 2, 1)
		do_sparks(3, 0, src.loc)
		do_teleport(src, T)
		return FALSE
	. = ..()

/mob/living/carbon/superior_animal/roach/bluespace/bullet_act(obj/item/projectile/P, def_zone)
	var/atom/targetted_mob = (target_mob?.resolve())

	if (!(P.testing))
		if(prob(change_tele_to_mob))
			var/source = src
			if(targetted_mob)
				source = targetted_mob
			var/turf/T = get_random_secure_turf_in_range(source, 2, 1)
			do_sparks(3, 0, src.loc)
			do_teleport(src, T)
			return FALSE
	. = ..()

/mob/living/carbon/superior_animal/roach/bluespace/attack_generic(mob/user, damage, attack_message, damagetype = BRUTE, attack_flag = ARMOR_MELEE, sharp = FALSE, edge = FALSE)
	var/atom/targetted_mob = (target_mob?.resolve())

	if(!damage || !istype(user))
		return FALSE
	if(prob(change_tele_to_mob))
		var/source = src
		if(targetted_mob)
			source = targetted_mob
		var/turf/T = get_random_secure_turf_in_range(source, 2, 1)
		do_sparks(3, 0, src.loc)
		do_teleport(src, T)
		return FALSE
	. = ..()
