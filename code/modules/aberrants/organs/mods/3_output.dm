/obj/item/modification/organ/internal/output
	name = "organoid (output)"
	icon_state = "output_organoid"

/obj/item/modification/organ/internal/output/reagents_blood
	name = "hepatic organoid"
	desc = "Functional tissue of one or more organs in graftable form. Secretes reagents into the bloodstream."

/obj/item/modification/organ/internal/output/reagents_blood/New(loc, generate_organ_stats = FALSE, predefined_modifier = null, list/output_types)
	var/datum/component/modification/organ/output/reagents_blood/O = AddComponent(/datum/component/modification/organ/output/reagents_blood)

	for(var/output in output_types)
		O.possible_outputs += output
		O.possible_outputs[output] = output_types[output]
	..()

/obj/item/modification/organ/internal/output/reagents_ingest
	name = "gastric organoid"
	desc = "Functional tissue of one or more organs in graftable form. Produces reagents in the stomach."

/obj/item/modification/organ/internal/output/reagents_ingest/New(loc, generate_organ_stats = FALSE, predefined_modifier = null, list/output_types)
	var/datum/component/modification/organ/output/reagents_ingest/O = AddComponent(/datum/component/modification/organ/output/reagents_ingest)

	for(var/output in output_types)
		O.possible_outputs += output
		O.possible_outputs[output] = output_types[output]
	..()

/obj/item/modification/organ/internal/output/chemical_effects
	name = "endocrinal organoid"
	desc = "Functional tissue of one or more organs in graftable form. Secretes hormones."

/obj/item/modification/organ/internal/output/chemical_effects/New(loc, generate_organ_stats = FALSE, predefined_modifier = null, list/output_types)
	var/datum/component/modification/organ/output/chemical_effects/O = AddComponent(/datum/component/modification/organ/output/chemical_effects)

	for(var/output in output_types)
		O.possible_outputs += output
		O.possible_outputs[output] = ALL_USABLE_POSITIVE_CHEM_EFFECTS[output]
	..()

/obj/item/modification/organ/internal/output/stat_boost
	name = "superior endocrinal organoid"
	desc = "Functional tissue of one or more organs in graftable form. Secretes stimulating hormones."

/obj/item/modification/organ/internal/output/stat_boost/New(loc, generate_organ_stats = FALSE, predefined_modifier = null, list/output_types)
	var/datum/component/modification/organ/output/stat_boost/O = AddComponent(/datum/component/modification/organ/output/stat_boost)

	for(var/output in output_types)
		O.possible_outputs += output
		O.possible_outputs[output] = output_types[output]
	..()

/obj/item/modification/organ/internal/output/damaging_insight_gain
	name = "enigmatic organoid"
	desc = "Functional tissue of one or more organs in graftable form. It's function is unknown."

/obj/item/modification/organ/internal/output/damaging_insight_gain/New(loc, generate_organ_stats = FALSE, predefined_modifier = null, list/output_types)
	var/datum/component/modification/organ/output/damaging_insight_gain/O = AddComponent(/datum/component/modification/organ/output/damaging_insight_gain)

	for(var/output in output_types)
		O.possible_outputs += output
		O.possible_outputs[output] = output_types[output]
	..()

/obj/item/modification/organ/internal/output/activate_organ_functions
	name = "dependent organoid"
	desc = "Functional tissue of one or more organs in graftable form. Only performs organ functions when triggered."

/obj/item/modification/organ/internal/output/activate_organ_functions/New(loc, generate_organ_stats = FALSE, predefined_modifier = null, list/output_types)
	var/datum/component/modification/organ/output/activate_organ_functions/O = AddComponent(/datum/component/modification/organ/output/activate_organ_functions)

	for(var/output in output_types)
		var/modifier = output_types[output]
		var/list/organ_stats = ALL_ORGAN_STATS[output]
		O.active_organ_efficiency_mod.Add(output)
		O.active_organ_efficiency_mod[output] = organ_stats[1] * modifier
		O.active_blood_req_mod = organ_stats[4] * modifier
		O.active_nutriment_req_mod = organ_stats[5] * modifier
		O.active_oxygen_req_mod = organ_stats[6] * modifier
		O.active_owner_verb_adds = organ_stats[8]
		O.new_name = output
	..()
