/obj/item/modification/organ/internal/input
	name = "organoid (input)"
	icon_state = "input_organoid"

/obj/item/modification/organ/internal/input/reagents
	name = "enzymal organoid"
	desc = "Functional tissue of one or more organs in graftable form. Enhances metabolism of reagents."

/obj/item/modification/organ/internal/input/reagents/New(loc, generate_organ_stats = FALSE, predefined_modifier = null, list/chosen_input_info, chosen_mode)
	var/datum/component/modification/organ/input/reagents/I = AddComponent(/datum/component/modification/organ/input/reagents)

	for(var/input in chosen_input_info)
		I.accepted_inputs += input
		I.accepted_inputs[input] = chosen_input_info[input]
	I.check_mode = chosen_mode
	..()

/obj/item/modification/organ/internal/input/consume_reagents
	name = "metabolic organoid"
	desc = "Functional tissue of one or more organs in graftable form. Consumes reagents in large quantities."

/obj/item/modification/organ/internal/input/consume_reagents/New(loc, generate_organ_stats = FALSE, predefined_modifier = null, list/chosen_input_info, chosen_mode)
	var/datum/component/modification/organ/input/consume_reagents/I = AddComponent(/datum/component/modification/organ/input/consume_reagents)

	for(var/input in chosen_input_info)
		I.accepted_inputs += input
		I.accepted_inputs[input] = chosen_input_info[input]
	I.check_mode = chosen_mode
	..()

/obj/item/modification/organ/internal/input/damage
	name = "nociceptive organoid"
	desc = "Functional tissue of one or more organs in graftable form. Responds to damaging stimuli."

/obj/item/modification/organ/internal/input/damage/New(loc, generate_organ_stats = FALSE, predefined_modifier = null, list/chosen_input_info)
	var/datum/component/modification/organ/input/damage/I = AddComponent(/datum/component/modification/organ/input/damage)

	for(var/input in chosen_input_info)
		I.accepted_inputs += input
		I.accepted_inputs[input] = chosen_input_info[input]
	..()

/obj/item/modification/organ/internal/input/power_source
	name = "bioelectric organoid"
	desc = "Functional tissue of one or more organs in graftable form. Converts power sources into bioavailable nutrients."
	icon_state = "input_organoid-hive"

/obj/item/modification/organ/internal/input/power_source/New(loc, generate_organ_stats = FALSE, predefined_modifier = null, list/chosen_input_info)
	var/datum/component/modification/organ/input/power_source/I = AddComponent(/datum/component/modification/organ/input/power_source)

	for(var/input in chosen_input_info)
		if(!ispath(input))
			continue
		I.accepted_inputs += input	// source path
	..()

/obj/item/modification/organ/internal/input/power_source/update_icon()
	return
