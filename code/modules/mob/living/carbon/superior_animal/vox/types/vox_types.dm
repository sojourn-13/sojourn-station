/mob/living/carbon/superior_animal/vox/posin_thrower
	name = "Mai jefa guba"
	desc = "A small predictor that is native to the lands. They are known for their limited craftsmanship and manipulation of objects. This one has spears coated in something..."
	icon_state = "vox_silversynth"

	melee_damage_lower = 12
	melee_damage_upper = 16

	projectiletype = /obj/item/projectile/bullet/spear/toxic
	limited_ammo = TRUE
	mag_drop = FALSE
	rounds_left = 1
	mag_type = /obj/item/weapon/ore
	mags_left = 3
	rounds_per_fire = 1
	reload_message = "picks up a hidden spear!"

/mob/living/carbon/superior_animal/vox/thrower_spear
	name = "Sararin samaniya"
	desc = "A small predictor that is native to the lands. They are known for their limited craftsmanship and manipulation of objects. This one throws spears with deadly speed!"
	icon_state = "vox_abyssal"

	melee_damage_lower = 12
	melee_damage_upper = 16

	projectiletype = /obj/item/projectile/bullet/spear
	limited_ammo = TRUE
	mag_drop = FALSE
	rounds_left = 2
	mag_type = /obj/item/weapon/ore
	mags_left = 2
	rounds_per_fire = 2
	reload_message = "picks up a hidden spear!"

/mob/living/carbon/superior_animal/vox/armord
	name = "Garkuwar bango"
	desc = "A small predictor that is native to the lands. They are known for their limited craftsmanship and manipulation of objects. This ones chest looks rather tougher."
	icon_state = "vox_solar"

	melee_damage_lower = 18
	melee_damage_upper = 20

	armor = list(melee = 40, bullet = 30, energy = 10, bomb = 50, bio = 0, rad = 0)

	ranged = FALSE

/mob/living/carbon/superior_animal/vox/hider
	name = "Inuwa kisa"
	desc = "A small predictor that is native to the lands. They are known for their limited craftsmanship and manipulation of objects. This one is harder to see as it stalks low to the ground hiding in bushes or other shadows."
	icon_state = "vox_ultraviolet"

	melee_damage_lower = 16
	melee_damage_upper = 22
	alpha = 50

	knock_over_odds = 15

	maxHealth = 70 //Glass cannon
	health = 70

/mob/living/carbon/superior_animal/vox/hider/UnarmedAttack()
	..()
	alpha = 255

/mob/living/carbon/superior_animal/vox/hider/getPotentialTargets()
	..()
	alpha = 50

/mob/living/carbon/superior_animal/vox/hider/death()
	..()
	alpha = 255

/mob/living/carbon/superior_animal/vox/ashen
	name = "Mai kisan toka"
	desc = "A small predictor that is native to the lands. They are known for their limited craftsmanship and manipulation of objects. It looks rather strong."
	icon_state = "vox_pitchblack"

	turns_per_move = 7
	see_in_dark = 20

	melee_damage_lower = 24
	melee_damage_upper = 28

	knock_over_odds = 35

	maxHealth = 180
	health = 180

/mob/living/carbon/superior_animal/vox/weak
	name = "Yaro mafarauci"
	desc = "A small predictor that is native to the lands. They are known for their limited craftsmanship and manipulation of objects. This one is young but still deadly."
	icon_state = "vox_acid"

	melee_damage_lower = 12
	melee_damage_upper = 15

	knock_over_odds = 15

	maxHealth = 80
	health = 80

/mob/living/carbon/superior_animal/vox/rage
	name = "Jan barazana"
	desc = "A small predictor that is native to the lands. They are known for their limited craftsmanship and manipulation of objects. The long arms pack a stronger then normal punch."
	icon_state = "vox_infrared"

	melee_damage_lower = 32
	melee_damage_upper = 35

	knock_over_odds = 25