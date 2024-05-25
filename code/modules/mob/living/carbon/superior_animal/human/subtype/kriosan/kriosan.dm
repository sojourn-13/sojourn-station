/mob/living/carbon/superior_animal/human/rebel
	name = "Rebel Trooper"
	desc = "A mid-height Kriosian in heavy, battle scarred armor in the colors of the Kriosian Rebels. This one sporting a simple Strelki rifle and rig for extra ammo."
	icon = 'icons/mob/mobs-humanoid.dmi'
	icon_state = "kriosan_troop_scout"
	icon_dead = "kriosan_troop_scout_dead"
	stop_automated_movement_when_pulled = 1
	wander = 0
	maxHealth = 100
	health = 100

	armor = list(melee = 12, bullet = 12, energy = 11, bomb = 50, bio = 100, rad = 100)

    //range/ammo stuff
	ranged = 1
	viewRange = 10
	comfy_range = 7
	rapid = 0
	ranged_cooldown = 2
	projectiletype = /obj/item/projectile/bullet/rifle_75
	projectilesound = 'sound/weapons/guns/fire/lmg_fire.ogg'
	limited_ammo = TRUE
	mag_drop = TRUE
	rounds_left = 10
	mag_type = /obj/item/ammo_magazine/rifle_75/empty
	mags_left = 2 //1+2


	melee_damage_lower = 10
	melee_damage_upper = 15
	melee_sharp = TRUE //claws
	breath_required_type = 0 // Doesn't need to breath for event atmosphere purposes.
	breath_poison_type = 0 // Can't be poisoned
	min_air_pressure = 0 // Doesn't need pressure for event atmosphere purposes.
	attacktext = "slashed"
	attack_sound = 'sound/weapons/bladeslice.ogg'
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
	faction = "excelsior" //Temp measure to allow Excel turrets and the sort to be used alongside them. Apply faction if wanted for different events.

/mob/living/carbon/superior_animal/human/rebel/shield
	name = "Rebel Shield Trooper"
	desc = "A mid-height Kriosian in heavy, battle scarred armor in the colors of the Kriosian Rebels. This one sporting a ballistic riot shield and an SMG along with his insignia marked heavy rig."
	icon_state = "kriosan_troop_riot"
	icon_dead = "kriosan_troop_riot_dead"

	armor = list(melee = 15, bullet = 17, energy = 12, bomb = 40, bio = 100, rad = 100)

	//range/ammo stuff
	rapid = 1
	comfy_range = 4
	rapid_fire_shooting_amount = 3
	ranged_cooldown = 3
	projectiletype = /obj/item/projectile/bullet/pistol_35
	projectilesound = 'sound/weapons/guns/fire/9mm_pistol.ogg'
	limited_ammo = TRUE
	mag_drop = TRUE
	rounds_left = 32
	mag_type = /obj/item/ammo_magazine/smg_35/empty
	mags_left = 1 //1+1

	melee_damage_lower = 15
	melee_damage_upper = 20

/mob/living/carbon/superior_animal/human/rebel/heavy
	name = "Rebel Heavy Trooper"
	desc = "A mid-height Kriosian in heavy, battle scarred armor in the colors of the Kriosian Rebels. This one sporting a Fenrir heavy chaingun and a bandolier of ammo over his chest."
	icon_state = "kriosan_troop_chaingun"
	icon_dead = "kriosan_troop_chaingun_dead"

	armor = list(melee = 17, bullet = 13, energy = 10, bomb = 70, bio = 100, rad = 100)


	rapid = 1
	comfy_range = 6
	rapid_fire_shooting_amount = 4
	ranged_cooldown = 5
	projectiletype = /obj/item/projectile/bullet/heavy_rifle_408
	projectilesound = 'sound/weapons/guns/fire/chaingun_fire.ogg'
	limited_ammo = FALSE
	mag_drop = FALSE

	melee_damage_lower = 20
	melee_damage_upper = 25
