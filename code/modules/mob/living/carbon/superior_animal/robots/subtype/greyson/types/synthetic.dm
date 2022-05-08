/mob/living/carbon/superior_animal/robot/greyson/synthetic
	name = "Greyson Positronic FBP-Utility unit"
	desc = "A full body positronic, tasked with carrying out a variety of duties. This one is unarmed."
	icon = 'icons/mob/mobs-humanoid.dmi'
	icon_state = "nanotrasen"
	attacktext = "punched"
	turns_per_move = 7
	move_to_delay = 2
	health = 125
	maxHealth = 125
	cleaning = FALSE

/mob/living/carbon/superior_animal/robot/greyson/synthetic/epistol
	name = "Greyson Positronic FBP-SEC Mark I unit"
	desc = "A full body positronic, tasked with carrying out security duty without emotion, remorse, or questions. This one is has an old style energy pistol built into its arm."
	icon_state = "nanotrasenranged"
	ranged = 1

/mob/living/carbon/superior_animal/robot/greyson/synthetic/epistol/New()
	..()
	if(prob(20))
		drop2 = /obj/item/gun/energy/cog
	if(prob(30))
		cell_drop = /obj/item/cell/medium

/mob/living/carbon/superior_animal/robot/greyson/synthetic/epistol/esmg
	name = "Greyson Positronic FBP-SEC Mark II unit"
	desc = "A full body positronic, tasked with carrying out security duty without emotion, remorse, or questions. This one is has a modified burst fire cog laser rifle built into its arm."
	icon_state = "nanotrasenrangedsmg"
	rapid = 1
	ranged_cooldown = 3
	projectiletype = /obj/item/projectile/beam/pulse/drone

/mob/living/carbon/superior_animal/robot/greyson/synthetic/epistol/rifle
	name = "Greyson Positronic FBP-SEC Mark III unit"
	desc = "A full body positronic, tasked with carrying out security duty without emotion, remorse, or questions. This one is has a modified heavy duty cog carbine built into its arm."
	icon_state = "nanotrasenrangedassault"
	projectiletype = /obj/item/projectile/beam/midlaser

/mob/living/carbon/superior_animal/robot/greyson/synthetic/epistol/heavy
	name = "Greyson Positronic FBP-SEC Heavy unit"
	desc = "A full body positronic, tasked with carrying out security duty without emotion, remorse, or questions. This one is has an overclocked super cog laser rifle built in his arm."
	icon_state = "nanotrasen_ert"
	projectiletype = /obj/item/projectile/beam
	health = 200
	maxHealth = 200
	armor = list(melee = 35, bullet = 25, energy = 40, bomb = 60, bio = 100, rad = 100) //We want to be gunned down, not lasered

/mob/living/carbon/superior_animal/robot/greyson/synthetic/ripley
	name = "Greyson Positronic Ripley unit"
	desc = "An AI controlled autonomous power loading unit equipped with a diamond tipped drill."
	icon_state = "greyson_ripley"
	attacktext = "drilled"
	health = 500
	maxHealth = 500
	melee_damage_lower = 40
	melee_damage_upper = 45
	attack_sound = 'sound/mecha/mechdrill.ogg'
	flash_resistances = 100 // Robot

/mob/living/carbon/superior_animal/robot/greyson/synthetic/ripley/slip(var/slipped_on,stun_duration=8)
	return FALSE
// Big stompers can't be slipped!

/mob/living/carbon/superior_animal/robot/greyson/synthetic/ripley/attack_hand(mob/living/carbon/M as mob)
	..()
	var/mob/living/carbon/human/H = M

	switch(M.a_intent)
		if (I_HELP)
			help_shake_act(M)

		if (I_GRAB)
			if(!weakened && stat == CONSCIOUS)
				M.adjustBruteLoss(25)
				M.adjustBruteLoss(25)
				M.adjustBruteLoss(25)
				M.adjustBruteLoss(25)
				M.adjustBruteLoss(25)
				M.adjustBruteLoss(25)
				M.adjustBruteLoss(25)
				M.adjustBruteLoss(25)
				M.adjustOxyLoss(25)
				M.Weaken(5)
				visible_message(SPAN_WARNING("\red [src] immediately crushes [M] with its titan bulk when they stupidly try to grab it!"))
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
				M.visible_message("\red [src] slays [M] with a massive impact of its arm!")
				M.Weaken(5)
				M.adjustBruteLoss(250)
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

/mob/living/carbon/superior_animal/robot/greyson/synthetic/ripley/phazon
	name = "Greyson Positronic Phazon unit"
	desc = "An AI controlled phazon mecha equipped with reinforced armor, a power fist the size of a giant spider, and a modified phazing drive that lets it move far faster than its bulk should allow."
	icon = 'icons/mob/mobs-humanoid.dmi'
	icon_state = "greyson_phazon"
	attacktext = "titan-punched"
	turns_per_move = 8
	move_to_delay = 1
	health = 800
	maxHealth = 800
	melee_damage_lower = 50
	melee_damage_upper = 55
	attack_sound = 'sound/xenomorph/alien_footstep_charge1.ogg'
	armor = list(melee = 30, bullet = 30, energy = 30, bomb = 30, bio = 100, rad = 100)
