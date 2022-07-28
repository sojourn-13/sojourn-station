/obj/item/modification/organ/internal/process
	name = "organoid (processing)"
	icon_state = "process_organoid"

/*
/obj/item/modification/organ/internal/process/arithmetic
/obj/item/modification/organ/internal/process/arithmetic/New(loc, generate_organ_stats = TRUE, predefined_modifier = null, list/process_info)
	..()
	if(!process_info || process_info.len < 2)
		return
	
	var/datum/component/modification/organ/process/arithmetic/PA = AddComponent(/datum/component/modification/organ/process/arithmetic)

	if(generate_organ_stats)
		generate_organ_stats_for_mod(PA, predefined_modifier)

	PA.coefficient = process_info[1]
	PA.constant = process_info[2]
*/
	
/obj/item/modification/organ/internal/process/condense
	name = "sphincter organoid"
	desc = "Functional tissue of one or more organs in graftable form. Connects multiple inputs to a single output."

/obj/item/modification/organ/internal/process/condense/New(loc, generate_organ_stats = TRUE, predefined_modifier = null)
	AddComponent(/datum/component/modification/organ/process/condense)
	..()

/obj/item/modification/organ/internal/process/shuffle
	name = "tubular organoid"
	desc = "Functional tissue of one or more organs in graftable form. Randomly connects multiple inputs to multiple outputs."

/obj/item/modification/organ/internal/process/shuffle/New(loc, generate_organ_stats = TRUE, predefined_modifier = null, list/process_info)
	var/datum/component/modification/organ/process/shuffle/P = AddComponent(/datum/component/modification/organ/process/shuffle)

	P.num_outputs = process_info[1]
	..()
