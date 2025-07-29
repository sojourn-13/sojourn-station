// Psi monsters are almost exclusively found in deep maints. They all share the universal ability to disappear in total darkness and only appear when attacking or in the light.
// They tend to favor extremely high health pools but little armor, with most attacks being moderate damage and carrying secondary effects.
// When killed, they disappear and may spawn a psionic catalyst in there place. -Kaz

/mob/living/carbon/superior/psi
	name = "corrupted devourer"
	desc = "In the realm of other the other worldly deep maintenance, there are things which should not be. This creature is the result of what a mindless thought can create, familiar and yet \
	entirely alien."
	icon = 'icons/mob/psi_monsters.dmi'
	icon_state = "corruptroach"
	icon_living = "corruptroach"
	pass_flags = PASSTABLE

	mob_size = MOB_LARGE
	viewRange = 8
	armor = list(melee = 5, bullet = 2, energy = 1, bomb = 30, bio = 100, rad = 100)

	cant_be_pulled = TRUE
	cant_gib = TRUE
	maxHealth = 100
	health = 100
	randpixel = 0
	attack_sound = list('sound/xenomorph/alien_claw_flesh1.ogg', 'sound/xenomorph/alien_claw_flesh2.ogg', 'sound/xenomorph/alien_claw_flesh3.ogg', 'sound/xenomorph/alien_tail_attack.ogg')
	var/aggro_noise = 'sound/hallucinations/hell_screech.ogg'
	attack_sound_chance = 100
	speak_emote = list("murmurs...", "howls!", "whispers...")
	emote_see = list("groans in pain.", "moans in agony.", "chitters madly!")
	speak_chance = 5
	deathmessage = "looses a guttural snarl as it crumbles to dust!"
	overkill_gib = 0 // Set so we don't lose its death dust special clause.
	overkill_dust = 0
	contaminant_immunity = TRUE
	never_stimulate_air = TRUE

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
	flash_resistances = 100 //No eyes.

	breath_required_type = 0 // Doesn't need to breath, in a space suit
	breath_poison_type = 0 // Can't be poisoned
	min_air_pressure = 0 // Doesn't need pressure
	breath_required_type = NONE
	breath_poison_type = NONE
	min_breath_required_type = 0
	min_breath_poison_type = 0
	reagent_immune = TRUE
	toxin_immune = TRUE

	poison_per_bite = 0
	poison_type = "mindmelter"

	var/last_noise = -30000
	var/chameleon_skill = 10
	var/phaser = TRUE
	var/healing_factor = 1
	var/momento_mori = /obj/effect/decal/cleanable/psi_ash
	var/death_present = FALSE
	var/death_spawn_gift = null
	var/death_gasp = "Error text!"
	pass_flags = PASSTABLE
	faction = "psi_monster"

	// Boss monster variables.
	var/first_teleport = FALSE
	var/second_teleport = FALSE
	var/first_teleport_callout = "Error text!"
	var/second_teleport_callout = "Error text!"
	var/size_pixel_offset_x = 0

	fleshcolor = "#3c0000"
	bloodcolor = "#3c0000"

	can_burrow = FALSE
	colony_friend = FALSE
	friendly_to_colony = FALSE

	known_languages = list(LANGUAGE_COMMON)

	drop_items = list(/obj/random/psi)

	var/psionic_respawn = TRUE
	var/fast_respawn = 5 MINUTES
	var/slow_respawn = 15 MINUTES
	var/respawn_mob_type = /obj/random/mob/psi_monster
	var/affects_chaos = FALSE

	var/leach_on_odds = 0
	var/can_leach = FALSE
	var/is_leaching = FALSE
	var/steal_odds = 0
	var/stat_to_steal = STAT_VIV
	var/steal_amount = -1 //Possitive amounts give stats, and lower the health of the leacher
	var/mob/living/Victim = null

	var/can_leave = FALSE
	research_value = 1800


/mob/living/carbon/superior/psi/New()
	..()
	if(!icon_living)
		icon_living = icon_state
	if(!icon_dead)
		icon_dead = "[icon_state]_dead"

	objectsInView = new

	remove_verb(src, /mob/verb/observe)
	pixel_x = size_pixel_offset_x
	pixel_y = 0

/mob/living/carbon/superior/psi/slip()
	return FALSE
// Can't slip

/mob/living/carbon/superior/psi/start_pulling(var/atom/movable/AM)
	to_chat(src, SPAN_WARNING("Your hand gets stopped preventing you from pulling \the [src]. !"))
	return

/mob/living/carbon/superior/psi/attack_hand(mob/living/carbon/M as mob)
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
				LAssailant_weakref = WEAKREF(M)

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
	var/catalyst_drop = /obj/random/psi_catalyst
	var/psion_chance = 25
	var/normie_chance = 10

/obj/effect/decal/cleanable/psi_ash/attack_hand(mob/user as mob)
	if(user.stats.getPerk(PERK_PSION) && prob(psion_chance))
		new catalyst_drop(src.loc)
	else if(prob(normie_chance))
		new catalyst_drop(src.loc)
	to_chat(user, SPAN_NOTICE("[src] sifts through your fingers."))
	qdel(src)

/obj/effect/decal/cleanable/psi_ash/ponderous
	name = "strange ashes of ponderous"
	catalyst_drop = /obj/random/psi_catalyst/ponderous
	psion_chance = 35
	normie_chance = 15

/obj/effect/decal/cleanable/psi_ash/flesh_behemoth
	name = "strange ashes of flesh behemoth"
	catalyst_drop = /obj/random/psi_catalyst/flesh_behemoth
	psion_chance = 45
	normie_chance = 20

/obj/effect/decal/cleanable/psi_ash/king
	name = "ashes of the throne bound tyrant"
	desc = "He will be back."
	catalyst_drop = /obj/item/device/psionic_catalyst/cerebral_hemorrhage
	psion_chance = 100
	normie_chance = 100

/obj/effect/decal/cleanable/psi_ash/hound
	name = "ashes of the faithful hound"
	desc = "Ever in his foot steps, his faithful beast follows, loyal beyond death."
	catalyst_drop = /obj/item/device/psionic_catalyst/enslavement
	psion_chance = 100
	normie_chance = 100

/obj/effect/decal/cleanable/psi_ash/low_chance
	name = "weak ashes"
	desc = "Something about these ashes feels off, as if an infinite potential exists within the dust, but it is weaker feeling than normal."
	psion_chance = 10
	normie_chance = 5
