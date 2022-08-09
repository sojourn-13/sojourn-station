/obj/item/organ/internal/scaffold/aberrant/dependent
	max_upgrades = 4
	price_tag = 350
	spawn_tags = SPAWN_TAG_ABERRANT_ORGAN_RARE		// Rare because 4 upgrade slots
	aberrant_cooldown_time = DEPENDENT_ABERRANT_COOLDOWN
	input_mod_path = /obj/item/modification/organ/internal/input/reagents
	process_mod_path = /obj/item/modification/organ/internal/process/condense
	output_mod_path = /obj/item/modification/organ/internal/output/activate_organ_functions
	special_mod_path = /obj/item/modification/organ/internal/special/on_cooldown/stat_boost
	should_process_have_organ_stats = FALSE
	output_pool = ALL_STANDARD_ORGAN_EFFICIENCIES
	output_info = list(1)
	special_info = list(STAT_ROB, 3)


/obj/item/organ/internal/scaffold/aberrant/dependent/wifebeater
	desc = "A masterfully engineered organ for when you really need to put someone in their place."
	specific_input_type_pool = list(
		/datum/reagent/ethanol/beer, /datum/reagent/ethanol/ale, /datum/reagent/ethanol/mead
	)
	input_mode = CHEM_INGEST
	special_info = list(STAT_ROB, 3)		// specfic organs will have better buffs

/obj/item/organ/internal/scaffold/aberrant/dependent/wifebeater/New()
	..()
	var/obj/item/modification/organ/internal/input/I
	for(var/mod in item_upgrades)
		if(istype(mod, /obj/item/modification/organ/internal/input))
			I = mod

	var/datum/component/modification/organ/input/IC = I.GetComponent(/datum/component/modification/organ/input)
	IC.prefix = "wifebeater's"
	refresh_upgrades()

/obj/item/organ/internal/scaffold/aberrant/dependent/wifebeater/random
	use_generated_name = FALSE

/obj/item/organ/internal/scaffold/aberrant/dependent/wifebeater/liver
	output_pool = list(OP_LIVER)
	special_info = list(STAT_ROB, 10)

/obj/item/organ/internal/scaffold/aberrant/dependent/wifebeater/stomach
	output_pool = list(OP_STOMACH)
	special_info = list(STAT_ROB, 10)

/obj/item/organ/internal/scaffold/aberrant/dependent/wifebeater/kidney
	output_pool = list(OP_KIDNEYS)
	special_info = list(STAT_ROB, 10)


/obj/item/organ/internal/scaffold/aberrant/dependent/functional_alcoholic
	desc = "A masterfully engineered organ for those who want to drink and drive."
	specific_input_type_pool = list(
		/datum/reagent/ethanol/gin, /datum/reagent/ethanol/rum, /datum/reagent/ethanol/sake, /datum/reagent/ethanol/tequilla, /datum/reagent/ethanol/vermouth,
		/datum/reagent/ethanol/vodka, /datum/reagent/ethanol/whiskey, /datum/reagent/ethanol/wine
	)
	input_mode = CHEM_INGEST
	special_info = list(STAT_MEC, 3)

/obj/item/organ/internal/scaffold/aberrant/dependent/functional_alcoholic/New()
	..()
	var/obj/item/modification/organ/internal/input/I
	for(var/mod in item_upgrades)
		if(istype(mod, /obj/item/modification/organ/internal/input))
			I = mod

	var/datum/component/modification/organ/input/IC = I.GetComponent(/datum/component/modification/organ/input)
	IC.prefix = "functional alcoholic's"
	refresh_upgrades()

/obj/item/organ/internal/scaffold/aberrant/dependent/functional_alcoholic/random
	use_generated_name = FALSE

/obj/item/organ/internal/scaffold/aberrant/dependent/functional_alcoholic/liver
	output_pool = list(OP_LIVER)
	special_info = list(STAT_MEC, 10)

/obj/item/organ/internal/scaffold/aberrant/dependent/functional_alcoholic/stomach
	output_pool = list(OP_STOMACH)
	special_info = list(STAT_MEC, 10)

/obj/item/organ/internal/scaffold/aberrant/dependent/functional_alcoholic/kidney
	output_pool = list(OP_KIDNEYS)
	special_info = list(STAT_MEC, 10)


/obj/item/organ/internal/scaffold/aberrant/dependent/classy
	desc = "A masterfully engineered organ for those fancy dinner parties."
	specific_input_type_pool = list(
		/datum/reagent/ethanol/martini, /datum/reagent/ethanol/coffee/b52, /datum/reagent/ethanol/black_russian, /datum/reagent/ethanol/gintonic
	)
	input_mode = CHEM_INGEST
	special_info = list(STAT_COG, 3)

/obj/item/organ/internal/scaffold/aberrant/dependent/classy/New()
	..()
	var/obj/item/modification/organ/internal/input/I
	for(var/mod in item_upgrades)
		if(istype(mod, /obj/item/modification/organ/internal/input))
			I = mod

	var/datum/component/modification/organ/input/IC = I.GetComponent(/datum/component/modification/organ/input)
	IC.prefix = "aristocrat's"
	refresh_upgrades()

/obj/item/organ/internal/scaffold/aberrant/dependent/classy/random
	use_generated_name = FALSE

/obj/item/organ/internal/scaffold/aberrant/dependent/classy/liver
	output_pool = list(OP_LIVER)
	special_info = list(STAT_COG, 10)

/obj/item/organ/internal/scaffold/aberrant/dependent/classy/stomach
	output_pool = list(OP_STOMACH)
	special_info = list(STAT_COG, 10)

/obj/item/organ/internal/scaffold/aberrant/dependent/classy/kidney
	output_pool = list(OP_KIDNEYS)
	special_info = list(STAT_COG, 10)

	
/obj/item/organ/internal/scaffold/aberrant/dependent/exmercenary
	desc = "A masterfully engineered organ for the really big guns."
	specific_input_type_pool = list(
		/datum/reagent/stim/bouncer, /datum/reagent/stim/steady, /datum/reagent/stim/violence
	)
	input_mode = CHEM_BLOOD
	special_info = list(STAT_VIG, 3)

/obj/item/organ/internal/scaffold/aberrant/dependent/exmercenary/New()
	..()
	var/obj/item/modification/organ/internal/input/I
	for(var/mod in item_upgrades)
		if(istype(mod, /obj/item/modification/organ/internal/input))
			I = mod

	var/datum/component/modification/organ/input/IC = I.GetComponent(/datum/component/modification/organ/input)
	IC.prefix = "ex-mercenary's"
	refresh_upgrades()

/obj/item/organ/internal/scaffold/aberrant/dependent/exmercenary/random
	use_generated_name = FALSE

/obj/item/organ/internal/scaffold/aberrant/dependent/exmercenary/blood_vessel
	output_pool = list(OP_BLOOD_VESSEL)
	special_info = list(STAT_VIG, 5)

/obj/item/organ/internal/scaffold/aberrant/dependent/exmercenary/liver
	output_pool = list(OP_LIVER)
	special_info = list(STAT_VIG, 10)

/obj/item/organ/internal/scaffold/aberrant/dependent/exmercenary/muscle
	output_pool = list(OP_MUSCLE)
	special_info = list(STAT_VIG, 5)


/obj/item/organ/internal/scaffold/aberrant/dependent/mobster
	desc = "A masterfully engineered organ for the tough stuff."
	specific_input_type_pool = list(
		/datum/reagent/drug/space_drugs, /datum/reagent/drug/psilocybin
	)
	input_mode = CHEM_BLOOD
	special_info = list(STAT_TGH, 3)

/obj/item/organ/internal/scaffold/aberrant/dependent/mobster/New()
	..()
	var/obj/item/modification/organ/internal/input/I
	for(var/mod in item_upgrades)
		if(istype(mod, /obj/item/modification/organ/internal/input))
			I = mod

	var/datum/component/modification/organ/input/IC = I.GetComponent(/datum/component/modification/organ/input)
	IC.prefix = "mobster's"
	refresh_upgrades()

/obj/item/organ/internal/scaffold/aberrant/dependent/mobster/random
	use_generated_name = FALSE

/obj/item/organ/internal/scaffold/aberrant/dependent/mobster/blood_vessel
	output_pool = list(OP_BLOOD_VESSEL)
	special_info = list(STAT_TGH, 5)

/obj/item/organ/internal/scaffold/aberrant/dependent/mobster/liver
	output_pool = list(OP_LIVER)
	special_info = list(STAT_TGH, 10)

/obj/item/organ/internal/scaffold/aberrant/dependent/mobster/muscle
	output_pool = list(OP_MUSCLE)
	special_info = list(STAT_TGH, 5)


/obj/item/organ/internal/scaffold/aberrant/dependent/chemist
	desc = "A masterfully engineered organ for the hard-working pill popper."
	specific_input_type_pool = list(
		/datum/reagent/stim/pro_surgeon, /datum/reagent/medicine/aminazine, /datum/reagent/medicine/citalopram
	)
	input_mode = CHEM_BLOOD
	special_info = list(STAT_BIO, 3)

/obj/item/organ/internal/scaffold/aberrant/dependent/chemist/New()
	..()
	var/obj/item/modification/organ/internal/input/I
	for(var/mod in item_upgrades)
		if(istype(mod, /obj/item/modification/organ/internal/input))
			I = mod

	var/datum/component/modification/organ/input/IC = I.GetComponent(/datum/component/modification/organ/input)
	IC.prefix = "chemist's"
	refresh_upgrades()

/obj/item/organ/internal/scaffold/aberrant/dependent/chemist/random
	use_generated_name = FALSE

/obj/item/organ/internal/scaffold/aberrant/dependent/chemist/blood_vessel
	output_pool = list(OP_BLOOD_VESSEL)
	special_info = list(STAT_BIO, 5)

/obj/item/organ/internal/scaffold/aberrant/dependent/chemist/liver
	output_pool = list(OP_LIVER)
	special_info = list(STAT_BIO, 10)

/obj/item/organ/internal/scaffold/aberrant/dependent/chemist/kidney
	output_pool = list(OP_KIDNEYS)
	special_info = list(STAT_BIO, 10)

// Soj uses Viv (NSA stat, "addict") and Anatomy (health stat, "bodybuilder")
