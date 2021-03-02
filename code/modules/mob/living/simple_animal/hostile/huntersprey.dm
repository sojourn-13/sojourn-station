/mob/living/simple_animal/hostile/renderpatriarch
	name = "render patriarch"
	desc = "A hulking monster out of a living nightmare. Its powerful hide can shrug off advanced lasers with ease and its heavily armored skin requires powerful ballistics to pierce."
	icon = 'icons/mob/renderpatriarch.dmi'
	icon_state = "rpatriarch"
	icon_living = "rpatriarch"
	icon_rest = "deathclaw_sleep"
	icon_dead = "deathclaw_dead"
	icon_gib = "deathclaw_gib"
	aggro_vision_range = 12
	environment_smash = 2
	break_stuff_probability = 95
	attacktext = "mauled"
	faction = "deathclaw"
	maxHealth = 2200
	health = 2200
	melee_damage_lower = 30
	melee_damage_upper = 35
	old_x = -16
	speed = 0.8
	var/zoomeye = 7
	see_invisible = 15
	var/regenrate = 25
	var/spinecooldown = 0
	var/roarcooldown = 0
	var/chargecooldown = 0
	var/charging = 0 //Are we charging right now?
	var/fatigue = 0 //How tired are we?
	var/maxfatigue = 6 //How tired can we become?
	old_y = 0
	projectiletype = /obj/item/projectile/renderspine
	default_pixel_x = -16
	pixel_x = -16
	pixel_y = 0
	meat_amount = 6
	meat_type = /obj/item/weapon/reagent_containers/food/snacks/meat/primal
	can_burrow = FALSE
	mob_size =  3  // The same as Hivemind Tyrant
	attack_sound = 'sound/xenomorph/alien_bite2.ogg'

/obj/item/projectile/renderspine
	name = "spine"
	icon_state = "SpearFlight"
	damage_types = list(BRUTE = 12)
	step_delay = 2

/mob/living/simple_animal/hostile/renderpatriarch/death()
	..()
	visible_message("<b>[src]</b> roars loudly as it falls apart, exploding at the seams! Its last meal drops down.")
	var chancedrop = rand(1,3)
	if(chancedrop == 1)
		new /obj/item/clothing/suit/armor/vest/technomancersuit (src.loc)
		new	/obj/item/weapon/gun/energy/laser/railgun/pistol (src.loc)
		new /obj/item/weapon/storage/belt/utility/full (src.loc)
		qdel(src)
		return
	if(chancedrop == 2)
		new /obj/item/weapon/gun/projectile/boltgun/sa (src.loc)
		new	/obj/item/ammo_magazine/rifle_75 (src.loc)
		new /obj/item/ammo_magazine/ammobox/rifle_75 (src.loc)
		new /obj/item/clothing/suit/space/void/SCAF/blackshield (src.loc)
		qdel(src)
		return
	if(chancedrop == 3)
		new /obj/item/weapon/tool/sword/katana/nano (src.loc)
		new /obj/item/clothing/suit/armor/vest/soteriasuit (src.loc)
		new /obj/item/clothing/head/helmet/soteriasuit (src.loc)
		qdel(src)
		return
	qdel(src)
	return

/mob/living/simple_animal/hostile/renderpatriarch/UnarmedAttack()
	..()
	if(fatigue <= maxfatigue)
		fatigue = fatigue + 1
	if(fatigue > 0 )
		speed = initial(speed) * fatigue
		melee_damage_lower = initial(melee_damage_lower) - fatigue * 2
		melee_damage_upper = initial(melee_damage_upper) - fatigue * 2

/mob/living/simple_animal/hostile/renderpatriarch/death(gibbed, deathmessage = "lets out a gutteral snarl before it crumbles to the ground dead!")
	walk_to(src,0)
	movement_target = null
	icon_state = icon_dead
	density = 0
	return ..(gibbed,deathmessage)

/mob/living/simple_animal/hostile/renderpatriarch/MiddleClickOn(mob/targetDD as mob)
	if(world.time < chargecooldown)
		to_chat(usr, SPAN_NOTICE("You are too tired to charge again just yet."))
		return FALSE
	if(health < maxHealth - regenrate)
		health = health + regenrate
	var/chargepast = 2
	if(!targetDD)
		return
	var/chargeturf = get_turf(targetDD)
	if(!chargeturf)
		return
	var/dir = get_dir(src, chargeturf)
	var/turf/T = get_ranged_target_turf(chargeturf, dir, chargepast)
	if(!T)
		return
	DestroySurroundings()
	walk(src, 0)
	src.dir=dir
	animate(src, alpha = 255, color = "#FF0000", transform = matrix()*1.2, time = 2)
	sleep(2)
	animate(src, alpha = 255, color = initial(color), transform = matrix()*1, time = 2)
	sleep(2)
	animate(src, alpha = 255, color = "#FF0000", transform = matrix()*1.2, time = 2)
	sleep(2)
	animate(src, alpha = 255, color = initial(color), transform = matrix()*1, time = 2)
	sleep(2)
	visible_emote("releases a roar as it prepares to charge!")
	playsound(src, 'sound/voice/deathclaw_roar.ogg', 30, 1, -3)
	var/obj/P = new /obj/effect/decal/point(chargeturf)
	P.pixel_x = targetDD.pixel_x
	P.pixel_y = targetDD.pixel_y
	QDEL_IN(P, 2 SECONDS)
	sleep(10	)
	animate(src, alpha = 255, color = "#FF0000", transform = matrix()*1.2, time = 3)
	sleep(1)
	var/movespeed = 0.7
	walk_towards(src, T, movespeed)
	charging = 1
	sleep(get_dist(src, T)* movespeed)
	walk(src, 0)
	animate(src, alpha = 255, color = initial(color), transform = matrix()*1, time = 3)
	charging = 0
	fatigue = 0
	speed = initial(speed)
	melee_damage_lower = initial(melee_damage_lower)
	melee_damage_upper = initial(melee_damage_upper)
	chargecooldown = world.time + 7 SECONDS

/mob/living/simple_animal/hostile/renderpatriarch/Bump(var/atom/obstacle)
	.=..()
	if(iscarbon(obstacle) && charging)
		var/mob/living/carbon/J = obstacle
		J.take_organ_damage(12)
		J.throw_at(get_edge_target_turf(src,pick(alldirs)),rand(3,6),30)

/mob/living/simple_animal/hostile/renderpatriarch/proc/spineburst()
	if(world.time < spinecooldown)
		to_chat(usr, SPAN_NOTICE("Your spines are still regrowing."))
		return FALSE
	if(health < maxHealth - regenrate)
		health = health + regenrate
	visible_emote("stretches as it explodes out with spines!")
	animate(src, alpha = 255, color = "#666699", transform = matrix()*0.8, time = 2)
	sleep(2)
	animate(src, alpha = 255, color = initial(color), transform = matrix()*1, time = 2)
	sleep(2)
	animate(src, alpha = 255, color = "#FFFFFF", transform = matrix()*0.9, time = 2)
	sleep(2)
	animate(src, alpha = 255, color = initial(color), transform = matrix()*1, time = 2)
	sleep(2)
	animate(src, alpha = 255, color = "#666699", transform = matrix()*0.8, time = 2)
	sleep(2)
	animate(src, alpha = 255, color = initial(color), transform = matrix()*1, time = 2)
	sleep(2)
	animate(src, alpha = 255, color = "#FFFFFF", transform = matrix()*0.9, time = 2)
	sleep(2)
	animate(src, alpha = 255, color = initial(color), transform = matrix()*1, time = 2)
	sleep(2)
	var/turf/U = get_turf(src)
	for(var/T in RANGE_TURFS(12, U) - U)
		if(prob(6))
			sleep(rand(0,1))
			shoot_projectile(T, pick(GLOB.alldirs))
	fatigue = 0
	speed = initial(speed)
	melee_damage_lower = initial(melee_damage_lower)
	melee_damage_upper = initial(melee_damage_upper)
	spinecooldown = 15 SECONDS + world.time

/mob/living/simple_animal/hostile/renderpatriarch/verb/zoomthateye()
	if(zoomeye == 7)
		zoomeye = 9
		usr.client.view = 9
		return
	if(zoomeye == 9)
		zoomeye = 12
		usr.client.view = 12
		return
	if(zoomeye == 12)
		zoomeye = 7
		usr.client.view = 7
		return
	return

/mob/living/simple_animal/hostile/renderpatriarch/verb/seteyedistance()
	set name = "Change Visual Distance"
	set category = "Abilities"
	src.zoomthateye()

/mob/living/simple_animal/hostile/renderpatriarch/lay_down()
	set category = "IC"
	var/state_changed = FALSE
	if(resting && can_stand_up())
		resting = FALSE
		state_changed = TRUE


	else if (!resting)
		if(ishuman(src))
			var/obj/item/weapon/bedsheet/BS = locate(/obj/item/weapon/bedsheet) in get_turf(src)
			// If there is unrolled bedsheet roll and unroll it to get in bed like a proper adult does
			if(BS && !BS.rolled && !BS.folded)
				resting = TRUE
				BS.toggle_roll(src, no_message = TRUE)
				BS.toggle_roll(src)
			else
				resting = TRUE
			state_changed = TRUE
		else
			resting = TRUE
			state_changed = TRUE
	if(state_changed)
		to_chat(src, "<span class='notice'>You are now [resting ? "resting" : "getting up"]</span>")
		update_lying_buckled_and_verb_status()

/mob/living/simple_animal/hostile/renderpatriarch/proc/shoot_projectile(turf/marker, var/dir)
	if(!marker || marker == loc)
		visible_emote("fizzle")
		return
	var/turf/startloc = get_turf(src)
	var/obj/item/projectile/P = new projectiletype(startloc)
	P.firer = src
	P.launch(get_step(marker, dir))

/mob/living/simple_animal/hostile/renderpatriarch/verb/spineburstverb()
	set name = "Spine Burst"
	set category = "Abilities"
	src.spineburst()

/mob/living/simple_animal/hostile/renderpatriarch/proc/raginghowl()
	if(world.time < roarcooldown)
		to_chat(usr, SPAN_NOTICE("Your vocal chords are still regenerating."))
		return FALSE
	if(health < maxHealth - regenrate)
		health = health + regenrate
	visible_emote("prepares to release a thunderous howl!")
	animate(src, alpha = 255, color = "#ffffcc", transform = matrix()*1.1, time = 2)
	sleep(5)
	animate(src, alpha = 255, color = initial(color), transform = matrix()*1, time = 2)
	sleep(3)
	animate(src, alpha = 255, color = "#ffffcc", transform = matrix()*1.3, time = 2)
	sleep(3)
	animate(src, alpha = 255, color = initial(color), transform = matrix()*1, time = 2)
	sleep(4)
	animate(src, alpha = 255, color = "#ffffcc", transform = matrix()*1.1, time = 2)
	sleep(5)
	animate(src, alpha = 255, color = initial(color), transform = matrix()*1, time = 2)
	sleep(3)
	animate(src, alpha = 255, color = "#ffffcc", transform = matrix()*1.3, time = 2)
	sleep(3)
	animate(src, alpha = 255, color = initial(color), transform = matrix()*1, time = 2)
	sleep(4)
	playsound(src, 'sound/voice/deathclaw_roar.ogg', 30, 1, -3)
	for(var/obj/structure/closet/L in hear(7, get_turf(src)))
		if(locate(/mob/living/carbon/, L))
			for(var/mob/living/carbon/M in L)
				thunderhowl(get_turf(src), M)


	for(var/mob/living/carbon/M in hear(7, get_turf(src)))
		thunderhowl(get_turf(src), M)

	fatigue = 0
	speed = initial(speed)
	melee_damage_lower = initial(melee_damage_lower)
	melee_damage_upper = initial(melee_damage_upper)
	roarcooldown = 25 SECONDS + world.time
	return

/mob/living/simple_animal/hostile/renderpatriarch/verb/raginghowlverb()
	set name = "Raging Howl"
	set category = "Abilities"
	src.raginghowl()

/mob/living/simple_animal/hostile/renderpatriarch/proc/thunderhowl(var/turf/T, var/mob/living/carbon/M)
	var/ear_safety = 0
	var/stat_def = -STAT_LEVEL_ADEPT
	if(iscarbon(M))
		if(ishuman(M))
			if(istype(M:l_ear, /obj/item/clothing/ears/earmuffs) || istype(M:r_ear, /obj/item/clothing/ears/earmuffs))
				ear_safety += 2
			if(HULK in M.mutations)
				ear_safety += 1
			if(istype(M:head, /obj/item/clothing/head/helmet))
				ear_safety += 1
			if(M.stats.getPerk(PERK_EAR_OF_QUICKSILVER))
				stat_def *= 2

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
	if (M.ear_damage >= 15)
		to_chat(M, SPAN_DANGER("Your ears start to ring badly!"))
	else
		if (M.ear_damage >= 5)
			to_chat(M, SPAN_DANGER("Your ears start to ring!"))
	M.stats.addTempStat(STAT_VIG, stat_def, 10 SECONDS, "shaken")
	M.stats.addTempStat(STAT_COG, stat_def, 10 SECONDS, "shaken")
	M.stats.addTempStat(STAT_BIO, stat_def, 10 SECONDS, "shaken")
	M.stats.addTempStat(STAT_MEC, stat_def, 10 SECONDS, "shaken")
	M.update_icons()