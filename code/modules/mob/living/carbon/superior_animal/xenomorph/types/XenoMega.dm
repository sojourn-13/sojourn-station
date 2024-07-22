/mob/living/carbon/superior_animal/xenomorph/warrior/praetorian
	name = "praetorian"
	desc = "The praetorian, the second most powerful and ruthless xenomorph ever birthed from the dark pit these monsters crawled from."
	icon = 'icons/mob/Xenos_2x2.dmi'
	icon_state = "praetorian"
	icon_living = "praetorian"
	icon_dead = "praetorian_dead"
	icon_rest = "praetorian_stunned"

	maxHealth = 800
	health = 800
	melee_damage_lower = 40
	melee_damage_upper = 50

	armor = list(melee = 7, bullet = 8, energy = 1, bomb = 30, bio = 100, rad = 100)

	allowed_stat_modifiers = list(
		/datum/stat_modifier/mob/living/carbon/superior_animal/padded/xeno = 36,
		/datum/stat_modifier/mob/living/carbon/superior_animal/old/xeno = 26,
		/datum/stat_modifier/mob/living/carbon/superior_animal/young/xeno = 50,
		/datum/stat_modifier/health/mult/positive/low = 5,
		/datum/stat_modifier/mob/living/carbon/superior_animal/durable/xeno = 22,
		/datum/stat_modifier/mob/living/carbon/superior_animal/brutish/xeno = 12,
		/datum/stat_modifier/mob/living/speed/flat/positive/low = 1
	)

	move_to_delay = 2
	turns_per_move = 12

/mob/living/carbon/superior_animal/xenomorph/warrior/shrike/praetorian/queen
	name = "queen"
	desc = "The xenomorph queen, the apex of the xenomorphs and the source of all infestations. A living avatar of millions of worlds left in ruin."
	icon = 'icons/mob/Xenos_2x2.dmi'
	icon_state = "queen"
	icon_living = "queen"
	icon_dead = "queen_dead"
	icon_rest = "queen_stunned"
	status_flags = 0
	maxHealth = 1500
	health = 1500
	poison_per_bite = 10

	armor = list(melee = 10, bullet = 11, energy = 3, bomb = 30, bio = 100, rad = 100)


	melee_damage_lower = 40
	melee_damage_upper = 50

	move_to_delay = 1
	turns_per_move = 12

/mob/living/carbon/superior_animal/xenomorph/warrior/shrike/praetorian/queen/slip(var/slipped_on)
	return FALSE

/mob/living/carbon/superior_animal/xenomorph/warrior/shrike/praetorian/queen/UnarmedAttack(var/atom/A, var/proximity)
	if(isliving(A))
		var/mob/living/L = A
		if(istype(L) && !L.weakened && prob(30))
			if(L.stats.getPerk(PERK_ASS_OF_CONCRETE) || L.stats.getPerk(PERK_BRAWN))
				return
			L.Weaken(8)
			L.visible_message(SPAN_DANGER("\the [src] rams \the [L] off there feet!"))

	. = ..()

/mob/living/carbon/superior_animal/xenomorph/warrior/shrike/praetorian/queen/attack_hand(mob/living/carbon/M as mob)
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
				M.visible_message("\red [src] slays [M] with an deadly impalement from its tail!")
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
