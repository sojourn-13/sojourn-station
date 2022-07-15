// basetype, dont use
/datum/stat_modifier/healthy

	prefix = "Healthy"

	lower_prefixes = list("Tier-1" = "Frail", "Tier-2" = "Very frail", "Tier-3" = "Extremely frail")

	upper_prefixes = list("Tier1" = "Healthy", "Tier2" = "Very healthy", "Tier3" = "Extremely healthy")

	stattags = DEFENSE_STATTAG

	description = "This one looks especially healthy. It'll likely take more damage than others."

// basetype, dont use
/datum/stat_modifier/healthy/mult
	maxHealth_mult = 1

/datum/stat_modifier/healthy/mult/positive/low
	maxHealth_mult = 1.2

/datum/stat_modifier/healthy/mult/positive/medium
	maxHealth_mult = 1.5

/datum/stat_modifier/healthy/mult/positive/high
	maxHealth_mult = 1.8

/datum/stat_modifier/healthy/mult/high/positive/double
	maxHealth_mult = 2

/datum/stat_modifier/healthy/mult/positive/triple
	maxHealth_mult = 3

/datum/stat_modifier/healthy/flat/positive/low
	maxHealth_increment = 10

/datum/stat_modifier/healthy/flat/positive/medium
	maxHealth_increment = 30

/datum/stat_modifier/healthy/flat/positive/high
	maxHealth_increment = 50

/datum/stat_modifier/healthy/mult/negative/low
	maxHealth_mult = 0.8

/datum/stat_modifier/healthy/mult/negative/medium
	maxHealth_mult = 0.5

/datum/stat_modifier/healthy/mult/negative/high
	maxHealth_mult = 0.2

/datum/stat_modifier/healthy/flat/negative/low
	maxHealth_increment = -10

/datum/stat_modifier/healthy/flat/negative/medium
	maxHealth_increment = -30

/datum/stat_modifier/healthy/flat/negative/high
	maxHealth_increment = -50

/datum/stat_modifier/healthy/custom

/datum/stat_modifier/healthy/before_apply(atom/target, list/arguments, arg_length)

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

/datum/stat_modifier/healthy/after_apply(atom/target, list/arguments, arg_length, arguments_to_pass)

	if (force_default_prefix)
		return FALSE

	if (arguments_to_pass)
		var/previous_maxHealth = arguments_to_pass

		var/ratio_between_now_and_then = (target.maxHealth / previous_maxHealth)
		var/new_prefix = null

		if (ratio_between_now_and_then == 1)
			return FALSE
		else
			if (ratio_between_now_and_then < 1)
				if (ratio_between_now_and_then <= 0.5)
					if (ratio_between_now_and_then <= 0.15)
						new_prefix = lower_prefixes["Tier-3"]
					else
						new_prefix = lower_prefixes["Tier-2"]
				else
					new_prefix = lower_prefixes["Tier-1"]
			else if (ratio_between_now_and_then > 1)
				if (ratio_between_now_and_then >= 1.5)
					if (ratio_between_now_and_then >= 1.85)
						new_prefix = upper_prefixes["Tier3"]
					else
						new_prefix = upper_prefixes["Tier2"]
				else
					new_prefix = upper_prefixes["Tier1"]

		if (new_prefix)
			prefix = new_prefix

		return TRUE
	return FALSE

