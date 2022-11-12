//File for all recipies that consist of combinations of genes that produce abilities.

/datum/genetics/mutation_recipe/combination/wurm_cry
	required_mutations = list(MUTATION_SCREAMING, MUTATION_TERMITE_FRIEND)
	result_path = MUTATION_WURM_CRY

/datum/genetics/mutation_recipe/combination/spark_breath
	required_on_clone_types = list(/mob/living/carbon/superior_animal/giant_spider/hunter/shocker)
	required_mutations = list(MUTATION_PSN_BREATH)
	result_path = MUTATION_SPARK_BREATH

/datum/genetics/mutation_recipe/combination/flame_retardant
	required_on_clone_types = list(/mob/living/carbon/superior_animal/giant_spider/hunter/pepper)
	required_mutations = list(MUTATION_IMBECILE)
	result_path = MUTATION_FLAME_RETARDANT
