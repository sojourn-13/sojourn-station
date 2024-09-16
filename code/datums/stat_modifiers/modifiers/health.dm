// basetype, dont use
/datum/stat_modifier/health

	prefixes = list("Tier1" = "Healthy", "Tier2" = "Very healthy", "Tier3" = "Extremely healthy",
					"Tier-1" = "Frail", "Tier-2" = "Very frail", "Tier-3" = "Extremely frail"
					)

	descriptions = list("Tier1" = "This one looks especially healthy. It'll be harder to kill.",
						"Tier2" = "This one looks especially healthy. It'll be harder to kill.",
						"Tier3" = "This one looks especially healthy. It'll be harder to kill.",
						"Tier-1" = "This one looks frailer than usual. It'll likely be easier to kill.",
						"Tier-2" = "This one looks frailer than usual. It'll likely be easier to kill.",
						"Tier-3" = "This one looks frailer than usual. It'll likely be easier to kill."
						)

	stattags = DEFENSE_STATTAG

	force_default_prefix = FALSE

// basetype, dont use
/datum/stat_modifier/health/mult
	maxHealth_mult = 1

/datum/stat_modifier/health/mult/positive/low
	maxHealth_mult = 1.2

/datum/stat_modifier/health/mult/positive/medium
	maxHealth_mult = 1.5

/datum/stat_modifier/health/mult/positive/high
	maxHealth_mult = 1.8

/datum/stat_modifier/health/mult/high/positive/double
	maxHealth_mult = 2

/datum/stat_modifier/health/mult/positive/triple
	maxHealth_mult = 3

/datum/stat_modifier/health/flat/positive/low
	maxHealth_increment = 10

/datum/stat_modifier/health/flat/positive/medium
	maxHealth_increment = 30

/datum/stat_modifier/health/flat/positive/high
	maxHealth_increment = 50

/datum/stat_modifier/health/mult/negative/low
	maxHealth_mult = 0.8

/datum/stat_modifier/health/mult/negative/medium
	maxHealth_mult = 0.5

/datum/stat_modifier/health/mult/negative/high
	maxHealth_mult = 0.2

/datum/stat_modifier/health/flat/negative/low
	maxHealth_increment = -10

/datum/stat_modifier/health/flat/negative/medium
	maxHealth_increment = -30

/datum/stat_modifier/health/flat/negative/high
	maxHealth_increment = -50

/datum/stat_modifier/health/custom

/datum/stat_modifier/health/before_apply(atom/target, list/arguments, arg_length)

	var/current_maxHealth = target.maxHealth

	if (arg_length)

		for (var/i = 1, i <= (arg_length), i++)
			if (!isnull(arguments[i]))
				switch (i)
					if (1)
						maxHealth_increment = arguments[i]
					if (2)
						maxHealth_mult = arguments[i]

	return current_maxHealth

/datum/stat_modifier/health/after_apply(atom/target, list/arguments, arg_length, arguments_to_pass)

	if (!isnull(arguments_to_pass))
		var/current_maxHealth = target.maxHealth
		var/previous_maxHealth = CLAMP(arguments_to_pass, 1e-31, INFINITY) //prevent division by zero

		return (current_maxHealth / previous_maxHealth)
	return FALSE
