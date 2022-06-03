/datum/reagent/iron_skin_brew
	name = "Fe Na of NaCl"
	id = "iron_skin_brew"
	description = "A mix of metals and salts boiled into one another, said to be able to make people take more physical punishment, with the drawback of making your metallic coating more vulnerable to fire. It also makes breathing harder..."
	taste_description = "salt of metal"
	reagent_state = LIQUID
	color = "#660000"
	scannable = 0
	appear_in_default_catalog = FALSE
	metabolism = 0.001 //Takes a long time to remove
	overdose = 1

/datum/reagent/iron_skin_brew/overdose(mob/living/carbon/M, alien)
	M.adjustCloneLoss(1) //The body breaks apart

/datum/reagent/iron_skin_brew/affect_blood(mob/living/carbon/M, alien, effect_multiplier)
	M.adjustToxLoss(3) //Its metal...

/datum/reagent/iron_skin_brew/affect_ingest(mob/living/carbon/M, alien, effect_multiplier)
	return //We want to be drank

/datum/reagent/iron_skin_brew/on_mob_add(mob/living/L)
	. = ..()
	var/mob/living/carbon/human/ironskin = L
	if(!ishuman(L))
		return
	ironskin.mob_bomb_defense += 25
	ironskin.falls_mod -= 0.4
	ironskin.brute_mod_perk -= 0.2
	ironskin.burn_mod_perk += 0.4
	ironskin.oxy_mod_perk  += 3 //Iron casket

/datum/reagent/iron_skin_brew/on_mob_delete(mob/living/L)
	. = ..()
	var/mob/living/carbon/human/ironskin = L
	if(!ishuman(L))
		return
	ironskin.mob_bomb_defense -= 25
	ironskin.falls_mod += 0.4
	ironskin.Paralyse(3)
	ironskin.burn_mod_perk -= 0.4
	ironskin.brute_mod_perk += 0.2
	ironskin.oxy_mod_perk  -= 3

/datum/reagent/toxin_draft
	name = "Toxic Draft"
	id = "toxin_draft"
	description = " A horrible brew that is toxic to almost all beings."
	taste_description = "bitter demise"
	reagent_state = LIQUID
	color = "#660000"
	scannable = 0
	appear_in_default_catalog = FALSE
	metabolism = 0.1
	overdose = 1

/datum/reagent/toxin_draft/overdose(mob/living/carbon/M)
	M.adjustToxLoss(5)

/datum/reagent/toxin_draft/affect_blood(mob/living/carbon/M)
	M.adjustToxLoss(1)

/datum/reagent/toxin_draft/affect_ingest(mob/living/carbon/M)
	M.adjustToxLoss(3)

/datum/reagent/toxin_draft/on_mob_add(mob/living/L)
	. = ..()
	if(!ishuman(L))
		L.adjustToxLoss(180)
		L.adjustCloneLoss(120)
		return
	L.adjustToxLoss(20)
	L.adjustCloneLoss(10)

/datum/reagent/sight_dram
	name = "Ocular Remedy"
	id = "sight_dram"
	description = "A mix of common compounds to repair sight."
	taste_description = "charcoal"
	reagent_state = LIQUID
	color = "#660000"
	scannable = 0
	appear_in_default_catalog = FALSE
	metabolism = 0.1
	overdose = 1

/datum/reagent/sight_dram/overdose(mob/living/carbon/M)
	M.adjustToxLoss(5)

/datum/reagent/sight_dram/affect_blood(mob/living/carbon/M)
	M.adjustToxLoss(10) //DONT INJECT IT

/datum/reagent/sight_dram/affect_ingest(mob/living/carbon/M, alien, effect_multiplier)
	M.eye_blurry = max(M.eye_blurry - (5 * effect_multiplier), 0)
	M.eye_blind = max(M.eye_blind - (5 * effect_multiplier), 0)
	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		var/obj/item/organ/internal/eyes/E = H.random_organ_by_process(OP_EYES)
		if(E && istype(E))
			if(E.damage > 0)
				E.damage = max(E.damage - (5), 0)


/datum/reagent/lively_concoxion
	name = "Ichor of Health"
	id = "lively_concoxion"
	description = "A jellie of blood said to make whomever eats this to have a more perfected body. Untill it proccesses out."
	taste_description = "dry iron"
	reagent_state = LIQUID
	color = "#660000"
	scannable = 0
	appear_in_default_catalog = FALSE
	metabolism = 0.01 //We crash hard
	overdose = 1

/datum/reagent/lively_concoxion/overdose(mob/living/carbon/M)
	M.adjustCloneLoss(1)

/datum/reagent/lively_concoxion/affect_blood(mob/living/carbon/M)
	M.adjustToxLoss(3)

/datum/reagent/lively_concoxion/affect_ingest(mob/living/carbon/M, alien, effect_multiplier)
	return

/datum/reagent/lively_concoxion/on_mob_add(mob/living/M)
	. = ..()
	M.maxHealth += 50
	M.health += 50

/datum/reagent/lively_concoxion/on_mob_delete(mob/living/M)
	. = ..()
	M.maxHealth -= 50
	M.health -= 50
	M.adjustOxyLoss(60)
	M.Weaken(5)
	M.silent = max(M.silent, 5)

/datum/reagent/nervs
	name = "Nervs"
	id = "nervs"
	description = "A unique mix that makes the users' brain able to withstand more chemical accumulation in their system."
	taste_description = "shivers"
	reagent_state = LIQUID
	color = "#660000"
	scannable = 0
	appear_in_default_catalog = FALSE
	metabolism = 0.001
	overdose = 1

/datum/reagent/nervs/overdose(mob/living/carbon/M)
	M.adjustCloneLoss(1)

/datum/reagent/nervs/affect_blood(mob/living/carbon/M)
	M.adjustToxLoss(3)

/datum/reagent/nervs/affect_ingest(mob/living/carbon/M, alien, effect_multiplier)
	return

/datum/reagent/nervs/on_mob_add(mob/living/carbon/M)
	if(!M.metabolism_effects.nsa_chem_bonus)
		M.metabolism_effects.nsa_chem_bonus *= 2
		M.metabolism_effects.calculate_nsa()

/datum/reagent/nervs/on_mob_delete(mob/living/carbon/M)
	. = ..()
	var/mob/living/carbon/C = M
	if(istype(C))
		C.metabolism_effects.nsa_threshold = initial(C.metabolism_effects.nsa_chem_bonus)
		C.metabolism_effects.calculate_nsa()

/datum/reagent/harms
	name = "Painful Powerders"
	id = "harms"
	description = "A mix of solid sharp sands designed to cut down whoever they are thrown at." // POCKET SAND!
	taste_description = "bitter demise"
	reagent_state = SOLID //for sake of simple
	color = "#660000"
	scannable = 0
	appear_in_default_catalog = FALSE
	metabolism = 0.1
	overdose = 1

/datum/reagent/harms/overdose(mob/living/carbon/M)
	M.adjustToxLoss(5)

/datum/reagent/harms/affect_blood(mob/living/carbon/M)
	M.adjustToxLoss(1)

/datum/reagent/harms/affect_ingest(mob/living/carbon/M)
	M.adjustToxLoss(3)

/datum/reagent/harms/on_mob_add(mob/living/L)
	. = ..()
	if(!ishuman(L))
		L.damage_through_armor(230, BRUTE, attack_flag = ARMOR_BIO)
		return
	L.damage_through_armor(20, BRUTE, attack_flag = ARMOR_BIO)

/datum/reagent/burns
	name = "Burning Oils"
	id = "burns"
	description = "Heated oils with fibers of iron and salt. While it's cold inside the glass, contact with skin, chitin or any dermis tissue makes its temperature violently react..."
	taste_description = "liquid fire"
	reagent_state = LIQUID //for sake of simple
	color = "#660000"
	scannable = 0
	appear_in_default_catalog = FALSE
	metabolism = 0.1
	overdose = 1

/datum/reagent/burns/overdose(mob/living/carbon/M)
	M.adjustFireLoss(7)

/datum/reagent/burns/affect_blood(mob/living/carbon/M)
	M.adjustFireLoss(3)

/datum/reagent/burns/affect_ingest(mob/living/carbon/M)
	M.adjustFireLoss(5)

/datum/reagent/burns/on_mob_add(mob/living/L)
	. = ..()
	if(!ishuman(L))
		L.damage_through_armor(230, BURN, attack_flag = ARMOR_BIO)
		return
	L.damage_through_armor(20, BURN, attack_flag = ARMOR_BIO)
