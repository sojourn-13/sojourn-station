/datum/stat_modifier/mob

/datum/stat_modifier/mob/living

	var/melee_upper_adjust
	var/melee_lower_adjust

	var/melee_upper_mult
	var/melee_damage_upper_zeroth = 0
	var/melee_lower_mult
	var/melee_damage_lower_zeroth = 0

	/// Any damage types here will be applied to any projectiles holder fires by adding the value to the damage of that type. Added after all other modifiers.
	var/list/projectile_adjust_increment = list()
	/// Any damage types here will be applied to any projectiles holder fires by multiplying the value by this value. Added 3rd.
	var/list/projectile_adjust_mult = list()

	/// All projectiles fired by holder will have all damage multiplied by this amount. Applied first.
	var/inherent_projectile_mult
	/// All projectiles fired by holder will have all damage increased by this amount. Applied 2nd.
	var/inherent_projectile_increment

	/// Any projectiles fired by the holder will have their armor penetration increased by this much, added after the mult
	var/projectile_armor_penetration_adjustment
	/// Any projectiles fired by the holder will have their armor penetration multiplied by this much, added first
	var/projectile_armor_penetration_mult

	var/projectile_speed_increment
	var/projectile_speed_mult

	var/movement_adjust
	var/movement_adjust_mult
	var/movement_adjust_zeroth = 0.1

/datum/stat_modifier/mob/living/remove()

	. = ..()

	if (isliving(holder))
		var/mob/living/livingholder = holder

		if (melee_lower_adjust)
			livingholder.melee_damage_lower = ZERO_OR_MORE((livingholder.melee_damage_lower - melee_lower_adjust))
		if (melee_upper_adjust)
			livingholder.melee_damage_upper = ZERO_OR_MORE((livingholder.melee_damage_upper - melee_upper_adjust))

		if (melee_lower_mult)
			livingholder.melee_damage_lower = ZERO_OR_MORE((livingholder.melee_damage_lower / melee_lower_mult))
		if (melee_upper_mult)
			livingholder.melee_damage_upper = ZERO_OR_MORE((livingholder.melee_damage_upper / melee_upper_mult))

		if (movement_adjust)
			livingholder.move_to_delay = ZERO_OR_MORE((livingholder.move_to_delay - movement_adjust))
		if (movement_adjust_mult)
			livingholder.move_to_delay = ZERO_OR_MORE((livingholder.move_to_delay / movement_adjust_mult))

		if (inherent_projectile_increment)
			livingholder.inherent_projectile_increment = ZERO_OR_MORE((livingholder.inherent_projectile_increment - inherent_projectile_increment))
		if (inherent_projectile_mult)
			livingholder.inherent_projectile_mult = ZERO_OR_MORE((livingholder.inherent_projectile_mult - inherent_projectile_mult))

		if (projectile_adjust_increment)
			for (var/entry in projectile_adjust_increment)
				livingholder.projectile_damage_increment[entry] = ZERO_OR_MORE((livingholder.projectile_damage_increment[entry] - projectile_adjust_increment[entry]))
		if (projectile_adjust_mult)
			for (var/entry in projectile_adjust_mult)
				livingholder.projectile_damage_mult[entry] = ZERO_OR_MORE((livingholder.projectile_damage_mult[entry] - projectile_adjust_mult[entry]))

		if (projectile_armor_penetration_adjustment)
			livingholder.projectile_armor_penetration_adjustment = ZERO_OR_MORE((livingholder.projectile_armor_penetration_adjustment - projectile_armor_penetration_adjustment))
		if (projectile_armor_penetration_mult)
			livingholder.projectile_armor_penetration_mult = ZERO_OR_MORE((livingholder.projectile_armor_penetration_mult - projectile_armor_penetration_mult))

		if (projectile_speed_increment)
			livingholder.projectile_speed_increment = ZERO_OR_MORE((livingholder.projectile_speed_increment - projectile_speed_increment))
		if (projectile_speed_mult)
			livingholder.projectile_speed_mult = ZERO_OR_MORE((livingholder.projectile_speed_mult - projectile_speed_mult))

/datum/stat_modifier/mob/living/apply_to(atom/target)

	. = ..()

	if (isliving(target))
		var/mob/living/livingtarget = target

		if (melee_upper_mult)
			livingtarget.melee_damage_upper = ZERO_OR_MORE(SAFEMULT(livingtarget.melee_damage_upper, melee_upper_mult, melee_damage_upper_zeroth))
		if (melee_lower_mult)
			livingtarget.melee_damage_lower = ZERO_OR_MORE(SAFEMULT(livingtarget.melee_damage_lower, melee_lower_mult, melee_damage_lower_zeroth))

		if (melee_upper_adjust)
			livingtarget.melee_damage_upper = ZERO_OR_MORE((livingtarget.melee_damage_upper + melee_upper_adjust))
		if (melee_lower_adjust)
			livingtarget.melee_damage_lower = ZERO_OR_MORE((livingtarget.melee_damage_lower + melee_lower_adjust))

		if (movement_adjust_mult)
			livingtarget.move_to_delay = ZERO_OR_MORE(SAFEMULT(livingtarget.move_to_delay, movement_adjust_mult, movement_adjust_zeroth))
		if (movement_adjust)
			livingtarget.move_to_delay = ZERO_OR_MORE((livingtarget.move_to_delay + movement_adjust))

		if (inherent_projectile_mult)
			livingtarget.inherent_projectile_mult = ZERO_OR_MORE((livingtarget.inherent_projectile_mult + inherent_projectile_mult))
		if (inherent_projectile_increment)
			livingtarget.inherent_projectile_increment = ZERO_OR_MORE((livingtarget.inherent_projectile_increment + inherent_projectile_increment))

		if (projectile_adjust_increment)
			for (var/entry in projectile_adjust_increment)
				livingtarget.projectile_damage_increment[entry] = ZERO_OR_MORE((livingtarget.projectile_damage_increment[entry] + projectile_adjust_increment[entry]))
		if (projectile_adjust_mult)
			for (var/entry in projectile_adjust_mult)
				livingtarget.projectile_damage_mult[entry] = ZERO_OR_MORE((livingtarget.projectile_damage_mult[entry] + projectile_adjust_mult[entry]))

		if (projectile_armor_penetration_adjustment)
			livingtarget.projectile_armor_penetration_adjustment = ZERO_OR_MORE((livingtarget.projectile_armor_penetration_adjustment + projectile_armor_penetration_adjustment))
		if (projectile_armor_penetration_mult)
			livingtarget.projectile_armor_penetration_mult = ZERO_OR_MORE((livingtarget.projectile_armor_penetration_mult + projectile_armor_penetration_mult))

		if (projectile_speed_increment)
			livingtarget.projectile_speed_increment = ZERO_OR_MORE((livingtarget.projectile_speed_increment + projectile_speed_increment))
		if (projectile_speed_mult)
			livingtarget.projectile_speed_mult = ZERO_OR_MORE((livingtarget.projectile_speed_mult + projectile_speed_mult))

/datum/stat_modifier/mob/living/carbon
