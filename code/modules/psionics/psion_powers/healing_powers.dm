
//Powers that heal people or self, or antiheal people

/mob/living/carbon/human/proc/psionic_healing()
	set category = "Psionic powers.Healing"
	set name = "Psychosomatic Healing (1)"
	set desc = "Spend a single psi point to heal your body, at the cost of terrible pain."
	var/psi_point_cost = 1
	var/mob/living/carbon/human/user = src
	var/obj/item/organ/internal/psionic_tumor/PT = user.first_organ_by_process(BP_PSION)

	if(PT && PT.pay_power_cost(psi_point_cost))
		user.heal_overall_damage(40,40)
		if(!user.stats.getPerk(PERK_PSI_ATTUNEMENT))
			user.stun_effect_act(0, 200, BP_CHEST)
			user.weakened = 10
		else
			user.stun_effect_act(0, 100, BP_CHEST)
			user.weakened = 5
		user.visible_message(
			SPAN_DANGER("[user]'s flesh begins to hiss and bubble as their wounds mend!"),
			SPAN_DANGER("A wave of agony envelops you as your wounds begin to close!")
			)

//antiheals people with halloss
/mob/living/carbon/human/proc/pain_infliction()
	set category = "Psionic powers.Telepathy"
	set name = "Pain Infliction (2)"
	set desc = "Spend two psi points to inflict pain upon whoever you're grabbing. Your victim has to be held tight for it to work."
	var/psi_point_cost = 2 //Two Points. Yes spamable to pain somebody but considering what people can do with grabs for free this is relatively tame. Needs aggressive grab, people with deep psi pools usually invested into that and lack robustness
	var/mob/living/carbon/human/user = src
	var/obj/item/organ/internal/psionic_tumor/PT = user.first_organ_by_process(BP_PSION)

	var/mob/living/carbon/human/L = get_grabbed_mob(user)
	var/obj/item/grab/G = locate() in user
	if(!G || !istype(G))
		usr.show_message(SPAN_DANGER("You can't inflict pain if you are not grabbing anyone."))
		return

	if(G.state < GRAB_AGGRESSIVE)
		usr.show_message(SPAN_DANGER("You must have an aggressive grab to inflict pain upon somebody!"))
		return

	if(PT && PT.pay_power_cost(psi_point_cost) && PT.check_possibility(TRUE, L))
		usr.visible_message(
				SPAN_DANGER("[usr] forcefully presses a hand upon [L] in an attempt to inflict pain upon them!"),
				SPAN_DANGER("You force your hand on [L] expanding your mind and inflicting pain upon them!")
				)
		L.adjustHalLoss(30)

//Transfers pain from grabbed to grabber

/mob/living/carbon/human/proc/pain_transference()
	set category = "Psionic powers.Telepathy"
	set name = "Pain Transference (2)"
	set desc = "Spend two psi points to psionically absorb some of the pain of whoever you are holding. Obviously, this is very painful to the psion."
	var/psi_point_cost = 2 //Basically a grab is needed to steal somebodies pain and take it for yourself, good for all those support mains
	var/amount
	var/absorbed = 50
	var/mob/living/carbon/human/user = src
	var/obj/item/organ/internal/psionic_tumor/PT = user.first_organ_by_process(BP_PSION)

	var/mob/living/carbon/human/L = get_grabbed_mob(user)
	var/obj/item/grab/G = locate() in user
	if(!G || !istype(G))
		usr.show_message(SPAN_DANGER("You can't transfer pain if you are not grabbing anyone."))
		return

	if(G.state < GRAB_AGGRESSIVE)
		usr.show_message(SPAN_DANGER("You must have an aggressive grab take somebodies pain!"))
		return

	if(PT && PT.pay_power_cost(psi_point_cost) && PT.check_possibility(TRUE, L))
		usr.visible_message(
				SPAN_DANGER("[usr] presses their hands upon [L] shoulders in an attempt to take their pain."),
				SPAN_DANGER("You press your hands onto the shoulders of [L] expanding your mind and transferring their pain!")
				)
		amount = min(absorbed,L.getHalLoss())
		L.adjustHalLoss(-amount)
		if(user.stats.getPerk(PERK_PSI_ATTUNEMENT))
			user.adjustHalLoss(amount/2) //Psi Attunement shunts some pain into the environment
		else
			user.adjustHalLoss(amount)

//Heals hunger
/mob/living/carbon/human/proc/psychosomatictransfer()
	set category = "Psionic powers.Healing"
	set name = "Psychosomatic Fullness (1)"
	set desc = "Spend a single psi point to convince your stomach it's not actually that hungry, burning fat reserves to keep on going. Taxing on the mind and causes minor burns."
	var/psi_point_cost = 1
	var/mob/living/carbon/human/user = src
	var/obj/item/organ/internal/psionic_tumor/PT = user.first_organ_by_process(BP_PSION)

	if(PT && PT.pay_power_cost(psi_point_cost) && PT.check_possibility())
		if(!user.stats.getPerk(PERK_PSI_ATTUNEMENT))
			user.nutrition += 100 //Twice as strong as Soul Hunger
			user.adjustFireLoss(10) //You're not using your nutrition to fuel things like Church used to, this should be fine
		else
			user.nutrition += 100
			user.adjustFireLoss(5)
		to_chat(user, "You feel energized, though there is minor pain from burning so much fat so quickly.")

// Heals stuns/other misc things
/mob/living/carbon/human/proc/chosen_control()
	set category = "Psionic powers.Healing"
	set name = "Chosen Control (4)"
	set desc = "Spend four psi points to clear all effects that would impede one's control. Removes stuns, paralysis, pain, agony, restraints, and clears the users body of all chemicals and addictions."
	var/psi_point_cost = 4
	var/mob/living/carbon/human/user = src
	var/obj/item/organ/internal/psionic_tumor/PT = user.first_organ_by_process(BP_PSION)

	if(PT && PT.pay_power_cost(psi_point_cost) && PT.check_possibility())
		user.visible_message(
			"[user] shimmers strangely!",
			"You remind the universe that it bends to your will!"
			)
		playsound(usr.loc, pick('sound/effects/sparks1.ogg','sound/effects/sparks2.ogg','sound/effects/sparks3.ogg'), 50, 1, -3)
		if(user.buckled)
			user.buckled.unbuckle_mob()

		if (user.handcuffed && !initial(user.handcuffed))
			user.drop_from_inventory(user.handcuffed)
		user.handcuffed = initial(user.handcuffed)

		if (user.legcuffed && !initial(user.legcuffed))
			user.drop_from_inventory(user.legcuffed)
		user.legcuffed = initial(user.legcuffed)

		user.SetParalysis(0)
		user.SetStunned(0)
		user.SetWeakened(0)
		user.setHalLoss(0)
		user.reagents.clear_reagents()
		for(var/datum/reagent/R in user.metabolism_effects.addiction_list)
			to_chat(user, SPAN_NOTICE("You don't crave for [R.name] anymore."))
			user.metabolism_effects.addiction_list.Remove(R)
			qdel(R)

// Heals sanity
/mob/living/carbon/human/proc/meditative_focus()
	set category = "Psionic powers.Healing"
	set name = "Meditative Focus (2)"
	set desc = "Spend two psi points of your psi essence to focus your mind and increase your sanity."
	var/psi_point_cost = 2
	var/mob/living/carbon/human/user = src
	var/obj/item/organ/internal/psionic_tumor/PT = user.first_organ_by_process(BP_PSION)

	if(PT && PT.pay_power_cost(psi_point_cost) && PT.check_possibility())
		if(user.sanity.level >= (user.sanity.max_level - 10))
			PT.psi_points += psi_point_cost
			user.visible_message(
			"[user] fidgets uncomfortably.",
			"Your mind is assured."
			)
			return
		else if(user.sanity.level < (user.sanity.max_level - 10))
			user.sanity.changeLevel(5 + (user.stats.getStat(STAT_COG)/2))
			if(user.stats.getPerk(PERK_PSI_ATTUNEMENT))
				user.sanity.changeLevel(10)
			if(user.stats.getPerk(PERK_PSI_MANIA))
				user.sanity.changeLevel(5)
			playsound(user.loc,'sound/effects/telesci_ping.ogg', 25, 1)
			user.visible_message(
				"[user]'s head lowers for a concentrated moment.",
				"A second turns to eternity, your mind assures its place in the universe"
				)

// remove all chemicals (other then blood)
/mob/living/carbon/human/psionic_tumor/proc/purify()
	set category = "Psionic powers.Healing"
	set name = "Psionic Purify (1)"
	set desc = "Spend a single psi point to clear out any chemicals in your body, helpful or not."
	var/psi_point_cost = 1
	var/mob/living/carbon/human/user = src
	var/obj/item/organ/internal/psionic_tumor/PT = user.first_organ_by_process(BP_PSION)

	if(PT && PT.pay_power_cost(psi_point_cost) && PT.check_possibility())
		if(!user.stats.getPerk(PERK_PSI_ATTUNEMENT))
			user.adjustBruteLoss(10)
		else
			user.adjustBruteLoss(5)
		if(bloodstr)
			bloodstr.clear_reagents()
		if(ingested)
			ingested.clear_reagents()
		if(touching)
			touching.clear_reagents()
		user.visible_message(
			"[user] shifts around a moment then flicks something off.",
			"You manually invoke the Purity of Body, painfully expeling any chemicals and other substances from your blood and stomach into the ether. It feels like a cold sweat."
			)

// Heals heat/cold
/mob/living/carbon/human/psionic_tumor/proc/temp_regulate()
	set category = "Psionic powers.Healing"
	set name = "Psionic Temperature Regulate (4)"
	set desc = "Spend four psi points to set your body temperature into comfortable levels."
	var/psi_point_cost = 4
	var/mob/living/carbon/human/user = src
	var/obj/item/organ/internal/psionic_tumor/PT = user.first_organ_by_process(BP_PSION)

	if(PT && PT.pay_power_cost(psi_point_cost) && PT.check_possibility())
		user.frost = 0 //The reason why its expsensive
		user.bodytemperature = 310.055	//98.7 F
		playsound(user.loc,'sound/effects/telesci_ping.ogg', 25, 1)
		user.visible_message(
			"[user] curls into a ball then springs upwards.",
			"You convince your body that the temperature's just fine. Not too hot, not too cold..."
			)
