/datum/genetics/mutation_recipe/combination/blood_river
	required_mutations = list(MUTATION_BLOOD_BANK, MUTATION_BLOOD_BANK)
	result_path = MUTATION_BLOOD_RIVER

/datum/genetics/mutation_recipe/combination/blood_lake
	required_mutations = list(MUTATION_BLOOD_RIVER, MUTATION_BLOOD_RIVER)
	result_path = MUTATION_BLOOD_LAKE

/datum/genetics/mutation_recipe/combination/blood_sea
	required_mutations = list(MUTATION_BLOOD_LAKE, MUTATION_BLOOD_LAKE)
	result_path = MUTATION_BLOOD_SEA

/datum/genetics/mutation_recipe/combination/blood_temple
	required_mutations = list(MUTATION_BLOOD_SEA, MUTATION_BLOOD_SEA)
	result_path = MUTATION_BLOOD_TEMPLE

/datum/genetics/mutation_recipe/combination/vampire
	required_mutations = list(MUTATION_CAT_EYES, MUTATION_BLOOD_BANK, MUTATION_BOTTOMLESS_BELLY)
	result_path = MUTATION_VAMPIRE