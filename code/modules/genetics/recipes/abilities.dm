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

/datum/genetics/mutation_recipe/combination/friendly
	required_on_clone_types = list(/mob/living/carbon/superior_animal/roach/golden)
	required_mutations = list(MUTATION_IMBECILE)
	result_path = MUTATION_FRIENDLY

/datum/genetics/mutation_recipe/irradiation/no_breath
	required_mutations = list(MUTATION_BAROTRAUMA)
	result_path = MUTATION_NO_BREATHE

/datum/genetics/mutation_recipe/irradiation/phasing
	required_mutations = list(MUTATION_GREATER_CLOAKING)
	result_path = MUTATION_PHASE

/datum/genetics/mutation_recipe/combination/phasing
	required_mutations = list(MUTATION_CLOAKING, MUTATION_HYPERION)
	result_path = MUTATION_PHASE
