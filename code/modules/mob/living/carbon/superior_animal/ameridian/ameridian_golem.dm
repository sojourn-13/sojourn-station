/mob/living/carbon/superior_animal/ameridian_golem
	name = "ameridian golem"
	desc = "A weird creature made of ameridian"
	icon = 'icons/obj/ameridian.dmi'
	icon_state = "golem_ameridian" // Sprite from Eris, I don't know who made them. -R4d6
	faction = "ameridian"
	attacktext = "smashed"
	breath_required_type = 0 // Doesn't need to breath, in a space suit
	breath_poison_type = 0 // Can't be poisoned
	min_air_pressure = 0 // Doesn't need pressure
	move_to_delay = 4
	turns_per_move = 5
	light_range = 2
	light_color = COLOR_LIGHTING_GREEN_BRIGHT
	mob_classification = CLASSIFICATION_SYNTHETIC

	armor = list(melee = 30, bullet = 20, energy = 35, bomb = 30, bio = 100, rad = 100) //We want to be gunned down, not lasered

	do_gibs = FALSE

	attack_sound = 'sound/weapons/heavysmash.ogg' //So we dont make bite sounds

	deathmessage = "shatters in a pile of rubbles."
	health = 100
	maxHealth = 100
	melee_damage_lower = 10
	melee_damage_upper = 25
	leather_amount = 0
	bones_amount = 0
	randpixel = 0
	viewRange = 8
	reagent_immune = TRUE
	toxin_immune = TRUE
	cold_protection = 1
	heat_protection = 1
	can_burrow = FALSE
	colony_friend = FALSE
	friendly_to_colony = FALSE
	known_languages = list(LANGUAGE_COMMON)
	var/obj/structure/ameridian_crystal/node

/mob/living/carbon/superior_animal/ameridian_golem/death()
	..()
	new /obj/item/stack/material/ameridian(get_turf(src))
	node?.golem = null // Remove the golem from the node since for some reason it doesn't do it with qdel()
	qdel(src)

// Beefier variant
/mob/living/carbon/superior_animal/ameridian_golem/strong
	name = "ameridian behemoth"
	desc = "A weird creature made of ameridian. It is bigger, stronger and pakc a harder punch than its brethen."
	icon_state = "golem_ameridian_purple"
	health = 500
	max_health = 500
	melee_damage_lower = 40
	melee_damage_upper = 50
	move_to_delay = 2
	armor = list(melee = 70, bullet = 60, energy = 80, bomb = 40, bio = 100, rad = 100) //We want to be gunned down, not lasered

/mob/living/carbon/superior_animal/ameridian_golem/strong/New()
	..()
	transform = initial(transform)
	transform *= 1.5 // 50% bigger
