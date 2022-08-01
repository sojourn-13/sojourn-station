/obj/item/organ/internal/scaffold/aberrant/living_failure_brain
	name = "living failure's brain"
	desc = "The center of a living failure's nervous system. It hurts to look at."
	ruined_name = "living failure's brain (altered)"
	ruined_desc = "The center of a living failure's nervous system. It bears evidence of tampering and may not function as it once did."
	icon_state = "living_failure_brain"
	price_tag = 3000
	specific_organ_size = 1
	max_blood_storage = 40
	current_blood = 100
	blood_req = 4
	nutriment_req = 3
	oxygen_req = 4
	max_upgrades = 4

	use_generated_name = FALSE
	use_generated_icon = FALSE
	use_generated_color = FALSE

	input_mod_path = /obj/item/modification/organ/internal/input/damage
	process_mod_path = /obj/item/modification/organ/internal/process/condense
	output_mod_path = /obj/item/modification/organ/internal/output/damaging_insight_gain
	special_mod_path = /obj/item/modification/organ/internal/special/on_examine/brainloss

	specific_input_type_pool = list(CLONE)
	input_mode = NOT_USED
	process_info = list(1, 0)
	output_pool = list(PSY)
	output_info = list(2)
