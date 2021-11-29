// Psi monsters are almost exclusively found in deep maints. They all share the universal ability to disappear in total darkness and only appear when attacking or in the light.
// They tend to favor extremely high health pools but little armor, with most attacks being moderate damage and carrying secondary effects.
// When killed, they disappear and may spawn a psionic catalyst in there place. -Kaz

/mob/living/carbon/superior_animal/psi_monster
	name = "corrupted devourer"
	desc = "In the realm of other the other worldly deep maintenance, there are things which should not be. This creature is the result of what a mindless thought can create, familiar and yet \
	entirely alien."
	icon = 'icons/mob/psi_monsters.dmi'
	icon_state = "corruptroach"
	icon_living = "corruptroach"
	pass_flags = PASSTABLE

	mob_size = MOB_LARGE
	viewRange = 8
	armor = list(melee = 20, bullet = 10, energy = 5, bomb = 30, bio = 100, rad = 100)

	maxHealth = 120
	health = 120
	randpixel = 0
	attack_sound = 'sound/voice/insect_battle_bite.ogg'
	var/aggro_noise = 'sound/hallucinations/hell_screech.ogg'
	attack_sound_chance = 100
	speak_emote = list("murmurs", "howls", "whispers")
	emote_see = list("groans in pain.", "moans in agony.", "chitters madly!")
	speak_chance = 5
	deathmessage = "looses a guttural snarl as it crumbles to dust!"
	overkill_gib = 40
	overkill_dust = 40

	move_to_delay = 2
	turns_per_move = 6
	see_in_dark = 10
	leather_amount = 0
	bones_amount = 0
	stop_automated_movement_when_pulled = 0

	melee_damage_lower = 10
	melee_damage_upper = 15
	can_burrow = FALSE
	acceptableTargetDistance = 5
	flash_resistances = 50 //No eyes.

	min_breath_required_type = 0
	min_air_pressure = 0 //below this, brute damage is dealt
	min_breath_poison_type = 0

	var/poison_per_bite = 0
	var/poison_type = "mindmelter"
	var/last_noise = -30000
	var/chameleon_skill = 10
	pass_flags = PASSTABLE
	faction = "psi_monster"

	fleshcolor = "#3c0000"
	bloodcolor = "#3c0000"

	can_burrow = FALSE
	colony_friend = FALSE
	friendly_to_colony = FALSE

	known_languages = list(LANGUAGE_COMMON)

/mob/living/carbon/superior_animal/psi_monster/slip(var/slipped_on,stun_duration=8)
	return FALSE
// Can't slip

/mob/living/carbon/superior_animal/psi_monster/attack_hand(mob/living/carbon/M as mob)
	..()
	var/mob/living/carbon/human/H = M

	switch(M.a_intent)
		if (I_HELP)
			help_shake_act(M)

		if (I_GRAB)
			if(!weakened && stat == CONSCIOUS)
				if(M.stats.getPerk(PERK_ASS_OF_CONCRETE) || M.stats.getPerk(PERK_BRAWN))
					M.visible_message("\red [src] telekinetically breaks the grapple [M] is hit with the force! [M] manages to stay standing!")
					M.adjustBruteLoss(30)
					return 1
				M.visible_message("\red The [src] telekinetically breaks the grapple [M] is hit with the force!")
				M.adjustBruteLoss(30)
				M.Weaken(3)
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
				LAssailant = M

				M.do_attack_animation(src)
				playsound(loc, 'sound/weapons/thudswoosh.ogg', 50, 1, -1)
				visible_message(SPAN_WARNING("[M] has grabbed [src] passively!"))

				return 1

		if (I_DISARM)
			if (!weakened && (prob(10 + (H.stats.getStat(STAT_ROB) * 0.1))))
				M.visible_message("\red [M] has knocked \the [src] over!")
				playsound(loc, 'sound/weapons/thudswoosh.ogg', 50, 1, -1)
				Weaken(3)

				return 1
			else if(!weakened && stat == CONSCIOUS)
				if(M.stats.getPerk(PERK_ASS_OF_CONCRETE) || M.stats.getPerk(PERK_BRAWN))
					M.visible_message("\red [src] telekinetically breaks the grapple [M] is hit with the force! [M] manages to stay standing!")
					M.adjustBruteLoss(30)
					return 1
				M.visible_message("\red [M] telekinetically breaks the grapple [M] is hit with the force!")
				M.adjustBruteLoss(30)
				M.Weaken(3)
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


/obj/effect/decal/cleanable/psi_ash
	name = "strange ashes"
	desc = "Something about these ashes feels off, as if an infinite potential exists within the dust."
	gender = PLURAL
	icon = 'icons/obj/objects.dmi'
	icon_state = "ash"
	anchored = TRUE

/obj/effect/decal/cleanable/psi_ash/attack_hand(mob/user as mob)
	if(user.stats.getPerk(PERK_PSION) && prob(25))
		new /obj/item/gun/minigun(src.loc)
	else if(prob(10))
		new /obj/item/gun/minigun(src.loc)
	to_chat(user, SPAN_NOTICE("[src] sifts through your fingers."))
	qdel(src)