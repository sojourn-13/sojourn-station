// basetype, dont use
/datum/stat_modifier/mob/living/carbon/superior_animal/armor

	prefixes = list("Tier1" = "Armored", "Tier2" = "Very armored", "Tier3" = "Extremely armored",
					"Tier-1" = "Unarmored", "Tier-2" = "Very unarmored", "Tier-3" = "Extremely unarmored"
					)

	descriptions = list("Tier1" = "This one looks especially armored. You may need more penetration to get through it.",
						"Tier2" = "This one looks especially armored. You may need more penetration to get through it.",
						"Tier3" = "This one looks especially armored. You may need more penetration to get through it.",
						"Tier-1" = "This one looks less armored than the rest. You'll probably need less penetration to get through it.",
						"Tier-2" = "This one looks less armored than the rest. You'll probably need less penetration to get through it.",
						"Tier-3" = "This one looks less armored than the rest. You'll probably need less penetration to get through it."
						)

	stattags = DEFENSE_STATTAG

	force_default_prefix = FALSE

// basetype, dont use
/datum/stat_modifier/mob/living/carbon/superior_animal/armor/mult
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
/datum/stat_modifier/mob/living/carbon/superior_animal/armor/mult/positive/low
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
/datum/stat_modifier/mob/living/carbon/superior_animal/armor/mult/positive/medium
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
/datum/stat_modifier/mob/living/carbon/superior_animal/armor/mult/positive/high
	armor_mult = list(
		melee = 1.8,
		bullet = 1.8,
		energy = 1.8,
		bomb = 1.8,
		bio = 1.8,
		rad = 1.8,
		agony = 1.8
	)

/// Doubles all armor
/datum/stat_modifier/mob/living/carbon/superior_animal/armor/mult/positive/high/double
	armor_mult = list(
		melee = 2,
		bullet = 2,
		energy = 2,
		bomb = 2,
		bio = 2,
		rad = 2,
		agony = 2
	)

/datum/stat_modifier/mob/living/carbon/superior_animal/armor/mult/positive/triple
	armor_mult = list(
		melee = 3,
		bullet = 3,
		energy = 3,
		bomb = 3,
		bio = 3,
		rad = 3,
		agony = 3
	)

/datum/stat_modifier/mob/living/carbon/superior_animal/armor/flat/positive/low
	armor_adjustment = list(
		melee = 2,
		bullet = 2,
		energy = 2,
		bomb = 10,
		bio = 10,
		rad = 10,
		agony = 10
	)

/datum/stat_modifier/mob/living/carbon/superior_animal/armor/flat/positive/medium
	armor_adjustment = list(
		melee = 3,
		bullet = 3,
		energy = 3,
		bomb = 20,
		bio = 20,
		rad = 20,
		agony = 20
	)

/datum/stat_modifier/mob/living/carbon/superior_animal/armor/flat/positive/high
	armor_adjustment = list(
		melee = 4,
		bullet = 4,
		energy = 4,
		bomb = 30,
		bio = 30,
		rad = 30,
		agony = 30
	)

/datum/stat_modifier/mob/living/carbon/superior_animal/armor/mult/negative/low
	armor_mult = list(
		melee = 0.8,
		bullet = 0.8,
		energy = 0.8,
		bomb = 0.8,
		bio = 0.8,
		rad = 0.8,
		agony = 0.8,
	)

/// Increases all armor by 1.5x
/datum/stat_modifier/mob/living/carbon/superior_animal/armor/mult/negative/medium
	armor_mult = list(
		melee = 0.5,
		bullet = 0.5,
		energy = 0.5,
		bomb = 0.5,
		bio = 0.5,
		rad = 0.5,
		agony = 0.5,
	)

/// Increases all armor by 1.8x
/datum/stat_modifier/mob/living/carbon/superior_animal/armor/mult/negative/high
	armor_mult = list(
		melee = 0.2,
		bullet = 0.2,
		energy = 0.2,
		bomb = 0.2,
		bio = 0.2,
		rad = 0.2,
		agony = 0.2,
	)


/datum/stat_modifier/mob/living/carbon/superior_animal/armor/flat/negative/low
	armor_adjustment = list(
		melee = -2,
		bullet = -2,
		energy = -2,
		bomb = -10,
		bio = -10,
		rad = -10,
		agony = -10
	)

/datum/stat_modifier/mob/living/carbon/superior_animal/armor/flat/negative/medium
	armor_adjustment = list(
		melee = -5,
		bullet = -5,
		energy = -5,
		bomb = -20,
		bio = -20,
		rad = -20,
		agony = -20
	)

/datum/stat_modifier/mob/living/carbon/superior_animal/armor/flat/negative/high
	armor_adjustment = list(
		melee = -7,
		bullet = -7,
		energy = -7,
		bomb = -30,
		bio = -30,
		rad = -30,
		agony = -30
	)

/datum/stat_modifier/mob/living/carbon/superior_animal/armor/custom

/datum/stat_modifier/mob/living/carbon/superior_animal/armor/before_apply(atom/target, list/arguments, arg_length)

	if (issuperioranimal(target))
		var/mob/living/carbon/superior_animal/superior_target = target
		var/list/current_armor = superior_target.armor.Copy()

		if (arg_length)

			for (var/i = 1, i <= (arg_length), i++)
				if (!isnull(arguments[i]))
					switch (i)
						if (1)
							armor_adjustment = arguments[i]
						if (2)
							armor_mult = arguments[i]

		return current_armor
	return FALSE

/datum/stat_modifier/mob/living/carbon/superior_animal/armor/after_apply(atom/target, list/arguments, arg_length, arguments_to_pass)

	if (issuperioranimal(target))
		var/mob/living/carbon/superior_animal/superior_target = target

		if (arguments_to_pass)
			var/list/previous_armor = arguments_to_pass

			var/old_armor_total
			var/new_armor_total

			for (var/entry in previous_armor)
				old_armor_total += previous_armor[entry]

			for (var/entry in superior_target.armor)
				new_armor_total += superior_target.armor[entry]

			var/old_armor_total_clamped = CLAMP(old_armor_total, 1e-31, INFINITY) //prevent division by zero
			var/ratio_between_now_and_then = (new_armor_total / old_armor_total_clamped)

			return ratio_between_now_and_then
	return FALSE
