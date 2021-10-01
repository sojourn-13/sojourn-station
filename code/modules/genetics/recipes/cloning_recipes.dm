//Increase Cow.
/datum/genetics/mutation_recipe/combination/tatonka_1
	required_on_clone_types = list(/mob/living/simple_animal/cow, /mob/living/simple_animal/cow)

/datum/genetics/mutation_recipe/combination/tatonka/get_result_path()
	return new /datum/genetics/mutation/copy_mob(/mob/living/carbon/superior_animal/lodge/tatonka, "tatonka")

//Increase Cow FURTHER.
/datum/genetics/mutation_recipe/combination/tangu_1
	required_mutations = list(MUTATION_COW_SKIN, MUTATION_COW_SKIN)
	required_on_clone_types = list(/mob/living/carbon/superior_animal/lodge/tatonka)

/datum/genetics/mutation_recipe/combination/tatonka/get_result_path()
	return new /datum/genetics/mutation/copy_mob(/mob/living/carbon/superior_animal/lodge/tatonka/tangu, "tatonka")
