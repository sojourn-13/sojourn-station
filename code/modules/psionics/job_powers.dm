// These powers are specific to certain jobs and are obtained by joining as that job with the proper implant. They may be balanced differently and may cost standard or greater power points.

// Psychiatrist/Psychologist
/obj/item/organ/internal/psionic_tumor/proc/peace_of_mind()
	set category = "Psionic powers"
	set name = "Peace of Mind (2)"
	set desc = "Expend two psi points to put whatever person you are currently grabbing to sleep for a short time."
	psi_point_cost = 2

	var/mob/living/carbon/human/L = get_grabbed_mob(owner)
	if(L && isliving(L) && L.get_core_implant(/obj/item/implant/core_implant/cruciform) && L.species?.reagent_tag != IS_SYNTHETIC && pay_power_cost(psi_point_cost))
		usr.visible_message(
				SPAN_DANGER("[usr] places a hand upon [L] attempting to put them to sleep!"),
				SPAN_DANGER("You place your hand on [L] expanding your mind and attempting to put them to sleep!")
				)
		L.AdjustSleeping(60)
	else
		usr.show_message("\blue You are not holding someone you can use this power on.")

/obj/item/organ/internal/psionic_tumor/proc/psionic_heal_other()
	set category = "Psionic powers"
	set name = "Psychosomatic Restoration (2)"
	set desc = "Expend two psi points of your psi essence to heal the body of one you are grappling of both brute and burn. Unlike standard psionic healing, this causes no pain in the target \
	but the effect is reduced."
	psi_point_cost = 2

	var/mob/living/carbon/human/L = get_grabbed_mob(owner)
	if(L && isliving(L) && L.get_core_implant(/obj/item/implant/core_implant/cruciform) && L.species?.reagent_tag != IS_SYNTHETIC && pay_power_cost(psi_point_cost))
		usr.visible_message(
				SPAN_DANGER("[usr] places a hand on [L], their wounds cleanly sealing and healing!"),
				SPAN_DANGER("You place your hand upon [L], focusing your thoughts and carefully reconstructing each injury with your talented mind!")
				)
		L.heal_overall_damage(30,30)
	else
		usr.show_message("\blue You are not holding someone you can use this power on.")

/obj/item/organ/internal/psionic_tumor/proc/psionic_heal_brain()
	set category = "Psionic powers"
	set name = "Cerebral Regeneration (3)"
	set desc = "Expend three psi points of your psi essence to heal the brain damage of another person you are grappling or yourself if you are grappling no one. When used on yourself, the cost is free."
	psi_point_cost = 3

	var/mob/living/carbon/human/L = get_grabbed_mob(owner)
	if(L && isliving(L) && L.get_core_implant(/obj/item/implant/core_implant/cruciform) && L.species?.reagent_tag != IS_SYNTHETIC && pay_power_cost(psi_point_cost))
		usr.visible_message(
				SPAN_DANGER("[usr] places a hand on [L], the air seeming to shimmer for a moment!"),
				SPAN_DANGER("You place your hand upon [L], focusing your thoughts as you carefully reconstruct any brain damage!")
				)
		L.adjustBrainLoss(-60)
	else if(!L)
		usr.show_message("\blue You feel your power turning inward, healing any potential brain trauma you may have.")
		owner.adjustBrainLoss(-60)
	else
		usr.show_message("\blue You are not holding someone you can use this power on.")

/obj/item/organ/internal/psionic_tumor/proc/psionic_gift()
	set category = "Psionic powers"
	set name = "Gift of the Psion (7)"
	set desc = "Expend seven psi points of your psi essence to offer enhanced mental powers to whoever you are grappling. In psions, you allow them to recover their psi essence twice as often. \
	In non-psions, you enhance the body and mind by an exceptional degree."
	psi_point_cost = 7

	var/mob/living/carbon/human/L = get_grabbed_mob(owner)
	if(L && isliving(L) && L.get_core_implant(/obj/item/implant/core_implant/cruciform) && L.species?.reagent_tag != IS_SYNTHETIC && pay_power_cost(psi_point_cost))
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
	else
		usr.show_message("\blue You are not holding someone you can use this power on.")