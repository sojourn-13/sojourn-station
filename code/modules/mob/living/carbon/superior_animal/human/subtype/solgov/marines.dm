/mob/living/carbon/superior_animal/human/marine
	name = "Sol-Fed Rifleman"
	desc = "An average height man sporting Solar Federation Marine armor, a ground-pounding grunt and proud of it. Hoorah."
	icon = 'icons/mob/mobs-humanoid.dmi'
	icon_state = "solfed_trooper"
	icon_dead = "solfed_trooper_dead"
	stop_automated_movement_when_pulled = 1
	wander = 0
	maxHealth = 150 //About as much health as a normal person
	health = 150

	armor = list(melee = 50, bullet = 50, energy = 45, bomb = 50, bio = 100, rad = 100)

	speak_emote = list("In my sights!","Come get some!","Seperatist scumbags!", "Frontier Fucks!", "Hoorah!", "Put your hands up!")

    //range/ammo stuff
	ranged = 1
	viewRange = 10
	comfy_range = 7
	rapid = 0
	ranged_cooldown = 2
	projectiletype = /obj/item/projectile/bullet/heavy_rifle_408
	projectilesound = 'sound/weapons/guns/fire/lmg_fire.ogg'
	limited_ammo = TRUE
	mag_drop = TRUE
	rounds_left = 20
	mag_type = /obj/item/ammo_magazine/heavy_rifle_408/empty
	mags_left = 2 //1+2


	melee_damage_lower = 10
	melee_damage_upper = 15
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

/mob/living/carbon/superior_animal/human/marine/shield
	name = "Sol-Fed Commando"
	desc = "A Solar Federation ship breacher and close quarters specialist. Sporting a riot shield and a burst-fire firearm appearing to be built into the arm of their armor!"
	icon_state = "solfed_trooper_shield"
	icon_dead = "solfed_trooper_shield_dead"

	armor = list(melee = 60, bullet = 70, energy = 50, bomb = 40, bio = 100, rad = 100)

	speak_emote = list("Come get me!","A human shield only costs one life!","Hoorah, mother-fucker!", "Colonial dicks!", "Can't hit me!", "Level 3 plates, bitch!","BANG-BANG-BANG Mother-fucker!")

	//range/ammo stuff
	rapid = 1
	comfy_range = 4
	rapid_fire_shooting_amount = 2
	ranged_cooldown = 2
	projectiletype = /obj/item/projectile/bullet/magnum_40
	projectilesound = 'sound/weapons/guns/fire/vector_fire.ogg'
	limited_ammo = TRUE
	mag_drop = TRUE
	rounds_left = 30
	mag_type = /obj/item/ammo_magazine/smg_magnum_40/empty
	mags_left = 1 //1+1

	melee_damage_lower = 15
	melee_damage_upper = 20

/mob/living/carbon/superior_animal/human/marine/shotgun
	name = "Sol-Fed Heavy Commando"
	desc = "A Solar Federation ship breacher and close quarters specialist. This trooper appears to sport heavier armor and a breaching shotgun, a ground-pounders dream."
	icon_state = "solfed_trooper_shotgun"
	icon_dead = "solfed_trooper_shotgun_dead"

	armor = list(melee = 70, bullet = 55, energy = 40, bomb = 70, bio = 100, rad = 100)

	speak_emote = list("You WISH I use buckshot!","Time for some shotgun-surgery!","I got a slug with your name on it!", "Ker-chunk, baby!", "Hoorah!", "I ain't firin' blanks!", "Come get me, little man!")

	comfy_range = 4
	ranged_cooldown = 3
	projectiletype = /obj/item/projectile/bullet/shotgun
	projectilesound = 'sound/weapons/guns/fire/shotgunp_fire.ogg'
	limited_ammo = FALSE
	mag_drop = FALSE

	melee_damage_lower = 20
	melee_damage_upper = 25

/mob/living/carbon/superior_animal/human/marine/specialist
	name = "Sol-Fed Combat Specialist"
	desc = "A Solar Federation Marine equiped with a grenade launcher, perfect for both crowd control for military police or clearing defenses with explosives. Based on the grenades on his bandolier.. you don't think he's using tear gas."
	icon_state = "solfed_trooper_specialist"
	icon_dead = "solfed_trooper_specialist_dead"

	maxHealth = 125 //Less health than a noraml person.
	health = 125

	speak_emote = list("Frag out!","I've got a present for you!","Incoming!", "Danger close!", "Grenade out!", "Prepare for a closed-casket, asshole!", "Ain't gonna be much left of you!", "I love a fine red mist!")

	comfy_range = 7
	ranged_cooldown = 5
	projectiletype = /obj/item/projectile/bullet/grenade
	projectilesound = 'sound/weapons/guns/fire/grenadelauncher_fire.ogg'
	limited_ammo = FALSE
	mag_drop = FALSE

/mob/living/carbon/superior_animal/human/marine/specialist/death()
	..()
	if(prob 20)
		gibs(loc, null, /obj/effect/gibspawner/human)
		explosion(get_turf(src), 0, 0, 3)
		qdel(src)

/mob/living/carbon/superior_animal/human/marine/heavy
	name = "Sol-Fed Heavy Trooper"
	desc = "A tall human male kitted with reinforced Solar Federastion Marine armor. In his hands is some sort of machine gun, being directly fed through a belt coming from his backpack."
	icon_state = "solfed_trooper_heavy"
	icon_dead = "solfed_trooper_heavy_dead"

	maxHealth = 175 //More than a normal person.
	health = 175

	speak_emote = list("This machine kills commies!","Come get some!","Fuckin' blast em'!", "I got a round with your name on it!", "Just die already!", "Hah-haaa, you're fuckin' done!", "Make war, not love!")

	comfy_range = 6
	rapid = 1
	rapid_fire_shooting_amount = 5
	ranged_cooldown = 4
	projectiletype = /obj/item/projectile/bullet/heavy_rifle_408
	projectilesound = 'sound/weapons/guns/fire/lmg_fire.ogg'
	limited_ammo = FALSE
	mag_drop = FALSE

/mob/living/carbon/superior_animal/human/marine/sniper
	name = "Sol-Fed Sniper"
	desc = "A shorter than average human male kitted with light scout armor and Solar Federation patches. His rifle appears to sport multiple customizations, including notches on its stock."
	icon_state = "solfed_trooper_sniper"
	icon_dead = "solfed_trooper_sniper_dead"

	maxHealth = 100 //Less health than a noraml person.
	health = 100

	speak_emote = list("All lined up.","In my sights.","One shot, one kill.", "Bingo, target spotted.", "Hoo-fuckin'-rah.", "Get fucked, dickweed.")

	armor = list(melee = 25, bullet = 40, energy = 35, bomb = 20, bio = 100, rad = 100)

	viewRange = 14
	comfy_range = 12
	ranged_cooldown = 4
	projectiletype = /obj/item/projectile/bullet/heavy_rifle_408/hv
	projectilesound = 'sound/weapons/guns/fire/heavy_fire.ogg'
