// Normal types of termites
GLOBAL_LIST_INIT(termites_normal, list(/mob/living/carbon/superior_animal/termite/iron,
									/mob/living/carbon/superior_animal/termite/silver,
									/mob/living/carbon/superior_animal/termite/uranium))

// Special types of termites
GLOBAL_LIST_INIT(termites_special, list(/mob/living/carbon/superior_animal/termite/plasma,
									/mob/living/carbon/superior_animal/termite/diamond,
									/mob/living/carbon/superior_animal/termite/osmium))

/mob/living/carbon/superior_animal/termite
	name = "Pekhota termite"
	desc = "A termite, the earth and wood eaters of the colony. Hide your hard-wood kitchen floors and nick-nacks!"
	icon = 'icons/mob/40x40.dmi' // Sprites made by Polyushko#0323
	icon_state = "rabochiy_termite"
	speak_emote = list("clicks")
	emote_see = list("rubs its legs")
	speak_chance = 5
	sanity_damage = 1

	deathmessage = "splatters into gore."
	attacktext = "chomped"
	attack_sound = 'sound/weapons/bite.ogg'
	faction = "wurm"
	fire_verb = "spits"
	see_in_dark = 10

	fleshcolor = "#7C90B8"
	bloodcolor = "#7C90B8"
	armor_divisor = 1

	destroy_surroundings = TRUE
	friendly_to_colony = FALSE
	colony_friend = FALSE
	// Damage multiplier when destroying surroundings
	var/surrounds_mult = 0.5

	// Type of ore to spawn when the termite dies
	var/ore
	var/dropped_ore = FALSE
	// The bane of termite's existence
	var/obj/machinery/mining/drill/DD

	//Controller that spawns the termites
	var/datum/termite_controller/controller

	get_stat_modifier = FALSE

	allowed_stat_modifiers = list(
		/datum/stat_modifier/mob/living/carbon/superior_animal/durable = 20,
		/datum/stat_modifier/mob/living/carbon/superior_animal/biosilicified = 20,
		/datum/stat_modifier/mob/living/carbon/superior_animal/young = 3,
		/datum/stat_modifier/mob/living/carbon/superior_animal/old = 30,
		/datum/stat_modifier/mob/living/carbon/superior_animal/brutish = 15,
		/datum/stat_modifier/mob/living/carbon/superior_animal/brutal = 5,
		/datum/stat_modifier/mob/living/damage/positive/mixed/mult/low = 5,
		/datum/stat_modifier/mob/living/damage/negative/mixed/mult/low = 5,
		/datum/stat_modifier/mob/living/carbon/superior_animal/aggressive/savage = 1,
	)

	range_telegraph = "chitin begins to crack and spikes emerge, as it prepares to launch them at"

	cant_gib = TRUE

/mob/living/carbon/superior_animal/termite/New(loc, obj/machinery/mining/drill/drill, datum/termite_controller/parent)
	..()
	if(parent)
		controller = parent  // Link wurms with wurm controller
		controller.termite += src
	if(drill)

		for(var/O in oview(5, src)) // Check our surroundings.
			if(istype(O, /turf/simulated/mineral)) // Is it a minable turf?
				var/turf/simulated/mineral/M = O
				mine(M) // Mine the turf
				continue


// Mine a tile
/mob/living/carbon/superior_animal/termite/proc/mine(turf/simulated/mineral/M)
	//visible_message("[src] mine [M]") // For some reasons the messages do not combine and spam the chat.
	M.GetDrilled() // Mine the turf
	return TRUE

/mob/living/carbon/superior_animal/termite/Destroy()
	DD = null
	..()

/mob/living/carbon/superior_animal/termite/death(gibbed, message = deathmessage)
	..()

	if(controller) // Unlink from controller
		controller.termite -= src
		controller = null
	. = ..()

// Spawn ores
	if(ore && !dropped_ore)
		dropped_ore = TRUE
		var/nb_ores = rand(3, 5)
		for(var/i in 1 to nb_ores)
			new ore(loc)

	// Poof
	qdel(src)

/mob/living/carbon/superior_animal/termite/destroySurroundings()
	// Get next turf the golem wants to walk on
	var/atom/targetted_mob = (target_mob?.resolve())
	var/turf/T = get_step_towards(src, targetted_mob)

	for (var/dir in alldirs) // All 8 directions
		for(var/obj/machinery/mining/drill/obstacle in get_step(src, dir))//A locker as a block? We will brake it.
			if(obstacle.density == TRUE)
				obstacle.attack_generic(src,rand(melee_damage_lower,melee_damage_upper),pick(attacktext))
				return

	if(iswall(T))  // Wall breaker attack
		T.attack_generic(src, rand(surrounds_mult * melee_damage_lower, surrounds_mult * melee_damage_upper),pick(attacktext), TRUE)
	else
		var/obj/structure/obstacle = locate(/obj/structure) in T
		if(obstacle && !istype(obstacle, /obj/structure/termite_burrow))
			obstacle.attack_generic(src, rand(surrounds_mult * melee_damage_lower, surrounds_mult * melee_damage_upper),pick(attacktext), TRUE)



/mob/living/carbon/superior_animal/termite/handle_ai()
	var/atom/targetted_mob = (target_mob?.resolve())
	// Chance to re-aggro the drill if doing nothing
	if((stance == HOSTILE_STANCE_IDLE) && prob(10))
		if(!busy) // if not busy with a special task
			stop_automated_movement = FALSE
		if(targetted_mob)
			stance = HOSTILE_STANCE_ATTACK
	. = ..()



//////////////////
//Types of Termites//
//////////////////

//Iron Termite - melee, low health, decent damage
/mob/living/carbon/superior_animal/termite/iron
	name = "Pomoshchnik termite"
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
	armor = list(melee = 5, bullet = 3, energy = 3, bomb = 50, bio = 100, rad = 0)

//Loot related variables
	ore = /obj/item/stack/ore/iron


//Silver Termite - melee, slow, high-damage
/mob/living/carbon/superior_animal/termite/silver
	name = "Pushka termite"
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
	armor = list(melee = 8, bullet = 5, energy = 2, bomb = 50, bio = 100, rad = 0)

//Loot related variables
	ore = /obj/item/stack/ore/silver

//Uranium Termite - ranged, slow, med-health, low damage
/mob/living/carbon/superior_animal/termite/uranium
	name = "Smertnik termite"
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
	armor = list(melee = 6, bullet = 3, energy = 2, bomb = 50, bio = 100, rad = 0)

//Loot related variables
	ore = /obj/item/stack/ore/uranium


//Plasma Termite - melee, fast, med-damage
/mob/living/carbon/superior_animal/termite/plasma
	name = "Kop'ye termite"
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
	armor = list(melee = 5, bullet = 3, energy = 6, bomb = 50, bio = 100, rad = 0)

//Loot related variables
	ore = /obj/item/stack/ore/plasma

//Diamond Wurm - melee, doesn't give a fuck, high-damage
/mob/living/carbon/superior_animal/termite/diamond
	name = "Koroleva termite"
	desc = "A huge termite the queen of a local brew ready to crush anything it perseeves as a threat to its hive."
	icon = 'icons/mob/mobs-termite.dmi' // Sprites made by Polyushko#0323
	icon_state = "koroleva_termite"
	icon_dead = "koroleva_gore"
	armor_divisor = 1.5
	get_stat_modifier =  TRUE

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
	armor = list(melee = 6, bullet = 4, energy = 5, bomb = 50, bio = 100, rad = 0)

//Loot related variables
	ore = /obj/item/stack/ore/diamond

//Osmium Termite - ranged, doesn't give a fuck, high-damage
/mob/living/carbon/superior_animal/termite/osmium
	name = "Korol termite"
	desc = "A king termite ready to defend and slay for his queen."
	icon = 'icons/mob/mobs-termite.dmi' // Sprites made by Polyushko#0323
	icon_state = "koroleva_termite"
	icon_dead = "koroleva_gore"
	comfy_range = 6 //How far we like to be form are targets when we fire!
	projectiletype = /obj/item/projectile/bullet/spear
	contaminant_immunity = TRUE
	get_stat_modifier =  TRUE
	armor_divisor = 1.5

//Health related variables
	maxHealth = TERMITE_HEALTH_HIGH
	health = TERMITE_HEALTH_HIGH

//Movement related variables
	move_to_delay = TERMITE_SPEED_SLUG
	turns_per_move = 5

//Damage related variables
	melee_damage_lower = TERMITE_DMG_LOW
	melee_damage_upper = TERMITE_DMG_LOW

	ranged = TRUE

//Armor related variables
	armor = list(melee = 12, bullet = 4, energy = 5, bomb = 50, bio = 100, rad = 0)

//Loot related variables
	ore = /obj/item/stack/ore/osmium
