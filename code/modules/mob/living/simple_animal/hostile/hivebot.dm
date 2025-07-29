/mob/living/simple/hostile/hivebot
	name = "Malfunctioning Autonomous Drone"
	desc = "An old machine of a long fallen alien empire. Looks like it just attacks everything on sight."
	icon = 'icons/mob/mobs-monster.dmi'
	icon_state = "melee"
	icon_dead = "melee_broken"
	health = 50 * REPUBLICON_HEALTH_MOD
	maxHealth = 50 * REPUBLICON_HEALTH_MOD
	melee_damage_lower = 5
	melee_damage_upper = 13
	attacktext = "sawed"
	projectilesound = 'sound/weapons/energy/Laser.ogg'
	projectiletype = /obj/item/projectile/beam/drone
	faction = "hivebot"
	min_oxy = 0
	max_oxy = 0
	min_tox = 0
	max_tox = 0
	min_co2 = 0
	max_co2 = 0
	min_n2 = 0
	max_n2 = 0
	minbodytemp = 0
	speed = 4
	light_range = 3
	light_color = COLOR_LIGHTING_BLUE_BRIGHT
	mob_classification = CLASSIFICATION_SYNTHETIC
	move_to_delay = 5
	leather_amount = 0
	bones_amount = 0
	//Drops
	var/drop1 = /obj/item/scrap_lump
	var/drop2 = null
	needs_environment = FALSE
	armor = list(melee = 3, bullet = 1, energy = 5, bomb = 25, bio = 100, rad = 25)
	cant_gib = TRUE
	sanity_damage = 1
	research_value = 400

/mob/living/simple/hostile/hivebot/emp_act(severity)
	..()
	adjustFireLoss(rand(20,30))
	if(rapid)
		rapid = FALSE
	if(prob(95) && ranged)
		ranged = FALSE

/mob/living/simple/hostile/hivebot/range
	name = "Malfunctioning Autonomous Sentinel"
	icon_state = "range"
	icon_dead = "range_broken"
	ranged = 1

/mob/living/simple/hostile/hivebot/death()
	..()
	visible_message("<b>[src]</b> blows apart!")
	new /obj/effect/decal/cleanable/blood/gibs/robot(src.loc)
	var/datum/effect/effect/system/spark_spread/s = new /datum/effect/effect/system/spark_spread
	s.set_up(3, 1, src)
	s.start()
	if(drop1)
		new drop1 (src.loc)
		drop1 = null
	if(drop2)
		new drop2 (src.loc)
		drop2 = null
	qdel(src)
	return

/mob/living/simple/hostile/republicon
	name = "Forgotten Engineer"
	desc = "The creators of the malfunctioning autonomous drones, having long since gone haywire themselves they destroy anything they find."
	icon = 'icons/mob/mobs-monster.dmi'
	icon_state = "republicon"
	icon_dead = "republicon_dead"
	health = 75 * REPUBLICON_HEALTH_MOD
	maxHealth = 75 * REPUBLICON_HEALTH_MOD
	melee_damage_lower = 15
	melee_damage_upper = 25
	attacktext = "clawed"
	projectilesound = 'sound/weapons/energy/Laser.ogg'
	projectiletype = /obj/item/projectile/beam //This basiclly nulls armor + deals 20 damage
	faction = "hivebot"
	sanity_damage = 1

	//Death and harvest vars
	meat_amount = 3
	meat_type = /obj/item/scrap_lump
	blood_from_harvest = /obj/effect/decal/cleanable/blood/gibs/robot
	gibspawner = /obj/effect/gibspawner/robot

	min_oxy = 0
	max_oxy = 0
	min_tox = 0
	max_tox = 0
	min_co2 = 0
	max_co2 = 0
	min_n2 = 0
	max_n2 = 0
	minbodytemp = 0
	speed = 4
	light_range = 2
	light_color = COLOR_LIGHTING_RED_BRIGHT
	mob_classification = CLASSIFICATION_SYNTHETIC
	move_to_delay = 5
	research_value = 500

/mob/living/simple/hostile/republicon/emp_act(severity)
	..()
	adjustFireLoss(rand(80,130))
	if(rapid)
		rapid = FALSE
	if(prob(95) && ranged)
		ranged = FALSE

/mob/living/simple/hostile/republicon/range
	name = "Forgotten Sentinel"
	desc = "The creators of the malfunctioning autonomous drones, having long since gone haywire themselves they destroy anything they find. This one is equipped with a heavy laser cannon."
	icon_state = "republicon-armed"
	icon_dead = "republicon-armed_dead"
	ranged = 1
	research_value = 600

/mob/living/carbon/superior/sentinal_seeker
	name = "Forgotten Seeker"
	desc = "An ancient and dangerous machine from a long forgotten time with a heavily armored body can shrug off bullets and melee strikes with ease. At some point, it had a purpose, now it has gone \
	mad and seeks only death, yours and its own."
	icon = 'icons/mob/64x64.dmi'
	icon_state = "seeker"
	icon_dead = "seeker_dead"
	pass_flags = PASSTABLE

	mob_size = MOB_LARGE
	reagent_immune = TRUE
	toxin_immune = TRUE

	attack_sound = 'sound/weapons/rapidslice.ogg'
	speak_emote = list("screams")
	emote_see = list("sharpens its knives carefully.", "shudders and shakes for a moment!", "gushes red ichor!")
	deathmessage = "collapses into a pile of scrap!"
	speak_chance = 5
	sanity_damage = 1

	friendly_to_colony = FALSE

	move_to_delay = 1
	turns_per_move = 4
	see_in_dark = 10

	melee_damage_lower = 35
	melee_damage_upper = 40

	armor = list(melee = 3, bullet = 2, energy = 5, bomb = 25, bio = 0, rad = 25)


	health = 450 * REPUBLICON_HEALTH_MOD
	maxHealth = 450 * REPUBLICON_HEALTH_MOD
	attacktext = "sliced"
	faction = "hivebot"
	viewRange = 14
	default_pixel_x = -16
	randpixel = 0

	can_burrow = FALSE //We cant borrow to the colony or away

	//Death and harvest vars
	meat_amount = 3
	meat_type = /obj/item/scrap_lump
	gibspawner = /obj/effect/gibspawner/robot
	leather_amount = 0
	bones_amount = 0
	fleshcolor = "#080808"
	bloodcolor = "#080808"

	light_range = 6
	light_color = COLOR_LIGHTING_RED_BRIGHT
	mob_classification = CLASSIFICATION_SYNTHETIC
	research_value = 2000

/mob/living/carbon/superior/sentinal_seeker/New()
	..()
	pixel_x = -16
	pixel_y = 0

/mob/living/carbon/superior/sentinal_seeker/attack_hand(mob/living/carbon/M as mob)
	..()
	var/mob/living/carbon/human/H = M

	switch(M.a_intent)
		if (I_HELP)
			help_shake_act(M)

		if (I_GRAB)
			if(!weakened && stat == CONSCIOUS)
				M.adjustBruteLoss(150)
				M.Weaken(5)
				visible_message(SPAN_WARNING("\red [src] immediately impales [M] with one of its three-foot blade tentacles!"))
				return 1
			else
				if(M == src || anchored)
					return 0
				for(var/obj/item/grab/G in src.grabbed_by)
					if(G.assailant == M)
						to_chat(M, SPAN_NOTICE("You already grabbed [src]."))
						return

				var/obj/item/grab/G = new /obj/item/grab(M, src)
				if(buckled)
					to_chat(M, SPAN_NOTICE("You cannot grab [src], \he is buckled in!"))
				if(!G) //the grab will delete itself in New if affecting is anchored
					return

				M.put_in_active_hand(G)
				G.synch()
				LAssailant_weakref = WEAKREF(M)

				M.do_attack_animation(src)
				playsound(loc, 'sound/weapons/thudswoosh.ogg', 50, 1, -1)
				visible_message(SPAN_WARNING("[M] has grabbed [src] passively!"))

				return 1

		if (I_DISARM)
			if(!weakened && stat == CONSCIOUS)
				M.visible_message("\red [src] impales [M] with one of its three-foot blade tentacles!!")
				M.Weaken(5)
				M.adjustBruteLoss(150)
				playsound(loc, 'sound/weapons/punchmiss.ogg', 25, 1, -1)

			M.do_attack_animation(src)

		if (I_HURT)
			var/damage = 3
			if ((stat == CONSCIOUS) && prob(10))
				playsound(loc, 'sound/weapons/punchmiss.ogg', 25, 1, -1)
				M.visible_message("\red [M] missed \the [src]")
			else
				if (istype(H))
					damage += max(0, (H.stats.getStat(STAT_ROB) / 10))
					if (HULK in H.mutations)
						damage *= 2

				playsound(loc, "punch", 25, 1, -1)
				M.visible_message("\red [M] has punched \the [src]")

				adjustBruteLoss(damage)
				updatehealth()
				M.do_attack_animation(src)

				return 1
