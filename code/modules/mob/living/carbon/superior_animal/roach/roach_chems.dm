/datum/reagent/toxin/blattedin
	name = "Blattedin"
	id = "blattedin"
	description = "A powerful toxin produced by those omnipresent roaches."
	taste_description = "chicken"
	reagent_state = LIQUID
	color = "#0F4800"
	strength = 0.15
	var/heal_strength = 5
	metabolism = REM * 0.1

	heating_point = T0C + 260
	heating_products = list("carbon", "protein")

/datum/reagent/toxin/blattedin/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	if(istype(M, /mob/living/carbon/superior_animal/roach))
		var/mob/living/carbon/superior_animal/roach/bug = M
		bug.heal_organ_damage(heal_strength*removed)
	else if(M.species?.reagent_tag == IS_CHTMANT || (ROACH_BLOOD in M.mutations))
		M.adjustOxyLoss(-0.6)
		M.heal_organ_damage(0.3)
		M.adjustToxLoss(-0.3)
		M.add_chemical_effect(CE_BLOODCLOT, 0.1)
	else
		. = ..()

/datum/reagent/toxin/blattedin/affect_ingest(mob/living/carbon/M, alien, effect_multiplier)
	if(M.species?.reagent_tag == IS_CHTMANT || (ROACH_BLOOD in M.mutations))
		return
	else
		. = ..()

/datum/reagent/toxin/blattedin/on_mob_add(mob/living/L)
	..()
	if(istype(L, /mob/living/carbon/superior_animal/roach))
		var/mob/living/carbon/superior_animal/roach/bug = L
		if(bug.stat == DEAD)
			if((bug.blattedin_revives_left >= 0) && prob(70))//Roaches sometimes can come back to life from healing vapors
				bug.visible_message("<b>\The [bug.name]</b> twitches as it comes back to life!")
				blattedin_revive(bug)

/datum/reagent/toxin/blattedin/proc/blattedin_revive(var/mob/living/carbon/superior_animal/roach/bug)
	bug.blattedin_revives_left = max(0, bug.blattedin_revives_left - 1)
	bug.rejuvenate()

/datum/reagent/toxin/diplopterum
	name = "Diplopterum"
	id = "diplopterum"
	description = "Can be found in tissues of the roaches."
	taste_description = "sludge"
	reagent_state = LIQUID
	color = "#c9bed2"
	overdose = 16
	strength = 1
	addiction_chance = 10
	nerve_system_accumulations = 5
	heating_point = 573
	heating_products = list("radium", "acetone", "hydrazine", "nutriment")
	reagent_type = "Toxin/Stimulator"

/datum/reagent/toxin/diplopterum/affect_blood(mob/living/carbon/M, alien, effect_multiplier)
	M.stats.addTempStat(STAT_MEC, STAT_LEVEL_BASIC, STIM_TIME, "diplopterum")

	if(M.species?.reagent_tag == IS_CHTMANT)
		M.adjustOxyLoss(-1.5 * effect_multiplier)
		M.add_chemical_effect(CE_OXYGENATED, 1)
		holder.remove_reagent("lexorin", 0.2 * effect_multiplier)
		M.add_chemical_effect(CE_TOXIN, -0.1)
		return
	else
		. = ..()

/datum/reagent/toxin/diplopterum/affect_ingest(mob/living/carbon/M, alien, effect_multiplier)
	if(M.species?.reagent_tag == IS_CHTMANT)
		return
	else
		. = ..()

/datum/reagent/toxin/diplopterum/withdrawal_act(mob/living/carbon/M)
	if(M.species?.reagent_tag == IS_CHTMANT)
		return
	M.stats.addTempStat(STAT_MEC, -STAT_LEVEL_BASIC, STIM_TIME, "diplopterum_w")
	M.stats.addTempStat(STAT_TGH, -STAT_LEVEL_BASIC, STIM_TIME, "diplopterum_w")

/datum/reagent/toxin/diplopterum/overdose(mob/living/carbon/M, alien)
	var/od_toxicity = (dose / 2) * strength
	if(issmall(M))
		M.add_chemical_effect(CE_TOXIN, od_toxicity * 2)
	else
		M.add_chemical_effect(CE_TOXIN, od_toxicity)

/datum/reagent/toxin/seligitillin
	name = "Seligitillin"
	id = "seligitillin"
	description = "Promotes blood clotting. Harvested from Seuche roaches."
	taste_description = "plague"
	reagent_state = LIQUID
	color = "#6d33b4"
	overdose = 16
	addiction_chance = 10
	nerve_system_accumulations = 5
	heating_point = 573
	heating_products = list("radium", "ammonia", "sulfur", "nutriment")

/datum/reagent/toxin/seligitillin/affect_blood(mob/living/carbon/M, alien, effect_multiplier)
	var/mob/living/carbon/human/H = M
	for(var/obj/item/organ/external/E in H.organs)
		for(var/datum/wound/W in E.wounds)
			if(W.internal)
				W.heal_damage(1 * effect_multiplier)
	if(M.species?.reagent_tag == IS_CHTMANT)
		M.heal_organ_damage(0, 0.6 * effect_multiplier, 0, 3 * effect_multiplier)
		return

/datum/reagent/toxin/seligitillin/affect_ingest(mob/living/carbon/M, alien, effect_multiplier)
	if(M.species?.reagent_tag == IS_CHTMANT)
		return
	else
		. = ..()

/datum/reagent/toxin/seligitillin/withdrawal_act(mob/living/carbon/M)
	if(M.species?.reagent_tag == IS_CHTMANT)
		return
	M.stats.addTempStat(STAT_TGH, -STAT_LEVEL_ADEPT, STIM_TIME, "seligitillin_w")

/datum/reagent/toxin/seligitillin/overdose(mob/living/carbon/M, alien)
	if(!ishuman(M))
		return
	var/mob/living/carbon/human/H = M
	var/obj/item/organ/internal/vital/heart/S = H.random_organ_by_process(OP_HEART)
	if(istype(S))
		S.take_damage(dose/2, FALSE, TOX)
	var/obj/item/organ/internal/liver/L = H.random_organ_by_process(OP_LIVER)
	if(istype(L))
		L.take_damage(dose/2, FALSE, TOX)

/datum/reagent/toxin/starkellin
	name = "Starkellin"
	id = "starkellin"
	description = "Harvested from Panzer roaches."
	taste_description = "metal"
	reagent_state = LIQUID
	color = "#736bbe"
	overdose = 16
	addiction_chance = 15
	nerve_system_accumulations = 5
	heating_point = 573
	heating_products = list("radium", "aluminum", "tungsten", "nutriment")
	reagent_type = "Toxin/Stimulator"

/datum/reagent/toxin/starkellin/affect_blood(mob/living/carbon/M, alien, effect_multiplier)
	M.stats.addTempStat(STAT_TGH, STAT_LEVEL_BASIC, STIM_TIME, "starkellin")

	if(M.species?.reagent_tag == IS_CHTMANT)
		M.heal_organ_damage(0.6 * effect_multiplier, 0, 5 * effect_multiplier)
		M.add_chemical_effect(CE_BLOODCLOT, 0.15)
		M.add_chemical_effect(CE_TOXIN, -0.1)
		return
	else
		. = ..()

/datum/reagent/toxin/starkellin/affect_ingest(mob/living/carbon/M, alien, effect_multiplier)
	if(M.species?.reagent_tag == IS_CHTMANT)
		return
	else
		. = ..()

/datum/reagent/toxin/starkellin/withdrawal_act(mob/living/carbon/M)
	if(M.species?.reagent_tag == IS_CHTMANT)
		return
	M.stats.addTempStat(STAT_ROB, -STAT_LEVEL_BASIC, STIM_TIME, "starkellin_w")
	M.stats.addTempStat(STAT_TGH, -STAT_LEVEL_BASIC, STIM_TIME, "starkellin_w")

/datum/reagent/toxin/gewaltine
	name = "Gewaltine"
	id = "gewaltine"
	description = "Harvested from Jager roaches."
	taste_description = "raw meat"
	reagent_state = LIQUID
	color = "#9452ba"
	overdose = 16
	addiction_chance = 20
	nerve_system_accumulations = 5
	strength = 1
	heating_point = 573
	heating_products = list("radium", "mercury", "sugar", "nutriment")
	reagent_type = "Toxin/Stimulator"

/datum/reagent/toxin/gewaltine/affect_blood(mob/living/carbon/M, alien, effect_multiplier)
	M.stats.addTempStat(STAT_ROB, STAT_LEVEL_BASIC, STIM_TIME, "gewaltine")
	M.stats.addTempStat(STAT_TGH, -STAT_LEVEL_BASIC, STIM_TIME, "gewaltine")

	if(M.species?.reagent_tag == IS_CHTMANT)
		M.drowsyness = max(0, M.drowsyness - 0.6 * effect_multiplier)
		M.adjust_hallucination(-0.9 * effect_multiplier)
		M.add_chemical_effect(CE_ANTITOX, 2)
		holder.remove_reagent("pararein", 0.4 * effect_multiplier)
		return

/datum/reagent/toxin/gewaltine/affect_ingest(mob/living/carbon/M, alien, effect_multiplier)
	if(M.species?.reagent_tag == IS_CHTMANT)
		return
	else
		. = ..()

/datum/reagent/toxin/gewaltine/withdrawal_act(mob/living/carbon/M)
	if(M.species?.reagent_tag == IS_CHTMANT)
		return
	M.stats.addTempStat(STAT_ROB, -STAT_LEVEL_ADEPT, STIM_TIME, "gewaltine_w")
	M.stats.addTempStat(STAT_VIG, -STAT_LEVEL_BASIC, STIM_TIME, "gewaltine_w")

/datum/reagent/toxin/gewaltine/overdose(mob/living/carbon/M, alien)
	M.adjustCloneLoss(2)

/datum/reagent/toxin/fuhrerole
	name = "Fuhrerole"
	id = "fuhrerole"
	description = "Harvested from Fuhrer roaches."
	taste_description = "third reich"
	reagent_state = LIQUID
	color = "#a6b85b"
	overdose = 16
	addiction_chance = 30
	nerve_system_accumulations = 10
	heating_point = 573
	heating_products = list("radium", "mercury", "lithium", "nutriment")

/datum/reagent/toxin/fuhrerole/affect_blood(mob/living/carbon/M, alien, effect_multiplier)
	if(M.species?.reagent_tag == IS_CHTMANT)
		var/mob/living/carbon/human/H = M
		for(var/obj/item/organ/I in H.internal_organs)
			if((I.damage > 0) && !BP_IS_ROBOTIC(I)) //Chtmants are not meant to have robotic organs!
				I.heal_damage(((0.2 + I.damage * 0.05) * effect_multiplier), FALSE)
		return
	else
		M.faction = "roach"
		. = ..()

/datum/reagent/toxin/fuhrerole/affect_ingest(mob/living/carbon/M, alien, effect_multiplier)
	if(M.species?.reagent_tag == IS_CHTMANT)
		return
	else
		. = ..()

/datum/reagent/toxin/fuhrerole/on_mob_delete(mob/living/carbon/L)
	..()
	if(L.species?.reagent_tag == IS_CHTMANT)
		return
	L.faction = initial(L.faction)

/datum/reagent/toxin/fuhrerole/withdrawal_act(mob/living/carbon/M)
	if(M.species?.reagent_tag == IS_CHTMANT)
		return
	M.stats.addTempStat(STAT_ROB, -STAT_LEVEL_BASIC, STIM_TIME, "fuhrerole_w")
	M.stats.addTempStat(STAT_TGH, -STAT_LEVEL_BASIC, STIM_TIME, "fuhrerole_w")

/datum/reagent/toxin/fuhrerole/overdose(mob/living/carbon/M, alien)
	M.add_chemical_effect(CE_SPEECH_VOLUME, rand(3,4))
	M.adjustBrainLoss(0.5)
