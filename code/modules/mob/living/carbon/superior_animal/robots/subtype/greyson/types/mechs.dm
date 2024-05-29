/mob/living/carbon/superior_animal/robot/greyson/synthetic/ripley
	name = "Greyson Positronic Ripley unit"
	desc = "An AI controlled autonomous power loading unit equipped with a diamond tipped drill."
	icon_state = "greyson_ripley"
	attacktext = "drilled"
	health = 250 * GREYSONROBUST_HEALTH_MOD
	maxHealth = 250 * GREYSONROBUST_HEALTH_MOD
	melee_damage_lower = 40
	melee_damage_upper = 45
	attack_sound = 'sound/mecha/mechdrill.ogg'
	flash_resistances = 100 // Robot

	allowed_stat_modifiers = list(
		/datum/stat_modifier/mob/living/carbon/superior_animal/durable = 20,
		/datum/stat_modifier/mob/living/carbon/superior_animal/armor/flat/negative/low = 10,
		/datum/stat_modifier/mob/living/carbon/superior_animal/armor/flat/negative/medium = 5,
		/datum/stat_modifier/mob/living/carbon/superior_animal/brutish/robotic = 20,
		/datum/stat_modifier/mob/living/speed/flat/negative/medium = 10,
		/datum/stat_modifier/mob/living/carbon/superior_animal/brutal/robotic = 10,
		/datum/stat_modifier/mob/living/carbon/superior_animal/aggressive/savage/robotic = 4,
		/datum/stat_modifier/mob/living/carbon/superior_animal/old/robotic = 30,
		/datum/stat_modifier/mob/living/carbon/superior_animal/young/robotic = 5,
	)

/mob/living/carbon/superior_animal/robot/greyson/synthetic/ripley/slip(slipped_on,stun_duration=8)
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
				return TRUE
			else
				if(M == src || anchored)
					return FALSE
				for(var/obj/item/grab/G in grabbed_by)
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

				return TRUE

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

				return TRUE

/mob/living/carbon/superior_animal/robot/greyson/synthetic/ripley/phazon
	name = "Greyson Positronic Phazon unit"
	desc = "An AI controlled phazon mecha equipped with reinforced armor, a power fist the size of a giant spider, and a modified phazing drive that lets it move far faster than its bulk should allow."
	icon = 'icons/mob/mobs-humanoid.dmi'
	icon_state = "greyson_phazon"
	attacktext = "titan-punched"
	turns_per_move = 8
	move_to_delay = 1
	health = 400 * GREYSONROBUST_HEALTH_MOD
	maxHealth = 400 * GREYSONROBUST_HEALTH_MOD
	melee_damage_lower = 50
	melee_damage_upper = 55
	attack_sound = 'sound/xenomorph/alien_footstep_charge1.ogg'
	armor = list(melee = 7, bullet = 7, energy = 7, bomb = 30, bio = 100, rad = 100)

/mob/living/carbon/superior_animal/robot/greyson/synthetic/ripley/phazon/Initialize(mapload)

	allowed_stat_modifiers -= /datum/stat_modifier/mob/living/carbon/superior_animal/aggressive/savage/robotic // no speed buffs please
	allowed_stat_modifiers -= /datum/stat_modifier/mob/living/carbon/superior_animal/young

	. = ..()

