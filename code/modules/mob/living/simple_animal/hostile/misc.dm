// Xenoarch aliens.
/mob/living/simple/hostile/samak
	name = "samak"
	desc = "A tough, armored predator accustomed to hiding and ambushing in cold terrain."
	faction = "samak"
	icon_state = "samak"
	icon_living = "samak"
	icon_dead = "samak_dead"
	move_to_delay = 5
	maxHealth = 130
	health = 130
	speed = 2
	melee_damage_lower = 8
	melee_damage_upper = 15
	attacktext = "mauled"
	cold_damage_per_tick = 0
	speak_chance = 5
	speak = list("Hruuugh!","Hrunnph")
	emote_see = list("paws the ground.","shakes its mane.","stomps.")
	emote_hear = list("snuffles")
	meat_amount = 3
	mob_size = MOB_MEDIUM
	resistance = 8
	has_special_parts = TRUE
	special_parts = list(/obj/item/animal_part/wolf_tooth)

/mob/living/simple/hostile/diyaab
	name = "diyaab"
	desc = "A small pack animal. Although omnivorous, it will hunt meat on occasion."
	faction = "diyaab"
	icon_state = "diyaab"
	icon_living = "diyaab"
	icon_dead = "diyaab_dead"
	move_to_delay = 2
	maxHealth = 25
	health = 25
	speed = 1
	melee_damage_lower = 1
	melee_damage_upper = 5
	attacktext = "gouged"
	cold_damage_per_tick = 0
	speak_chance = 5
	speak = list("Awrr?","Aowrl!","Worrl")
	emote_see = list("sniffs the air cautiously","looks around")
	emote_hear = list("snuffles")
	pass_flags = PASSTABLE
	density = 0
	mob_size = MOB_SMALL
	has_special_parts = TRUE
	special_parts = list(/obj/item/animal_part/wolf_tooth)
	clone_difficulty = CLONE_EASY
	inherent_mutations = list(MUTATION_DWARFISM, MUTATION_EPILEPSY, MUTATION_UNBALANCED, MUTATION_IMBECILE)

/mob/living/simple/hostile/shantak
	name = "shantak"
	desc = "A piglike creature with a bright iridiscent mane that sparkles as though lit by an inner light. Don't be fooled by its beauty though."
	faction = "shantak"
	icon_state = "shantak"
	icon_living = "shantak"
	icon_dead = "shantak_dead"
	move_to_delay = 2.5
	maxHealth = 55
	health = 55
	speed = 1
	melee_damage_lower = 6
	melee_damage_upper = 14
	attacktext = "gouged"
	cold_damage_per_tick = 0
	speak_chance = 5
	speak = list("Shuhn","Shrunnph?","Shunpf")
	emote_see = list("scratches the ground.","shakes out it's mane.","tinkles gently.")
	mob_size = MOB_MEDIUM
	resistance = 3
	meat_type = /obj/item/reagent_containers/snacks/meat/pork
	meat_amount = 6 //Pigs are known for giving meat
	has_special_parts = TRUE
	special_parts = list(/obj/item/animal_part/wolf_tooth)

/mob/living/simple/yithian
	name = "yithian"
	desc = "A friendly creature vaguely resembling an oversized snail without a shell."
	icon_state = "yithian"
	icon_living = "yithian"
	icon_dead = "yithian_dead"
	density = 0
	mob_size = MOB_TINY
	sanity_damage = -1

/mob/living/simple/tindalos
	name = "tindalos"
	desc = "It looks like a large, flightless grasshopper."
	icon_state = "tindalos"
	icon_living = "tindalos"
	icon_dead = "tindalos_dead"
	density = 0
	mob_size = MOB_TINY
	sanity_damage = -1

/mob/living/simple/schlorgo
	name = "schlorgo"
	desc = "A friendly creature vaguely resembling a squat fat penguin with no feathers and a bulbous nose."
	icon = 'icons/mob/mobs-domestic.dmi'
	icon_state = "schlorgo"
	icon_living = "schlorgo"
	icon_dead = "schlorgo_dead"
	pass_flags = PASSTABLE
	density = 0
	mob_size = MOB_SMALL
	//Schlorgo is a fucking mess
	inherent_mutations = list(MUTATION_DWARFISM, MUTATION_NO_PAIN, MUTATION_UNBALANCED, MUTATION_IMBECILE, MUTATION_TOURETTES)
	sanity_damage = -1

/mob/living/simple/hostile/snake
	name = "viper"
	desc = "A ferocious, fang-bearing creature that resembles a snake. Rather calm, unless you get close."
	icon = 'icons/mob/mobs-domestic.dmi'
	icon_state = "snake"
	speak_chance = 0
	pass_flags = PASSTABLE
	layer = HIDE_LAYER
	density = 0
	turns_per_move = 5
	meat_type = /obj/item/reagent_containers/snacks/meat/carp
	response_help = "pets the"
	response_disarm = "gently pushes aside the"
	response_harm = "hits the"
	speed = 12
	maxHealth = 25
	health = 25
	aggro_vision_range = 1
	vision_range = 1
	harm_intent_damage = 8
	melee_damage_lower = 4
	melee_damage_upper = 7
	attacktext = "bitten"
	attack_sound = 'sound/weapons/bite.ogg'
	break_stuff_probability = 4
	faction = "pond"
	var/attack_reagent = "toxin"
	has_special_parts = TRUE
	special_parts = list(/obj/item/animal_part/wolf_tooth)
	inherent_mutations = list(MUTATION_NEARSIGHTED, MUTATION_TOXIN_RESISTANCE, MUTATION_UNBALANCED, MUTATION_CLUMSY)

/mob/living/simple/hostile/snake/AttackingTarget()
	var/atom/targetted_mob = (target_mob?.resolve())

	. = ..()
	if(attack_reagent && . && isliving(targetted_mob))
		var/mob/living/L = targetted_mob
		if(L.reagents)
			L.reagents.add_reagent(attack_reagent, rand(3,5))

/mob/living/simple/hostile/dsnake
	name = "Snek"
	desc = "A domesticated snake that was altered to make it easily seen as friendly. Seems to have fairly high intelligence as no one can seem to keep it contained for very long."
	icon = 'icons/mob/mobs-domestic.dmi'
	icon_state = "dsnake"
	speak_chance = 0
	pass_flags = PASSTABLE
	layer = HIDE_LAYER
	density = 0
	turns_per_move = 2
	meat_type = /obj/item/reagent_containers/snacks/meat/carp
	response_help = "boops the"
	response_disarm = "gently pushes aside the"
	response_harm = "hits the"
	colony_friend = TRUE
	friendly_to_colony = TRUE
	speed = 18
	maxHealth = 25
	health = 25
	aggro_vision_range = 5
	vision_range = 5
	harm_intent_damage = 8
	melee_damage_lower = 4
	melee_damage_upper = 7
	attacktext = "bitten"
	attack_sound = 'sound/weapons/bite.ogg'
	break_stuff_probability = 0
	var/attack_reagent = "toxin"
	has_special_parts = TRUE
	special_parts = list(/obj/item/animal_part/wolf_tooth)
	sanity_damage = -1

/mob/living/simple/hostile/tengbrute
	name = "tengolo brute"
	desc = "One of the local fauna native to the planet, peaceful except around insects and insectile creatures. This is one of the males, it looks like a four-eyed monkey mixed with a warthog."
	faction = "tengo"
	icon = 'icons/mob/mobs-domestic.dmi'
	icon_state = "fatshouter"
	icon_living = "fatshouter"
	icon_dead = "fatshouter_dead"
	response_help = "pets the"
	response_disarm = "gently pushes aside the"
	response_harm = "hits the"
	move_to_delay = 5
	maxHealth = 130
	health = 130
	speed = 2
	melee_damage_lower = 15
	melee_damage_upper = 19
	attacktext = "mauled"
	attack_sound = 'sound/weapons/bite.ogg'
	speak_chance = 5
	speak = list("Hruuugh!","Hrunnph")
	emote_see = list("paws the ground.","shakes its mane.","stomps.")
	emote_hear = list("snuffles")
	meat_type = /obj/item/reagent_containers/snacks/meat/pork // Since half warthog.
	meat_amount = 3
	mob_size = MOB_MEDIUM
	resistance = 5
	leather_amount = 4
	bones_amount = 4
	has_special_parts = TRUE
	special_parts = list(/obj/item/animal_part/wolf_tooth)

/mob/living/simple/hostile/tengstalker
	name = "tengolo stalker"
	desc = "One of the local fauna native to the planet, peaceful except around insects and insectile creatures. This is one of the males, it looks like a large cat-like creature."
	faction = "tengo"
	icon = 'icons/mob/64x64.dmi'
	icon_state = "bigcat"
	icon_living = "bigcat"
	icon_dead = "bigcat_dead"
	response_help = "pets the"
	response_disarm = "gently pushes aside the"
	response_harm = "hits the"
	move_to_delay = 5
	maxHealth = 180
	health = 180
	speed = 5
	melee_damage_lower = 18
	melee_damage_upper = 24
	attacktext = "bites"
	attack_sound = 'sound/weapons/bite.ogg'
	speak_chance = 5
	speak = list("Hruuugh!","Hrunnph")
	emote_see = list("paws the ground.","shakes its mane.","stomps.")
	emote_hear = list("snuffles")
	meat_amount = 3
	mob_size = MOB_MEDIUM
	resistance = 5
	pixel_x = -16
	leather_amount = 4
	bones_amount = 4
	has_special_parts = TRUE
	special_parts = list(/obj/item/animal_part/wolf_tooth)

/mob/living/simple/hostile/tengcharge
	name = "tengolo charger"
	desc = "One of the local fauna native to the planet, peaceful except around insects and insectile creatures. This is one of the females, it looks like an elk mixed with a warthog."
	faction = "tengo"
	icon = 'icons/mob/mobs-domestic.dmi'
	icon_state = "rafama"
	icon_living = "rafama"
	icon_dead = "rafama_dead"
	response_help = "pets the"
	response_disarm = "gently pushes aside the"
	response_harm = "hits the"
	move_to_delay = 5
	maxHealth = 90
	health = 90
	speed = 6
	melee_damage_lower = 12
	melee_damage_upper = 15
	attacktext = "gored"
	attack_sound = 'sound/weapons/bite.ogg'
	speak_chance = 5
	speak = list("Hruuugh!","Hrunnph")
	emote_see = list("paws the ground.","shakes its mane.","stomps.")
	emote_hear = list("snuffles")
	meat_type = /obj/item/reagent_containers/snacks/meat/pork // Since half warthog, and its evolutions are pig-oriented. Don't make me code/sprite venison meat next, please... - Seb
	meat_amount = 3
	mob_size = MOB_MEDIUM
	resistance = 3
	leather_amount = 4
	bones_amount = 4
	has_special_parts = TRUE
	special_parts = list(/obj/item/animal_part/wolf_tooth)

/mob/living/simple/hostile/helldiver
	name = "hell diver"
	desc = "One of the local fauna native to the planet, nicknamed hell diver by lonestar miners. They're usually friendly and highly valued by \
	miners as potential companions as they don't mind being led around, love food, and tend to rush after hostile life before a miner can see it. They have \
	peerless eyesight in the dark and are quite skilled at killing hostile fauna, more than their small size suggests."
	faction = "neutral"
	icon = 'icons/mob/mobs-domestic.dmi'
	icon_state = "tunneler"
	icon_living = "tunneler"
	icon_dead = "tunneler_dead"
	response_help = "pets the"
	response_disarm = "gently pushes aside the"
	response_harm = "hits the"
	move_to_delay = 2
	maxHealth = 150
	health = 150
	speed = 4
	melee_damage_lower = 20
	melee_damage_upper = 25
	aggro_vision_range = 20
	vision_range = 12
	attacktext = "gnawed"
	attack_sound = 'sound/weapons/bite.ogg'
	speak_chance = 5
	speak = list("chitters!","chitter")
	emote_see = list("scratches at the ground.","gives a small snuffle.","hops back and forth.")
	emote_hear = list("chitters.")
	meat_type = /obj/item/reagent_containers/snacks/meat/pork
	meat_amount = 2 // Undomesticated, and underfed compared to a lodge cerberus, thus less meat.
	mob_size = MOB_SMALL
	resistance = 10
	sanity_damage = -1
	//Feed to lead
	hunger_enabled = 1//If set to 0, a creature ignores hunger
	metabolic_factor = 0.5//A multiplier on how fast nutrition is lost. used to tweak the rates on a per-animal basis
	nutrition_step = 0.1 //nutrition lost per tick and per step, calculated from mob_size, 0.2 is a fallback
	stop_automated_movement_when_pulled = 1 //or just drag it around since it doesn't mind.
	break_stuff_probability = 0
	leather_amount = 6
	bones_amount = 6
	has_special_parts = TRUE
	special_parts = list(/obj/item/animal_part/helldiver_tooth)
	inherent_mutations = list(MUTATION_MKNEWAIFUHAIR)

/mob/living/simple/hostile/helldiver/FindTarget()
	. = ..()
	if(.)
		visible_emote("lets out a gutteral chitter in warning!")
		playsound(src, 'sound/voice/hiss4.ogg', 50, 1, -3)

/mob/living/simple/hostile/retaliate/hakhma
	name = "hakhma beetle"
	desc = "One of the local fauna native to the planet, a large ornery beetle who doesn't get along with anything but roaches. Mostly peaceful, unless you give it a reason to be hostile."
	faction = "roach"
	icon = 'icons/mob/mobs-domestic.dmi'
	icon_state = "hakhma"
	icon_living = "hakhma"
	icon_dead = "hakhma_dead"
	response_help = "pets the"
	response_disarm = "gently pushes aside the"
	response_harm = "hits the"
	move_to_delay = 5
	maxHealth = 250
	health = 250
	speed = 3
	melee_damage_lower = 15
	melee_damage_upper = 20
	attacktext = "gored"
	attack_sound = 'sound/weapons/heavysmash.ogg'
	speak_chance = 5
	speak = list("Hruuugh!","Hrunnph")
	emote_see = list("flutters its wings.","twitches its antenna.","stomps.")
	emote_hear = list("gronks.")
	meat_amount = 3
	mob_size = MOB_MEDIUM
	resistance = 15

// Credit to scar#1579 for the sprite.
/mob/living/simple/hostile/retaliate/tahca
	name = "tahca"
	desc = "A cervine creature, surprisingly native to this planet, that resembles a two-headed deer. Despite what one would expect, while docile in nature, it is more than willing to fight if attacked. Hunters value \
	these beasts for their antlers, both as trophies of value and for medicine."
	faction = "radstag"
	icon = 'icons/mob/mobs-domestic.dmi'
	icon_state = "radstag"
	icon_living = "radstag"
	icon_dead = "radstag_dead"
	response_help = "pets the"
	response_disarm = "gently pushes aside the"
	response_harm = "hits the"
	move_to_delay = 3
	maxHealth = 120
	health = 120
	speed = 1
	melee_damage_lower = 15
	melee_damage_upper = 20
	attacktext = "gored"
	attack_sound = 'sound/weapons/bite.ogg'
	speak_chance = 5
	speak = list("Hruuugh!","Hrunnph")
	emote_see = list("bleats.","clacks its horns.","stomps.")
	emote_hear = list("gronks.")
	meat_amount = 3
	leather_amount = 6
	bones_amount = 6
	mob_size = MOB_MEDIUM
	has_special_parts = TRUE
	special_parts = list(/obj/item/animal_part/tahca_antler)
