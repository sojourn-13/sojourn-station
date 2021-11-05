//Roach Combinations
//=======================
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
		list("type" = /mob/living/carbon/superior_animal/roach/elektromagnetisch, "name" = "Elektromagnetisch Roach"),
		list("type" = /mob/living/carbon/superior_animal/roach/fuhrer, "name" = "Fuhrer Roach"))
	var/datum/genetics/mutation/new_mutation = new /datum/genetics/mutation/copy_mob(random_roach["type"], random_roach["name"])
	return new_mutation
//=======================
//kaiser
/datum/genetics/mutation_recipe/combination/kaiser
	required_on_clone_types = list(/mob/living/carbon/superior_animal/roach)
	required_mutations = list(MUTATION_GIGANTISM)

/datum/genetics/mutation_recipe/combination/kaiser/get_result()
	return new /datum/genetics/mutation/copy_mob(/mob/living/carbon/superior_animal/roach/kaiser, "kaiser roach")


//======================================================================
//Spider Combinations
/datum/genetics/mutation_recipe/irradiation/spider
	required_on_clone_types = list(/mob/living/carbon/superior_animal/giant_spider)

/datum/genetics/mutation_recipe/irradiation/spider/get_result()
	var/list/random_spider = pick(
		list("type" = /mob/living/carbon/superior_animal/giant_spider, "name" = "guardian spider"),
		list("type" = /mob/living/carbon/superior_animal/giant_spider/nurse/carrier, "name" = "carrier spider"),
		list("type" = /mob/living/carbon/superior_animal/giant_spider/nurse, "name" = "nurse spider"),
		list("type" = /mob/living/carbon/superior_animal/giant_spider/nurse/midwife, "name" = "midwife spider"),
		list("type" = /mob/living/carbon/superior_animal/giant_spider/nurse/orb_weaver, "name" = "orb weaver spider"),
		list("type" = /mob/living/carbon/superior_animal/giant_spider/nurse/recluse, "name" = "recluse spider"),
		list("type" = /mob/living/carbon/superior_animal/giant_spider/plasma, "name" = "plasma spider"),
		list("type" = /mob/living/carbon/superior_animal/giant_spider/hunter, "name" = "hunter spider"),
		list("type" = /mob/living/carbon/superior_animal/giant_spider/hunter/cloaker, "name" = "cloaker spider"),
		list("type" = /mob/living/carbon/superior_animal/giant_spider/hunter/viper, "name" = "viper spider"),
		list("type" = /mob/living/carbon/superior_animal/giant_spider/hunter/shocker, "name" = "shocker spider"),
		list("type" = /mob/living/carbon/superior_animal/giant_spider/hunter/pepper, "name" = "pepper spider"),
		list("type" = /mob/living/carbon/superior_animal/giant_spider/tarantula, "name" = "fortress spider"),
		list("type" = /mob/living/carbon/superior_animal/giant_spider/tarantula/ogre, "name" = "ogre spider"),
		list("type" = /mob/living/carbon/superior_animal/giant_spider/tarantula/pit, "name" = "pit snapper spider"),
		list("type" = /mob/living/carbon/superior_animal/giant_spider/tarantula/burrowing, "name" = "trapdoor spider"))
	var/datum/genetics/mutation/new_mutation = new /datum/genetics/mutation/copy_mob(random_spider["type"], random_spider["name"])
	return new_mutation
//=======================
//Empress
/datum/genetics/mutation_recipe/combination/queen_spider
	required_on_clone_types = list(/mob/living/carbon/superior_animal/giant_spider/nurse)
	required_mutations = list(MUTATION_GIGANTISM)

/datum/genetics/mutation_recipe/combination/queen_spider/get_result()
	return new /datum/genetics/mutation/copy_mob(/mob/living/carbon/superior_animal/giant_spider/nurse/queen, "empress spider")

//=======================
//Emperor
/datum/genetics/mutation_recipe/combination/emperor_spider
	required_on_clone_types = list(/mob/living/carbon/superior_animal/giant_spider/tarantula)
	required_mutations = list(MUTATION_GIGANTISM)

/datum/genetics/mutation_recipe/combination/emperor_spider/get_result()
	return new /datum/genetics/mutation/copy_mob(/mob/living/carbon/superior_animal/giant_spider/tarantula/emperor, "emperor spider")
//======================================================================
//Increase Cow.
/datum/genetics/mutation_recipe/combination/tatonka_1
	required_on_clone_types = list(/mob/living/simple_animal/cow, /mob/living/simple_animal/cow)

/datum/genetics/mutation_recipe/combination/tatonka_1/get_result()
	var/datum/genetics/mutation/new_mutation = new /datum/genetics/mutation/copy_mob(/mob/living/carbon/superior_animal/lodge/tatonka, "tatonka")
	return new_mutation
//=======================
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