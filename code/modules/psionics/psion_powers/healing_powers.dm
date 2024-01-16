
//Powers that heal people or self

/obj/item/organ/internal/psionic_tumor/proc/psionic_healing()
	set category = "Psionic powers"
	set name = "Psychosomatic healing (1)"
	set desc = "Expend a single point of your psi essence to heal your body, the process however is extremely painful."
	psi_point_cost = 1

	if(pay_power_cost(psi_point_cost))
		owner.heal_overall_damage(40,40)
		if(!owner.stats.getPerk(PERK_PSI_ATTUNEMENT))
			owner.stun_effect_act(0, 200, BP_CHEST)
			owner.weakened = 10
		else
			owner.stun_effect_act(0, 100, BP_CHEST)
			owner.weakened = 5
		owner.visible_message(
			SPAN_DANGER("[owner]'s flesh begins to hiss and bubble as their wounds mend!"),
			SPAN_DANGER("A wave of agony envelops you as your wounds begin to close!")
			)

//Heals hunger
/obj/item/organ/internal/psionic_tumor/proc/psychosomatictransfer()
	set category = "Psionic powers"
	set name = "Psychosomatic Transference (1)"
	set desc = "Expend a single point of your psi essence to fill your stomach with cannibalized proteins from your own body. Beware, this will generate toxins and expend some of your blood."
	psi_point_cost = 1

	if(pay_power_cost(psi_point_cost))
		if(!owner.stats.getPerk(PERK_PSI_ATTUNEMENT))
			owner.nutrition = 400
			owner.drip_blood(54)
		else
			owner.nutrition = 400
			owner.drip_blood(26)
		to_chat(owner, "You feel sick and woozy, a sudden full sensation in your gut almost making you want to vomit.")

// Heals stuns/other misc things
/obj/item/organ/internal/psionic_tumor/proc/chosen_control()
	set category = "Psionic powers"
	set name = "Chosen Control (4)"
	set desc = "Expend four psi points to clear all effects that impede one's control. Remove stuns, paralysis, pain, agony, restrainments, and clears the users body of all chemicals and addictions."
	psi_point_cost = 4

	if(pay_power_cost(psi_point_cost))
		owner.visible_message(
			"[owner] shimmers strangely!",
			"You remind the universe that it bends to your will!"
			)
		playsound(usr.loc, pick('sound/effects/sparks1.ogg','sound/effects/sparks2.ogg','sound/effects/sparks3.ogg'), 50, 1, -3)
		if(owner.buckled)
			owner.buckled.unbuckle_mob()

		if (owner.handcuffed && !initial(owner.handcuffed))
			owner.drop_from_inventory(owner.handcuffed)
		owner.handcuffed = initial(owner.handcuffed)

		if (owner.legcuffed && !initial(owner.legcuffed))
			owner.drop_from_inventory(owner.legcuffed)
		owner.legcuffed = initial(owner.legcuffed)

		owner.SetParalysis(0)
		owner.SetStunned(0)
		owner.SetWeakened(0)
		owner.setHalLoss(0)
		owner.reagents.clear_reagents()
		for(var/datum/reagent/R in owner.metabolism_effects.addiction_list)
			to_chat(owner, SPAN_NOTICE("You don't crave for [R.name] anymore."))
			owner.metabolism_effects.addiction_list.Remove(R)
			qdel(R)

// Heals sanity
/obj/item/organ/internal/psionic_tumor/proc/meditative_focus()
	set category = "Psionic powers"
	set name = "Meditative Focus (2)"
	set desc = "Expend two psi points of your psi essence to focus your mind and increase your sanity."
	psi_point_cost = 2

	if(pay_power_cost(psi_point_cost))
		if(owner.sanity.level >= (owner.sanity.max_level - 10))
			psi_points += psi_point_cost
			owner.visible_message(
			"[owner] fidgets uncomfortably.",
			"Your mind is assured."
			)
			return
		else if(owner.sanity.level < (owner.sanity.max_level - 10))
			owner.sanity.changeLevel(5 + (owner.stats.getStat(STAT_COG)/2))
			if(owner.stats.getPerk(PERK_PSI_ATTUNEMENT))
				owner.sanity.changeLevel(10)
			if(owner.stats.getPerk(PERK_PSI_MANIA))
				owner.sanity.changeLevel(5)
			playsound(owner.loc,'sound/effects/telesci_ping.ogg', 25, 1)
			owner.visible_message(
				"[owner]'s head lowers for a concentrated moment.",
				"A second turns to eternity, your mind assures its place in the universe"
				)
