/obj/item/organ/internal/scaffold/aberrant/scrub_toxin
	price_tag = 200
	use_generated_name = FALSE
	input_mod_path = /obj/item/modification/organ/internal/input/reagents
	process_mod_path = /obj/item/modification/organ/internal/process/boost
	output_mod_path = /obj/item/modification/organ/internal/output/chemical_effects
	specific_input_type_pool = list(/datum/reagent/toxin)	// Should let these scrub ANY toxin
	should_process_have_organ_stats = FALSE
	output_pool = TYPE_2_HORMONES
	output_info = list(NOT_USED)

/obj/item/organ/internal/scaffold/aberrant/scrub_toxin/blood
	name = "filtration node"
	desc = "A finely engineered organ. Scrubs toxins from the bloodstream."
	input_mode = CHEM_BLOOD

/obj/item/organ/internal/scaffold/aberrant/scrub_toxin/ingest
	name = "hepatic lobe"
	desc = "A finely engineered organ. Scrubs ingested toxins."
	input_mode = CHEM_INGEST

/obj/item/organ/internal/scaffold/aberrant/scrub_toxin/touch
	name = "exocrine gland"
	desc = "A finely engineered organ. Scrubs toxins absorbed through the skin."
	input_mode = CHEM_TOUCH

/obj/item/organ/internal/scaffold/aberrant/gastric
	name = "gastric sac"
	desc = "A finely engineered organ for your second breakfast. Turns a reagent into nutriment."
	//desc = "A finely engineered organ. Lets you finish a meal before you go out to eat."
	price_tag = 200
	use_generated_name = FALSE
	input_mod_path = /obj/item/modification/organ/internal/input/reagents
	process_mod_path = /obj/item/modification/organ/internal/process/boost
	output_mod_path = /obj/item/modification/organ/internal/output/reagents_ingest
	specific_input_type_pool = list(/datum/reagent/other/crayon_dust, /datum/reagent/other/paint, /datum/reagent/other/ultraglue, /datum/reagent/other/space_cleaner,
									/datum/reagent/toxin/amatoxin, /datum/reagent/toxin/carpotoxin, /datum/reagent/toxin/fertilizer)
	input_mode = CHEM_INGEST
	should_process_have_organ_stats = FALSE
	output_pool = list(/datum/reagent/organic/nutriment)
	output_info = list(LOW_OUTPUT)

/obj/item/organ/internal/scaffold/aberrant/damage_response
	name = "endocrine gland"
	desc = "A finely engineered organ. Secretes hormones in response to pain or injury."
	price_tag = 200
	use_generated_name = FALSE
	input_mod_path = /obj/item/modification/organ/internal/input/damage
	process_mod_path = /obj/item/modification/organ/internal/process/boost
	output_mod_path = /obj/item/modification/organ/internal/output/chemical_effects
	specific_input_type_pool = ALL_DAMAGE_TYPES
	input_mode = NOT_USED
	input_threshold = 20
	should_process_have_organ_stats = FALSE
	output_pool = TYPE_2_HORMONES
	output_info = list(NOT_USED)
