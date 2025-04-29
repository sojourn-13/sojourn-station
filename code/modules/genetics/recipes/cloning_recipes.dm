//A-Z required
//======================================================================
//Roach Combinations
/datum/genetics/mutation_recipe/irradiation/roach
	required_on_clone_types = list(/mob/living/carbon/superior/roach)

/datum/genetics/mutation_recipe/irradiation/roach/get_result()
	var/list/random_roach = pick(
		list("type" = /mob/living/carbon/superior/roach, "name" = "Kampfer Roach"),
		list("type" = /mob/living/carbon/superior/roach/fat, "name" = "Obese Kampfer Roach"),
		list("type" = /mob/living/carbon/superior/roach/tank, "name" = "Panzer Roach"),
		list("type" = /mob/living/carbon/superior/roach/toxic, "name" = "Gestrahlte Roach"),
		list("type" = /mob/living/carbon/superior/roach/glowing, "name" = "Gluhend Roach"),
		list("type" = /mob/living/carbon/superior/roach/nanite, "name" = "Kraftwerk Roach"),
		list("type" = /mob/living/carbon/superior/roach/hunter, "name" = "Jager Roach"),
		list("type" = /mob/living/carbon/superior/roach/support, "name" = "Seuche Roach"),
		list("type" = /mob/living/carbon/superior/roach/elektromagnetisch, "name" = "Elektromagnetisch Roach"),
		list("type" = /mob/living/carbon/superior/roach/fuhrer, "name" = "Fuhrer Roach"))
	var/datum/genetics/mutation/new_mutation = new /datum/genetics/mutation/copy_mob(random_roach["type"], random_roach["name"])
	return new_mutation
//=======================
//kaiser
/datum/genetics/mutation_recipe/combination/kaiser
	required_on_clone_types = list(/mob/living/carbon/superior/roach)
	required_mutations = list(MUTATION_GIGANTISM)

/datum/genetics/mutation_recipe/combination/kaiser/get_result()
	return new /datum/genetics/mutation/copy_mob(/mob/living/carbon/superior/roach/kaiser, "kaiser roach")


//=======================
//gold roach
/datum/genetics/mutation_recipe/combination/golden_roach
	required_on_clone_types = list(/mob/living/carbon/superior/roach, /mob/living/carbon/superior/roach)
	result_path = MUTATION_GOLD_ROACH
//======================================================================
//Spider Combinations
/datum/genetics/mutation_recipe/irradiation/spider
	required_on_clone_types = list(/mob/living/carbon/superior/spider)

/datum/genetics/mutation_recipe/irradiation/spider/get_result()
	var/list/random_spider = pick(
		list("type" = /mob/living/carbon/superior/spider, "name" = "guardian spider"),
		list("type" = /mob/living/carbon/superior/spider/nurse/carrier, "name" = "carrier spider"),
		list("type" = /mob/living/carbon/superior/spider/nurse, "name" = "nurse spider"),
		list("type" = /mob/living/carbon/superior/spider/nurse/midwife, "name" = "midwife spider"),
		list("type" = /mob/living/carbon/superior/spider/nurse/cave_spider, "name" = "cave spider"),
		list("type" = /mob/living/carbon/superior/spider/nurse/orb_weaver, "name" = "orb weaver spider"),
		list("type" = /mob/living/carbon/superior/spider/nurse/recluse, "name" = "recluse spider"),
		list("type" = /mob/living/carbon/superior/spider/plasma, "name" = "plasma spider"),
		list("type" = /mob/living/carbon/superior/spider/hunter, "name" = "hunter spider"),
		list("type" = /mob/living/carbon/superior/spider/hunter/cloaker, "name" = "cloaker spider"),
		list("type" = /mob/living/carbon/superior/spider/hunter/viper, "name" = "viper spider"),
		list("type" = /mob/living/carbon/superior/spider/hunter/shocker, "name" = "shocker spider"),
		list("type" = /mob/living/carbon/superior/spider/hunter/pepper, "name" = "pepper spider"),
		list("type" = /mob/living/carbon/superior/spider/fortress, "name" = "fortress spider"),
		list("type" = /mob/living/carbon/superior/spider/fortress/ogre, "name" = "ogre spider"),
		list("type" = /mob/living/carbon/superior/spider/fortress/pit, "name" = "pit snapper spider"),
		list("type" = /mob/living/carbon/superior/spider/fortress/burrowing, "name" = "trapdoor spider"))
	var/datum/genetics/mutation/new_mutation = new /datum/genetics/mutation/copy_mob(random_spider["type"], random_spider["name"])
	return new_mutation
//=======================
//Empress
/datum/genetics/mutation_recipe/combination/queen_spider
	required_on_clone_types = list(/mob/living/carbon/superior/spider/nurse)
	required_mutations = list(MUTATION_GIGANTISM)

/datum/genetics/mutation_recipe/combination/queen_spider/get_result()
	return new /datum/genetics/mutation/copy_mob(/mob/living/carbon/superior/spider/nurse/queen, "empress spider")

//=======================
//Emperor
/datum/genetics/mutation_recipe/combination/emperor_spider
	required_on_clone_types = list(/mob/living/carbon/superior/spider/fortress)
	required_mutations = list(MUTATION_GIGANTISM)

/datum/genetics/mutation_recipe/combination/emperor_spider/get_result()
	return new /datum/genetics/mutation/copy_mob(/mob/living/carbon/superior/spider/fortress/emperor, "emperor spider")

//=======================
//Commented out for now pending discussion, but reaper spiders are supposed to be insanely rare and hyper intelligent. Cloning them ruins there fear factor.
//Reaper
/*
/datum/genetics/mutation_recipe/combination/reaper
	required_on_clone_types = list(
		/mob/living/carbon/superior/spider/fortress/emperor,
		/mob/living/carbon/superior/spider/nurse/queen
	)
/datum/genetics/mutation_recipe/combination/reaper/get_result()
	return new /datum/genetics/mutation/copy_mob(/mob/living/carbon/superior/spider/fortress/emperor/reaper_spider, "reaper spider")
*/

//======================================================================
//Termite Combinations
/datum/genetics/mutation_recipe/irradiation/termite
	required_on_clone_types = list(/mob/living/carbon/superior/termite_colony)

/datum/genetics/mutation_recipe/irradiation/termite/get_result()
	var/list/random_termite = pick(
		list("type" = /mob/living/carbon/superior/termite_colony, "name" = "Pekhota termite"),
		list("type" = /mob/living/carbon/superior/termite_colony/iron, "name" = "Pomoshchnik termite"),
		list("type" = /mob/living/carbon/superior/termite_colony/silver, "name" = "Pushka termite"),
		list("type" = /mob/living/carbon/superior/termite_colony/uranium, "name" = "Smertnik termite"),
		list("type" = /mob/living/carbon/superior/termite_colony/plasma, "name" = "Kop'ye termite"))
	var/datum/genetics/mutation/new_mutation = new /datum/genetics/mutation/copy_mob(random_termite["type"], random_termite["name"])
	return new_mutation
//=======================
//Queen
/datum/genetics/mutation_recipe/combination/queen_termite
	required_on_clone_types = list(/mob/living/carbon/superior/termite_colony/silver)
	required_mutations = list(MUTATION_GIGANTISM)

/datum/genetics/mutation_recipe/combination/queen_termite/get_result()
	return new /datum/genetics/mutation/copy_mob(/mob/living/carbon/superior/termite_colony/diamond, "Koroleva termite")
//=======================
//King
/datum/genetics/mutation_recipe/combination/king_termite
	required_on_clone_types = list(/mob/living/carbon/superior/termite_colony/plasma)
	required_mutations = list(MUTATION_GIGANTISM)

/datum/genetics/mutation_recipe/combination/king_termite/get_result()
	return new /datum/genetics/mutation/copy_mob(/mob/living/carbon/superior/termite_colony/osmium, "Korol termite")

//======================================================================
//Increase Cow.
/datum/genetics/mutation_recipe/combination/tatonka_1
	required_on_clone_types = list(/mob/living/simple/cow, /mob/living/simple/cow)

/datum/genetics/mutation_recipe/combination/tatonka_1/get_result()
	var/datum/genetics/mutation/new_mutation = new /datum/genetics/mutation/copy_mob(/mob/living/carbon/superior/lodge/tatonka, "tatonka")
	return new_mutation
//====================
//Increase Cow FURTHER.
/datum/genetics/mutation_recipe/combination/tangu_1
	required_mutations = list(MUTATION_COW_SKIN, MUTATION_COW_SKIN)
	required_on_clone_types = list(/mob/living/carbon/superior/lodge/tatonka)

/datum/genetics/mutation_recipe/combination/tangu_1/get_result()
	var/datum/genetics/mutation/new_mutation = new /datum/genetics/mutation/copy_mob(/mob/living/carbon/superior/lodge/tatonka/tangu, "tangu")
	return new_mutation

//======================================================================
//Create Mukwah, so people can blame us for making them
/datum/genetics/mutation_recipe/irradiation/mukwah
	required_on_clone_types = list(/mob/living/simple/hostile/bear)

/datum/genetics/mutation_recipe/irradiation/mukwah/get_result()
	var/datum/genetics/mutation/new_mutation = new /datum/genetics/mutation/copy_mob(/mob/living/simple/hostile/bear/mukwah, "mukwah")
	return new_mutation

//======================================================================
//Doggos
/datum/genetics/mutation_recipe/irradiation/cerberus
	required_on_clone_types = list(/mob/living/simple/pig)

/datum/genetics/mutation_recipe/irradiation/cerberus/get_result()
	var/datum/genetics/mutation/new_mutation = new /datum/genetics/mutation/copy_mob(/mob/living/carbon/superior/lodge/cerberus, "cerberus")
	return new_mutation

/datum/genetics/mutation_recipe/combination/chimera
	required_on_clone_types = list(/mob/living/carbon/superior/lodge/cerberus)
	required_mutations = list(MUTATION_NERVOUSNESS)

/datum/genetics/mutation_recipe/combination/chimera/get_result()
	var/datum/genetics/mutation/new_mutation = new /datum/genetics/mutation/copy_mob(/mob/living/carbon/superior/lodge/cerberus/chimera, "chimera")
	return new_mutation

//======================================================================
//Chickos
/datum/genetics/mutation_recipe/irradiation/clucker
	required_on_clone_types = list(/mob/living/simple/chicken)

/datum/genetics/mutation_recipe/irradiation/clucker/get_result()
	return new /datum/genetics/mutation/copy_mob(/mob/living/carbon/superior/lodge/clucker, "Clucker")

//======================================================================
//Tengolos
/datum/genetics/mutation_recipe/irradiation/tengolo
	required_on_clone_types = list(/mob/living/simple/hostile/diyaab)

/datum/genetics/mutation_recipe/irradiation/tengolo/get_result()
	var/list/random_tengolo = pick(
		list("type" = /mob/living/simple/hostile/tengbrute, "name" = "Tengolo Brute"),
		list("type" = /mob/living/simple/hostile/tengcharge, "name" = "Tengolo Charger"),
		list("type" = /mob/living/simple/hostile/tengstalker, "name" = "Tengolo Stalker"))
	return new /datum/genetics/mutation/copy_mob(random_tengolo["type"], random_tengolo["name"])

//=======================
//Hell Pigs
/datum/genetics/mutation_recipe/combination/hell_pig
	required_on_clone_types = list(/mob/living/simple/hostile/tengcharge, /mob/living/simple/pig)

/datum/genetics/mutation_recipe/combination/hell_pig/get_result()
	return new /datum/genetics/mutation/copy_mob(/mob/living/simple/hostile/hell_pig, "Hell Pig")
//=======================
/datum/genetics/mutation_recipe/combination/hell_pig_2
	required_on_clone_types = list(/mob/living/simple/hostile/tengcharge, /mob/living/simple/hostile/retaliate/tahca)

/datum/genetics/mutation_recipe/combination/hell_pig_2/get_result()
	return new /datum/genetics/mutation/copy_mob(/mob/living/simple/hostile/hell_pig, "Hell Pig")
//=======================
/datum/genetics/mutation_recipe/combination/hell_pig_3
	required_on_clone_types = list(/mob/living/simple/hostile/tengcharge)
	required_mutations = list(MUTATION_GIGANTISM)

/datum/genetics/mutation_recipe/combination/hell_pig_3/get_result()
	return new /datum/genetics/mutation/copy_mob(/mob/living/simple/hostile/hell_pig, "Hell Pig")

//=======================
//Slepnir
/datum/genetics/mutation_recipe/combination/slepnir
	required_on_clone_types = list(/mob/living/simple/hostile/tengbrute, /mob/living/simple/pig)

/datum/genetics/mutation_recipe/combination/slepnir/get_result()
	return new /datum/genetics/mutation/copy_mob(/mob/living/simple/hostile/hell_pig/slepnir, "Slepnir")
//=======================
/datum/genetics/mutation_recipe/combination/slepnir_2
	required_on_clone_types = list(/mob/living/simple/hostile/tengbrute, /mob/living/simple/hostile/retaliate/tahca)

/datum/genetics/mutation_recipe/combination/slepnir_2/get_result()
	return new /datum/genetics/mutation/copy_mob(/mob/living/simple/hostile/hell_pig/slepnir, "Slepnir")
//=======================
/datum/genetics/mutation_recipe/combination/slepnir_3
	required_on_clone_types = list(/mob/living/simple/hostile/tengbrute)
	required_mutations = list(MUTATION_GIGANTISM)

/datum/genetics/mutation_recipe/combination/slepnir_3/get_result()
	return new /datum/genetics/mutation/copy_mob(/mob/living/simple/hostile/hell_pig/slepnir, "Slepnir")

//=======================
//Wendigo
/datum/genetics/mutation_recipe/combination/wendigo
	required_on_clone_types = list(/mob/living/simple/hostile/tengstalker, /mob/living/simple/pig)

/datum/genetics/mutation_recipe/combination/wendigo/get_result()
	return new /datum/genetics/mutation/copy_mob(/mob/living/simple/hostile/hell_pig/wendigo, "Wendigo")
//=======================
/datum/genetics/mutation_recipe/combination/wendigo_2
	required_on_clone_types = list(/mob/living/simple/hostile/tengstalker, /mob/living/simple/hostile/retaliate/tahca)

/datum/genetics/mutation_recipe/combination/wendigo_2/get_result()
	return new /datum/genetics/mutation/copy_mob(/mob/living/simple/hostile/hell_pig/wendigo, "Wendigo")
//=======================
/datum/genetics/mutation_recipe/combination/wendigo_3
	required_on_clone_types = list(/mob/living/simple/hostile/tengstalker)
	required_mutations = list(MUTATION_GIGANTISM)

/datum/genetics/mutation_recipe/combination/wendigo_3/get_result()
	return new /datum/genetics/mutation/copy_mob(/mob/living/simple/hostile/hell_pig/wendigo, "Wendigo")

//======================================================================
//Croaker lord
/datum/genetics/mutation_recipe/combination/croaker_lord
	required_on_clone_types = list(/mob/living/simple/frog)
	required_mutations = list(MUTATION_GIGANTISM)

/datum/genetics/mutation_recipe/combination/croaker_lord/get_result()
	return new /datum/genetics/mutation/copy_mob(/mob/living/simple/hostile/retaliate/croakerlord, "croaker lord")

//======================================================================
//Nightmare Stalkers
/datum/genetics/mutation_recipe/combination/dream_daemon
	required_on_clone_types = list(/mob/living/simple/hostile/nightmare)
	required_mutations = list(MUTATION_EMP)

/datum/genetics/mutation_recipe/combination/dream_daemon/get_result()
	return new /datum/genetics/mutation/copy_mob(/mob/living/simple/hostile/nightmare/dream_daemon, "dream daemon")

//======================================================================
//Bears
/datum/genetics/mutation_recipe/combination/bear
	required_on_clone_types = list(/mob/living/simple/corgi)
	required_mutations = list(MUTATION_GIGANTISM)

/datum/genetics/mutation_recipe/combination/bear/get_result()
	return new /datum/genetics/mutation/copy_mob(/mob/living/simple/hostile/bear, "bear")
//=======================
/datum/genetics/mutation_recipe/combination/bear_brown
	required_on_clone_types = list(/mob/living/simple/hostile/bear)
	required_mutations = list(MUTATION_CHOC_MILK)

/datum/genetics/mutation_recipe/combination/bear_brown/get_result()
	return new /datum/genetics/mutation/copy_mob(/mob/living/simple/hostile/bear/brown, "brown bear")
//=======================
/datum/genetics/mutation_recipe/combination/bear_polar
	required_on_clone_types = list(/mob/living/simple/hostile/bear)
	required_mutations = list(MUTATION_ROBUST_MILK)

/datum/genetics/mutation_recipe/combination/bear_polar/get_result()
	return new /datum/genetics/mutation/copy_mob(/mob/living/simple/hostile/bear/polar, "polar bear")

//=======================
//chicks to chickens
/datum/genetics/mutation_recipe/combination/chicken
	required_on_clone_types = list(/mob/living/simple/chick)
	required_mutations = list(MUTATION_GIGANTISM)

/datum/genetics/mutation_recipe/combination/chicken/get_result()
	return new /datum/genetics/mutation/copy_mob(/mob/living/simple/chick, "chicken")

//=======================
//chickens to bat
/datum/genetics/mutation_recipe/combination/bat
	required_on_clone_types = list(/mob/living/simple/chicken)
	required_mutations = list(MUTATION_COW_SKIN)

/datum/genetics/mutation_recipe/combination/bat/get_result()
	return new /datum/genetics/mutation/copy_mob(/mob/living/simple/hostile/scarybat, "bats")

//=======================
//bat to sargoyle
/datum/genetics/mutation_recipe/combination/sargoyle
	required_on_clone_types = list(/mob/living/simple/hostile/scarybat)
	required_mutations = list(MUTATION_GIGANTISM)

/datum/genetics/mutation_recipe/combination/sargoyle/get_result()
	return new /datum/genetics/mutation/copy_mob(/mob/living/simple/hostile/sargoyle, "sargoyle")

//======================================================================
//Snake
/datum/genetics/mutation_recipe/combination/snake
	required_on_clone_types = list(/mob/living/simple/hostile/snake)
	required_mutations = list(MUTATION_GIGANTISM)

/datum/genetics/mutation_recipe/combination/snake/get_result()
	return new /datum/genetics/mutation/copy_mob(/mob/living/simple/hostile/giant_snake, "giant snake")

//======================================================================
//mouse to possom
/datum/genetics/mutation_recipe/combination/mouse
	required_on_clone_types = list(/mob/living/simple/mouse)
	required_mutations = list(MUTATION_GIGANTISM)

/datum/genetics/mutation_recipe/combination/mouse/get_result()
	return new /datum/genetics/mutation/copy_mob(/mob/living/simple/opossum, "opossom")

//======================================================================
//possom to helldiver
/datum/genetics/mutation_recipe/combination/opossum
	required_on_clone_types = list(/mob/living/simple/opossum)
	required_mutations = list(MUTATION_BOTTOMLESS_BELLY, MUTATION_COW_SKIN)

/datum/genetics/mutation_recipe/combination/opossum/get_result()
	return new /datum/genetics/mutation/copy_mob(/mob/living/simple/hostile/helldiver, "hell diver")

//======================================================================
//cat and panther
/datum/genetics/mutation_recipe/combination/kitten
	required_on_clone_types = list(/mob/living/simple/cat)
	required_mutations = list(MUTATION_DWARFISM)

/datum/genetics/mutation_recipe/combination/kitten/get_result()
	return new /datum/genetics/mutation/copy_mob(/mob/living/simple/cat/kitten, "kitten")

/datum/genetics/mutation_recipe/combination/cat
	required_on_clone_types = list(/mob/living/simple/cat/kitten)
	required_mutations = list(MUTATION_GIGANTISM)

/datum/genetics/mutation_recipe/combination/cat/get_result()
	return new /datum/genetics/mutation/copy_mob(/mob/living/simple/cat, "cat")

/datum/genetics/mutation_recipe/combination/panther
	required_on_clone_types = list(/mob/living/simple/cat)
	required_mutations = list(MUTATION_GIGANTISM)

/datum/genetics/mutation_recipe/combination/panther/get_result()
	return new /datum/genetics/mutation/copy_mob(/mob/living/simple/hostile/panther, "panther")
