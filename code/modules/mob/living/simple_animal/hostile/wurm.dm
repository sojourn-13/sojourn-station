#define WURM_HEALTH_LOW 25
#define WURM_HEALTH_MED 50
#define WURM_HEALTH_HIGH 75
#define WURM_HEALTH_ULTRA 100

#define WURM_ARMOR_LOW 20
#define WURM_ARMOR_MED 35
#define WURM_ARMOR_HIGH 50
#define WURM_ARMOR_ULTRA 65

#define WURM_DMG_LOW 15
#define WURM_DMG_MED 25
#define WURM_DMG_HIGH 40
#define WURM_DMG_ULTRA 55

#define WURM_SPEED_SLUG 9
#define WURM_SPEED_LOW 7
#define WURM_SPEED_MED 5
#define WURM_SPEED_HIGH 3

// Normal types of wurms
GLOBAL_LIST_INIT(wurms_normal, list(/mob/living/simple_animal/hostile/wurm/iron,
									/mob/living/simple_animal/hostile/wurm/silver))

// Special types of wurms
GLOBAL_LIST_INIT(wurms_special, list(/mob/living/simple_animal/hostile/wurm/osmium,
									/mob/living/simple_animal/hostile/wurm/diamond))

/mob/living/simple_animal/hostile/wurm
	name = "wurm youngling"
	desc = "A plasma eating wurm capable of firing volatile globs of electric acid if they spot prey. Hated by lonestar miners as many do not know it is there until they are hit by acid. This one is merely a youngling and not nearly as dangerous as an adult."
	icon = 'icons/mob/mobs-monster.dmi'
	speak_emote = list("clicks")
	icon_state = "worm_hiding"
	attacktext = "chomped"
	attack_sound = 'sound/weapons/bite.ogg'
	faction = "wurm"
	wander = FALSE
	fire_verb = "spits"
	see_in_dark = 10

	destroy_surroundings = TRUE

	inherent_mutations = list(MUTATION_BLINDNESS, MUTATION_DWARFISM, MUTATION_NERVOUSNESS, MUTATION_DEAF, MUTATION_IMBECILE)

	// Armor related variables
	var/melee = 0
	var/bullet = 0
	var/energy = 0
	var/bomb = 0
	var/bio = 0
	var/rad = 0

	// Damage multiplier when destroying surroundings
	var/surrounds_mult = 0.5

	// Type of ore to spawn when the wurm dies
	var/ore

	// The ennemy of all wurmkind
	var/obj/machinery/mining/drill/DD

	//Controller that spawned the wurm
	var/datum/wurm_controller/controller

/mob/living/simple_animal/hostile/wurm/New(loc, obj/machinery/mining/drill/drill, datum/wurm_controller/parent)
	..()
	if(parent)
		controller = parent  // Link wurms with wurm controller
		controller.wurm += src
	if(drill)
		DD = drill
		if(prob(50))
			target_mob = drill
			stance = HOSTILE_STANCE_ATTACK

/mob/living/simple_animal/hostile/wurm/death(gibbed, deathmessage = "explodes in a shower of ichor and gore!")

	if(controller) // Unlink from controller
		controller.wurm -= src
		controller = null

	// Spawn ores
	if(ore)
		var/nb_ores = rand(3, 5)
		for(var/i in 1 to nb_ores)
			new ore(loc)
	qdel(src)

	..()
	new /obj/effect/gibspawner/generic(src.loc)

/mob/living/simple_animal/hostile/wurm/FindTarget()
	. = ..()
	if(.)
		icon_state = "worm"
		icon_living = "worm"
		wander = 1

/mob/living/simple_animal/hostile/wurm/getarmor(def_zone, type)
	return vars[type]

//////////////////
//Types of Wurms//
//////////////////

//Iron Wurm - ranged, low health
/mob/living/simple_animal/hostile/wurm/iron
	name = "worker wurm"
	desc = "A wurm that does odd-jobs around its colony. Jeez.. even wurms have assistants."
	icon_state = "worm"
	icon_living = "worm"
	ranged = 1
	projectilesound = 'sound/effects/creatures/acid_spit.ogg'
	projectiletype = /obj/item/projectile/goo
	minimum_distance = 4

//Health related variables
	maxHealth = WURM_HEALTH_LOW
	health = WURM_HEALTH_LOW

//Movement related variables
	move_to_delay = WURM_SPEED_MED
	turns_per_move = 5

//Damage related variables
	melee_damage_lower = WURM_DMG_MED
	melee_damage_upper = WURM_DMG_MED

//Armor related variables
	melee = WURM_ARMOR_LOW
	bullet = WURM_ARMOR_MED
	energy = WURM_ARMOR_MED

//Loot related variables
	ore = /obj/item/ore/iron


//Silver Wurm - melee, slow, tanky, low damage
/mob/living/simple_animal/hostile/wurm/silver
	name = "miner wurm"
	desc = "A wurm that has been hardened by the very surface beneath your feet."
	icon_state = "worm"
	icon_living = "worm"

//Health related variables
	maxHealth = WURM_HEALTH_HIGH
	health = WURM_HEALTH_HIGH

//Movement related variables
	move_to_delay = WURM_SPEED_SLUG
	turns_per_move = 5

//Damage related variables
	melee_damage_lower = WURM_DMG_LOW
	melee_damage_upper = WURM_DMG_LOW

//Armor related variables
	melee = WURM_ARMOR_HIGH
	bullet = WURM_ARMOR_MED
	energy = WURM_ARMOR_LOW

//Loot related variables
	ore = /obj/item/ore/silver


//Osmium Wurm - melee, fast, med-damage
/mob/living/simple_animal/hostile/wurm/osmium
	name = "warrior wurm"
	desc = "A larger, scarier wurm for when trouble abrews."
	icon_state = "worm"
	icon_living = "worm"

//Health related variables
	maxHealth = WURM_HEALTH_MED
	health = WURM_HEALTH_MED

//Movement related variables
	move_to_delay = WURM_SPEED_HIGH
	turns_per_move = 5

//Damage related variables
	melee_damage_lower = WURM_DMG_MED
	melee_damage_upper = WURM_DMG_MED

//Armor related variables
	melee = WURM_ARMOR_MED
	bullet = WURM_ARMOR_HIGH
	energy = WURM_ARMOR_LOW

//Loot related variables
	ore = /obj/item/ore/osmium


//Diamond Wurm - melee, doesn't give a fuck, high-damage
/mob/living/simple_animal/hostile/wurm/diamond
	name = "wurm crusher"
	desc = "A huge wurm that specializes in crushing rocks. And heads."
	icon = 'icons/mob/64x64.dmi'
	icon_state = "worm"
	icon_living = "worm"

//Health related variables
	maxHealth = WURM_HEALTH_HIGH
	health = WURM_HEALTH_HIGH

//Movement related variables
	move_to_delay = WURM_SPEED_SLUG
	turns_per_move = 5

//Damage related variables
	melee_damage_lower = WURM_DMG_MED
	melee_damage_upper = WURM_DMG_MED

//Armor related variables
	melee = WURM_ARMOR_LOW
	bullet = WURM_ARMOR_MED
	energy = WURM_ARMOR_HIGH

//Loot related variables
	ore = /obj/item/ore/osmium