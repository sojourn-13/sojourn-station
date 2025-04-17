//Silver Bird
/mob/living/carbon/superior/vox/posin_thrower
	name = "Arginto Ciriklo"
	desc = "A small predator native to these lands. They are known for their limited craftsmanship and manipulation of objects. This one has spears coated in something..."
	icon_state = "vox_silversynth"

	melee_damage_lower = 12
	melee_damage_upper = 16

	projectiletype = /obj/item/projectile/bullet/spear/toxic
	limited_ammo = TRUE
	mag_drop = FALSE
	rounds_left = 1
	mag_type = /obj/item/stack/ore
	mags_left = 3
	rounds_per_fire = 1
	reload_message = "picks up a hidden spear!"
	fire_verb = "flings a makeshift spear"

//Coal Bird
/mob/living/carbon/superior/vox/thrower_spear
	name = "Kovlo Ciriklo"
	desc = "A small predator native to these lands. They are known for their limited craftsmanship and manipulation of objects. This one throws spears with deadly speed!"
	icon_state = "vox_abyssal"

	melee_damage_lower = 12
	melee_damage_upper = 16

	projectiletype = /obj/item/projectile/bullet/spear
	limited_ammo = TRUE
	mag_drop = FALSE
	rounds_left = 2
	mag_type = /obj/item/stack/ore
	mags_left = 2
	rounds_per_fire = 2
	reload_message = "picks up a hidden spear!"
	fire_verb = "flings a makeshift spear"

//
/mob/living/carbon/superior/vox/armord
	name = "Solarno Ciriklo"
	desc = "A small predator native to these lands. They are known for their limited craftsmanship and manipulation of objects. This one's chest looks rather tougher than the rest of them."
	icon_state = "vox_solar"

	melee_damage_lower = 18
	melee_damage_upper = 20

	reload_message = "picks up a rock!"

	armor = list(melee = 8, bullet = 5, energy = 0, bomb = 50, bio = 0, rad = 0)

	ranged = FALSE
	armor_divisor = 1.25

//Hidden Bird
/mob/living/carbon/superior/vox/hider
	name = "Garavdo Ciriklo"
	desc = "A small predator native to these lands. They are known for their limited craftsmanship and manipulation of objects. This one is harder to see as it stalks low to the ground, hiding in bushes or other shadows."
	icon_state = "vox_ultraviolet"

	melee_damage_lower = 16
	melee_damage_upper = 22
	alpha = 50

	knock_over_odds = 15

	reload_message = "picks up a rock!"

	maxHealth = 35 * VOXBIRD_HEALTH_MOD //Glass cannon
	health = 35 * VOXBIRD_HEALTH_MOD

/mob/living/carbon/superior/vox/hider/UnarmedAttack()
	. = ..()
	alpha = 255

/mob/living/carbon/superior/vox/hider/findTarget()
	. = ..()
	alpha = 50

/mob/living/carbon/superior/vox/hider/death()
	. = ..()
	alpha = 255

//Feathery Bird
/mob/living/carbon/superior/vox/ashen
	name = "Ciriklo Pherdo"
	desc = "A small predator native to these lands. They are known for their limited craftsmanship and manipulation of objects. It looks rather strong."
	icon_state = "vox_pitchblack"

	turns_per_move = 7
	see_in_dark = 20

	melee_damage_lower = 24
	melee_damage_upper = 28

	knock_over_odds = 35

	reload_message = "picks up a rock!"

	maxHealth = 90 * VOXBIRD_HEALTH_MOD
	health = 90 * VOXBIRD_HEALTH_MOD
	armor_divisor = 1.25

/mob/living/carbon/superior/vox/weak
	name = "Slabo Ciriklo"
	desc = "A small predator native to these lands. They are known for their limited craftsmanship and manipulation of objects. This one is young but still deadly."
	icon_state = "vox_acid"

	melee_damage_lower = 12
	melee_damage_upper = 15

	reload_message = "picks up a rock!"

	knock_over_odds = 15

	maxHealth = 35 * VOXBIRD_HEALTH_MOD
	health = 35 * VOXBIRD_HEALTH_MOD

//Rage Bird
/mob/living/carbon/superior/vox/rage
	name = "Xoli Ciriklo"
	desc = "A small predator native to these lands. They are known for their limited craftsmanship and manipulation of objects. Their long arms pack a stronger than normal punch."
	icon_state = "vox_infrared"

	reload_message = "picks up a rock!"

	melee_damage_lower = 32
	melee_damage_upper = 35

	knock_over_odds = 25
	armor_divisor = 1.25

//Looking Bird
/mob/living/carbon/superior/vox/scout
	name = "Dikhindoj Ciriklo"
	desc = "A small predator native to these lands. They are known for their limited craftsmanship and manipulation of objects. This one is caked with dirt and grime, with a shank in its hands and plates of crude scrap armor on its chest."
//	icon_state = "vox_brave"
	icon_state = "grayscale" // CFW - Quickfix, vox_brave doesn't exist

	melee_damage_lower = 23
	melee_damage_upper = 20

	attacktext = "slashes"

	knock_over_odds = 30

	armor = list(melee = 10, bullet = 8, energy = 2, bomb = 60, bio = 0, rad = 0)
	ranged = FALSE

	can_burrow = TRUE
