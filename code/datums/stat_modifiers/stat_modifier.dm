/**
 * Stat modifier datum. Used in applying modifications to a given object's stats or behaviors.
 *
 * Variable format for most vars:
 *
 * variable_mult = The variable will be multiplied by this number. Can be a deicmal. Applied before the increment.
 *
 * variable_zeroth = When multiplying the variable by variable_mult, if the variable is zero, variable_zeroth will be added to it to prevent zero multiplication.
 * Can be set to zero to allow zero multiplication.
 *
 * variable_increment = The variable will be incremented by this number. Can be a decimal. Applied after the mult.
**/
/datum/stat_modifier
	/// If our holder's current_stat_modifiers list has more or equal instances of ourself, compared to this, we return and remove ourselves from their allowed list.
	var/maximum_instances = 1

	var/holder_original_prob

	/// The atom we have applied our changes to
	var/atom/holder

	/// The prefix that will be applied to the name of target
	var/prefix = null

	/// Changes max health by the entered value.
	var/maxHealth_increment
	/// Multiplies max health by the entered value.
	var/maxHealth_mult
	/// The zeroth of any given var is, if the multiplied value is zero, the value that will be added to it before it is multiplied, used to prevent multiplication with zero.
	var/maxHealth_zeroth = 0.1

	/// Every non-duplicate description will be printed when the holder is examined.
	var/description = null

	/// Defines in misc.dm. Determines what gets these modifiers and what doesn't.
	var/stattags = DEFENSE_STATTAG

	var/list/mutually_exclusive_with = list()

	//todo: store the vars we change for more accurate removal

/// Inverts all effects the modifier provided, and optionally qdeletes it.
/datum/stat_modifier/proc/remove(qdel_src = TRUE)

	if (maxHealth_increment)
		holder.maxHealth = ZERO_OR_MORE((holder.maxHealth - maxHealth_increment))
		holder.health = ZERO_OR_MORE((holder.health - maxHealth_increment))

	if (maxHealth_mult)
		holder.maxHealth = ZERO_OR_MORE((holder.maxHealth / maxHealth_mult))
		holder.health = ZERO_OR_MORE((holder.health / maxHealth_mult))

	holder.prefixes -= prefix
	holder.update_prefixes()

	holder.current_stat_modifiers -= src

	var/instances_in_target = instances_of_type_in_list(src, holder.current_stat_modifiers)

	if (instances_in_target < maximum_instances)
		holder.allowed_stat_modifiers[type] = holder_original_prob

	if (instances_in_target <= 0)
		for (var/typepath in mutually_exclusive_with)
			if (typepath in holder.current_stat_modifiers)
				var/do_we_readd = TRUE
				for (var/entry in holder.current_stat_modifiers)
					var/datum/stat_modifier/stat_mod_entry = entry
					if (typepath in initial(stat_mod_entry.mutually_exclusive_with))
						do_we_readd = FALSE
						break
				if (do_we_readd)
					holder.allowed_stat_modifiers[typepath] = mutually_exclusive_with[typepath] //we use our stored value to restore it!

	holder = null

	if (qdel_src)
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
		target.allowed_stat_modifiers[type] = 0
		return FALSE

	for (var/entry in target.current_stat_modifiers)
		if (entry in mutually_exclusive_with)
			return FALSE

	holder = target

	holder_original_prob = holder.allowed_stat_modifiers[type]

	target.current_stat_modifiers += src

	for (var/typepath in mutually_exclusive_with)
		mutually_exclusive_with[typepath] = holder.allowed_stat_modifiers[typepath] //store the value for if we get removed
		holder.allowed_stat_modifiers[typepath] = 0 // you are now forbidden from having these

	instances_in_target = instances_of_type_in_list(src, target.current_stat_modifiers) //refresh the var
	if (instances_in_target >= maximum_instances)
		target.allowed_stat_modifiers[type] = 0
		//we dont return here, since we already added ourselves to the list


	if (prefix && target.get_prefix)
		target.prefixes += prefix

		target.update_prefixes()

	if (maxHealth_mult)
		target.maxHealth = ZERO_OR_MORE(SAFEMULT(target.maxHealth, maxHealth_mult, maxHealth_zeroth))
		target.health = ZERO_OR_MORE(SAFEMULT(target.health, maxHealth_mult, maxHealth_zeroth))

	if (maxHealth_increment)
		target.maxHealth = ZERO_OR_MORE((target.maxHealth + maxHealth_increment))
		target.health = ZERO_OR_MORE((target.health + maxHealth_increment))

	return TRUE

/// Empty modifier. Does nothing. Returns false.
/datum/stat_modifier/none

	stattags = NOTHING_STATTAG

/datum/stat_modifier/none/apply_to(var/atom/target)
	return FALSE
