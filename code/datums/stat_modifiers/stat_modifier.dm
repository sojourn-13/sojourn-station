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

	/**
	 * When a modifier is added to an entity, it sets the probability for any mutually exclusive mods/itself to 0, itself if they have the max amount of us, determined in maximum_instances.
	 * This is how we reset our own probability on removal, if we remove enough for them to have more of us. Restoration of other probabilites is done in the list of mutually exclusive modifiers.
	 **/
	var/holder_original_prob

	/// The atom we have applied our changes to
	var/atom/movable/holder

	/// The prefix that will be applied to the name of target
	var/prefix = null

	/// Every non-duplicate description will be printed when the holder is examined.
	var/description = null

	/// TODO
	var/list/prefixes = list("Tier1" = null, "Tier2" = null, "Tier3" = null,
							"Tier-1" = null, "Tier-2" = null, "Tier-3" = null
							)

	/// TODO
	var/list/descriptions = list("Tier1" = null, "Tier2" = null, "Tier3" = null,
								"Tier-1" = null, "Tier-2" = null, "Tier-3" = null
								)

	/// If true, we will completely forgo any after_apply() prefix determination.
	var/force_default_prefix = TRUE

	/// Changes max health by the entered value.
	var/maxHealth_increment
	/// Multiplies max health by the entered value.
	var/maxHealth_mult
	/// The zeroth of any given var is, if the multiplied value is zero, the value that will be added to it before it is multiplied, used to prevent multiplication with zero.
	var/maxHealth_zeroth = 0.1

	/// Defines in misc.dm. Determines what gets these modifiers and what doesn't.
	var/stattags = DEFENSE_STATTAG

	/// Any modifier typepaths in this will have their prob on our holder set to 0 if we're added, and their original prob stored as the value of the typepath, for use in remove().
	var/list/mutually_exclusive_with = list()

	//todo: store the vars we change for more accurate removal

/// Inverts all effects the modifier provided, and optionally qdeletes it. Needs to have effects manually added.
/datum/stat_modifier/proc/remove(qdel_src = TRUE)

	if (maxHealth_increment)
		holder.maxHealth = ZERO_OR_MORE((holder.maxHealth - maxHealth_increment))
		holder.health = ZERO_OR_MORE((holder.health - maxHealth_increment))

	if (maxHealth_mult)
		holder.maxHealth = ZERO_OR_MORE((holder.maxHealth / maxHealth_mult))
		holder.health = ZERO_OR_MORE((holder.health / maxHealth_mult))

	// Remove our prefix, and then regenerate prefixes
	LAZYREMOVE(holder.name_prefixes, prefix)
	holder.update_prefixes()

	LAZYREMOVE(holder.current_stat_modifiers, src)

	// First, we check how many of us are in our holder...
	var/instances_in_target = instances_of_type_in_list(src, holder.current_stat_modifiers)

	// ...and if it's less than our max, and we are disabled, let's restore our probability
	// in case of not existing, lazyaccess will return null, which != 0
	if (instances_in_target < maximum_instances && (LAZYACCESS(holder.allowed_stat_modifiers, type) == 0))
		LAZYSET(holder.allowed_stat_modifiers, type, holder_original_prob)
		holder_original_prob = null // dont need to hold onto this anymore

	// if we arent in the target anymore...
	if (instances_in_target <= 0)
		for (var/typepath in mutually_exclusive_with) // ...search for anything we're mutually exclusive with...
			if (typepath in holder.current_stat_modifiers) // ...and if our holder has them as a key, meaning theyre allowed to have them...
				var/do_we_readd = TRUE
				for (var/entry in holder.current_stat_modifiers) // ...lets search the rest of the typepaths...
					var/datum/stat_modifier/stat_mod_entry = entry // ...to see...
					if (typepath in initial(stat_mod_entry.mutually_exclusive_with)) // ...if any of them are also mutually exclusive with this...
						do_we_readd = FALSE // ..and if one is, theyre still mutually exclusive, so lets break and say "we're not re-adding them"
						break
				if (do_we_readd) // ...if nothing is mutually exclusive...
					LAZYSET(holder.allowed_stat_modifiers, typepath, mutually_exclusive_with[typepath]) // ...we use our stored value to restore it!

	holder = null //we no longer have a holder

	if (qdel_src)
		qdel(src)

	return TRUE

/datum/stat_modifier/Destroy()

	if (holder)
		LAZYREMOVE(holder.current_stat_modifiers, src)
		holder = null

	return ..()

/**
 * The hub for checking if this stat modifier can be applied. Likely called in atom initialize.
 *
 * Prior to the application of effects, if the instances of this datum's typepath in the target's current_stat_modifiers list surpasses the datum's maximum_instances var,
 * it will return and remove it's own typepath from the target's allowed_stat_modifers list. After the application, if this is true, it will only remove it's own typepath
 * from the latter list.
 *
**/
/datum/stat_modifier/proc/valid_check(var/atom/movable/target, var/list/arguments)

	var/instances_in_target = instances_of_type_in_list(src, target.current_stat_modifiers) // how many of us are in our target?

	if (instances_in_target >= maximum_instances) // this shouldnt ever be true, but if it is, lets make sure it doesnt happen again
		LAZYSET(target.allowed_stat_modifiers, type, 0) // by disabling ourselves
		return FALSE // and returning

	for (var/entry in target.current_stat_modifiers) // if we're allowed in...
		if (entry in mutually_exclusive_with) // ...lets scan all the typepaths...
			return FALSE // ...to see if we're mutually exclusive with any of them. note this only checks OUR list

	holder = target // they are now our holder!

	holder_original_prob = LAZYACCESS(holder.allowed_stat_modifiers, type) // we need this in case we disable ourselves and remove ourselves later

	LAZYADD(target.current_stat_modifiers, src) // add ourselves to their currently held modifiers

	for (var/typepath in mutually_exclusive_with)
		mutually_exclusive_with[typepath] = LAZYACCESS(holder.allowed_stat_modifiers, typepath) //store the value for if we get removed
		LAZYSET(holder.allowed_stat_modifiers, typepath, 0) // you are now forbidden from having these

	instances_in_target = instances_of_type_in_list(src, target.current_stat_modifiers) //refresh the var
	if (instances_in_target >= maximum_instances) // if we are now at the maximum of our own instances...
		LAZYSET(target.allowed_stat_modifiers, type, 0) // ...disable ourselves
		//we dont return here, since we already added ourselves to the list

	var/arguments_to_pass = consider_custom_effect(target, arguments, status = PRIOR_TO_APPLY) // lets see if we have any pre_apply effects

	apply_to(holder, arguments, arguments_to_pass) // now we apply our affects, passing arguments_to_pass to after_apply(), if we have any arguments to pass

	return TRUE

/**
 * The hub for the application of effects from the datum to the target. Likely called by valid_check().
 *
 * In all subtypes of stat_modifier, the datum's type-specific effects are protected by a typecheck, allowing things not of the intended type to still receive the more
 * general effects.
 *
 * Args:
 * atom/movable/target: The target the effects will be applied to.
**/
/datum/stat_modifier/proc/apply_to(var/atom/movable/target, var/list/arguments, arguments_to_pass)

	if (maxHealth_mult)
		target.maxHealth = ZERO_OR_MORE(SAFEMULT(target.maxHealth, maxHealth_mult, maxHealth_zeroth))
		target.health = ZERO_OR_MORE(SAFEMULT(target.health, maxHealth_mult, maxHealth_zeroth))

	if (maxHealth_increment)
		target.maxHealth = ZERO_OR_MORE((target.maxHealth + maxHealth_increment))
		target.health = ZERO_OR_MORE((target.health + maxHealth_increment))

	var/ratio = consider_custom_effect(target, arguments, arguments_to_pass, AFTER_APPLY) // if we have a after_apply() override lets run it

	determine_description_and_prefixes(target, ratio)

	if (prefix && target.get_prefix) // do we have a prefix, and does our target want a prefix?
		LAZYADD(target.name_prefixes, prefix) // if so, lets add ours to their prefix list...
		target.update_prefixes() // ...and regenerate their prefixes

	return TRUE

/datum/stat_modifier/proc/consider_custom_effect(atom/movable/target, list/arguments, arguments_to_pass, status)

	var/list_length

	if (arguments) // if we have any arguments from the holder.allowed_stat_modifiers list...
		list_length = (arguments.len) // ...this is how many we have

	switch (status)
		if (PRIOR_TO_APPLY) // lets see what type of custom effect should be ran, and then pass a few args to them
			return before_apply(target, arguments, list_length)
		if (AFTER_APPLY)
			return after_apply(target, arguments, list_length, arguments_to_pass)

	return // only happens if no custom effect is present

/// Holder proc for any logic that has to be run before apply_to()
/datum/stat_modifier/proc/before_apply(atom/movable/target, list/arguments, arg_length)
	return

/// Holder proc for any logic that has to be run after apply_to(), but before prefixes and descriptions are determined
/datum/stat_modifier/proc/after_apply(atom/movable/target, list/arguments, arg_length, arguments_to_pass)
	return

/// Uses a ratio to determine which prefix and description will be gained. If arguments_to_pass is null, uses ratio1 and ratio2 instead. Returns if force_default_prefix is true.
/datum/stat_modifier/proc/determine_description_and_prefixes(atom/movable/target, arguments_to_pass, ratio1, ratio2)

	if (force_default_prefix || (!(target.get_prefix)))
		return FALSE

	var/ratio_between_now_and_then
	if (!(isnull(arguments_to_pass)))
		if (islist(arguments_to_pass))
			var/list/arg_list = arguments_to_pass
			if ((arg_list.len == 2) && ((isnull(ratio1)) || (isnull(ratio2)))) //we're probably 2 numbers, ready to be ratio-ized or whatever
				ratio1 = arg_list[1]
				ratio2 = arg_list[2]
		else
			ratio_between_now_and_then = arguments_to_pass
	if (ratio1 && ratio2)
		ratio_between_now_and_then = (ratio1 / ratio2) // this will override the last if statement so be careful

	if (!(isnull(ratio_between_now_and_then)))
		if (ratio_between_now_and_then == 1)
			return FALSE
		else
			if (ratio_between_now_and_then < 1)
				if (ratio_between_now_and_then <= 0.5)
					if (ratio_between_now_and_then <= 0.15)
						set_prefix_and_description("Tier-3")
					else
						set_prefix_and_description("Tier-2")
				else
					set_prefix_and_description("Tier-1")
			else if (ratio_between_now_and_then > 1)
				if (ratio_between_now_and_then >= 1.5)
					if (ratio_between_now_and_then >= 1.85)
						set_prefix_and_description("Tier3")
					else
						set_prefix_and_description("Tier2")
				else
					set_prefix_and_description("Tier1")

		if (isnull(prefix) || isnull(description)) //only true if someone forgot to set up their prefix and description
			set_prefix_and_description("Tier1") //failsafe, hopefully

		return TRUE
	return FALSE

/datum/stat_modifier/proc/set_prefix_and_description(key)

	prefix = prefixes[key]
	description = descriptions[key]

	return TRUE

/// Empty modifier. Does nothing. Returns false.
/datum/stat_modifier/none

	stattags = NOTHING_STATTAG

/datum/stat_modifier/none/apply_to(var/atom/movable/target)
	return FALSE
