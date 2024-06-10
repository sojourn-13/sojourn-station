/datum/reagent/iron_skin_brew
	name = "Ironskin draught"
	id = "iron_skin_brew"
	description = "A mix of metals and salts boiled into one another, said to be able to make people take more physical punishment, \
				   with the drawback of making your metallic coating more vulnerable to fire. It also makes breathing harder..."
	taste_description = "salt of metal"
	reagent_state = LIQUID
	color = "#4e3f3f"
	scannable = FALSE
	appear_in_default_catalog = FALSE
	metabolism = 0.001 //Takes a long time to remove
	overdose = 3

/datum/reagent/iron_skin_brew/overdose(mob/living/carbon/M, alien)
	M.adjustCloneLoss(1) //The body breaks apart

/datum/reagent/iron_skin_brew/affect_blood(mob/living/carbon/M, alien, effect_multiplier)
	M.add_chemical_effect(CE_TOXIN, 3)

/datum/reagent/iron_skin_brew/affect_ingest(mob/living/carbon/M, alien, effect_multiplier)
	return // The chemical is meant to be ingested, but unless we do this, we'll get poisoned

/datum/reagent/iron_skin_brew/on_mob_add(mob/living/L)
	. = ..()
	var/mob/living/carbon/human/ironskin = L
	if(!ishuman(L))
		if(ironskin.species.reagent_tag == IS_CHTMANT) // This turns skin into iron, Cht'mant get horribly tortured by it
			ironskin.add_chemical_effect(CE_TOXIN, 0.4)
			ironskin.paralysis = max(L.paralysis, 5)
			ironskin.adjustCloneLoss(2)
			return
	ironskin.mob_bomb_defense += 25
	ironskin.falls_mod -= 0.4
	ironskin.brute_mod_perk *= 0.65
	ironskin.burn_mod_perk *= 1.2
	ironskin.oxy_mod_perk  *= 3 //Iron casket

/datum/reagent/iron_skin_brew/on_mob_delete(mob/living/L)
	. = ..()
	var/mob/living/carbon/human/ironskin = L
	if(!ishuman(L))
		return
	ironskin.mob_bomb_defense -= 25
	ironskin.falls_mod += 0.4
	ironskin.Paralyse(3)
	ironskin.burn_mod_perk /= 1.2
	ironskin.brute_mod_perk /= 0.65
	ironskin.oxy_mod_perk  /= 3

/datum/reagent/toxin_draft
	name = "Noxious Sludge"
	id = "toxin_draft"
	description = " A nefarious concoction toxic to all living beings."
	taste_description = "bitter demise"
	reagent_state = LIQUID
	color = "#365f3f"
	scannable = FALSE
	appear_in_default_catalog = FALSE
	metabolism = 0.1
	overdose = 5

/datum/reagent/toxin_draft/overdose(mob/living/carbon/M)
	M.add_chemical_effect(CE_TOXIN, 5)

/datum/reagent/toxin_draft/affect_blood(mob/living/carbon/M)
	M.add_chemical_effect(CE_TOXIN, 1)

/datum/reagent/toxin_draft/affect_ingest(mob/living/carbon/M)
	M.add_chemical_effect(CE_TOXIN, 3)

/datum/reagent/toxin_draft/on_mob_add(mob/living/L)
	. = ..()
	if(!ishuman(L))
		L.adjustToxLoss(180)
		L.adjustCloneLoss(120)
		return
	L.adjustFireLoss(20)
	L.adjustCloneLoss(10)

/datum/reagent/toxin_draft/affect_touch(mob/living/L)
	on_mob_add(L)

/datum/reagent/sight_dram
	name = "Ocular Remedy"
	id = "sight_dram"
	description = "A mix of common compounds to repair sight."
	taste_description = "charcoal"
	reagent_state = LIQUID
	color = "#629ac0"
	scannable = FALSE
	appear_in_default_catalog = FALSE
	metabolism = 0.1
	overdose = 3

/datum/reagent/sight_dram/overdose(mob/living/carbon/M)
	M.add_chemical_effect(CE_TOXIN, 2)

/datum/reagent/sight_dram/affect_blood(mob/living/carbon/M)
	M.add_chemical_effect(CE_TOXIN, 5) //DONT INJECT IT

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
	description = "Gelified blood that strengthens the body. Has an unpleasant aftereffect."
	taste_description = "dry iron"
	reagent_state = LIQUID
	color = "#A10808"
	scannable = FALSE
	appear_in_default_catalog = FALSE
	metabolism = 0.001 //Takes a long time to remove, mercy period to get to safety since it knocks you down horribly
	overdose = 3

/datum/reagent/lively_concoxion/overdose(mob/living/carbon/M)
	M.adjustCloneLoss(3)

/datum/reagent/lively_concoxion/affect_blood(mob/living/carbon/M)
	M.add_chemical_effect(CE_TOXIN, 1)

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
	M.emote("gasp")
	M.adjustOxyLoss(60)
	M.Weaken(5)
	M.silent = max(M.silent, 5)

/datum/reagent/nervs
	name = "Nerevex"
	id = "nervs"
	description = "A unique mix that makes the users' brain able to withstand more chemical accumulation in their system."
	taste_description = "shivers"
	reagent_state = LIQUID
	color = "#6c1079"
	scannable = FALSE
	appear_in_default_catalog = FALSE
	metabolism = 0.001
	overdose = 3

/datum/reagent/nervs/overdose(mob/living/carbon/M)
	M.adjustCloneLoss(1)

/datum/reagent/nervs/affect_blood(mob/living/carbon/M)
	M.add_chemical_effect(CE_TOXIN, 1)

/datum/reagent/nervs/affect_ingest(mob/living/carbon/M, alien, effect_multiplier)
	return

/datum/reagent/nervs/on_mob_add(mob/living/carbon/M)
	if(!M.metabolism_effects.nsa_chem_bonus)
		M.metabolism_effects.nsa_chem_bonus += 60 // 0 x 2 is still 0 Trilby...this makes it use the maximum value possible of Detox
		M.metabolism_effects.calculate_nsa()

/datum/reagent/nervs/on_mob_delete(mob/living/carbon/M)
	. = ..()
	var/mob/living/carbon/C = M
	if(istype(C))
		C.metabolism_effects.nsa_threshold = initial(C.metabolism_effects.nsa_chem_bonus)
		C.metabolism_effects.calculate_nsa()

/datum/reagent/harms
	name = "Ch'alla Volkn"
	id = "harms"
	description = "A mix of solid sharp sands and metal designed to cut down whoever they are thrown at." // POCKET SAND!
	taste_description = "bitter demise"
	reagent_state = SOLID //for sake of simple
	color = "#b9af1f"
	scannable = FALSE
	appear_in_default_catalog = FALSE
	metabolism = 0.1
	overdose = 5

/datum/reagent/harms/overdose(mob/living/carbon/M)
	M.add_chemical_effect(CE_TOXIN, 5)

/datum/reagent/harms/affect_blood(mob/living/carbon/M)
	M.add_chemical_effect(CE_TOXIN, 1)

/datum/reagent/harms/affect_ingest(mob/living/carbon/M)
	M.add_chemical_effect(CE_TOXIN, 3)

/datum/reagent/harms/on_mob_add(mob/living/L)
	. = ..()
	if(!ishuman(L))
		L.damage_through_armor(230, BRUTE, attack_flag = ARMOR_BIO)
		return
	L.damage_through_armor(20, BRUTE, attack_flag = ARMOR_BIO)

/datum/reagent/harms/affect_touch(mob/living/L)
	on_mob_add(L)

/datum/reagent/burns
	name = "Burning Oils"
	id = "burns"
	description = "Heated oils with fibers of iron and salt. While it's cold inside the glass, contact with skin, chitin or any dermis tissue makes its temperature violently react..."
	taste_description = "liquid fire"
	reagent_state = LIQUID //for sake of simple
	color = "#642424"
	scannable = FALSE
	appear_in_default_catalog = FALSE
	metabolism = 0.1
	overdose = 5

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
		L.adjust_fire_stacks(4)
		L.IgniteMob()
		return
	L.damage_through_armor(20, BURN, attack_flag = ARMOR_BIO)
	L.adjust_fire_stacks(2)
	L.IgniteMob() // It reacts violently against flesh and chitin, so it ignites naturally in contact with it, and O2 in the atmosphere.

/datum/reagent/mind_expander
	name = "Mental Salts"
	id = "mind_expander"
	description = "Salts mixed with gold and milk, said to help people think clearly on tasks from gardening to scribing."
	taste_description = "smelling salts and expensive metal"
	reagent_state = LIQUID //for sake of simple
	color = "#915e12"
	scannable = FALSE
	appear_in_default_catalog = FALSE
	metabolism = 0.01
	overdose = 3

/datum/reagent/mind_exspander/overdose(mob/living/carbon/M)
	M.adjustCloneLoss(3)

/datum/reagent/mind_exspander/affect_blood(mob/living/carbon/M)
	M.add_chemical_effect(CE_TOXIN, 1)

/datum/reagent/mind_exspander/affect_ingest(mob/living/carbon/M, alien, effect_multiplier)
	M.stats.addTempStat(STAT_COG, STAT_LEVEL_ADEPT, STIM_TIME, "mind_exspander")
	M.stats.addTempStat(STAT_BIO, STAT_LEVEL_ADEPT, STIM_TIME, "mind_exspander")

/datum/reagent/work_tonic
	name = "Work Tonic"
	id = "work_tonic"
	description = "More of a gel then a tonic, this mix of hardy elements makes the body able to do mechanical tasks much more easily."
	taste_description = "dry cheese and raw steak"
	reagent_state = LIQUID
	color = "#da710f"
	scannable = FALSE
	appear_in_default_catalog = FALSE
	metabolism = 0.01
	overdose = 3

/datum/reagent/work_tonic/overdose(mob/living/carbon/M)
	M.adjustCloneLoss(3)

/datum/reagent/work_tonic/affect_blood(mob/living/carbon/M)
	M.add_chemical_effect(CE_TOXIN, 1)

/datum/reagent/work_tonic/affect_ingest(mob/living/carbon/M, alien, effect_multiplier)
	M.stats.addTempStat(STAT_MEC, STAT_LEVEL_EXPERT, STIM_TIME, "work_tonic")

/datum/reagent/ethanol/combat_brew
	name = "Medvesila Brew"
	id = "combat_brew"
	description = "A frothy mix said to help the body withstand and deal more trauma force to any foe."
	taste_description = "meaty mead"
	reagent_state = LIQUID
	color = "#0d6fa8"
	scannable = FALSE
	appear_in_default_catalog = FALSE
	metabolism = 0.1
	glass_unique_appearance = FALSE
	strength = 1 // STRONG
	taste_mult = 2.5
	glass_name = "Strange Liquor"
	glass_desc = "Some sort of liquor with a very strong smell of...meat and honey? Are you sure this is safe to drink...?"
	overdose = 6

/datum/reagent/ethanol/combat_brew/overdose(mob/living/carbon/M)
	M.adjustCloneLoss(3)

/datum/reagent/ethanol/combat_brew/affect_blood(mob/living/carbon/M)
	M.add_chemical_effect(CE_TOXIN, 1)

/datum/reagent/ethanol/combat_brew/affect_ingest(mob/living/carbon/M, alien, effect_multiplier)
	..()
	M.stats.addTempStat(STAT_TGH, STAT_LEVEL_ADEPT, STIM_TIME, "combat_brew")
	M.stats.addTempStat(STAT_ROB, STAT_LEVEL_ADEPT, STIM_TIME, "combat_brew")

/datum/reagent/ethanol/eye_lid // It's a liquor
	name = "Gwalch Liquor"
	id = "eye_lid"
	description = "Highly distilled spirits oft imbibed in the past \
				   by those that wished to shut their senses from the world and have focused eyes. \
				   One must be careful not to overconsume more than a shot at a time."
	taste_description = "red wine and stale cheese"
	reagent_state = LIQUID //for sake of simple
	color = "#b34404"
	scannable = FALSE
	appear_in_default_catalog = FALSE
	metabolism = 0.1
	glass_unique_appearance = FALSE
	strength = 1 // STRONG
	taste_mult = 2.5
	glass_name = "Strange Liquor"
	glass_desc = "Some sort of liquor with a very strong smell of...cheese and pepper? Are you sure this is safe to drink...?"
	overdose = 6 // Meant to be poured on a shot glass, one unit more will wreck you



/datum/reagent/ethanol/eye_lid/overdose(mob/living/carbon/M)
	M.adjustCloneLoss(3)
	var/mob/living/carbon/human/H = M
	var/obj/item/organ/internal/eyes/E = H.random_organ_by_process(OP_EYES) // Frying your eyes
	if(E && istype(E))
		if(dose < 10) // Two shots, worse effect
			E.take_damage(1, 0)
			H.eye_blurry = max(M.eye_blurry, 15)
			H.eye_blind = max(M.eye_blind, 5)
		else
			E.take_damage(10, 0)
			H.eye_blurry = max(M.eye_blurry, 25)
			H.eye_blind = max(M.eye_blind, 10)

/datum/reagent/ethanol/eye_lid/affect_blood(mob/living/carbon/M)
	M.add_chemical_effect(CE_TOXIN, 1)

/datum/reagent/ethanol/eye_lid/affect_ingest(mob/living/carbon/M, alien, effect_multiplier)
	..()
	M.stats.addTempStat(STAT_VIG, STAT_LEVEL_ADEPT, STIM_TIME, "eye_lid")

/datum/reagent/red_heart
	name = "Vitaurum"
	id = "red_heart"
	description = "A small droplet of red gold created by an alchemist \
				   who could not cope with the loss of their familiar. \
				   Said to have the power to revive beasts."
	taste_description = "zapping away your taste buds"
	reagent_state = LIQUID //for sake of simple
	color = "#da4a12"
	scannable = FALSE
	appear_in_default_catalog = FALSE
	metabolism = 1
	overdose = 2

/datum/reagent/red_heart/overdose(mob/living/carbon/M)
	M.adjustCloneLoss(3)

/datum/reagent/red_heart/affect_blood(mob/living/carbon/M)
	M.add_chemical_effect(CE_TOXIN, 3)

/datum/reagent/red_heart/affect_ingest(mob/living/carbon/M, alien, effect_multiplier)
	return

/datum/reagent/red_heart/on_mob_add(mob/living/L)
	. = ..()
	if(L.stat == DEAD) //Anti-cheat so you dont inject this into a mob to deal 80% damage
		if(!ishuman(L))
			L.revive()
			L.adjustBruteLoss(L.get_health() * 0.8) //takes away 80% health
			return
