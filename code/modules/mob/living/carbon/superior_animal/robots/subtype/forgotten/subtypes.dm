
/mob/living/carbon/superior/robot/forgotton
	name = "Forgotten Server"
	desc = "The creators of the malfunctioning autonomous drones, having long since gone haywire themselves they destroy anything they find."
	icon = 'icons/mob/mobs-monster.dmi'
	icon_state = "republicon_tiny"
	icon_dead = "republicon_tiny_dead"
	health = 75 * REPUBLICON_HEALTH_MOD
	maxHealth = 75 * REPUBLICON_HEALTH_MOD
	melee_damage_lower = 15
	melee_damage_upper = 25
	attacktext = "clawed"
	projectilesound = 'sound/weapons/energy/Laser.ogg'
	projectiletype = /obj/item/projectile/beam //This basiclly nulls armor + deals 20 damage
	faction = "hivebot"
	sanity_damage = 1
	armor = list(melee = 4, bullet = 2, energy = 1, bomb = 60, bio = 100, rad = 100)
	can_block = TRUE

	//Death and harvest vars
	meat_amount = 3
	meat_type = /obj/item/scrap_lump
	gibspawner = /obj/effect/gibspawner/robot
	fleshcolor = "#080808"
	bloodcolor = "#080808"

	light_range = 1
	light_color = COLOR_LIGHTING_RED_BRIGHT
	mob_classification = CLASSIFICATION_SYNTHETIC

	move_to_delay = 4
	turns_per_move = 4

	cleaning = FALSE
	termiation = FALSE
	friendly_to_colony = FALSE


	fancy_attack_overlay = "termite_attack_flick" //Grippers
	fancy_attack_shading = "#080808"
	var/Contempt_Check = 30

/mob/living/carbon/superior/robot/forgotton/UnarmedAttack(var/atom/A, var/proximity)
	if(ishuman(A))
		var/mob/living/carbon/human/H = A
		//We have a minium of 5%
		if(prob(max(5, Contempt_Check - H.stats.getStat(STAT_VIG))) && !H.stats.getPerk(PERK_BLOOD_LUST))
			H.stats.addPerk(PERK_CONTEMPT_GAZE)

			if(prob(Contempt_Check))
				H.frost += 2

		//If you use the perk then you get to glare back
		if(H.stats.getPerk(PERK_BLOOD_LUST) && H.target_dummy)
			H.emote("glare")
			src.stats.addPerk(PERK_CONTEMPT_GAZE)
			//Reverse, the frost deal as burn
			src.adjustFireLoss(2)

			//Sun Branch Intraction
			if(istype(H.glasses, /obj/item/clothing/glasses/firefly_glasses))
				src.adjust_fire_stacks(1)
				src.IgniteMob()
				H.frost -= 2

	//Now do the attack!
	..()

/mob/living/carbon/superior/robot/forgotton/engineer
	name = "Forgotten Engineer"
	desc = "The creators of the malfunctioning autonomous drones, having long since gone haywire themselves they destroy anything they find. \
	This drone has been rigged with a laser cannon and still have limited repairing functions."
	icon_state = "republicon"
	icon_dead = "republicon_dead"
	health = 100 * REPUBLICON_HEALTH_MOD
	maxHealth = 100 * REPUBLICON_HEALTH_MOD
	melee_damage_lower = 15
	melee_damage_upper = 25
	attacktext = "clawed"
	faction = "hivebot"
	sanity_damage = 1
	armor = list(melee = 8, bullet = 8, energy = 6, bomb = 60, bio = 100, rad = 100)

	light_range = 2
	move_to_delay = 5
	var/heal_cooldown = 10 SECONDS
	var/healed_coolingdown = 0

/mob/living/carbon/superior/robot/forgotton/engineer/handle_ai()
	. = ..()

	if(stat == CONSCIOUS)
		if(world.time > heal_cooldown + healed_coolingdown)
			if(health < maxHealth * 0.75) //Put the mask on yourself before others
				healed_coolingdown = heal_cooldown + world.time
				adjustBruteLoss(-10)
				adjustFireLoss(-10)
				adjustOxyLoss(-15)
				updatehealth()
				visible_message(SPAN_NOTICE("[src.name] does some field repairs on themselfs!"))
				playsound(loc, 'sound/items/welderdeactivate.ogg', 50, 1)
				//Feedback that is heard and seen
				var/datum/effect/effect/system/spark_spread/s = new /datum/effect/effect/system/spark_spread
				s.set_up(3, 1, src)
				s.start()
			else
				for(var/mob/living/carbon/superior/robot/R in view(2,src))
					if(R.health < R.maxHealth * 0.75 && R.faction == faction)
						healed_coolingdown = heal_cooldown + world.time
						R.adjustBruteLoss(-10)
						R.adjustFireLoss(-10)
						R.adjustOxyLoss(-15)
						R.updatehealth()
						//Feedback that is heard and seen
						var/datum/effect/effect/system/spark_spread/s = new /datum/effect/effect/system/spark_spread
						s.set_up(3, 1, R)
						s.start()
						visible_message(SPAN_NOTICE("[src.name] does some field repairs on [R.name]!"))
						playsound(loc, 'sound/items/welderdeactivate.ogg', 50, 1)
						break

/mob/living/carbon/superior/robot/forgotton/range
	name = "Forgotten Sentinel"
	desc = "The creators of the malfunctioning autonomous drones, having long since gone haywire themselves they destroy anything they find. This one is equipped with a heavy laser cannon."
	icon_state = "republicon-armed"
	icon_dead = "republicon-armed_dead"
	ranged = 1

	projectilesound = 'sound/weapons/energy/Laser.ogg'
	projectiletype = /obj/item/projectile/beam
	armor = list(melee = 4, bullet = 2, energy = 1, bomb = 60, bio = 100, rad = 100)
	fancy_attack_overlay = "voidwolf_gun_melee_flick" //Off hand has a shotgun like gun. We use this for melee (if we ever do melee)
	fancy_attack_shading = "#DEB887"

/mob/living/carbon/superior/robot/forgotton/sentinal_seeker
	name = "Forgotten Seeker"
	desc = "An ancient and dangerous machine from a long forgotten time with a heavily armored body can shrug off bullets and melee strikes with ease. At some point, it had a purpose, now it has gone \
	mad and seeks only death, yours and its own."
	icon = 'icons/mob/64x64.dmi'
	icon_state = "seeker"
	icon_dead = "seeker_dead"
	pass_flags = PASSTABLE

	mob_size = MOB_LARGE

	attack_sound = 'sound/weapons/rapidslice.ogg'
	speak_emote = list("screams")
	emote_see = list("sharpens its knives carefully.", "shudders and shakes for a moment!", "gushes red ichor!")
	deathmessage = "collapses into a pile of scrap!"
	speak_chance = 5

	move_to_delay = 1
	turns_per_move = 4
	see_in_dark = 10

	melee_damage_lower = 30
	melee_damage_upper = 35

	armor = list(melee = 3, bullet = 2, energy = 5, bomb = 25, bio = 0, rad = 25)

	health = 450 * REPUBLICON_HEALTH_MOD
	maxHealth = 450 * REPUBLICON_HEALTH_MOD
	attacktext = "sliced"
	faction = "hivebot"
	default_pixel_x = -16
	randpixel = 0

	can_burrow = FALSE //We cant borrow to the colony or away

	light_range = 6
	research_value = 375
	fancy_attack_overlay = "kaiser_attack_flick"
	fancy_attack_shading = "#870000"

	//Kill em!
	Contempt_Check = 90

/mob/living/carbon/superior/robot/forgotton/sentinal_seeker/New()
	..()
	pixel_x = -16
	pixel_y = 0

	stats.changeStat(STAT_TGH, 50)

/mob/living/carbon/superior/robot/forgotton/sentinal_seeker/attack_hand(mob/living/carbon/M as mob)
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
