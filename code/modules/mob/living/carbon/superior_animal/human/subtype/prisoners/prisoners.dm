/mob/living/carbon/superior_animal/human/prisoner
	name = "Escaped Convict Gunman"
	desc = "An average height man sporting a orange voidsuit and rebreather. On its shoulder says \"Penal Labor - Pluto Station\". \
			He is wielding a surplus AK, appearing to be worn and its external componants mutilated."
	icon = 'icons/mob/mobs-humanoid.dmi'
	icon_state = "prisoner"
	icon_dead = "prisoner_dead"
	stop_automated_movement_when_pulled = 1
	wander = 0
	maxHealth = 75
	health = 75

	armor = list(melee = 7, bullet = 7, energy = 5, bomb = 30, bio = 100, rad = 100)

//range/ammo stuff
	ranged = TRUE
	viewRange = 10
	comfy_range = 7
	rapid = FALSE
	ranged_cooldown = 2
	projectiletype = /obj/item/projectile/bullet/rifle_75
	projectilesound = 'sound/weapons/guns/fire/lmg_fire.ogg'
	limited_ammo = TRUE
	mag_drop = TRUE
	rounds_left = 20
	mag_type = /obj/item/ammo_magazine/rifle_75/empty
	mags_left = 3 //1+3
	delay_for_range = 1.0 SECONDS

	melee_damage_lower = 10
	melee_damage_upper = 15
	breath_required_type = 0 // Doesn't need to breath for event atmosphere purposes.
	breath_poison_type = 0 // Can't be poisoned
	min_air_pressure = 0 // Doesn't need pressure for event atmosphere purposes.
	attacktext = "punched"
	attack_sound = 'sound/weapons/punch1.ogg'
	meat_amount = 0
	meat_type = null
	leather_amount = 0
	bones_amount = 0

	breath_required_type = NONE
	breath_poison_type = NONE
	min_breath_required_type = 0
	min_breath_poison_type = 0

	min_air_pressure = 0
	min_bodytemperature = 0

	can_burrow = FALSE
	colony_friend = FALSE
	friendly_to_colony = FALSE

	never_stimulate_air = TRUE

	faction = "prisoner"

/mob/living/carbon/superior_animal/human/prisoner/melee
	name = "Escaped Convict Pyscho"
	desc = "An average height man sporting a orange voidsuit and rebreather. On its shoulder says \"Penal Labor - Pluto Station\". \
			He is wielding a knife and makeshift shield, pieces of scrap appear to be used to reinforce said shield and his armor."
	icon = 'icons/mob/mobs-humanoid.dmi'
	icon_state = "prisoner_melee"
	icon_dead = "prisoner_dead"
	stop_automated_movement_when_pulled = 1
	wander = 0
	maxHealth = 100
	health = 100

	armor = list(melee = 10, bullet = 10, energy = 6, bomb = 35, bio = 100, rad = 100)

	ranged = FALSE

	melee_damage_lower = 20
	melee_damage_upper = 25
	attacktext = "stabbed"
	attack_sound = 'sound/weapons/sharphit.ogg'
	melee_sharp = TRUE //Eswords and welders

/mob/living/carbon/superior_animal/human/prisoner/elite
	name = "Escaped Convict Looter"
	desc = "An average height man sporting a orange voidsuit and rebreather. On its shoulder says \"Penal Labor - Pluto Station\". \
			He appears to have gotten his hands on a surplus shotgun; it even has Sol-Fed based gun numbers on it."
	icon = 'icons/mob/mobs-humanoid.dmi'
	icon_state = "prisoner_shotgun"
	icon_dead = "prisoner_dead"
	stop_automated_movement_when_pulled = 1
	wander = 0
	maxHealth = 125
	health = 125

	armor = list(melee = 11, bullet = 11, energy = 7, bomb = 40, bio = 100, rad = 100)

	casingtype = /obj/item/ammo_casing/shotgun/spent

	rapid_fire_shooting_amount = 2 //KER-BLAM!!
	rapid = TRUE
	comfy_range = 4
	ranged_cooldown = 2
	projectiletype = /obj/item/projectile/bullet/shotgun
	projectilesound = 'sound/weapons/guns/fire/shotgunp_fire.ogg'
	limited_ammo = FALSE
	mag_drop = FALSE

	melee_damage_lower = 15
	melee_damage_upper = 20
