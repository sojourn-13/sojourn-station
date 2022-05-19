#define TERMITE_HEALTH_LOW 25
#define TERMITE_HEALTH_MED 50
#define TERMITE_HEALTH_HIGH 75
#define TERMITE_HEALTH_ULTRA 100

#define TERMITE_DMG_LOW 15
#define TERMITE_DMG_MED 25
#define TERMITE_DMG_HIGH 40
#define TERMITE_DMG_ULTRA 55

#define TERMITE_SPEED_SLUG 9
#define TERMITE_SPEED_LOW 7
#define TERMITE_SPEED_MED 5
#define TERMITE_SPEED_HIGH 3


// Normal types of termites
GLOBAL_LIST_INIT(termites_normal, list(/mob/living/carbon/superior_animal/termite/iron,
									/mob/living/carbon/superior_animal/termite/silver,
									/mob/living/carbon/superior_animal/termite/uranium))

// Special types of termites
GLOBAL_LIST_INIT(termites_special, list(/mob/living/carbon/superior_animal/termite/plasma,
									/mob/living/carbon/superior_animal/termite/diamond,
									/mob/living/carbon/superior_animal/termite/osmium))

/mob/living/carbon/superior_animal/termite
	name = "termite"
	desc = "A termite, the earth and wood eaters of the colony. Hide your hard-wood kitchen floors and nick-nacks!"
	icon = 'icons/mob/40x40.dmi' // Sprites made by Polyushko#0323
	icon_state = "rabochiy_termite"
	speak_emote = list("clicks")
	emote_see = list("rubs its legs")
	speak_chance = 5

	deathmessage = "splatters into gore."
	attacktext = "chomped"
	attack_sound = 'sound/weapons/bite.ogg'
	faction = "wurm"
	fire_verb = "spits"
	see_in_dark = 10

	fleshcolor = "#7C90B8"
	bloodcolor = "#7C90B8"


	destroy_surroundings = TRUE
	friendly_to_colony = FALSE
	colony_friend = FALSE
	// Damage multiplier when destroying surroundings
	var/surrounds_mult = 0.5

	// Type of ore to spawn when the termite dies
	var/ore

	// The bane of termite's existence
	var/obj/machinery/mining/drill/DD

	//Controller that spawns the termites
	var/datum/termite_controller/controller

/mob/living/carbon/superior_animal/termite/New(loc, obj/machinery/mining/drill/drill, datum/termite_controller/parent)
	..()
/*	if(parent)
		controller = parent  // Link wurms with wurm controller
		controller.termite += src
	if(drill)
		DD = drill
		if(prob(50))
			target_mob = WEAKREF(drill)
			stance = HOSTILE_STANCE_ATTACK

		for(var/O in oview(5, src)) // Check our surroundings.
			if(istype(O, /turf/simulated/mineral)) // Is it a minable turf?
				var/turf/simulated/mineral/M = O
				mine(M) // Mine the turf
				continue*/

// Mine a tile
/mob/living/carbon/superior_animal/termite/proc/mine(var/turf/simulated/mineral/M)
	//visible_message("[src] mine [M]") // For some reasons the messages do not combine and spam the chat.
	M.GetDrilled() // Mine the turf
	return TRUE
/*
/mob/living/carbon/superior_animal/temite/isValidAttackTarget(atom/O)
	// termites can actively try to attack the drill
	if(istype(O, /obj/machinery/mining/drill))
		return TRUE
	return ..()*/

/mob/living/carbon/superior_animal/termite/Destroy()
	DD = null
	..()

/mob/living/carbon/superior_animal/termite/death(gibbed, message = deathmessage)
	..()
/*
	if(controller) // Unlink from controller
		controller.termite -= src
		controller = null
	. = ..()*/

// Spawn ores
	if(ore)
		var/nb_ores = rand(3, 5)
		for(var/i in 1 to nb_ores)
			new ore(loc)

	// Poof
	qdel(src)

/mob/living/carbon/superior_animal/termite/destroySurroundings()
	// Get next turf the golem wants to walk on
	var/atom/targetted_mob = (target_mob?.resolve())
	var/turf/T = get_step_towards(src, targetted_mob)

	if(iswall(T))  // Wall breaker attack
		T.attack_generic(src, rand(surrounds_mult * melee_damage_lower, surrounds_mult * melee_damage_upper), attacktext, TRUE)
	else
		var/obj/structure/obstacle = locate(/obj/structure) in T
		if(obstacle && !istype(obstacle, /obj/structure/termite_burrow))
			obstacle.attack_generic(src, rand(surrounds_mult * melee_damage_lower, surrounds_mult * melee_damage_upper), attacktext, TRUE)

/mob/living/carbon/superior_animal/termite/handle_ai()
	var/atom/targetted_mob = (target_mob?.resolve())
	// Chance to re-aggro the drill if doing nothing
	if((stance == HOSTILE_STANCE_IDLE) && prob(10))
		if(!busy) // if not busy with a special task
			stop_automated_movement = FALSE
		target_mob = WEAKREF(DD)
		if(targetted_mob)
			stance = HOSTILE_STANCE_ATTACK
	. = ..()



//////////////////
//Types of Termites//
//////////////////

//Iron Termite - melee, low health, decent damage
/mob/living/carbon/superior_animal/termite/iron
	name = "worker termite"
	desc = "A termite that does the hard labor and odd-jobs around its colony. Jeez.. even termites have assistants."
	icon_state = "rabochiy_termite" // Sprites made by Polyushko#0323
	icon_dead = "rabochiy_gore"
	projectilesound = 'sound/effects/creatures/acid_spit.ogg'
	projectiletype = /obj/item/projectile/bullet/rock

//Health related variables
	maxHealth = TERMITE_HEALTH_LOW
	health = TERMITE_HEALTH_LOW

//Movement related variables
	move_to_delay = TERMITE_SPEED_MED
	turns_per_move = 5

//Damage related variables
	melee_damage_lower = TERMITE_DMG_MED
	melee_damage_upper = TERMITE_DMG_MED

//Armor related variables
	armor = list(melee = 20, bullet = 35, energy = 35, bomb = 50, bio = 100, rad = 0)

//Loot related variables
	ore = /obj/item/stack/ore/iron


//Silver Termite - melee, slow, high-damage
/mob/living/carbon/superior_animal/termite/silver
	name = "warrior termite"
	desc = "A larger, scarier termite for when trouble abrews."
	icon_state = "pekhota_termite" // Sprites made by Polyushko#0323
	icon_dead = "pekhota_gore"

//Health related variables
	maxHealth = TERMITE_HEALTH_MED
	health = TERMITE_HEALTH_MED

//Movement related variables
	move_to_delay = TERMITE_SPEED_SLUG
	turns_per_move = 5

//Damage related variables
	melee_damage_lower = TERMITE_DMG_HIGH
	melee_damage_upper = TERMITE_DMG_HIGH

//Armor related variables
	armor = list(melee = 35, bullet = 59, energy = 20, bomb = 50, bio = 100, rad = 0)

//Loot related variables
	ore = /obj/item/stack/ore/silver


//Uranium Termite - ranged, slow, med-health, low damage
/mob/living/carbon/superior_animal/termite/uranium
	name = "miner termite"
	desc = "A miner termite that has been hardened by the very surface beneath your feet."
	icon_state = "smertnik_termite" // Sprites made by Polyushko#0323
	icon_dead = "smertnik_gore_exploded"
	ranged = TRUE
	comfy_range = 6 //How far we like to be form are targets when we fire!
	projectiletype = /obj/item/projectile/bullet/rock
	contaminant_immunity = TRUE

//Health related variables
	maxHealth = TERMITE_HEALTH_MED
	health = TERMITE_HEALTH_MED

//Movement related variables
	move_to_delay = TERMITE_SPEED_SLUG
	turns_per_move = 5

//Damage related variables
	melee_damage_lower = TERMITE_DMG_LOW
	melee_damage_upper = TERMITE_DMG_LOW

//Armor related variables
	armor = list(melee = 50, bullet = 35, energy = 20, bomb = 50, bio = 100, rad = 0)

//Loot related variables
	ore = /obj/item/stack/ore/uranium


//Plasma Termite - melee, fast, med-damage
/mob/living/carbon/superior_animal/termite/plasma
	name = "warrior termite"
	desc = "A larger, scarier termite for when trouble abrews."
	icon_state = "pushka_termite" // Sprites made by Polyushko#0323
	icon_dead = "pushka_gore"

//Health related variables
	maxHealth = TERMITE_HEALTH_LOW
	health = TERMITE_HEALTH_LOW

//Movement related variables
	move_to_delay = TERMITE_SPEED_HIGH
	turns_per_move = 5

//Damage related variables
	melee_damage_lower = TERMITE_DMG_MED
	melee_damage_upper = TERMITE_DMG_MED

//Armor related variables
	armor = list(melee = 20, bullet = 30, energy = 50, bomb = 50, bio = 100, rad = 0)

//Loot related variables
	ore = /obj/item/stack/ore/plasma


//Diamond Wurm - melee, doesn't give a fuck, high-damage
/mob/living/carbon/superior_animal/termite/diamond
	name = "termite crusher"
	desc = "A huge termite that specializes in crushing rocks. And heads."
	icon = 'icons/mob/mobs-termite.dmi' // Sprites made by Polyushko#0323
	icon_state = "koroleva_termite"
	icon_dead = "koroleva_gore"

//Health related variables
	maxHealth = TERMITE_HEALTH_HIGH
	health = TERMITE_HEALTH_HIGH

//Movement related variables
	move_to_delay = TERMITE_SPEED_SLUG
	turns_per_move = 5

//Damage related variables
	melee_damage_lower = TERMITE_DMG_HIGH
	melee_damage_upper = TERMITE_DMG_HIGH

//Armor related variables
	armor = list(melee = 25, bullet = 40, energy = 50, bomb = 50, bio = 100, rad = 0)

//Loot related variables
	ore = /obj/item/stack/ore/diamond


//Osmium Termite - melee, doesn't give a fuck, high-damage
/mob/living/carbon/superior_animal/termite/osmium
	name = "termite king"
	desc = "A king termite ready to defend and slay for his queen."
	icon = 'icons/mob/mobs-termite.dmi' // Sprites made by Polyushko#0323
	icon_state = "koroleva_termite"
	icon_dead = "koroleva_gore"
	comfy_range = 6 //How far we like to be form are targets when we fire!
	projectiletype = /obj/item/projectile/bullet/spear
	contaminant_immunity = TRUE

//Health related variables
	maxHealth = TERMITE_HEALTH_HIGH
	health = TERMITE_HEALTH_HIGH

//Movement related variables
	move_to_delay = TERMITE_SPEED_SLUG
	turns_per_move = 5

//Damage related variables
	melee_damage_lower = TERMITE_DMG_LOW
	melee_damage_upper = TERMITE_DMG_LOW

//Armor related variables
	armor = list(melee = 50, bullet = 30, energy = 40, bomb = 50, bio = 100, rad = 0)

//Loot related variables
	ore = /obj/item/stack/ore/osmium
