// These rituals here are specifically for events and refer only to litanies available to either Augustine herself or agents ascended by her for a very rare and specific purpose.
// No, these are not balanced, they are not meant to be. These will likely only ever be used for events or by Kaz when he is bored and testing things. -Kaz

/datum/ritual/cruciform/omni
	name = "omni"
	implant_type = /obj/item/implant/core_implant/cruciform
	category = "Apostle"
	power = 30

/datum/ritual/targeted/cruciform/omni
	name = "omni targeted"
	implant_type = /obj/item/implant/core_implant/cruciform
	category = "Apostle"
	power = 30

//Healing litanies
//Omni healing litanies are extremely powerful but expensive to use, they have no/short cooldown like lesser litanies to encourage their use.
/datum/ritual/cruciform/omni/purify
	name = "Purify"
	phrase = "Non scitis, quod vos dicitis, sunt in templo Dei, et Spiritus Dei habitat in medio tui?"
	desc = "Purify your body, returning it to its purest state and healing all physical injuries."
	cooldown = TRUE
	cooldown_time = 30
	power = 85

/datum/ritual/cruciform/omni/purify/perform(mob/living/carbon/human/H, obj/item/implant/core_implant/C,list/targets)
	to_chat(H, "<span class='info'>You feel the grace and intervention of a higher power, mending your body.</span>")
	H.reagents.add_reagent("laudanum", 10)
	H.adjustBruteLoss(-200)
	H.adjustFireLoss(-200)
	H.adjustOxyLoss(-200)
	H.adjustBrainLoss(-60)
	H.updatehealth()
	set_personal_cooldown(H)
	return TRUE

/datum/ritual/cruciform/omni/purify_other
	name = "Divine Intervention"
	phrase = "Cave tamen, quod exercitium tua iura non fit offendiculum ad infirma."
	desc = "Purify another disciple, cleansing them of all physical wounds."
	cooldown = TRUE
	cooldown_time = 20
	power = 100

/datum/ritual/cruciform/omni/purify_other/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C,list/targets)
	var/obj/item/implant/core_implant/cruciform/CI = get_implant_from_victim(user, /obj/item/implant/core_implant/cruciform)

	if(!CI || !CI.active || !CI.wearer)
		fail("Cruciform not found.", user, C)
		return FALSE

	var/mob/living/carbon/human/H = CI.wearer

	if(!istype(H))
		fail("Target not found.",user,C,targets)
		return FALSE

	//Checking turfs allows this to be done in unusual circumstances, like if both are inside the same mecha
	var/turf/T = get_turf(user)
	if (!(T.Adjacent(get_turf(H))))
		to_chat(user, SPAN_DANGER("[H] is beyond your reach.."))
		return

	user.visible_message("[user] places their hands upon [H] and utters a prayer", "You lay your hands upon [H] and begin speaking the words of divine intervention")
	if (do_after(user, 40, H, TRUE))
		T = get_turf(user)
		if (!(T.Adjacent(get_turf(H))))
			to_chat(user, SPAN_DANGER("[H] is beyond your reach.."))
			return
		to_chat(H, "<span class='info'>You feel the grace and intervention of a higher power, mending your body.</span>")
		H.rejuvenate() //Rather than fix this for Erismed, just making it an actual aheal as it's supposed to be. It's a power granted only to admin characters anyway.
		H.updatehealth()
		set_personal_cooldown(user)
		return TRUE

/datum/ritual/cruciform/omni/divine_savior
	name = "Divine Savior"
	phrase = "Ibi sunt diversa dona, idem autem Spiritus et distribuit eos."
	desc = "Heal all who can see and hear you for a large amount of damage, whether they have a cruciform or not. This litany is powerful, but requires time to recharge between uses. "
	cooldown = TRUE
	cooldown_time = 5 MINUTES
	cooldown_category = "dsavior"
	power = 150

/datum/ritual/cruciform/omni/divine_savior/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C)
	var/list/people_around = list()
	for(var/mob/living/carbon/human/H in view(user))
		if(H != user && !isdeaf(H))
			people_around.Add(H)

	if(people_around.len > 0)
		to_chat(user, SPAN_NOTICE("Your feel the air thrum with an inaudible vibration."))
		playsound(user.loc, 'sound/machines/signal.ogg', 50, 1)
		for(var/mob/living/carbon/human/participant in people_around)
			to_chat(participant, SPAN_NOTICE("You hear a silent signal..."))
			heal_other(participant)
			add_effect(participant, FILTER_HOLY_GLOW, 25)
		set_personal_cooldown(user)
		return TRUE
	else
		fail("Your cruciform sings, alone, unto the void.", user, C)
		return FALSE

/datum/ritual/cruciform/omni/divine_savior/proc/heal_other(mob/living/carbon/human/participant)
		to_chat(participant, "<span class='info'>You feel the grace and intervention of a higher power, mending your body.</span>")
		participant.reagents.add_reagent("laudanum", 5)
		participant.adjustBruteLoss(-100)
		participant.adjustFireLoss(-100)
		participant.adjustOxyLoss(-150)
		participant.adjustBrainLoss(-30)
		participant.updatehealth()

/datum/ritual/cruciform/omni/empower
	name = "Long boost ritual"
	phrase = null
	desc = "This litany empowers the bodies and minds of everyone near you for quite some time."
	cooldown = TRUE
	cooldown_time = 2 MINUTES
	effect_time = 30 MINUTES
	cooldown_category = "empower"
	var/list/stats_to_boost = list()

/datum/ritual/cruciform/omni/empower/New()
	..()
	desc = "This litany boosts [get_stats_to_text()] stats of everyone who hears you, for about thirty minutes."

/datum/ritual/cruciform/omni/empower/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C)
	var/list/people_around = list()
	for(var/mob/living/carbon/human/H in view(user))
		if(H != user && !isdeaf(H))
			people_around.Add(H)

	if(people_around.len > 0)
		to_chat(user, SPAN_NOTICE("Your feel the air thrum with an inaudible vibration."))
		playsound(user.loc, 'sound/machines/signal.ogg', 50, 1)
		for(var/mob/living/carbon/human/participant in people_around)
			to_chat(participant, SPAN_NOTICE("You hear a silent signal..."))
			give_boost(participant)
			add_effect(participant, FILTER_HOLY_GLOW, 25)
		set_global_cooldown()
		return TRUE
	else
		fail("Your cruciform sings, alone, unto the void.", user, C)
		return FALSE


/datum/ritual/cruciform/omni/empower/proc/give_boost(mob/living/carbon/human/participant)
	for(var/stat in stats_to_boost)
		var/amount = stats_to_boost[stat]
		participant.stats.addTempStat(stat, amount, effect_time, src.name)
		addtimer(CALLBACK(src, PROC_REF(take_boost), participant, stat, amount), effect_time)
	spawn(30)
		to_chat(participant, SPAN_NOTICE("You feel the zeal of another fill you, giving you insight into [get_stats_to_text()]!"))


/datum/ritual/cruciform/omni/empower/proc/take_boost(mob/living/carbon/human/participant, stat, amount)
	to_chat(participant, SPAN_WARNING("Your insight into [get_stats_to_text()] feels lessened."))

/datum/ritual/cruciform/omni/empower/proc/get_stats_to_text()
	if(stats_to_boost.len == 1)
		return lowertext(stats_to_boost[1])
	var/stats_text = ""
	for(var/i = 1 to stats_to_boost.len)
		var/stat = stats_to_boost[i]
		if(i == stats_to_boost.len)
			stats_text += " and [stat]"
			continue
		if(i == 1)
			stats_text += "[stat]"
		else
			stats_text += ", [stat]"
	return lowertext(stats_text)

/datum/ritual/cruciform/omni/empower/ultimate
	name = "The Path"
	phrase = "Amor est patiens, caritas est genus. Non invidia, non glorietur, non est superbus."
	stats_to_boost = list(STAT_MEC = 15, STAT_COG = 15, STAT_BIO = 15, STAT_ROB = 15, STAT_TGH = 15, STAT_VIG = 15)

/datum/ritual/cruciform/omni/canticle_of_absolution
	name = "Canticle of Absolution"
	phrase = "Declinatio a via ante te est haeresis, ad id quod eras, et quod semper eris, revertere."
	desc = "Cures the person in front of you of all genetic instability and clone damage while removing all forms of genetic mutation. This litany requires a great deal of power and thus may \
	only be used once per hour."
	power = 50

/datum/ritual/cruciform/omni/canticle_of_absolution/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C)
	var/mob/living/carbon/human/T = get_front_human_in_range(user, 1)
	if(!T)
		fail("No target in front of you.", user, C)
		return FALSE
	to_chat(T, SPAN_NOTICE("You feel your body returning to its natural state."))
	to_chat(user, SPAN_NOTICE("You bring [T.name] back to their natural state."))

	T.adjustCloneLoss(-200)
	T.unnatural_mutations.removeAllMutations()

	return TRUE
