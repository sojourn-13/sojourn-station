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

/datum/stat_modifier/mob/living/damage/mixed //got lazy, do it yourself tbh

/datum/stat_modifier/mob/living/damage/mixed/negative //got lazy, do it yourself tbh

	prefix = "Weak"

	description = "This one seems weaker than the others."

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


