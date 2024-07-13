/mob/living/carbon/superior_animal/human/xiang
	name = "Xiang Peking Operator"
	desc = "An average height man sporting a orange voidsuit and rebreather. On its shoulder says \"Penal Labor - Pluto Station\". \
			He is wielding a surplus AK, appearing to be worn and its external componants mutilated."
	icon = 'icons/mob/mobs-humanoid.dmi'
	icon_state = "peking"
	icon_dead = "peking_dead"
	stop_automated_movement_when_pulled = 1
	wander = 0
	maxHealth = 100
	health = 100

	armor = list(melee = 7, bullet = 7, energy = 5, bomb = 30, bio = 100, rad = 100)

//range/ammo stuff
	ranged = TRUE
	viewRange = 10
	comfy_range = 7
	rapid = FALSE
	ranged_cooldown = 2
	projectiletype = /obj/item/projectile/beam/weak/rifle_75
	projectilesound = 'sound/weapons/energy/laser_rifle.ogg'
	limited_ammo = TRUE
	mag_drop = TRUE
	rounds_left = 20
	mag_type = /obj/item/ammo_magazine/rifle_75/empty
	mags_left = 6 //1+6
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

	faction = "syndie"	//Temp, don't know what to call this faction

/mob/living/carbon/superior_animal/human/xiang/death()
	..()
	playsound(loc, 'sound/death_gasps/xiang.ogg', 80)
	new /obj/effect/decal/cleanable/blood/gibs(loc)
	qdel(src)

/mob/living/carbon/superior_animal/human/xiang/ronin
	name = "Xiang Ronin Operator"
	desc = "A surprisingly tall person within a heavily armored suit, sporting a large frame as if genetically engineered to be like a tank! \
			Various characters are written across his armor, customized full of Jana writing and old-dead language symbols from Earth."
	icon = 'icons/mob/mobs-humanoid.dmi'
	icon_state = "ronin"
	icon_dead = "ronin_dead"
	stop_automated_movement_when_pulled = 1
	wander = 0
	maxHealth = 150
	health = 150

	armor = list(melee = 17, bullet = 12, energy = 12, bomb = 35, bio = 100, rad = 100)

	ranged = FALSE

	melee_damage_lower = 30
	melee_damage_upper = 40
	attacktext = "stabbed"
	attack_sound = 'sound/weapons/rapidslice.ogg'
