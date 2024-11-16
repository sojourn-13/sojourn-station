#define WURM_HEALTH_LOW 25
#define WURM_HEALTH_MED 50
#define WURM_HEALTH_HIGH 75
#define WURM_HEALTH_ULTRA 100

//#define WURM_ARMOR_LOW 20
//#define WURM_ARMOR_MED 35
//#define WURM_ARMOR_HIGH 50
//#define WURM_ARMOR_ULTRA 65

#define WURM_DMG_LOW 15
#define WURM_DMG_MED 25
#define WURM_DMG_HIGH 40
#define WURM_DMG_ULTRA 55

#define WURM_SPEED_SLUG 9
#define WURM_SPEED_LOW 7
#define WURM_SPEED_MED 5
#define WURM_SPEED_HIGH 3
/*
// Normal types of wurms
GLOBAL_LIST_INIT(wurms_normal, list(/mob/living/carbon/superior_animal/wurm/iron,
									/mob/living/carbon/superior_animal/wurm/silver))

// Special types of wurms
GLOBAL_LIST_INIT(wurms_special, list(/mob/living/carbon/superior_animal/wurm/osmium,
									/mob/living/carbon/superior_animal/wurm/diamond))
*/
/mob/living/carbon/superior_animal/wurm
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
	cant_gib = TRUE
	sanity_damage = 1

	destroy_surroundings = TRUE

	//inherent_mutations = list(MUTATION_BLINDNESS, MUTATION_DWARFISM, MUTATION_NERVOUSNESS, MUTATION_DEAF, MUTATION_IMBECILE) - Cant be used so dont track these

	contaminant_immunity = TRUE
	cold_protection = 1
	heat_protection = 1
	breath_required_type = 0
	breath_poison_type = 0
	min_breath_required_type = 0
	min_breath_poison_type = 0
	min_air_pressure = 0 //below this, brute damage is dealt
	max_air_pressure = 10000 //above this, brute damage is dealt
	min_bodytemperature = 0 //below this, burn damage is dealt
	max_bodytemperature = 10000 //above this, burn damage is dealt
	friendly_to_colony = FALSE
	/* Armor related variables - Soj edit we have are own
	var/melee = 0
	var/bullet = 0
	var/energy = 0
	var/bomb = 0
	var/bio = 0
	var/rad = 0

	 Damage multiplier when destroying surroundings*/
	var/surrounds_mult = 0.5

	// Type of ore to spawn when the wurm dies
	var/ore
	var/drops_ore = TRUE

	// The ennemy of all wurmkind
	//var/obj/machinery/mining/drill/DD

	//Controller that spawned the wurm
	//var/datum/wurm_controller/controller

	range_telegraph = "starts to wobble at"
/mob/living/carbon/superior_animal/wurm/New(loc, obj/machinery/mining/drill/drill) //datum/wurm_controller/parent
	..()
	/*iif(parent)
		controller = parent  // Link wurms with wurm controller
		controller.wurm += src
	f(drill)
		DD = drill
		if(prob(50))
			target_mob  = drill
			stance = HOSTILE_STANCE_ATTACK

		for(var/O in oview(5, src)) // Check our surroundings.
			if(istype(O, /turf/simulated/mineral)) // Is it a minable turf?
				var/turf/simulated/mineral/M = O
				mine(M) // Mine the turf
				continue*/

// Mine a tile
/mob/living/carbon/superior_animal/wurm/proc/mine(turf/simulated/mineral/M)
	//visible_message("[src] mine [M]") // For some reasons the messages do not combine and spam the chat.
	M.GetDrilled() // Mine the turf
	return TRUE

/mob/living/carbon/superior_animal/wurm/isValidAttackTarget(atom/O)
	// wurms can actively try to attack the drill
	//if(istype(O, /obj/machinery/mining/drill))
	//	return TRUE
	return ..()

/mob/living/carbon/superior_animal/wurm/death(gibbed, deathmessage = "explodes in a shower of acidic ichor and gore that quickly melts into the ground!")

	//if(controller) // Unlink from controller
	//	controller.wurm -= src
	//	controller = null

	// Spawn ores
	if(ore && (drops_ore == TRUE))
		var/nb_ores = rand(3, 5)
		for(var/i in 1 to nb_ores)
			new ore(loc)

	..() //THIS MUST BE BEFORE QDEL!! OTHERWISE YOU END UP ADDING THE MOB TO THE DEAD MOB LIST POST-DESTROY!!!

	qdel(src)

	//new /obj/effect/gibspawner/generic(loc) - This one is just anti-lag not really needed to giv these

//////////////////
//Types of Wurms//
//////////////////

//Iron Wurm - ranged, low health
/mob/living/carbon/superior_animal/wurm/iron
	name = "worker wurm"
	desc = "A wurm that does odd-jobs around its colony. Jeez.. even wurms have assistants."
	icon_state = "worm"
	icon_living = "worm"
	ranged = 1
	projectilesound = 'sound/effects/creatures/acid_spit.ogg'
	projectiletype = /obj/item/projectile/goo

//Health related variables
	maxHealth = WURM_HEALTH_LOW * CAVEMOB_HEALTH_MOD
	health = WURM_HEALTH_LOW * CAVEMOB_HEALTH_MOD

//Movement related variables
	move_to_delay = WURM_SPEED_MED
	turns_per_move = 5

//Damage related variables
	melee_damage_lower = WURM_DMG_MED
	melee_damage_upper = WURM_DMG_MED

//Armor related variables
	armor = list(melee = 5, bullet = 8, energy = 8, bomb = 50, bio = 100, rad = 0)

//Loot related variables
	ore = /obj/item/stack/ore/iron


//Silver Wurm - melee, slow, tanky, low damage
/mob/living/carbon/superior_animal/wurm/silver
	name = "miner wurm"
	desc = "A wurm that has been hardened by the very surface beneath your feet."
	icon_state = "worm"
	icon_living = "worm"

//Health related variables
	maxHealth = WURM_HEALTH_HIGH * CAVEMOB_HEALTH_MOD
	health = WURM_HEALTH_HIGH * CAVEMOB_HEALTH_MOD

//Movement related variables
	move_to_delay = WURM_SPEED_SLUG
	turns_per_move = 5

//Damage related variables
	melee_damage_lower = WURM_DMG_LOW
	melee_damage_upper = WURM_DMG_LOW

//Armor related variables
	armor = list(melee = 12, bullet = 8, energy = 5, bomb = 50, bio = 100, rad = 0)

//Loot related variables
	ore = /obj/item/stack/ore/silver


//Osmium Wurm - melee, fast, med-damage
/mob/living/carbon/superior_animal/wurm/osmium
	name = "warrior wurm"
	desc = "A larger, scarier wurm for when trouble abrews."
	icon_state = "worm"
	icon_living = "worm"

//Health related variables
	maxHealth = WURM_HEALTH_MED * CAVEMOB_HEALTH_MOD
	health = WURM_HEALTH_MED * CAVEMOB_HEALTH_MOD

//Movement related variables
	move_to_delay = WURM_SPEED_HIGH
	turns_per_move = 5

//Damage related variables
	melee_damage_lower = WURM_DMG_MED
	melee_damage_upper = WURM_DMG_MED

//Armor related variables
	armor = list(melee = 8, bullet = 14, energy = 5, bomb = 50, bio = 100, rad = 0)

//Loot related variables
	ore = /obj/item/stack/ore/osmium


//Diamond Wurm - melee, doesn't give a fuck, high-damage
/mob/living/carbon/superior_animal/wurm/diamond
	name = "wurm crusher"
	desc = "A huge wurm that specializes in crushing rocks. And heads."
	icon = 'icons/mob/64x64.dmi'
	icon_state = "worm"
	icon_living = "worm"

//Health related variables
	maxHealth = WURM_HEALTH_HIGH * CAVEMOB_HEALTH_MOD
	health = WURM_HEALTH_HIGH * CAVEMOB_HEALTH_MOD

//Movement related variables
	move_to_delay = WURM_SPEED_SLUG
	turns_per_move = 5

//Damage related variables
	melee_damage_lower = WURM_DMG_MED
	melee_damage_upper = WURM_DMG_MED

//Armor related variables
	armor = list(melee = 5, bullet = 8, energy = 12, bomb = 50, bio = 100, rad = 0)

//Loot related variables
	ore = /obj/item/stack/ore/osmium


//Wurm summon for genetics. Friendly to colony. Colony isn't friendly to it.
/mob/living/carbon/superior_animal/wurm/guardian
	name = "wurm guardian"
	desc = "A huge wurm that has come to someone's aid."
	icon = 'icons/mob/64x64.dmi'
	icon_state = "worm"
	icon_living = "worm"
	friendly_to_colony = TRUE
	destroy_surroundings = FALSE

//Health related variables
	maxHealth = WURM_HEALTH_HIGH * CAVEMOB_HEALTH_MOD
	health = WURM_HEALTH_HIGH * CAVEMOB_HEALTH_MOD

//Movement related variables
	move_to_delay = WURM_SPEED_SLUG
	turns_per_move = 5

//Damage related variables
	melee_damage_lower = WURM_DMG_MED
	melee_damage_upper = WURM_DMG_MED

//Armor related variables
	armor = list(melee = 5, bullet = 8, energy = 12, bomb = 50, bio = 100, rad = 0)

//Loot related variables
	ore = /obj/item/stack/ore/iron // given something just in case.
	drops_ore = FALSE
