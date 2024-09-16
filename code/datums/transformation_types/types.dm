/datum/transform_type/prone
	rotation = PRONE_MATRIX_ROTATE
	flag = PRONE_TRANSFORM
	priority = PRONE_TRANSFORM_PRIORITY

/datum/transform_type/random_rotation
	flag = RANDOM_ROTATION_TRANSFORM
	priority = RANDOM_ROTATION_TRANSFORM_PRIORITY
	override = TRUE

	var/lower_bound = 0
	var/upper_bound = 360

/datum/transform_type/random_rotation/New(location, ...)

	rotation = rand(lower_bound, upper_bound)

	. = ..(location)

/datum/transform_type/random_rotation/copy_variables_from(datum/transform_type/to_copy_from, copyholder = FALSE, copyvaluetarget = TRUE)
	. = ..()

	if (istype(to_copy_from, /datum/transform_type/random_rotation))
		var/datum/transform_type/random_rotation/transform_datum = to_copy_from
		src.upper_bound = transform_datum.upper_bound
		src.lower_bound = transform_datum.lower_bound

/datum/transform_type/random_rotation/half
	upper_bound = 180

/datum/transform_type/modular
	flag = MODULAR_BASE_TRANSFORM_DO_NOT_USE
	priority = MODULAR_BASE_TRANSFORM_DO_NOT_USE_PRIORITY

/datum/transform_type/modular/apply_custom_values(scale_x = src.scale_x,
												  scale_y = src.scale_y,
												  rotation = src.rotation,
												  shift_x = src.shift_x,
												  shift_y = src.shift_y,
												  flag = src.flag,
												  override = src.override,
												  priority = src.priority)

	// You may wonder why I force it to crash here. It's because using the base flag for this type, a type meant to be re-used in many places, as a replacement for just
	// making a new datum, and not replacing it's flag will cause a ton of incompatability issues.
	if (flag == initial(src.flag))
		return "[usr] tried to add a modular transform_type [src], but didn't change the flag arg from [flag]!" //error state, we pass this for debugging

	src.scale_x = scale_x
	src.scale_y = scale_y
	src.rotation = rotation
	src.shift_x = shift_x
	src.shift_y = shift_y
	src.flag = flag
	src.override = override
	src.priority = priority

	return ..()

/datum/transform_type/ameridian_structures
	flag = AMERIDIAN_TRANSFORM
	priority = AMERIDIAN_TRANSFORM_PRIORITY

/datum/transform_type/ameridian_structures/crystal_resizing
	flag = AMERIDIAN_CRYSTAL_RESIZING_TRANSFORM
	priority = AMERIDIAN_CRYSTAL_RESIZING_TRANSFORM_PRIORITY
	needs_value_target = TRUE

/datum/transform_type/ameridian_structures/crystal_resizing/update_values()
	. = ..()

	var/obj/structure/ameridian_crystal/crystal = (value_target?.resolve())

	if (!crystal)
		return

	var/calculation = ((1/crystal.max_growth) * crystal.growth)
	if ((scale_x != calculation) || (scale_y != calculation))
		scale_x = calculation // So the crystal is at 20% size at growth 1, 40% at growth 2, e.t.c.
		scale_y = scale_x //sync the y value
		return TRUE

/datum/transform_type/shard/variable_size
	flag = SHARD_VARIABLE_SIZE_TRANSFORM
	priority = SHARD_VARIABLE_SIZE_TRANSFORM_PRIORITY
	needs_value_target = TRUE

/datum/transform_type/shard/variable_size/update_values()

	. = ..()
	var/obj/item/material/shard/our_shard = (value_target?.resolve())

	if (!our_shard)
		return

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
	needs_value_target = TRUE

//I'm not sure if this obsolete or not. Size transofrmations should be handled now in update_icons.dm --Evie
/datum/transform_type/human/size_scaling/update_values()
	. = ..()

	var/mob/living/carbon/human/human_target = (value_target?.resolve())

	if (!human_target)
		return

	if ((scale_x != human_target.size_multiplier) || (scale_y != human_target.size_multiplier))
		scale_x = human_target.size_multiplier
		scale_y = scale_x
		return TRUE
