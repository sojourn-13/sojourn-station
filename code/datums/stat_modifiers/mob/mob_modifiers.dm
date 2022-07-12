/datum/stat_modifier/mob

/datum/stat_modifier/mob/living

	var/melee_upper_adjust = 0
	var/melee_lower_adjust = 0

	/// Any damage types here will be applied to any projectiles holder fires by adding the value to the damage of that type. Added after all other modifiers.
	var/list/projectile_adjust_increment = list()
	/// Any damage types here will be applied to any projectiles holder fires by multiplying the value by this value. Added 3rd.
	var/list/projectile_adjust_mult = list()

	/// All projectiles fired by holder will have all damage multiplied by this amount. Applied first.
	var/inherent_projectile_mult = null
	/// All projectiles fired by holder will have all damage increased by this amount. Applied 2nd.
	var/inherent_projectile_increment = null

	/// Any projectiles fired by the holder will have their armor penetration increased by this much, added after the mult
	var/projectile_armor_penetration_adjustment = 0
	/// Any projectiles fired by the holder will have their armor penetration multiplied by this much, added first
	var/projectile_armor_penetration_mult = 0

	var/projectile_speed_increment = 0
	var/projectile_speed_mult = 0

	var/movement_adjust = 0

/datum/stat_modifier/mob/living/remove()

	. = ..()

	if (isliving(holder))
		var/mob/living/livingholder = holder
		livingholder.melee_damage_lower -= melee_lower_adjust
		livingholder.melee_damage_upper -= melee_lower_adjust
		livingholder.move_to_delay -= movement_adjust

		livingholder.inherent_projectile_mult -= inherent_projectile_mult
		livingholder.inherent_projectile_increment -= inherent_projectile_increment

		for (var/entry in projectile_adjust_increment)
			livingholder.projectile_damage_increment[entry] -= projectile_adjust_increment[entry]
		for (var/entry in projectile_adjust_mult)
			livingholder.projectile_damage_mult[entry] -= projectile_adjust_mult[entry]

		livingholder.projectile_armor_penetration_adjustment -= projectile_armor_penetration_adjustment
		livingholder.projectile_armor_penetration_mult -= projectile_armor_penetration_mult

		livingholder.projectile_speed_increment -= projectile_speed_increment
		livingholder.projectile_speed_mult -= projectile_speed_mult

/datum/stat_modifier/mob/living/apply_to(atom/target)

	. = ..()

	if (isliving(target))
		var/mob/living/livingtarget = target

		livingtarget.melee_damage_upper = CLAMP((livingtarget.melee_damage_upper + melee_upper_adjust), 0, INFINITY)
		livingtarget.melee_damage_lower = CLAMP((livingtarget.melee_damage_lower + melee_lower_adjust), 0, INFINITY)
		livingtarget.move_to_delay = CLAMP((livingtarget.move_to_delay + movement_adjust), 0, INFINITY)

		livingtarget.inherent_projectile_mult = CLAMP((livingtarget.inherent_projectile_mult + inherent_projectile_mult), 0, INFINITY)
		livingtarget.inherent_projectile_increment = CLAMP((livingtarget.inherent_projectile_increment + inherent_projectile_increment), 0, INFINITY)

		for (var/entry in projectile_adjust_increment)
			livingtarget.projectile_damage_increment[entry] += projectile_adjust_increment[entry]
		for (var/entry in projectile_adjust_mult)
			livingtarget.projectile_damage_mult[entry] += projectile_adjust_mult[entry]

		livingtarget.projectile_armor_penetration_adjustment = CLAMP((livingtarget.projectile_armor_penetration_adjustment + projectile_armor_penetration_adjustment), 0, INFINITY)
		livingtarget.projectile_armor_penetration_mult = CLAMP((livingtarget.projectile_armor_penetration_mult + projectile_armor_penetration_mult), 0, INFINITY)

		livingtarget.projectile_speed_increment = CLAMP((livingtarget.projectile_speed_increment + projectile_speed_increment), 0, INFINITY)
		livingtarget.projectile_speed_mult = CLAMP((livingtarget.projectile_speed_mult + projectile_speed_mult), 0, INFINITY)

/datum/stat_modifier/mob/living/carbon
