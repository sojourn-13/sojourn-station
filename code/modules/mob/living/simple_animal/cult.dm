//Psi cult
/mob/living/carbon/superior_animal/human/cult
	name = "Psi Cultist"
	desc = "LIVE FOR THE KING OF DREAMS!"
	icon = 'icons/mob/psicultist/psicult.dmi'
	icon_state = "psisolder"
	icon_living = "psisolder"
	icon_dead = "cult_soul"
	move_to_delay = 2
	stop_automated_movement_when_pulled = 0
	speak_chance = 20
	maxHealth = 200
	health = 200
	mob/living/carbon/superior_animal/human/cult/following = "/mob/living/carbon/superior_animal/human/cult/juggernaut"
	mob/living/carbon/superior_animal/human/cult/last_followed = "/mob/living/carbon/superior_animal/human/cult/juggernaut"
	follow_distance = 3
	follow_message = "nods and start following."
	stop_message = "nods and stop following."
	react_to_attack = TRUE
	target_out_of_sight_mode = GUESS_LOCATION_WITH_END_OF_LINE
	out_of_sight_turf_LOS_check = TRUE
	obey_friends = TRUE
	var/healing_factor = 5
	melee_damage_lower = 30
	melee_damage_upper = 30
	breath_required_type = 0 // Doesn't need to breath, in a space suit
	breath_poison_type = 0 // Can't be poisoned
	min_air_pressure = 0 // Doesn't need pressure
	attacktext = "slashed"
	attack_sound = 'sound/weapons/bladeslice.ogg'
	meat_amount = 0
	meat_type = null
	leather_amount = 0
	bones_amount = 0
	fire_verb = "fires"
	faction = "psi_monster"

	target_telegraph = "fumbles to ready their weapon, preparing to engage"
	rush_target_telegraph = "quickly snaps their aim toward"

	armor = list(melee = 20, bullet = 10, energy = 10, bomb = 0, bio = 100, rad = 50) //Legitmently their armor

	inherent_mutations = list(MUTATION_HEART, MUTATION_LUNG, MUTATION_LIVER, MUTATION_BLOOD_VESSEL, MUTATION_MUSCLES, MUTATION_NERVES)

	get_stat_modifier = TRUE

	allowed_stat_modifiers = list(
		/datum/stat_modifier/mob/living/carbon/superior_animal/durable = 5,
		/datum/stat_modifier/health/flat/positive/low = 5,
		/datum/stat_modifier/mob/living/carbon/superior_animal/armor/mult/negative/low = 5,
		/datum/stat_modifier/mob/living/carbon/superior_animal/young = 12,
		/datum/stat_modifier/mob/living/carbon/superior_animal/old = 5,
		/datum/stat_modifier/mob/living/carbon/superior_animal/brutish = 5,
		/datum/stat_modifier/mob/living/damage/negative/mixed/flat/low = 5,
		/datum/stat_modifier/mob/living/carbon/superior_animal/brutal = 5,
		/datum/stat_modifier/mob/living/carbon/superior_animal/aggressive/savage = 5,
		/datum/stat_modifier/mob/living/carbon/superior_animal/aggressive = 10,
		/datum/stat_modifier/mob/living/carbon/superior_animal/deadeye = 5,
		/datum/stat_modifier/mob/living/carbon/superior_animal/triggerfinger = 15,
		/datum/stat_modifier/mob/living/carbon/superior_animal/quickdraw = 5,
	)

//They are all waring space suits
	breath_required_type = NONE
	breath_poison_type = NONE
	min_breath_required_type = 0
	min_breath_poison_type = 0

	min_air_pressure = 0
	min_bodytemperature = 0

//Drops
	meat_amount = 0
	meat_type = null

	drop_items = list()

/mob/living/carbon/superior_animal/human/cult/handle_breath(datum/gas_mixture/breath) //we have are own air supplies
	return

/mob/living/carbon/superior_animal/human/cult/handle_environment(var/datum/gas_mixture/environment) //are armor legit is a void suit
	return

/mob/living/carbon/superior_animal/human/cult/start_pulling(var/atom/movable/AM)
	to_chat(src, SPAN_WARNING("Your hand gets pushed away from \the [src]. !"))
	return

/mob/living/carbon/superior_animal/human/cult/death()
	..()
	drop_death_loot()

/mob/living/carbon/superior_animal/human/cult/emp_act(severity)
	..()
	if(rapid)
		rapid = FALSE
	if(prob(95) && ranged)
		ranged = FALSE

//Melee standart

/mob/living/carbon/superior_animal/human/cult/sword
	name = "Swordsman cultist"
	desc = "A psi cultist armed with a claymore and an unbending, dead will."
	icon = 'icons/mob/psicultist/psicult.dmi'
	icon_state = "psisolder_sword"
	icon_living = "psisolder_sword"
	icon_dead = "cult_soul"
	move_to_delay = 3
	stop_automated_movement_when_pulled = 0
	maxHealth = 200
	health = 200
	melee_damage_lower = 26
	melee_damage_upper = 26
	breath_required_type = 0 // Doesn't need to breath, in a space suit
	breath_poison_type = 0 // Can't be poisoned
	min_air_pressure = 0 // Doesn't need pressure
	attacktext = "slashed"
	attack_sound = 'sound/weapons/bladeslice.ogg'
	drop_items = list(/obj/item/tool/sword/cult/deepmaints)
	meat_amount = 0
	meat_type = null
	leather_amount = 0
	bones_amount = 0
	fire_verb = "fires"

/mob/living/carbon/superior_animal/human/cult/sword/h
	name = "Swordsman cultist"
	desc = "A psi cultist armed with a claymore and an unbending, dead will."
	icon = 'icons/mob/psicultist/psicult.dmi'
	icon_state = "psisolder_h_sword"
	icon_living = "psisolder_h_sword"
	icon_dead = "cult_soul"

/mob/living/carbon/superior_animal/human/cult/sword/m
	name = "Swordsman cultist"
	desc = "A psi cultist armed with a claymore and an unbending, dead will."
	icon = 'icons/mob/psicultist/psicult.dmi'
	icon_state = "psisolders_m_sword"
	icon_living = "psisolders_m_sword"
	icon_dead = "cult_soul"

/mob/living/carbon/superior_animal/human/cult/sword/hm
	name = "Swordsman cultist Adept"
	desc = "A psi cultist armed with a claymore and an unbending, dead will."
	icon = 'icons/mob/psicultist/psicult.dmi'
	icon_state = "psisolder_hm_sword"
	icon_living = "psisolder_hm_sword"
	icon_dead = "cult_soul"
	armor = list(melee = 25, bullet = 15, energy = 15, bomb = 0, bio = 100, rad = 50)

/mob/living/carbon/superior_animal/human/cult/machete
	name = "Cultist seeker"
	desc = "A psi cultist armed with a machete, cuts through the darkness to new knowledge."
	icon = 'icons/mob/psicultist/psicult.dmi'
	icon_state = "psisolder_machete"
	icon_living = "psisolder_machete"
	icon_dead = "cult_soul"
	stop_automated_movement_when_pulled = 0
	maxHealth = 200
	health = 200
	melee_damage_lower = 33
	melee_damage_upper = 33
	breath_required_type = 0 // Doesn't need to breath, in a space suit
	breath_poison_type = 0 // Can't be poisoned
	min_air_pressure = 0 // Doesn't need pressure
	attacktext = "slashed"
	attack_sound = 'sound/weapons/bladeslice.ogg'
	drop_items = list(/obj/item/tool/sword/machete/cult/deepmaints)
	meat_amount = 0
	meat_type = null
	leather_amount = 0
	bones_amount = 0
	fire_verb = "fires"
	var/chameleon_skill = 80

/mob/living/carbon/superior_animal/human/cult/machete/h
	name = "Cultist seeker"
	desc = "A psi cultist armed with a machete, cuts through the darkness to new knowledge."
	icon = 'icons/mob/psicultist/psicult.dmi'
	icon_state = "psisolder_h_machete"
	icon_living = "psisolder_h_machete"
	icon_dead = "cult_soul"

/mob/living/carbon/superior_animal/human/cult/machete/m
	name = "Cultist seeker"
	desc = "A psi cultist armed with a machete, cuts through the darkness to new knowledge."
	icon = 'icons/mob/psicultist/psicult.dmi'
	icon_state = "psisolders_m_machete"
	icon_living = "psisolders_m_machete"
	icon_dead = "cult_soul"

/mob/living/carbon/superior_animal/human/cult/machete/hm
	name = "Cultist seeker Adept"
	desc = "A psi cultist armed with a machete, cuts through the darkness to new knowledge."
	icon = 'icons/mob/psicultist/psicult.dmi'
	icon_state = "psisolder_hm_machete"
	icon_living = "psisolder_hm_machete"
	icon_dead = "cult_soul"
	armor = list(melee = 25, bullet = 15, energy = 15, bomb = 0, bio = 100, rad = 50)

/mob/living/carbon/superior_animal/human/cult/axe
	name = "Guardian cultist"
	desc = "This cultist is armed with a tomahawk. He keeps order in these places, and you break it."
	icon = 'icons/mob/psicultist/psicult.dmi'
	icon_state = "psisolder_axe"
	icon_living = "psisolder_axe"
	icon_dead = "cult_soul"
	stop_automated_movement_when_pulled = 0
	maxHealth = 200
	health = 200
	melee_damage_lower = 33
	melee_damage_upper = 33
	breath_required_type = 0 // Doesn't need to breath, in a space suit
	breath_poison_type = 0 // Can't be poisoned
	min_air_pressure = 0 // Doesn't need pressure
	attacktext = "slashed"
	attack_sound = 'sound/weapons/bladeslice.ogg'
	drop_items = list(/obj/item/tool/fireaxe/militia_tomahawk/cult/deepmaints)
	meat_amount = 0
	meat_type = null
	leather_amount = 0
	bones_amount = 0
	fire_verb = "fires"

/mob/living/carbon/superior_animal/human/cult/axe/m
	name = "Guardian cultist"
	desc = "This cultist is armed with a tomahawk. He keeps order in these places, and you break it."
	icon = 'icons/mob/psicultist/psicult.dmi'
	icon_state = "psisolders_m_axe"
	icon_living = "psisolders_m_axe"
	icon_dead = "cult_soul"

/mob/living/carbon/superior_animal/human/cult/axe/h
	name = "Guardian cultist"
	desc = "This cultist is armed with a tomahawk. He keeps order in these places, and you break it."
	icon = 'icons/mob/psicultist/psicult.dmi'
	icon_state = "psisolder_h_axe"
	icon_living = "psisolder_h_axe"
	icon_dead = "cult_soul"

/mob/living/carbon/superior_animal/human/cult/axe/hm
	name = "Guardian cultist Adept"
	desc = "This cultist is armed with a tomahawk. He keeps order in these places, and you break it."
	icon = 'icons/mob/psicultist/psicult.dmi'
	icon_state = "psisolder_hm_axe"
	icon_living = "psisolder_hm_axe"
	icon_dead = "cult_soul"
	armor = list(melee = 25, bullet = 15, energy = 15, bomb = 0, bio = 100, rad = 50)

//Ranger standart

/mob/living/carbon/superior_animal/human/cult/plasma
	name = "Cultist cannoneer"
	desc = "A cultist armed with a plasma cannon. His power can only be compared to his ability to shoot slowly."
	icon = 'icons/mob/psicultist/psicult.dmi'
	icon_state = "psisolder_plasma"
	icon_living = "psisolder_plasma"
	icon_dead = "cult_soul"
	projectilesound = 'sound/weapons/energy/laser.ogg'
	comfy_distance = 4
	comfy_range = 4
	move_to_delay = 6
	stop_automated_movement_when_pulled = 0
	maxHealth = 250
	health = 250
	melee_damage_lower = 20
	melee_damage_upper = 25
	var/knockdown_odds = 60
	breath_required_type = 0 // Doesn't need to breath, in a space suit
	breath_poison_type = 0 // Can't be poisoned
	min_air_pressure = 0 // Doesn't need pressure
	attacktext = "hits with the butt of a cannon"
	attack_sound = 'sound/effects/woodhit.ogg'
	ranged = TRUE
	rapid = FALSE
	ranged_cooldown = 3
	projectiletype = /obj/item/projectile/plasma/heavy
	drop_items = list(/obj/item/gun/energy/plasma/cassad/cult/deepmaints)
	limited_ammo = TRUE
	mag_drop = TRUE
	rounds_left = 12
	mag_type = /obj/item/cell/medium/psion/zero
	mags_left = 1
	light_range = 4
	light_color = "#53377A"
	armor = list(melee = 25, bullet = 15, energy = 20, bomb = 20, bio = 100, rad = 50)

/mob/living/carbon/superior_animal/human/cult/plasma/h
	name = "Cultist cannoneer"
	desc = "A cultist armed with a plasma cannon. His power can only be compared to his ability to shoot slowly."
	icon = 'icons/mob/psicultist/psicult.dmi'
	icon_state = "psisolder_h_plasma"
	icon_living = "psisolder_h_plasma"
	icon_dead = "cult_soul"

/mob/living/carbon/superior_animal/human/cult/plasma/m
	name = "Cultist cannoneer"
	desc = "A cultist armed with a plasma cannon. His power can only be compared to his ability to shoot slowly."
	icon = 'icons/mob/psicultist/psicult.dmi'
	icon_state = "psisolders_m_plasma"
	icon_living = "psisolders_m_plasma"
	icon_dead = "cult_soul"

/mob/living/carbon/superior_animal/human/cult/plasma/hm
	name = "Cultist cannoneer Adept"
	desc = "A cultist armed with a plasma cannon. His power can only be compared to his ability to shoot slowly."
	icon = 'icons/mob/psicultist/psicult.dmi'
	icon_state = "psisolder_hm_plasma"
	icon_living = "psisolder_hm_plasma"
	icon_dead = "cult_soul"
	armor = list(melee = 30, bullet = 15, energy = 15, bomb = 20, bio = 100, rad = 50)

/mob/living/carbon/superior_animal/human/cult/rifle
	name = "Cultist skirmisher"
	desc = "A cultist equipped with an Eclipse automatic rifle. Beware of his anger, this stream of bullets and shrapnel can greatly damage your path."
	icon = 'icons/mob/psicultist/psicult.dmi'
	icon_state = "psisolder_rifle"
	icon_living = "psisolder_rifle"
	icon_dead = "cult_soul"
	projectilesound = 'sound/weapons/guns/fire/ltrifle_fire.ogg'
	comfy_range = 5
	comfy_distance = 5
	move_to_delay = 3
	stop_automated_movement_when_pulled = 0
	maxHealth = 200
	health = 200
	melee_damage_lower = 15
	melee_damage_upper = 20
	var/knockdown_odds = 60
	breath_required_type = 0 // Doesn't need to breath, in a space suit
	breath_poison_type = 0 // Can't be poisoned
	min_air_pressure = 0 // Doesn't need pressure
	attacktext = "hits with the butt of a rifle"
	attack_sound = 'sound/effects/woodhit.ogg'
	ranged = TRUE
	rapid = TRUE
	rapid_fire_shooting_amount = 3
	ranged_cooldown = 3
	projectiletype = /obj/item/projectile/bullet/rifle_75
	drop_items = list(/obj/item/gun/projectile/automatic/sts/rifle/cult/deepmaints)
	limited_ammo = TRUE
	mag_drop = TRUE
	rounds_left = 12
	mag_type = /obj/item/ammo_magazine/rifle_75_short/scrap/empty
	mags_left = 2

/mob/living/carbon/superior_animal/human/cult/rifle/h
	name = "Cultist skirmisher"
	desc = "A cultist equipped with an Eclipse automatic rifle. Beware of his anger, this stream of bullets and shrapnel can greatly damage your path."
	icon = 'icons/mob/psicultist/psicult.dmi'
	icon_state = "psisolder_h_rifle"
	icon_living = "psisolder_h_rifle"
	icon_dead = "cult_soul"

/mob/living/carbon/superior_animal/human/cult/rifle/m
	name = "Cultist skirmisher"
	desc = "A cultist equipped with an Eclipse automatic rifle. Beware of his anger, this stream of bullets and shrapnel can greatly damage your path."
	icon = 'icons/mob/psicultist/psicult.dmi'
	icon_state = "psisolders_m_rifle"
	icon_living = "psisolders_m_rifle"
	icon_dead = "cult_soul"

/mob/living/carbon/superior_animal/human/cult/rifle/hm
	name = "Cultist skirmisher Adept"
	desc = "A cultist equipped with an Eclipse automatic rifle. Beware of his anger, this stream of bullets and shrapnel can greatly damage your path."
	icon = 'icons/mob/psicultist/psicult.dmi'
	icon_state = "psisolder_hm_rifle"
	icon_living = "psisolder_hm_rifle"
	icon_dead = "cult_soul"
	armor = list(melee = 25, bullet = 15, energy = 15, bomb = 20, bio = 100, rad = 50)

/mob/living/carbon/superior_animal/human/cult/laser
	name = "Cultist observer"
	desc = "A cultist equipped with a powerful laser emitter. Thanks to the scope, he can spot you from afar and inform his comrades. However, due to his inability to close combat, he fights much less effectively face-to-face with the enemy."
	icon = 'icons/mob/psicultist/psicult.dmi'
	icon_state = "psisolder_laser"
	icon_living = "psisolder_laser"
	icon_dead = "cult_soul"
	comfy_range = 10
	comfy_distance = 6
	viewRange = 12
	projectilesound = 'sound/weapons/energy/laser.ogg'
	stop_automated_movement_when_pulled = 0
	maxHealth = 150
	health = 150
	melee_damage_lower = 10
	melee_damage_upper = 15
	var/knockdown_odds = 40
	breath_required_type = 0 // Doesn't need to breath, in a space suit
	breath_poison_type = 0 // Can't be poisoned
	min_air_pressure = 0 // Doesn't need pressure
	attacktext = "hits with the butt of a rifle"
	attack_sound = 'sound/effects/woodhit.ogg'
	ranged = TRUE
	rapid = TRUE
	rapid_fire_shooting_amount = 2
	ranged_cooldown = 3
	projectiletype = /obj/item/projectile/beam/midlaser
	drop_items = list(/obj/item/gun/energy/laser/cult/deepmaints)
	limited_ammo = TRUE
	mag_drop = TRUE
	rounds_left = 10
	mag_type = /obj/item/cell/medium/psion/zero
	mags_left = 2
	var/chameleon_skill = 50
	armor = list(melee = 20, bullet = 15, energy = 15, bomb = 0, bio = 100, rad = 50)

/mob/living/carbon/superior_animal/human/cult/laser/m
	name = "Cultist observer"
	desc = "A cultist equipped with a powerful laser emitter. Thanks to the scope, he can spot you from afar and inform his comrades. However, due to his inability to close combat, he fights much less effectively face-to-face with the enemy."
	icon = 'icons/mob/psicultist/psicult.dmi'
	icon_state = "psisolders_m_laser"
	icon_living = "psisolders_m_laser"
	icon_dead = "cult_soul"

/mob/living/carbon/superior_animal/human/cult/laser/h
	name = "Cultist observer"
	desc = "A cultist equipped with a powerful laser emitter. Thanks to the scope, he can spot you from afar and inform his comrades. However, due to his inability to close combat, he fights much less effectively face-to-face with the enemy."
	icon = 'icons/mob/psicultist/psicult.dmi'
	icon_state = "psisolder_h_laser"
	icon_living = "psisolder_h_laser"
	icon_dead = "cult_soul"

/mob/living/carbon/superior_animal/human/cult/laser/hm
	name = "Cultist observer Adept"
	desc = "A cultist equipped with a powerful laser emitter. Thanks to the scope, he can spot you from afar and inform his comrades. However, due to his inability to close combat, he fights much less effectively face-to-face with the enemy."
	icon = 'icons/mob/psicultist/psicult.dmi'
	icon_state = "psisolder_hm_laser"
	icon_living = "psisolder_hm_laser"
	icon_dead = "cult_soul"
	armor = list(melee = 25, bullet = 15, energy = 15, bomb = 20, bio = 100, rad = 50)

/mob/living/carbon/superior_animal/human/cult/smg
	name = "Cultist raider"
	desc = "This cultist is armed with a light SMG. Quickly catching up with the targets, he performs the role of a stormtrooper in battle, quickly attacking the enemy and finishing the battle in his favor with lightning speed."
	icon = 'icons/mob/psicultist/psicult.dmi'
	icon_state = "psisolder_smg"
	icon_living = "psisolder_smg"
	icon_dead = "cult_soul"
	projectilesound = 'sound/weapons/guns/fire/grease_fire.ogg'
	move_to_delay = 2
	turns_per_move = 4
	stop_automated_movement_when_pulled = 0
	maxHealth = 160
	health = 160
	melee_damage_lower = 15
	melee_damage_upper = 20
	var/knockdown_odds = 60
	breath_required_type = 0 // Doesn't need to breath, in a space suit
	breath_poison_type = 0 // Can't be poisoned
	min_air_pressure = 0 // Doesn't need pressure
	attacktext = "slashed"
	attack_sound = 'sound/effects/woodhit.ogg'
	environment_smash = TRUE
	destroy_surroundings = TRUE
	ranged = TRUE
	rapid = TRUE
	comfy_range = 3
	rapid_fire_shooting_amount = 3
	ranged_cooldown = 1
	projectiletype = /obj/item/projectile/bullet/pistol_35
	drop_items = list(/obj/item/gun/projectile/automatic/greasegun/cult/deepmaints)
	limited_ammo = TRUE
	mag_drop = TRUE
	rounds_left = 12
	mag_type = /obj/item/ammo_magazine/smg_35/empty
	mags_left = 4
	armor = list(melee = 20, bullet = 10, energy = 10, bomb = 30, bio = 100, rad = 50)

/mob/living/carbon/superior_animal/human/cult/smg/m
	name = "Cultist raider"
	desc = "This cultist is armed with a light SMG. Quickly catching up with the targets, he performs the role of a stormtrooper in battle, quickly attacking the enemy and finishing the battle in his favor with lightning speed."
	icon = 'icons/mob/psicultist/psicult.dmi'
	icon_state = "psisolder_m_smg"
	icon_living = "psisolder_m_smg"
	icon_dead = "cult_soul"

/mob/living/carbon/superior_animal/human/cult/smg/h
	name = "Cultist raider"
	desc = "This cultist is armed with a light SMG. Quickly catching up with the targets, he performs the role of a stormtrooper in battle, quickly attacking the enemy and finishing the battle in his favor with lightning speed."
	icon = 'icons/mob/psicultist/psicult.dmi'
	icon_state = "psisolder_h_smg"
	icon_living = "psisolder_h_smg"
	icon_dead = "cult_soul"

/mob/living/carbon/superior_animal/human/cult/smg/hm
	name = "Cultist raider Adept"
	desc = "This cultist is armed with a light SMG. Quickly catching up with the targets, he performs the role of a stormtrooper in battle, quickly attacking the enemy and finishing the battle in his favor with lightning speed."
	icon = 'icons/mob/psicultist/psicult.dmi'
	icon_state = "psisolder_hm_smg"
	icon_living = "psisolder_hm_smg"
	icon_dead = "cult_soul"
	armor = list(melee = 25, bullet = 15, energy = 15, bomb = 35, bio = 100, rad = 50)


/mob/living/carbon/superior_animal/human/cult/cog
	name = "Cultist impaler"
	desc = "A cultist armed with a heavy psionic rifle. The pure energy of a crazy mind pierces being and matter without encountering obstacles.  Only a few members of the cult are honored to carry this weapon."
	icon = 'icons/mob/psicultist/psicult.dmi'
	icon_state = "psisolder_cog"
	icon_living = "psisolder_cog"
	icon_dead = "cult_soul"
	comfy_range = 8
	viewRange = 8
	comfy_distance = 8
	projectilesound = 'sound/weapons/wave.ogg'
	stop_automated_movement_when_pulled = 0
	maxHealth = 200
	health = 200
	melee_damage_lower = 10
	melee_damage_upper = 15
	var/knockdown_odds = 40
	breath_required_type = 0 // Doesn't need to breath, in a space suit
	breath_poison_type = 0 // Can't be poisoned
	min_air_pressure = 0 // Doesn't need pressure
	attacktext = "hits with the butt of a rifle"
	attack_sound = 'sound/effects/woodhit.ogg'
	ranged = TRUE
	rapid = TRUE
	rapid_fire_shooting_amount = 1
	ranged_cooldown = 3
	var/projectile_color = "#53377A"
	projectiletype = /obj/item/projectile/beam/xray/mindlaserxray
	drop_items = list(/obj/item/gun/energy/cog/cult/deepmaints)
	limited_ammo = TRUE
	mag_drop = TRUE
	rounds_left = 8
	mag_type = /obj/item/cell/medium/psion/zero
	mags_left = 1
	light_range = 3
	light_color = "#53377A"
	armor = list(melee = 20, bullet = 20, energy = 20, bomb = 10, bio = 100, rad = 50)

/mob/living/carbon/superior_animal/human/cult/cog/m
	name = "Cultist impaler"
	desc = "A cultist armed with a heavy psionic rifle. The pure energy of a crazy mind pierces being and matter without encountering obstacles.  Only a few members of the cult are honored to carry this weapon."
	icon = 'icons/mob/psicultist/psicult.dmi'
	icon_state = "psisolder_h_cog"
	icon_living = "psisolder_h_cog"
	icon_dead = "cult_soul"

/mob/living/carbon/superior_animal/human/cult/cog/h
	name = "Cultist impaler"
	desc = "A cultist armed with a heavy psionic rifle. The pure energy of a crazy mind pierces being and matter without encountering obstacles.  Only a few members of the cult are honored to carry this weapon."
	icon = 'icons/mob/psicultist/psicult.dmi'
	icon_state = "psisolder_m_cog"
	icon_living = "psisolder_m_cog"
	icon_dead = "cult_soul"

/mob/living/carbon/superior_animal/human/cult/cog/hm
	name = "Cultist impaler Adept"
	desc = "A cultist armed with a heavy psionic rifle. The pure energy of a crazy mind pierces being and matter without encountering obstacles.  Only a few members of the cult are honored to carry this weapon."
	icon = 'icons/mob/psicultist/psicult.dmi'
	icon_state = "psisolder_hm_cog"
	icon_living = "psisolder_hm_cog"
	icon_dead = "cult_soul"
	armor = list(melee = 25, bullet = 25, energy = 25, bomb = 10, bio = 100, rad = 50)

//Melee and range standart cultists.

/mob/living/carbon/superior_animal/human/cult/psishield
	name = "Psionic stormtrooper"
	desc = "A persistent cultist who has learned the basics of psionic manipulation. He has created a shield for himself from the very essence of this place, and uses its energy to counteract you."
	icon = 'icons/mob/psicultist/psicult.dmi'
	icon_state = "psisolder_h_mixpsi"
	icon_living = "psisolder_h_mixpsi"
	icon_dead = "cult_soul"
	flash_resistances = 100
	projectilesound = 'sound/weapons/wave.ogg'
	fire_verb = "kinetic blast"
	comfy_range = 1
	move_to_delay = 2
	stop_automated_movement_when_pulled = 0
	maxHealth = 250
	health = 350 //shield adds 100 non-regen HP
	melee_damage_lower = 25
	melee_damage_upper = 30
	var/knockdown_odds = 20
	breath_required_type = 0 // Doesn't need to breath, in a space suit
	breath_poison_type = 0 // Can't be poisoned
	min_air_pressure = 0 // Doesn't need pressure
	attacktext = "presses with will"
	attack_sound = 'sound/effects/magic/Blind.ogg'
	ranged = TRUE
	rapid = FALSE
	ranged_cooldown = 1
	projectiletype = /obj/item/projectile/kinetic_blast/brutal
	drop_items = list(/obj/item/shield/riot/crusader/psionic)
	limited_ammo = TRUE
	mag_drop = FALSE
	rounds_left = 2 //We get 2 shots then go for melee, this makes us a threat
	armor = list(melee = 35, bullet = 25, energy = 30, bomb = 30, bio = 100, rad = 50) //Shield add +10.

/mob/living/carbon/superior_animal/human/cult/psishield/slip()
	return FALSE
// Can't slip

/mob/living/carbon/superior_animal/human/cult/psishield/start_pulling(var/atom/movable/AM)
	to_chat(src, SPAN_WARNING("Your hand gets stopped preventing you from pulling \the [src]. !"))
	return

/mob/living/carbon/superior_animal/human/cult/psishield/attack_hand(mob/living/carbon/M as mob)
	..()
	var/mob/living/carbon/human/H = M

	switch(M.a_intent)
		if (I_HELP)
			help_shake_act(M)

		if (I_GRAB)
			if(!weakened && stat == CONSCIOUS)
				if(M.stats.getPerk(PERK_ASS_OF_CONCRETE) || M.stats.getPerk(PERK_BRAWN))
					M.visible_message("\red [src] telekinetically breaks the grapple [M] is hit with the force! [M] manages to stay standing!")
					M.adjustBruteLoss(30)
					return 1
				M.visible_message("\red The [src] telekinetically breaks the grapple [M] is hit with the force!")
				M.adjustBruteLoss(30)
				M.Weaken(3)
				return 1
			else
				if(M == src || anchored)
					return 0
				for(var/obj/item/grab/G in src.grabbed_by)
					if(G.assailant == M)
						to_chat(M, SPAN_NOTICE("You already grabbed [src]."))
						return

				var/obj/item/grab/G = new /obj/item/grab(M, src)
				if(buckled)
					to_chat(M, SPAN_NOTICE("You cannot grab [src], \he is buckled in!"))
				if(!G) //the grab will delete itself in New if affecting is anchored
					return

				M.put_in_active_hand(G)
				G.synch()
				LAssailant_weakref = WEAKREF(M)

				M.do_attack_animation(src)
				playsound(loc, 'sound/weapons/thudswoosh.ogg', 50, 1, -1)
				visible_message(SPAN_WARNING("[M] has grabbed [src] passively!"))

				return 1

		if (I_DISARM)
			if (!weakened && (prob(10 + (H.stats.getStat(STAT_ROB) * 0.1))))
				M.visible_message("\red [M] has knocked \the [src] over!")
				playsound(loc, 'sound/weapons/thudswoosh.ogg', 50, 1, -1)
				Weaken(3)

				return 1
			else if(!weakened && stat == CONSCIOUS)
				if(M.stats.getPerk(PERK_ASS_OF_CONCRETE) || M.stats.getPerk(PERK_BRAWN))
					M.visible_message("\red [src] telekinetically breaks the grapple [M] is hit with the force! [M] manages to stay standing!")
					M.adjustBruteLoss(30)
					return 1
				M.visible_message("\red [M] telekinetically breaks the grapple [M] is hit with the force!")
				M.adjustBruteLoss(30)
				M.Weaken(3)
				playsound(loc, 'sound/weapons/punchmiss.ogg', 25, 1, -1)

			M.do_attack_animation(src)

		if (I_HURT)
			var/damage = 3
			if ((stat == CONSCIOUS) && prob(10))
				playsound(loc, 'sound/weapons/punchmiss.ogg', 25, 1, -1)
				M.visible_message("\red [M] missed \the [src]")
			else
				if (istype(H))
					damage += max(0, (H.stats.getStat(STAT_ROB) / 10))
					if (HULK in H.mutations)
						damage *= 2

				playsound(loc, "punch", 25, 1, -1)
				M.visible_message("\red [M] has punched \the [src]")

				adjustBruteLoss(damage)
				updatehealth()
				M.do_attack_animation(src)

				return 1

/mob/living/carbon/superior_animal/human/cult/psishield/getTargets()
	. = ..()

	rounds_left = 2 //Reload us, after all we are now targeting someone new
	ranged = TRUE //Were reloaded we can be ranged once more

/mob/living/carbon/superior_animal/human/cult/psishield/m
	name = "Cultist defender"
	desc = "A cultist who has learned the basics of psionic interaction. Uses a shield created from his damaged will and a high-power laser pistol to destroy heretics."
	icon = 'icons/mob/psicultist/psicult.dmi'
	icon_state = "psisolders_m_mixlaserpistol"
	icon_living = "psisolders_m_mixlaserpistol"
	icon_dead = "cult_soul"
	projectilesound = 'sound/weapons/energy/Taser.ogg'
	comfy_range = 1
	move_to_delay = 2
	stop_automated_movement_when_pulled = 0
	maxHealth = 250
	health = 350 //shield adds 100 non-regen HP
	melee_damage_lower = 25
	melee_damage_upper = 30
	knockdown_odds = 20
	breath_required_type = 0 // Doesn't need to breath, in a space suit
	breath_poison_type = 0 // Can't be poisoned
	min_air_pressure = 0 // Doesn't need pressure
	attacktext = "hits with the butt of the gun"
	attack_sound = 'sound/effects/woodhit.ogg'
	ranged = TRUE
	rapid = TRUE
	rapid_fire_shooting_amount = 2
	ranged_cooldown = 1
	projectiletype = /obj/item/projectile/beam/midlaser
	drop_items = list(/obj/item/shield/riot/crusader/psionic, /obj/item/gun/energy/gun/martin/cult/deepmaints)
	limited_ammo = TRUE
	mag_drop = FALSE
	rounds_left = 2
	armor = list(melee = 35, bullet = 25, energy = 30, bomb = 30, bio = 100, rad = 50) //Shield add +10.

/mob/living/carbon/superior_animal/human/cult/psishield/getTargets()
	. = ..()

	rounds_left = 4 //Reload us, after all we are now targeting someone new
	ranged = TRUE //Were reloaded we can be ranged once more

/mob/living/carbon/superior_animal/human/cult/psishield/hm
	name = "Revenant Adept"
	desc = "A cultist who has learned the basics of psionic interaction. Uses a shield created from his damaged will and a high-power laser pistol to destroy heretics."
	icon = 'icons/mob/psicultist/psicult.dmi'
	icon_state = "psisolderhood_hm_mixplasmapistol"
	icon_living = "psisolderhood_hm_mixplasmapistol"
	icon_dead = "cult_soul"
	projectilesound = 'sound/weapons/energy/Taser.ogg'
	comfy_range = 1
	move_to_delay = 2
	stop_automated_movement_when_pulled = 0
	maxHealth = 260
	health = 360 //shield adds 100 non-regen HP
	melee_damage_lower = 25
	melee_damage_upper = 30
	knockdown_odds = 20
	breath_required_type = 0 // Doesn't need to breath, in a space suit
	breath_poison_type = 0 // Can't be poisoned
	min_air_pressure = 0 // Doesn't need pressure
	attacktext = "hits with the butt of the gun"
	attack_sound = 'sound/effects/woodhit.ogg'
	ranged = TRUE
	rapid = FALSE
	ranged_cooldown = 1
	projectiletype = /obj/item/projectile/plasma/heavy
	drop_items = list(/obj/item/shield/riot/crusader/psionic, /obj/item/gun/energy/plasma/auretian/cult/deepmaints)
	limited_ammo = TRUE
	mag_drop = FALSE
	rounds_left = 2
	armor = list(melee = 40, bullet = 25, energy = 30, bomb = 30, bio = 100, rad = 50) //Shield add +10.

//Heavy juggernaut's

/mob/living/carbon/superior_animal/human/cult/juggernaut
	name = "Psi juggernaut"
	desc = "Clad in heavy armor, this cultist crushes his enemies with heavy blows of reinforced gloves. Show him what you're worth, he craves melee."
	icon = 'icons/mob/psicultist/psicult.dmi'
	icon_state = "psi_juggernaut"
	icon_living = "psi_juggernaut"
	icon_dead = null
	mob_size =  3
	environment_smash = 2
	break_stuff_probability = 95
	flash_resistances = 100
	stop_automated_movement_when_pulled = 0
	speak_chance = 20
	maxHealth = 600
	health = 600
	healing_factor = 15
	melee_damage_lower = 30
	melee_damage_upper = 35
	breath_required_type = 0 // Doesn't need to breath, in a space suit
	breath_poison_type = 0 // Can't be poisoned
	min_air_pressure = 0 // Doesn't need pressure
	attacktext = "smashes"
	attack_sound = 'sound/effects/bang.ogg'
	meat_amount = 0
	meat_type = null
	leather_amount = 0
	bones_amount = 0
	fire_verb = "fires"
	faction = "psi_monster"
	move_to_delay = 3
	var/knockdown_odds = 5
	var/affects_chaos = FALSE
	var/transform_ed = FALSE
	react_to_attack = TRUE
	target_out_of_sight_mode = GUESS_LOCATION_WITH_END_OF_LINE
	out_of_sight_turf_LOS_check = TRUE
	turns_per_move = 10
	turns_since_move = 0
	wander = 1

	light_range = 4
	light_color = "#53377A"

	target_telegraph = "fumbles to ready their weapon, preparing to engage"
	rush_target_telegraph = "quickly snaps their aim toward"

	armor = list(melee = 40, bullet = 60, energy = 30, bomb = 80, bio = 100, rad = 50) //Legitmently their armor

	inherent_mutations = list(MUTATION_HEART, MUTATION_LUNG, MUTATION_LIVER, MUTATION_BLOOD_VESSEL, MUTATION_MUSCLES, MUTATION_NERVES)

	get_stat_modifier = TRUE

	allowed_stat_modifiers = list(
		/datum/stat_modifier/mob/living/carbon/superior_animal/durable = 10,
		/datum/stat_modifier/health/flat/positive/low = 5,
		/datum/stat_modifier/mob/living/carbon/superior_animal/old = 10,
		/datum/stat_modifier/mob/living/carbon/superior_animal/brutish = 5,
		/datum/stat_modifier/mob/living/carbon/superior_animal/brutal = 15,
		/datum/stat_modifier/mob/living/carbon/superior_animal/aggressive/savage = 5,
		/datum/stat_modifier/mob/living/carbon/superior_animal/aggressive = 10,
		/datum/stat_modifier/mob/living/carbon/superior_animal/triggerfinger = 15,
		/datum/stat_modifier/mob/living/carbon/superior_animal/quickdraw = 10,
	)

//They are all waring space suits
	breath_required_type = NONE
	breath_poison_type = NONE
	min_breath_required_type = 0
	min_breath_poison_type = 0

	min_air_pressure = 0
	min_bodytemperature = 0

//Drops
	meat_amount = 0
	meat_type = null

	drop_items = list()

/mob/living/carbon/superior_animal/human/cult/juggernaut/handle_breath(datum/gas_mixture/breath) //we have are own air supplies
	return

/mob/living/carbon/superior_animal/human/cult/juggernaut/handle_environment(var/datum/gas_mixture/environment) //are armor legit is a void suit
	return

/mob/living/carbon/superior_animal/human/cult/juggernaut/start_pulling(var/atom/movable/AM)
	to_chat(src, SPAN_WARNING("Your hand gets pushed away from \the [src]. !"))
	return

/mob/living/carbon/superior_animal/human/cult/juggernaut/emp_act(severity)
	..()
	if(rapid)
		rapid = FALSE
	if(prob(95) && ranged)
		ranged = FALSE

/mob/living/carbon/superior_animal/human/cult/juggernaut/proc/targets_in_range(range = world.view, in_hear_range = FALSE)
	var/list/range_list = list()
	var/list/target_list = list()
	if(in_hear_range)
		range_list = hearers(range, src)
	else
		range_list = range(range, src)
	for(var/atom/movable/M in range_list)
		var/mob/target = M.get_mob()
		if(target)
			target_list += target
	return target_list

/mob/living/carbon/superior_animal/human/cult/juggernaut/proc/use_ability(mob/living/target)
	if(target.faction == "psi_monster")
		return
	if(target == src)
		return

	var/mob/living/carbon/human/H = target
	if(istype(H))
		if(prob(100 - H.stats.getStat(STAT_VIG)))
			H.Weaken(4)
			to_chat(H, SPAN_WARNING("A horrifying roar of primal soul-less terror sears through your mind!"))
		else
			to_chat(H, SPAN_NOTICE("You hear the horrifying roar of a soul-less monster but block out any fear!"))
	else
		target.Weaken(4)
		to_chat(target, SPAN_WARNING("A horrifying roar of primal soul-less terror sears through your mind!"))

/mob/living/carbon/superior_animal/human/cult/juggernaut/Life()
	. = ..()
	if(health <= (maxHealth * 0.3) && transform_ed == FALSE)
		icon_state = "psi_juggernaut_a"
		icon_living = "psi_juggernaut_a"
		icon_dead = "cult_soul"
		armor = list(melee = 0, bullet = 15, energy = 5, bomb = 100, bio = 100, rad = 100)
		environment_smash = 2
		break_stuff_probability = 100
		knockdown_odds = 50
		healing_factor = 15
		melee_damage_lower = 10
		melee_damage_upper = 60
		move_to_delay = 1
		transform_ed = TRUE
		projectiletype = /obj/item/projectile/tether/psionicattraction
		ranged_cooldown = 30
		ear_damage = 1
		eye_blind = 1
		additional_darksight = 3
		delay_for_melee = -1 SECONDS

/mob/living/carbon/superior_animal/human/cult/juggernaut/Bump(var/atom/obstacle)
	.=..()
	if(iscarbon(obstacle))
		var/mob/living/carbon/J = obstacle
		J.take_organ_damage(3)
		say(pick("RHAAAA!", "ROARHR-R-R!", "GHRA-A-AR-RH!"))
		J.throw_at(get_edge_target_turf(src,pick(alldirs)),rand(3,6),30)

/mob/living/carbon/superior_animal/human/cult/juggernaut/proc/regain_range()
	ranged = TRUE


/mob/living/carbon/superior_animal/human/cult/juggernaut/right_after_firing(atom/firing_target, obj/item/projectile/trace_arg)
	ranged = FALSE
	addtimer(CALLBACK(src, .proc/regain_range), 60) // gives some time for the monster to run upto or attack the mob

/mob/living/carbon/superior_animal/human/cult/juggernaut/UnarmedAttack(atom/A, proximity)
	..()
	ranged = TRUE

/mob/living/carbon/superior_animal/human/cult/juggernaut/UnarmedAttack(atom/A, proximity)
	if(isliving(A))
		var/mob/living/L = A
		if(istype(L) && prob(knockdown_odds))
			if(L.stats.getPerk(PERK_ASS_OF_CONCRETE) || L.stats.getPerk(PERK_BRAWN))
				return
			else
				L.Weaken(2)
				L.visible_message(SPAN_DANGER("\the [src] uses its mass to knock over \the [L]!"))
	. = ..()

/mob/living/carbon/superior_animal/human/cult/juggernaut/slip()
	return FALSE
// Can't slip

/mob/living/carbon/superior_animal/human/cult/juggernaut/start_pulling(var/atom/movable/AM)
	to_chat(src, SPAN_WARNING("Your hand gets stopped preventing you from pulling \the [src]. !"))
	return

/mob/living/carbon/superior_animal/human/cult/juggernaut/attack_hand(mob/living/carbon/M as mob)
	..()
	var/mob/living/carbon/human/H = M

	switch(M.a_intent)
		if (I_HELP)
			help_shake_act(M)

		if (I_GRAB)
			if(!weakened && stat == CONSCIOUS)
				if(M.stats.getPerk(PERK_ASS_OF_CONCRETE) || M.stats.getPerk(PERK_BRAWN))
					M.visible_message("\red [src] telekinetically breaks the grapple [M] is hit with the force! [M] manages to stay standing!")
					M.adjustBruteLoss(30)
					return 1
				M.visible_message("\red The [src] telekinetically breaks the grapple [M] is hit with the force!")
				M.adjustBruteLoss(30)
				M.Weaken(3)
				return 1
			else
				if(M == src || anchored)
					return 0
				for(var/obj/item/grab/G in src.grabbed_by)
					if(G.assailant == M)
						to_chat(M, SPAN_NOTICE("You already grabbed [src]."))
						return

				var/obj/item/grab/G = new /obj/item/grab(M, src)
				if(buckled)
					to_chat(M, SPAN_NOTICE("You cannot grab [src], \he is buckled in!"))
				if(!G) //the grab will delete itself in New if affecting is anchored
					return

				M.put_in_active_hand(G)
				G.synch()
				LAssailant_weakref = WEAKREF(M)

				M.do_attack_animation(src)
				playsound(loc, 'sound/weapons/thudswoosh.ogg', 50, 1, -1)
				visible_message(SPAN_WARNING("[M] has grabbed [src] passively!"))

				return 1

		if (I_DISARM)
			if (!weakened && (prob(10 + (H.stats.getStat(STAT_ROB) * 0.1))))
				M.visible_message("\red [M] has knocked \the [src] over!")
				playsound(loc, 'sound/weapons/thudswoosh.ogg', 50, 1, -1)
				Weaken(3)

				return 1
			else if(!weakened && stat == CONSCIOUS)
				if(M.stats.getPerk(PERK_ASS_OF_CONCRETE) || M.stats.getPerk(PERK_BRAWN))
					M.visible_message("\red [src] telekinetically breaks the grapple [M] is hit with the force! [M] manages to stay standing!")
					M.adjustBruteLoss(30)
					return 1
				M.visible_message("\red [M] telekinetically breaks the grapple [M] is hit with the force!")
				M.adjustBruteLoss(30)
				M.Weaken(3)
				playsound(loc, 'sound/weapons/punchmiss.ogg', 25, 1, -1)

			M.do_attack_animation(src)

		if (I_HURT)
			var/damage = 3
			if ((stat == CONSCIOUS) && prob(10))
				playsound(loc, 'sound/weapons/punchmiss.ogg', 25, 1, -1)
				M.visible_message("\red [M] missed \the [src]")
			else
				if (istype(H))
					damage += max(0, (H.stats.getStat(STAT_ROB) / 10))
					if (HULK in H.mutations)
						damage *= 2

				playsound(loc, "punch", 25, 1, -1)
				M.visible_message("\red [M] has punched \the [src]")

				adjustBruteLoss(damage)
				updatehealth()
				M.do_attack_animation(src)

				return 1

//Equipped Juggernauts

/mob/living/carbon/superior_animal/human/cult/juggernaut/enforcer
	name = "Psi juggernaut enforcer"
	desc = "This improved soldier carries an unstable psionic shield. The contour of his equipment distorts reality, and the fierce force field of the shield threatens to tear apart any object that gets into it."
	icon = 'icons/mob/psicultist/psicult.dmi'
	icon_state = "psi_juggernaut_bastion"
	icon_living = "psi_juggernaut_bastion"
	icon_dead = null
	stop_automated_movement_when_pulled = 0
	speak_chance = 20
	maxHealth = 600
	health = 600
	healing_factor = 15
	melee_damage_lower = 20 //-10, an inconvenient shield!
	melee_damage_upper = 25 //-10, an inconvenient shield!
	breath_required_type = 0 // Doesn't need to breath, in a space suit
	breath_poison_type = 0 // Can't be poisoned
	min_air_pressure = 0 // Doesn't need pressure
	attacktext = "smashes"
	attack_sound = 'sound/effects/bang.ogg'
	meat_amount = 0
	meat_type = null
	leather_amount = 0
	bones_amount = 0
	drop_items = list()
	move_to_delay = 999
	fire_verb = "fires"
	knockdown_odds = 15 //+10 YOU ARE BEING ATTACKED BY A LIVING WALL!

	target_telegraph = "fumbles to ready their weapon, preparing to engage"
	rush_target_telegraph = "quickly snaps their aim toward"

	armor = list(melee = 100, bullet = 25, energy = 25, bomb = 100, bio = 100, rad = 50) //The shield gives a powerful boost to melee defense! The complete opposite of a juggernaut with a bronze shield!

/mob/living/carbon/superior_animal/human/cult/juggernaut/enforcer/Life()
	. = ..()
	if(health <= (maxHealth * 0.9) && transform_ed == FALSE)
		icon_state = "psi_juggernaut_shield"
		icon_living = "psi_juggernaut_shield"
		icon_dead = null
		comfy_range = 1
		melee_damage_lower = 20 //-10, an inconvenient shield!
		melee_damage_upper = 25 //-10, an inconvenient shield!
		breath_required_type = 0 // Doesn't need to breath, in a space suit
		breath_poison_type = 0 // Can't be poisoned
		min_air_pressure = 0 // Doesn't need pressure
		attacktext = "smashes"
		attack_sound = 'sound/effects/bang.ogg'
		meat_amount = 0
		meat_type = null
		leather_amount = 0
		bones_amount = 0
		drop_items = list()
		move_to_delay = 2
		fire_verb = "fires"
		knockdown_odds = 15 //+10 YOU ARE BEING ATTACKED BY A LIVING WALL!

		target_telegraph = "fumbles to ready their weapon, preparing to engage"
		rush_target_telegraph = "quickly snaps their aim toward"

		armor = list(melee = 80, bullet = 25, energy = 25, bomb = 80, bio = 100, rad = 50) //The shield gives a powerful boost to melee defense! The complete opposite of a juggernaut with a bronze shield!


//advanced version!

/mob/living/carbon/superior_animal/human/cult/juggernaut/enforcer/advanced
	name = "Executioner enforcer"
	desc = "This fanatic is holding a heavy full-length bronze shield in his hands. Channeling the energy of pure madness, these stormtroopers easily repel any attacks from a distance, but the shield is not as convenient in combat as powerful hydraulic gloves."
	icon = 'icons/mob/psicultist/psicult.dmi'
	icon_state = "psi_juggernaut_glass_shield_bastion"
	icon_living = "psi_juggernaut_glass_shield_bastion"
	icon_dead = null
	stop_automated_movement_when_pulled = 0
	speak_chance = 20
	maxHealth = 650 //+50 glass version!
	health = 650 //+50 glass version!
	healing_factor = 20 //+5 glass version!
	melee_damage_lower = 15 //-15, an inconvenient shield!
	melee_damage_upper = 20 //-15, an inconvenient shield!
	breath_required_type = 0 // Doesn't need to breath, in a space suit
	breath_poison_type = 0 // Can't be poisoned
	min_air_pressure = 0 // Doesn't need pressure
	attacktext = "smashes"
	attack_sound = 'sound/effects/bang.ogg'
	meat_amount = 0
	meat_type = null
	leather_amount = 0
	bones_amount = 0
	drop_items = list()
	move_to_delay = 999
	fire_verb = "fires"
	knockdown_odds = 25 //+20 YOU ARE BEING ATTACKED BY A LIVING WALL!

	target_telegraph = "fumbles to ready their weapon, preparing to engage"
	rush_target_telegraph = "quickly snaps their aim toward"

	armor = list(melee = 40, bullet = 100, energy = 100, bomb = 100, bio = 100, rad = 50) //The shield gives a powerful boost to ranged defense! The complete opposite of a juggernaut with a psionic shield!

/mob/living/carbon/superior_animal/human/cult/juggernaut/enforcer/advanced/Life()
	. = ..()
	if(health <= (maxHealth * 0.9) && transform_ed == FALSE)
		icon_state = "psi_juggernaut_glass_shield"
		icon_living = "psi_juggernaut_glass_shield"
		icon_dead = null
		comfy_range = 1
		melee_damage_lower = 15 //-15, an inconvenient shield!
		melee_damage_upper = 20 //-15, an inconvenient shield!
		breath_required_type = 0 // Doesn't need to breath, in a space suit
		breath_poison_type = 0 // Can't be poisoned
		min_air_pressure = 0 // Doesn't need pressure
		attacktext = "smashes"
		attack_sound = 'sound/effects/bang.ogg'
		meat_amount = 0
		meat_type = null
		leather_amount = 0
		bones_amount = 0
		drop_items = list()
		move_to_delay = 3 //+1 heavy glass version!
		fire_verb = "fires"
		knockdown_odds = 25 //+20 YOU ARE BEING ATTACKED BY A LIVING WALL!

		target_telegraph = "fumbles to ready their weapon, preparing to engage"
		rush_target_telegraph = "quickly snaps their aim toward"

		armor = list(melee = 40, bullet = 80, energy = 90, bomb = 85, bio = 100, rad = 50) //The shield gives a powerful boost to ranged defense! The complete opposite of a juggernaut with a psionic shield!

/mob/living/carbon/superior_animal/human/cult/juggernaut/hammer
	name = "Psi juggernaut destructor"
	desc = "This cultist carries in his hands a heavy hammer melted out of his anger and rage. Beware of his searing attacks."
	icon = 'icons/mob/psicultist/psicult.dmi'
	icon_living = "psi_juggernaut_hummer"
	icon_state = "psi_juggernaut_hummer"
	icon_dead = null
	comfy_range = 1
	stop_automated_movement_when_pulled = 0
	speak_chance = 20
	maxHealth = 600
	health = 600
	healing_factor = 15
	melee_damage_lower = 33
	melee_damage_upper = 44
	delay_for_melee = 3 SECONDS //+1 heavy!
	breath_required_type = 0 // Doesn't need to breath, in a space suit
	breath_poison_type = 0 // Can't be poisoned
	min_air_pressure = 0 // Doesn't need pressure
	attacktext = "smashes"
	attack_sound = 'sound/effects/bang.ogg'
	meat_amount = 0
	meat_type = null
	leather_amount = 0
	bones_amount = 0
	drop_items = list()
	move_to_delay = 3 //+1 Heavy!
	fire_verb = "fires"
	knockdown_odds = 15 //+10 Heavy hammer!
	var/chameleon_skill = 240

	target_telegraph = "fumbles to ready their weapon, preparing to engage"
	rush_target_telegraph = "quickly snaps their aim toward"

	armor = list(melee = 80, bullet = 25, energy = 25, bomb = 80, bio = 100, rad = 50) //The shield gives a powerful boost to melee defense! The complete opposite of a juggernaut with a bronze shield!

/mob/living/carbon/superior_animal/human/cult/juggernaut/hammer/UnarmedAttack(atom/A, proximity)
	if(isliving(A))
		var/mob/living/L = A
		if(istype(L) && prob(knockdown_odds))
			shake_camera(L, 3, 1)
			if(L.stats.getPerk(PERK_ASS_OF_CONCRETE) || L.stats.getPerk(PERK_BRAWN))
				return
			else
				L.Weaken(2)
				L.visible_message(SPAN_DANGER("\the [src] uses its mass to knock over \the [L]!"))
		..()

//advanced version!

/mob/living/carbon/superior_animal/human/cult/juggernaut/hammer/advanced
	name = "Judge juggernaut"
	desc = "This cultist carries the heaviest power hammer. The battle with him can be very difficult, his attacks have crushed more than a hundred skulls of heretics."
	icon = 'icons/mob/psicultist/psicult.dmi'
	icon_living = "psi_juggernaut_powerhummer"
	icon_state = "psi_juggernaut_powerhummer"
	icon_dead = null
	comfy_range = 1
	stop_automated_movement_when_pulled = 0
	speak_chance = 20
	maxHealth = 600
	health = 600
	healing_factor = 15
	melee_damage_lower = 44
	melee_damage_upper = 55
	delay_for_melee = 4 SECONDS //+2 HEAVY!
	breath_required_type = 0 // Doesn't need to breath, in a space suit
	breath_poison_type = 0 // Can't be poisoned
	min_air_pressure = 0 // Doesn't need pressure
	attacktext = "smashes"
	attack_sound = 'sound/effects/bang.ogg'
	meat_amount = 0
	meat_type = null
	leather_amount = 0
	bones_amount = 0
	drop_items = list()
	move_to_delay = 4 //+2 EXTREME HEAVY!
	fire_verb = "fires"
	ranged = TRUE
	projectiletype = /obj/item/projectile/tether/hummercharge
	ranged_cooldown = 60
	knockdown_odds = 20 //+15 HEAVY hammer!

	target_telegraph = "fumbles to ready their weapon, preparing to engage"
	rush_target_telegraph = "quickly snaps their aim toward"

	armor = list(melee = 80, bullet = 25, energy = 25, bomb = 80, bio = 100, rad = 50) //The shield gives a powerful boost to melee defense! The complete opposite of a juggernaut with a bronze shield!

/mob/living/carbon/superior_animal/human/cult/juggernaut/hammer/UnarmedAttack(atom/A, proximity)
	if(isliving(A))
		var/mob/living/L = A
		if(istype(L) && prob(knockdown_odds))
			shake_camera(L, 3, 1)
			if(L.stats.getPerk(PERK_ASS_OF_CONCRETE) || L.stats.getPerk(PERK_BRAWN))
				return
			else
				L.Weaken(2)
				L.visible_message(SPAN_DANGER("\the [src] uses its mass to knock over \the [L]!"))
	. = ..()

/mob/living/carbon/superior_animal/human/cult/juggernaut/powerfist
	name = "Psi juggernaut muscle"
	desc = "One of this juggernaut's gloves has been heavily modified for corridor combat, his armor is reinforced with psionic essence, and his helmet is glazed with a protective mantra. Nothing prevents him from moving fast and hitting painfully."
	icon = 'icons/mob/psicultist/psicult.dmi'
	icon_living = "psi_juggernaut_glass_fist"
	icon_state = "psi_juggernaut_glass_fist"
	icon_dead = null
	comfy_range = 1
	stop_automated_movement_when_pulled = 0
	speak_chance = 20
	maxHealth = 650
	health = 650
	healing_factor = 10
	melee_damage_lower = 33
	melee_damage_upper = 33
	delay_for_melee = 2 SECONDS
	breath_required_type = 0 // Doesn't need to breath, in a space suit
	breath_poison_type = 0 // Can't be poisoned
	min_air_pressure = 0 // Doesn't need pressure
	attacktext = "punch"
	attack_sound = 'sound/effects/bang.ogg'
	meat_amount = 0
	meat_type = null
	leather_amount = 0
	bones_amount = 0
	drop_items = list()
	move_to_delay = 2
	fire_verb = "fires"
	knockdown_odds = 10

	target_telegraph = "fumbles to ready their weapon, preparing to engage"
	rush_target_telegraph = "quickly snaps their aim toward"

	armor = list(melee = 30, bullet = 35, energy = 30, bomb = 100, bio = 100, rad = 50)

/mob/living/carbon/superior_animal/human/cult/juggernaut/hammer/UnarmedAttack(atom/A, proximity)
	if(isliving(A))
		var/mob/living/L = A
		if(istype(L) && prob(knockdown_odds))
			shake_camera(L, 5, 1)
			if(L.stats.getPerk(PERK_ASS_OF_CONCRETE) || L.stats.getPerk(PERK_BRAWN))
				return
			else
				L.Weaken(1)
				L.Stun(1) //Ha-ha Juggernaut makes a punch!
				L.visible_message(SPAN_DANGER("\the [src] uses its mass to knock over \the [L]!"))
		..()

/mob/living/carbon/superior_animal/human/cult/juggernaut/halberd
	name = "Psi juggernaut halberd"
	desc = "One of this juggernaut's gloves has been heavily modified for corridor combat, his armor is reinforced with psionic essence, and his helmet is glazed with a protective mantra. Nothing prevents him from moving fast and hitting painfully."
	icon = 'icons/mob/psicultist/psicult.dmi'
	icon_living = "psi_juggernaut_glass_halberd"
	icon_state = "psi_juggernaut_glass_halberd"
	icon_dead = null
	comfy_range = 1
	stop_automated_movement_when_pulled = 0
	speak_chance = 20
	maxHealth = 650
	health = 650
	healing_factor = 10
	melee_damage_lower = 20
	melee_damage_upper = 30
	delay_for_melee = 2 SECONDS
	breath_required_type = 0 // Doesn't need to breath, in a space suit
	breath_poison_type = 0 // Can't be poisoned
	min_air_pressure = 0 // Doesn't need pressure
	attacktext = "smashes"
	attack_sound = 'sound/effects/woodhit.ogg'
	meat_amount = 0
	meat_type = null
	leather_amount = 0
	bones_amount = 0
	drop_items = list()
	move_to_delay = 2
	fire_verb = "fires"
	knockdown_odds = 30

	target_telegraph = "fumbles to ready their weapon, preparing to engage"
	rush_target_telegraph = "quickly snaps their aim toward"

	armor = list(melee = 35, bullet = 40, energy = 35, bomb = 100, bio = 100, rad = 50)

/mob/living/carbon/superior_animal/human/cult/juggernaut/hammer/UnarmedAttack(atom/A, proximity)
	if(isliving(A))
		var/mob/living/L = A
		if(istype(L) && prob(knockdown_odds))
			shake_camera(L, 1, 1)
			if(L.stats.getPerk(PERK_ASS_OF_CONCRETE) || L.stats.getPerk(PERK_BRAWN))
				return
			else
				L.Stun(2)
				L.Weaken(3)
				L.visible_message(SPAN_DANGER("\the [src] uses its mass to knock over \the [L]!"))
		..()

/mob/living/carbon/superior_animal/human/cult/juggernaut/halberd/Life()
	. = ..()
	if(health <= (maxHealth * 0.9) && transform_ed == FALSE)
		icon_state = "psi_juggernaut_glass_halberd_w"
		icon_living = "psi_juggernaut_glass_halberd_w"
		icon_dead = null
		comfy_range = 1
		melee_damage_lower = 33
		melee_damage_upper = 44
		breath_required_type = 0 // Doesn't need to breath, in a space suit
		breath_poison_type = 0 // Can't be poisoned
		min_air_pressure = 0 // Doesn't need pressure
		attacktext = "cuts"
		attack_sound = 'sound/weapons/slice.ogg'
		meat_amount = 0
		meat_type = null
		leather_amount = 0
		bones_amount = 0
		drop_items = list()
		move_to_delay = 3 //+1 heavy glass version!
		fire_verb = "fires"
		knockdown_odds = 5

		target_telegraph = "fumbles to ready their weapon, preparing to engage"
		rush_target_telegraph = "quickly snaps their aim toward"

		armor = list(melee = 30, bullet = 35, energy = 30, bomb = 100, bio = 100, rad = 50)

/mob/living/carbon/superior_animal/human/cult/juggernaut/halberd/Life()
	. = ..()
	if(health <= (maxHealth * 0.5) && transform_ed == FALSE)
		icon_state = "psi_juggernaut_glass"
		icon_living = "psi_juggernaut_glass"
		icon_dead = null
		comfy_range = 1
		melee_damage_lower = 20
		melee_damage_upper = 25
		delay_for_melee = 1 SECONDS
		breath_required_type = 0 // Doesn't need to breath, in a space suit
		breath_poison_type = 0 // Can't be poisoned
		min_air_pressure = 0 // Doesn't need pressure
		attacktext = "smashes"
		attack_sound = 'sound/effects/bang.ogg'
		meat_amount = 0
		meat_type = null
		leather_amount = 0
		bones_amount = 0
		drop_items = list()
		move_to_delay = 1
		fire_verb = "fires"
		knockdown_odds = 25
		ranged = TRUE
		rapid = FALSE
		ranged_cooldown = 999
		projectiletype = /obj/item/projectile/halberd
		limited_ammo = TRUE
		mag_drop = FALSE
		rounds_left = 1

		target_telegraph = "fumbles to ready their weapon, preparing to engage"
		rush_target_telegraph = "quickly snaps their aim toward"

		armor = list(melee = 20, bullet = 25, energy = 20, bomb = 100, bio = 100, rad = 50)

/mob/living/carbon/superior_animal/human/cult/juggernaut/hammer/UnarmedAttack(atom/A, proximity)
	if(isliving(A))
		var/mob/living/L = A
		if(istype(L) && prob(knockdown_odds))
			shake_camera(L, 1, 1)
			if(L.stats.getPerk(PERK_ASS_OF_CONCRETE) || L.stats.getPerk(PERK_BRAWN))
				return
			else
				L.Stun(1)
				L.take_organ_damage(3)
				L.visible_message(SPAN_DANGER("\the [src] uses its mass to knock over \the [L]!"))
		..()

//Berserk's

/mob/living/carbon/superior_animal/human/cult/juggernaut
	name = "Psi juggernaut"
	desc = "Clad in heavy armor, this cultist crushes his enemies with heavy blows of reinforced gloves. Show him what you're worth, he craves melee."
	icon = 'icons/mob/psicultist/psicult.dmi'
	icon_state = "psi_juggernaut"
	icon_living = "psi_juggernaut"
	icon_dead = null
	mob_size =  3
	environment_smash = 2
	break_stuff_probability = 95
	flash_resistances = 100
	stop_automated_movement_when_pulled = 0
	speak_chance = 20
	maxHealth = 600
	health = 600
	healing_factor = 15
	melee_damage_lower = 30
	melee_damage_upper = 35
	breath_required_type = 0 // Doesn't need to breath, in a space suit
	breath_poison_type = 0 // Can't be poisoned
	min_air_pressure = 0 // Doesn't need pressure
	attacktext = "smashes"
	attack_sound = 'sound/effects/bang.ogg'
	meat_amount = 0
	meat_type = null
	leather_amount = 0
	bones_amount = 0
	fire_verb = "fires"
	faction = "psi_monster"
	move_to_delay = 3
	knockdown_odds = 5
	affects_chaos = FALSE
	transform_ed = FALSE
	react_to_attack = TRUE
	ranged = FALSE
	target_out_of_sight_mode = GUESS_LOCATION_WITH_END_OF_LINE
	out_of_sight_turf_LOS_check = TRUE
	turns_per_move = 10
	turns_since_move = 0
	wander = 1

	light_range = 4
	light_color = "#53377A"

	target_telegraph = "fumbles to ready their weapon, preparing to engage"
	rush_target_telegraph = "quickly snaps their aim toward"

	armor = list(melee = 40, bullet = 60, energy = 30, bomb = 80, bio = 100, rad = 50) //Legitmently their armor

	inherent_mutations = list(MUTATION_HEART, MUTATION_LUNG, MUTATION_LIVER, MUTATION_BLOOD_VESSEL, MUTATION_MUSCLES, MUTATION_NERVES)

/mob/living/carbon/superior_animal/human/cult/juggernaut/butcher/Life()
	. = ..()
	if(health <= (maxHealth * 0.6) && transform_ed == FALSE)
		icon_state = "psi_juggernaut_butcher"
		icon_living = "psi_juggernaut_butcher"
		icon_dead = "cult_soul"
		armor = list(melee = 5, bullet = -10, energy = -5, bomb = 100, bio = 100, rad = 100, agony = 50)
		environment_smash = 2
		break_stuff_probability = 100
		knockdown_odds = 50
		healing_factor = 20
		melee_damage_lower = 10
		melee_damage_upper = 70
		light_range = 4
		light_color = COLOR_LIGHTING_RED_BRIGHT
		move_to_delay = -1
		transform_ed = TRUE
		ranged = TRUE
		rapid = TRUE
		rapid_fire_shooting_amount = 3
		comfy_distance = 1
		projectiletype = /obj/item/projectile/sonic_bolt/punch
		initial_firing_offset = 10
		current_firing_offset = 10
		ranged_cooldown = 30
		ear_damage = 1
		eye_blind = 1
		additional_darksight = 3
		delay_for_melee = -2 SECONDS
		faction = null

/mob/living/carbon/superior_animal/human/cult/juggernaut/butcher/cleaver
	name = "Psi juggernaut butcher"
	desc = "Juggernaut with a huge hunting cleaver. You should be wary of his sweeping attacks, he can very easily penetrate your armor and get to the soft flesh."
	icon = 'icons/mob/psicultist/psicult.dmi'
	icon_living = "psi_juggernaut_cleaver"
	icon_state = "psi_juggernaut_cleaver"
	icon_dead = null
	comfy_range = 1
	stop_automated_movement_when_pulled = 0
	speak_chance = 20
	maxHealth = 650
	health = 650
	healing_factor = 20
	melee_damage_lower = 33
	melee_damage_upper = 33
	delay_for_all = 2 SECONDS
	ranged = FALSE
	delay_for_melee = -1 SECONDS
	breath_required_type = 0 // Doesn't need to breath, in a space suit
	breath_poison_type = 0 // Can't be poisoned
	min_air_pressure = 0 // Doesn't need pressure
	attacktext = "cuts"
	attack_sound = 'sound/weapons/slice.ogg'
	meat_amount = 0
	meat_type = null
	leather_amount = 0
	bones_amount = 0
	drop_items = list()
	move_to_delay = 2
	fire_verb = "fires"
	knockdown_odds = 10
	light_range = 4
	light_color = COLOR_LIGHTING_RED_BRIGHT

	target_telegraph = "fumbles to ready their weapon, preparing to engage"
	rush_target_telegraph = "quickly snaps their aim toward"

	armor = list(melee = 30, bullet = 35, energy = 30, bomb = 100, bio = 100, rad = 50, agony = 10)

/mob/living/carbon/superior_animal/human/cult/juggernaut/butcher/cleaver/UnarmedAttack(atom/A, proximity)
	if(isliving(A))
		var/mob/living/L = A
		if(istype(L) && prob(knockdown_odds))
			shake_camera(L, 5, 1)
			if(L.stats.getPerk(PERK_ASS_OF_CONCRETE) || L.stats.getPerk(PERK_BRAWN))
				return
			else
				L.Weaken(1)
				L.visible_message(SPAN_DANGER("\the [src] uses its mass to knock over \the [L]!"))
		..()

/mob/living/carbon/superior_animal/human/cult/juggernaut/butcher/chainsaw
	name = "Psi juggernaut torturer"
	desc = "A madman armed with a massive chainsaw. His attack speed is no match for anyone else."
	icon = 'icons/mob/psicultist/psicult.dmi'
	icon_living = "psi_juggernaut_saw"
	icon_state = "psi_juggernaut_saw"
	icon_dead = null
	comfy_range = 1
	stop_automated_movement_when_pulled = 0
	speak_chance = 20
	emote_see = list("screams, \"RIP AND TEAR!!\"", "WR-R-R!!", "Wr-r-r...")
	maxHealth = 650
	health = 650
	healing_factor = 25
	melee_damage_lower = 10
	melee_damage_upper = 15
	delay_for_all = 0
	ranged = FALSE
	delay_for_melee = -3 SECONDS
	breath_required_type = 0 // Doesn't need to breath, in a space suit
	breath_poison_type = 0 // Can't be poisoned
	min_air_pressure = 0 // Doesn't need pressure
	attacktext = "cuts"
	attack_sound = 'sound/weapons/circsawhit.ogg'
	meat_amount = 0
	meat_type = null
	leather_amount = 0
	bones_amount = 0
	drop_items = list()
	move_to_delay = 1
	fire_verb = "fires"
	knockdown_odds = 5
	light_range = 4
	light_color = COLOR_LIGHTING_RED_BRIGHT

	target_telegraph = "fumbles to ready their weapon, preparing to engage"
	rush_target_telegraph = "WR-R-R-R!"

	armor = list(melee = 20, bullet = 20, energy = 20, bomb = 100, bio = 100, rad = 50, agony = 10)

/mob/living/carbon/superior_animal/human/cult/juggernaut/butcher/chainsaw/UnarmedAttack(atom/A, proximity)
	if(isliving(A))
		var/mob/living/L = A
		if(istype(L) && prob(knockdown_odds))
			shake_camera(L, 5, 1)
			if(L.stats.getPerk(PERK_ASS_OF_CONCRETE) || L.stats.getPerk(PERK_BRAWN))
				return
			else
				L.Weaken(3)
				L.visible_message(SPAN_DANGER("\the [src] uses its mass to knock over \the [L]!"))
		..()

//Flammer Juggernaut

/mob/living/carbon/superior_animal/human/cult/juggernaut/flammer
	name = "Juggernaut pyroman"
	desc = "This cultist carries the heaviest power hammer. The battle with him can be very difficult, his attacks have crushed more than a hundred skulls of heretics."
	icon = 'icons/mob/psicultist/psicult.dmi'
	icon_living = "psi_juggernaut_flammer"
	icon_state = "psi_juggernaut_flammer"
	icon_dead = null
	comfy_range = 1
	stop_automated_movement_when_pulled = 0
	speak_chance = 20
	maxHealth = 600
	health = 600
	healing_factor = 15
	melee_damage_lower = 44
	melee_damage_upper = 55
	delay_for_melee = 4 SECONDS //+2 HEAVY!
	breath_required_type = 0 // Doesn't need to breath, in a space suit
	breath_poison_type = 0 // Can't be poisoned
	min_air_pressure = 0 // Doesn't need pressure
	attacktext = "smashes"
	attack_sound = 'sound/effects/bang.ogg'
	meat_amount = 0
	meat_type = null
	leather_amount = 0
	bones_amount = 0
	drop_items = list()
	move_to_delay = 6 //+4 EXTREME HEAVY!
	fire_verb = "fires"
	ranged = TRUE
	rapid = TRUE
	rapid_fire_shooting_amount = 3
	projectiletype = /obj/item/projectile/flamer_lob/psi
	ranged_cooldown = 60
	knockdown_odds = 25 //+20 HEAVY flammer!
	eye_blind = 5
	initial_firing_offset = 15
	current_firing_offset = 20

	light_range = 4
	light_color = "#53377A"

	target_telegraph = "fumbles to ready their weapon, preparing to engage"
	rush_target_telegraph = "quickly snaps their aim toward"

	armor = list(melee = 60, bullet = 45, energy = 30, bomb = 80, bio = 100, rad = 50)

/mob/living/carbon/superior_animal/human/cult/juggernaut/hammer/UnarmedAttack(atom/A, proximity)
	if(isliving(A))
		var/mob/living/L = A
		if(istype(L) && prob(knockdown_odds))
			shake_camera(L, 3, 1)
			if(L.stats.getPerk(PERK_ASS_OF_CONCRETE) || L.stats.getPerk(PERK_BRAWN))
				return
			else
				L.Weaken(2)
				L.visible_message(SPAN_DANGER("\the [src] uses its mass to knock over \the [L]!"))
	. = ..()

/mob/living/carbon/superior_animal/human/cult/juggernaut/flammer/Life()
	. = ..()
	if(health <= (maxHealth * 0.3) && transform_ed == FALSE)
		desc = "This cultist carries the heaviest power hammer. The battle with him can be very difficult, his attacks have crushed more than a hundred skulls of heretics."
		icon_dead = null
		armor = list(melee = 40, bullet = 55, energy = 40, bomb = 100, bio = 100, rad = 100)
		move_to_delay = 5

/mob/living/carbon/superior_animal/human/cult/juggernaut/flammer/death()

new/obj/effect/trail_particle/fire/psion
new/obj/effect/decal/cleanable/liquid_fuel/flamethrower_fuel/psi

	explosion(src.loc, 0, 1, 2, 3)

	. = ..()

//Psion's.

