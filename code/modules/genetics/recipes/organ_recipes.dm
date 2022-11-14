/datum/genetics/mutation_recipe/combination/b_heart
	required_mutations = list(MUTATION_HEART, MUTATION_HYPERION)
	result_path = MUTATION_B_HEART

/datum/genetics/mutation_recipe/combination/g_lungs
	required_mutations = list(MUTATION_LUNG, MUTATION_HYPERION)
	result_path = MUTATION_G_LUNG

/datum/genetics/mutation_recipe/combination/g_liver
	required_mutations = list(MUTATION_LIVER, MUTATION_HYPERION)
	result_path = MUTATION_G_LIVER
/datum/genetics/mutation_recipe/combination/e_blood_vessels
	required_mutations = list(MUTATION_BLOOD_VESSEL, MUTATION_HYPERION)
	result_path = MUTATION_E_BLOOD_VESSEL

/datum/genetics/mutation_recipe/combination/s_muscles
	required_mutations = list(MUTATION_MUSCLES, MUTATION_HYPERION)
	result_path = MUTATION_S_MUSCLES

/datum/genetics/mutation_recipe/combination/s_nerves
	required_mutations = list(MUTATION_NERVES, MUTATION_HYPERION)
	result_path = MUTATION_S_NERVES

/datum/genetics/mutation_recipe/combination/marqua_eyes
	required_mutations = list(MUTATION_EYES, MUTATION_HYPERION)
	result_path = MUTATION_MARQUA_EYES

/datum/genetics/mutation_recipe/irradiation/flesh_sac_player
	required_on_clone_types = list(/mob/living/carbon/human)
	result_path = MUTATION_SAC

/datum/genetics/mutation_recipe/irradiation/flesh_sac_s_mob
	required_on_clone_types = list(/mob/living/carbon/superior_animal/human)
	result_path = MUTATION_SAC

/datum/genetics/mutation_recipe/combination/flesh_sac_greater
	required_mutations = list(MUTATION_HYPERION)
	required_on_clone_types = list(/obj/item/genetics/flesh_sac)
	result_path = MUTATION_G_SAC
