// Mods
/datum/design/organ/organ_mod
	category = "Modifications"

/datum/design/organ/organ_mod/capillaries
	build_path = /obj/item/modification/organ/internal/stromal/improvement/requirements

/datum/design/organ/organ_mod/durable_membrane
	build_path = /obj/item/modification/organ/internal/stromal/improvement/durability

/datum/design/organ/organ_mod/stem_cells
	build_path = /obj/item/modification/organ/internal/stromal/improvement/efficiency

/datum/design/organ/organ_mod/expander
	build_path = /obj/item/modification/organ/internal/stromal/augment/expander

/datum/design/organ/organ_mod/overclock
	build_path = /obj/item/modification/organ/internal/stromal/augment/overclock

/datum/design/organ/organ_mod/underclock
	build_path = /obj/item/modification/organ/internal/stromal/augment/underclock

/datum/design/organ/organ_mod/silencer
	build_path = /obj/item/modification/organ/internal/stromal/augment/silencer

/datum/design/organ/organ_mod/sphincter
	build_path = /obj/item/modification/organ/internal/process/condense

// Organs
/datum/design/organ/scaffold
	category = "Aberrant Organs"
	build_path = /obj/item/organ/internal/scaffold

/datum/design/organ/aberrant_organ
	category = "Aberrant Organs"
	materials = list(MATERIAL_BIOMATTER = 20)	// Organ plus 3 mods

/datum/design/organ/aberrant_organ/scrub_toxin_blood
	build_path = /obj/item/organ/internal/scaffold/aberrant/scrub_toxin/blood
	
/datum/design/organ/aberrant_organ/scrub_toxin_ingest
	build_path = /obj/item/organ/internal/scaffold/aberrant/scrub_toxin/ingest
	
/datum/design/organ/aberrant_organ/scrub_toxin_touch
	build_path = /obj/item/organ/internal/scaffold/aberrant/scrub_toxin/touch
	
/datum/design/organ/aberrant_organ/gastric
	build_path = /obj/item/organ/internal/scaffold/aberrant/gastric
	
/datum/design/organ/aberrant_organ/damage_response
	build_path = /obj/item/organ/internal/scaffold/aberrant/damage_response


/datum/design/organ/aberrant_organ/wifebeater
	build_path = /obj/item/organ/internal/scaffold/aberrant/dependent/wifebeater/random

/datum/design/organ/aberrant_organ/wifebeater/liver
	build_path = /obj/item/organ/internal/scaffold/aberrant/dependent/wifebeater/liver
	
/datum/design/organ/aberrant_organ/wifebeater/stomach
	build_path = /obj/item/organ/internal/scaffold/aberrant/dependent/wifebeater/stomach
	
/datum/design/organ/aberrant_organ/wifebeater/kidney
	build_path = /obj/item/organ/internal/scaffold/aberrant/dependent/wifebeater/kidney
	

/datum/design/organ/aberrant_organ/functional_alcoholic
	build_path = /obj/item/organ/internal/scaffold/aberrant/dependent/functional_alcoholic/random
	
/datum/design/organ/aberrant_organ/functional_alcoholic/liver
	build_path = /obj/item/organ/internal/scaffold/aberrant/dependent/functional_alcoholic/liver
	
/datum/design/organ/aberrant_organ/functional_alcoholic/stomach
	build_path = /obj/item/organ/internal/scaffold/aberrant/dependent/functional_alcoholic/stomach
	
/datum/design/organ/aberrant_organ/functional_alcoholic/kidney
	build_path = /obj/item/organ/internal/scaffold/aberrant/dependent/functional_alcoholic/kidney
	

/datum/design/organ/aberrant_organ/classy
	build_path = /obj/item/organ/internal/scaffold/aberrant/dependent/classy/random
	
/datum/design/organ/aberrant_organ/classy/liver
	build_path = /obj/item/organ/internal/scaffold/aberrant/dependent/classy/liver
	
/datum/design/organ/aberrant_organ/classy/stomach
	build_path = /obj/item/organ/internal/scaffold/aberrant/dependent/classy/stomach
	
/datum/design/organ/aberrant_organ/classy/kidney
	build_path = /obj/item/organ/internal/scaffold/aberrant/dependent/classy/kidney
	

/datum/design/organ/aberrant_organ/mobster
	build_path = /obj/item/organ/internal/scaffold/aberrant/dependent/mobster/random
	
/datum/design/organ/aberrant_organ/mobster/blood_vessel
	build_path = /obj/item/organ/internal/scaffold/aberrant/dependent/mobster/blood_vessel
	
/datum/design/organ/aberrant_organ/mobster/liver
	build_path = /obj/item/organ/internal/scaffold/aberrant/dependent/mobster/liver

/datum/design/organ/aberrant_organ/mobster/muscle
	build_path = /obj/item/organ/internal/scaffold/aberrant/dependent/mobster/muscle


/datum/design/organ/aberrant_organ/chemist
	build_path = /obj/item/organ/internal/scaffold/aberrant/dependent/chemist/random

/datum/design/organ/aberrant_organ/chemist/blood_vessel
	build_path = /obj/item/organ/internal/scaffold/aberrant/dependent/chemist/blood_vessel

/datum/design/organ/aberrant_organ/chemist/liver
	build_path = /obj/item/organ/internal/scaffold/aberrant/dependent/chemist/liver

/datum/design/organ/aberrant_organ/chemist/kidney
	build_path = /obj/item/organ/internal/scaffold/aberrant/dependent/chemist/kidney


/datum/design/organ/aberrant_organ/exmercenary
	build_path = /obj/item/organ/internal/scaffold/aberrant/dependent/exmercenary/random

/datum/design/organ/aberrant_organ/exmercenary/blood_vessel
	build_path = /obj/item/organ/internal/scaffold/aberrant/dependent/exmercenary/blood_vessel

/datum/design/organ/aberrant_organ/exmercenary/liver
	build_path = /obj/item/organ/internal/scaffold/aberrant/dependent/exmercenary/liver

/datum/design/organ/aberrant_organ/exmercenary/muscle
	build_path = /obj/item/organ/internal/scaffold/aberrant/dependent/exmercenary/muscle


// Teratomas
/datum/design/organ/aberrant_organ/teratoma
	category = "Teratomas"
	materials = list(MATERIAL_BIOMATTER = 10)	// Organ plus mod


/datum/design/organ/aberrant_organ/teratoma/input
	category = "Teratoma - Inputs"
	build_path = /obj/item/organ/internal/scaffold/aberrant/teratoma/input

/datum/design/organ/aberrant_organ/teratoma/input/reagents
	build_path = /obj/item/organ/internal/scaffold/aberrant/teratoma/input/reagents

/datum/design/organ/aberrant_organ/teratoma/input/damage
	build_path = /obj/item/organ/internal/scaffold/aberrant/teratoma/input/damage

/datum/design/organ/aberrant_organ/teratoma/input/power_source
	build_path = /obj/item/organ/internal/scaffold/aberrant/teratoma/input/power_source


/datum/design/organ/aberrant_organ/teratoma/input/reagents/uncommon
	build_path = /obj/item/organ/internal/scaffold/aberrant/teratoma/input/reagents/uncommon

/datum/design/organ/aberrant_organ/teratoma/input/damage/uncommon
	build_path = /obj/item/organ/internal/scaffold/aberrant/teratoma/input/damage/uncommon

/datum/design/organ/aberrant_organ/teratoma/input/power_source/uncommon
	build_path = /obj/item/organ/internal/scaffold/aberrant/teratoma/input/power_source/uncommon


/datum/design/organ/aberrant_organ/teratoma/input/reagents/rare
	build_path = /obj/item/organ/internal/scaffold/aberrant/teratoma/input/reagents/rare

/datum/design/organ/aberrant_organ/teratoma/input/damage/rare
	build_path = /obj/item/organ/internal/scaffold/aberrant/teratoma/input/damage/rare

/datum/design/organ/aberrant_organ/teratoma/input/power_source/rare
	build_path = /obj/item/organ/internal/scaffold/aberrant/teratoma/input/power_source/rare


/datum/design/organ/aberrant_organ/teratoma/process
	category = "Teratoma - Processes"
	build_path = /obj/item/organ/internal/scaffold/aberrant/teratoma/process

/datum/design/organ/aberrant_organ/teratoma/process/uncommon
	build_path = /obj/item/organ/internal/scaffold/aberrant/teratoma/process/uncommon


/datum/design/organ/aberrant_organ/teratoma/output
	category = "Teratoma - Outputs"
	build_path = /obj/item/organ/internal/scaffold/aberrant/teratoma/output

/datum/design/organ/aberrant_organ/teratoma/output/reagents_blood
	build_path = /obj/item/organ/internal/scaffold/aberrant/teratoma/output/reagents_blood

/datum/design/organ/aberrant_organ/teratoma/output/reagents_ingest
	build_path = /obj/item/organ/internal/scaffold/aberrant/teratoma/output/reagents_ingest

/datum/design/organ/aberrant_organ/teratoma/output/chemical_effects
	build_path = /obj/item/organ/internal/scaffold/aberrant/teratoma/output/chemical_effects

/datum/design/organ/aberrant_organ/teratoma/output/stat_boost
	build_path = /obj/item/organ/internal/scaffold/aberrant/teratoma/output/stat_boost


/datum/design/organ/aberrant_organ/teratoma/output/reagents_blood/uncommon
	build_path = /obj/item/organ/internal/scaffold/aberrant/teratoma/output/reagents_blood/uncommon

/datum/design/organ/aberrant_organ/teratoma/output/reagents_ingest/uncommon
	build_path = /obj/item/organ/internal/scaffold/aberrant/teratoma/output/reagents_ingest/uncommon

/datum/design/organ/aberrant_organ/teratoma/output/chemical_effects/uncommon
	build_path = /obj/item/organ/internal/scaffold/aberrant/teratoma/output/chemical_effects/uncommon

/datum/design/organ/aberrant_organ/teratoma/output/stat_boost/uncommon
	build_path = /obj/item/organ/internal/scaffold/aberrant/teratoma/output/stat_boost/uncommon


/datum/design/organ/aberrant_organ/teratoma/output/reagents_blood/rare
	build_path = /obj/item/organ/internal/scaffold/aberrant/teratoma/output/reagents_blood/rare

/datum/design/organ/aberrant_organ/teratoma/output/reagents_ingest/rare
	build_path = /obj/item/organ/internal/scaffold/aberrant/teratoma/output/reagents_ingest/rare

/datum/design/organ/aberrant_organ/teratoma/output/chemical_effects/rare
	build_path = /obj/item/organ/internal/scaffold/aberrant/teratoma/output/chemical_effects/rare

/datum/design/organ/aberrant_organ/teratoma/output/stat_boost/rare
	build_path = /obj/item/organ/internal/scaffold/aberrant/teratoma/output/stat_boost/rare


/datum/design/organ/aberrant_organ/teratoma/special
	category = "Teratoma - Secondary"
	build_path = /obj/item/organ/internal/scaffold/aberrant/teratoma/special

/datum/design/organ/aberrant_organ/teratoma/special/chemical_effect
	build_path = /obj/item/organ/internal/scaffold/aberrant/teratoma/special/chemical_effect

/datum/design/organ/aberrant_organ/teratoma/special/stat_boost
	build_path = /obj/item/organ/internal/scaffold/aberrant/teratoma/special/stat_boost
