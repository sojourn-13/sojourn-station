//Increase Cow.
/datum/genetics/mutation_recipe/combination/tatonka_1
	required_on_clone_types = list(/mob/living/simple_animal/cow, /mob/living/simple_animal/cow)

/datum/genetics/mutation_recipe/combination/tatonka_1/get_result()
	var/datum/genetics/mutation/new_mutation = new /datum/genetics/mutation/copy_mob(/mob/living/carbon/superior_animal/lodge/tatonka, "tatonka")
	log_debug("made new mutation: new_mutation")
	return new_mutation

//Increase Cow FURTHER.
/datum/genetics/mutation_recipe/combination/tangu_1
	required_mutations = list(MUTATION_COW_SKIN, MUTATION_COW_SKIN)
	required_on_clone_types = list(/mob/living/carbon/superior_animal/lodge/tatonka)

/datum/genetics/mutation_recipe/combination/tangu_1/get_result()
	var/datum/genetics/mutation/new_mutation = new /datum/genetics/mutation/copy_mob(/mob/living/carbon/superior_animal/lodge/tatonka/tangu, "tatonka")
	return new_mutation

//Create Mukwah, so people can blame us for making them
/datum/genetics/mutation_recipe/irradiation/mukwah
	required_on_clone_types = list(/mob/living/simple_animal/hostile/bear)

/datum/genetics/mutation_recipe/irradiation/mukwah/get_result()
	var/datum/genetics/mutation/new_mutation = new /datum/genetics/mutation/copy_mob(/mob/living/simple_animal/hostile/bear/mukwah, "Mukwah")
	return new_mutation