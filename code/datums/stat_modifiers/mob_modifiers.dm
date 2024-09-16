/datum/stat_modifier/mob

/datum/stat_modifier/mob/living

	var/melee_damage_upper_increment
	var/melee_damage_lower_increment

	var/melee_damage_upper_mult
	var/melee_damage_upper_zeroth = 0
	var/melee_damage_lower_mult
	var/melee_damage_lower_zeroth = 0

	/// Any damage types here will be applied to any projectiles holder fires by adding the value to the damage of that type. Added after all other modifiers.
	var/list/projectile_damage_increment = list()
	/// Any damage types here will be applied to any projectiles holder fires by multiplying the value by this value. Added 3rd.
	var/list/projectile_damage_mult = list()

	/// Increments the mob's inherent_projectile_mult var which will be applied to its projectiles. Applied first.
	var/inherent_projectile_mult_increment
	/// Increments the mob's inherent_projectile_increment var which will be applied to its projectiles. Applied 2nd.
	var/inherent_projectile_increment_adjustment

	/// Any projectiles fired by the holder will have their armor penetration increased by this much, added after the mult
	var/projectile_armor_divisor_adjustment
	/// Any projectiles fired by the holder will have their armor penetration multiplied by this much, added first
	var/projectile_armor_divisor_mult_increment

	/// Inverted, lower = higher speed
	var/projectile_speed_increment_adjustment
	var/projectile_speed_mult_increment

	/// Inverted, lower = higher speed
	var/move_to_delay_increment
	var/move_to_delay_mult
	var/move_to_delay_zeroth = 0.1

/datum/stat_modifier/mob/living/remove(qdel_src = TRUE)

	if (isliving(holder))
		var/mob/living/livingholder = holder

		if (melee_damage_lower_increment)
			livingholder.melee_damage_lower = ZERO_OR_MORE((livingholder.melee_damage_lower - melee_damage_lower_increment))
		if (melee_damage_upper_increment)
			livingholder.melee_damage_upper = ZERO_OR_MORE((livingholder.melee_damage_upper - melee_damage_upper_increment))

		if (melee_damage_lower_mult)
			livingholder.melee_damage_lower = ZERO_OR_MORE((livingholder.melee_damage_lower / melee_damage_lower_mult))
		if (melee_damage_upper_mult)
			livingholder.melee_damage_upper = ZERO_OR_MORE((livingholder.melee_damage_upper / melee_damage_upper_mult))

		if (move_to_delay_increment)
			livingholder.move_to_delay = ZERO_OR_MORE((livingholder.move_to_delay - move_to_delay_increment))
		if (move_to_delay_mult)
			livingholder.move_to_delay = ZERO_OR_MORE((livingholder.move_to_delay / move_to_delay_mult))

		if (inherent_projectile_increment_adjustment)
			livingholder.inherent_projectile_increment = ZERO_OR_MORE((livingholder.inherent_projectile_increment - inherent_projectile_increment_adjustment))
		if (inherent_projectile_mult_increment)
			livingholder.inherent_projectile_mult = ZERO_OR_MORE((livingholder.inherent_projectile_mult - inherent_projectile_mult_increment))

		if (projectile_damage_increment)
			for (var/entry in projectile_damage_increment)
				livingholder.projectile_damage_increment[entry] = ZERO_OR_MORE((livingholder.projectile_damage_increment[entry] - projectile_damage_increment[entry]))
		if (projectile_damage_mult)
			for (var/entry in projectile_damage_mult)
				livingholder.projectile_damage_mult[entry] = ZERO_OR_MORE((livingholder.projectile_damage_mult[entry] - projectile_damage_mult[entry]))

		if (projectile_armor_divisor_adjustment)
			livingholder.projectile_armor_divisor_adjustment = ZERO_OR_MORE((livingholder.projectile_armor_divisor_adjustment - projectile_armor_divisor_adjustment))
		if (projectile_armor_divisor_mult_increment)
			livingholder.projectile_armor_divisor_mult = ZERO_OR_MORE((livingholder.projectile_armor_divisor_mult - projectile_armor_divisor_mult_increment))

		if (projectile_speed_increment_adjustment)
			livingholder.projectile_speed_increment = ZERO_OR_MORE((livingholder.projectile_speed_increment - projectile_speed_increment_adjustment))
		if (projectile_speed_mult_increment)
			livingholder.projectile_speed_mult = ZERO_OR_MORE((livingholder.projectile_speed_mult - projectile_speed_mult_increment))

	return ..(qdel_src)

/datum/stat_modifier/mob/living/apply_to(atom/target, list/arguments, arguments_to_pass)

	if (isliving(target))
		var/mob/living/livingtarget = target

		if (melee_damage_upper_mult)
			livingtarget.melee_damage_upper = ZERO_OR_MORE(SAFEMULT(livingtarget.melee_damage_upper, melee_damage_upper_mult, melee_damage_upper_zeroth))
		if (melee_damage_lower_mult)
			livingtarget.melee_damage_lower = ZERO_OR_MORE(SAFEMULT(livingtarget.melee_damage_lower, melee_damage_lower_mult, melee_damage_lower_zeroth))

		if (melee_damage_upper_increment)
			livingtarget.melee_damage_upper = ZERO_OR_MORE((livingtarget.melee_damage_upper + melee_damage_upper_increment))
		if (melee_damage_lower_increment)
			livingtarget.melee_damage_lower = ZERO_OR_MORE((livingtarget.melee_damage_lower + melee_damage_lower_increment))

		if (move_to_delay_mult)
			livingtarget.move_to_delay = ZERO_OR_MORE(SAFEMULT(livingtarget.move_to_delay, move_to_delay_mult, move_to_delay_zeroth))
		if (move_to_delay_increment)
			livingtarget.move_to_delay = ZERO_OR_MORE((livingtarget.move_to_delay + move_to_delay_increment))

		if (inherent_projectile_mult_increment)
			livingtarget.inherent_projectile_mult = ZERO_OR_MORE((livingtarget.inherent_projectile_mult + inherent_projectile_mult_increment))
		if (inherent_projectile_increment_adjustment)
			livingtarget.inherent_projectile_increment = ZERO_OR_MORE((livingtarget.inherent_projectile_increment + inherent_projectile_increment_adjustment))

		if (projectile_damage_increment.len)
			for (var/entry in projectile_damage_increment)
				livingtarget.projectile_damage_increment[entry] = ZERO_OR_MORE((livingtarget.projectile_damage_increment[entry] + projectile_damage_increment[entry]))
		if (projectile_damage_mult.len)
			for (var/entry in projectile_damage_mult)
				livingtarget.projectile_damage_mult[entry] = ZERO_OR_MORE((livingtarget.projectile_damage_mult[entry] + projectile_damage_mult[entry]))

		if (projectile_armor_divisor_adjustment)
			livingtarget.projectile_armor_divisor_adjustment = ZERO_OR_MORE((livingtarget.projectile_armor_divisor_adjustment + projectile_armor_divisor_adjustment))
		if (projectile_armor_divisor_mult_increment)
			livingtarget.projectile_armor_divisor_mult = ZERO_OR_MORE((livingtarget.projectile_armor_divisor_mult + projectile_armor_divisor_mult_increment))

		if (projectile_speed_increment_adjustment)
			livingtarget.projectile_speed_increment = ZERO_OR_MORE((livingtarget.projectile_speed_increment + projectile_speed_increment_adjustment))
		if (projectile_speed_mult_increment)
			livingtarget.projectile_speed_mult = ZERO_OR_MORE((livingtarget.projectile_speed_mult + projectile_speed_mult_increment))

	return ..(target, arguments, arguments_to_pass)

/datum/stat_modifier/mob/living/carbon
