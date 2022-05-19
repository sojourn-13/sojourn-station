
/mob/living/carbon/superior_animal/termite_no_despawn
	name = "termite"
	desc = "A termite, the earth and wood eaters of the colony. Hide your hard-wood kitchen floors and nick-nacks!"
	icon = 'icons/mob/40x40.dmi' // Sprites made by Polyushko#0323
	icon_state = "rabochiy_termite"
	icon_dead = "rabochiy_gore"

	speak_emote = list("clicks")
	emote_see = list("rubs its legs")
	speak_chance = 5

	deathmessage = "splatters into a bloody mess."
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

	meat_type = /obj/item/reagent_containers/food/snacks/meat/termitemeat
	meat_amount = 3

	// Type of ore to spawn when the termite dies, even in maints we still drop ore correct
	var/ore

// Mine a tile
/mob/living/carbon/superior_animal/termite_no_despawn/proc/mine(var/turf/simulated/mineral/M)
	//visible_message("[src] mine [M]") // For some reasons the messages do not combine and spam the chat.
	M.GetDrilled() // Mine the turf
	return TRUE


/mob/living/carbon/superior_animal/termite_no_despawn/death(message = deathmessage)
	..()
// Spawn ores
	if(ore)
		var/nb_ores = rand(3, 5)
		for(var/i in 1 to nb_ores)
			new ore(loc)

//////////////////
//Types of Termites//
//////////////////

//Iron Termite - melee, low health, decent damage
/mob/living/carbon/superior_animal/termite_no_despawn/iron
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
/mob/living/carbon/superior_animal/termite_no_despawn/silver
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
/mob/living/carbon/superior_animal/termite_no_despawn/uranium
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
/mob/living/carbon/superior_animal/termite_no_despawn/plasma
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
/mob/living/carbon/superior_animal/termite_no_despawn/diamond
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
/mob/living/carbon/superior_animal/termite_no_despawn/osmium
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
