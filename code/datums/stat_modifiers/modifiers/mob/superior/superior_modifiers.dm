/datum/stat_modifier/mob/living/carbon/superior_animal/durable

	armor_adjustment = list(
	melee = 1,
	bullet = 1,
	bomb = 3,
	agony = 7
	)

	flash_resistances_increment = 1

	prefix = "Durable"

	stattags = DEFENSE_STATTAG

	description = "This one looks somewhat more sturdy than others. It'll likely be slightly more resistant to damage and pain."

/datum/stat_modifier/mob/living/carbon/superior_animal/brutish

	armor_adjustment = list(
		melee = 1,
		bullet = 1,
		energy = -1,
		bomb = 5,
		agony = 1
		)

	melee_damage_lower_increment = 2
	melee_damage_upper_increment = 2
	maxHealth_increment = 5
	armor_divisor_increment = 1.25

	stattags = DEFENSE_STATTAG | MELEE_STATTAG

	inherent_projectile_mult_increment = 0.1
	projectile_armor_divisor_adjustment = 2

	description = "This one is noticably muscular. It looks like it might hit harder than others."

	prefix = "Brutish"

/datum/stat_modifier/mob/living/carbon/superior_animal/padded

	armor_adjustment = list(
		melee = 2,
		bullet = 1,
		bomb = 10,
		agony = 3 //Rubbers deal way less to us!
	)

	stattags = DEFENSE_STATTAG

	maxHealth_increment = 10

	prefix = "Padded"

	description = "This one seems to be a bit 'puffier' than others. It looks like your attacks will do somewhat less on it."

/datum/stat_modifier/mob/living/carbon/superior_animal/old

	armor_adjustment = list(
		melee = 1,
		bullet = 1,
		bomb = 10,
		agony = 5 //just cant feel it
	)

	maxHealth_increment = 20 //life already seen them by
	move_to_delay_increment = 1 // Very slow

	stattags = DEFENSE_STATTAG

	delay_for_range_mult = 1.1

	prefix = "Old"

	description = "This one seems old - lethargic, but seasoned. It's likely to be slower but harder to kill."

/datum/stat_modifier/mob/living/carbon/superior_animal/young

	armor_adjustment = list(
		melee = -1,
		bullet = -1,
		energy = -1,
		agony = -1
	)

	maxHealth_increment = -10

	move_to_delay_increment = -0.5

	delay_for_range_mult = 0.8

	stattags = DEFENSE_STATTAG

	prefix = "Young"

	description = "This one seems to be more active and energetic than the others, but somewhat smaller. It's likely to be more fragile, but quicker."

/// slower, deadlier, significantly tanker -- a significant buff
/datum/stat_modifier/mob/living/carbon/superior_animal/brutal

	armor_adjustment = list(
		melee = 3,
		bullet = 1,
		bomb = 15,
		agony = 7
	)

	flash_resistances_increment = 4

	melee_damage_lower_mult = 1.3
	melee_damage_upper_mult = 1.3

	inherent_projectile_mult_increment = 1.3

	stattags = DEFENSE_STATTAG | MELEE_STATTAG | RANGED_STATTAG

	move_to_delay_increment = 1.3

	prefix = "Brutal"

	description = "This one looks exceptionally muscular and scarred. You get the feeling they might be significantly physically stronger, durable, and resistant to pain, than others of its like."
