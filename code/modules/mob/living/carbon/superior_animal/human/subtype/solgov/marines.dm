/mob/living/carbon/superior_animal/human/marine
	name = "Sol-Fed Rifleman"
	desc = "An average height man sporting Solar Federation Marine armor, a ground-pounding grunt and proud of it. Hoorah."
	icon = 'icons/mob/mobs-humanoid.dmi'
	icon_state = "solfed_trooper"
	icon_dead = "solfed_trooper_dead"
	stop_automated_movement_when_pulled = 1
	wander = 0
	maxHealth = 100
	health = 100

	armor = list(melee = 12, bullet = 12, energy = 11, bomb = 50, bio = 100, rad = 100)

	casingtype = /obj/item/ammo_casing/heavy_rifle_408/spent

    //range/ammo stuff
	ranged = TRUE
	viewRange = 10
	comfy_range = 7
	rapid = FALSE
	ranged_cooldown = 2
	projectiletype = /obj/item/projectile/bullet/heavy_rifle_408
	projectilesound = 'sound/weapons/guns/fire/lmg_fire.ogg'
	limited_ammo = TRUE
	mag_drop = TRUE
	rounds_left = 20
	mag_type = /obj/item/ammo_magazine/heavy_rifle_408/empty
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

	faction = "solfed" //Temp measure to allow Excel turrets and the sort to be used alongside them. Apply faction if wanted for different events.

/mob/living/carbon/superior_animal/human/marine/doTargetMessage()
	. = ..()

	visible_emote("grunts, \"[pick("In my sights!","Come get some!","Seperatist scumbags!", "Frontier Fucks!", "Hoorah!", "Put your hands up!")]")
	playsound(src, 'sound/weapons/TargetOn.ogg', 50, 1, -3)

/mob/living/carbon/superior_animal/human/marine/death()
	if(prob(50))
		playsound(loc, 'sound/death_gasps/marine1.ogg', 80)
	else
		playsound(loc, 'sound/death_gasps/marine2.ogg', 80)
	. = ..()

/mob/living/carbon/superior_animal/human/marine/shield
	name = "Sol-Fed Commando"
	desc = "A Solar Federation ship breacher and close quarters specialist. Sporting a riot shield and a burst-fire firearm appearing to be built into the arm of their armor!"
	icon_state = "solfed_trooper_shield"
	icon_dead = "solfed_trooper_shield_dead"

	armor = list(melee = 15, bullet = 17, energy = 12, bomb = 40, bio = 100, rad = 100)

	casingtype = /obj/item/ammo_casing/magnum_40/spent

	//range/ammo stuff
	rapid = TRUE
	rapid_fire_shooting_amount = 3
	comfy_range = 4
	ranged_cooldown = 2
	projectiletype = /obj/item/projectile/bullet/magnum_40
	projectilesound = 'sound/weapons/guns/fire/vector_fire.ogg'
	limited_ammo = TRUE
	mag_drop = TRUE
	rounds_left = 30
	mag_type = /obj/item/ammo_magazine/smg_magnum_40/empty
	mags_left = 5 //1+5

	melee_damage_lower = 15
	melee_damage_upper = 20

/mob/living/carbon/superior_animal/human/marine/shield/doTargetMessage()
	. = ..()
	visible_emote("grunts, \"[pick("Come get me!","A human shield only costs one life!","Hoorah, mother-fucker!", "Colonial dicks!", "Can't hit me!", "Level 3 plates, bitch!","BANG-BANG-BANG Mother-fucker!")]")
	playsound(src, 'sound/weapons/TargetOn.ogg', 50, 1, -3)

/mob/living/carbon/superior_animal/human/marine/shotgun
	name = "Sol-Fed Heavy Commando"
	desc = "A Solar Federation ship breacher and close quarters specialist. This trooper appears to sport heavier armor and a breaching shotgun, a ground-pounders dream."
	icon_state = "solfed_trooper_shotgun"
	icon_dead = "solfed_trooper_shotgun_dead"

	armor = list(melee = 17, bullet = 13, energy = 10, bomb = 70, bio = 100, rad = 100)

	casingtype = /obj/item/ammo_casing/shotgun/spent

	comfy_range = 4
	ranged_cooldown = 2
	projectiletype = /obj/item/projectile/bullet/shotgun
	projectilesound = 'sound/weapons/guns/fire/shotgunp_fire.ogg'
	limited_ammo = FALSE
	mag_drop = FALSE

	melee_damage_lower = 20
	melee_damage_upper = 25

/mob/living/carbon/superior_animal/human/marine/shotgun/doTargetMessage()
	. = ..()
	visible_emote("grunts, \"[pick("You WISH I use buckshot!","Time for some shotgun-surgery!","I got a slug with your name on it!", "Ker-chunk, baby!", "Hoorah!", "I ain't firin' blanks!", "Come get me, little man!")]")
	playsound(src, 'sound/weapons/TargetOn.ogg', 50, 1, -3)

/mob/living/carbon/superior_animal/human/marine/specialist
	name = "Sol-Fed Combat Specialist"
	desc = "A Solar Federation Marine equiped with a grenade launcher, perfect for both crowd control for military police or clearing defenses with explosives. Based on the grenades on his bandolier.. you don't think he's using tear gas."
	icon_state = "solfed_trooper_specialist"
	icon_dead = "solfed_trooper_specialist_dead"

	maxHealth = 75 //Less health than a noraml person.
	health = 75

	casingtype = null

	comfy_range = 7
	ranged_cooldown = 5
	projectiletype = /obj/item/projectile/bullet/grenade
	projectilesound = 'sound/weapons/guns/fire/GLfire.ogg'
	limited_ammo = FALSE
	mag_drop = FALSE

/mob/living/carbon/superior_animal/human/marine/specialist/doTargetMessage()
	. = ..()
	visible_emote("grunts, \"[pick("Frag out!","I've got a present for you!","Incoming!", "Danger close!", "Grenade out!", "Prepare for a closed-casket, asshole!", "Ain't gonna be much left of you!", "I love a fine red mist!")]")
	playsound(src, 'sound/weapons/TargetOn.ogg', 50, 1, -3)

/mob/living/carbon/superior_animal/human/marine/specialist/death()
	..()
	if(prob(40))
		gibs(loc, null, /obj/effect/gibspawner/human)
		explosion(get_turf(src), 0, 0, 3)
		qdel(src)

/mob/living/carbon/superior_animal/human/marine/heavy
	name = "Sol-Fed Heavy Trooper"
	desc = "A tall human male kitted with reinforced Solar Federastion Marine armor. In his hands is some sort of machine gun, being directly fed through a belt coming from his backpack."
	icon_state = "solfed_trooper_heavy"
	icon_dead = "solfed_trooper_heavy_dead"

	maxHealth = 125 //More than a normal person.
	health = 125

	comfy_range = 6
	rapid = TRUE
	rapid_fire_shooting_amount = 5
	ranged_cooldown = 3
	projectiletype = /obj/item/projectile/bullet/heavy_rifle_408
	projectilesound = 'sound/weapons/guns/fire/lmg_fire.ogg'
	limited_ammo = FALSE
	mag_drop = FALSE

/mob/living/carbon/superior_animal/human/marine/heavy/doTargetMessage()
	. = ..()
	visible_emote("grunts, \"[pick("This machine kills commies!","Come get some!","Fuckin' blast em'!", "I got a round with your name on it!", "Just die already!", "Hah-haaa, you're fuckin' done!", "Make war, not love!")]")
	playsound(src, 'sound/weapons/TargetOn.ogg', 50, 1, -3)

/mob/living/carbon/superior_animal/human/marine/sniper
	name = "Sol-Fed Sniper"
	desc = "A shorter than average human male kitted with light scout armor and Solar Federation patches. His rifle appears to sport multiple customizations, including notches on its stock."
	icon_state = "solfed_trooper_sniper"
	icon_dead = "solfed_trooper_sniper_dead"

	maxHealth = 75 //Less health than a noraml person.
	health = 75

	armor = list(melee = 6, bullet = 10, energy = 8, bomb = 20, bio = 100, rad = 100)

	casingtype = /obj/item/ammo_casing/heavy_rifle_408/hv/spent

	viewRange = 14
	comfy_range = 12
	ranged_cooldown = 4
	projectiletype = /obj/item/projectile/bullet/heavy_rifle_408/hv
	projectilesound = 'sound/weapons/guns/fire/heavy_fire.ogg'

/mob/living/carbon/superior_animal/human/marine/sniper/doTargetMessage()
	. = ..()
	visible_emote("grunts, \"[pick("All lined up.","In my sights.","One shot, one kill.", "Bingo, target spotted.", "Hoo-fuckin'-rah.", "Get fucked, dickweed.")]")
	playsound(src, 'sound/weapons/TargetOn.ogg', 50, 1, -3)
