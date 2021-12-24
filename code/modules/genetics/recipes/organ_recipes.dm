/datum/genetics/mutation_recipe/combination/b_heart
	required_mutations = list(MUTATION_HEART, MUTATION_HYPERION)
	result_path = MUTATION_B_HEART
	blurb = "The Hyperion mutation can enhance cloned organs, like the Heart."

/datum/genetics/mutation_recipe/combination/g_lungs
	required_mutations = list(MUTATION_LUNG, MUTATION_HYPERION)
	result_path = MUTATION_G_LUNG
	blurb = "The Hyperion mutation can enhance cloned organs, like the Lungs."

/datum/genetics/mutation_recipe/combination/g_liver
	required_mutations = list(MUTATION_LIVER, MUTATION_HYPERION)
	result_path = MUTATION_G_LIVER
	blurb = "The Hyperion mutation can enhance cloned organs, like the Liver."

/datum/genetics/mutation_recipe/combination/e_blood_vessels
	required_mutations = list(MUTATION_BLOOD_VESSEL, MUTATION_HYPERION)
	result_path = MUTATION_E_BLOOD_VESSEL
	blurb = "The Hyperion mutation can enhance cloned organs, like the Blood Vessels."

/datum/genetics/mutation_recipe/combination/s_muscles
	required_mutations = list(MUTATION_MUSCLES, MUTATION_HYPERION)
	result_path = MUTATION_S_MUSCLES
	blurb = "The Hyperion mutation can enhance cloned organs, like the Muscles."

/datum/genetics/mutation_recipe/combination/s_nerves
	required_mutations = list(MUTATION_NERVES, MUTATION_HYPERION)
	result_path = MUTATION_S_NERVES
	blurb = "The Hyperion mutation can enhance cloned organs, like the Nerves."

/datum/genetics/mutation_recipe/irradiation/flesh_sac_player
	required_on_clone_types = list(/mob/living/carbon/human)
	result_path = MUTATION_SAC
	blurb = "Flesh sacs can be achieved through irradiated human DNA- if you're a bad person."

/datum/genetics/mutation_recipe/irradiation/flesh_sac_s_mob
	required_on_clone_types = list(/mob/living/carbon/superior_animal/human)
	result_path = MUTATION_SAC
	blurb = "Flesh sacs can be achieved through irradiated vatgrown DNA- if you're a morally ambiguous person."

/datum/genetics/mutation_recipe/combination/flesh_sac_greater
	required_mutations = list(MUTATION_HYPERION)
	required_on_clone_types = list(/obj/item/genetics/flesh_sac)
	result_path = MUTATION_G_SAC
	blurb = "Flesh sacs can be achieved through irradiated monkey DNA with only limited moral quandaries!"
