/mob/living/carbon/superior/psi/debuffer
	name = "shallow breather"
	desc = "An alien creature even inside the depts of deepmaints. \
	Its flesh and suit are one in the same as it slowly moves around out of breath consently inhailing a strange gas."
	icon = 'icons/mob/psi_monsters.dmi'
	icon_state = "debuffer"
	icon_living = "debuffer"

	armor = list(melee = 5, bullet = 2, energy = 1, bomb = 30, bio = 100, rad = 100)

	//We want to be killed fast to buff everyone else
	maxHealth = 50 * PSIMOB_HEALTH_MOD
	health = 50 * PSIMOB_HEALTH_MOD

	attack_sound = list('sound/effects/spray.ogg', 'sound/effects/Custom_internals.ogg', 'sound/effects/internals.ogg')
	attack_sound_chance = 100
	speak_emote = list("sounds of a gas tank opening...", "inhails sharply!", "takes a deepbreath")
	emote_see = list("puffs its chest.", "takes a deep breath.", "makes a shallow exhail")
	speak_chance = 2
	deathmessage = "the sound of rushing air releases from its form!"

	move_to_delay = 6 //Slow by itself
	turns_per_move = 6
	see_in_dark = 10

	//We are weak by areselfs
	melee_damage_lower = 5
	melee_damage_upper = 8

	chameleon_skill = 0
	phaser = FALSE
	healing_factor = 15 //If we are in the dark then we heal a lot
	momento_mori = /obj/effect/decal/cleanable/psi_ash/debuffer

	target_dummy = TRUE // We die fast as thats are role

	drop_items = list(/obj/item/psi_injector)

//Are side gimmic is healing other mobs
/mob/living/carbon/superior/psi/debuffer/Life()
	. = ..()

	//Heal allies as if they are in darkness, but only if by one anther
	for(var/mob/living/carbon/superior/psi/P in oview(3, src))
		if(P.maxHealth == P.health)
			continue

		P.heal_overall_damage(healing_factor/3,healing_factor/3)
		P.updatehealth()

/mob/living/carbon/superior/psi/debuffer/Initialize(mapload)
	..()
	visible_message(SPAN_DANGER("As [src] appares a thin haze fills the area thats quickly absorbed by all."))
	deathmessage = "the sound of rushing air releases from [name]!"
	for(var/mob/living/carbon/superior/psi/P in oview(5, src))

/*
		//Hey now how does haze tell the difference?
		if(P.faction != faction)
			continue
*/

		if(P.stat == CONSCIOUS) //incase
			P.stats.addPerk(PERK_PSI_PEACE) //Give them some stats
			P.mob_ablative_armor += 15 + GLOB.chaos_level
			P.healing_factor += 2

			if(GLOB.chaos_level >= 2)
				//Increase bullet/laser and melee armor only
				for(var/key in P.armor)
					if(key == "melee")
						P.armor[key] += GLOB.chaos_level + 1 //3->4->5
					if(key == "bullet")
						P.armor[key] += GLOB.chaos_level //2->3->4
					if(key == "energy")
						P.armor[key] += GLOB.chaos_level //2->3->4

				P.move_to_delay -= 0.5
				P.healing_factor += 3

			if(GLOB.chaos_level >= 3)
				//We increase the damage of others
				P.melee_damage_lower += 1
				P.melee_damage_upper += 2

	//in the rare event that one of these spawns around a human thats also a psionic, give them some points
	for(var/mob/living/carbon/human/H in oview(7, src))
		//It does say all...
		if(H.stat == CONSCIOUS ) //incase
			var/obj/item/organ/internal/psionic_tumor/PT = H.random_organ_by_process(BP_PSION)
			if(PT && PT.psi_points < PT.max_psi_points)
				PT.psi_points += 1

/mob/living/carbon/superior/psi/debuffer/UnarmedAttack(var/atom/A, var/proximity)
	. = ..()

	if(ishuman(A))
		var/mob/living/carbon/human/H = A
		var/obj/item/organ/internal/psionic_tumor/PT = H.random_organ_by_process(BP_PSION)

		//Yoink, this is baseline
		if(prob(75) && PT)
			if(PT && PT.psi_points > 0)
				PT.psi_points -= 1
				melee_damage_lower += 1
				melee_damage_upper += 1
				heal_overall_damage(healing_factor,healing_factor)
				updatehealth()
				visible_message(SPAN_DANGER("[src] takes a deep breath well holding on [H.name]!"))
				to_chat(H, "[src] attacks leave you short of breath.")
		//Take their light and turn it into might, on level 2 this ALWAYS happens
		if(GLOB.chaos_level >= 2)
			var/obj/item/implant/core_implant/cruciform/CI
			CI = H.get_core_implant(/obj/item/implant/core_implant/cruciform)
			if(CI)
				CI.power -= GLOB.chaos_level
				visible_message(SPAN_DANGER("[src] takes a deep breath well holding on [H.name]'s chest!"))
				to_chat(H, "[src] attacks leave you short of breath.")

				melee_damage_lower += GLOB.chaos_level
				melee_damage_upper += GLOB.chaos_level
				heal_overall_damage(healing_factor,healing_factor)
				updatehealth()

				if(0 > CI.power)
					CI.power = 0

/mob/living/carbon/superior/psi/debuffer/death(var/gibbed,var/message = deathmessage)
	playsound(loc, 'sound/effects/glass_step.ogg', 50, 1)
	for(var/mob/living/carbon/superior/psi/P in oview(5, src))

/*
			//Hey now how does haze tell the difference?
			if(P.faction != faction)
				continue
*/

		if(P.stat == CONSCIOUS)
			// heals like 32 burn/brute damage, quite a chunk of hp
			P.heal_overall_damage(healing_factor*2,healing_factor*2)
			P.updatehealth()

			if(GLOB.chaos_level >= 2)
				if(P.stat == CONSCIOUS) //incase
					P.stats.addPerk(PERK_PSI_PEACE) //Give them some stats
					P.mob_ablative_armor += 15 + GLOB.chaos_level

					for(var/key in P.armor)
						if(key == "melee")
							P.armor[key] += GLOB.chaos_level - 1 //1->2->3
						if(key == "bullet")
							P.armor[key] += GLOB.chaos_level - 2 //0->1->2
						if(key == "energy")
							P.armor[key] += GLOB.chaos_level - 2 //0->1->2

						P.move_to_delay -= 0.5

					if(GLOB.chaos_level >= 4)
						//We increase the damage of others at this point...
						P.melee_damage_lower += 1
						P.melee_damage_upper += 2

		//in the rare event that one of these spawns around a human thats also a psionic, give them some points
		for(var/mob/living/carbon/human/H in oview(7, src))
			//It does say all...
			if(H.stat == CONSCIOUS ) //incase
				var/obj/item/organ/internal/psionic_tumor/PT = H.random_organ_by_process(BP_PSION)
				if(PT && PT.psi_points < PT.max_psi_points)
					PT.psi_points += 1

				var/obj/item/implant/core_implant/cruciform/CI
				CI = H.get_core_implant(/obj/item/implant/core_implant/cruciform)
				if(CI && CI.active)
					CI.power += GLOB.chaos_level
					if(CI.power > CI.max_power)
						CI.power = 0

	..()