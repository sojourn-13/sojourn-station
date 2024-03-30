// These powers are specific to certain jobs and are obtained by joining as that job with the proper implant. They may be balanced differently and may cost standard or greater power points.

// Psychiatrist/Psychologist
/obj/item/organ/internal/psionic_tumor/proc/peace_of_mind()
	set category = "Psionic powers"
	set name = "Peace of Mind (4)"
	set desc = "Expend four psi points to put whatever person you are currently grabbing to sleep for a short time."
	psi_point_cost = 4

	var/mob/living/carbon/human/L = get_grabbed_mob(owner)
	var/obj/item/grab/G = locate() in owner
	if(!G || !istype(G))
		usr.show_message(SPAN_DANGER("You are not grabbing anyone."))
		return

	if(G.state < GRAB_AGGRESSIVE)
		usr.show_message(SPAN_DANGER("You must have an aggressive grab to put someone to sleep!"))
		return

	if(pay_power_cost(psi_point_cost))
		if(check_possibility(TRUE, L, TRUE)) //The second "True" makes you unable to use this on someone already sleeping... no stacking it on itself
			usr.visible_message(
					SPAN_DANGER("[usr] places a hand upon [L] attempting to put them to sleep!"),
					SPAN_DANGER("You place your hand on [L] expanding your mind and attempting to put them to sleep!")
					)
			L.AdjustSleeping(60)

/obj/item/organ/internal/psionic_tumor/proc/psionic_heal_other()
	set category = "Psionic powers"
	set name = "Psychosomatic Restoration (2)"
	set desc = "Expend two psi points of your psi essence to heal the body of one you are grappling of both brute and burn. Unlike standard psionic healing, this causes no pain in the target \
	but the effect is reduced."
	psi_point_cost = 2

	var/mob/living/carbon/human/L = get_grabbed_mob(owner)

	if(pay_power_cost(psi_point_cost))
		if(check_possibility(TRUE, L))
			usr.visible_message(
					SPAN_DANGER("[usr] places a hand on [L], their wounds cleanly sealing and healing!"),
					SPAN_DANGER("You place your hand upon [L], focusing your thoughts and carefully reconstructing each injury with your talented mind!")
					)
			L.heal_overall_damage(30,30)


/obj/item/organ/internal/psionic_tumor/proc/meditative_focus_other()
	set category = "Psionic powers"
	set name = "Psionic Tranquility (2)"
	set desc = "Expend two psi points of your psi essence to calm the mind of another person you are grappling and restore their sanity."
	psi_point_cost = 2

	var/mob/living/carbon/human/L = get_grabbed_mob(owner)

	if(!L)
		usr.show_message("\blue You are not holding someone you can use this power on.")
		return
	if(pay_power_cost(psi_point_cost) && check_possibility(TRUE, L))
		if(L.sanity.level >= (L.sanity.max_level - 10))
			psi_points += psi_point_cost //Refunds?
			usr.visible_message(
					"[usr] places a hand on [L], a soft hum raidates around them and quickly fades away",
					"You place your hand upon [L], concentrating [L]'s thoughts... but their mind is already calm."
					)
			return
		else if(L.sanity.level < (L.sanity.max_level - 10))
			usr.visible_message(
					"[usr] places a hand on [L], a soft hum raidates around them",
					"You place your hand upon [L], calming [L]'s thoughts!"
					)
			playsound(src.loc,'sound/effects/telesci_ping.ogg', 25, 3)
			L.sanity.changeLevel(10 + (owner.stats.getStat(STAT_COG)/2))
			if(owner.stats.getPerk(PERK_PSI_ATTUNEMENT))
				L.sanity.changeLevel(20)
			if(owner.stats.getPerk(PERK_PSI_MANIA))
				L.sanity.changeLevel(10)

/obj/item/organ/internal/psionic_tumor/proc/psionic_heal_brain()
	set category = "Psionic powers"
	set name = "Cerebral Regeneration (3)"
	set desc = "Expend three psi points of your psi essence to heal the brain damage of another person you are grappling or yourself if you are grappling no one. When used on yourself, the cost is free."
	psi_point_cost = 3

	var/mob/living/carbon/human/L = get_grabbed_mob(owner)

	if(pay_power_cost(psi_point_cost))
		if(!L && check_possibility()) //Need to check this first to avoid people getting false messages from the targeted elements of the check_possibility proc
			usr.show_message("\blue You feel your power turning inward, healing any potential brain trauma you may have.")
			owner.adjustBrainLoss(-60)
		else if(check_possibility(TRUE, L))
			usr.visible_message(
					SPAN_DANGER("[usr] places a hand on [L], the air seeming to shimmer for a moment!"),
					SPAN_DANGER("You place your hand upon [L], focusing your thoughts as you carefully reconstruct any brain damage!")
					)
			L.adjustBrainLoss(-60)

/obj/item/organ/internal/psionic_tumor/proc/psionic_gift()
	set category = "Psionic powers"
	set name = "Gift of the Psion (4)"
	set desc = "Expend four psi points of your psi essence to offer enhanced mental powers to whoever you are grappling. In psions, you allow them to recover their psi essence twice as often. \
	In non-psions, you enhance the body and mind by an exceptional degree. The target must be awake to benefit from your mental guidance."
	psi_point_cost = 4

	var/mob/living/carbon/human/L = get_grabbed_mob(owner)

	if(pay_power_cost(psi_point_cost))
		if(check_possibility(TRUE, L, TRUE))
			if(L && L.stats.getPerk(PERK_PSION))
				usr.visible_message(
						SPAN_DANGER("[usr] places a hand on [L], the air seeming to shimmer for a moment!"),
						SPAN_DANGER("You place your hand upon [L], feeling their mind expanding as you reach out to them, your fellow psion gifted with limitless potential!")
						)
				L.stats.addPerk(PERK_PSI_GRACE)
			else
				usr.visible_message(
						SPAN_DANGER("[usr] places a hand on [L], the air seeming to shimmer for a moment!"),
						SPAN_DANGER("You place your hand upon [L], offering to them clarity of mind, body, and purpose!")
						)
				L.stats.addPerk(PERK_PSI_PEACE)
			log_and_message_admins("[owner] has attempted to use gift of the psion on [L]!")
