/mob/living/carbon/superior/vox/trained
	desc = "A small predator native to these lands. They are known for their limited craftsmanship and manipulation of objects. This one has a crudely fitted riot helmet on"
	icon_state = "vox_marsmud_helm"

	maxHealth = 125 * VOXBIRD_HEALTH_MOD
	health = 125 * VOXBIRD_HEALTH_MOD

	armor = list(melee = 15, bullet = 3, energy = 3, bomb = 20, bio = 20, rad = 0)

	//Simulate the helmet falling apart
	drop_items = list(/obj/item/stack/material/plastic/random)


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

/mob/living/carbon/superior/vox/posin_thrower/trained
	name = "Arginto Ciriklo"
	desc = "A small predator native to these lands. They are known for their limited craftsmanship and manipulation of objects. \
	This one wares a mask and has a odd shimer on their claws"
	icon_state = "vox_silversynth_masked"

	//Just faster throwing and better melee
	delay_for_range = 0.3 //Fast throwers

	poison_per_bite = 2
	poison_type = "amatoxin"
	mob_ablative_armor = 12

	armor = list(melee = 6, bullet = 8, energy = 0, bomb = 20, bio = 20, rad = 0)

	maxHealth = 95 * VOXBIRD_HEALTH_MOD
	health = 95 * VOXBIRD_HEALTH_MOD


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


/mob/living/carbon/superior/vox/thrower_spear/trained
	desc = "A small predator native to these lands. They are known for their limited craftsmanship and manipulation of objects. \
	This one throws spears with deadly speed, holding a bag in hand this one hands out rocks to other Ciriklo's"
	icon_state = "vox_abyssal"

	//See vox/ai.dm for fancy affects

	delay_for_range = 0.1 //Fast throwers
	mob_ablative_armor = 12

	armor = list(melee = 6, bullet = 8, energy = 0, bomb = 20, bio = 20, rad = 0)

	maxHealth = 95 * VOXBIRD_HEALTH_MOD
	health = 95 * VOXBIRD_HEALTH_MOD

	drop_items = list(/obj/item/stack/ore, /obj/item/stack/ore, /obj/item/stack/ore, /obj/item/stack/ore, /obj/item/stack/material/silk)


//Solar Bird
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

/mob/living/carbon/superior/vox/armord/trained
	desc = "A small predator native to these lands. They are known for their limited craftsmanship and manipulation of objects. This one's chest looks rather tougher than the rest of them as well as holds a shield."
	icon_state = "vox_solar_shield"


	armor = list(melee = 12, bullet = 9, energy = 9, bomb = 50, bio = 0, rad = 0)

	ranged = FALSE
	armor_divisor = 1.25

	maxHealth = 135 * VOXBIRD_HEALTH_MOD
	health = 135 * VOXBIRD_HEALTH_MOD


	mob_ablative_armor = 70

	armor_divisor = 1.5


	drop_items = list(/obj/item/shield/buckler/handmade/damaged)


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

/mob/living/carbon/superior/vox/hider/trainned
	desc = "A small predator native to these lands. They are known for their limited craftsmanship and manipulation of objects. This one is harder to see as it stalks low to the ground, hiding in bushes or other shadows waiting to pounce with hands covered in muck and dirt."
	icon_state = "vox_ultraviolet_belt"

	knock_over_odds = 50

	melee_damage_lower = 20
	melee_damage_upper = 22

	maxHealth = 65 * VOXBIRD_HEALTH_MOD //Glass cannon
	health = 65 * VOXBIRD_HEALTH_MOD

	mob_ablative_armor = 15

	ranged = FALSE

	armor_divisor = 2


	drop_items = list(/obj/item/stack/ore/glass, /obj/item/stack/ore/glass, /obj/item/stack/ore/glass, /obj/item/stack/ore/glass)

	//No better armor its just a belt

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


/mob/living/carbon/superior/vox/ashen/trainned
	desc = "A small predator native to these lands. They are known for their limited craftsmanship and manipulation of objects. \
	This one seems to be using a crude spear rather then its exstreamly sharp claws as well as a blood lust aura radiating off it..."

	melee_damage_lower = 18
	melee_damage_upper = 22

	knock_over_odds = 5

	reload_message = "picks up a rock!"

	maxHealth = 120 * VOXBIRD_HEALTH_MOD
	health = 120 * VOXBIRD_HEALTH_MOD
	armor_divisor = 3

	ranged = FALSE
	target_dummy = TRUE //Target me

	armor = list(melee = 9, bullet = 9, energy = 5, bomb = 50, bio = 0, rad = 0)

	delay_for_all = 0.2

	attacktext = "rapidly stabs and jabs"

	drop_items = list(/obj/item/tool/spear)


//Weak Bird
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

/mob/living/carbon/superior/vox/weak/trained
	name = "Slabo Ciriklo"
	desc = "A small predator native to these lands. They are known for their limited craftsmanship and manipulation of objects. This one waring a modifed vest and is young but still deadly."
	icon_state = "vox_acid_armored"

	melee_damage_lower = 17
	melee_damage_upper = 19

	reload_message = "picks up a rock!"

	knock_over_odds = 25

	maxHealth = 65 * VOXBIRD_HEALTH_MOD
	health = 65 * VOXBIRD_HEALTH_MOD

	armor = list(melee = 15, bullet = 12, energy = 12, bomb = 50, bio = 0, rad = 0)


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

/mob/living/carbon/superior/vox/rage/trained
	desc = "A small predator native to these lands. They are known for their limited craftsmanship and manipulation of objects. Their long arms hold a firstaid kit and pack a stronger than normal punch."
	icon_state = "vox_infrared_medical"

	armor = list(melee = 8, bullet = 8, energy = 5, bomb = 50, bio = 0, rad = 0)

	drop_items = list(/obj/item/storage/firstaid/regular/empty, /obj/random/medical_lowcost, /obj/random/medical_lowcost, /obj/random/medical_lowcost, /obj/random/medical_lowcost, /obj/random/medical_lowcost, /obj/random/medical_lowcost)


/mob/living/carbon/superior/vox/rage/trained/updatehealth()
	..()
	//Heal thyself.
	if(stat == CONSCIOUS && health != maxHealth)
		adjustBruteLoss(-12)
		adjustFireLoss(-12)
		adjustToxLoss(-3)

	//Heal others
	for(var/mob/living/carbon/superior/vox/V in oview(3))
		if(V.stat == CONSCIOUS && health != maxHealth)
			V.adjustBruteLoss(-6)
			V.adjustFireLoss(-6)
			V.adjustToxLoss(-3)

//Looking Bird
/mob/living/carbon/superior/vox/scout
	name = "Dikhindoj Ciriklo"
	desc = "A small predator native to these lands. They are known for their limited craftsmanship and manipulation of objects. This one has pure white feathers and seems untouched by filth and muck."
	icon_state = "grayscale" //Temp sprite

	melee_damage_lower = 23
	melee_damage_upper = 20

	attacktext = "slashes"

	knock_over_odds = 30

	armor = list(melee = 10, bullet = 8, energy = 2, bomb = 60, bio = 0, rad = 0)
	ranged = FALSE

	can_burrow = TRUE
