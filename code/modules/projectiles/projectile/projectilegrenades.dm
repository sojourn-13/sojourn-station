/obj/item/projectile/bullet/batonround
	name = "baton round"
	icon_state = "grenade"
	damage_types = list(BRUTE = 20, HALLOSS = 100)
	check_armor = ARMOR_MELEE
	armor_divisor = 1
	embed = TRUE			//literally imagine being hit by this.
	can_ricochet = TRUE		//It's rubber
	sharp = FALSE
	recoil = 35

/obj/item/projectile/bullet/grenade
	name = "grenade shell"
	icon_state = "grenade"
	damage_types = list(BRUTE = 10)
	armor_divisor = 1
	embed = TRUE
	sharp = FALSE
	check_armor = ARMOR_BULLET
	recoil = 45

/obj/item/projectile/bullet/grenade/Move()	//Makes grenade shells cause their effect when they arrive at their target turf
	if(get_turf(src) == get_turf(original))
		if (!testing)
			grenade_effect(get_turf(src))
		else
			impact_atom = original
		qdel(src)
	else
		..()

/obj/item/projectile/bullet/grenade/on_impact(atom/target)	//Allows us to cause different effects for each grenade shell on hit
	if (!testing)
		grenade_effect(target)

/obj/item/projectile/bullet/grenade
	name = "blast shell"
	var/devastation_range = 0
	var/heavy_impact_range = 0
	var/light_impact_range = 3
	var/flash_range = 10
	recoil = 55

/obj/item/projectile/bullet/grenade/proc/grenade_effect(target)
	explosion(target, devastation_range, heavy_impact_range, light_impact_range, flash_range)


/obj/item/projectile/bullet/grenade/frag
	name = "frag shell"
	var/range = 7
	var/f_type = /obj/item/projectile/bullet/pellet/fragment/strong
	var/f_amount = 100
	var/f_damage = 4
	var/f_step = 2
	var/same_turf_hit_chance = 15
	recoil = 25

/obj/item/projectile/bullet/grenade/frag/grenade_effect(target)
	fragment_explosion(target, range, f_type, f_amount, f_damage, f_step, same_turf_hit_chance)

/obj/item/projectile/bullet/grenade/frag/stinger
	name = "stinger shell"
	f_type = /obj/item/projectile/bullet/pellet/fragment/rubber
	f_amount = 50 //25 less than a handheld grenade, still does a LOT of halloss

//Weaker do to being used in a strong gun
/obj/item/projectile/bullet/grenade/frag/nt
	range = 5
	f_type = /obj/item/projectile/bullet/pellet/fragment
	f_amount = 50
	f_damage = 2

/obj/item/projectile/bullet/grenade/emp
	var/heavy_emp_range = 3
	var/light_emp_range = 8
	recoil = 15

/obj/item/projectile/bullet/grenade/emp/grenade_effect(target)
	empulse(target, heavy_emp_range, light_emp_range)

/obj/item/projectile/bullet/grenade/frag/weak
	name = "frag shell"
	range = 7
	f_type = /obj/item/projectile/bullet/pellet/fragment/strong
	f_amount = 100
	f_damage = 2
	f_step = 1
	same_turf_hit_chance = 10
	recoil = 10

/obj/item/projectile/bullet/grenade/flash
	name = "flash shell"
	light_impact_range = 1
	flash_range = 10
	recoil = 5

/obj/item/projectile/bullet/grenade/flash/grenade_effect(target)
	if (!testing)
		fragment_explosion(target, light_impact_range, flash_range)
	..()
	if (!testing)
		for(var/obj/structure/closet/L in hear(7, get_turf(src)))
			if(locate(/mob/living/carbon/, L))
				for(var/mob/living/carbon/M in L)
					flashbang_bang(get_turf(src), M)


		for(var/mob/living/carbon/M in hear(7, get_turf(src)))
			flashbang_bang(get_turf(src), M)

		for(var/obj/effect/blob/B in hear(8,get_turf(src)))	   		//Blob damage here
			var/damage = round(30/(get_dist(B,get_turf(src))+1))
			B.take_damage(damage)
			B.update_icon()

		new/obj/effect/sparks(src.loc)
		new/obj/effect/effect/smoke/illumination(src.loc, brightness=15)
	if (testing)
		impact_atom = target
	qdel(src)
	return

/obj/item/projectile/bullet/grenade/net
	name = "net shell"
	recoil = 5

/obj/item/projectile/bullet/grenade/net/grenade_effect(target)
	if (!testing)
		var/turf/T = get_turf(target)
		if(T && isliving(target))
			var/mob/living/M = target
			if(!locate(/obj/effect/energy_net) in T)
				var/obj/effect/energy_net/safari/net = new(T)
				net.layer = M.layer + 1
				net.buckle_mob(M)
				net.affecting = M
				T.visible_message(SPAN_WARNING("[M] was caught in an energy net!"))
		else
			// If it doesn't hit a living target, just spawn the net item
			new /obj/item/energy_net/safari(T)

/obj/item/projectile/bullet/grenade/energy_net
	name = "energy net grenade"
	desc = "A grenade that deploys an energy net."
	icon_state = "grenade"
	recoil = 3

/obj/item/projectile/bullet/grenade/energy_net/on_impact(atom/target)
	if (!testing && isliving(target))
		var/mob/living/M = target
		var/turf/T = get_turf(M)
		if(T && !locate(/obj/effect/energy_net) in T)
			var/obj/effect/energy_net/safari/net = new(T)
			net.layer = M.layer + 1
			net.buckle_mob(M)
			net.affecting = M
			T.visible_message(SPAN_WARNING("[M] was caught in an energy net!"))
	return TRUE

/obj/item/proc/flash(var/turf/T, var/mob/living/carbon/M, var/explosion_text = "BANG") //Bang made into an item proc so lot's of stuff can use it wtihout copy - paste
	to_chat(M, SPAN_DANGER(explosion_text))								// Called during the loop that bangs people in lockers/containers and when banging
	playsound(src.loc, 'sound/effects/bang.ogg', 50, 1, 5)		// people in normal view.  Could theroetically be called during other explosions.
																// -- Polymorph

//Checking for protections
	var/eye_safety = 0
	var/ear_safety = 0
	var/stat_def = -STAT_LEVEL_ADEPT
	if(iscarbon(M))
		eye_safety = M.eyecheck()
		if(ishuman(M))
			if(istype(M:l_ear, /obj/item/clothing/ears/earmuffs) || istype(M:r_ear, /obj/item/clothing/ears/earmuffs))
				ear_safety += 2
			if(HULK in M.mutations)
				ear_safety += 1
			if(istype(M:head, /obj/item/clothing/head/helmet))
				ear_safety += 1
			if(M.stats.getPerk(PERK_EAR_OF_QUICKSILVER))
				stat_def *= 2

//Flashing everyone
	if(eye_safety < FLASH_PROTECTION_MODERATE)
		flash(0, TRUE,TRUE,TRUE)



//Now applying sound
	if((get_dist(M, T) <= 2 || src.loc == M.loc || src.loc == M))
		if(ear_safety <= 0)
			stat_def *= 5
			if ((prob(14) || (M == src.loc && prob(70))))
				M.ear_damage += rand(1, 10)
				M.confused = max(M.confused,8)
			else
				M.ear_damage += rand(0, 5)
				M.ear_deaf = max(M.ear_deaf,15)
				M.confused = max(M.confused,8)
		else
			stat_def *= 2
			M.confused = max(M.confused,4)

	else if(get_dist(M, T) <= 5)
		if(ear_safety <= 0)
			stat_def *= 4
			M.ear_damage += rand(0, 3)
			M.ear_deaf = max(M.ear_deaf,10)
			M.confused = max(M.confused,6)
		else
			M.confused = max(M.confused,2)

	else if(!ear_safety)
		stat_def *= 2
		M.ear_damage += rand(0, 1)
		M.ear_deaf = max(M.ear_deaf,5)
		M.confused = max(M.confused,5)

	//This really should be in mob not every check
	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		var/obj/item/organ/internal/eyes/E = H.random_organ_by_process(OP_EYES)
		if (E && E.damage >= E.min_bruised_damage)
			to_chat(M, SPAN_DANGER("Your eyes start to burn badly!"))
	if (M.ear_damage >= 15)
		to_chat(M, SPAN_DANGER("Your ears start to ring badly!"))
	else
		if (M.ear_damage >= 5)
			to_chat(M, SPAN_DANGER("Your ears start to ring!"))
	M.stats.addTempStat(STAT_VIG, stat_def, 10 SECONDS, "flashbang")
	M.stats.addTempStat(STAT_COG, stat_def, 10 SECONDS, "flashbang")
	M.stats.addTempStat(STAT_BIO, stat_def, 10 SECONDS, "flashbang")
	M.stats.addTempStat(STAT_MEC, stat_def, 10 SECONDS, "flashbang")
	M.update_icons()
