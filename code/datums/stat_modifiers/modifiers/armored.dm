// basetype, dont use
/datum/stat_modifier/mob/living/carbon/superior_animal/armored

	prefix = "Armored"

	stattags = DEFENSE_STATTAG

	description = "This one looks especially armored. You may need more penetration to get through it."

// basetype, dont use
/datum/stat_modifier/mob/living/carbon/superior_animal/armored/mult

	armor_mult = list(
		melee = 1,
		bullet = 1,
		energy = 1,
		bomb = 1,
		bio = 1,
		rad = 1,
		agony = 1
	)

	invert_armor_mult_if_negative = TRUE

/// Increases all armor by 1.2x
/datum/stat_modifier/mob/living/carbon/superior_animal/armored/mult/low

	armor_mult = list(
		melee = 1.2,
		bullet = 1.2,
		energy = 1.2,
		bomb = 1.2,
		bio = 1.2,
		rad = 1.2,
		agony = 1.2
	)

/// Increases all armor by 1.5x
/datum/stat_modifier/mob/living/carbon/superior_animal/armored/mult/medium

	armor_mult = list(
		melee = 1.5,
		bullet = 1.5,
		energy = 1.5,
		bomb = 1.5,
		bio = 1.5,
		rad = 1.5,
		agony = 1.5
	)

/// Increases all armor by 1.8x
/datum/stat_modifier/mob/living/carbon/superior_animal/armored/mult/high

	armor_mult = list(
		melee = 1.8,
		bullet = 1.8,
		energy = 1.8,
		bomb = 1.8,
		bio = 1.8,
		rad = 1.8,
		agony = 1.8
	)

	prefix = "Heavily-armored"

/// Doubles all armor
/datum/stat_modifier/mob/living/carbon/superior_animal/armored/mult/high/double

	armor_mult = list(
		melee = 2,
		bullet = 2,
		energy = 2,
		bomb = 2,
		bio = 2,
		rad = 2,
		agony = 2
	)

/datum/stat_modifier/mob/living/carbon/superior_animal/armored/mult/triple

	armor_mult = list(
		melee = 3,
		bullet = 3,
		energy = 3,
		bomb = 3,
		bio = 3,
		rad = 3,
		agony = 3
	)

	prefix = "Very heavily-armored"

/datum/stat_modifier/mob/living/carbon/superior_animal/armored/flat/low

	armor_adjustment = list(
		melee = 10,
		bullet = 10,
		energy = 10,
		bomb = 10,
		bio = 10,
		rad = 10,
		agony = 10
	)

/datum/stat_modifier/mob/living/carbon/superior_animal/armored/flat/medium

	armor_adjustment = list(
		melee = 20,
		bullet = 20,
		energy = 20,
		bomb = 20,
		bio = 20,
		rad = 20,
		agony = 20
	)

/datum/stat_modifier/mob/living/carbon/superior_animal/armored/flat/high

	armor_adjustment = list(
		melee = 30,
		bullet = 30,
		energy = 30,
		bomb = 30,
		bio = 30,
		rad = 30,
		agony = 30
	)

	prefix = "Heavily-armored"

/datum/stat_modifier/mob/living/carbon/superior_animal/armored/custom

/datum/stat_modifier/mob/living/carbon/superior_animal/armored/custom/get_argument_length(atom/target, list/arguments)

	var/list_length

	if (arguments)
		list_length = (arguments.len)

    for (var/i, i <= (list_length), i++)
		if (!isnull(arguments[1]))
      		switch (i)
            	if (1)
					if (islist(arguments[i]))
						var/list/adjustments
						for (var/entry in adjustments)

	. = ..()
