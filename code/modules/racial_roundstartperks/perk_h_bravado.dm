////////////////////////////////////// Perks
/datum/perk/smalladrenaline
	name = "Adrenaline"
	desc = "Since the very own start of your own species, when everything looked grim, you are reminded of how you can muster a moment of bravado, reminding yourself that you are stronger than this. You toughen up your circulation and metabolism, allowing you to ignore some of your pain and maluses, while stopping your bleeding in a very mild way and lightly healing your wounds. Due to this adaptation, you body is constantly resupplying your adrenaline glands in case of emergency and aswell making you more suceptible to additions and lower tolerance of NSA."
	active = FALSE
	passivePerk = FALSE

/datum/perk/smalladrenaline/assign(mob/living/carbon/human/H)
	..()
	holder.maxHealth -=7
	holder.health -=7

/datum/perk/smalladrenaline/remove()
	holder.maxHealth +=7
	holder.health +=7
	..()

/datum/perk/smalladrenaline/assign(mob/living/carbon/human/H)
	..()
	holder.metabolism_effects.addiction_chance_multiplier = 2
	holder.metabolism_effects.nsa_bonus -= 25
	holder.metabolism_effects.calculate_nsa()

/datum/perk/smalladrenaline/remove()
	holder.metabolism_effects.addiction_chance_multiplier = 2
	holder.metabolism_effects.nsa_bonus += 25
	holder.metabolism_effects.calculate_nsa()
	..()

/datum/perk/smalladrenaline/activate()
	var/mob/living/carbon/human/user = usr
	if(!istype(user))
		return ..()
	if(world.time < cooldown_time)
		to_chat(usr, SPAN_NOTICE("The human body can only take so much, you'll need more time before you've recovered enough to use this again."))
		return FALSE
	cooldown_time = world.time + 7 MINUTES //Compared to its counter part it is LOWER due to its genuine drawnbacks.
	user.visible_message("[user] body tensed up badly from the response of the pain, seemingly wincing in pain but steading themselves in a staggering bravado!", "You ain't givng up to the pain... !")
	log_and_message_admins("used their [src] perk.")
	user.reagents.add_reagent("hakronol", 5)
	return ..()

/datum/perk/willofpower
	name = "Will Of Steel"
	desc = "You push your carnal desire to keep living until you can't, letting your body recover slightly from any type of toxic damage out of sheer force of will at the cost of becoming extremely exhausted while it works. However due to your body adaptation, you can't muster to stay firm when you fall nor your skin is adapted enough to deal with rough abrasion such as explosion and shock waves."
	active = FALSE
	passivePerk = FALSE

/datum/perk/willofpower/activate()
	var/mob/living/carbon/human/user = usr
	if(!istype(user))
		return ..()
	if(world.time < cooldown_time)
		to_chat(usr, SPAN_NOTICE("The body can only take so much, you'll need more time to gather your strenght again."))
		return FALSE
	cooldown_time = world.time + 12 MINUTES
	user.visible_message("[user]looked visibly tired as their body seems more lethargic, slowing down as they focus on managing their pain!", "You feel exhausted as you slow down to let your body recover, focusing on controlling your breathing while your body slowly mends some of your injuries.")
	log_and_message_admins("used their [src] perk.")
	user.reagents.add_reagent("hustikol", 7)
	return ..()

/datum/perk/willofpower/activate/assign(mob/living/carbon/human/H)
	..()
	holder.mob_bomb_defense -= 25
	holder.falls_mod -= 0.4

/datum/perk/willofpower/activate/remove()
	holder.mob_bomb_defense += 25
	holder.falls_mod += 0.4
	..()

/datum/perk/battleroar
	name = "Powerful Roar"
	desc = "Life has taught you that your voice is powerful, what made your kind to conquer was also a sense of mighty, power and cooperation among your kind. Your heroic roar can inspire yourself and others to better performance in combat.... but making yourself slower and and heavier becoming way more sluggish climbing things and aswell taking more trauma when falling down"
	active = FALSE
	passivePerk = FALSE

/datum/perk/battleroar/assign(mob/living/carbon/human/H)
	..()
	holder.mod_climb_delay += 0.45
	holder.falls_mod += 0.3

/datum/perk/battleroar/remove()
	holder.mod_climb_delay -= 0.45
	holder.falls_mod -= 0.3
	..()

/datum/perk/battleroar/activate()
	var/mob/living/carbon/human/user = usr
	var/list/people_around = list()
	if(!istype(user))
		return ..()
	if(world.time < cooldown_time)
		to_chat(usr, SPAN_NOTICE("You cannot muster your throat to have a roar just yet."))
		return FALSE
	cooldown_time = world.time + 15 MINUTES
	log_and_message_admins("used their [src] perk.")
	for(var/mob/living/carbon/human/H in view(user))
		if(H != user && !isdeaf(H))
			people_around.Add(H)
	if(people_around.len > 0)
		for(var/mob/living/carbon/human/participant in people_around)
			to_chat(participant, SPAN_NOTICE("You feel a urge to fight by a powerful roar!"))
			give_boost(participant)
	give_boost(usr)
	usr.emote("bellow")
	return ..()

/datum/perk/battleroar/proc/give_boost(mob/living/carbon/human/participant)
	var/effect_time = 10 MINUTES //Stat boost 10 minutes! Only five points so its fair!
	var/amount = 10
	var/list/stats_to_boost = list(STAT_ROB = 5, STAT_TGH = 5, STAT_VIG = 5)
	for(var/stat in stats_to_boost)
		participant.stats.changeStat(stat, amount)
		addtimer(CALLBACK(src, .proc/take_boost, participant, stat, amount), effect_time)

/datum/perk/battleroar/proc/take_boost(mob/living/carbon/human/participant, stat, amount)
	participant.stats.changeStat(stat, -amount)



/datum/reagent/medicine/hakronol
	name = "Hakronol"
	id = "hakronol"
	description = "A chemical naturally produced by several species that learned to push to their body to its limits, allowing them to possibly recover from mild injuries."
	taste_description = "grossness and pain"
	reagent_state = LIQUID
	color = "#8040FF"
	nerve_system_accumulations = 45
	appear_in_default_catalog = TRUE
	constant_metabolism = TRUE
	scannable = TRUE

/datum/reagent/medicine/hakronol/affect_blood(mob/living/carbon/M, alien, effect_multiplier)
	M.adjustOxyLoss(-0.2)
	M.heal_organ_damage(0.015, 0.015)
	M.adjustToxLoss(-0.1)
	M.add_chemical_effect(CE_BLOODCLOT, 0.01)
	M.add_chemical_effect(CE_PAINKILLER, 10, TRUE)

/datum/reagent/medicine/hustikol
	name = "Hustikol"
	id = "hustikol"
	description = "A chemical naturally produced by several species that pushed  their body to its limit. Induces a recovery coma to heal their wounds."
	taste_description = "bitterness and agony"
	reagent_state = LIQUID
	color = "#ded890"
	nerve_system_accumulations = 45
	appear_in_default_catalog = TRUE
	constant_metabolism = TRUE
	scannable = TRUE

/datum/reagent/medicine/hustikol/affect_blood(mob/living/carbon/M, alien, effect_multiplier)
	M.heal_organ_damage(0.02, 0.1, 2) //Trade Healing damage to  |
	M.add_chemical_effect(CE_BLOODCLOT, min(4,2.6)) // Clotting V
	M.adjustOxyLoss(-0.5) // Heart start beating faster. You get more oxygen to your limbs and organs
	M.adjustToxLoss(-0.1)
	M.add_chemical_effect(CE_PAINKILLER, 25, TRUE)
	M.add_chemical_effect(CE_BLOODRESTORE, 2.5 * effect_multiplier) //Trade some parts of really good bonuses to blood restauration
	M.add_chemical_effect(CE_PULSE, 4) // Very fast pulse, helps regenerate lost blood faster coupled with its massive CE_BLOODRESTORE effect
	//Sleeping aswell. So it is not used in combat.
	var/effective_dose = dose
	if(issmall(M))
		effective_dose *= 15

	if(effective_dose < 15)
		if(effective_dose == metabolism * 2 || prob(5))
			M.emote("yawn")
	else if(effective_dose < 10)
		M.eye_blurry = max(M.eye_blurry, 10)
	else if(effective_dose < 8)
		if(prob(50))
			M.Weaken(2)
		M.drowsyness = max(M.drowsyness, 10)
	else
		M.sleeping = max(M.sleeping, 5)
		M.drowsyness = max(M.drowsyness, 40)
