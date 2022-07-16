/datum/stat_modifier/mob/living/carbon/superior_animal/lustrous // keeping it here because this just FEELS spider

	armor_adjustment = list(
		energy = 10
	)

	flash_resistances_increment = 2
	armor_penetration_increment = 15

	prefix = "Lustrous"

	stattags = DEFENSE_STATTAG | MELEE_STATTAG

	description = "This one has a almost chrome sheen to parts of it, allowing to mitigate flashes as well as energy attacks. It also seems to be better at penetrating armor."

/datum/stat_modifier/mob/living/carbon/superior_animal/durable/spider

	armor_adjustment = list(
		melee = 5,
		bullet = 5,
		bomb = 15,
		agony = 30
	)

	armor_penetration_increment = 5
	flash_resistances_increment = 1
	maxHealth_increment = 20

	stattags = DEFENSE_STATTAG

	prefix = "Durable"

/datum/stat_modifier/mob/living/carbon/superior_animal/young/spider

	armor_adjustment = list(
		melee = -5,
		bullet = -5,
		energy = -5,
		agony = -5
	)

	maxHealth_increment = -10

	move_to_delay_increment = -0.5
	poison_per_bite_increment = -1

	stattags = DEFENSE_STATTAG

	prefix = "Young"

/datum/stat_modifier/mob/living/carbon/superior_animal/old/spider

	armor_adjustment = list(
		melee = 5,
		bullet = 5,
		bomb = 10,
		agony = 20 //just cant feel it
	)

	maxHealth_increment = 20 //life already seen them by
	move_to_delay_increment = 1 // Very slow
	poison_per_bite_increment = -1

	stattags = DEFENSE_STATTAG

	prefix = "Old"

/datum/stat_modifier/mob/living/carbon/superior_animal/venomous

	armor_adjustment = list(
		bomb = 5,
		bio = 15,
		rad = 15,
		agony = 10
	)

	stattags = DEFENSE_STATTAG | MELEE_STATTAG

	poison_per_bite_increment = 1

	prefix = "Venomous"

	description = "The fangs/claws of this creature drip with venom, and it looks sturdier than usual."

