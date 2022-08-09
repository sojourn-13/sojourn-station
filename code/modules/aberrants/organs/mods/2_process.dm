/obj/item/modification/organ/internal/process
	name = "organoid (processing)"
	icon_state = "process_organoid"

/obj/item/modification/organ/internal/process/boost
	name = "enzymal organoid"
	desc = "Functional tissue of one or more organs in graftable form. Accelerates biochemical processes, increasing output magnitude."

/obj/item/modification/organ/internal/process/boost/New(loc, generate_organ_stats = TRUE, predefined_modifier = null, list/process_info)
	var/datum/component/modification/organ/process/boost/P = AddComponent(/datum/component/modification/organ/process/boost)

	P.multiplier = process_info.len ? process_info[1] : 0.20
	..()

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
