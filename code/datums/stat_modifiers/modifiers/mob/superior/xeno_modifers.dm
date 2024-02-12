/datum/stat_modifier/mob/living/carbon/superior_animal/durable/xeno

	armor_adjustment = list(
	melee = 3,
	bullet = 3,
	bomb = 3,
	agony = 7
	)

	flash_resistances_increment = 2


	description = "This one looks somewhat more sturdy than others. It'll likely be slightly more resistant to damage and pain."

/datum/stat_modifier/mob/living/carbon/superior_animal/brutish/xeno

	armor_adjustment = list(
		melee = 2,
		bullet = 2,
		energy = 0,
		bomb = 5,
		agony = 3
		)

	melee_damage_lower_increment = 5
	melee_damage_upper_increment = 5
	maxHealth_increment = 25
	armor_divisor_increment = 1.25

	description = "This one is noticably tougher with sharp claws. It looks like it might hit harder than others."

	prefix = "Glistening"

/datum/stat_modifier/mob/living/carbon/superior_animal/padded/xeno

	armor_adjustment = list(
		melee = 5,
		bullet = 3,
		bomb = 20,
		agony = 8 //Rubbers deal way less to us!
	)

	stattags = DEFENSE_STATTAG

	maxHealth_increment = 40

	prefix = "Harden"

	description = "This one seems to be a bit thicker than others. It looks like your attacks will do somewhat less on it."

/datum/stat_modifier/mob/living/carbon/superior_animal/old/xeno

	armor_adjustment = list(
		melee = -3,
		bullet = 2,
		bomb = -10,
		agony = 30 //just cant feel it
	)

	maxHealth_increment = 60 //life already seen them by

	stattags = DEFENSE_STATTAG

	prefix = "Fortified"

	description = "This one seems older, stiffer, but seasoned. It's likely to be slower but harder to kill."

/datum/stat_modifier/mob/living/carbon/superior_animal/young/xeno

	maxHealth_increment = 0

	prefix = "Hatchling"

	description = "This one seems to be more active and energetic than the others, but somewhat smaller. It's likely to be more fragile, but quicker."
