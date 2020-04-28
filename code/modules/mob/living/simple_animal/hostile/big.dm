/mob/living/simple_animal/hostile/giant_snake
	name = "giant snake"
	desc = "An absolutely gigantic snake."
	icon = 'icons/mob/64x64.dmi'
	icon_state = "snake"
	icon_dead = "snake-dead"
	faction = "snake"
	maxHealth = 200
	health = 200
	melee_damage_lower = 10
	melee_damage_upper = 25
	old_x = -16
	old_y = -16
	default_pixel_x = -16
	default_pixel_y = -16
	pixel_x = -16
	pixel_y = -16

/mob/living/simple_animal/hostile/deathclaw
	name = "primal render"
	desc = "A hulking monster out of a living nightmare. Its powerful hide can shrug off advanced lasers with ease and its heavily armored skin requires powerful ballistics to pierce."
	icon = 'icons/mob/deathclaw.dmi'
	icon_state = "deathclaw"
	icon_living = "deathclaw"
	icon_dead = "deathclaw_dead"
	icon_gib = "deathclaw_gib"
	speed = 24
	move_to_delay = 2
	turns_per_move = 2
	vision_range = 12
	aggro_vision_range = 12
	environment_smash = 2
	break_stuff_probability = 95
	attacktext = "mauled"
	faction = "deathclaw"
	maxHealth = 900
	health = 900
	melee_damage_lower = 35
	melee_damage_upper = 40
	old_x = -16
	old_y = 0
	default_pixel_x = -16
	pixel_x = -16
	pixel_y = 0
	attack_sound = 'sound/weapons/deathclawattack.ogg'
	meat_amount = 6
	meat_type = /obj/item/weapon/reagent_containers/food/snacks/meat/primal
	can_burrow = FALSE

/mob/living/simple_animal/hostile/deathclaw/FindTarget()
	. = ..()
	if(.)
		visible_emote("lets out a deafening roar and charges at [.]!")
		playsound(src, 'sound/voice/deathclaw_roar.ogg', 200, 3, 8, 1)

/mob/living/simple_animal/hostile/deathclaw/death(gibbed, deathmessage = "lets out a gutteral snarl before it crumbles to the ground dead!")
	walk_to(src,0)
	movement_target = null
	icon_state = icon_dead
	density = 0
	return ..(gibbed,deathmessage)


/mob/living/simple_animal/hostile/deathclaw/chunks
	name = "Chunks"
	desc = "An absolute unit of a primal render. Somehow maintains his speed despite being severely malformed and ugly as sin."
	icon = 'icons/mob/64x64.dmi'
	icon_state = "chunks"
	icon_dead = "deathclaw_dead"
	maxHealth = 1000
	health = 1000
	melee_damage_lower = 30
	melee_damage_upper = 40

/mob/living/simple_animal/hostile/panther
	name = "panther"
	desc = "Runtime's larger, less cuddly cousin."
	icon = 'icons/mob/64x64.dmi'
	icon_state = "panther"
	icon_dead = "panther_dead"
	faction = "panther"
	maxHealth = 200
	health = 200
	move_to_delay = 4
	speak_chance = 2
	speak = list("RAWR!","Rawr!","GRR!","Growl!")
	speak_emote = list("growls", "roars")
	emote_hear = list("rawrs","rumbles","rowls")
	emote_see = list("stares ferociously", "snarls")
	melee_damage_lower = 10
	melee_damage_upper = 30
	old_x = -16
	old_y = 0
	default_pixel_x = -16
	pixel_x = -16
	pixel_y = 0

/mob/living/simple_animal/hostile/retaliate/gaslamp
	name = "gaslamp"
	desc = "Some sort of floaty alien with a warm glow."
	icon = 'icons/mob/32x64.dmi'
	icon_state = "gaslamp"
	icon_dead = "gaslamp_dead"
	faction = "virgo3b"
	maxHealth = 100
	health = 100
	move_to_delay = 4
	speak_chance = 1
	emote_see = list("looms", "sways gently")
	speed = 2
	melee_damage_lower = 5 // APWILL WAS HERE
	melee_damage_upper = 5
	attacktext = list("thrashed")
	friendly = "caressed"
	response_help   = "brushes"	// If clicked on help intent
	response_disarm = "pushes" // If clicked on disarm intent
	response_harm   = "swats"	// If clicked on harm intent
	minbodytemp = 0
	maxbodytemp = 350
	min_oxy = 0
	max_oxy = 5 // Does not like oxygen very much.
	min_tox = 1 // Needs phoron to survive.
	max_tox = 0
	min_co2 = 0
	max_co2 = 0
	min_n2 = 0
	max_n2 = 0

/mob/living/simple_animal/hostile/carp/greatwhite
	name = "great white carp"
	desc = "A very rare breed of carp- and a very aggressive one."
	icon = 'icons/mob/64x64.dmi'
	icon_state = "megacarp"
	icon_dead = "megacarp_dead"
	maxHealth = 230
	health = 230
	attack_same = 1
	speed = 1
	meat_amount = 10
	melee_damage_lower = 15
	melee_damage_upper = 25
	old_y = -16
	pixel_y = -16

/mob/living/simple_animal/hostile/retaliate/hippo
	name = "hippo"
	desc = "Mostly know for the spectacular hit of the live action movie Hungry Hungry Hippos."
	icon = 'icons/mob/64x64.dmi'
	icon_state = "hippo"
	icon_dead = "hippo_dead"
	maxHealth = 200
	health = 200
	turns_per_move = 5
	see_in_dark = 3
	speed = 5

	response_help = "pets the"
	response_disarm = "gently pushes aside the"
	response_harm = "hits the"
	attacktext = list("bit")

	melee_damage_upper = 25
	melee_damage_lower = 15

	old_x = -16
	old_y = 0
	default_pixel_x = -16
	pixel_x = -16
	pixel_y = 0
	speak_chance = 0.1
	speak = list("UUUUUUH")
	speak_emote = list("grunts","groans", "roars", "snorts")
	emote_hear = list("groan")
	emote_see = list("shakes its head")
	meat_amount = 10 //Infinite meat!
	meat_type = /obj/item/weapon/reagent_containers/food/snacks/meat
