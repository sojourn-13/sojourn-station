/mob/living/simple/hostile/giant_snake
	name = "giant snake"
	desc = "An absolutely gigantic snake."
	icon = 'icons/mob/64x64.dmi'
	icon_state = "snake"
	icon_dead = "snake-dead"
	faction = "pond"
	maxHealth = 100
	health = 100
	melee_damage_lower = 10
	melee_damage_upper = 25
	old_x = -16
	old_y = -16
	default_pixel_x = -16
	default_pixel_y = -16
	pixel_x = -16
	pixel_y = -16
	meat_amount = 8
	leather_amount = 8 //The amount of leather sheets dropped.
	bones_amount = 6 //The amount of bone sheets dropped.
	inherent_mutations = list(MUTATION_GIGANTISM, MUTATION_CLUMSY, MUTATION_NEARSIGHTED, MUTATION_RAND_UNSTABLE)
	research_value = 600 // Large giant snake

/mob/living/simple/hostile/render
	name = "primal render"
	desc = "A hulking monster out of a living nightmare. Its powerful hide can shrug off advanced lasers with ease and its heavily armored skin requires powerful ballistics to pierce."
	icon = 'icons/mob/deathclaw.dmi'
	icon_state = "deathclaw"
	icon_living = "deathclaw"
	icon_rest = "deathclaw_sleep"
	icon_dead = "deathclaw_dead"
	icon_gib = "deathclaw_gib"
	speed = 18
	move_to_delay = 2
	turns_per_move = 2
	vision_range = 12
	aggro_vision_range = 12
	environment_smash = 2
	break_stuff_probability = 95
	attacktext = "mauled"
	faction = "deathclaw"
	sanity_damage = 3

	mob_size = MOB_LARGE

	maxHealth = 550 * MEGAFAUNA_HEALTH_MOD
	health = 550 * MEGAFAUNA_HEALTH_MOD
	melee_damage_lower = 35
	melee_damage_upper = 40

	armor = list(melee = 10, bullet = 14, energy = 12, bomb = 5, bio = 10, agony = 10, rad = 25)
	research_value = 10000 // Primal render - maximum deep maint creature

	old_x = -16
	old_y = 0
	default_pixel_x = -16
	pixel_x = -16
	pixel_y = 0
	attack_sound = 'sound/weapons/deathclawattack.ogg'
	meat_amount = 6
	meat_type = /obj/item/reagent_containers/snacks/meat/primal
	can_burrow = FALSE
	leather_amount = 16
	bones_amount = 20
	has_special_parts = TRUE
	special_parts = list(/obj/item/animal_part/render_claw,/obj/item/animal_part/wolf_tooth,/obj/item/animal_part/wolf_tooth)
	inherent_mutations = list(MUTATION_NEARSIGHTED, MUTATION_GIGANTISM, MUTATION_IMBECILE, MUTATION_NEARSIGHTED, MUTATION_RAND_UNSTABLE)

/mob/living/simple/hostile/render/FindTarget()
	. = ..()
	if(.)
		visible_emote("lets out a deafening roar and charges at [.]!")
		playsound(src, 'sound/voice/deathclaw_roar.ogg', 200, 1, -3)

/mob/living/simple/hostile/render/death(gibbed, deathmessage = "lets out a guttural snarl before it crumbles to the ground dead!")
	walk_to(src,0)
	movement_target = null
	icon_state = icon_dead
	density = FALSE
	return ..(gibbed,deathmessage)

/mob/living/simple/hostile/render/malformed
	name = "Malformed Render"
	maxHealth = 800
	health = 800
	melee_damage_lower = 40
	melee_damage_upper = 45
	color = "#8B0000"
	research_value = 12000

/mob/living/simple/hostile/render/wasprender
	name = "Wasp Queen"
	desc = "A testament to the mutating properties of Amethyn, this wasp-render hybrid is truly the queen of the hive."
	icon = 'icons/mob/deathclaw.dmi'
	icon_state = "beeclaw"
	icon_dead = "beeclaw_dead"
	maxHealth = 800
	health = 800
	faction = "vox_tribe" //Same as wasps
	melee_damage_lower = 40
	melee_damage_upper = 45
	poison_per_bite = 6
	poison_type = "wasp_toxin"
	research_value = 12000

/mob/living/simple/hostile/render/chunks
	name = "Chunks"
	desc = "An absolute unit of a primal render. Somehow maintains his speed despite being severely malformed and ugly as sin."
	icon = 'icons/mob/64x64.dmi'
	icon_state = "chunks"
	icon_dead = "deathclaw_dead"
	maxHealth = 500 * MEGAFAUNA_HEALTH_MOD
	health = 500 * MEGAFAUNA_HEALTH_MOD
	melee_damage_lower = 30
	melee_damage_upper = 40
	meat_amount = 8
	leather_amount = 24 //The amount of leather sheets dropped.
	research_value = 11000

/mob/living/simple/hostile/panther
	name = "panther"
	desc = "Runtime's larger, less cuddly cousin."
	icon = 'icons/mob/64x64.dmi'
	icon_state = "panther"
	icon_dead = "panther_dead"
	faction = "panther"
	maxHealth = 100
	health = 100
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
	meat_amount = 4 //Kitty no!
	leather_amount = 6 //The amount of leather sheets dropped.
	bones_amount = 6 //The amount of bone sheets dropped.
	has_special_parts = TRUE
	special_parts = list(/obj/item/animal_part/wolf_tooth,/obj/item/animal_part/wolf_tooth)
	mob_size = MOB_LARGE
	armor = list(melee = 6, bullet = 2, energy = 0, bomb = 5, bio = 10, rad = 25)
	inherent_mutations = list(MUTATION_CAT_EYES, MUTATION_GIGANTISM, MUTATION_RAND_UNSTABLE)
	research_value = 400

/mob/living/simple/hostile/retaliate/gaslamp
	name = "gaslamp"
	desc = "Some sort of floaty alien with a warm glow."
	icon = 'icons/mob/32x64.dmi'
	icon_state = "gaslamp"
	icon_dead = "gaslamp_dead"
	faction = "virgo3b"
	maxHealth = 50
	health = 50
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
	research_value = 120

/mob/living/simple/hostile/retaliate/hippo
	name = "hippo"
	desc = "Mostly know for the spectacular hit of the live action movie Hungry Hungry Hippos."
	icon = 'icons/mob/64x64.dmi'
	icon_state = "hippo"
	icon_dead = "hippo_dead"
	maxHealth = 125
	health = 125
	turns_per_move = 5
	see_in_dark = 3
	speed = 5
	leather_amount = 16 //The amount of leather sheets dropped.
	bones_amount = 16 //The amount of bone sheets dropped.
	response_help = "pets the"
	response_disarm = "gently pushes aside the"
	response_harm = "hits the"
	attacktext = list("bit")

	melee_damage_upper = 25
	melee_damage_lower = 15
	mob_size = MOB_LARGE

	old_x = -16
	old_y = 0
	default_pixel_x = -16
	pixel_x = -16
	pixel_y = 0
	speak_chance = 0.1
	speak = list("UUUUUUH")
	speak_emote = list("grunts.","groans.", "roars!", "snorts.")
	emote_hear = list("groan")
	emote_see = list("shakes its head")
	meat_amount = 10 //Infinite meat!
	meat_type = /obj/item/reagent_containers/snacks/meat
	research_value = 500

/mob/living/simple/hostile/nightmare
	name = "nightmare stalker"
	desc = "Though physically imposing, it prefers to ambush its prey who draw close using its chameleonic chitin and sound mimicry."
	icon = 'icons/mob/64x64.dmi'
	icon_state = "arachnid"
	icon_living = "arachnid"
	icon_rest = "arachnid_sleeping"
	icon_dead = "arachnid_dead"
	melee_damage_lower = 30
	melee_damage_upper = 35
	maxHealth = 300 * MEGAFAUNA_HEALTH_MOD
	health = 300 * MEGAFAUNA_HEALTH_MOD
	move_to_delay = 2
	turns_per_move = 2
	vision_range = 5
	aggro_vision_range = 16
	pixel_x = -16
	move_to_delay = 2
	speak_emote = list("chitters.", "sharpens its claws.")
	attack_sound = 'sound/xenomorph/alien_bite1.ogg'
	alpha = 30
	faction = "stalker"
	leather_amount = 0 //No actual skin
	bones_amount = 30 //Lots of bone-like chitin
	has_special_parts = TRUE
	has_rare_parts = TRUE
	special_parts = list(/obj/item/animal_part/stalker_chitin)
	rare_parts = list(/obj/item/animal_part/stalker_spur)
	armor = list(melee = 5, bullet = 7, energy = 1, bomb = 5, bio = 10, agony = 20, rad = 25)
	mob_size = MOB_LARGE
	inherent_mutations = list(MUTATION_GIGANTISM, MUTATION_CLUMSY, MUTATION_COUGHING, MUTATION_NERVOUSNESS, MUTATION_CLOAKING)
	research_value = 8000 // Nightmare stalker - high-tier deep maint creature

/mob/living/simple/hostile/nightmare/dream_daemon
	name = "dream daemon"
	desc = "A creature of primal nightmares, bred in pitchest black... a rare sight of an evolved nightmare stalker, much deadlier, ruthless and agile than the average."
	icon_state = "arachnid_daemon"
	icon_living = "arachnid_daemon"
	icon_rest = "arachnid_daemon_sleeping"
	icon_dead = "arachnid_daemon_dead"
	melee_damage_lower = 40
	melee_damage_upper = 60
	maxHealth = 450 * MEGAFAUNA_HEALTH_MOD
	health = 450 * MEGAFAUNA_HEALTH_MOD
	move_to_delay = 4
	turns_per_move = 4
	vision_range = 8
	aggro_vision_range = 20
	armor = list(melee = 5, bullet = 14, energy = 12, bomb = 5, bio = 10, agony = 10, rad = 25)
	inherent_mutations = list(MUTATION_GIGANTISM, MUTATION_CLUMSY, MUTATION_COUGHING, MUTATION_NERVOUSNESS, MUTATION_GREATER_CLOAKING)
	research_value = 12000

/mob/living/simple/hostile/nightmare/MoveToTarget()
	..()
	playsound(src, pick('sound/hallucinations/i_see_you2.ogg',
						'sound/hallucinations/im_here1.ogg',
						'sound/hallucinations/behind_you1.ogg',
						'sound/hallucinations/over_here3.ogg',
						'sound/hallucinations/turn_around1.ogg',
						 ), 200, 1)

/mob/living/simple/hostile/nightmare/AttackingTarget()
	..()
	alpha = 255

/mob/living/simple/hostile/nightmare/LoseTarget()
	..()
	alpha = 30

/mob/living/simple/hostile/nightmare/death()
	..()
	alpha = 255

/mob/living/simple/hostile/retaliate/croakerlord
	name = "croaker lord"
	desc = "The thing the 'frogs' eventually grow into, proving beyond doubt their alien nature. While one of the strongest monsters on the planet it isn't normally hostile unless it \
	has a reason and god help you if it finds one, their berserk rages kill nearly everyone when its eyes open."
	icon = 'icons/mob/64x64.dmi'
	icon_state = "leaper"
	icon_living = "leaper"
	icon_dead = "leaper_dead"
	melee_damage_lower = 50
	melee_damage_upper = 60
	maxHealth = 600 * MEGAFAUNA_HEALTH_MOD
	health = 600 * MEGAFAUNA_HEALTH_MOD
	move_to_delay = 4
	turns_per_move = 4
	vision_range = 16
	aggro_vision_range = 16
	stop_automated_movement_when_pulled = 1
	pixel_x = -16
	speak_emote = list("looses a rumbling croak.", "grumbles quietly.")
	attack_sound = 'sound/xenomorph/alien_bite2.ogg'
	faction = "pond"
	wander = 1
	meat_amount = 10 //extra thicc
	leather_amount = 20
	bones_amount = 10
	has_special_parts = TRUE
	special_parts = list(/obj/item/animal_part/croaker_tongue)
	mob_size = MOB_LARGE
	inherent_mutations = list(MUTATION_GIGANTISM, MUTATION_CLUMSY, MUTATION_IMBECILE, MUTATION_RAND_UNSTABLE)
	var/alerted = FALSE
	research_value = 6000

/mob/living/simple/hostile/retaliate/croakerlord/adjustBruteLoss(damage)
	..()
	if(!alerted)
		visible_emote("slowly begins to open its many eyes as it looses an angered croak...")
		icon_state = "leaper_alert"
		icon_living = "leaper_alert"
		alerted = TRUE

/mob/living/simple/hostile/retaliate/croakerlord/LoseTarget()
	..()
	icon_state = "leaper"
	icon_living = "leaper"
	alerted = FALSE

/mob/living/simple/hostile/retaliate/croakerlord/LostTarget()
	..()
	icon_state = "leaper"
	icon_living = "leaper"
	alerted = FALSE

// Credit to SlapDrink#0083 for the sprite.
/mob/living/simple/hostile/hell_pig
	name = "hell pig"
	desc = "The venerable evolution of a tengolo charger, morphing into a violent and destructive beast hostile to all but its own berserk kind. Hell pigs represent the end of a charger's life \
	as upon reaching a certain age they undergo a metamorphosis that turns them into bloodthirsty monsters who rampage until slain."
	icon = 'icons/mob/64x64.dmi'
	icon_state = "hellpig"
	icon_living = "hellpig"
	icon_dead = "hellpig_dead"
	melee_damage_lower = 30
	melee_damage_upper = 45
	maxHealth = 750 * MEGAFAUNA_HEALTH_MOD
	health = 750 * MEGAFAUNA_HEALTH_MOD
	move_to_delay = 4
	turns_per_move = 4
	vision_range = 16
	aggro_vision_range = 16
	stop_automated_movement_when_pulled = 1
	pixel_x = -16
	speak_emote = list("emits a challenging roar!", "stomps the ground angrily.")
	attack_sound = 'sound/xenomorph/alien_bite2.ogg'
	faction = "tengolo_berserker"
	wander = 1
	meat_type = /obj/item/reagent_containers/snacks/meat/pork
	meat_amount = 8
	leather_amount = 20
	bones_amount = 10
	has_special_parts = TRUE
	special_parts = list(/obj/item/animal_part/wolf_tooth,/obj/item/animal_part/wolf_tooth,/obj/item/animal_part/hell_hide)
	mob_size = MOB_LARGE
	armor = list(melee = 8, bullet = 6, energy = 10, bomb = 5, bio = 10, agony = 10, rad = 25)
	inherent_mutations = list(MUTATION_GIGANTISM, MUTATION_CLUMSY, MUTATION_BLINDNESS, MUTATION_NO_PAIN, MUTATION_HYPERION, MUTATION_BLOOD_BANK)
	research_value = 7500

/mob/living/simple/hostile/hell_pig/wendigo
	name = "wendigo"
	desc = "The venerable evolution of a tengolo stalker, morphing into a violent and destructive beast hostile to all but its own berserk kind. The wendigo is a violent transformation that involves \
	much of the flesh and bone of a tengolo painfully and rapidly mutating, driving the creature insane and violent."
	icon_state = "wendigo"
	icon_living = "wendigo"
	icon_dead = "wendigo_dead"
	melee_damage_lower = 25
	melee_damage_upper = 35
	maxHealth = 600 * MEGAFAUNA_HEALTH_MOD
	health = 600 * MEGAFAUNA_HEALTH_MOD
	move_to_delay = 2
	turns_per_move = 6
	speak_emote = list("snarls!", "jerks erratically.")
	has_special_parts = TRUE
	special_parts = list(/obj/item/animal_part/wolf_tooth,/obj/item/animal_part/wolf_tooth,/obj/item/animal_part/cannibal_tooth)
	armor = list(melee = 8, bullet = 10, energy = 3, bomb = 5, bio = 10, agony = 10, rad = 25)
	inherent_mutations = list(MUTATION_GIGANTISM, MUTATION_CLUMSY, MUTATION_IMBECILE, MUTATION_RAND_UNSTABLE, MUTATION_HYPERION)


// Credit to scar#1579 for the sprite.
/mob/living/simple/hostile/hell_pig/slepnir
	name = "slepnir"
	desc = "The venerable evolution of a tengolo charger, morphing into a violent and destructive beast hostile to all but its own berserk kind. The slepnir, unlike its other berserk kin, only attacks \
	those who draw close, but once its ire is drawn it becomes a relentless pursuer. More disturbingly, upon closer examination one would note its new coloration is the result of his normally \
	blue-ish hide having sloughed off to expose the reddish-brown muscle beneath."
	icon_state = "slepnir"
	icon_living = "slepnir"
	icon_dead = "slepnir_dead"
	melee_damage_lower = 30
	melee_damage_upper = 35
	maxHealth = 350 * MEGAFAUNA_HEALTH_MOD
	health = 350 * MEGAFAUNA_HEALTH_MOD
	vision_range = 8
	aggro_vision_range = 16
	move_to_delay = 1
	turns_per_move = 8
	speak_emote = list("stomps its hooves!", "whinnies!")
	has_special_parts = TRUE
	special_parts = list(/obj/item/animal_part/slepnir_hoof,/obj/item/animal_part/wolf_tooth,/obj/item/animal_part/wolf_tooth)
	armor = list(melee = 8, bullet = 4, energy = 4, bomb = 5, bio = 10, agony = 10, rad = 25)
	inherent_mutations = list(MUTATION_GIGANTISM, MUTATION_CLUMSY, MUTATION_IMBECILE, MUTATION_RAND_UNSTABLE, MUTATION_HYPERION, MUTATION_BLOOD_BANK)
	research_value = 3500
