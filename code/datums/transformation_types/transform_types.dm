/// Datum-based transforms, used for compatability between transform types. Ideally will replace all matrix/transform replacements and transforms we have.
/// To use this, you have two options: One, add a new transform_type to types.dm, and apply it with add_transformation_type or add_initial_transforms. This allows full functionality.
/// The second is to use a instance of /transform_type/modular and pass the variables in add_transformation_type through args. This isn't reccomended, but if you dont want to make
/// A new datum, this works decently.
/datum/transform_type
	/// How much this transform will scale the atom on the x axis.
	var/scale_x = 1
	/// How much this transform will scale the atom on the y axis.
	var/scale_y = 1
	/// How much this transform will rotate the atom, in degrees.
	var/rotation = 0
	/// How many pixels on the x axis this transform will shift the atom.
	var/shift_x = 0
	/// How many pixels on the y axis this transform will shift the atom.
	var/shift_y = 0
	/// The flag, in string form (ideally put as a define in _DEFINES/transforms.dm). This is the entire reason this datum was made; so that we can apply a specific transform
	/// to an atom, using say, a constant check, without repeatadly reapplying the same effect and without clearing the transform entirely every time.
	var/flag
	/// The priority that this transform_type will have. When rebuild_transforms() is called, the transform_types list is sorted using priority, from least to greatest,
	/// and then the transform is reset, before applying all transforms from lowest index in the list, to highest.
	var/priority = TRANSFORM_PRIORITY_DEFAULT
	/// If the target has a transform_type with the same flag and this is true, that transform_type will be removed and we will be applied.
	var/override_others_with_flag = FALSE
	/// The atom we are applied to.
	var/atom/holder

/datum/transform_type/Destroy()

	if (holder)
		if (holder.transform_types && holder.transform_types[flag] == src) //we can be deleted by an overridding thing so we must check
			holder.transform_types -= flag //for sanity
		holder = null

	. = ..()

/// Mostly an arbitrary proc. Ran on atom/initialize(). You can put your transforms in this or in any initializing proc, take your pick.
/atom/proc/add_initial_transforms()
	return

/// Updates all transforms in the transform_types list of this atom.
/atom/proc/update_all_transforms()
	for (var/key as anything in transform_types)
		var/datum/transform_type/transform_datum = transform_types[key]
		transform_datum.update_self()

/// Updates the transform with the given flag in the transform_types list.
/atom/proc/update_transform(transform_flag)
	if (!(transform_types[transform_flag]))
		return
	var/datum/transform_type/transform_datum = transform_types[transform_flag]

	transform_datum.update_self()

/// Base proc for applying custom values on creation. Must return TRUE or else apply_transformation will crash. Can return a string for the CRASH to display it in runtimes.
/datum/transform_type/proc/apply_custom_values(scalex, scaley, rotation, shiftx, shifty, flagarg, override)
	return TRUE

/**
 * Base proc for updating transforms. Calls update_values() if update_values == TRUE.
 * Args: before_initial_applicaton = FALSE - used for determining if this update is being called within apply_transformation. If FALSE, we remove ourselves, before updating our
 * values, and then re-apply ourselves. This is so our holder gets our new values without overridding our current effects.
 * update_values = TRUE - If TRUE, we run update_values() in the middle of the proc.
**/
/datum/transform_type/proc/update_self(update_values = TRUE, rebuild)
	var/result
	if (update_values)
		result = update_values()
	if ((isnull(rebuild)) && (!isnull(result))) //if we haven't had rebuild set by a proc, we use the result of update_values() as rebuild
		rebuild = result
	if (rebuild)
		holder.rebuild_transform(FALSE, FALSE) //create a new transform, with the new values
	return

/// Base proc for updating our values when update_self() is called.
/datum/transform_type/proc/update_values()
	return

/**
 * Add a new transformation type datum associated with it's flag into our transform_types list, and apply its effects.
 * If using a modular type, you may make the argument a list. The first entry should always be the type, and the rest should be in the format of the type's
 * apply_custom_values args.
**/
/atom/proc/add_transformation_type(argument)
	if (!transform_types)
		transform_types = list()

	var/datum/transform_type/transform_datum
	var/list/params

	if (islist(argument))
		var/list/entrylist = argument
		var/datum/transform_type/found_type = entrylist[1]
		transform_datum = new found_type(NULLSPACE) // all lists passed to this arg should have the type be in the first slot

		params = entrylist.Copy(2) // we dont need to pass ourselves

	else //clearly, we're not a list nor modular
		transform_datum = new argument(NULLSPACE) //so we can create ourselves

	var/result = transform_datum.apply_custom_values(arglist(params)) //dont worry this still works even if params is null
	if (result != TRUE) //result can return a string in an error state, so we explicitely check for true
		qdel(transform_datum)
		CRASH("[transform_datum] apply_custom_values crashed for reason [result]")

	if (transform_datum.flag in transform_types)
		if (transform_datum.override_others_with_flag)
			remove_transformation_type(transform_datum.flag) //we can override others with our flag, so lets just get rid of this one
		else
			qdel(transform_datum)
			return

	transform_types[transform_datum.flag] = transform_datum
	transform_datum.holder = src

	rebuild_transform()

/**
 * For each type given in the types list, adds it as a new transform_type datum associated with its flag.
 * If using a modular type, you may make it's list entry a list itself. The first entry should always be the type, and the rest should be in the format of the type's
 * apply_custom_values args.
**/
/atom/proc/add_transformations(list/types)
	if (!transform_types)
		transform_types = list()

	var/added_anything = FALSE
	for (var/entry as anything in types)
		var/datum/transform_type/transform_datum
		var/list/params

		if (islist(entry))
			var/list/entrylist = entry
			var/datum/transform_type/found_type = entrylist[1]
			transform_datum = new found_type(NULLSPACE) // all lists passed to this arg should have the type be in the first slot

			params = entrylist.Copy(2) // we dont need to pass ourselves

		else //clearly, we're not a list nor modular
			transform_datum = new entry(NULLSPACE) //so we can create ourselves

		var/result = transform_datum.apply_custom_values(arglist(params)) //dont worry this still works even if params is null
		if (result != TRUE) //result can return a string in an error state, so we explicitely check for true
			qdel(transform_datum)
			CRASH("[transform_datum] apply_custom_values crashed for reason [result]")

		if (transform_datum.flag in transform_types)
			if (transform_datum.override_others_with_flag)
				remove_transformation_type(transform_datum.flag) //we can override others with our flag, so lets just get rid of this one
			else
				qdel(transform_datum)
				continue
		added_anything = TRUE

		transform_types[transform_datum.flag] = transform_datum
		transform_datum.holder = src

	if (added_anything)
		rebuild_transform() // only call it once in comparison to adding each transformation individually

/// Remove this flag's associated datum from ourselves, and remove its effects, then remove the flag.
/atom/proc/remove_transformation_type(flag)
	if (!transform_types)
		transform_types = list()

	if (!(flag in transform_types))
		return
	qdel(transform_types[flag]) //since its no longer needed we can delete it and unassign the flag
	transform_types -= flag

	rebuild_transform()

/// Removes all transformation types associated with the given flags.
/atom/proc/remove_transformations(list/flags)
	var/removed_anything = FALSE
	for (var/flag as anything in flags)
		if (!(flag in transform_types))
			continue
		qdel(transform_types[flag])
		transform_types -= flag
		removed_anything = TRUE

	if (removed_anything)
		rebuild_transform() // micro-op over remove_transformation_type, since we only rebuild once per batch of removals

/// Sets transform to null, then deletes all transform_types in the transform_type list, before cutting it.
/atom/proc/remove_all_transforms()
	transform = null //destroy the transform
	QDEL_LIST_ASSOC_VAL(transform_types) //and then destroy everything in the list

/**
 * This is where we rebuild transforms post-modification. Any removal, addition, or modification of a existing transform type will cause this proc to be called
 * It sorts the transform_types list in order of the type's priority, from least to greatest (maintaining stability), before applying them to the
 * atom, from least priority to highest priority. This is how we ensure consistant behavior of transforms no matter the order we add, remove, or modify them in.
 *
 * The reason this proc is needed is because of how transforms work: Lets say you scale a transform, then rotate it, then translate it. If you untranslated it, then
 * unrotated it, then unscaled it, it'd return to normal, however, if you unrotated it THEN untranslated it, youd have problems, because you'd end up with a different transform.
 * You need to have control over the order at which you apply and remove transformations if you want consistancy.
 *
 * All args are passed to apply_transformation().
**/
/atom/proc/rebuild_transform(update = TRUE, update_values = TRUE, rebuild = FALSE)

	var/list/cached_transforms = transform_types.Copy()

	var/datum/transform_type/transform_datum
	var/key
	for (key as anything in transform_types) //unhappy with the amount of loops in this proc
		transform_datum = transform_types[key]
		transform_types[key] = transform_datum.priority //temporarily replace it with the priority, for sorting

	// note: timsort is a stable algorithm, meaning 2 adjacent values with the same value will be kept in order
	// ex: a list of (a = 200, b = 250, c = 250, d = 150). this will be sorted into (d, a, b, c). note that b and c's position doesnt actually really change,
	// and their order relative to eachother is preserved
	sortTim(transform_types, /proc/cmp_numeric_asc, TRUE) //sort from least to greatest

	for (key as anything in transform_types)
		transform_types[key] = cached_transforms[key] //now that it's sorted, we can reapply our original values

	var/matrix/new_transform = matrix() //destroy the current matrix and reassign a new one
	transform = new_transform

	for (var/i = 1, i <= transform_types.len, i++) //reapply all our transforms, in the order of their priority
		key = transform_types[i]
		transform_datum = transform_types[key]
		apply_transformation(transform_datum, update, update_values, rebuild)

/**
 * Apply this transformation's effects onto us.
 * Args:
 * transform_arg: The transformation we are applying.
 * update = TRUE - If TRUE, we call update_self() on the datum, with before_initial_application set to TRUE.
 * update_values = TRUE - Passed to update_self, sets it's update_values arg.
 * rebuild = FALSE - Same as update_values but for rebuild.
**/
/atom/proc/apply_transformation(transform_arg, update = TRUE, update_values = TRUE, rebuild = FALSE)
	var/datum/transform_type/transform_datum = transform_arg
	if (!transform)
		transform = matrix()

	if (update)
		transform_datum.update_self(update_values, rebuild)
	var/scale_x = (transform_datum.scale_x)
	var/scale_y = (transform_datum.scale_y)
	var/rotation = (transform_datum.rotation)
	var/shift_x = (transform_datum.shift_x)
	var/shift_y = (transform_datum.shift_y)

	transform = transform.Scale(scale_x, scale_y)
	transform = transform.Turn(rotation)
	transform = transform.Translate(shift_x, shift_y)
