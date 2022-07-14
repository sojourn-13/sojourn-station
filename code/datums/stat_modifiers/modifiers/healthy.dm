// basetype, dont use
/datum/stat_modifier/mob/living/carbon/superior_animal/healthy

	prefix = "healthy"

	stattags = DEFENSE_STATTAG

	description = "This one looks especially healthy. It'll likely take more damage than others."

// basetype, dont use
/datum/stat_modifier/healthy/mult

	maxHealth_mult = 1

/datum/stat_modifier/healthy/mult/low

	maxHealth_mult = 1.2

/datum/stat_modifier/healthy/mult/medium

	maxHealth_mult = 1.5

/datum/stat_modifier/healthy/mult/high

	maxHealth_mult = 1.8
	prefix = "Very healthy"

/datum/stat_modifier/healthy/mult/high/double

	maxHealth_mult = 2

/datum/stat_modifier/healthy/mult/triple

	maxHealth_mult = 3
	prefix = "Extremely healthy"

/datum/stat_modifier/healthy/flat/low

	maxHealth_increment = 10

/datum/stat_modifier/healthy/flat/medium

	maxHealth_increment = 30

/datum/stat_modifier/healthy/flat/high

	maxHealth_increment = 50

/datum/stat_modifier/healthy/custom

/datum/stat_modifier/healthy/custom/custom_effect(atom/target, list/arguments, arg_length, boolean = FALSE)

	if (!arg_length)
		boolean = FALSE
		return ..(boolean)

	var/current_maxHealth = target.maxHealth

    for (var/i, i <= (arg_length), i++)
		if (!isnull(arguments[i]))
        	switch (i)
           		if (1)
					maxHealth_increment = arguments[i]
				if (2)
					maxHealth_mult = arguments[i]

	boolean = TRUE
	return ..(target, arguments, arg_length, boolean)
