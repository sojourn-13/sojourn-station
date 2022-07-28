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
	special_info = list(STAT_ROB, 3, DEPENDENT_ABERRANT_STIM_TIME)

/obj/item/organ/internal/scaffold/aberrant/dependent/wifebeater
	name = "wifebeater's organ"
	desc = "A masterfully engineered organ for when you really need to put someone in their place."
	specific_input_type_pool = list(
		/datum/reagent/ethanol/beer, /datum/reagent/ethanol/ale
	)
	input_threshold = LOW_REAGENT_THRESHOLD
	input_mode = CHEM_INGEST
	special_info = list(STAT_ROB, 2, DEPENDENT_ABERRANT_STIM_TIME)		// specfic organs will have better buffs

/obj/item/organ/internal/scaffold/aberrant/dependent/wifebeater/New()
	..()
	var/obj/item/modification/organ/internal/input/I
	for(var/mod in item_upgrades)
		if(istype(mod, /obj/item/modification/organ/internal/input))
			I = mod

	var/datum/component/modification/organ/input/IC = I.GetComponent(/datum/component/modification/organ/input)
	IC.prefix = "wifebeater's"

/obj/item/organ/internal/scaffold/aberrant/dependent/wifebeater/liver
	name = "wifebeater's liver"
	use_generated_name = FALSE
	output_pool = list(OP_LIVER)
	special_info = list(STAT_ROB, 10, DEPENDENT_ABERRANT_STIM_TIME)

/obj/item/organ/internal/scaffold/aberrant/dependent/wifebeater/stomach
	name = "wifebeater's stomach"
	use_generated_name = FALSE
	output_pool = list(OP_STOMACH)
	special_info = list(STAT_ROB, 10, DEPENDENT_ABERRANT_STIM_TIME)

/obj/item/organ/internal/scaffold/aberrant/dependent/wifebeater/kidney
	name = "wifebeater's kidney"
	use_generated_name = FALSE
	output_pool = list(OP_KIDNEYS)
	special_info = list(STAT_ROB, 10, DEPENDENT_ABERRANT_STIM_TIME)


/obj/item/organ/internal/scaffold/aberrant/dependent/functional_alcoholic
	name = "functional ethanolic's organ"
	desc = "A masterfully engineered organ for those who want to drink and drive."
	specific_input_type_pool = list(
		/datum/reagent/ethanol/gin, /datum/reagent/ethanol/rum, /datum/reagent/ethanol/sake, /datum/reagent/ethanol/tequilla, /datum/reagent/ethanol/vermouth,
		/datum/reagent/ethanol/vodka, /datum/reagent/ethanol/whiskey, /datum/reagent/ethanol/wine
	)
	input_threshold = LOW_REAGENT_THRESHOLD
	input_mode = CHEM_INGEST
	special_info = list(STAT_MEC, 2, DEPENDENT_ABERRANT_STIM_TIME)

/obj/item/organ/internal/scaffold/aberrant/dependent/functional_alcoholic/New()
	..()
	var/obj/item/modification/organ/internal/input/I
	for(var/mod in item_upgrades)
		if(istype(mod, /obj/item/modification/organ/internal/input))
			I = mod

	var/datum/component/modification/organ/input/IC = I.GetComponent(/datum/component/modification/organ/input)
	IC.prefix = "functional ethanolic's"

/obj/item/organ/internal/scaffold/aberrant/dependent/functional_alcoholic/liver
	name = "functional ethanolic's liver"
	use_generated_name = FALSE
	output_pool = list(OP_LIVER)
	special_info = list(STAT_MEC, 10, DEPENDENT_ABERRANT_STIM_TIME)

/obj/item/organ/internal/scaffold/aberrant/dependent/functional_alcoholic/stomach
	name = "functional ethanolic's stomach"
	use_generated_name = FALSE
	output_pool = list(OP_STOMACH)
	special_info = list(STAT_MEC, 10, DEPENDENT_ABERRANT_STIM_TIME)

/obj/item/organ/internal/scaffold/aberrant/dependent/functional_alcoholic/kidney
	name = "functional ethanolic's kidney"
	use_generated_name = FALSE
	output_pool = list(OP_KIDNEYS)
	special_info = list(STAT_MEC, 10, DEPENDENT_ABERRANT_STIM_TIME)


/obj/item/organ/internal/scaffold/aberrant/dependent/classy
	name = "classy drinker's organ"
	desc = "A masterfully engineered organ for those fancy dinner parties."
	specific_input_type_pool = list(
		/datum/reagent/ethanol/martini, /datum/reagent/ethanol/coffee/b52, /datum/reagent/ethanol/black_russian, /datum/reagent/ethanol/gintonic
	)
	input_threshold = LOW_REAGENT_THRESHOLD
	input_mode = CHEM_INGEST
	special_info = list(STAT_COG, 2, DEPENDENT_ABERRANT_STIM_TIME)

/obj/item/organ/internal/scaffold/aberrant/dependent/classy/New()
	..()
	var/obj/item/modification/organ/internal/input/I
	for(var/mod in item_upgrades)
		if(istype(mod, /obj/item/modification/organ/internal/input))
			I = mod

	var/datum/component/modification/organ/input/IC = I.GetComponent(/datum/component/modification/organ/input)
	IC.prefix = "classy drinker's"

/obj/item/organ/internal/scaffold/aberrant/dependent/classy/liver
	name = "classy drinker's liver"
	use_generated_name = FALSE
	output_pool = list(OP_LIVER)
	special_info = list(STAT_COG, 10, DEPENDENT_ABERRANT_STIM_TIME)

/obj/item/organ/internal/scaffold/aberrant/dependent/classy/stomach
	name = "classy drinker's stomach"
	use_generated_name = FALSE
	output_pool = list(OP_STOMACH)
	special_info = list(STAT_COG, 10, DEPENDENT_ABERRANT_STIM_TIME)

/obj/item/organ/internal/scaffold/aberrant/dependent/classy/kidney
	name = "classy drinker's kidney"
	use_generated_name = FALSE
	output_pool = list(OP_KIDNEYS)
	special_info = list(STAT_COG, 10, DEPENDENT_ABERRANT_STIM_TIME)

	
/obj/item/organ/internal/scaffold/aberrant/dependent/exmercenary
	name = "ex-mercenary's organ"
	desc = "A masterfully engineered organ for the really big guns."
	specific_input_type_pool = list(
		/datum/reagent/stim/bouncer, /datum/reagent/stim/steady, /datum/reagent/stim/violence
	)
	input_threshold = LOW_REAGENT_THRESHOLD
	input_mode = CHEM_BLOOD
	special_info = list(STAT_VIG, 2, DEPENDENT_ABERRANT_STIM_TIME)

/obj/item/organ/internal/scaffold/aberrant/dependent/exmercenary/New()
	..()
	var/obj/item/modification/organ/internal/input/I
	for(var/mod in item_upgrades)
		if(istype(mod, /obj/item/modification/organ/internal/input))
			I = mod

	var/datum/component/modification/organ/input/IC = I.GetComponent(/datum/component/modification/organ/input)
	IC.prefix = "ex-mercenary's"

/obj/item/organ/internal/scaffold/aberrant/dependent/exmercenary/blood_vessel
	name = "ex-mercenary's blood vessel"
	use_generated_name = FALSE
	output_pool = list(OP_BLOOD_VESSEL)
	special_info = list(STAT_VIG, 5, DEPENDENT_ABERRANT_STIM_TIME)

/obj/item/organ/internal/scaffold/aberrant/dependent/exmercenary/liver
	name = "ex-mercenary's liver"
	use_generated_name = FALSE
	output_pool = list(OP_LIVER)
	special_info = list(STAT_VIG, 10, DEPENDENT_ABERRANT_STIM_TIME)

/obj/item/organ/internal/scaffold/aberrant/dependent/exmercenary/muscle
	name = "ex-mercenary's muscle"
	use_generated_name = FALSE
	output_pool = list(OP_MUSCLE)
	special_info = list(STAT_VIG, 5, DEPENDENT_ABERRANT_STIM_TIME)


/obj/item/organ/internal/scaffold/aberrant/dependent/mobster
	name = "mobster's organ"
	desc = "A masterfully engineered organ for those who want to play in the snow."
	specific_input_type_pool = list(
		/datum/reagent/drug/space_drugs, /datum/reagent/drug/psilocybin
	)
	input_threshold = LOW_REAGENT_THRESHOLD
	input_mode = CHEM_BLOOD
	special_info = list(STAT_TGH, 2, DEPENDENT_ABERRANT_STIM_TIME)

/obj/item/organ/internal/scaffold/aberrant/dependent/mobster/New()
	..()
	var/obj/item/modification/organ/internal/input/I
	for(var/mod in item_upgrades)
		if(istype(mod, /obj/item/modification/organ/internal/input))
			I = mod

	var/datum/component/modification/organ/input/IC = I.GetComponent(/datum/component/modification/organ/input)
	IC.prefix = "mobster's"

/obj/item/organ/internal/scaffold/aberrant/dependent/mobster/blood_vessel
	name = "mobster's blood vessel"
	use_generated_name = FALSE
	output_pool = list(OP_BLOOD_VESSEL)
	special_info = list(STAT_TGH, 5, DEPENDENT_ABERRANT_STIM_TIME)

/obj/item/organ/internal/scaffold/aberrant/dependent/mobster/liver
	name = "mobster's liver"
	use_generated_name = FALSE
	output_pool = list(OP_LIVER)
	special_info = list(STAT_TGH, 10, DEPENDENT_ABERRANT_STIM_TIME)

/obj/item/organ/internal/scaffold/aberrant/dependent/mobster/muscle
	name = "mobster's muscle"
	use_generated_name = FALSE
	output_pool = list(OP_MUSCLE)
	special_info = list(STAT_TGH, 5, DEPENDENT_ABERRANT_STIM_TIME)


/obj/item/organ/internal/scaffold/aberrant/dependent/chemist
	name = "chemist's organ"
	desc = "A masterfully engineered organ for the hard-working pill popper."
	specific_input_type_pool = list(
		/datum/reagent/stim/pro_surgeon, /datum/reagent/medicine/aminazine, /datum/reagent/medicine/citalopram
	)
	input_threshold = LOW_REAGENT_THRESHOLD
	input_mode = CHEM_BLOOD
	special_info = list(STAT_BIO, 2, DEPENDENT_ABERRANT_STIM_TIME)

/obj/item/organ/internal/scaffold/aberrant/dependent/chemist/New()
	..()
	var/obj/item/modification/organ/internal/input/I
	for(var/mod in item_upgrades)
		if(istype(mod, /obj/item/modification/organ/internal/input))
			I = mod

	var/datum/component/modification/organ/input/IC = I.GetComponent(/datum/component/modification/organ/input)
	IC.prefix = "chemist's"

/obj/item/organ/internal/scaffold/aberrant/dependent/chemist/blood_vessel
	name = "chemist's blood vessel"
	use_generated_name = FALSE
	output_pool = list(OP_BLOOD_VESSEL)
	special_info = list(STAT_BIO, 5, DEPENDENT_ABERRANT_STIM_TIME)

/obj/item/organ/internal/scaffold/aberrant/dependent/chemist/liver
	name = "chemist's liver"
	use_generated_name = FALSE
	output_pool = list(OP_LIVER)
	special_info = list(STAT_BIO, 10, DEPENDENT_ABERRANT_STIM_TIME)

/obj/item/organ/internal/scaffold/aberrant/dependent/chemist/kidney
	name = "chemist's kidney"
	use_generated_name = FALSE
	output_pool = list(OP_KIDNEYS)
	special_info = list(STAT_BIO, 10, DEPENDENT_ABERRANT_STIM_TIME)

// Soj uses Viv (NSA stat, "addict") and Anatomy (health stat, "bodybuilder")
