/datum/genetics/mutation_recipe/irradiation/roach
	required_on_clone_types = list(/mob/living/carbon/superior_animal/roach)

/datum/genetics/mutation_recipe/irradiation/roach/get_result()
	var/list/random_roach = pick(
		list("type" = /mob/living/carbon/superior_animal/roach, "name" = "Kampfer Roach"),
		list("type" = /mob/living/carbon/superior_animal/roach/tank, "name" = "Panzer Roach"),
		list("type" = /mob/living/carbon/superior_animal/roach/toxic, "name" = "Gestrahlte Roach"),
		list("type" = /mob/living/carbon/superior_animal/roach/glowing, "name" = "Gluhend Roach"),
		list("type" = /mob/living/carbon/superior_animal/roach/nanite, "name" = "Kraftwerk Roach"),
		list("type" = /mob/living/carbon/superior_animal/roach/hunter, "name" = "Jager Roach"),
		list("type" = /mob/living/carbon/superior_animal/roach/support, "name" = "Seuche Roach"),
		list("type" = /mob/living/carbon/superior_animal/roach/fuhrer, "name" = "Fuhrer Roach"))
	var/datum/genetics/mutation/new_mutation = new /datum/genetics/mutation/copy_mob(random_roach["type"], random_roach["name"])
	return new_mutation

//Increase Cow.
/datum/genetics/mutation_recipe/combination/tatonka_1
	required_on_clone_types = list(/mob/living/simple_animal/cow, /mob/living/simple_animal/cow)

/datum/genetics/mutation_recipe/combination/tatonka_1/get_result()
	var/datum/genetics/mutation/new_mutation = new /datum/genetics/mutation/copy_mob(/mob/living/carbon/superior_animal/lodge/tatonka, "tatonka")
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

/datum/genetics/mutation_recipe/irradiation/cerberus
	required_on_clone_types = list(/mob/living/simple_animal/pig)

/datum/genetics/mutation_recipe/irradiation/cerberus/get_result()
	var/datum/genetics/mutation/new_mutation = new /datum/genetics/mutation/copy_mob(/mob/living/carbon/superior_animal/lodge/cerberus, "Cerberus")
	return new_mutation

/datum/genetics/mutation_recipe/combination/chimera
	required_on_clone_types = list(/mob/living/carbon/superior_animal/lodge/cerberus)
	required_mutations = list(MUTATION_NERVOUSNESS)

/datum/genetics/mutation_recipe/combination/chimera/get_result()
	var/datum/genetics/mutation/new_mutation = new /datum/genetics/mutation/copy_mob(/mob/living/carbon/superior_animal/lodge/cerberus, "Cerberus")
	return new_mutation

/datum/genetics/mutation_recipe/irradiation/clucker
	required_on_clone_types = list(/mob/living/simple_animal/chicken)

/datum/genetics/mutation_recipe/irradiation/clucker/get_result()
	var/datum/genetics/mutation/new_mutation = new /datum/genetics/mutation/copy_mob(/mob/living/carbon/superior_animal/lodge/clucker, "Clucker")
	return new_mutation