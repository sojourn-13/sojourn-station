/datum/stat_modifier/mob/living/carbon/superior_animal/lustrous // keeping it here because this just FEELS spider

	armor_adjustment = list(
		energy = 10
	)

	flash_armor = 2
	armor_penetration = 15

	prefix = "lustrous"

	description = "This one has a almost chrome sheen to parts of it, allowing to mitigate flashes as well as energy attacks. It also seems to be better at penetrating armor."

/datum/stat_modifier/mob/living/carbon/superior_animal/durable/spider

	armor_adjustment = list(
		melee = 5,
		bullet = 5,
		bomb = 15,
		agony = 30
	)

	armor_penetration = 5
	flash_armor = 1
	max_health_adjustment = 20
	health_adjustment = 20

	prefix = "durable"

/datum/stat_modifier/mob/living/carbon/superior_animal/young/spider

	armor_adjustment = list(
		melee = -5,
		bullet = -5,
		energy = -5,
		agony = -5
	)

	max_health_adjustment = -10
	health_adjustment = -10

	movement_adjust = -0.5
	poison_adjustment = -1

	prefix = "young"

/datum/stat_modifier/mob/living/carbon/superior_animal/old/spider

	armor_adjustment = list(
		melee = 5,
		bullet = 5,
		bomb = 10,
		agony = 20 //just cant feel it
	)

	max_health_adjustment = 20 //life already seen them by
	health_adjustment = 20
	movement_adjust = 1 // Very slow
	poison_adjustment = -1

	prefix = "old"

/datum/stat_modifier/mob/living/carbon/superior_animal/venomous

	armor_adjustment = list(
		bomb = 5,
		bio = 15,
		rad = 15,
		agony = 10
	)

	poison_adjustment = 1

	prefix = "venomous"

	description = "The fangs/claws of this creature drip with venom, and it looks sturdier than usual."

