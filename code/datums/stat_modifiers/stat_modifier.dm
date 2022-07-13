/// Stat modifier datum. Used in applying modifications to a given object's stats or behaviors.
/datum/stat_modifier
	/// If our holder's current_stat_modifiers list has more or equal instances of ourself, compared to this, we return and remove it from their allowed list.
	var/maximum_instances = 1

	/// The atom we have applied our changes to
	var/atom/holder

	/// The prefix that will be applied to the name of target
	var/prefix = null

	/// Changes max health by the entered value.
	var/max_health_adjustment = 0

	/// Every non-duplicate description will be printed when the holder is examined.
	var/description = null

	/// Defines in misc.dm. Determines what gets these modifiers and what doesn't.
	var/stattags = DEFENSE_STATTAG

	//todo: store the vars we change for more accurate removal

/// Inverts all effects the modifier provided, and optionally qdeletes it.
/datum/stat_modifier/proc/remove(qdel_src = TRUE)

	CLAMP((), , )

	holder.health = CLAMP((health - max_health_adjustment), 0 ,INFINITY)
	holder.maxHealth = CLAMP((maxHealth - max_health_adjustment), 0 , INFINITY)

	holder.prefixes -= prefix
	holder.update_prefixes()

	holder.current_stat_modifiers -= src
	holder = null

	qdel(src)

	return TRUE

/datum/stat_modifier/Destroy()

	if (holder)
		holder.current_stat_modifiers -= src
		holder = null

	return ..()

/**
 * The hub for the application of effects from the datum to the target. Likely called as the result of a pickweight call.
 *
 * Prior to the application of effects, if the instances of this datum's typepath in the target's current_stat_modifiers list surpasses the datum's maximum_instances var,
 * it will return and remove it's own typepath from the target's allowed_stat_modifers list. After the application, if this is true, it will only remove it's own typepath
 * from the latter list.
 *
 * In all subtypes of stat_modifier, the datum's type-specific effects are protected by a typecheck, allowing things not of the intended type to still receive the more
 * general effects.
 *
 * Args:
 * atom/target: The target the effects will be applied to.
**/
/datum/stat_modifier/proc/apply_to(var/atom/target)

	var/instances_in_target = instances_of_type_in_list(src, target.current_stat_modifiers)

	if (instances_in_target >= maximum_instances)
		target.allowed_stat_modifiers -= type
		return FALSE

	holder = target

	target.current_stat_modifiers += src

	instances_in_target = instances_of_type_in_list(src, target.current_stat_modifiers) //refresh the var
	if (instances_in_target >= maximum_instances)
		target.allowed_stat_modifiers -= type
		//we dont return here, since we already added ourselves to the list


	if (prefix && target.get_prefix)
		target.prefixes += prefix

		target.update_prefixes()


	target.maxHealth = CLAMP((target.maxHealth + max_health_adjustment), 0, INFINITY)

	target.health = CLAMP((target.health + max_health_adjustment), 0, INFINITY)

	return TRUE

/// Empty modifier. Does nothing. Returns false.
/datum/stat_modifier/none

/datum/stat_modifier/none/apply_to(var/atom/target)
	return FALSE
