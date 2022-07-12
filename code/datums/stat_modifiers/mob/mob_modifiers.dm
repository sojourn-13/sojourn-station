/datum/stat_modifier/mob

/datum/stat_modifier/mob/living

	var/melee_upper_adjust = 0
	var/melee_lower_adjust = 0

	var/movement_adjust = 0

/datum/stat_modifier/mob/living/remove()

	if (isliving(holder))
		var/mob/living/livingholder = holder
		livingholder.melee_damage_lower -= melee_lower_adjust
		livingholder.melee_damage_upper -= melee_lower_adjust
		livingholder.move_to_delay -= movement_adjust

	return ..()

/datum/stat_modifier/mob/living/apply_to(atom/target)

	if (isliving(target))
		var/mob/living/livingtarget = target

		livingtarget.melee_damage_upper += melee_upper_adjust
		livingtarget.melee_damage_lower += melee_lower_adjust
		livingtarget.move_to_delay += movement_adjust

	return ..()

/datum/stat_modifier/mob/living/carbon
