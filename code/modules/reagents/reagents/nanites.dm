/* This file has been completely restructured for Occulus && Soj*/

#define NANOBOTS_BLOOD_DRAIN 0.003
// Nanobots blood drain per unit
#define NANOBOTS_HEAVY_BLOOD_DRAIN 0.01 //.0010 more then normal, ontop of are 0.003
//Chtmans lose more

/datum/reagent/nanites
	name = ""
	id = "dont use these"
	description = "Microscopic construction robots."
	taste_description = "slimy metal"
	reagent_state = LIQUID
	color = "#696969" // ( ͡° ͜ʖ ͡°)
	metabolism = REM/2
	heating_point = 523
	heating_products = list("nanites")
	scannable = TRUE
	affects_dead = 1
	reagent_type = "Nanites"

/datum/reagent/nanites/proc/eat_blood(mob/living/carbon/M) // Yam !
	var/datum/reagent/organic/blood/B = M.get_blood()
	// blood regeneratin 0.1 u every tick so with NANOBOTS_BLOOD_DRAIN = 0.003 human can sustain 30u nanobots without losing blood
	if(B && B.volume)
		B.remove_self(volume * NANOBOTS_BLOOD_DRAIN)
		if(M.species.reagent_tag == IS_CHTMANT)
			B.remove_self(volume * NANOBOTS_HEAVY_BLOOD_DRAIN) //If we are a Chtmant we lose more
			M.add_chemical_effect(CE_TOXIN, 0.1) //We also take toxin damage

/datum/reagent/nanites/proc/will_occur(mob/living/carbon/M, alien, var/location)
	if(location == CHEM_BLOOD)
		return TRUE

/datum/reagent/nanites/consumed_amount(mob/living/carbon/M, alien, var/location)
	if(will_occur(M, alien, location))
		return ..()
	else
		return 0


/datum/reagent/nanites/affect_blood(mob/living/carbon/M, alien, effect_multiplier)
	eat_blood(M)
	if(M.get_blood_volume() * M.effective_blood_volume < M.total_blood_req + BLOOD_VOLUME_OKAY_MODIFIER)
		var/removed = consumed_amount() * (M.total_blood_req + BLOOD_VOLUME_OKAY_MODIFIER - M.get_blood_volume() / 100 * M.effective_blood_volume)
		removed = min(volume,removed)
		var/datum/reagents/metabolism/met = M.get_metabolism_handler(CHEM_BLOOD)
		met.remove_reagent(id, removed)
		met.add_reagent("nanodead", removed)
	if(will_occur(M, alien, CHEM_BLOOD))
		return TRUE

/datum/reagent/nanites/capped
	name = "Raw Industrial Nanobots"
	id = "nanites"
	description = "Microscopic construction robots. Useless without programming"
	heating_point = null
	heating_products = null

/datum/reagent/nanites/capped/will_occur(mob/living/carbon/M, alien, var/location)
	return FALSE

/datum/reagent/nanites/dead
	name = "Broken Nanobots"
	id = "nanodead"
	description = "Broken microscopic construction robots."
	taste_description = "slimey metal"
	color = "#535E66"
	metabolism = REM/4
	heating_point = null
	heating_products = null

/datum/reagent/nanites/dead/eat_blood(mob/living/carbon/M)
	return

/datum/reagent/nanites/dead/will_occur(mob/living/carbon/M, alien, var/location)
	return TRUE

/datum/reagent/nanites/dead/affect_blood(mob/living/carbon/M, alien, effect_multiplier)
	if(..())
		M.add_chemical_effect(CE_TOXIN, 2 * effect_multiplier)
	if(M.species.reagent_tag == IS_CHTMANT) //If we are a Chtmant we take double the affect
		M.add_chemical_effect(CE_TOXIN, 2 * effect_multiplier) //All and all this is 0.4 x effect mult + 0.1! REALLY lethal to Chtmants


/datum/reagent/nanites/uncapped
	name = "Raw Uncapped Nanobots"
	id = "uncap nanites"
	description = "Microscopic construction robots with safety overridden. Valuable, but useless without programming."
	heating_point = null
	heating_products = null

/datum/reagent/nanites/uncapped/will_occur(mob/living/carbon/M, alien, var/location)
	if(type == /datum/reagent/nanites/uncapped) // only derived classes are consumed
		return FALSE
	return TRUE

/*Medical Nanites*/
/*ARAD - Removes Radiation*/
/datum/reagent/nanites/arad
	name = "A-rad"
	id = "arad nanites"
	description = "Microscopic construction robots programmed to aid body with radiation effects."

/datum/reagent/nanites/arad/will_occur(mob/living/carbon/M, alien, var/location)
	if(..() && M.radiation)
		return TRUE

/datum/reagent/nanites/arad/affect_blood(mob/living/carbon/M, alien, effect_multiplier)
	if(..())
		M.radiation = max(M.radiation - (5 + M.radiation * 0.10) * effect_multiplier, 0)

/*Nantidotes - Removes foreign substances from the blood stream*/

/datum/reagent/nanites/nantidotes
	name = "Nantidotes"
	id = "nantidotes"
	description = "Microscopic construction robots programmed to purge bloodstream from any foreign bodies, except themselves."

/datum/reagent/nanites/nantidotes/will_occur(mob/living/carbon/M, alien, var/location)
	if(..() && M.bloodstr)
		for(var/current in M.bloodstr.reagent_list)
			if(!istype(current, /datum/reagent/nanites))
				return TRUE

/datum/reagent/nanites/nantidotes/affect_blood(mob/living/carbon/M, alien, effect_multiplier)
	if(..())
		if(M.bloodstr)
			for(var/current in M.bloodstr.reagent_list)
				var/datum/reagent/R = current
				if(!istype(current, /datum/reagent/nanites))
					R.remove_self(effect_multiplier * 1)

/*Nanosymbiotes - General purpose restoration nanites for raw damage. Regardless of limb type*/

/datum/reagent/nanites/nanosymbiotes
	name = "Nanosymbiotes"
	id = "nanosymbiotes"
	description = "Microscopic construction robots programmed to heal organic and synthetic cells. Useless for internal damage"

/datum/reagent/nanites/nanosymbiotes/will_occur(mob/living/carbon/M, alien, var/location)
	if(..() && (M.getBruteLoss() || M.getFireLoss() || M.getOxyLoss()))
		return TRUE

/datum/reagent/nanites/nanosymbiotes/affect_blood(mob/living/carbon/M, alien, effect_multiplier)
	if(..())
		M.add_chemical_effect(CE_ONCOCIDAL, 1)
		M.adjustOxyLoss(-(1 + (M.getOxyLoss() * 0.03)) * effect_multiplier)
		M.adjustFireLoss(-(1 + (M.getFireLoss() * 0.03)) * effect_multiplier)
		M.adjustBruteLoss(-(1 + (M.getBruteLoss() * 0.03)) * effect_multiplier)
	if(!M.species.reagent_tag == IS_CHTMANT) //If we are a Chtmant we dont heal are toxloss from nanites
		M.add_chemical_effect(CE_TOXIN, -((1 + (M.chem_effects[CE_TOXIN] * 0.03)) * effect_multiplier))

/datum/reagent/nanites/oxyrush
	name = "Oxyrush"
	id = "oxyrush"
	description = "Microscopic construction robots programmed to keep oxygenation level stable no matter what."

/datum/reagent/nanites/oxyrush/will_occur(mob/living/carbon/M, alien, var/location)
	if(..() && M.getOxyLoss())
		return TRUE

/datum/reagent/nanites/oxyrush/affect_blood(mob/living/carbon/M, alien, effect_multiplier)
	if(..())
		M.adjustOxyLoss(-30 * effect_multiplier)
		M.add_chemical_effect(CE_OXYGENATED, 2)

/*Trauma Control System - Repairs internal organ damage for user*/

/datum/reagent/nanites/trauma_control_system
	name = "Trauma Control System"
	id = "trauma_control_system"
	description = "Microscopic construction robots programmed to restore vitality of damaged organs."

/datum/reagent/nanites/trauma_control_system/will_occur(mob/living/carbon/M, alien, var/location)
	if(..() && ishuman(M))
		var/mob/living/carbon/human/H = M
		for(var/obj/item/organ/organ in H.organs) //Grab the organ holding the implant.
			if(organ.status & ORGAN_WOUNDED && !BP_IS_ROBOTIC(organ))
				return TRUE

/datum/reagent/nanites/trauma_control_system/affect_blood(mob/living/carbon/M, alien, effect_multiplier)
	if(..())
		M.add_chemical_effect(CE_ONCOCIDAL, 1)
		M.add_chemical_effect(CE_BLOODCLOT, 1)
		M.add_chemical_effect(CE_ANTITOX, 2)
		M.add_chemical_effect(CE_STABLE, 1)
		M.add_chemical_effect(CE_BRAINHEAL, 1)
		M.add_chemical_effect(CE_EYEHEAL, 1)

/datum/reagent/nanites/purgers
	name = "Purgers"
	id = "nanopurgers"
	description = "Microscopic construction robots programmed to purge bloodstream from any nanobots."

/datum/reagent/nanites/purgers/will_occur(mob/living/carbon/M, alien, var/location)
	if(..() && M.bloodstr)
		for(var/current in M.bloodstr.reagent_list)
			if(istype(current, /datum/reagent/nanites) && !istype(current, /datum/reagent/nanites/purgers))
				return TRUE

/datum/reagent/nanites/purgers/affect_blood(mob/living/carbon/M, alien, effect_multiplier)
	if(..())
		if(M.bloodstr)
			for(var/current in M.bloodstr.reagent_list)
				var/datum/reagent/R = current
				if(istype(current, /datum/reagent/nanites) && !istype(current, /datum/reagent/nanites/purgers))
					R.remove_self(effect_multiplier * 1)

/datum/reagent/nanites/uncapped/control_booster_utility
	name = "Control Booster Utility"
	id = "cbu"
	description = "Microscopic construction robots programmed to enchant immensively mental capabilities."
	heating_point = 523
	heating_products = list("uncap nanites")
	reagent_type = "Nanites/Stimulator"

/datum/reagent/nanites/uncapped/control_booster_utility/affect_blood(mob/living/carbon/M, alien, effect_multiplier)
	if(..())
		M.stats.addTempStat(STAT_MEC, STAT_LEVEL_EXPERT, STIM_TIME, "CBU")
		M.stats.addTempStat(STAT_BIO, STAT_LEVEL_EXPERT, STIM_TIME, "CBU")
		M.stats.addTempStat(STAT_COG, STAT_LEVEL_EXPERT, STIM_TIME, "CBU")

/datum/reagent/nanites/uncapped/control_booster_combat
	name = "Control Booster Combat"
	id = "cbc"
	description = "Microscopic construction robots programmed to enchant combat capabilites to maximum."
	heating_point = 523
	heating_products = list("uncap nanites")
	reagent_type = "Nanites/Stimulator"

/datum/reagent/nanites/uncapped/control_booster_combat/affect_blood(mob/living/carbon/M, alien, effect_multiplier)
	if(..())
		M.stats.addTempStat(STAT_VIG, STAT_LEVEL_EXPERT, STIM_TIME, "CBC")
		M.stats.addTempStat(STAT_TGH, STAT_LEVEL_EXPERT, STIM_TIME, "CBC")
		M.stats.addTempStat(STAT_ROB, STAT_LEVEL_EXPERT, STIM_TIME, "CBC")

/datum/reagent/nanites/uncapped/voice_mimic
	name = "Voice mimics"
	id = "nanovoice"
	description = "Microscopic construction robots programmed to change users voice. You should hit them first, just in case..."
	var/voiceName = "Unknown"
	heating_point = 523
	heating_products = list("uncap nanites")

/datum/reagent/nanites/uncapped/voice_mimic/affect_blood(mob/living/carbon/M, alien, effect_multiplier)
	if(..())
		M.add_chemical_effect(CE_VOICEMIMIC, voiceName)

/datum/reagent/nanites/uncapped/dynamic_handprints
	name = "Handyprints"
	id = "nanohands"
	description = "Microscopic construction robots programmed to change handprints while in bloodstream."
	var/uni_identity
	heating_point = 523
	heating_products = list("uncap nanites")
	illegal = TRUE

/datum/reagent/nanites/uncapped/dynamic_handprints/on_mob_add(mob/living/L)
	..()
	var/mob/living/carbon/human/host = L
	if(istype(host))
		for(var/mob/living/carbon/human/H in GLOB.human_mob_list)
			if(host != H && H.dna)
				uni_identity = H.dna.uni_identity
				return

/datum/reagent/nanites/uncapped/dynamic_handprints/affect_blood(mob/living/carbon/M, alien, effect_multiplier)
	if(..())
		M.add_chemical_effect(CE_DYNAMICFINGERS, uni_identity)

// FBP med - simple nanites for dealing with wounds and applying robo-chem effects
/datum/reagent/nanites/fbp
	name = "simple nanobots"
	description = "Microscopic construction robots. Useless without programming and have limited use."
	id = "dont use these either"
	constant_metabolism = TRUE

/datum/reagent/nanites/fbp/will_occur(mob/living/carbon/M, alien, var/location)
	if(location == CHEM_INGEST)
		return TRUE

// "Blood" clot
/datum/reagent/nanites/fbp/repair
	name = "repair nanites"
	description = "Microscopic construction robots programmed to repair internal components."
	id = "fbp_repair"
	overdose = REAGENTS_OVERDOSE / 6

/datum/reagent/nanites/fbp/repair/affect_ingest(mob/living/carbon/M, alien, effect_multiplier)
	if(!..())
		return
	M.add_chemical_effect(CE_MECH_REPAIR, 0.25)

/datum/reagent/nanites/fbp/repair/overdose(mob/living/carbon/M, alien)
	if(!..())
		return
	M.add_chemical_effect(CE_MECH_REPAIR, 0.75)

/* Uncomment when CE_MECH_REPLENISH has a use
// "Blood" restore
/datum/reagent/nanites/fbp/replenish
	name = "replenishing nanobots"
	description = "Microscopic construction robots programmed to replenish internal fluids."
	id = "fbp_replenish"
/datum/reagent/nanites/fbp/replenish/affect_ingest(mob/living/carbon/M, alien, effect_multiplier)
	if(!..())
		return
	M.add_chemical_effect(CE_MECH_REPLENISH, 1)
*/
