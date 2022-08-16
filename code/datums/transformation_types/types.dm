/datum/transform_type/prone
	rotation = PRONE_MATRIX_ROTATE
	flag = PRONE_TRANSFORM
	priority = PRONE_TRANSFORM_PRIORITY

/datum/transform_type/random_rotation
	flag = RANDOM_ROTATION_TRANSFORM
	priority = RANDOM_ROTATION_TRANSFORM_PRIORITY
	override_others_with_flag = TRUE

	var/lower_bound = 0
	var/upper_bound = 360

/datum/transform_type/random_rotation/New(location, ...)

	rotation = rand(lower_bound, upper_bound)

	. = ..(location)

/datum/transform_type/random_rotation/copy_variables_from(datum/transform_type/to_copy_from, copyholder)
	. = ..()

	if (istype(to_copy_from, /datum/transform_type/random_rotation))
		var/datum/transform_type/random_rotation/transform_datum = to_copy_from
		upper_bound = transform_datum.upper_bound
		lower_bound = transform_datum.lower_bound

/datum/transform_type/random_rotation/half
	upper_bound = 180

/datum/transform_type/modular
	flag = MODULAR_BASE_TRANSFORM_DO_NOT_USE
	priority = MODULAR_BASE_TRANSFORM_DO_NOT_USE_PRIORITY

/datum/transform_type/modular/apply_custom_values(scalex = scale_x, scaley = scale_y, rotationarg = rotation, shiftx = shift_x, shifty = shift_y, flagarg = flag, override = override_others_with_flag, priorityarg = priority)
	// You may wonder why I force it to crash here. It's because using the base flag for this type, a type meant to be re-used in many places, as a replacement for just
	// making a new datum, and not replacing it's flag will cause a ton of incompatability issues.
	if (flagarg == initial(flag))
		return "[usr] tried to add a modular transform_type [src], but didn't change the flag arg from [flagarg]!" //error state, we pass this for debugging

	scale_x = scalex
	scale_y = scaley
	rotation = rotationarg
	shift_x = shiftx
	shift_y = shifty
	flag = flagarg
	override_others_with_flag = override
	priority = priorityarg

	return ..()

/datum/transform_type/ameridian_structures
	flag = AMERIDIAN_TRANSFORM
	priority = AMERIDIAN_TRANSFORM_PRIORITY

/datum/transform_type/ameridian_structures/crystal_resizing
	flag = AMERIDIAN_CRYSTAL_RESIZING_TRANSFORM
	priority = AMERIDIAN_CRYSTAL_RESIZING_TRANSFORM_PRIORITY

/datum/transform_type/ameridian_structures/crystal_resizing/update_values()
	. = ..()

	var/obj/structure/ameridian_crystal/crystal = (value_target.resolve())

	if (crystal)

		var/calculation = ((1/crystal.max_growth) * crystal.growth)
		if ((scale_x != calculation) || (scale_y != calculation))
			scale_x = calculation // So the crystal is at 20% size at growth 1, 40% at growth 2, e.t.c.
			scale_y = scale_x //sync the y value
			return TRUE

/datum/transform_type/shard/variable_size
	flag = SHARD_VARIABLE_SIZE_TRANSFORM
	priority = SHARD_VARIABLE_SIZE_TRANSFORM_PRIORITY

/datum/transform_type/shard/variable_size/update_values()

	. = ..()
	var/obj/item/material/shard/our_shard = (value_target.resolve())

	if (our_shard)
		if (our_shard.amount < 1)
			//Variable icon size based on material quantity
			//Shards will scale from 0.6 to 1.25 scale, in the range of 0..1 amount
			var/calculation = (((1.25-0.8)*our_shard.amount)+0.8)
			if ((scale_x != calculation) || (scale_y != calculation))
				scale_x = calculation
				scale_y = scale_x
				return TRUE

/datum/transform_type/human

/datum/transform_type/human/size_scaling
	flag = HUMAN_SIZE_SCALING_TRANSFORM
	priority = HUMAN_SIZE_SCALING_TRANSFORM_PRIORITY

/datum/transform_type/human/size_scaling/update_values()
	. = ..()

	var/mob/living/carbon/human/human_target = (value_target.resolve())

	if (human_target)
		if ((scale_x != human_target.size_multiplier) || (scale_y != human_target.size_multiplier))
			scale_x = human_target.size_multiplier
			scale_y = scale_x
			return TRUE
