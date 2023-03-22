//////////////////////////////////////////////////
/////////         TESSELLATE             /////////
//////////////////////////////////////////////////

/datum/ritual/cruciform/tessellate
	name = "cruciform"
	phrase = null
	implant_type = /obj/item/implant/core_implant/cruciform/tessellate
	category = "Tessellate"

/datum/ritual/targeted/cruciform/tessellate
	name = "cruciform targeted"
	phrase = null
	implant_type = /obj/item/implant/core_implant/cruciform/tessellate
	category = "Tessellate"

/datum/ritual/cruciform/tessellate/heal_heathen_special
	name = "Graceful Repose"
	phrase = "Deum precor gratia exceperat."
	desc = "A tricky litany that heals the mind and body of esoteric maladies such as genetic malignance or brain damage. However it requires them to be awake and able to hear you. This litany requires alot of power and needs a quarter of an hour to recharge."
	cooldown = TRUE
	cooldown_time = 15 MINUTES
	cooldown_category = "grepose"
	power = 60
	nutri_cost = 50
	blood_cost = 50

/datum/ritual/cruciform/tessellate/heal_heathen_special/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C)
	var/list/people_around = list()
	if(user.species?.reagent_tag != IS_SYNTHETIC)
		if(user.nutrition >= nutri_cost)
			user.nutrition -= nutri_cost
		else
			to_chat(user, SPAN_WARNING("You manage to cast the litany at a cost. The physical body consumes itself..."))
			user.vessel.remove_reagent("blood",blood_cost)
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

/datum/ritual/cruciform/tessellate/heal_heathen_special/proc/heal_other(mob/living/carbon/human/participant)
		to_chat(participant, "<span class='info'>A sensation of relief bathes you, washing away your most of your pain in body and mind</span>")
		participant.reagents.add_reagent("anodyne", 10)
		participant.adjustCloneLoss(-20)
		participant.adjustBrainLoss(-20)
		participant.updatehealth()

/datum/ritual/cruciform/tessellate/heal_heathen_improved
	name = "Healing Word"
	phrase = "Pastor gregem suum pascet, sive sciens sive ignarus gubernandum."
	desc = "Heal every person who can see and hear you for a fair amount, even if they do not have a cruciform. This prayer uses alot of power and requires 15 minutes to pass before it can be used again."
	cooldown = TRUE
	power = 50
	cooldown_time = 15 MINUTES
	cooldown_category = "dhymn" //It shares a cooldown because it replaces divine hymn, not add atop it.
	nutri_cost = 150//high cost
	blood_cost = 50//high cost

/datum/ritual/cruciform/tessellate/heal_heathen_improved/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C)
	var/list/people_around = list()
	if(user.species?.reagent_tag != IS_SYNTHETIC)
		if(user.nutrition >= nutri_cost)
			user.nutrition -= nutri_cost
		else
			to_chat(user, SPAN_WARNING("You manage to cast the litany at a cost. The physical body consumes itself..."))
			user.vessel.remove_reagent("blood",blood_cost)
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

/datum/ritual/cruciform/tessellate/heal_heathen_improved/proc/heal_other(mob/living/carbon/human/participant)
		to_chat(participant, "<span class='info'>A sensation of relief bathes you, washing away your some of your pain</span>")
		participant.reagents.add_reagent("laudanum", 10)
		participant.adjustBruteLoss(-20)
		participant.adjustFireLoss(-20)
		participant.adjustOxyLoss(-40)
		participant.adjustBrainLoss(-5)
		participant.updatehealth()

/datum/ritual/cruciform/tessellate/desperate_calculation
	name = "Desperate Calculation"
	phrase = "Et consideremus quomodo ad dilectionem et ad bene operandum se invicem stimemus."
	desc = "An immensely powerful healing litany that restores any who hear it around the speaker, however the strength of the litany requires so much that the body of the speaker is temporarily ravaged by hunger. \
	Due to the strength of this hymn, it can only be used once every half hour."
	cooldown = TRUE
	power = 50
	cooldown_time = 30 MINUTES
	cooldown_category = "dcalculation" //Seperate cooldown since it stuns the user.
	nutri_cost = 150
	blood_cost = 50

/datum/ritual/cruciform/tessellate/desperate_calculation/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C)
	var/list/people_around = list()
	if(user.species?.reagent_tag != IS_SYNTHETIC)
		if(user.nutrition >= nutri_cost)
			user.nutrition -= nutri_cost
		else
			to_chat(user, SPAN_WARNING("You manage to cast the litany at a cost. The physical body consumes itself..."))
			user.vessel.remove_reagent("blood",blood_cost)
	for(var/mob/living/carbon/human/H in view(user))
		if(H != user && !isdeaf(H))
			people_around.Add(H)

	if(people_around.len > 0)
		user.visible_message("<b><font color='red'>[user]'s cruciform glows brightly!</font><b>", "<b><font color='red'>Your feel the air thrum with an inaudible vibration, your cruciform withdrawing a lot of power to empower your litany!</font><b>", "<b><font color='red'>You hear a small crackle!</font><b>")
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

/datum/ritual/cruciform/tessellate/desperate_calculation/proc/heal_other(mob/living/carbon/human/participant)
		to_chat(participant, "<span class='info'>A sensation of relief bathes you, washing away most of your pain!</span>")
		participant.reagents.add_reagent("laudanum", 10)
		participant.adjustBruteLoss(-40)
		participant.adjustFireLoss(-40)
		participant.adjustOxyLoss(-80)
		participant.adjustBrainLoss(-10)
		participant.updatehealth()

/datum/ritual/cruciform/tessellate/realignment
	name = "Realignment"
	phrase = "Quidvis facere licet, inquis, sed non omnia expediunt. Ius mihi faciendum est, sed non vincar ab aliquo."
	desc = "Heals all toxins and liver damage, purges all toxic chemical reagents and stimulants in the blood stream, and slows down anyone in front of you while curing all addictions."
	power = 50
	nutri_cost = 25
	blood_cost = 25
	cooldown_time = 15 MINUTES
	cooldown_category = "realignment"

/datum/ritual/cruciform/tessellate/realignment/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C)
	var/mob/living/carbon/human/T = get_front_human_in_range(user, 1)
	if(!T)
		fail("No target in front of you.", user, C)
		return FALSE
	if(user.species?.reagent_tag != IS_SYNTHETIC)
		if(user.nutrition >= nutri_cost)
			user.nutrition -= nutri_cost
		else
			to_chat(user, SPAN_WARNING("You manage to cast the litany at a cost. The physical body consumes itself..."))
			user.vessel.remove_reagent("blood",blood_cost)
	to_chat(T, SPAN_NOTICE("You feel yourself growing more focused with each passing second."))
	to_chat(user, SPAN_NOTICE("You grant [T.name] cleansing."))

	T.reagents.add_reagent("alignitol", 10)
	set_personal_cooldown(user)

	return TRUE

//////////////////////////////////////////////////
/////////         LEMNISCATE             /////////
//////////////////////////////////////////////////

/datum/ritual/cruciform/lemniscate
	name = "cruciform"
	phrase = null
	implant_type = /obj/item/implant/core_implant/cruciform/lemniscate
	category = "Lemniscate"

/datum/ritual/targeted/cruciform/lemniscate
	name = "cruciform targeted"
	phrase = null
	implant_type = /obj/item/implant/core_implant/cruciform/lemniscate
	category = "Lemniscate"

/datum/ritual/cruciform/lemniscate/long_boost
	name = "Long boost ritual"
	phrase = null
	desc = "This litany boosts the stats of everyone who's hear you on the short time."
	cooldown = TRUE
	cooldown_time = 2 MINUTES
	effect_time = 30 MINUTES
	cooldown_category = "short_boost"
	category = "Lemniscate"
	var/list/stats_to_boost = list()
	nutri_cost = 50//high cost
	blood_cost = 50//high cost

/datum/ritual/cruciform/lemniscate/long_boost/New()
	..()
	desc = "This litany boosts [get_stats_to_text()] stats of everyone who hears you, for about thirty minutes."

/datum/ritual/cruciform/lemniscate/long_boost/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C)
	var/list/people_around = list()
	if(user.species?.reagent_tag != IS_SYNTHETIC)
		if(user.nutrition >= nutri_cost)
			user.nutrition -= nutri_cost
		else
			to_chat(user, SPAN_WARNING("You manage to cast the litany at a cost. The physical body consumes itself..."))
			user.vessel.remove_reagent("blood",blood_cost)
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


/datum/ritual/cruciform/lemniscate/long_boost/proc/give_boost(mob/living/carbon/human/participant)
	for(var/stat in stats_to_boost)
		var/amount = stats_to_boost[stat]
		participant.stats.addTempStat(stat, amount, effect_time, src.name)
		addtimer(CALLBACK(src, .proc/take_boost, participant, stat, amount), effect_time)
	spawn(30)
		to_chat(participant, SPAN_NOTICE("A wave of dizziness washes over you and your mind is filled with a sudden insight into [get_stats_to_text()]."))


/datum/ritual/cruciform/lemniscate/long_boost/proc/take_boost(mob/living/carbon/human/participant, stat, amount)
	to_chat(participant, SPAN_WARNING("Your knowledge of [get_stats_to_text()] feels lessened."))

/datum/ritual/cruciform/lemniscate/long_boost/proc/get_stats_to_text()
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

/datum/ritual/cruciform/lemniscate/long_boost/mental
	name = "Sanctorum of Life"
	phrase = "Venite ad me omnes qui laboratis, et onerati estis, et ego reficiam vos."
	stats_to_boost = list(STAT_MEC = 15, STAT_COG = 15, STAT_BIO = 15)

/datum/ritual/cruciform/lemniscate/long_boost/physical
	name = "Pilgrim's Path"
	phrase = "Confortare et esto robustus. Nolite timere nec paveatis a conspectu eorum quia Dominus Deus tuus ipse est ductor tuus. Et non dimittet nec derelinquet te."
	stats_to_boost = list(STAT_ROB = 15, STAT_TGH = 15, STAT_VIG = 15)

/datum/ritual/targeted/cruciform/lemniscate/food_for_the_masses
	name = "Food for the Masses"
	phrase = "Sive ergo manducatis sive bibitis vel aliud quid facitis omnia in gloriam Dei facite."
	desc = "You call upon the churches limited fabrication abilities, creating a lunch box in hand that contains special upgraded food for you and others. While highly nutritious, it is also packed with \
	healing chemicals and stimulants. The strain of using this litany, however, forces the speaker to wait a minimum of an hour to use it again."
	cooldown = TRUE
	power = 50
	cooldown_time = 60 MINUTES
	cooldown_category = "food_masses"
	nutri_cost = 50
	blood_cost = 25

/datum/ritual/targeted/cruciform/lemniscate/food_for_the_masses/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C,list/targets)
	if(user.species?.reagent_tag != IS_SYNTHETIC)
		if(user.nutrition >= nutri_cost)
			user.nutrition -= nutri_cost
		else
			to_chat(user, SPAN_WARNING("You manage to cast the litany at a cost. The physical body consumes itself..."))
			user.vessel.remove_reagent("blood",blood_cost)
	new /obj/item/storage/lunchbox/lemniscate/full(usr.loc)
	to_chat(user, SPAN_NOTICE("A lemniscate branded lunchbox that smells delicious appears at your feet, still warm and fresh from the kitchens!"))
	set_personal_cooldown(user)

/datum/ritual/cruciform/lemniscate/zoom_litany
	name = "Infinite Hymn"
	phrase = "Beati pacifici, quoniam filii Dei vocabuntur."
	desc = "Empowers the speaker with enhanced movement speed, allowing them to run faster and react quicker for a short time. While useful, the body must rest after exceeding its limits, normally for \
	only a mere ten minutes."
	cooldown = TRUE
	cooldown_time = 15 MINUTES
	power = 35
	nutri_cost = 25
	blood_cost = 25
	cooldown_category = "zoom_litany"

/datum/ritual/cruciform/lemniscate/zoom_litany/perform(mob/living/carbon/human/H, obj/item/implant/core_implant/C,list/targets)
	if(H.species?.reagent_tag != IS_SYNTHETIC)
		if(H.nutrition >= nutri_cost)
			H.nutrition -= nutri_cost
		else
			to_chat(H, SPAN_WARNING("You manage to cast the litany at a cost. The physical body consumes itself..."))
			H.vessel.remove_reagent("blood",blood_cost)
	to_chat(H, "<span class='info'>You feel yourself speeding up, your senses and reaction times quickening!</span>")
	H.add_chemical_effect(CE_SPEEDBOOST, 0.2, 5 MINUTES, "hyperzine")
	H.updatehealth()
	set_personal_cooldown(H)
	return TRUE

//////////////////////////////////////////////////
/////////         MONOMIAL               /////////
//////////////////////////////////////////////////

/datum/ritual/cruciform/monomial
	name = "cruciform"
	phrase = null
	implant_type = /obj/item/implant/core_implant/cruciform/monomial
	fail_message = "The Cruciform feels cold against your chest."
	category = "Monomial"

/datum/ritual/targeted/cruciform/monomial
	name = "cruciform targeted"
	phrase = null
	implant_type = /obj/item/implant/core_implant/cruciform/monomial
	category = "Monomial"

/datum/ritual/cruciform/monomial/ironskin
	name = "Resolution"
	phrase = "Dominus virtutem populo suo dabit; Dominus benedicet populo suo in pace."
	desc = "A short litany that removes all pain, it is much stronger then the relief litany, but requires more power and has a five minute recharge time between uses."
	power = 50
	cooldown = TRUE
	cooldown_time = 15 MINUTES
	cooldown_category = "monopain"
	ignore_stuttering = TRUE
	nutri_cost = 50
	blood_cost = 50

/datum/ritual/cruciform/monomial/ironskin/perform(mob/living/carbon/human/H, obj/item/implant/core_implant/C)
	if(H.species?.reagent_tag != IS_SYNTHETIC)
		if(H.nutrition >= nutri_cost)
			H.nutrition -= nutri_cost
		else
			to_chat(H, SPAN_WARNING("You manage to cast the litany at a cost. The physical body consumes itself..."))
			H.vessel.remove_reagent("blood",blood_cost)
	H.reagents.add_reagent("nepenthe", 10)
	H.adjustBruteLoss(-10)
	H.adjustFireLoss(-10)
	H.adjustOxyLoss(-20)
	H.adjustBrainLoss(-5)
	H.updatehealth()
	set_personal_cooldown(H)
	return TRUE

/datum/ritual/cruciform/monomial/perfect_self
	name = "Perfect Self"
	phrase = "Quaerite primum regnum Dei et iustitiam eius, et haec omnia adicientur vobis."
	desc = "A solemn prayer, often spoken in a whisper that allows a disciple of the monomial to focus inward and reach their full potential in both body and mind. This litany lasts fifteen minutes and takes over half an hour before it can be used again."
	cooldown = TRUE
	cooldown_time = 30 MINUTES
	cooldown_category = "pself"
	effect_time = 15 MINUTES
	power = 90
	nutri_cost = 50
	blood_cost = 50

/datum/ritual/cruciform/monomial/perfect_self/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C)
	if(user.species?.reagent_tag != IS_SYNTHETIC)
		if(user.nutrition >= nutri_cost)
			user.nutrition -= nutri_cost
		else
			to_chat(user, SPAN_WARNING("You manage to cast the litany at a cost. The physical body consumes itself..."))
			user.vessel.remove_reagent("blood",blood_cost)
	user.stats.changeStat(STAT_TGH, 10)
	user.stats.changeStat(STAT_ROB, 10)
	user.stats.changeStat(STAT_VIG, 10)
	user.stats.changeStat(STAT_COG, 10)
	user.stats.changeStat(STAT_BIO, 10)
	user.stats.changeStat(STAT_MEC, 10)
	to_chat(user, SPAN_NOTICE("You feel at peace with yourself, your body and mind going beyond its limits."))
	set_personal_cooldown(user)
	addtimer(CALLBACK(src, .proc/discard_effect, user), src.cooldown_time)
	return TRUE

/datum/ritual/cruciform/monomial/perfect_self/proc/discard_effect(mob/living/carbon/human/user, amount)
	user.stats.changeStat(STAT_TGH, -10)
	user.stats.changeStat(STAT_ROB, -10)
	user.stats.changeStat(STAT_VIG, -10)
	user.stats.changeStat(STAT_COG, -10)
	user.stats.changeStat(STAT_BIO, -10)
	user.stats.changeStat(STAT_MEC, -10)

/datum/ritual/cruciform/monomial/inner_peace
	name = "Inner Peace"
	phrase = "Nolite iudicare, aut vos iudicabimini."
	desc = "You impart a portion of your inner peace on another, gifting them with insight beyond what they are normally capable of. In doing so, you sacrifice some of your own. Requires ten minutes between uses."
	cooldown = TRUE
	cooldown_time = 30 MINUTES
	cooldown_category = "inner_peace"
	power = 90
	nutri_cost = 25
	blood_cost = 25

/datum/ritual/cruciform/monomial/inner_peace/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C)
	var/mob/living/carbon/human/T = get_front_human_in_range(user, 1)
	if(!T)
		fail("No target in front of you.", user, C)
		return FALSE
	if(user.species?.reagent_tag != IS_SYNTHETIC)
		if(user.nutrition >= nutri_cost)
			user.nutrition -= nutri_cost
		else
			to_chat(user, SPAN_WARNING("You manage to cast the litany at a cost. The physical body consumes itself..."))
			user.vessel.remove_reagent("blood",blood_cost)
	to_chat(T, SPAN_NOTICE("You feel slightly better as your pain eases."))
	to_chat(user, SPAN_NOTICE("You ease the pain of [T.name]."))

	if(user.sanity.insight >= 25 && user.species?.reagent_tag != IS_SYNTHETIC && T.species?.reagent_tag != IS_SYNTHETIC)
		user.sanity.insight -= 25
		T.sanity.insight += 50
		to_chat(user, "<span class='info'>You offer your insight to [T.name], your meditation boosting another, allowing them a glimpse at your perceptions.</span>")
		to_chat(T, "<span class='info'>You feel inspired, a new perspective offered by another, showing you the same picture from a different angle.</span>")
		set_personal_cooldown(user)
	else
		to_chat(user, SPAN_WARNING("You lack the personal insight to impart more to another, time and meditation will allow you to try again."))

	return TRUE

/datum/ritual/cruciform/monomial/bulwark_of_harmony
	name = "Bulwark of Harmony"
	phrase = "Unde bella et lites inter vos? Nonne ex concupiscentiis vestris quae militant in vobis?"
	desc = "A litany fashioned after the idea that body and mind can be a fixed point, resisting change in all ways. For a single minute, the speaker slows down drastically, but reduces all damage they \
	may recieve by half, letting them remain as they are for longer."
	cooldown = TRUE
	cooldown_time = 30 MINUTES
	cooldown_category = "bulwark_of_harmony"
	effect_time = 5 MINUTES
	power = 90
	nutri_cost = 50
	blood_cost = 50
	var/brute_mod_monomial
	var/burn_mod_monomial
	var/toxin_mod_monomial
	var/oxygen_mod_monomial

/datum/ritual/cruciform/monomial/bulwark_of_harmony/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C)
	if(user.species?.reagent_tag != IS_SYNTHETIC)
		if(user.nutrition >= nutri_cost)
			user.nutrition -= nutri_cost
		else
			to_chat(user, SPAN_WARNING("You manage to cast the litany at a cost. The physical body consumes itself..."))
			user.vessel.remove_reagent("blood",blood_cost)

	brute_mod_monomial = (user.brute_mod_perk * 0.5)
	user.brute_mod_perk -= brute_mod_monomial

	burn_mod_monomial = (user.burn_mod_perk * 0.5)
	user.burn_mod_perk -= burn_mod_monomial

	toxin_mod_monomial = (user.toxin_mod_perk * 0.5)
	user.toxin_mod_perk -= toxin_mod_monomial

	oxygen_mod_monomial = (user.oxy_mod_perk * 0.5)
	user.oxy_mod_perk -= oxygen_mod_monomial

	user.add_chemical_effect(CE_SLOWDOWN, 5, 1 MINUTES, "monomial_slow")

	to_chat(user, SPAN_NOTICE("You feel your body stiffening, your stout refusal to change slowing down the world around you as you remain at a fixed point."))
	set_personal_cooldown(user)
	addtimer(CALLBACK(src, .proc/discard_effect, user), src.cooldown_time)
	return TRUE

/datum/ritual/cruciform/monomial/bulwark_of_harmony/proc/discard_effect(mob/living/carbon/human/user, amount)
	user.brute_mod_perk -= brute_mod_monomial
	user.burn_mod_perk -= burn_mod_monomial
	user.toxin_mod_perk -= toxin_mod_monomial
	user.oxy_mod_perk -= oxygen_mod_monomial

//////////////////////////////////////////////////
/////////         DIVISOR                /////////
//////////////////////////////////////////////////

/datum/ritual/cruciform/divisor
	name = "cruciform"
	phrase = null
	implant_type = /obj/item/implant/core_implant/cruciform/divisor
	category = "Divisor"

/datum/ritual/targeted/cruciform/divisor
	name = "cruciform targeted"
	phrase = null
	implant_type = /obj/item/implant/core_implant/cruciform/divisor
	category = "Divisor"

/datum/ritual/targeted/cruciform/divisor/spawn_con
	name = "Canticle of Defense"
	phrase = "Sed Dominus autem mihi astitit, et confortavit me, ut per me prædicatio impleatur, et nuntius ut audirent eum omnes gentes."
	desc = "Request a taser, absolutism tactical belt, and divisor garb from the church armory for defending yourself and your fellow disciples. Establishing the connection takes a lot of power and this litany may only be used once every four hours."
	power = 50
	cooldown = TRUE
	cooldown_time = 4 HOURS
	cooldown_category = "cdefn"
	nutri_cost = 25//med cost
	blood_cost = 25//med cost

/datum/ritual/targeted/cruciform/divisor/spawn_con/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C,list/targets)
	new /obj/item/gun/energy/taser(usr.loc)
	new /obj/item/cell/medium/neotheology(usr.loc)
	new /obj/item/storage/belt/security/neotheology(usr.loc)
	new /obj/item/clothing/head/rank/divisor(usr.loc)
	new /obj/item/clothing/suit/greatcoat/divisor(usr.loc)
	if(user.species?.reagent_tag != IS_SYNTHETIC)
		if(user.nutrition >= nutri_cost)
			user.nutrition -= nutri_cost
		else
			to_chat(user, SPAN_WARNING("You manage to cast the litany at a cost. The physical body consumes itself..."))
			user.vessel.remove_reagent("blood",blood_cost)
	set_personal_cooldown(user)
/*
/datum/ritual/cruciform/divisor/div_flash
	name = "Ire"
	phrase = "Fortitudo mea et laus mea Dominus, et sicut in omnibus divitiis."
	desc = "Knocks over everybody without cruciform in your view range. Though the energy emitted is quite powerful, a vigilant person may resist it. This litany can only be used once every 30 minutes."
	cooldown = TRUE
	cooldown_time = 30 MINUTES
	cooldown_category = "dflas"
	power = 50
	nutri_cost = 50
	blood_cost = 50

/datum/ritual/cruciform/divisor/div_flash/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C)
	if(user.species?.reagent_tag != IS_SYNTHETIC)
		if(user.nutrition >= nutri_cost)
			user.nutrition -= nutri_cost
		else
			to_chat(user, SPAN_WARNING("You manage to cast the litany at a cost. The physical body consumes itself..."))
			user.vessel.remove_reagent("blood",blood_cost)
	playsound(user.loc, 'sound/effects/cascade.ogg', 65, 1)
	log_and_message_admins("performed an ire litany")
	for(var/mob/living/victim in view(user))
		if(!victim.get_core_implant(/obj/item/implant/core_implant/cruciform))
			if(prob(100 - (victim.stats.getStat(STAT_VIG))))
				to_chat(victim, SPAN_WARNING("You feel a blast of energy that knocks you down!"))
				victim.Stun(3)
				victim.Weaken(3)
			else
				to_chat(victim, SPAN_NOTICE("Your legs feel numb, but you managed to stay on your feet!"))
	set_personal_cooldown(user)
	return TRUE
*/
/datum/ritual/cruciform/divisor/echo_of_blasphemy
	name = "Echo of Blasphemy"
	phrase = "Id quod infra non pertinet."
	desc = "Sets alight and burns anything around you without a cruciform. This litany can only be used once every minute."
	cooldown = TRUE
	cooldown_time = 1 MINUTES
	cooldown_category = "flames_of_fate"
	power = 5
	nutri_cost = 15
	blood_cost = 15

/datum/ritual/cruciform/divisor/echo_of_blasphemy/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C)
	if(user.species?.reagent_tag != IS_SYNTHETIC)
		if(user.nutrition >= nutri_cost)
			user.nutrition -= nutri_cost
		else
			to_chat(user, SPAN_WARNING("You manage to cast the litany at a cost. The physical body consumes itself..."))
			user.vessel.remove_reagent("blood",blood_cost)
	playsound(user.loc, 'sound/effects/cascade.ogg', 65, 1)
	log_and_message_admins("performed an echo_of_blasphemy")
	for(var/mob/living/victim in oview(2))
		if(!victim.get_core_implant(/obj/item/implant/core_implant/cruciform))
			to_chat(victim, SPAN_WARNING("A blast of heat and embers hit you!"))
			victim.adjust_fire_stacks(5)
			victim.IgniteMob()
			victim.adjustFireLoss(30)
	set_personal_cooldown(user)
	return TRUE

/datum/ritual/cruciform/divisor/probability_coefficient
	name = "Probability Coefficient"
	phrase = "Lux in tenebris lucet, et tenebrae eam non comprehenderunt."
	desc = "A highly effective litany designed by divisors to warn them of danger, it will reveal the presence of hostile fauna, traps, and potentially monsters hiding as people. Though \
	it may warn you of threats nearby, it cannot tell you exactly what or where. Far more reliable than the reveal adversaries litany, offering multiple detection methods and locating a wider \
	selection of threats."
	power = 50
	nutri_cost = 25
	blood_cost = 25

/datum/ritual/cruciform/divisor/probability_coefficient/perform(mob/living/carbon/human/H, obj/item/implant/core_implant/C)
	var/was_triggired = FALSE
	if(H.species?.reagent_tag != IS_SYNTHETIC)
		if(H.nutrition >= nutri_cost)
			H.nutrition -= nutri_cost
		else
			to_chat(H, SPAN_WARNING("You manage to cast the litany at a cost. The physical body consumes itself..."))
			H.vessel.remove_reagent("blood",blood_cost)
	log_and_message_admins("performed empowered reveal litany")
	for(var/mob/living/carbon/superior_animal/S in range(14, H))
		if (S.stat != DEAD)
			to_chat(H, SPAN_WARNING("Adversaries are near. You can feel something nasty and hostile."))
			was_triggired = TRUE

	if(!was_triggired)
		for (var/mob/living/simple_animal/hostile/S in range(14, H))
			if (S.stat != DEAD)
				to_chat(H, SPAN_WARNING("A simple hostile brute is nearby, nasty and stupid."))
				was_triggired = TRUE

	if(locate(/obj/structure/wire_splicing || /obj/item/mine || /obj/item/mine_old || /obj/item/spider_shadow_trap || /obj/item/beartrap || /obj/item/emp_mine) in view(7, H))
		to_chat(H, SPAN_WARNING("Something is wrong with this area. Tread carefully, someone has laid a trap nearby."))
		was_triggired = TRUE

	for(var/mob/living/carbon/human/target in range(14, H))
		for(var/organ in target.organs)
			if (organ in subtypesof(/obj/item/organ/internal/carrion))
				to_chat(H, SPAN_DANGER("A black terrible evil brushes against your mind suddenly, a horrible monstrous entity who's mere glancing ire is enough to leave you in a breathless cold sweat..."))
				was_triggired = TRUE

	if(!was_triggired)
		to_chat(H, SPAN_NOTICE("There is nothing here. You feel safe."))

	return TRUE

/datum/ritual/cruciform/divisor/divisor_smite
	name = "Divine Smite"
	phrase = "Vides quod homines ex eo quod faciunt, non sola fide justificantur."
	desc = "A short litany spoken in the middle of battle. Considered tricky to use, as it only lasts 30 seconds, but gives the speaker additional power and strength when swinging a melee weapon. Takes five minutes to recharge."
	cooldown = TRUE
	cooldown_time = 5 MINUTES
	cooldown_category = "divisor_smite"
	effect_time = 30 SECONDS
	power = 30
	nutri_cost = 50
	blood_cost = 50
	var/wrath_damage = 0.2

/datum/ritual/cruciform/divisor/divisor_smite/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C)
	if(user.species?.reagent_tag != IS_SYNTHETIC)
		if(user.nutrition >= nutri_cost)
			user.nutrition -= nutri_cost
		else
			to_chat(user, SPAN_WARNING("You manage to cast the litany at a cost. The physical body consumes itself..."))
			user.vessel.remove_reagent("blood",blood_cost)
	user.damage_multiplier += wrath_damage
	to_chat(user, SPAN_NOTICE("You feel divine wrath empowering you with immense but fleeting strength!"))
	set_personal_cooldown(user)
	addtimer(CALLBACK(src, .proc/discard_effect, user), src.cooldown_time)
	return TRUE

/datum/ritual/cruciform/divisor/divisor_smite/proc/discard_effect(mob/living/carbon/human/user, amount)
	user.damage_multiplier -= wrath_damage

//////////////////////////////////////////////////
/////////         FACTORIAL              /////////
//////////////////////////////////////////////////

/datum/ritual/cruciform/factorial
	name = "cruciform"
	phrase = null
	implant_type = /obj/item/implant/core_implant/cruciform/factorial
	fail_message = "The cruciform's gears grind to a halt."
	category = "Factorial"

/datum/ritual/targeted/cruciform/factorial
	name = "cruciform targeted"
	phrase = null
	implant_type = /obj/item/implant/core_implant/cruciform/factorial
	category = "Factorial"

// Battery Charge
/datum/ritual/cruciform/factorial/charge
	name = "Cant of the craft"
	desc = "Use the energy in your cruciform to charge the power cell you are holding."
	phrase = "Observationibus illustrare pio Sine aedificare seris, donec sacra studia cursus ultrices venas et indicia mitte rapinae elit."
	cooldown = TRUE
	cooldown_time = 0 MINUTES
	cooldown_category = "charging"
	power = 0 // Do not use the power in one shot
	var/charge_used = 10 // Amount of cruciform energy used.
	var/charge_rate = 20 // The delay between each charge? The number is in deciseconds, so 30 is equal to 3 seconds

/datum/ritual/cruciform/factorial/charge/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C)
	set_personal_cooldown(user)
	var/inhand = user.get_active_hand()
	if(istype(inhand, /obj/item/cell))
		var/obj/item/cell/P = inhand
		if(P.max_chargerate == 0) // Can we even charge the damn thing.
			fail("This type of cell cannot be charged.", user, C)
			return
		to_chat(user, "You start charging the [P.name].")
		while(C.power >= charge_used) // Keep going until we run out of power
			if(!istype(user.get_active_hand(), /obj/item/cell)) // Check if we're still holding a cell. Because rigged cell explode when charging.
				break
			if(P.fully_charged()) // Leave the loop if the cell is charged.
				break
			if(do_after(user, charge_rate)) // Small delay where the user must stand still
				C.power -= charge_used // We use some juicy cruciform power
				P.give(charge_used * 10) // Charge the power cell
			else
				break // Leave the loop if we interrupt.
		to_chat(user, "You finish charging the [P.name]. It is now [P.percent()]% charged.")
	else
		fail("You need a power cell in your active hand to charge it.", user, C)

// Self-Repair
/datum/ritual/cruciform/factorial/self_repair
	name = "Litany of the iron soul"
	desc = "Use the energy in your cruciform to repair all mechanical parts on the bearer, be they synthetic limbs or organs."
	phrase = "Sic invocamus Absoluta. Ergo omne quod facimus separabuntur."
	cooldown = TRUE
	cooldown_time = 10 MINUTES
	cooldown_category = "repair"
	power = 35
	nutri_cost = 150
	blood_cost = 80 //Aheal but not AOE, so little less bad

/datum/ritual/cruciform/factorial/self_repair/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C)
	if(user.species?.reagent_tag != IS_SYNTHETIC)
		if(user.nutrition >= nutri_cost)
			user.nutrition -= nutri_cost
		else
			to_chat(user, SPAN_WARNING("You manage to cast the litany at a cost. The physical body consumes itself..."))
			user.vessel.remove_reagent("blood",blood_cost)
	user.visible_message("<b><font color='red'>[user]'s cruciform glows before they suddenly collapse!</font><b>", "<b><font color='red'>Your feel the air thrum with an inaudible vibration, your cruciform withdrawing everything you have to empower your litany!</font><b>", "<b><font color='red'>You hear a thud!</font><b>")
	set_personal_cooldown(user) //This needs at least some downside
	for(var/obj/item/organ/augmentic in user) // Run this loop for every organ the user has
		if(augmentic.nature == MODIFICATION_SILICON) // Are the organ made of metal?
			augmentic.heal_damage(30, 30, TRUE)
	to_chat(user, "Your mechanical organs knit themselves back together.")

// Mass-Repair
/datum/ritual/cruciform/factorial/mass_repair
	name = "Blessing of the machine"
	desc = "Use the energy in your cruciform to repair all mechanical parts of those around you, be they synthetic limbs or organs."
	phrase = "Nee tamen carnis denigrant noli haec possunt referri. Tu posse reincarnated - renascentes per voluntatem Dei Absoluta ferro."
	cooldown = TRUE
	cooldown_time = 30 MINUTES
	cooldown_category = "repair"
	power = 50
	nutri_cost = 300
	blood_cost = 125 //This is literally an Aheal, why does it cost less than actual heal ?

/datum/ritual/cruciform/factorial/mass_repair/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C)
	if(user.species?.reagent_tag != IS_SYNTHETIC)
		if(user.nutrition >= nutri_cost)
			user.nutrition -= nutri_cost
		else
			to_chat(user, SPAN_WARNING("You manage to cast the litany at a cost. The physical body consumes itself..."))
			user.vessel.remove_reagent("blood",blood_cost)
	user.visible_message("<b><font color='red'>[user]'s cruciform glows before brightly!</font><b>", "<b><font color='red'>Your feel the air thrum with an inaudible vibration!</font><b>", "<b><font color='red'>You hear a light ticking sound!</font><b>")
	set_personal_cooldown(user) //This needs at least some downside
	for(var/mob/living/carbon/human/H in oview(user)) // Affect everyone the user can see.
		var/synth = FALSE // It is true if at least one of their limbs or organ is synthetic.
		for(var/obj/item/organ/augmentic in H) // Run this loop for every organ the person has
			if(augmentic.nature == MODIFICATION_SILICON) // Are the organ made of metal?
				augmentic.heal_damage(20, 20, TRUE)
				to_chat(H, "Your [augmentic.name] repair itself!")
				synth = TRUE // They have a prosthetic
		if(synth) // Did they have any prosthetics?
			add_effect(H, FILTER_HOLY_GLOW, 25) // Make them glow.

/datum/ritual/cruciform/factorial/omnitool
	name = "Touch of the Engine-Speaker"
	phrase = "Ferro, audi verba mea et tactum senties meum."
	desc = "Channels the power of your cruciform into an incorporeal omnitool."
	power = 40
	cooldown = TRUE
	cooldown_time = 2 MINUTES
	cooldown_category = "omnitool_litany"
	success_message = "Your hand glows with holy light, and you feel more in tune with the machinery around you."

/datum/ritual/cruciform/factorial/omnitool/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C)
	var/obj/item/tool/factorial_omni/tool = new /obj/item/tool/factorial_omni(src, user)
	usr.put_in_active_hand(tool)
	set_personal_cooldown(user)
	return TRUE

/datum/ritual/cruciform/factorial/mod_litany
	name = "Hymn of the Engineer"
	phrase = "Fiducia intra Absolutum precipua est machinae sanctitati confidere, sed semper meminisse debet, limites semper infiniti sunt."
	desc = "Creates unique mods or cruciform upgrades. Due to the complexity of the technology, this litany may only be used \
	once every two hours. One must still perform the rites of installation to upgrade one's cruciform."
	power = 40
	cooldown = TRUE
	cooldown_time = 90 MINUTES
	cooldown_category = "mod_litany"
	success_message = "On the verge of audibility you hear pleasant music. Seemingly working on their own, your hands shape a brand new device."
	var/anti_cheat = FALSE

/datum/ritual/cruciform/factorial/mod_litany/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C)
	if(anti_cheat)
		fail("Your Greed will resault in your downfall. Take your requested item, and wait your turn like the rest.", user, C)
		return FALSE

	anti_cheat = TRUE

	var/response = input(user, "Which upgrade do you require?") in list("Holy Oils", "Righteous Seal", "Nature's Blessing", "Cleansing Presence", "Faith's Shield", "Martyr's Gift", "Wrath of God", "Speed of the Chosen", "Cancel Litany")
	if (response == "Holy Oils")
		new /obj/item/tool_upgrade/augment/holy_oils(user.loc)
		if(user.species?.reagent_tag != IS_SYNTHETIC)
			if(user.nutrition >= nutri_cost)
				user.nutrition -= nutri_cost
			else
				to_chat(user, SPAN_WARNING("You manage to cast the litany at a cost. The physical body consumes itself..."))
				user.vessel.remove_reagent("blood",blood_cost)
		set_personal_cooldown(user)
		anti_cheat = FALSE
		return TRUE
	if (response == "Righteous Seal")
		new /obj/item/tool_upgrade/augment/crusader_seal(user.loc)
		if(user.species?.reagent_tag != IS_SYNTHETIC)
			if(user.nutrition >= nutri_cost)
				user.nutrition -= nutri_cost
			else
				to_chat(user, SPAN_WARNING("You manage to cast the litany at a cost. The physical body consumes itself..."))
				user.vessel.remove_reagent("blood",blood_cost)
		set_personal_cooldown(user)
		anti_cheat = FALSE
		return TRUE
	if (response == "Nature's Blessing")
		new /obj/item/cruciform_upgrade/natures_blessing(user.loc)
		if(user.species?.reagent_tag != IS_SYNTHETIC)
			if(user.nutrition >= nutri_cost)
				user.nutrition -= nutri_cost
			else
				to_chat(user, SPAN_WARNING("You manage to cast the litany at a cost. The physical body consumes itself..."))
				user.vessel.remove_reagent("blood",blood_cost)
		set_personal_cooldown(user)
		anti_cheat = FALSE
		return TRUE
	if (response == "Cleansing Presence")
		new /obj/item/cruciform_upgrade/cleansing_presence(user.loc)
		if(user.species?.reagent_tag != IS_SYNTHETIC)
			if(user.nutrition >= nutri_cost)
				user.nutrition -= nutri_cost
			else
				to_chat(user, SPAN_WARNING("You manage to cast the litany at a cost. The physical body consumes itself..."))
				user.vessel.remove_reagent("blood",blood_cost)
		set_personal_cooldown(user)
		anti_cheat = FALSE
		return TRUE
	if (response == "Faith's Shield")
		new /obj/item/cruciform_upgrade/faiths_shield(user.loc)
		if(user.species?.reagent_tag != IS_SYNTHETIC)
			if(user.nutrition >= nutri_cost)
				user.nutrition -= nutri_cost
			else
				to_chat(user, SPAN_WARNING("You manage to cast the litany at a cost. The physical body consumes itself..."))
				user.vessel.remove_reagent("blood",blood_cost)
		set_personal_cooldown(user)
		anti_cheat = FALSE
		return TRUE
	if (response == "Martyr's Gift")
		new /obj/item/cruciform_upgrade/martyr_gift(user.loc)
		if(user.species?.reagent_tag != IS_SYNTHETIC)
			if(user.nutrition >= nutri_cost)
				user.nutrition -= nutri_cost
			else
				to_chat(user, SPAN_WARNING("You manage to cast the litany at a cost. The physical body consumes itself..."))
				user.vessel.remove_reagent("blood",blood_cost)
		set_personal_cooldown(user)
		anti_cheat = FALSE
		return TRUE
	if (response == "Wrath of God")
		new /obj/item/cruciform_upgrade/wrath_of_god(user.loc)
		if(user.species?.reagent_tag != IS_SYNTHETIC)
			if(user.nutrition >= nutri_cost)
				user.nutrition -= nutri_cost
			else
				to_chat(user, SPAN_WARNING("You manage to cast the litany at a cost. The physical body consumes itself..."))
				user.vessel.remove_reagent("blood",blood_cost)
		set_personal_cooldown(user)
		anti_cheat = FALSE
		return TRUE
	if (response == "Speed of the Chosen")
		new /obj/item/cruciform_upgrade/speed_of_the_chosen(user.loc)
		if(user.species?.reagent_tag != IS_SYNTHETIC)
			if(user.nutrition >= nutri_cost)
				user.nutrition -= nutri_cost
			else
				to_chat(user, SPAN_WARNING("You manage to cast the litany at a cost. The physical body consumes itself..."))
				user.vessel.remove_reagent("blood",blood_cost)
		set_personal_cooldown(user)
		anti_cheat = FALSE
		return TRUE
	if (response == "Cancel Litany")
		fail("You decide not to obtain church artifice at this time.", user, C)
		anti_cheat = FALSE
		return FALSE
	anti_cheat = FALSE
	return TRUE
