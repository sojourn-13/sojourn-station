// Psi monsters are almost exclusively found in deep maints. They all share the universal ability to disappear in total darkness and only appear when attacking or in the light.
// They tend to favor extremely high health pools but little armor, with most attacks being moderate damage and carrying secondary effects.
// When killed, they disappear and may spawn a psionic catalyst in there place. -Kaz

/mob/living/carbon/superior_animal/psi_monster/kingview
	name = "The Enlightened Eye"
	desc = "TEST."
	icon = 'icons/mob/kingviewopen64.dmi'
	icon_state = "eye1"
	icon_living = "eye1"
	pass_flags = PASSTABLE

	mob_size = MOB_LARGE
	viewRange = 16
	armor = list(melee = 0, bullet = 30, energy = 40, bomb = 10, bio = 100, rad = 100)

	cant_be_pulled = TRUE
	cant_gib = TRUE
	maxHealth = 500
	health = 500
	randpixel = 0
	attack_sound = list('sound/voice/malescream_1.ogg', 'sound/voice/malescream_2.ogg', 'sound/voice/malescream_3.ogg','sound/voice/malescream_4.ogg','sound/voice/malescream_5.ogg','sound/voice/malescream_6.ogg')
	var/aggro_noise = list('sound/voice/warble.ogg', 'sound/voice/shriek.ogg')
	attack_sound_chance = 100
	speak_emote = list("murmurs", "howls", "whispers")
	emote_see = list("groans in pain.", "moans in agony.", "chitters madly!")
	speak_chance = 50
	deathmessage = "looses a guttural snarl as it crumbles to dust!"
	overkill_gib = 0 // Set so we don't lose its death dust special clause.
	overkill_dust = 0
	contaminant_immunity = TRUE
	never_stimulate_air = TRUE
	mob_size = 3 // Can't contain that which isn't actually real.

	move_to_delay = 1
	turns_per_move = 6
	see_in_dark = 16
	leather_amount = 0
	bones_amount = 0
	stop_automated_movement_when_pulled = 0

	ranged = TRUE
	rapid = TRUE
	rapid_fire_shooting_amount = 3
	ranged_cooldown = 1
    var/projectile_color = ("#53377A", "#70197A", "#CC0EC8", "#9A12CC")
    projectile_type = /obj/item/projectile/beam/eyemind
	limited_ammo = FALSE
	mag_drop = FALSE
	rounds_left = 1
	mag_type = /mob/living/carbon/superior_animal/psi_monster/memory
	mags_left = 99
	melee_damage_lower = 30
	melee_damage_upper = 40
	can_burrow = FALSE
	acceptableTargetDistance = 3
	flash_resistances = 100

	breath_required_type = 0 // Doesn't need to breath, in a space suit
	breath_poison_type = 0 // Can't be poisoned
	min_air_pressure = 0 // Doesn't need pressure
	breath_required_type = NONE
	breath_poison_type = NONE
	min_breath_required_type = 0
	min_breath_poison_type = 0
	reagent_immune = TRUE
	toxin_immune = TRUE

	var/poison_per_bite = 0.5
	var/poison_type = "tearoutseer"
	var/last_noise = -30000
	var/chameleon_skill = 10
	var/phaser = TRUE
	var/healing_factor = 1
	var/momento_mori = /obj/effect/decal/cleanable/psi_ash
	death_present = TRUE
	death_spawn_gift = /obj/random/cluster/psi_monster/a_lump_of_memories
	death_gasp = "<b><font size='3px'>TEST!</font></b>!"
	drop_items = list(/obj/random/psi/always_spawn, /obj/random/psi/always_spawn)
	pass_flags = PASSTABLE
	faction = "psi_monster"

/mob/living/carbon/superior_animal/psi_monster/kingview/New()
	..()
	if(!icon_living)
		icon_living = icon_state
	if(!icon_dead)
		icon_dead = "[icon_state]_dead"

	objectsInView = new

	verbs -= /mob/verb/observe
	pixel_x = size_pixel_offset_x
	pixel_y = 0

/mob/living/carbon/superior_animal/psi_monster/kingview/slip()
	return FALSE
// Can't slip

	//spawn_blacklisted = TRUE
	var/change_tele_to_mob = 25
	var/chance_tele_to_eat = 25
	var/chance_tele_to_random = 10

/mob/living/carbon/superior_animal/psi_monster/kingview/Initialize(mapload)
	. = ..()
	do_sparks(3, 0, src.loc)

/mob/living/carbon/superior_animal/psi_monster/kingviewhandle_ai()
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
		playsound(src, 'sound/voice/malescream_5.ogg', 30, 1, -3)
		do_sparks(3, 0, src.loc)
		do_teleport(src, target, 1)
		playsound(src, 'sound/voice/malescream_2.ogg', 30, 1, -3)

/mob/living/carbon/superior_animal/psi_monster/kingview/start_pulling(var/atom/movable/AM)
	to_chat(src, SPAN_WARNING("Your hand gets stopped preventing you from pulling \the [src]. !"))
	return

/mob/living/carbon/superior_animal/psi_monster/kingview/attack_hand(mob/living/carbon/M as mob)
	..()
	var/mob/living/carbon/human/H = M

	switch(M.a_intent)
		if (I_HELP)
			help_shake_act(M)

		if (I_GRAB)
			if(!weakened && stat == CONSCIOUS)
				if(M.stats.getPerk(PERK_ASS_OF_CONCRETE) || M.stats.getPerk(PERK_BRAWN))
					M.visible_message("\red [src] telekinetically breaks the grapple [M] is hit with the force! [M] manages to stay standing!")
					M.adjustBruteLoss(100)
					return 1
				M.visible_message("\red The [src] telekinetically breaks the grapple [M] is hit with the force!")
				M.adjustBruteLoss(100)
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
					M.adjustBruteLoss(100)
					return 1
				M.visible_message("\red [M] telekinetically breaks the grapple [M] is hit with the force!")
				M.adjustBruteLoss(100)
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
