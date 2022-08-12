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
	/// Allows other transform_types with the same flag to replace this one.
	var/override_others_with_flag = FALSE
	/// The atom we are applied to.
	var/atom/holder

/datum/transform_type/Destroy()

	if (holder)
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
	if ((isnull(rebuild)) && (!isnull(result)))
		rebuild = result
	if (rebuild)
		holder.rebuild_transform(FALSE, FALSE) //create a new transform, with the new values
	return

/// Base proc for updating our values when update_self() is called.
/datum/transform_type/proc/update_values()
	return

/// Add a new transformation type datum associated with it's flag into our transform_types list, and apply its effects.
/// Has arguments on par with the basetype of transform_type, with the exception of holder. These args are passed to new, and are used by /modular to change it's variables.
/// If you don't pass a flag argument, the operation will crash on modular, so do pass one that isn't the default.
/atom/proc/add_transformation_type(transform_arg, scalex = 1, scaley = 1, rotation = 0, shiftx = 0, shifty = 0, flagarg, override)
	if (!transform_types)
		transform_types = list()

	var/datum/transform_type/transform_datum = transform_arg //you may wonder why i declare the type here and not in the arg, its because if i did, it caused a previous declaration error
	if (!flagarg)
		flagarg = initial(transform_datum.flag) // !!!THIS WILL CAUSE MODULAR NEW() TO CRASH! DEFINE YOUR DAMN FLAGARG IF YOURE USING A MODULAR TYPE!!!
	if (flagarg in transform_types)
		if (isnull(override))
			override = initial(transform_datum.override_others_with_flag)
		if (override)
			remove_transformation_type(flagarg) //we can override others with our flag, so lets just get rid of this one
		else
			return

	transform_datum = new transform_arg(NULLSPACE)
	var/result = (transform_datum.apply_custom_values(scalex, scaley, rotation, shiftx, shifty, flagarg, override)) //copy everything but the first arg and apply it
	if (result != TRUE) //result can return a string in an error state, so we explicitely check for true
		qdel(transform_datum)
		CRASH("[transform_datum] apply_custom_values crashed for reason [result]")
	transform_types[flagarg] = transform_datum
	transform_datum.holder = src
	apply_transformation(transform_types[flagarg])

/// Remove this flag's associated datum from ourselves, and remove its effects, then remove the flag.
/atom/proc/remove_transformation_type(flag)
	if (!transform_types)
		transform_types = list()

	if (!(flag in transform_types))
		return
	qdel(transform_types[flag]) //since its no longer needed we can delete it and unassign the flag
	transform_types -= flag

	rebuild_transform()

/atom/proc/rebuild_transform(update = TRUE, update_values = TRUE, rebuild = FALSE)
	var/matrix/new_transform = matrix() //destroy the current matrix and reassign a new one
	transform = new_transform

	var/datum/transform_type/transform_datum
	var/key
	for (var/i = 1, i <= transform_types.len, i++) //reapply all our transforms, in the order we received them
		key = transform_types[i]
		transform_datum = transform_types[key]
		apply_transformation(transform_datum, update, update_values, rebuild)

	return TRUE

/**
 * Apply this transformation's effects onto us.
 * Args:
 * update = TRUE - If TRUE, we call update_self() on the datum, with before_initial_application set to TRUE.
 * update_values = TRUE - Passed to update_self, sets it's update_values arg.
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
