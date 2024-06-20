
/mob/living/carbon/superior_animal/termite_no_despawn
	name = "Pekhota termite"
	desc = "A termite, the earth and wood eaters of the colony. Hide your hard-wood kitchen floors and nick-nacks!"
	icon = 'icons/mob/40x40.dmi' // Sprites made by Polyushko#0323
	icon_state = "rabochiy_termite"
	icon_dead = "rabochiy_gore"

	speak_emote = list("clicks")
	emote_see = list("rubs its legs")
	speak_chance = 5
	sanity_damage = 1

	deathmessage = "splatters into a bloody mess."
	attacktext = "chomped"
	attack_sound = 'sound/weapons/bite.ogg'
	faction = "wurm"
	fire_verb = "spits"
	see_in_dark = 10
	armor_divisor = 1.1
	density = 0 // Prevents friendly fire between themselves, projectiles will go over them, making them also harder to target.

	fleshcolor = "#7C90B8"
	bloodcolor = "#7C90B8"

	destroy_surroundings = TRUE
	friendly_to_colony = FALSE
	colony_friend = FALSE
	inherent_mutations = list(MUTATION_DEAF, MUTATION_RAND_UNSTABLE, MUTATION_IMBECILE)

	meat_type = /obj/item/reagent_containers/food/snacks/meat/termitemeat
	meat_amount = 3

	range_telegraph = "chitin begins to crack and spikes emerge, as it prepares to launch them at"

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

	// Type of ore to spawn when the termite dies, even in maints we still drop ore correct
	var/ore
	var/dropped_ore = FALSE

// Mine a tile
/mob/living/carbon/superior_animal/termite_no_despawn/proc/mine(turf/simulated/mineral/M)
	//visible_message("[src] mine [M]") // For some reasons the messages do not combine and spam the chat.
	M.GetDrilled() // Mine the turf
	return TRUE


/mob/living/carbon/superior_animal/termite_no_despawn/death(message = deathmessage)
	..()
// Spawn ores
	if(ore && !dropped_ore)
		dropped_ore = TRUE
		var/nb_ores = rand(3, 5)
		for(var/i in 1 to nb_ores)
			new ore(loc)

//////////////////
//Types of Termites//
//////////////////

//Iron Termite - melee, low health, decent damage
/mob/living/carbon/superior_animal/termite_no_despawn/iron
	name = "Pomoshchnik termite"
	desc = "A termite that does the hard labor and odd-jobs around its colony. Jeez.. even termites have assistants."
	icon_state = "rabochiy_termite" // Sprites made by Polyushko#0323
	icon_dead = "rabochiy_gore"
	projectilesound = 'sound/effects/creatures/acid_spit.ogg'
	projectiletype = /obj/item/projectile/bullet/rock
	inherent_mutations = list(MUTATION_DEAF, MUTATION_RAND_UNSTABLE, MUTATION_IMBECILE)

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
/mob/living/carbon/superior_animal/termite_no_despawn/silver
	name = "Pushka termite"
	desc = "A larger, scarier termite for when trouble abrews."
	icon_state = "pekhota_termite" // Sprites made by Polyushko#0323
	icon_dead = "pekhota_gore"
	inherent_mutations = list(MUTATION_DEAF, MUTATION_RAND_UNSTABLE, MUTATION_CLUMSY)

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
/mob/living/carbon/superior_animal/termite_no_despawn/uranium
	name = "Smertnik termite"
	desc = "A miner termite that has been hardened by the very surface beneath your feet."
	icon_state = "smertnik_termite" // Sprites made by Polyushko#0323
	icon_dead = "smertnik_gore_exploded"
	ranged = TRUE
	comfy_range = 6 //How far we like to be form are targets when we fire!
	projectiletype = /obj/item/projectile/bullet/rock
	contaminant_immunity = TRUE
	inherent_mutations = list(MUTATION_DEAF, MUTATION_RAND_UNSTABLE, MUTATION_RAD_PROTECTION)

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
/mob/living/carbon/superior_animal/termite_no_despawn/plasma
	name = "Kop'ye termite"
	desc = "A larger, scarier termite for when trouble abrews."
	icon_state = "pushka_termite" // Sprites made by Polyushko#0323
	icon_dead = "pushka_gore"
	inherent_mutations = list(MUTATION_DEAF, MUTATION_RAND_UNSTABLE, MUTATION_BOMB_RESIST)

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
/mob/living/carbon/superior_animal/termite_no_despawn/diamond
	name = "Koroleva termite"
	desc = "A huge termite the queen of a local brew ready to crush anything it perseeves as a threat to its hive."
	icon = 'icons/mob/mobs-termite.dmi' // Sprites made by Polyushko#0323
	icon_state = "koroleva_termite"
	icon_dead = "koroleva_gore"
	armor_divisor = 1.3
	get_stat_modifier =  TRUE
	inherent_mutations = list(MUTATION_DEAF, MUTATION_RAND_UNSTABLE, MUTATION_GIGANTISM, MUTATION_PROT_MILK, MUTATION_TERMITE_FRIEND)

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
/mob/living/carbon/superior_animal/termite_no_despawn/osmium
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
	inherent_mutations = list(MUTATION_DEAF, MUTATION_RAND_UNSTABLE, MUTATION_GIGANTISM, MUTATION_SCREAMING)

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
