/// Datum-based transforms, currently only used for superior mobs. This allows compatability between multiple static types of transforms.
/datum/transform_type
	var/scale_x = 1
	var/scale_y = 1
	var/rotation = 0
	var/shift_x = 0
	var/shift_y = 0
	var/flag
	var/override_others_with_flag = FALSE
	var/atom/holder

/datum/transform_type/Destroy()

	if (holder)
		holder.transform_types -= flag //for sanity
		holder = null

	. = ..()

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

/// Base proc for updating transforms.
/datum/transform_type/proc/update_self(before_initial_application = FALSE, update_values = TRUE)
	if (!before_initial_application)
		holder.apply_transformation(src, TRUE, FALSE) //remove our current values
	if (update_values)
		update_values()
	if (!before_initial_application)
		holder.apply_transformation(src, FALSE, FALSE) // re-apply ourself to our holder
	return

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
		if (!override)
			remove_transformation_type(flagarg) //we can override others with our flag, so lets just get rid of this one
		else
			return

	transform_datum = new transform_arg(NULLSPACE, scalex, scaley, rotation, shiftx, shifty, flagarg) //copy everything but the first arg and send it to new
	transform_types[flagarg] = transform_datum
	transform_datum.holder = src
	apply_transformation(transform_types[flagarg])

/// Remove this flag's associated datum from ourselves, and remove its effects.
/atom/proc/remove_transformation_type(flag)
	if (!transform_types)
		transform_types = list()

	if (!(flag in transform_types))
		return
	var/datum/transform_type/transform_datum = transform_types[flag]

	apply_transformation(transform_datum, TRUE, TRUE, FALSE)
	qdel(transform_datum) //since its no longer needed we can delete it and unassign the flag
	transform_types -= flag

/// Apply this transformation's effects onto us. Remove it's effects, if invert is true.
/atom/proc/apply_transformation(transform_arg, invert = FALSE, update = TRUE, update_values = TRUE)
	var/datum/transform_type/transform_datum = transform_arg
	if (!transform)
		transform = matrix()

	if (update)
		transform_datum.update_self(TRUE, update_values)
	var/scale_x = (transform_datum.scale_x)
	var/scale_y = (transform_datum.scale_y)
	var/rotation = (transform_datum.rotation)
	var/shift_x = (transform_datum.shift_x)
	var/shift_y = (transform_datum.shift_y)

	if (invert)
		scale_x = (GET_MULT_INVERSE(scale_x))
		scale_y = (GET_MULT_INVERSE(scale_y))
		rotation = (SUBTRACT_FROM_360(rotation)) //yes, on values of 0 this returns 360
		shift_x = (INVERT_SIGN(shift_x))
		shift_y = (INVERT_SIGN(shift_y))

	transform = transform.Scale(scale_x, scale_y)
	transform = transform.Turn(rotation)
	transform = transform.Translate(shift_x, shift_y)
