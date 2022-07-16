// basetype, dont use
/datum/stat_modifier/mob/living/damage

	prefixes = list("Tier1" = "Deadly", "Tier-2" = "Very deadly", "Tier-3" = "Extremely deadly",
					"Tier-1" = "Less deadly", "Tier-2" = "Very less deadly", "Tier3" = "Extremely less deadly"
					)

	descriptions = list("Tier-1" = "This one seems deadlier than the others.",
						"Tier-2" = "This one seems deadlier than the others.",
						"Tier-3" = "This one seems deadlier than the others.",
						"Tier1" = "This one seems less deadly than the others.",
						"Tier2" = "This one seems less deadly than the others.",
						"Tier3" = "This one seems less deadly than the others."
						)

	prefix = "Deadly"

	description = "This one seems deadlier than the others."

	stattags = MELEE_STATTAG | RANGED_STATTAG

	melee_damage_lower_increment = 0
	melee_damage_lower_mult = 1
	melee_damage_lower_zeroth = 0.1

	melee_damage_upper_increment = 0
	melee_damage_upper_mult = 1
	melee_damage_upper_zeroth = 0.1

	inherent_projectile_increment_adjustment = 0
	inherent_projectile_mult_increment = 0

	force_default_prefix = TRUE // im too lazy to do the math

/datum/stat_modifier/mob/living/damage/positive/mixed/flat/low

	melee_damage_lower_increment = 3
	melee_damage_upper_increment = 3

	inherent_projectile_increment_adjustment = 3

/datum/stat_modifier/mob/living/damage/positive/mixed/flat/medium

	melee_damage_lower_increment = 6
	melee_damage_upper_increment = 6

	inherent_projectile_increment_adjustment = 6

/datum/stat_modifier/mob/living/damage/positive/mixed/flat/high

	melee_damage_lower_increment = 10
	melee_damage_upper_increment = 10

	inherent_projectile_increment_adjustment = 10

/datum/stat_modifier/mob/living/damage/negative/mixed/flat/low

	melee_damage_lower_increment = -3
	melee_damage_upper_increment = -3

	inherent_projectile_increment_adjustment = -3

/datum/stat_modifier/mob/living/damage/negative/mixed/flat/medium

	melee_damage_lower_increment = -6
	melee_damage_upper_increment = -6

	inherent_projectile_increment_adjustment = -6

/datum/stat_modifier/mob/living/damage/negative/mixed/flat/high

	melee_damage_lower_increment = -10
	melee_damage_upper_increment = -10

	inherent_projectile_increment_adjustment = -10

/datum/stat_modifier/mob/living/damage/positive/mixed/mult/low

	melee_damage_lower_mult = 1.2
	melee_damage_upper_mult = 1.2

	inherent_projectile_mult_increment = 1.2

/datum/stat_modifier/mob/living/damage/positive/mixed/mult/medium

	melee_damage_lower_mult = 1.5
	melee_damage_upper_mult = 1.5

	inherent_projectile_mult_increment = 1.5

/datum/stat_modifier/mob/living/damage/positive/mixed/mult/high

	melee_damage_lower_mult = 1.8
	melee_damage_upper_mult = 1.8

	inherent_projectile_mult_increment = 1.8
/datum/stat_modifier/mob/living/damage/negative/mixed/mult/low

	melee_damage_lower_increment = -1.2
	melee_damage_upper_increment = -1.2

	inherent_projectile_increment_adjustment = -1.2

/datum/stat_modifier/mob/living/damage/negative/mixed/mult/medium

	melee_damage_lower_increment = -1.5
	melee_damage_upper_increment = -1.5

	inherent_projectile_increment_adjustment = -1.5

/datum/stat_modifier/mob/living/damage/negative/mixed/mult/high

	melee_damage_lower_increment = -1.8
	melee_damage_upper_increment = -1.8

	inherent_projectile_increment_adjustment = -1.8


/datum/stat_modifier/mob/living/damage/negative //got lazy, do it yourself tbh

	prefix = "Weak"

	description = "This one seems weaker than the others."

/datum/stat_modifier/mob/living/damage/ranged

	inherent_projectile_increment_adjustment = 0
	inherent_projectile_mult_increment = 0

/datum/stat_modifier/mob/living/damage/melee

	melee_damage_lower_increment = 0
	melee_damage_lower_mult = 1
	melee_damage_lower_zeroth = 0.1

	melee_damage_upper_increment = 0
	melee_damage_upper_mult = 1
	melee_damage_upper_zeroth = 0.1

/datum/stat_modifier/mob/living/damage/custom

/datum/stat_modifier/mob/living/damage/before_apply(atom/target, list/arguments, arg_length)

	if (isliving(target))
		var/mob/living/living_target = target

		var/current_lower_melee = living_target.melee_damage_lower
		var/current_upper_melee = living_target.melee_damage_upper

		var/current_projectile_increment = living_target.inherent_projectile_increment
		var/current_projectile_mult = living_target.inherent_projectile_mult

		var/list/stored_damage_values = list(current_lower_melee, current_upper_melee, current_projectile_increment, current_projectile_mult)

		if (arg_length)

			for (var/i = 1, i <= (arg_length), i++)
				if (!isnull(arguments[i]))
					switch (i)
						if (1)
							melee_damage_lower_increment = arguments[i]
						if (2)
							melee_damage_lower_mult = arguments[i]
						if (3)
							melee_damage_lower_zeroth = arguments[i]
						if (4)
							melee_damage_upper_increment = arguments[i]
						if (5)
							melee_damage_upper_mult = arguments[i]
						if (6)
							melee_damage_upper_zeroth = arguments[i]
						if (7)
							inherent_projectile_increment_adjustment = arguments[i]
						if (8)
							inherent_projectile_mult_increment = arguments[i]

		return stored_damage_values
	return FALSE


