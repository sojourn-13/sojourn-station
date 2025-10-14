/* General medicine */
/datum/reagent/medicine
	reagent_type = "Medicine"


/datum/reagent/medicine/inaprovaline
	name = "Inaprovaline"
	id = "inaprovaline"
	description = "Inaprovaline is a weak yet broad synaptic stimulant and cardiostimulant. Commonly used to stabilize patients in critical condition. Very weak painkiller. Stabilizes Breathing. Weak Blood Clotting. Weak oxygen deprivation healing."
	taste_description = "bitterness"
	reagent_state = LIQUID
	color = "#00BFFF"
	overdose = REAGENTS_OVERDOSE * 2
	metabolism = REM * 0.5
	scannable = TRUE
	nerve_system_accumulations = -5
	liver_dependent = FALSE // Emergency stabilizer that works without liver

/datum/reagent/medicine/inaprovaline/affect_blood(mob/living/carbon/M, alien, effect_multiplier) // No more useless chem of leftover baycode with no inference on health due to pulse not affecting anything. - Seb
	M.add_chemical_effect(CE_PULSE, -1)
	M.add_chemical_effect(CE_STABLE, 1) // Keeping these useless effects for the sake of RP.
	M.add_chemical_effect(CE_PAINKILLER, 15 * effect_multiplier)
	M.adjustOxyLoss(-0.5 * effect_multiplier) // Should help stall for time against oxyloss killing you to heavy bloodloss or lung/heart damage until your eventual rescue, but won't heal it outright.
	M.add_chemical_effect(CE_OXYGENATED, 1)
	M.add_chemical_effect(CE_BLOODCLOT, 0.1) // Emergency stop bleeding, still lowest tier
	M.add_chemical_effect(CE_HEARTRESTART, effect_multiplier * 0.5) // Weak heart restart capability

/datum/reagent/medicine/bicaridine
	name = "Bicaridine"
	id = "bicaridine"
	description = "Bicaridine treats trauma at a moderate rate. Will lessen external bleeding. Less affective in Cht'mant."
	taste_description = "bitterness"
	taste_mult = 3
	reagent_state = LIQUID
	color = "#BF0000"
	overdose = REAGENTS_OVERDOSE
	scannable = TRUE
	nerve_system_accumulations = 15 // Basic chems shouldn't hurt the body as much as higher potency ones.
	liver_dependent = FALSE // Basic trauma medicine should work in emergencies even without liver

/datum/reagent/medicine/bicaridine/affect_blood(mob/living/carbon/M, alien, effect_multiplier)
	if(M.species?.reagent_tag == IS_CHTMANT || M.species?.reagent_tag == IS_SLIME)
		M.heal_organ_damage(0.15 * effect_multiplier, 0, 5 * effect_multiplier)
		return
	M.heal_organ_damage(0.3 * effect_multiplier, 0, 5 * effect_multiplier)
	M.add_chemical_effect(CE_BLOODCLOT, 0.15)

/datum/reagent/medicine/monocaridine
	name = "Monocaridine"
	id = "monocaridine"
	description = "Monocaridine is a slow-acting medication that can be used to treat blunt trauma, naturally derived for plants. Functional for species with odd blood types. Bonds with and neutralizes Bicaridine."
	taste_description = "faint bitterness"
	taste_mult = 3
	reagent_state = LIQUID
	color = "#eb0046"
	overdose = REAGENTS_OVERDOSE
	scannable = TRUE
	nerve_system_accumulations = 15 // Basic chems shouldn't hurt the body as much as higher potency ones.

/datum/reagent/medicine/monocaridine/affect_blood(mob/living/carbon/M, alien, effect_multiplier)
	M.heal_organ_damage(0.1 * effect_multiplier, 0, 1 * effect_multiplier)
	M.add_chemical_effect(CE_BLOODCLOT, 0.15)

/datum/reagent/medicine/somnadine
	name = "Somnadine"
	id = "somnadine"
	description = "Somnadine is a complex blunt trauma gel that is applied to the skin. The patient has to be asleep for it to work. It will quickly and effectively clear up cuts and other skin level damage, with a minimal risk of overdose"
	taste_description = "bitterness"
	taste_mult = 1.5
	reagent_state = LIQUID
	color = "#700122"
	overdose = REAGENTS_OVERDOSE * 2.5
	scannable = TRUE
	nerve_system_accumulations = 10

//Only works on touch
/datum/reagent/medicine/somnadine/affect_touch(mob/living/carbon/M, alien, effect_multiplier)
	if(M.sleeping)
		M.heal_organ_damage(1.5 * effect_multiplier, 0)

/datum/reagent/medicine/vermicetol
	name = "Vermicetol"
	id = "vermicetol"
	description = "A potent chemical that treats physical damage at an exceptional rate."
	taste_description = "bitter meat"
	taste_mult = 3
	reagent_state = LIQUID
	color = "#964e06"
	overdose = REAGENTS_OVERDOSE * 0.5
	scannable = TRUE
	nerve_system_accumulations = 30

/datum/reagent/medicine/vermicetol/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	M.heal_organ_damage(12 * removed, 0)

/datum/reagent/medicine/varceptol
	name = "Varceptol"
	id = "varceptol"
	description = "A powerful treatment chemical capable of repairing both the body and purging of toxins."
	taste_description = "tangy"
	taste_mult = 3
	reagent_state = LIQUID
	color = "#FF69B4" //rgb(255,105,180)hotpink
	overdose = REAGENTS_OVERDOSE * 0.5
	scannable = TRUE
	nerve_system_accumulations = 20

/datum/reagent/medicine/varceptol/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	M.heal_organ_damage(9 * removed, 0)
	M.add_chemical_effect(CE_ANTITOX, 3)

/datum/reagent/medicine/meralyne
	name = "Meralyne"
	id = "meralyne"
	description = "Meralyne is the next step in brute trauma medication. Works twice as good as Bicaridine and enables the body to restore even the direst brute-damaged tissue, while clotting bleeding incisions and cuts."
	taste_description = "bitterness"
	taste_mult = 3
	reagent_state = LIQUID
	color = "#E6666C"
	overdose = REAGENTS_OVERDOSE
	scannable = TRUE
	nerve_system_accumulations = 30

/datum/reagent/medicine/meralyne/affect_blood(mob/living/carbon/M, alien, effect_multiplier)
	M.heal_organ_damage(0.6 * effect_multiplier, 0, 5 * effect_multiplier)
	M.add_chemical_effect(CE_BLOODCLOT, 0.30)

/datum/reagent/medicine/moonwater
	name = "Moon Water"
	id = "moon water"
	description = "Moon water is a natural medicine used to treat burn wounds in many species. Does not function well with chemical alternatives."
	taste_description = "salty"
	reagent_state = LIQUID
	color = "#c4fcf9"
	overdose = REAGENTS_OVERDOSE
	scannable = TRUE
	nerve_system_accumulations = 10

/datum/reagent/medicine/moonwater/affect_blood(mob/living/carbon/M, alien, effect_multiplier)
	M.heal_organ_damage(0, 0.3 * effect_multiplier, 0, 1.5 * effect_multiplier)

/datum/reagent/medicine/kelotane
	name = "Kelotane"
	id = "kelotane"
	description = "Kelotane is a drug used to treat burns. Does not work on Cht'mant, use Seligitillin instead."
	taste_description = "bitterness"
	reagent_state = LIQUID
	color = "#FFA800"
	overdose = REAGENTS_OVERDOSE
	scannable = TRUE
	nerve_system_accumulations = 10
	liver_dependent = TRUE // Burn medicine requiring liver processing

/datum/reagent/medicine/kelotane/affect_blood(mob/living/carbon/M, alien, effect_multiplier)
	if(M.species?.reagent_tag == IS_CHTMANT)
		return
	if(M.species?.reagent_tag == IS_SLIME)
		M.heal_organ_damage(0, 0.3 * effect_multiplier, 0, 1.5 * effect_multiplier)
		return
	M.heal_organ_damage(0, 0.6 * effect_multiplier, 0, 3 * effect_multiplier)

/datum/reagent/medicine/dermaline
	name = "Dermaline"
	id = "dermaline"
	description = "Dermaline is the next step in burn medication. Works twice as well as Kelotane and enables the body to restore even the direst heat-damaged tissue. Prevents infection. Has a low overdose threshold. Can be combined with Kelotane in equal parts (commonly known as KeloDerm) to reduce danger of overdose, their effects stacking."
	taste_description = "bitterness"
	taste_mult = 1.5
	reagent_state = LIQUID
	color = "#FF8000"
	overdose = REAGENTS_OVERDOSE * 0.5
	scannable = TRUE
	nerve_system_accumulations = 20

/datum/reagent/medicine/dermaline/affect_blood(mob/living/carbon/M, alien, effect_multiplier)
	if(M.species?.reagent_tag == IS_SLIME)
		M.heal_organ_damage(0, 0.6 * effect_multiplier, 0, 2.5 * effect_multiplier)
		return
	M.heal_organ_damage(0, 1.2 * effect_multiplier, 0, 5 * effect_multiplier)

/datum/reagent/medicine/dermahypnodol
	name = "Dermahypnodol"
	id = "dermahypnodol"
	description = "Dermahypnodol is a complex anti-burn gel that gets applied to the skin. The patient has to be asleep for it to work. It will quickly and effectively clear up burns with a minimal risk of overdose"
	taste_description = "bitterness"
	taste_mult = 1.5
	reagent_state = LIQUID
	color = "#914A01"
	overdose = REAGENTS_OVERDOSE * 2.5
	scannable = TRUE
	nerve_system_accumulations = 10

//Only works on touch
/datum/reagent/medicine/dermahypnodol/affect_touch(mob/living/carbon/M, alien, effect_multiplier)
	if(M.sleeping)
		M.heal_organ_damage(0, 1.5 * effect_multiplier, 0, 5 * effect_multiplier)

/datum/reagent/medicine/dylovene
	name = "Dylovene"
	id = "anti_toxin"
	description = "Dylovene is a broad-spectrum antitoxin. Heals toxin damage, shortens the duration of drug-related hallucinations and sleepiness, and removes Pararein, Carpotoxin, Blattedin and Toxin from the blood."
	taste_description = "a roll of gauze"
	reagent_state = LIQUID
	color = "#00A000"
	scannable = TRUE
	overdose = REAGENTS_OVERDOSE
	nerve_system_accumulations = 0
	liver_dependent = TRUE // Critical anti-toxin requiring liver processing

/datum/reagent/medicine/dylovene/affect_blood(mob/living/carbon/M, alien, effect_multiplier)
	M.drowsyness = max(0, M.drowsyness - 0.6 * effect_multiplier)
	M.adjust_hallucination(-0.9 * effect_multiplier)
	M.add_chemical_effect(CE_ANTITOX, 2)
	holder.remove_reagent("pararein", 0.8 * effect_multiplier)
	holder.remove_reagent("carpotoxin", 0.4 * effect_multiplier) // Fish recipes no longer contain carpotoxin, but good in cases of poisoning.
	holder.remove_reagent("toxin", 0.4 * effect_multiplier)
	holder.remove_reagent("blattedin", 0.4 * effect_multiplier) // Massive complains about its slow metabolization rate + poisoning actually working, plus dylo originally purged it, so I'm bringing it back. - Seb
	holder.remove_reagent("wasp_toxin", 0.2 * effect_multiplier)
	holder.remove_reagent("amatoxin", 0.2 * effect_multiplier) // We hate the shitbirds

/datum/reagent/medicine/lg_antitoxin
	name = "Low-grade Antitoxin"
	id = "lg_anti_toxin"
	description = "Low-grade antitoxin, harvested from common medicinal plants. A natural alternative for treating poisons and toxins, slowly. Also Neutralizes Dylovene."
	taste_description = "a roll of gauze"
	reagent_state = LIQUID
	color = "#00A000"
	scannable = TRUE
	overdose = REAGENTS_OVERDOSE
	nerve_system_accumulations = 0

/datum/reagent/medicine/lg_antitoxin/affect_blood(mob/living/carbon/M, alien, effect_multiplier)
	M.drowsyness = max(0, M.drowsyness - 0.6 * effect_multiplier)
	M.adjust_hallucination(-0.2 * effect_multiplier)
	M.add_chemical_effect(CE_ANTITOX, 1)

	holder.remove_reagent("pararein", 0.2 * effect_multiplier)
	holder.remove_reagent("carpotoxin", 0.1 * effect_multiplier)
	holder.remove_reagent("toxin", 0.1 * effect_multiplier)
	holder.remove_reagent("blattedin", 0.1 * effect_multiplier)
	holder.remove_reagent("wasp_toxin", 0.05 * effect_multiplier)
	holder.remove_reagent("amatoxin", 0.05 * effect_multiplier)


/datum/reagent/medicine/dylovene/overdose(mob/living/carbon/human/user, alien)
	var/obj/item/organ/internal/blood_vessel/user_vessel = user.random_organ_by_process(OP_BLOOD_VESSEL)
	create_overdose_wound(user_vessel, user, /datum/component/internal_wound/organic/heavy_poisoning, "accumulation")

/datum/reagent/medicine/carthatoline
	name = "Carthatoline"
	id = "carthatoline"
	description = "Carthatoline is a strong evacuant used to treat severe poisoning. As well as a mild nerve system relaxant. Treats toxin damage at an accelerated rate, while healing damage to the liver."
	reagent_state = LIQUID
	color = "#225722"
	scannable = TRUE
	nerve_system_accumulations = -10
	liver_dependent = FALSE // Liver healing medicine must work without liver

/datum/reagent/medicine/carthatoline/affect_blood(var/mob/living/carbon/M, var/alien, effect_multiplier, var/removed = REM)
	M.add_chemical_effect(CE_ANTITOX, 3 * (dose * 0.1)) //every 10u is 3 antitox, starts out slow but rapidly grows
	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		var/obj/item/organ/internal/liver/L = H.random_organ_by_process(OP_LIVER)
		if(istype(L))
			if(BP_IS_ROBOTIC(L))
				return
			if(L.damage > 0)
				L.damage = max(L.damage - 2 * removed, 0)
	holder.remove_reagent("pararein", 0.8 * effect_multiplier)
	holder.remove_reagent("carpotoxin", 0.4 * effect_multiplier) // Gonna be good for fish recipes // Copypasting even my commentary? tsk tsk - Seb
	holder.remove_reagent("toxin", 0.4 * effect_multiplier)
	holder.remove_reagent("stoxin", 0.4 * effect_multiplier)     //Fuck mobs and injectables
	holder.remove_reagent("zombiepowder", 0.4 * effect_multiplier)
	holder.remove_reagent("xenotoxin", 0.4 * effect_multiplier)
	holder.remove_reagent("blattedin", 0.8 * effect_multiplier) // Consistency with Dylovene, making it a straight upgrade worth mixing.
	holder.remove_reagent("wasp_toxin", 0.6 * effect_multiplier)
	holder.remove_reagent("amatoxin", 0.4 * effect_multiplier)
	holder.remove_reagent("xenotoxin", 0.2 * effect_multiplier) // Not the best removal but beats a dyalisis or juggling with haloperidol

/datum/reagent/medicine/cordradaxon
	name = "Cordradaxon"
	id = "cordradaxon"
	description = "An intense organ repair chemical used to treat damage to the heart. As well as used as a nerve system relaxant."
	reagent_state = LIQUID
	color = "#8B0000" // rgb(139,0,0)
	scannable = TRUE
	nerve_system_accumulations = -30

/datum/reagent/medicine/cordradaxon/affect_blood(var/mob/living/carbon/M, var/alien, var/removed = REM)
	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		var/obj/item/organ/internal/vital/heart/C = H.random_organ_by_process(OP_HEART)
		if(H && istype(H))
			if(BP_IS_ROBOTIC(C))
				return
			if(C.damage > 0)
				C.damage = max(C.damage - 5 * removed, 0)
	M.add_chemical_effect(CE_HEARTRESTART, 1.5) // Strong heart restart capability

/datum/reagent/medicine/dexalin
	name = "Dexalin"
	id = "dexalin"
	description = "Heals oxygen deprivation damage slowly while removing Lexorin from bloodstream. Does nothing for Cht'mant, use Diplopterum instead."
	taste_description = "bitterness"
	reagent_state = LIQUID
	color = "#0080FF"
	overdose = REAGENTS_OVERDOSE
	scannable = TRUE
	nerve_system_accumulations = 5
	liver_dependent = FALSE // Oxygen medicine that works without liver

/datum/reagent/medicine/dexalin/affect_blood(mob/living/carbon/M, alien, effect_multiplier)
	if(M.species?.reagent_tag == IS_CHTMANT)
		return
	M.adjustOxyLoss(-1.5 * effect_multiplier)
	holder.remove_reagent("lexorin", 0.2 * effect_multiplier)
	var/ce_to_add = 1 - M.chem_effects[CE_OXYGENATED]
	if(ce_to_add > 0)
		M.add_chemical_effect(CE_OXYGENATED, ce_to_add)

/datum/reagent/medicine/dexalinp
	name = "Dexalin Plus"
	id = "dexalinp"
	description = "Dexalin Plus is used in the treatment of oxygen deprivation as well as muscle repair. Heals oxygen deprivation faster than Dexalin. Removes Lexorin from the bloodstream. Also slowly and slightly heals muscles inside the body."
	taste_description = "bitterness"
	reagent_state = LIQUID
	color = "#0040FF"
	overdose = REAGENTS_OVERDOSE * 0.5
	scannable = TRUE
	nerve_system_accumulations = 10
	liver_dependent = FALSE // Advanced oxygen medicine that works without liver

/datum/reagent/medicine/dexalinp/affect_blood(mob/living/carbon/M, alien, effect_multiplier, var/removed = REM)
	M.adjustOxyLoss(-30 * effect_multiplier)
	holder.remove_reagent("lexorin", 0.3 * effect_multiplier)
	var/ce_to_add = 2 - M.chem_effects[CE_OXYGENATED]
	if(ce_to_add > 0)
		M.add_chemical_effect(CE_OXYGENATED, ce_to_add)
	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		//G for GUNS
		var/obj/item/organ/internal/muscle/G = H.random_organ_by_process(OP_MUSCLE)
		if(H && istype(H))
			if(BP_IS_ROBOTIC(G))
				return
			if(G.damage > 0)
				G.damage = max(G.damage - 5 * removed, 0)

/datum/reagent/medicine/quintalin
	name = "Quintalin"
	id = "quintalin"
	description = "A slow acting, natural remedy for oxygen deprivation. Works on all kinds of creatures, but neutralizes dexalin chemicals."
	taste_description = "bitterness"
	reagent_state = LIQUID
	color = "#8dc6ff"
	overdose = REAGENTS_OVERDOSE
	scannable = TRUE
	nerve_system_accumulations = 5

/datum/reagent/medicine/quintalin/affect_blood(mob/living/carbon/M, alien, effect_multiplier)
	M.adjustOxyLoss(-0.5 * effect_multiplier)
	holder.remove_reagent("lexorin", 0.2 * effect_multiplier)
	var/ce_to_add = 1 - M.chem_effects[CE_OXYGENATED]
	if(ce_to_add > 0)
		M.add_chemical_effect(CE_OXYGENATED, ce_to_add)

/datum/reagent/medicine/respirodaxon
	name = "Respirodaxon"
	id = "respirodaxon"
	description = "An intense organ repair chemical used to treat damage to the lungs."
	taste_description = "bitter air"
	reagent_state = LIQUID
	color = "#000080"
	overdose = REAGENTS_OVERDOSE * 0.5
	scannable = TRUE
	nerve_system_accumulations = -30

/datum/reagent/medicine/respirodaxon/affect_blood(var/mob/living/carbon/M, var/alien, var/removed = REM)
	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		var/obj/item/organ/internal/vital/lungs/L = H.random_organ_by_process(OP_LUNGS)
		if(H && istype(H))
			if(BP_IS_ROBOTIC(L))
				return
			if(L.damage > 0)
				L.damage = max(L.damage - 5 * removed, 0)

/datum/reagent/medicine/tricordrazine
	name = "Tricordrazine"
	id = "tricordrazine"
	description = "Tricordrazine is a highly potent stimulant, originally derived from Cordrazine. Can be used to treat a wide range of injuries. Heals brute, burn, toxin and oxygen damage, albeit slowly. Clots minor wounds from bleeding. Can be combined with other medications for faster treatment. Overdose causes massive toxin and brain damage until death. Does not work on Cht'mant, use Blattedin instead."
	taste_description = "grossness"
	reagent_state = LIQUID
	color = "#8040FF"
	scannable = TRUE
	overdose = REAGENTS_OVERDOSE
	nerve_system_accumulations = 15
	liver_dependent = FALSE // Broad-spectrum emergency medicine that works without liver

/datum/reagent/medicine/tricordrazine/affect_blood(mob/living/carbon/M, alien, effect_multiplier)
	if(M.species?.reagent_tag == IS_CHTMANT)
		return
	M.adjustOxyLoss(-0.6 * effect_multiplier)
	M.heal_organ_damage(0.3 * effect_multiplier, 0.3 * effect_multiplier)
	M.add_chemical_effect(CE_ANTITOX, 1)
	M.add_chemical_effect(CE_BLOODCLOT, 0.1)

/datum/reagent/medicine/tricordrazine/overdose(mob/living/carbon/human/user, alien)
	var/obj/item/organ/internal/liver/user_liver = user.random_organ_by_process(OP_LIVER)
	if(!user_liver)
		return FALSE
	user_liver.take_damage(dose/3, FALSE, TOX)
	// For those special people
	if(volume > 300 && prob(10))
		var/obj/item/organ/internal/blood_vessel/user_vessel = user.random_organ_by_process(OP_BLOOD_VESSEL)
		if(!user_vessel)
			return FALSE
		to_chat(user, "You feel intense swelling in your [user_vessel.loc?.name], and you notice it going numb and red!")
		user.AdjustParalysis(5)
		user_vessel.take_damage(15, FALSE, TOX)

/datum/reagent/medicine/cryoxadone
	name = "Cryoxadone"
	id = "cryoxadone"
	description = "A chemical mixture that heals every single type of superficial injury, toxins, and suffocation. Its main limitation is that the target's body temperature must be under 170K for it to metabolize correctly. Used in beakers inside cryogenic cells. Also treats genetic (cellular) damage. Does not work if ingested."
	taste_description = "sludge"
	reagent_state = LIQUID
	color = "#8080FF"
	metabolism = REM
	scannable = TRUE
	affects_dead = TRUE
	liver_dependent = FALSE // Cryo medicine that works without liver

/datum/reagent/medicine/cryoxadone/affect_blood(mob/living/carbon/M, alien, effect_multiplier)
	if(M.bodytemperature < 170)
		M.add_chemical_effect(CE_ONCOCIDAL, 1)
		M.add_chemical_effect(CE_OXYGENATED, 1)
		M.add_chemical_effect(CE_BLOODCLOT, 0.50)
		M.add_chemical_effect(CE_ANTITOX, 2)
		M.add_chemical_effect(CE_ANTIBIOTIC, 5)
		M.add_chemical_effect(CE_PULSE, -2)
		M.adjustOxyLoss(-(1 + (M.getOxyLoss() * 0.05)) * effect_multiplier)
		M.heal_organ_damage(effect_multiplier, effect_multiplier, 5 * effect_multiplier, 5 * effect_multiplier)

/datum/reagent/medicine/cronexidone
	name = "Cronexidone"
	id = "cronexidone"
	description = "A liquid compound that is in all ways superior to Cryoxadone. Can be used to treat severe cellular damage, internal organ damage, and repair even dead bodies when used in conjunction with a cryo tube."
	taste_description = "slime"
	reagent_state = LIQUID
	color = "#80BFFF"
	metabolism = REM
	scannable = TRUE
	affects_dead = TRUE //This can even heal dead people.
	liver_dependent = FALSE // Cryo medicine that works without liver

/datum/reagent/medicine/cronexidone/affect_blood(mob/living/carbon/M, alien, effect_multiplier)
	if(M.bodytemperature < 170)
		M.add_chemical_effect(CE_ONCOCIDAL, 2)
		M.add_chemical_effect(CE_OXYGENATED, 2)
		M.add_chemical_effect(CE_BLOODCLOT, 1)
		M.add_chemical_effect(CE_ANTITOX, 2)
		M.add_chemical_effect(CE_ANTIBIOTIC, 5)
		M.add_chemical_effect(CE_PULSE, -2)
		M.adjustOxyLoss(-(1 + (M.getOxyLoss() * 0.05)) * effect_multiplier)
		M.heal_organ_damage(effect_multiplier, effect_multiplier, 5 * effect_multiplier, 5 * effect_multiplier)
		if(ishuman(M)) // Half of Peridaxon's effect for corpses.
			var/mob/living/carbon/human/H = M
			for(var/obj/item/organ/I in H.internal_organs)
				if((I.damage > 0) && !BP_IS_ROBOTIC(I) && !istype(I, /obj/item/organ/internal/bone)) // No healing bones, nor robotic organs.
					I.heal_damage(((0.2 + I.damage * 0.05) * effect_multiplier), FALSE)

/datum/reagent/medicine/nanitefluid
	name = "Nanobot Fluid"
	id = "nanofluid"
	description = "A plasma solution of tiny nanobots programmed to repair robotic organs and prosthetics. Due to the nature of the small magnetic fields used to guide the nanites, it must be used in temperatures below 170K. Does not work to repair FBP's, as they do not have a bloodstream. Also works on dead bodies."
	taste_description = "a chaff grenade"
	reagent_state = LIQUID
	color = "#c2c2d6"
	metabolism = REM
	scannable = TRUE
	affects_dead = TRUE
	liver_dependent = FALSE // Cryo medicine that works without liver

/datum/reagent/medicine/nanitefluid/affect_blood(mob/living/carbon/M, alien, effect_multiplier)
	if(M.bodytemperature < 170)
		if(ishuman(M))
			var/mob/living/carbon/human/H = M
			for(var/obj/item/organ/external/robotic/E in H.organs)
				E.heal_damage(15 * effect_multiplier, 15 * effect_multiplier, TRUE)
			for(var/obj/item/organ/I in H.internal_organs)
				if((I.damage > 0) && BP_IS_ROBOTIC(I))
					I.heal_damage(((0.3 + I.damage * 0.1) * effect_multiplier), TRUE)

/* Cloning Reagent - From Eris
We don't use this but we might find use for it. Porting it since it was updated in Erismed 4 */

/*
/datum/reagent/medicine/clonexadone
	name = "Clonexadone"
	id = "clonexadone"
	description = "A liquid compound similar to that used in the cloning process. Can be used to 'finish' the cloning process when used in conjunction with a cryo tube."
	taste_description = "slime"
	reagent_state = LIQUID
	color = "#80BFFF"
	metabolism = REM * 0.5
	scannable = 1

/datum/reagent/medicine/clonexadone/affect_blood(mob/living/carbon/M, alien, effect_multiplier)
	if(M.bodytemperature < 170)
		M.add_chemical_effect(CE_ONCOCIDAL, 1)
		M.add_chemical_effect(CE_OXYGENATED, 1)
		M.add_chemical_effect(CE_BLOODCLOT, 0.50)
		M.add_chemical_effect(CE_ANTITOX, 2)
		M.add_chemical_effect(CE_ANTIBIOTIC, 5)
		M.add_chemical_effect(CE_PULSE, -2)
		M.adjustOxyLoss(-(3 + (M.getOxyLoss() * 0.05)) * effect_multiplier)
		M.heal_organ_damage(3 * effect_multiplier, 3 * effect_multiplier, 5 * effect_multiplier, 5 * effect_multiplier)
*/


/* Painkillers */

/datum/reagent/medicine/paracetamol
	name = "Paracetamol"
	id = "paracetamol"
	description = "Most probably know this as Tylenol, this chemical is a mild, simple painkiller and nerve relaxant."
	taste_description = "sickness"
	reagent_state = LIQUID
	color = "#C8A5DC"
	overdose = 60
	scannable = TRUE
	metabolism = 0.1 // Who thought it was a good idea for such a mild painkiller to last a lifetime?
	nerve_system_accumulations = -10
	liver_dependent = FALSE // Basic painkiller that works without liver

/datum/reagent/medicine/paracetamol/affect_blood(mob/living/carbon/M, alien, effect_multiplier)
	M.add_chemical_effect(CE_PAINKILLER, 25)

/datum/reagent/medicine/paracetamol/overdose(mob/living/carbon/M, alien)
	..()
	M.druggy = max(M.druggy, 2)

/datum/reagent/medicine/tramadol
	name = "Tramadol"
	id = "tramadol"
	description = "Medium painkiller. Generally all around useful for mild to semi-severe damage. Stronger than Paracetamol, weaker than Oxycodone. Overdose causes hallucinations, slurring, and slowdown, and eventually stuns you if you're not tough enough."
	taste_description = "sourness"
	reagent_state = LIQUID
	color = "#CB68FC"
	overdose = REAGENTS_OVERDOSE
	scannable = TRUE
	metabolism = 0.1
	nerve_system_accumulations = 40

/datum/reagent/medicine/tramadol/affect_blood(mob/living/carbon/M, alien, effect_multiplier)
	M.add_chemical_effect(CE_PAINKILLER, 50)

/datum/reagent/medicine/tramadol/overdose(mob/living/carbon/M, alien)
	..()
	M.hallucination(120, 30)
	M.slurring = max(M.slurring, 30)
	M.add_chemical_effect(CE_SLOWDOWN, 1)
	if(prob(3 - (2 * M.stats.getMult(STAT_TGH))))
		M.Stun(3)

/datum/reagent/medicine/oxycodone
	name = "Oxycodone"
	id = "oxycodone"
	description = "Most powerful painkiller. Useful when you run out of anesthetics and need to keep a patient out of pain during surgery, or if near fatally hurt. Makes the user feel druggy. Overdosing causes hallucinations, drugginess, slurring, and slowed movement, it also stuns them if they are not tough enough."
	taste_description = "bitterness"
	reagent_state = LIQUID
	color = "#800080"
	overdose = REAGENTS_OVERDOSE * 0.66
	metabolism = 0.1 //Was sticking around waaaaay too long
	nerve_system_accumulations = 60
	scannable = TRUE //Finnicky chem application, we need to know how much of it is on a system to prevent overdose.

/datum/reagent/medicine/oxycodone/affect_blood(mob/living/carbon/M, alien, effect_multiplier)
	M.add_chemical_effect(CE_PAINKILLER, 75) //Enough to do surgery while awake without causing pain messages
	M.druggy = max(M.druggy, 10)

/datum/reagent/medicine/oxycodone/overdose(mob/living/carbon/M, alien)
	..()
	M.hallucination(120, 30)
	M.druggy = max(M.druggy, 10)
	M.slurring = max(M.slurring, 30)
	M.add_chemical_effect(CE_SLOWDOWN, 1)
	if(prob(5 - (2 * M.stats.getMult(STAT_TGH))))
		M.Stun(5)

/* Church related chemicals */
/datum/reagent/medicine/nepenthe  //Monomial super-painkiller
	name = "Nepenthe"
	id = "nepenthe"
	description = "Pain is imperfection leaving the body. Suffer through it, child of the Monomial, so that you may attain the Perfection of Form."
	taste_description = "fading sorrow"
	reagent_state = LIQUID
	color = "#AA5656"
	overdose = 0
	scannable = FALSE
	metabolism = 0.2
	appear_in_default_catalog = FALSE
	nerve_system_accumulations = -100

/datum/reagent/medicine/nepenthe/affect_blood(mob/living/carbon/M, alien, effect_multiplier)
	M.add_chemical_effect(CE_PAINKILLER, 1000)

/datum/reagent/medicine/paracetamol/holy //It's now just paracetamol. The holy Tylenol, though no OD
	name = "Laudanum"
	id = "laudanum"
	description = "A nostalgic sensation of relief and calm against the faintest aches."
	taste_description = "home"
	reagent_state = LIQUID
	color = "#488531"
	overdose = 0
	//scannable = FALSE Might make them unscannable again before fullmerge, but for now I need to be able to see them easily to test them
	appear_in_default_catalog = FALSE

/datum/reagent/medicine/tramadol/holy //Tramadol, but with half NSA
	name = "Anodyne"
	id = "anodyne"
	description = "The power of the Absolute grants relief from pain."
	taste_description = "numbness"
	color = "#BAA845"
	//scannable = FALSE
	nerve_system_accumulations = 20
	appear_in_default_catalog = FALSE

/datum/reagent/medicine/oxycodone/holy //Oxycodone but with half NSA and higher OD limit
	name = "Holy Myrrh"
	id = "myrrh"
	description = "The faith healing of the Tessellates can extend even to some of the most severe pains known to creatures."
	taste_description = "numbness"
	overdose = REAGENTS_OVERDOSE
	//scannable = FALSE
	nerve_system_accumulations = 30

/datum/reagent/medicine/inaprovaline/holy
	id = "holyinaprovaline"
	scannable = FALSE
	appear_in_default_catalog = FALSE

/datum/reagent/medicine/dexalinp/holy
	name = "Breath of Life"
	description = "A chemical of unknown origin capable of treating oxygen deprivation and repairing muscles, highly effective but difficult to detect."
	id = "holydexalinp"
	//scannable = FALSE
	appear_in_default_catalog = FALSE
	overdose = 0
	nerve_system_accumulations = 0

/datum/reagent/medicine/tricordrazine/holy //Tricord but no NSA
	name = "Restorative Grace"
	description = "A holy chemical that slowly heals the body of basic ills."
	id = "holytricord"
	//scannable = FALSE
	nerve_system_accumulations = 0

/datum/reagent/medicine/quickclot/holy
	name = "Blood of God"
	description = "A holy chemical that stymies the flow of blood."
	id = "holyquickclot"
	//scannable = FALSE

/datum/reagent/medicine/dylovene/holy
	name = "Cleanse the Body"
	description = "A holy chemical that purges the blood of common toxins."
	id = "holydylo"
	//scannable = FALSE

/datum/reagent/medicine/cindpetamol/holy
	name = "Alignitol"
	id = "alignitol"
	description = "A chemical of unknown origin that purges toxins and addictions from the body, making it highly effective at aiding others, but has the side effect of putting users unconcious."
	taste_description = "bitterness"
	reagent_state = LIQUID
	color = "#FF3300"
	nerve_system_accumulations = 0
	appear_in_default_catalog = FALSE
	constant_metabolism = TRUE
	scannable = FALSE
	overdose = 0
	nerve_system_accumulations = 0

/datum/reagent/medicine/spaceacillin/holy
	name = "Holycilin"
	id = "holycilin"
	description = "A theta-lactam antibiotic. Slows progression of diseases. Treats infections as long as 1 unit or more are present on the body. Also treats Toxin damage"
	taste_description = "sweetness"
	appear_in_default_catalog = FALSE
	constant_metabolism = TRUE
	scannable = FALSE
	overdose = 0
	nerve_system_accumulations = 0

/* Other medicine */

/datum/reagent/medicine/synaptizine
	name = "Synaptizine"
	id = "synaptizine"
	description = "Treats hallucinations, paralysis and purges Mindbreaker Toxin off the bloodstream. Functions as a stimulant, counteracting stuns and acting as a mild painkiller. Moderately toxic. Recommended dosage at under 5 units and paired with Dylovene. Metabolizes very slowly. Overdose does nothing."
	taste_description = "bitterness"
	reagent_state = LIQUID
	color = "#99CCFF"
	metabolism = REM * 0.1 //This was taking A LOT to metabolize. By its effects, it shouldn't be.
	overdose = 5
	scannable = TRUE
	nerve_system_accumulations = 50
	liver_dependent = FALSE // Neural stimulant that works directly on nervous system

/datum/reagent/medicine/synaptizine/affect_blood(mob/living/carbon/M, alien, effect_multiplier)
	M.drowsyness = max(M.drowsyness - 5, 0)
	M.AdjustParalysis(-1)
	M.AdjustStunned(-1)
	M.AdjustWeakened(-1)
	holder.remove_reagent("mindbreaker", 5)
	M.adjust_hallucination(-10)
	M.add_chemical_effect(CE_MIND, 2)
	M.add_chemical_effect(CE_TOXIN, 2.5 * effect_multiplier) // It used to be incredibly deadly due to an oversight. Not anymore!
	M.add_chemical_effect(CE_PAINKILLER, 40, TRUE)

/datum/reagent/medicine/alkysine
	name = "Alkysine"
	id = "alkysine"
	description = "Alkysine is a drug used to repair the damage to neurological tissue after a catastrophic injury. Can heal brain tissue."
	taste_description = "bitterness"
	reagent_state = LIQUID
	color = "#FFFF66"
	metabolism = REM * 0.25
	overdose = REAGENTS_OVERDOSE
	scannable = TRUE
	nerve_system_accumulations = -15

/datum/reagent/medicine/alkysine/affect_blood(mob/living/carbon/M, alien, effect_multiplier)
	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		var/obj/item/organ/internal/vital/brain/B = H.internal_organs_by_efficiency[BP_BRAIN]
		if(!BP_IS_ROBOTIC(B) && prob(75))
			M.add_chemical_effect(CE_PAINKILLER, 10)
			M.add_chemical_effect(CE_BRAINHEAL, 1)
			// Direct brain damage healing - alkysine repairs neural tissue
			M.adjustBrainLoss(-1.5 * effect_multiplier) // Heals 1.5 brain damage per tick

/datum/reagent/medicine/imidazoline
	name = "Imidazoline"
	id = "imidazoline"
	description = "Treats damage to the eyes, removing blindness and/or blurring. Does not cure blindness from genetic mutations."
	taste_description = "dull toxin"
	reagent_state = LIQUID
	color = "#C8A5DC"
	overdose = REAGENTS_OVERDOSE
	scannable = TRUE
	nerve_system_accumulations = 10

/datum/reagent/medicine/imidazoline/affect_blood(mob/living/carbon/M, alien, effect_multiplier)
	M.eye_blurry = max(M.eye_blurry - (5 * effect_multiplier), 0)
	M.eye_blind = max(M.eye_blind - (5 * effect_multiplier), 0)
	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		var/obj/item/organ/internal/E = H.random_organ_by_process(OP_EYES)
		if(E && istype(E))
			var/list/current_wounds = E.GetComponents(/datum/component/internal_wound)
			if(LAZYLEN(current_wounds) && prob(75))
				M.add_chemical_effect(CE_EYEHEAL, 1)

/datum/reagent/medicine/imidazoline/overdose(mob/living/carbon/M, alien)
	. = ..()
	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		var/list/eye_organs = H.internal_organs_by_efficiency[OP_EYES]
		if(LAZYLEN(eye_organs))
			create_overdose_wound(pick(eye_organs), H, /datum/component/internal_wound/organic/heavy_poisoning)

/datum/reagent/medicine/peridaxon
	name = "Peridaxon"
	id = "peridaxon"
	description = "Treats damage to organs, healing them. Does not treat brain damage nor heal bones. Will not work for Cht'mant, use Fuhrerole instead."
	taste_description = "bitterness"
	reagent_state = LIQUID
	color = "#561EC3"
	overdose = 10
	scannable = TRUE
	nerve_system_accumulations = 30

/datum/reagent/medicine/peridaxon/affect_blood(mob/living/carbon/M, alien, effect_multiplier)
	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		var/list/organs_sans_brain_and_bones = H.internal_organs - H.internal_organs_by_efficiency[BP_BRAIN] - H.internal_organs_by_efficiency[OP_BONE] // Peridaxon shouldn't heal brain or bones
		for(var/obj/item/organ/I in organs_sans_brain_and_bones)
			var/list/current_wounds = I.GetComponents(/datum/component/internal_wound)
			if(LAZYLEN(current_wounds) && !BP_IS_ROBOTIC(I) && prob(75)) //Peridaxon heals only non-robotic organs
				M.add_chemical_effect(CE_ONCOCIDAL, 1)
				M.add_chemical_effect(CE_BLOODCLOT, 1)
				M.add_chemical_effect(CE_DEBRIDEMENT, 1)
				M.add_chemical_effect(CE_ANTITOX, 2)

/datum/reagent/medicine/peridaxon/overdose(mob/living/carbon/M, alien)
	. = ..()
	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		var/list/organs_sans_brain_and_bones = H.internal_organs - H.internal_organs_by_efficiency[BP_BRAIN] - H.internal_organs_by_efficiency[OP_BONE] // Since it doesn't heal brain/bones it shouldn't damage them too
		if(LAZYLEN(organs_sans_brain_and_bones))
			create_overdose_wound(pick(organs_sans_brain_and_bones), H, /datum/component/internal_wound/organic/heavy_poisoning)

/datum/reagent/medicine/trypsin
	name = "Trypsin"
	id = "trypsin"
	description = "A synthetic enzyme designed to assist the body in clearing burned and dead flesh from within. Highly painful a typical dose of five units will serve most uses."
	taste_description = "copper and faint burning"
	color = "#9c3a33"
	overdose = 10

/datum/reagent/medicine/trypsin/affect_blood(mob/living/carbon/M, alien, effect_multiplier)
	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		var/list/organs_sans_brain_and_bones = H.internal_organs - H.internal_organs_by_efficiency[BP_BRAIN] - H.internal_organs_by_efficiency[OP_BONE] // Peridaxon shouldn't heal brain or bones
		for(var/obj/item/organ/I in organs_sans_brain_and_bones)
			var/list/current_wounds = I.GetComponents(/datum/component/internal_wound)
			if(LAZYLEN(current_wounds) && !BP_IS_ROBOTIC(I) && prob(75)) //heals only non-robotic organs
				M.add_chemical_effect(CE_DEBRIDEMENT, dose*0.2) //5 units will provide enough CE_DEBRIDEMENT to actually
				M.apply_damage(dose*0.5, HALLOSS)


/datum/reagent/medicine/trypsin/overdose(mob/living/carbon/M, alien)
	. = ..()
	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		var/list/organs_sans_brain_and_bones = H.internal_organs - H.internal_organs_by_efficiency[BP_BRAIN] - H.internal_organs_by_efficiency[OP_BONE] // Since it doesn't heal brain/bones it shouldn't damage them too
		if(LAZYLEN(organs_sans_brain_and_bones))
			M.take_organ_damage(pick(0,5))
			M.add_chemical_effect(CE_DEBRIDEMENT, dose*0.1) //a dose of about 20 will give you enough CE_DEBRIDEMENT to clear "permanent" scars. You'll still need to clear the carbonized flesh by hand, however.

/datum/reagent/medicine/ctincture
	name = "Carpotoxin Tincture"
	id = "ctincture"
	description = "An ill advised tincture created from highly concentrated carpotoxin, poppy-seed and strong grain alcohol. Tastes about as good as it smells."
	taste_description = "gasoline and lakewater"
	color = "#0064C8"
	metabolism = REM * 1.25
	overdose = 6 //this is highly concentrated poison.
	scannable = 1

/datum/reagent/medicine/ctincture/affect_ingest(mob/living/carbon/M, alien, effect_multiplier)
	if(ishuman(M))
		M.stats.addTempStat(STAT_VIG, STAT_LEVEL_BASIC, STIM_TIME, "carpotoxin")
		M.add_chemical_effect(CE_TOXIN, dose)
		var/mob/living/carbon/human/H = M
		var/list/organs_sans_brain_and_bones = H.internal_organs - H.internal_organs_by_efficiency[BP_BRAIN] - H.internal_organs_by_efficiency[OP_BONE] // Peridaxon shouldn't heal brain or bones
		for(var/obj/item/organ/I in organs_sans_brain_and_bones)
			var/list/current_wounds = I.GetComponents(/datum/component/internal_wound)
			if(LAZYLEN(current_wounds) && !BP_IS_ROBOTIC(I) && prob(37)) //about half as effective as peridaxon
				LEGACY_SEND_SIGNAL(I, COMSIG_IORGAN_REMOVE_WOUND, pick(current_wounds))

/datum/reagent/medicine/ctincture/overdose(mob/living/carbon/M, alien)
	if(prob(80))
		M.adjustBrainLoss(4)
		M.add_chemical_effect(CE_TOXIN, dose*2)


/datum/reagent/medicine/ryetalyn
	name = "Ryetalyn"
	id = "ryetalyn"
	description = "Ryetalyn can cure all genetic abnormalities via a catalytic process. Just injecting one unit is enough to eliminate all mutations and disabilities permanently, including beneficial ones. Works on dead people, allowing them to unhusk them if they have died from excessive burns."
	taste_description = "acid"
	reagent_state = SOLID
	color = "#004000"
	metabolism = REM * 1.5
	overdose = REAGENTS_OVERDOSE
	scannable = TRUE // This is a mostly beneficial chem, it should show up on scanners
	affects_dead = TRUE
	nerve_system_accumulations = 0

/datum/reagent/medicine/ryetalyn/affect_blood(mob/living/carbon/M, alien, effect_multiplier)
	src.on_mob_add(M, alien, effect_multiplier) //I'm going with this to make it both affect dead people for unhusking, and to update on every life tick. Thanks Hydro!

/datum/reagent/medicine/ryetalyn/on_mob_add(mob/living/carbon/M, alien, effect_multiplier) //on_mob_add allows it to act regardless if the human is dead or alive.
	M.add_chemical_effect(CE_ONCOCIDAL, 2)
	/*
	var/needs_update = M.mutations.len > 0

	M.mutations = list()
	M.disabilities = 0
	M.sdisabilities = 0

	// Might need to update appearance for hulk etc.
	if(needs_update && ishuman(M))
		var/mob/living/carbon/human/H = M
		H.update_mutations()
		H.update_body() //Don't let husks stay wrinkly all the time, we gotta fix them!
	*/

/datum/reagent/medicine/negative_ling
	name = "Negative Paragenetic Marker"
	id = "negativeling"
	description = "A chemical that, when heated to 700K and combined in equal parts with a blood sample, will react to form Positive Paragenetic Marker if the blood comes from a Carrion."
	taste_description = "acid"
	reagent_state = SOLID
	color = "#022000"

/datum/reagent/medicine/positive_ling
	name = "Positive Paragenetic Marker"
	id = "positiveling"
	description = "The result of heating up Negative Paragenetic Marker in the prescence of Carrion blood. If you manage to obtain this, report the person to Marshals immediately (and discretely)."
	taste_description = "acid"
	reagent_state = SOLID
	color = "#910000"
	scannable = TRUE //Injecting a corpse with negative paragenic should return this chem for scanning it and pinpointing lings

/datum/reagent/medicine/ethylredoxrazine
	name = "Ethylredoxrazine"
	id = "ethylredoxrazine"
	description = "Purges alcohol from the stomach per unit ingested. Also treats confusion, dizziness, sleepiness, and stuttering to sober up drunkards."
	reagent_state = SOLID
	color = "#605048"
	overdose = REAGENTS_OVERDOSE
	nerve_system_accumulations = -15

/datum/reagent/medicine/ethylredoxrazine/affect_blood(var/mob/living/carbon/M, var/alien, var/effect_multiplier)
	M.dizziness = 0
	M.drowsyness = 0
	M.stuttering = 0
	M.confused = 0
	if(M.ingested)
		for(var/datum/reagent/R in M.ingested.reagent_list)
			if(istype(R, /datum/reagent/ethanol))
				R.dose = max(R.dose - effect_multiplier, 0)

/datum/reagent/medicine/hyronalin
	name = "Hyronalin"
	id = "hyronalin"
	description = "Hyronalin is a medicinal drug used to counter the effect of radiation poisoning."
	taste_description = "bitterness"
	reagent_state = LIQUID
	color = "#408000"
	metabolism = REM * 0.25
	overdose = REAGENTS_OVERDOSE
	scannable = TRUE
	nerve_system_accumulations = 15

/datum/reagent/medicine/hyronalin/affect_blood(mob/living/carbon/M, alien, effect_multiplier)
	M.radiation = max(M.radiation - (3 * effect_multiplier), 0)
	M.add_chemical_effect(CE_ONCOCIDAL, 1)

/datum/reagent/medicine/arithrazine
	name = "Arithrazine"
	id = "arithrazine"
	description = "Removes radiation from patient's body more quickly and efficiently than Hyronalin. Has a chance to cause minor brute damage to patient while processing. Treats toxin damage. Does not treat genetic damage. In most cases, should be administered with Dylovene."
	affects_dead = TRUE
	reagent_state = LIQUID
	color = "#008000"
	metabolism = REM * 0.25
	overdose = REAGENTS_OVERDOSE
	scannable = TRUE
	nerve_system_accumulations = 30

/datum/reagent/medicine/arithrazine/affect_blood(mob/living/carbon/M, alien, effect_multiplier)
	M.radiation = max(M.radiation - (7 + (M.radiation * 0.10)) * effect_multiplier, 0)
	M.add_chemical_effect(CE_TOXIN, -(1 + (M.chem_effects[CE_TOXIN] * 0.05)) * effect_multiplier)
	if(prob(60))
		M.take_organ_damage(0.4 * effect_multiplier, 0)

/datum/reagent/medicine/spaceacillin
	name = "Spaceacillin"
	id = "spaceacillin"
	description = "An all-purpose antiviral agent."
	taste_description = "bitterness"
	reagent_state = LIQUID
	color = "#C1C1C1"
	metabolism = REM * 0.05 //Infections are already a pain in the neck to treat, this should ease having to re-dose every time above the 5u threshold.
	overdose = REAGENTS_OVERDOSE
	scannable = TRUE
	affects_dead = TRUE //mostly so folks can deal with corpses caused by massive infection.
	nerve_system_accumulations = -5

/datum/reagent/medicine/spaceacillin/affect_blood(var/mob/living/carbon/M, var/alien, var/effect_multiplier)
	M.add_chemical_effect(CE_ANTIBIOTIC, 5)
	M.add_chemical_effect(CE_ANTITOX, 1)

/datum/reagent/medicine/sterilizine
	name = "Sterilizine"
	id = "sterilizine"
	description = "Kills germs and cleans up bloodstains more effectively than space cleaner. Useful in surgery to prevent or reduce infection levels, specially when treating septic infections"
	taste_description = "bitterness"
	reagent_state = LIQUID
	color = "#C8A5DC"
	touch_met = 5
	nerve_system_accumulations = 0

/datum/reagent/medicine/sterilizine/touch_obj(var/obj/O)
	// Use the object's clean_blood so it clears forensic markers
	O.clean_blood()
	return TRUE

/datum/reagent/medicine/sterilizine/touch_turf(var/turf/T)
	// Use the turf's clean_blood to clear forensic markers on the turf
	T.clean_blood()
	return TRUE

/datum/reagent/medicine/leporazine
	name = "Leporazine"
	id = "leporazine"
	description = "Leporazine can be used to stabilize an individual's body temperature."
	taste_description = "bitterness"
	reagent_state = LIQUID
	color = "#C8A5DC"
	overdose = REAGENTS_OVERDOSE
	scannable = TRUE
	nerve_system_accumulations = 0

/datum/reagent/medicine/leporazine/affect_blood(mob/living/carbon/M, alien, effect_multiplier)
	if(M.bodytemperature > 310)
		M.bodytemperature = max(310, M.bodytemperature - (40 * TEMPERATURE_DAMAGE_COEFFICIENT) * effect_multiplier)
	else if(M.bodytemperature < 311)
		M.bodytemperature = min(310, M.bodytemperature + (40 * TEMPERATURE_DAMAGE_COEFFICIENT) * effect_multiplier)

/* Antidepressants */

#define ANTIDEPRESSANT_MESSAGE_DELAY 5*60*10

/datum/reagent/medicine/methylphenidate
	name = "Methylphenidate"
	id = "methylphenidate"
	description = "Aids with concentration and focus. General anti-anxiety medicine for ADHD and other mental ailments. Some studies hint towards a placebo effect instead of a pharmaceutical one."
	taste_description = "sourness"
	reagent_state = LIQUID
	color = "#BF80BF"
	metabolism = 0.01
	data = 0
	nerve_system_accumulations = -20

/datum/reagent/medicine/methylphenidate/affect_blood(mob/living/carbon/M, alien, effect_multiplier)
	if(volume <= 0.1 && data != -1)
		data = -1
		to_chat(M, SPAN_WARNING("You lose focus..."))
	else
		if(world.time > data + ANTIDEPRESSANT_MESSAGE_DELAY)
			data = world.time
			to_chat(M, SPAN_NOTICE("Your mind feels focused and undivided."))

/datum/reagent/medicine/citalopram
	name = "Citalopram"
	id = "citalopram"
	description = "Mild antidepressant. Helps stabilize the mind. Some studies hint towards a placebo effect instead of a pharmaceutical one."
	taste_description = "bitterness"
	sanity_gain = 2
	reagent_state = LIQUID
	color = "#FF80FF"
	metabolism = 0.01
	data = 0
	nerve_system_accumulations = -30

/datum/reagent/medicine/citalopram/affect_blood(mob/living/carbon/M, alien, effect_multiplier)
	if(volume <= 0.1 && data != -1)
		data = -1
		to_chat(M, SPAN_WARNING("Your mind feels a little less stable..."))
	else
		M.add_chemical_effect(CE_MIND, 1)
		M.add_chemical_effect(CE_SLOWDOWN, 0.3)
		M.stats.addTempStat(STAT_ROB, -STAT_LEVEL_ADEPT * effect_multiplier, STIM_TIME, "citalopram")
		M.stats.addTempStat(STAT_TGH, -STAT_LEVEL_ADEPT * effect_multiplier, STIM_TIME, "citalopram")
		if(world.time > data + ANTIDEPRESSANT_MESSAGE_DELAY)
			data = world.time
			to_chat(M, SPAN_NOTICE("Your mind feels stable... a little stable."))

/datum/reagent/medicine/citalopram/affect_ingest(mob/living/carbon/M, alien, effect_multiplier)
	if(volume <= 0.1 && data != -1)
		data = -1
		to_chat(M, SPAN_WARNING("Your mind feels a little less stable..."))
	else
		M.add_chemical_effect(CE_MIND, 1)
		M.add_chemical_effect(CE_SLOWDOWN, 0.6)
		M.stats.addTempStat(STAT_ROB, -STAT_LEVEL_BASIC * effect_multiplier, STIM_TIME, "citalopram")
		M.stats.addTempStat(STAT_TGH, -STAT_LEVEL_BASIC * effect_multiplier, STIM_TIME, "citalopram")

		if(world.time > data + ANTIDEPRESSANT_MESSAGE_DELAY)
			data = world.time
			to_chat(M, SPAN_NOTICE("Your mind feels stable... a little stable."))

/datum/reagent/medicine/paroxetine
	name = "Paroxetine"
	id = "paroxetine"
	description = "Stabilizes the mind greatly, but has a chance of adverse effects."
	reagent_state = LIQUID
	color = "#FF80BF"
	metabolism = 0.01
	data = 0
	nerve_system_accumulations = -60

/datum/reagent/medicine/paroxetine/affect_blood(mob/living/carbon/M, alien, effect_multiplier)
	if(volume <= 0.1 && data != -1)
		data = -1
		to_chat(M, SPAN_WARNING("Your mind feels much less stable..."))
	else
		M.add_chemical_effect(CE_MIND, 2)
		if(world.time > data + ANTIDEPRESSANT_MESSAGE_DELAY)
			data = world.time
			if(prob(90))
				to_chat(M, SPAN_NOTICE("Your mind feels much more stable."))
			else
				to_chat(M, SPAN_WARNING("Your mind breaks apart..."))
				M.hallucination(200, 100)

/datum/reagent/medicine/rezadone
	name = "Rezadone"
	id = "rezadone"
	description = "A powder with almost magical properties, this substance can effectively treat genetic damage in humanoids, though excessive consumption (higher than 3 units) has side effects like facial disfigurement."
	taste_description = "sickness"
	reagent_state = SOLID
	color = "#669900"
	overdose = REAGENTS_OVERDOSE * 0.4 // Should OD at 12 units, you still shouldn't ever use more than 2u at a time anyways. - Seb
	scannable = TRUE
	nerve_system_accumulations = 40

/datum/reagent/medicine/rezadone/affect_blood(mob/living/carbon/M, alien, effect_multiplier)
	M.adjustOxyLoss(-0.2 * effect_multiplier)
	M.heal_organ_damage(2 * effect_multiplier, 2 * effect_multiplier, 5 * effect_multiplier, 5 * effect_multiplier)
	M.add_chemical_effect(CE_TOXIN, -(2 + (M.chem_effects[CE_TOXIN] * 0.05)) * effect_multiplier)
	M.add_chemical_effect(CE_ONCOCIDAL, 2)
	if(dose > 3)
		M.status_flags &= ~ORGAN_DISFIGURED
	if(dose > 10)
		M.make_dizzy(5)
		M.make_jittery(5)

/datum/reagent/medicine/rezadone/overdose(var/mob/living/carbon/M, var/alien)
	M.adjustCloneLoss(4)

/datum/reagent/medicine/quickclot
	name = "Quickclot"
	id = "quickclot"
	description = "Temporarily halts any internal and external bleeding. Also helps heal and repair blood vessels"
	taste_description = "metal"
	reagent_state = LIQUID
	color = "#a6b85b"
	overdose = REAGENTS_OVERDOSE / 6
	metabolism = REM / 2
	scannable = TRUE
	nerve_system_accumulations = -5

/datum/reagent/medicine/quickclot/affect_blood(mob/living/carbon/M, alien, effect_multiplier, var/removed = REM)
	M.add_chemical_effect(CE_BLOODCLOT, 0.25)

/datum/reagent/medicine/quickclot/overdose(mob/living/carbon/M, alien, effect_multiplier)
	M.add_chemical_effect(CE_BLOODCLOT, 0.75)

/datum/reagent/medicine/ossisine
	name = "Ossisine"
	id = "ossisine"
	description = "Puts the user in a great amount of pain and repairs broken bones. Medicate in critical conditions only. It does not set bones in place. Overdosing causes fatal cellular damage."
	taste_description = "calcium"
	reagent_state = LIQUID
	color = "#660679"
	overdose = 12	// 15u will treat 2 fractures
	metabolism = REM * 1.5 // Hard stun, impractical use for the situations it's used, and healing per removed unit, this was needed.
	scannable = TRUE
	nerve_system_accumulations = 45

/datum/reagent/medicine/ossisine/affect_blood(mob/living/carbon/M, alien, effect_multiplier, var/removed = REM)
	M.apply_damage(20, HALLOSS)
	M.add_chemical_effect(CE_BLOODCLOT, 0.1)
	M.add_chemical_effect(CE_BONE_MEND, 0.5)


/datum/reagent/medicine/ossisine/overdose(mob/living/carbon/M, alien)
	M.adjustCloneLoss(5)
	M.add_chemical_effect(CE_BONE_MEND, 1)

	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		//if(dose >= overdose) //Less gaming, do surgery you lazy butt. // Love you too Seb <3
		var/list/brokenBP = list()
		for(var/obj/item/organ/external/E in H.organs)
			if(E.is_broken())
				brokenBP += E
		if(brokenBP.len)
			var/obj/item/organ/external/E = pick(brokenBP)
			E.mend_fracture()
			M.pain(E.name, 60, TRUE)
			dose = 0

/datum/reagent/medicine/noexcutite
	name = "Noexcutite"
	id = "noexcutite"
	description = "Stops convulsions and jittering. If overdosed, will cause paralysis."
	taste_description = "numbing coldness"
	reagent_state = LIQUID
	color = "#bc018a"
	overdose = REAGENTS_OVERDOSE
	scannable = TRUE
	nerve_system_accumulations = -50

/datum/reagent/medicine/noexcutite/affect_blood(mob/living/carbon/M, alien, effect_multiplier)
	M.make_jittery(-50)

/datum/reagent/medicine/noexcutite/overdose(mob/living/carbon/M, alien)
	M.paralysis = max(M.paralysis, 5)

/datum/reagent/medicine/kyphotorin
	name = "Kyphotorin"
	id = "kyphotorin"
	description = "A strange chemical that allows a patient to regrow organic limbs. Requires the use of cryogenics (below 170K) and is slow-acting. The process is extremely painful and may damage the body if dosed incorrectly. Use five units at a time inside a beaker, and wait until the brute damage gets healed before ejecting the patient from the pod to check status of limbs by examining them. Overdose is extremely lethal, causing fatal cellular damage. Works on the dead as well, it will regrow even their heads, but for some reason they won't have eyes."
	taste_description = "metal"
	reagent_state = LIQUID
	color = "#7d88e6"
	overdose = REAGENTS_OVERDOSE * 0.66
	scannable = TRUE
	affects_dead = TRUE

/datum/reagent/medicine/kyphotorin/affect_blood(var/mob/living/carbon/M, var/alien, var/effect_multiplier)
	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		if(prob(0.5 * effect_multiplier + dose) || dose >= overdose)
			var/list/missingLimbs = list()
			for(var/name in BP_ALL_LIMBS)
				if(!H.has_appendage(name))
					missingLimbs += name
			if(missingLimbs.len)
				var/luckyLimbName = pick(missingLimbs)
				H.restore_organ(luckyLimbName)
				M.pain(luckyLimbName, 100, TRUE)
				dose = 0
	if(prob(10))
		M.take_organ_damage(pick(0,15))

/datum/reagent/medicine/kyphotorin/overdose(mob/living/carbon/M, alien)
	M.adjustCloneLoss(4)

/datum/reagent/medicine/slimeregen
	name = "mitosis hyperstim"
	id = "mstim"
	description = "A novel protein structure used within the bodies of Aulvae to stimulate mitosis to replace large amounts of lost cells in a short time frame. These proteins are theorized to be highly lethal to most organics if ingested or injected."
	taste_description = "prions"
	overdose = 9 //Regenerate limbs automatically if we reach the end of the dose given by the chem without actually rolling well.
	metabolism = REM * 0.5
	scannable = FALSE

/datum/reagent/medicine/slimeregen/affect_blood(var/mob/living/carbon/M, var/alien, var/effect_multiplier)
	if(M.species?.reagent_tag == IS_SLIME)
		var/mob/living/carbon/human/H = M
		if(prob(0.5 * effect_multiplier) || dose >= overdose)
			var/list/missingLimbs = list()
			for(var/name in BP_ALL_LIMBS)
				if(!H.has_appendage(name))
					missingLimbs += name
			if(missingLimbs.len)
				var/luckyLimbName = pick(missingLimbs)
				H.restore_organ(luckyLimbName)
				M.pain(luckyLimbName, 100, TRUE)
				dose = 0
		M.heal_organ_damage(0.5 * effect_multiplier, 0, 5 * effect_multiplier) //pretty strong, but the cost is high and they can only use this twice an hour.
		M.add_chemical_effect(CE_SLOWDOWN, 2)
		M.eye_blurry = max(M.eye_blurry, 10)
		if(prob(10))
			M.Weaken(2)
			M.custom_emote(1,"'s form momentarily loses cohesion as they fall to the ground!")
	else
		var/wound_chance = 100 - (79 * (1 - M.stats.getMult(STAT_TGH)))
		if(ishuman(M))
			if(prob(wound_chance))
				var/mob/living/carbon/human/H = M
				var/obj/item/organ/internal/liver/L = H.random_organ_by_process(BP_BRAIN)
				create_overdose_wound(L, M, /datum/component/internal_wound/organic/permanent, "prion damage")

/datum/reagent/medicine/polystem
	name = "Polystem"
	id = "polystem"
	description = "Heals both brute and burn damage, albeit slowly. Minor blood clotting."
	taste_description = "bitterness"
	taste_mult = 3
	reagent_state = LIQUID
	color = "#ded890"
	scannable = TRUE
	metabolism = REM/2
	overdose = REAGENTS_OVERDOSE
	nerve_system_accumulations = 5

/datum/reagent/medicine/polystem/affect_blood(mob/living/carbon/M, alien, effect_multiplier)
	M.heal_organ_damage(0.3 * effect_multiplier, 0, 3 * effect_multiplier)
	M.add_chemical_effect(CE_BLOODCLOT, min(1,0.1 * effect_multiplier))

/datum/reagent/medicine/polystem/overdose(mob/living/carbon/M, alien)
	M.add_chemical_effect(CE_BLOODCLOT, 0.1)

/datum/reagent/medicine/detox
	name = "Detox"
	id = "detox"
	description = "Boosts neural regeneration, bolstering the nervous system against large doses of chemicals without permanent damage."
	taste_description = "bitterness"
	reagent_state = LIQUID
	color = "#229e08"
	overdose = REAGENTS_OVERDOSE
	scannable = TRUE
	metabolism = REM/2
	nerve_system_accumulations = -100

/datum/reagent/medicine/detox/affect_blood(mob/living/carbon/M, alien, effect_multiplier)
	if(!M.metabolism_effects.nsa_chem_bonus)
		M.metabolism_effects.nsa_chem_bonus += rand(20, 60)
		M.metabolism_effects.calculate_nsa()

/datum/reagent/medicine/detox/on_mob_delete(mob/living/L)
	..()
	var/mob/living/carbon/C = L
	if(istype(C))
		C.metabolism_effects.nsa_threshold = initial(C.metabolism_effects.nsa_chem_bonus)
		C.metabolism_effects.calculate_nsa()

/datum/reagent/medicine/detox/overdose(mob/living/carbon/M, alien)
	var/mob/living/carbon/C = M
	if(istype(C))
		C.metabolism_effects.nsa_chem_bonus = -rand(20, 40)
		M.metabolism_effects.calculate_nsa()

/datum/reagent/medicine/purger
	name = "Purger"
	id = "purger"
	description = "Temporarily suppresses the craving effects of addictions, allowing the patient to recover from addictions easier. Also slightly heals both Kidneys inside the body. Does not remove the effects of withdrawal."
	taste_description = "bitterness"
	reagent_state = LIQUID
	color = "#d4cf3b"
	scannable = TRUE
	metabolism = REM / 2
	overdose = REAGENTS_OVERDOSE / 3
	nerve_system_accumulations = -25

/datum/reagent/medicine/purger/affect_blood(mob/living/carbon/M, alien, effect_multiplier, var/removed = REM)
	M.add_chemical_effect(CE_PURGER, 1)

/datum/reagent/medicine/purger/overdose(mob/living/carbon/M, alien)
	. = ..()
	M.add_chemical_effect(CE_PURGER, 3)

/datum/reagent/medicine/addictol
	name = "Addictol"
	id = "addictol"
	description = "Purges all addictions and greatly aids in treating chemical poisoning. After administering a dose greater than 10 units (As in when the drug is fully processed by the body), will permanently treat the patient's addictions, until they get addicted again."
	taste_description = "bitterness"
	reagent_state = LIQUID
	color = "#0179e7"
	scannable = TRUE
	metabolism = REM/2
	nerve_system_accumulations = -35

/datum/reagent/medicine/addictol/affect_blood(var/mob/living/carbon/M, var/alien, var/effect_multiplier)
	var/mob/living/carbon/C = M
	if(istype(C) && C.metabolism_effects.addiction_list.len)
		if(prob(5 * effect_multiplier + dose))
			var/datum/reagent/R = pick(C.metabolism_effects.addiction_list)
			to_chat(C, SPAN_NOTICE("You dont crave [R.name] anymore."))
			C.metabolism_effects.addiction_list.Remove(R)
			qdel(R)
	M.add_chemical_effect(CE_PURGER, 2)

/datum/reagent/medicine/addictol/on_mob_delete(mob/living/L)
	..()
	var/mob/living/carbon/C = L
	if(dose >= 10)
		if(istype(C))
			C.remove_all_addictions()

/datum/reagent/medicine/aminazine
	name = "Aminazine"
	id = "aminazine"
	description = "Medication designed to suppress withdrawal effects for some time. Does not eliminate the cravings."
	taste_description = "bitterness"
	reagent_state = LIQUID
	color = "#88336f"
	overdose = REAGENTS_OVERDOSE
	scannable = TRUE
	metabolism = REM/2
	nerve_system_accumulations = -15

/datum/reagent/medicine/aminazine/affect_blood(mob/living/carbon/M, alien, effect_multiplier)
	M.add_chemical_effect(CE_NOWITHDRAW, 1)

/datum/reagent/medicine/haloperidol
	name = "Haloperidol"
	id = "haloperidol"
	description = "Purges all forms of toxins, stimulants and other reagents from the bloodstream, and sedates the patient. An overdose of Haloperidol can be fatal."
	taste_description = "bitterness"
	reagent_state = LIQUID
	color = "#ba1f04"
	overdose = REAGENTS_OVERDOSE/2
	scannable = TRUE
	metabolism = REM/2
	nerve_system_accumulations = -50

/datum/reagent/medicine/haloperidol/affect_blood(mob/living/carbon/M, alien, effect_multiplier)
	if(M.bloodstr)
		for(var/current in M.bloodstr.reagent_list)
			var/datum/reagent/toxin/R = current
			if(!istype(R, src))
				R.remove_self(effect_multiplier * pick(list(2,4,6)))
			var/datum/reagent/stim/S = current
			if(!istype(S, src))
				S.remove_self(effect_multiplier * pick(list(2,4,6)))
	var/effective_dose = dose
	if(issmall(M))
		effective_dose *= 2

	if(effective_dose < 1)
		if(effective_dose == metabolism * 2 || prob(5))
			M.emote("yawn")
	else if(effective_dose < 1.5)
		M.eye_blurry = max(M.eye_blurry, 10)
	else if(effective_dose < 3)
		if(prob(50))
			M.Weaken(2)
		M.drowsyness = max(M.drowsyness, 20)
	else
		M.sleeping = max(M.sleeping, 20)
		M.drowsyness = max(M.drowsyness, 60)
	M.add_chemical_effect(CE_PULSE, -1)

/datum/reagent/medicine/haloperidol/overdose(mob/living/carbon/M, alien)
	M.add_chemical_effect(CE_TOXIN, 6)

/*
/datum/reagent/medicine/vomitol //Why is the same chem defined on two different files?
	name = "Vomitol"
	id = "vomitol"
	description = "Forces patient to vomit - results in total cleaning of his stomach. Has extremely unpleasant taste."
	taste_description = "worst thing in the world"
	reagent_state = LIQUID
	color = "#a6b85b"
	overdose = REAGENTS_OVERDOSE
	scannable = TRUE

/datum/reagent/medicine/vomitol/affect_blood(mob/living/carbon/M, alien, effect_multiplier)
	if(prob(10 * effect_multiplier))
		M.vomit()
*/

/datum/reagent/medicine/sterilizer
	name = "sterilizer"
	id = "sterilizer"
	description = "Sterilizing solution used in making medical supplies. Don't.. drink it."
	taste_description = "soap"
	reagent_state = LIQUID
	color = "#00FFFF"
	scannable = TRUE

/datum/reagent/medicine/sterilizer/affect_blood(mob/living/carbon/M, alien, effect_multiplier)
	if(prob(10 * effect_multiplier))
		M.vomit()

/datum/reagent/medicine/suppressital
	name = "Suppressital"
	id = "suppressital"
	description = "Medication designed to make breakdowns less likely to happen. Also is a robust nerve relaxant."
	taste_description = "bitterness"
	reagent_state = LIQUID
	color = "#001aff"
	overdose = REAGENTS_OVERDOSE
	nerve_system_accumulations = -50

/datum/reagent/medicine/suppressital/affect_ingest/(mob/living/carbon/M)
	if(!M.stats.getPerk(PERK_NJOY))
		M.stats.addPerk(PERK_NJOY)

/datum/reagent/medicine/suppressital/on_mob_delete(mob/living/M)
	..()
	M.stats.removePerk(PERK_NJOY)

/datum/reagent/medicine/fun_gas
	name = "N2O"
	id = "sagent"
	description = "An effective sedative used during surgery to keep patients asleep."
	taste_description = "bitterness"
	reagent_state = GAS
	color = "#D3D3D3"
	metabolism = REM * 10
	overdose = REAGENTS_OVERDOSE / 3 // Even 10 is a lot of this
	scannable = TRUE
	nerve_system_accumulations = -10 //Sedative

/datum/reagent/medicine/fun_gas/affect_blood(mob/living/carbon/M, alien, effect_multiplier)
	var/effective_dose = dose / 2
	dose *= 0.75 // Reduce the dose to prevent buildup from little N2O
	if(M.species?.reagent_tag == IS_SLIME)
		return
	if(issmall(M))
		effective_dose *= 2
	if(effective_dose < 1)
		if(effective_dose == metabolism * 2 || prob(10))
			M.emote("giggle")
	else if(effective_dose < 1.5)
		M.eye_blurry = max(M.eye_blurry, 10)
		if(prob(20))
			M.emote(pick("giggle", "laugh"))
	else if(effective_dose < 5)
		if(prob(50))
			M.Weaken(2)
		if(prob(30))
			M.emote("giggle")
		M.drowsyness = max(M.drowsyness, 20)
	else
		M.sleeping = max(M.sleeping, 20)
		M.drowsyness = max(M.drowsyness, 60)
	M.add_chemical_effect(CE_PULSE, -1)

// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// Meds made from animals. Unga.
// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

/datum/reagent/medicine/tangu_extract
	name = "Tangu Extract"
	id = "tangu_extract"
	description = "The extracted juices from a tangu horn, a powerful multi-purpose healing chemical derived from bone marrow and tangu blood."
	taste_description = "vitamins"
	reagent_state = LIQUID
	color = "#BF0000"
	scannable = TRUE
	overdose = REAGENTS_OVERDOSE
	nerve_system_accumulations = 0

/datum/reagent/medicine/tangu_extract/affect_ingest(mob/living/carbon/M, alien, effect_multiplier)
	M.adjustOxyLoss(-1.2 * effect_multiplier)
	M.heal_organ_damage(0.6 * effect_multiplier, 0.6 * effect_multiplier)
	M.add_chemical_effect(CE_TOXIN, -0.6 * effect_multiplier)
	M.add_chemical_effect(CE_BLOODCLOT, 0.2)
	M.adjustHalLoss(-1)

/datum/reagent/medicine/tangu_extract/overdose(var/mob/living/carbon/M, var/alien)
	. = ..()
	M.add_chemical_effect(CE_TOXIN, 5)
	M.adjustBrainLoss(1)
	if(M.losebreath < 15)
		M.losebreath++

/datum/reagent/medicine/clucker_extract
	name = "Clucker Extract"
	id = "clucker_extract"
	description = "A weak painkiller derived from the juices found in compressed clucker feathers."
	taste_description = "sickness"
	reagent_state = LIQUID
	color = "#C8A5DC"
	overdose = 60
	scannable = TRUE
	metabolism = 0.02
	nerve_system_accumulations = 0

/datum/reagent/medicine/clucker_extract/affect_ingest(mob/living/carbon/M, alien, effect_multiplier)
	M.add_chemical_effect(CE_PAINKILLER, 130, TRUE)
	M.adjustHalLoss(-3)

/datum/reagent/medicine/clucker_extract/overdose(mob/living/carbon/M, alien)
	..()
	M.druggy = max(M.druggy, 2)

/datum/reagent/medicine/spaceacillin/tahcacillin
	name = "Tahcacillin"
	id = "tahcacillin"
	description = "An all-purpose antiviral agent derived from tahca horns crushed into a blood mixed extract."
	constant_metabolism = TRUE
	nerve_system_accumulations = 0

//Tisanes. these chems are found in special teas made via the kitchen, giving more healing at a slower rate than just eating the plant itself
/datum/reagent/medicine/poppy_tea
	name = "poppy tisane"
	id = "p_tea"
	description = "A spiced herbal tea of poppy. Not entirely pleasant tasting, but it does a decent job of delivering the healing elements of poppys more effectively"
	taste_description = "bitter spiced tea"
	appear_in_default_catalog = TRUE
	taste_mult = 3
	reagent_state = LIQUID
	color = "#BF0000"
	overdose = REAGENTS_OVERDOSE * 0.50
	scannable = FALSE
	appear_in_default_catalog = FALSE
	metabolism = REM
	nerve_system_accumulations = 22 // we're about 50% more effective

/datum/reagent/medicine/ptisane/affect_ingest(mob/living/carbon/M, alien, effect_multiplier) //it's tea, not medicine.
	if(M.species?.reagent_tag == IS_CHTMANT)
		M.heal_organ_damage(0.22 * effect_multiplier, 0, 5 * effect_multiplier)
		return
	M.heal_organ_damage(0.6 * effect_multiplier, 0, 5 * effect_multiplier)
	M.add_chemical_effect(CE_BLOODCLOT, 0.15)

/datum/reagent/medicine/ptisane/overdose(mob/living/carbon/M, alien)
	M.add_chemical_effect(CE_TOXIN, dose / 4)
	to_chat(M, SPAN_WARNING("Your stomach groans and aches, you feel as though you might vomit"))
	if(prob(10 * dose))
		M.vomit()

/datum/reagent/medicine/tear_tea
	name = "sun tear tisane"
	id = "st_tea"
	description = "A spiced herbal tea of sun tears. Not entirely pleasant tasting, but it does a decent job of delivering the healing elements more effectively"
	taste_description = "sour spiced tea"
	reagent_state = LIQUID
	color = "#FFA800"
	overdose = REAGENTS_OVERDOSE * 0.75
	scannable = FALSE
	appear_in_default_catalog = FALSE
	metabolism = REM
	nerve_system_accumulations = 15

/datum/reagent/medicine/tear_tea/affect_ingest(mob/living/carbon/M, alien, effect_multiplier)
	if(M.species?.reagent_tag == IS_CHTMANT)
		return
	M.heal_organ_damage(0, 1.2 * effect_multiplier, 0, 3 * effect_multiplier)

/datum/reagent/medicine/tear_tea/overdose(mob/living/carbon/M, alien)
	M.add_chemical_effect(CE_TOXIN, dose / 4)
	to_chat(M, SPAN_WARNING("Your stomach groans and aches, you feel as though you might vomit"))
	if(prob(10 * dose))
		M.vomit()

/datum/reagent/medicine/hand_tea
	name = "Mercys hand tisane"
	id = "mh_tea"
	description = "A spiced herbal tea of mercys hand. Not entirely pleasant tasting, but it does a decent job of delivering the healing elements more effectively"
	taste_description = "acetic spiced tea"
	reagent_state = LIQUID
	color = "#00A000"
	scannable = FALSE
	appear_in_default_catalog = FALSE
	metabolism = REM
	overdose = REAGENTS_OVERDOSE * 0.50
	nerve_system_accumulations = 0

/datum/reagent/medicine/hand_tea/affect_ingest(mob/living/carbon/M, alien, effect_multiplier)
	M.drowsyness = max(0, M.drowsyness - 0.6 * effect_multiplier)
	M.adjust_hallucination(-0.9 * effect_multiplier)
	M.add_chemical_effect(CE_ANTITOX, 4)
	holder.remove_reagent("pararein", 0.8 * effect_multiplier)
	holder.remove_reagent("carpotoxin", 0.4 * effect_multiplier) // Fish recipes no longer contain carpotoxin, but good in cases of poisoning.
	holder.remove_reagent("toxin", 0.4 * effect_multiplier)
	holder.remove_reagent("blattedin", 0.4 * effect_multiplier) // Massive complains about its slow metabolization rate + poisoning actually working, plus dylo originally purged it, so I'm bringing it back. - Seb
	holder.remove_reagent("wasp_toxin", 0.2 * effect_multiplier)
	holder.remove_reagent("amatoxin", 0.2 * effect_multiplier) // We hate the shitbirds
	M.heal_organ_damage(0.15 * effect_multiplier, 0, 5 * effect_multiplier) //To encourage using poppy tea for brute, we're less good at that
	M.add_chemical_effect(CE_BLOODCLOT, 0.15)

/datum/reagent/medicine/hand_tea/overdose(mob/living/carbon/M, alien, effect_multiplier)
	to_chat(M, SPAN_WARNING("Your stomach groans and aches, you feel as though you might vomit"))
	M.add_chemical_effect(CE_TOXIN, dose / 4)
	if(prob(10 * dose))
		M.vomit()

/datum/reagent/medicine/vale_tea
	name = "Vale bush tisane"
	id = "vb_tea"
	description = "A spiced herbal tea of vale bush. Not entirely pleasant tasting, but it does a decent job of delivering the healing elements more effectively."
	taste_description = "potent spiced tea"
	reagent_state = LIQUID
	color = "#C8A5DC"
	overdose = 45
	scannable = FALSE
	appear_in_default_catalog = FALSE
	metabolism = REM
	nerve_system_accumulations = -10

/datum/reagent/medicine/vale_tea/affect_ingest(mob/living/carbon/M, alien, effect_multiplier)
	M.add_chemical_effect(CE_PAINKILLER, 40)
	M.adjustOxyLoss(-2.5 * effect_multiplier)
	holder.remove_reagent("lexorin", 0.2 * effect_multiplier)
	var/ce_to_add = 1 - M.chem_effects[CE_OXYGENATED]
	if(ce_to_add > 0)
		M.add_chemical_effect(CE_OXYGENATED, ce_to_add)

/datum/reagent/medicine/vale_tea/overdose(mob/living/carbon/M, alien)
	..()
	M.druggy = max(M.druggy, 2)
	M.add_chemical_effect(CE_TOXIN, dose / 4)
	to_chat(M, SPAN_WARNING("Your stomach groans and aches, you feel as though you might vomit"))
	if(prob(10 * dose))
		M.vomit()

/datum/reagent/medicine/plump_tea //lmao
	name = "Plump helmet tisane"
	id = "ph_tea"
	description = "A spiced herbal tea of plump helmets. Entirely unpleasant tasting, but it does a decent job of delivering the healing elements more effectively."
	taste_description = "bitter spiced mushrooms"
	reagent_state = LIQUID
	color = "#C1C1C1"
	metabolism = REM * 0.05
	overdose = REAGENTS_OVERDOSE * 0.50
	scannable = FALSE
	appear_in_default_catalog = FALSE
	metabolism = REM
	nerve_system_accumulations = -5

/datum/reagent/medicine/plump_tea/affect_ingest(var/mob/living/carbon/M, var/alien, var/effect_multiplier) //uniquely, this means that there's now a way  to ingest your antibiotic
	M.add_chemical_effect(CE_ANTIBIOTIC, 7)
	M.add_chemical_effect(CE_ANTITOX, 2)

/datum/reagent/medicine/plump_tea/overdose(mob/living/carbon/M, alien)
	M.add_chemical_effect(CE_TOXIN, dose / 4)
	to_chat(M, SPAN_WARNING("Your stomach groans and aches, you feel as though you might vomit"))
	if(prob(10 * dose))
		M.vomit()

// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// Xenobotany reagents for hard to get plants
// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

//Exclusive to Panacea
/datum/reagent/medicine/ossisine/flora
	name = "Flossisine"
	id = "flossisine"
	description = "A bioengineered natural compound that aids the repairs of broken bones without the side effects of its synthetic version."
	taste_description = "minty calcium"
	color = "#298f59"
	nerve_system_accumulations = 25

/datum/reagent/medicine/ossisine/flora/affect_blood(mob/living/carbon/M, alien, effect_multiplier, var/removed = REM)
	M.add_chemical_effect(CE_BLOODCLOT, 0.1)
	M.add_chemical_effect(CE_BONE_MEND, 0.5)
