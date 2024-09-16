/mob/living/simple_animal/redpanda
	name = "red panda"
	desc = "It's a red panda. Beware of wah."
	icon_state = "wah"
	icon_dead = "wah_dead"
	maxHealth = 30
	health = 30
	response_help = "pats"
	response_disarm = "gently pushes"
	response_harm = "hits"
	harm_intent_damage = 5
	melee_damage_lower = 5
	melee_damage_upper = 2
	attacktext = list("bapped")
	speak_chance = 1
	speak = list("Wah!",
				"Wah?",
				"Waaaah.")
	emote_hear = list("wahs!","chitters.")
	emote_see = list("trundles around","rears up onto their hind legs and pounces a bug")
	colony_friend = TRUE
	sanity_damage = -1

/mob/living/simple_animal/redpanda/fae
	name = "fae panda"
	desc = "A rather ominous subspecies of red panda. Still cute."
	icon_state = "wah_fae"
	icon_dead = "wah_fae_dead"
	maxHealth = 60
	health = 60
	melee_damage_lower = 10
	melee_damage_upper = 10
	colony_friend = TRUE

/mob/living/simple_animal/penguin
	name = "penguin"
	desc = "An ungainly, waddling, cute, and VERY well-dressed bird."
	icon_state = "penguin"
	icon_dead = "penguin_dead_blood"
	meat_type = /obj/item/reagent_containers/food/snacks/meat/chicken
	meat_amount = 2
	maxHealth = 20
	health = 20
	turns_per_move = 5
	response_help  = "pets"
	response_disarm = "pushes aside"
	response_harm   = "hits"
	harm_intent_damage = 5
	melee_damage_lower = 10
	melee_damage_upper = 15
	attacktext = list("pecked")
	colony_friend = TRUE
	friendly_to_colony = TRUE
	sanity_damage = -1

/mob/living/simple_animal/penguin/baby
	name = "penguin chick"
	desc = "An ungainly, waddling, cute, and VERY well-dressed bird. This one is just a baby."
	icon_state = "penguin_baby"
	icon_dead = "penguin_baby_dead_blood"
	meat_type = /obj/item/reagent_containers/food/snacks/meat/chicken
	meat_amount = 1 // Why would you? You monster.
	maxHealth = 10
	health = 10
	harm_intent_damage = 10
	melee_damage_lower = 3
	melee_damage_upper = 5
	sanity_damage = -2

/mob/living/simple_animal/goose
	name = "goose"
	desc = "A long-necked waterbird."
	icon_state = "goose"
	icon_dead = "goose_dead"
	meat_type = /obj/item/reagent_containers/food/snacks/meat/chicken
	meat_amount = 2
	maxHealth = 20
	health = 20
	turns_per_move = 5
	response_help  = "pets"
	response_disarm = "pushes aside"
	response_harm   = "hits"
	harm_intent_damage = 5
	melee_damage_lower = 10
	melee_damage_upper = 15
	attacktext = list("pecked")
	inherent_mutations = list(MUTATION_HONK, MUTATION_IMBECILE, MUTATION_DEAF, MUTATION_NEARSIGHTED)
	faction = "pond"
	colony_friend = TRUE

/mob/living/simple_animal/lizard
	name = "lizard"
	desc = "A cute tiny lizard."
	icon = 'icons/mob/mobs-domestic.dmi'
	icon_state = "lizard"
	speak_emote = list("hisses")
	health = 5
	maxHealth = 5
	attacktext = "bitten"
	melee_damage_lower = 1
	melee_damage_upper = 2
	response_help  = "pets"
	response_disarm = "shoos"
	response_harm   = "stomps on"
	mob_size = MOB_MINISCULE
	possession_candidate = 1
	seek_speed = 0.75
	colony_friend = TRUE
	sanity_damage = -1

/mob/living/simple_animal/lizard/New()
	..()

	nutrition = rand(max_nutrition*0.25, max_nutrition*0.75)

/mob/living/simple_animal/fennec
	name = "fennec"
	desc = "It's a dusty big-eared sandfox! Adorable!"
	icon_state = "fennec"
	icon_dead = "fennec_dead"
	maxHealth = 30
	health = 30
	response_help = "pats"
	response_disarm = "gently pushes"
	response_harm = "hits"
	harm_intent_damage = 5
	melee_damage_lower = 5
	melee_damage_upper = 2
	attacktext = list("bapped")
	speak_chance = 1
	speak = list("SKREEEE!",
				"Chrp?",
				"Ararrrararr.")
	emote_hear = list("screEEEEeeches!","chirps.")
	emote_see = list("earflicks","sniffs at the ground")
	inherent_mutations = list(MUTATION_DWARFISM, MUTATION_IMBECILE, MUTATION_TOURETTES)
	colony_friend = TRUE
	faction = "pond"
	sanity_damage = -1

/mob/living/simple_animal/fennec/fennix
	name = "fennix"
	desc = "A distant sandfox relative. Very warm."
	icon_state = "fennix"
	icon_dead = "fennix_dead"
