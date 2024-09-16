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
	var/override = FALSE
	/// The atom we are applied to.
	var/atom/holder
	/// If you actually use value_target, set this to TRUE. Weakrefs aren't free.
	var/needs_value_target = FALSE
	/// The atom we use for updating our values and such. Weakreffed, as we have no way of ensuring it isn't being deleted.
	var/datum/weakref/value_target

/datum/transform_type/Destroy()

	if(holder)
		if(LAZYACCESS(holder.transform_types, flag) == src) //we can be deleted by an overridding thing so we must check
			LAZYREMOVE(holder.transform_types, flag) //for sanity
		update_holder_status(null, null)
	value_target = null

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
	if (!(LAZYACCESS(transform_types, transform_flag)))
		return
	var/datum/transform_type/transform_datum = transform_types[transform_flag]

	transform_datum.update_self()

/// Base proc for applying custom values on creation. Must return TRUE or else apply_transformation will crash. Can return a string for the CRASH to display it in runtimes.
/datum/transform_type/proc/apply_custom_values(scale_x = src.scale_x,
											   scale_y = src.scale_y,
											   rotation = src.rotation,
											   shift_x = src.shift_x,
											   shift_y = src.shift_y,
											   flag = src.flag,
											   override = src.override,
											   priority = src.priority)

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
 * List-based proc for adding NEW, aka non-existing transform types to the atom.
 * Args:
 * list/arguments - How you determine what to add. Format: add_new_transformations(list(type, type, list(type, list(params)), etc)).
 * valuetarget = src - Passed to add_new_transformation.
 * If you are passing params, you must wrap both the type and param list in a list of its own.
 *
 * This is more efficient than add_new_transformation because it only rebuilds once.
**/
/atom/proc/add_new_transformations(list/arguments, valuetarget = src)
	var/do_we_rebuild = FALSE
	for (var/arg as anything in arguments)
		var/datum/transform_type/found_type
		var/list/params

		if (islist(arg))
			var/list/arg_list = arg
			found_type = arg_list[1] //please always put the datum in the first slot
			params = arg_list[2] //this is where the list is
		else
			found_type = arg
			params = null //by default null by hey might as well

		if (add_new_transformation(found_type, params, FALSE, valuetarget)) // if we succeeded in adding thsi transformation
			do_we_rebuild = TRUE // we need to rebuild

	if (do_we_rebuild)
		rebuild_transform() //saves a bunch of rebuilds

/**
 * Arg-based proc for adding NEW, aka non-existing transform types to the atom.
 * Args:
 * found_type: The type you are going to create and then add.
 * list/params: The params you are going to pass to add_transformation.
 * rebuild = TRUE: If this proc will handle the rebuilding. If TRUE, rebuild_transform() will be called if add_transformation() succeeds.
 * valuetarget = src: Passed to add_transformation().
**/
/atom/proc/add_new_transformation(found_type, list/params, rebuild = TRUE, valuetarget = src)
	var/datum/transform_type/transform_datum = new found_type(NULLSPACE)

	. = add_transformation(transform_datum, params, FALSE, valuetarget) //return the same value as this proc. we pass FALSE for rebuild because we'll do it ourselves

	if (.) // if add_trans succeeded
		if (rebuild) // and if we can rebuild
			rebuild_transform() // lets do it

	// otherwise, we will by default return our . to add_new_transformations if it called us, which will save a lot of rebuilds

/**
 * Arg-based proc for adding existing transform types to the atom.
 * Args:
 * datum/transform_type/transform_datum: The datum you will be adding.
 * list/params: Params to be passed to apply_custom_values using arglist.
 * rebuild = TRUE: If this proc will handle the rebuilding. If TRUE, rebuild_transform() will be called if the proc succeeds.
 * valuetarget = src: The atom to be used for update_values() and such, weakreffed. Needed for things that use the values of others, like shadows.
**/
/atom/proc/add_transformation(var/datum/transform_type/transform_datum, list/params, rebuild = TRUE, valuetarget = src)
	var/result = transform_datum.apply_custom_values(arglist(params)) //dont worry this still works even if params is null or empty
	if (result != TRUE) //result can return a string in an error state, so we explicitely check for true
		qdel(transform_datum)
		CRASH("[transform_datum] apply_custom_values crashed for reason [result]")

	if (transform_datum.flag in transform_types)
		if (transform_datum.override)
			remove_transformation(transform_datum.flag) //we can override others with our flag, so lets just get rid of this one
		else
			qdel(transform_datum)
			return

	LAZYSET(transform_types, transform_datum.flag, transform_datum)
	transform_datum.update_holder_status(src, valuetarget)

	if (rebuild)
		rebuild_transform()

	return TRUE
/**
 * List-based proc for adding existing transform types to the atom.
 * Args:
 * list/arguments - How you determine what to add. Format: add_new_transformations(list(type, type, list(type, list(params)), etc)).
 * valuetarget = src - Passed to add_transformation.
 * If you are passing params, you must wrap both the type and param list in a list of its own.
 *
 * This is more efficient than add_transformation because it only rebuilds once.
**/
/atom/proc/add_transformations(list/arguments, valuetarget = src)
	var/do_we_rebuild = FALSE
	for (var/arg as anything in arguments)
		var/datum/transform_type/found_type
		var/list/params

		if (islist(arg))
			var/list/arg_list = arg
			found_type = arg_list[1] //please always put the datum in the first slot
			params = arg_list.Copy(2) //we dont need to pass ourselves
		else
			found_type = arg
			params = null //by default null by hey might as well

		if (add_transformation(found_type, params, FALSE, valuetarget))
			do_we_rebuild = TRUE

	if (do_we_rebuild)
		rebuild_transform() //saves a bunch of rebuilds

/// Remove this flag's associated datum from ourselves, and remove its effects, then remove the flag.
/atom/proc/remove_transformation(flag, rebuild = TRUE)
	if(!(flag in transform_types))
		return
	qdel(transform_types[flag]) //since its no longer needed we can delete it and unassign the flag
	LAZYREMOVE(transform_types, flag)

	if (rebuild)
		rebuild_transform()

	return TRUE

/// Removes all transformation types associated with the given flags.
/atom/proc/remove_transformations(list/flags)
	var/do_we_rebuild = FALSE
	for (var/flag as anything in flags)
		if (remove_transformation(flag, FALSE))
			do_we_rebuild = TRUE

	if (do_we_rebuild)
		rebuild_transform() //saves a bunch of rebuilds

/// Sets transform to null, then deletes all transform_types in the transform_type list, before cutting it.
/atom/proc/remove_all_transforms(null_transform = TRUE)
	if (null_transform)
		transform = null //destroy the transform
	else
		transform = matrix() //reset the transform

	QDEL_LAZYLIST_ASSOC_VAL(transform_types) //and then destroy everything in the list

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

	var/list/cached_transforms = LAZYCOPY(transform_types)

	var/datum/transform_type/transform_datum
	var/key
	for(key as anything in transform_types) //unhappy with the amount of loops in this proc
		transform_datum = transform_types[key]
		transform_types[key] = transform_datum.priority //temporarily replace it with the priority, for sorting

	// note: timsort is a stable algorithm, meaning 2 adjacent values with the same value will be kept in order
	// ex: a list of (a = 200, b = 250, c = 250, d = 150). this will be sorted into (d, a, b, c). note that b and c's position doesnt actually really change,
	// and their order relative to eachother is preserved
	if(transform_types)
		sortTim(transform_types, GLOBAL_PROC_REF(cmp_numeric_asc), TRUE) //sort from least to greatest

	for(key as anything in transform_types)
		transform_types[key] = cached_transforms[key] //now that it's sorted, we can reapply our original values

	var/matrix/new_transform = matrix() //destroy the current matrix and reassign a new one
	transform = new_transform

	for(var/i in 1 to LAZYLEN(transform_types)) //reapply all our transforms, in the order of their priority
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

/**
 * Copies the transformation types from atom/copy_target and applies it to src.
 * Destroys the currently existing transform and replaces all existing transform types.
 * Args:
 * atom/copy_target: The atom to copy from.
 * atom/valuetarget: Pased to add_transformations.
**/
/atom/proc/copy_transformations_from(atom/copy_target, atom/valuetarget = copy_target)
	remove_all_transforms(FALSE) //reset our transform and transform types to default

	var/list/to_add = list()

	var/list/to_copy_from = copy_target.transform_types
	for (var/key as anything in to_copy_from)
		var/datum/transform_type/found_type = to_copy_from[key]
		var/type_to_use = found_type.type //this runtimes otherwise
		var/datum/transform_type/transform_datum = new type_to_use(NULLSPACE)

		transform_datum.copy_variables_from(found_type, FALSE, TRUE)

		to_add += transform_datum

	add_transformations(to_add, valuetarget)

/**
 * Proc for copying variables from to_copy_from to src. Useful for copying transformations from an atom to another.
 * Must call parent and must override for type-specific vars.
 * Args:
 * datum/transform_type/to_copy_from: The datum to copy variables from.
 * copyholder = FALSE: If true, src will also take to_copy_from's holder var.
 * copyvaluetarget = TRUE: If true, src will also take to_copy_from's value_target var.
**/
/datum/transform_type/proc/copy_variables_from(datum/transform_type/to_copy_from, copyholder = FALSE, copyvaluetarget = TRUE)
	SHOULD_CALL_PARENT(TRUE) // should call parent because if you dont you dont get the crucial variables up here

	src.scale_x = to_copy_from.scale_x
	src.scale_y = to_copy_from.scale_y

	src.rotation = to_copy_from.rotation

	src.shift_x = to_copy_from.shift_x
	src.shift_y = to_copy_from.shift_y

	src.flag = to_copy_from.flag
	src.priority = to_copy_from.priority

	src.override = to_copy_from.override

	if (copyholder)
		src.holder = to_copy_from.holder

	if (copyvaluetarget)
		src.value_target = to_copy_from.value_target //dont worry, its already in weakref form

/datum/transform_type/proc/update_holder_status(to_be_held_by, to_use_for_values)
	holder = to_be_held_by
	if(needs_value_target)
		value_target = WEAKREF(to_use_for_values)

