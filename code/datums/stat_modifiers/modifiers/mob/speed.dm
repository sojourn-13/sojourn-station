// basetype, dont use
/datum/stat_modifier/mob/living/speed

	prefixes = list("Tier-1" = "Quick", "Tier-2" = "Very quick", "Tier-3" = "Extremely quick",
					"Tier1" = "Slow", "Tier2" = "Very slow", "Tier3" = "Extremely slow"
					)

	descriptions = list("Tier-1" = "This one seems quicker than the others.",
						"Tier-2" = "This one seems quicker than the others.",
						"Tier-3" = "This one seems quicker than the others.",
						"Tier1" = "This one seems slower than the others.",
						"Tier2" = "This one seems slower than the others.",
						"Tier3" = "This one seems slower than the others."
						)

	stattags = DEFENSE_STATTAG

	force_default_prefix = FALSE

// basetype, dont use
/datum/stat_modifier/mob/living/speed/mult
	move_to_delay_mult = 1

/datum/stat_modifier/mob/living/speed/mult/negative/low
	move_to_delay_mult = 1.1

/datum/stat_modifier/mob/living/speed/mult/negative/medium
	move_to_delay_mult = 1.5

/datum/stat_modifier/mob/living/speed/mult/negative/high
	move_to_delay_mult = 1.8

/datum/stat_modifier/mob/living/speed/mult/high/negative/double
	move_to_delay_mult = 2

/datum/stat_modifier/mob/living/speed/mult/negative/triple
	move_to_delay_mult = 3

/datum/stat_modifier/mob/living/speed/flat/negative/low
	move_to_delay_increment = 0.2

/datum/stat_modifier/mob/living/speed/flat/negative/medium
	move_to_delay_increment = 0.4

/datum/stat_modifier/mob/living/speed/flat/negative/high
	move_to_delay_increment = 1

/datum/stat_modifier/mob/living/speed/mult/positive/low
	move_to_delay_mult = 0.9

/datum/stat_modifier/mob/living/speed/mult/positive/medium
	move_to_delay_mult = 0.5

/datum/stat_modifier/mob/living/speed/mult/positive/high
	move_to_delay_mult = 0.2

/datum/stat_modifier/mob/living/speed/flat/positive/low
	move_to_delay_increment = -0.2

/datum/stat_modifier/mob/living/speed/flat/positive/medium
	move_to_delay_increment = -0.5

/datum/stat_modifier/mob/living/speed/flat/positive/high
	move_to_delay_increment = -1

/datum/stat_modifier/mob/living/speed/custom

/datum/stat_modifier/mob/living/speed/before_apply(atom/target, list/arguments, arg_length)

	if (isliving(target))
		var/mob/living/living_target = target

		var/current_move_to_delay = living_target.move_to_delay

		if (arg_length)

			for (var/i = 1, i <= (arg_length), i++)
				if (!isnull(arguments[i]))
					switch (i)
						if (1)
							move_to_delay_increment = arguments[i]
						if (2)
							move_to_delay_mult = arguments[i]

		return current_move_to_delay
	return FALSE

/datum/stat_modifier/mob/living/speed/after_apply(atom/target, list/arguments, arg_length, arguments_to_pass)

	if (!isnull(arguments_to_pass))
		if (isliving(target))
			var/mob/living/living_target = target
			var/current_move_to_delay = living_target.move_to_delay
			var/previous_move_to_delay = CLAMP(arguments_to_pass, 1e-31, INFINITY) //prevent division by zero

			return (current_move_to_delay / previous_move_to_delay)
	return FALSE
