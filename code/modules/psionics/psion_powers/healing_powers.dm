
//Powers that heal people or self, or antiheal people

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

//antiheals people with halloss
/obj/item/organ/internal/psionic_tumor/proc/pain_infliction()
	set category = "Psionic powers"
	set name = "Pain Infliction (2)"
	set desc = "Expend two psi points to inflict pain upon whatever person you are currently grabbing in a tight hold."
	psi_point_cost = 2 //Two Points. Yes spamable to pain somebody but considering what people can do with grabs for free this is relatively tame. Needs aggressive grab, people with deep psi pools usually invested into that and lack robustness

	var/mob/living/carbon/human/L = get_grabbed_mob(owner)
	var/obj/item/grab/G = locate() in owner
	if(!G || !istype(G))
		usr.show_message(SPAN_DANGER("You can't inflict pain if you are not grabbing anyone."))
		return

	if(G.state < GRAB_AGGRESSIVE)
		usr.show_message(SPAN_DANGER("You must have an aggressive grab to inflict pain upon somebody!"))
		return

	if(pay_power_cost(psi_point_cost))
		if(check_possibility(TRUE, L))
			usr.visible_message(
					SPAN_DANGER("[usr] forcefully presses a hand upon [L] in an attempt to inflict pain upon them!"),
					SPAN_DANGER("You force your hand on [L] expanding your mind and inflicting pain upon them!")
					)
			L.adjustHalLoss(30)

//Transfers pain from grabbed to grabber
/obj/item/organ/internal/psionic_tumor/proc/pain_transference()
    set category = "Psionic powers"
    set name = "Pain Transference (2)"
    set desc = "Expend two psi points to psionically absorb some of the pain of whoever you are holding. Obviously this is very painful to the psion."
    psi_point_cost = 2 //Basically a grab is needed to steal somebodies pain and take it for yourself, good for all those support mains
    var/amount
    var/absorbed = 50

    var/mob/living/carbon/human/L = get_grabbed_mob(owner)
    var/obj/item/grab/G = locate() in owner
    if(!G || !istype(G))
        usr.show_message(SPAN_DANGER("You can't inflict pain if you are not grabbing anyone."))
        return

    if(G.state < GRAB_AGGRESSIVE)
        usr.show_message(SPAN_DANGER("You must have an aggressive grab take somebodies pain!"))
        return

    if(pay_power_cost(psi_point_cost))
        if(check_possibility(TRUE, L))
            usr.visible_message(
                    SPAN_DANGER("[usr] presses their hands upon [L] shoulders in an attempt to take their pain."),
                    SPAN_DANGER("You press your hands onto the shoulders of [L] expanding your mind and transferring their pain!")
                    )
            amount = min(absorbed,L.getHalLoss())
            L.adjustHalLoss(-amount)
            if(owner.stats.getPerk(PERK_PSI_ATTUNEMENT))
                owner.adjustHalLoss(amount/2) //Psi Attunement shunts some pain into the environment
            else
                owner.adjustHalLoss(amount)

//Heals hunger
/obj/item/organ/internal/psionic_tumor/proc/psychosomatictransfer()
	set category = "Psionic powers"
	set name = "Psychosomatic Fullness (1)"
	set desc = "Expend a single point of your psi essence to convince your stomach it's not actually that hungry, burning fat reserves to keep going strong. Taxing on the mind and causes minor burns."
	psi_point_cost = 1

	if(pay_power_cost(psi_point_cost) && check_possibility())
		if(!owner.stats.getPerk(PERK_PSI_ATTUNEMENT))
			owner.nutrition += 100 //Twice as strong as Soul Hunger
			owner.adjustFireLoss(10) //You're not using your nutrition to fuel things like Church used to, this should be fine
		else
			owner.nutrition += 100
			owner.adjustFireLoss(5)
		to_chat(owner, "You feel energized, though there is minor pain from burning so much fat so quickly.")

// Heals stuns/other misc things
/obj/item/organ/internal/psionic_tumor/proc/chosen_control()
	set category = "Psionic powers"
	set name = "Chosen Control (4)"
	set desc = "Expend four psi points to clear all effects that impede one's control. Remove stuns, paralysis, pain, agony, restrainments, and clears the users body of all chemicals and addictions."
	psi_point_cost = 4

	if(pay_power_cost(psi_point_cost) && check_possibility())
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

	if(pay_power_cost(psi_point_cost) && check_possibility())
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
