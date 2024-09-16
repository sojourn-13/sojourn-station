//======================================================================
//Roach Combinations
/datum/genetics/mutation_recipe/irradiation/roach
	required_on_clone_types = list(/mob/living/carbon/superior_animal/roach)

/datum/genetics/mutation_recipe/irradiation/roach/get_result()
	var/list/random_roach = pick(
		list("type" = /mob/living/carbon/superior_animal/roach, "name" = "Kampfer Roach"),
		list("type" = /mob/living/carbon/superior_animal/roach/fat, "name" = "Obese Kampfer Roach"),
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


//=======================
//gold roach
/datum/genetics/mutation_recipe/combination/golden_roach
	required_on_clone_types = list(/mob/living/carbon/superior_animal/roach, /mob/living/carbon/superior_animal/roach)
	result_path = MUTATION_GOLD_ROACH
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
		list("type" = /mob/living/carbon/superior_animal/giant_spider/nurse/cave_spider, "name" = "cave spider"),
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

//=======================
//Commented out for now pending discussion, but reaper spiders are supposed to be insanely rare and hyper intelligent. Cloning them ruins there fear factor.
//Reaper
/*
/datum/genetics/mutation_recipe/combination/reaper
	required_on_clone_types = list(
		/mob/living/carbon/superior_animal/giant_spider/tarantula/emperor,
		/mob/living/carbon/superior_animal/giant_spider/nurse/queen
	)
/datum/genetics/mutation_recipe/combination/reaper/get_result()
	return new /datum/genetics/mutation/copy_mob(/mob/living/carbon/superior_animal/giant_spider/tarantula/emperor/reaper_spider, "reaper spider")
*/

//======================================================================
//Termite Combinations
/datum/genetics/mutation_recipe/irradiation/termite
	required_on_clone_types = list(/mob/living/carbon/superior_animal/termite)

/datum/genetics/mutation_recipe/irradiation/termite/get_result()
	var/list/random_termite = pick(
		list("type" = /mob/living/carbon/superior_animal/termite, "name" = "Pekhota termite"),
		list("type" = /mob/living/carbon/superior_animal/termite/iron, "name" = "Pomoshchnik termite"),
		list("type" = /mob/living/carbon/superior_animal/termite/silver, "name" = "Pushka termite"),
		list("type" = /mob/living/carbon/superior_animal/termite/uranium, "name" = "Smertnik termite"),
		list("type" = /mob/living/carbon/superior_animal/termite/plasma, "name" = "Kop'ye termite"))
	var/datum/genetics/mutation/new_mutation = new /datum/genetics/mutation/copy_mob(random_termite["type"], random_termite["name"])
	return new_mutation
//=======================
//Queen
/datum/genetics/mutation_recipe/combination/queen_termite
	required_on_clone_types = list(/mob/living/carbon/superior_animal/termite/silver)
	required_mutations = list(MUTATION_GIGANTISM)

/datum/genetics/mutation_recipe/combination/queen_termite/get_result()
	return new /datum/genetics/mutation/copy_mob(/mob/living/carbon/superior_animal/termite/diamond, "Koroleva termite")
//=======================
//King
/datum/genetics/mutation_recipe/combination/king_termite
	required_on_clone_types = list(/mob/living/carbon/superior_animal/termite/plasma)
	required_mutations = list(MUTATION_GIGANTISM)

/datum/genetics/mutation_recipe/combination/king_termite/get_result()
	return new /datum/genetics/mutation/copy_mob(/mob/living/carbon/superior_animal/termite/osmium, "Korol termite")

//======================================================================
//Increase Cow.
/datum/genetics/mutation_recipe/combination/tatonka_1
	required_on_clone_types = list(/mob/living/simple_animal/cow, /mob/living/simple_animal/cow)

/datum/genetics/mutation_recipe/combination/tatonka_1/get_result()
	var/datum/genetics/mutation/new_mutation = new /datum/genetics/mutation/copy_mob(/mob/living/carbon/superior_animal/lodge/tatonka, "tatonka")
	return new_mutation
//====================
//Increase Cow FURTHER.
/datum/genetics/mutation_recipe/combination/tangu_1
	required_mutations = list(MUTATION_COW_SKIN, MUTATION_COW_SKIN)
	required_on_clone_types = list(/mob/living/carbon/superior_animal/lodge/tatonka)

/datum/genetics/mutation_recipe/combination/tangu_1/get_result()
	var/datum/genetics/mutation/new_mutation = new /datum/genetics/mutation/copy_mob(/mob/living/carbon/superior_animal/lodge/tatonka/tangu, "tangu")
	return new_mutation

//======================================================================
//Create Mukwah, so people can blame us for making them
/datum/genetics/mutation_recipe/irradiation/mukwah
	required_on_clone_types = list(/mob/living/simple_animal/hostile/bear)

/datum/genetics/mutation_recipe/irradiation/mukwah/get_result()
	var/datum/genetics/mutation/new_mutation = new /datum/genetics/mutation/copy_mob(/mob/living/simple_animal/hostile/bear/mukwah, "mukwah")
	return new_mutation

//======================================================================
//Doggos
/datum/genetics/mutation_recipe/irradiation/cerberus
	required_on_clone_types = list(/mob/living/simple_animal/pig)

/datum/genetics/mutation_recipe/irradiation/cerberus/get_result()
	var/datum/genetics/mutation/new_mutation = new /datum/genetics/mutation/copy_mob(/mob/living/carbon/superior_animal/lodge/cerberus, "cerberus")
	return new_mutation

/datum/genetics/mutation_recipe/combination/chimera
	required_on_clone_types = list(/mob/living/carbon/superior_animal/lodge/cerberus)
	required_mutations = list(MUTATION_NERVOUSNESS)

/datum/genetics/mutation_recipe/combination/chimera/get_result()
	var/datum/genetics/mutation/new_mutation = new /datum/genetics/mutation/copy_mob(/mob/living/carbon/superior_animal/lodge/cerberus/chimera, "chimera")
	return new_mutation

//======================================================================
//Chickos
/datum/genetics/mutation_recipe/irradiation/clucker
	required_on_clone_types = list(/mob/living/simple_animal/chicken)

/datum/genetics/mutation_recipe/irradiation/clucker/get_result()
	return new /datum/genetics/mutation/copy_mob(/mob/living/carbon/superior_animal/lodge/clucker, "Clucker")

//======================================================================
//Tengolos
/datum/genetics/mutation_recipe/irradiation/tengolo
	required_on_clone_types = list(/mob/living/simple_animal/hostile/diyaab)

/datum/genetics/mutation_recipe/irradiation/tengolo/get_result()
	var/list/random_tengolo = pick(
		list("type" = /mob/living/simple_animal/hostile/tengbrute, "name" = "Tengolo Brute"),
		list("type" = /mob/living/simple_animal/hostile/tengcharge, "name" = "Tengolo Charger"),
		list("type" = /mob/living/simple_animal/hostile/tengstalker, "name" = "Tengolo Stalker"))
	return new /datum/genetics/mutation/copy_mob(random_tengolo["type"], random_tengolo["name"])

//=======================
//Hell Pigs
/datum/genetics/mutation_recipe/combination/hell_pig
	required_on_clone_types = list(/mob/living/simple_animal/hostile/tengcharge, /mob/living/simple_animal/pig)

/datum/genetics/mutation_recipe/combination/hell_pig/get_result()
	return new /datum/genetics/mutation/copy_mob(/mob/living/simple_animal/hostile/hell_pig, "Hell Pig")
//=======================
/datum/genetics/mutation_recipe/combination/hell_pig_2
	required_on_clone_types = list(/mob/living/simple_animal/hostile/tengcharge, /mob/living/simple_animal/hostile/retaliate/tahca)

/datum/genetics/mutation_recipe/combination/hell_pig_2/get_result()
	return new /datum/genetics/mutation/copy_mob(/mob/living/simple_animal/hostile/hell_pig, "Hell Pig")
//=======================
/datum/genetics/mutation_recipe/combination/hell_pig_3
	required_on_clone_types = list(/mob/living/simple_animal/hostile/tengcharge)
	required_mutations = list(MUTATION_GIGANTISM)

/datum/genetics/mutation_recipe/combination/hell_pig_3/get_result()
	return new /datum/genetics/mutation/copy_mob(/mob/living/simple_animal/hostile/hell_pig, "Hell Pig")

//=======================
//Slepnir
/datum/genetics/mutation_recipe/combination/slepnir
	required_on_clone_types = list(/mob/living/simple_animal/hostile/tengbrute, /mob/living/simple_animal/pig)

/datum/genetics/mutation_recipe/combination/slepnir/get_result()
	return new /datum/genetics/mutation/copy_mob(/mob/living/simple_animal/hostile/hell_pig/slepnir, "Slepnir")
//=======================
/datum/genetics/mutation_recipe/combination/slepnir_2
	required_on_clone_types = list(/mob/living/simple_animal/hostile/tengbrute, /mob/living/simple_animal/hostile/retaliate/tahca)

/datum/genetics/mutation_recipe/combination/slepnir_2/get_result()
	return new /datum/genetics/mutation/copy_mob(/mob/living/simple_animal/hostile/hell_pig/slepnir, "Slepnir")
//=======================
/datum/genetics/mutation_recipe/combination/slepnir_3
	required_on_clone_types = list(/mob/living/simple_animal/hostile/tengbrute)
	required_mutations = list(MUTATION_GIGANTISM)

/datum/genetics/mutation_recipe/combination/slepnir_3/get_result()
	return new /datum/genetics/mutation/copy_mob(/mob/living/simple_animal/hostile/hell_pig/slepnir, "Slepnir")

//=======================
//Wendigo
/datum/genetics/mutation_recipe/combination/wendigo
	required_on_clone_types = list(/mob/living/simple_animal/hostile/tengstalker, /mob/living/simple_animal/pig)

/datum/genetics/mutation_recipe/combination/wendigo/get_result()
	return new /datum/genetics/mutation/copy_mob(/mob/living/simple_animal/hostile/hell_pig/wendigo, "Wendigo")
//=======================
/datum/genetics/mutation_recipe/combination/wendigo_2
	required_on_clone_types = list(/mob/living/simple_animal/hostile/tengstalker, /mob/living/simple_animal/hostile/retaliate/tahca)

/datum/genetics/mutation_recipe/combination/wendigo_2/get_result()
	return new /datum/genetics/mutation/copy_mob(/mob/living/simple_animal/hostile/hell_pig/wendigo, "Wendigo")
//=======================
/datum/genetics/mutation_recipe/combination/wendigo_3
	required_on_clone_types = list(/mob/living/simple_animal/hostile/tengstalker)
	required_mutations = list(MUTATION_GIGANTISM)

/datum/genetics/mutation_recipe/combination/wendigo_3/get_result()
	return new /datum/genetics/mutation/copy_mob(/mob/living/simple_animal/hostile/hell_pig/wendigo, "Wendigo")

//======================================================================
//Croaker lord
/datum/genetics/mutation_recipe/combination/croaker_lord
	required_on_clone_types = list(/mob/living/simple_animal/frog)
	required_mutations = list(MUTATION_GIGANTISM)

/datum/genetics/mutation_recipe/combination/croaker_lord/get_result()
	return new /datum/genetics/mutation/copy_mob(/mob/living/simple_animal/hostile/retaliate/croakerlord, "croaker lord")

//======================================================================
//Nightmare Stalkers
/datum/genetics/mutation_recipe/combination/dream_daemon
	required_on_clone_types = list(/mob/living/simple_animal/hostile/nightmare)
	required_mutations = list(MUTATION_EMP)

/datum/genetics/mutation_recipe/combination/dream_daemon/get_result()
	return new /datum/genetics/mutation/copy_mob(/mob/living/simple_animal/hostile/nightmare/dream_daemon, "dream daemon")

//======================================================================
//Bears
/datum/genetics/mutation_recipe/combination/bear
	required_on_clone_types = list(/mob/living/simple_animal/corgi)
	required_mutations = list(MUTATION_GIGANTISM)

/datum/genetics/mutation_recipe/combination/bear/get_result()
	return new /datum/genetics/mutation/copy_mob(/mob/living/simple_animal/hostile/bear, "bear")
//=======================
/datum/genetics/mutation_recipe/combination/bear_brown
	required_on_clone_types = list(/mob/living/simple_animal/hostile/bear)
	required_mutations = list(MUTATION_CHOC_MILK)

/datum/genetics/mutation_recipe/combination/bear_brown/get_result()
	return new /datum/genetics/mutation/copy_mob(/mob/living/simple_animal/hostile/bear/brown, "brown bear")
//=======================
/datum/genetics/mutation_recipe/combination/bear_polar
	required_on_clone_types = list(/mob/living/simple_animal/hostile/bear)
	required_mutations = list(MUTATION_ROBUST_MILK)

/datum/genetics/mutation_recipe/combination/bear_polar/get_result()
	return new /datum/genetics/mutation/copy_mob(/mob/living/simple_animal/hostile/bear/polar, "polar bear")

//=======================
//chicks to chickens
/datum/genetics/mutation_recipe/combination/chicken
	required_on_clone_types = list(/mob/living/simple_animal/chick)
	required_mutations = list(MUTATION_GIGANTISM)

/datum/genetics/mutation_recipe/combination/chicken/get_result()
	return new /datum/genetics/mutation/copy_mob(/mob/living/simple_animal/chick, "chicken")

//=======================
//chickens to bat
/datum/genetics/mutation_recipe/combination/bat
	required_on_clone_types = list(/mob/living/simple_animal/chicken)
	required_mutations = list(MUTATION_COW_SKIN)

/datum/genetics/mutation_recipe/combination/bat/get_result()
	return new /datum/genetics/mutation/copy_mob(/mob/living/simple_animal/hostile/scarybat, "bats")

//=======================
//bat to sargoyle
/datum/genetics/mutation_recipe/combination/sargoyle
	required_on_clone_types = list(/mob/living/simple_animal/hostile/scarybat)
	required_mutations = list(MUTATION_GIGANTISM)

/datum/genetics/mutation_recipe/combination/sargoyle/get_result()
	return new /datum/genetics/mutation/copy_mob(/mob/living/simple_animal/hostile/sargoyle, "sargoyle")

//======================================================================
//Snake
/datum/genetics/mutation_recipe/combination/snake
	required_on_clone_types = list(/mob/living/simple_animal/hostile/snake)
	required_mutations = list(MUTATION_GIGANTISM)

/datum/genetics/mutation_recipe/combination/snake/get_result()
	return new /datum/genetics/mutation/copy_mob(/mob/living/simple_animal/hostile/giant_snake, "giant snake")

//======================================================================
//mouse to possom
/datum/genetics/mutation_recipe/combination/mouse
	required_on_clone_types = list(/mob/living/simple_animal/mouse)
	required_mutations = list(MUTATION_GIGANTISM)

/datum/genetics/mutation_recipe/combination/mouse/get_result()
	return new /datum/genetics/mutation/copy_mob(/mob/living/simple_animal/opossum, "opossom")

//======================================================================
//cat and panther
/datum/genetics/mutation_recipe/combination/kitten
	required_on_clone_types = list(/mob/living/simple_animal/cat)
	required_mutations = list(MUTATION_DWARFISM)

/datum/genetics/mutation_recipe/combination/kitten/get_result()
	return new /datum/genetics/mutation/copy_mob(/mob/living/simple_animal/cat/kitten, "kitten")

/datum/genetics/mutation_recipe/combination/cat
	required_on_clone_types = list(/mob/living/simple_animal/cat/kitten)
	required_mutations = list(MUTATION_GIGANTISM)

/datum/genetics/mutation_recipe/combination/cat/get_result()
	return new /datum/genetics/mutation/copy_mob(/mob/living/simple_animal/cat, "cat")

/datum/genetics/mutation_recipe/combination/panther
	required_on_clone_types = list(/mob/living/simple_animal/cat)
	required_mutations = list(MUTATION_GIGANTISM)

/datum/genetics/mutation_recipe/combination/panther/get_result()
	return new /datum/genetics/mutation/copy_mob(/mob/living/simple_animal/hostile/panther, "panther")
