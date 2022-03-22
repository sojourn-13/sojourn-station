/mob/living/carbon/superior_animal/tiberium_golem
	name = "tiberium golem"
	desc = "A weird creature made of tiberium"
	icon = 'icons/obj/tiberium.dmi'
	icon_state = "golem_tiberium"
	faction = "tiberium"
	attacktext = "smashed"
	breath_required_type = 0 // Doesn't need to breath, in a space suit
	breath_poison_type = 0 // Can't be poisoned
	min_air_pressure = 0 // Doesn't need pressure
	move_to_delay = 4
	turns_per_move = 5
	light_range = 3
	light_color = COLOR_LIGHTING_GREEN_DARK
	mob_classification = CLASSIFICATION_SYNTHETIC

	armor = list(melee = 30, bullet = 20, energy = 35, bomb = 30, bio = 100, rad = 100) //We want to be gunned down, not lasered

	do_gibs = FALSE

	attack_sound = 'sound/weapons/slice.ogg' //So we dont make bite sounds

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


/mob/living/carbon/superior_animal/tiberium_golem/death()
	..()
	new /obj/item/stack/material/tiberium(get_turf(src))
	qdel(src)
