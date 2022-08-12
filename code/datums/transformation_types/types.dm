/datum/transform_type/prone
	rotation = PRONE_MATRIX_ROTATE
	flag = PRONE_TRANSFORM

/datum/transform_type/random_rotation
	flag = RANDOM_ROTATION_TRANSFORM
	override_others_with_flag = TRUE

	var/lower_bound = 0
	var/upper_bound = 360

/datum/transform_type/random_rotation/New(location, ...)

	rotation = rand(lower_bound, upper_bound)

	. = ..(location)

/datum/transform_type/random_rotation/half
	upper_bound = 180

/datum/transform_type/modular
	flag = MODULAR_BASE_TRANSFORM_DO_NOT_USE

/datum/transform_type/modular/New(location, scalex = scale_x, scaley = scale_y, rotationarg = rotation, shiftx = shift_x, shifty = shift_y, flagarg = flag)

	if (flagarg == flag)
		CRASH("[usr] tried to add a modular transform_type [src], but didn't change the flag arg!")

	scale_x = scalex
	scale_y = scaley
	rotation = rotationarg
	shift_x = shiftx
	shift_y = shifty
	flag = flagarg

	. = ..(location)

/datum/transform_type/ameridian_structures
	flag = AMERIDIAN_TRANSFORM

/datum/transform_type/ameridian_structures/crystal_resizing
	flag = CRYSTAL_RESIZING_TRANSFORM

/datum/transform_type/ameridian_structures/crystal_resizing/update_values()
	var/obj/structure/ameridian_crystal/crystal = holder

	scale_x = ((1/crystal.max_growth) * crystal.growth) // So the crystal is at 20% size at growth 1, 40% at growth 2, e.t.c.
	scale_y = scale_x //sync the y value

	. = ..()

/datum/transform_type/shard/variable_size
	flag = SHARD_VARIABLE_SIZE_TRANSFORM

/datum/transform_type/shard/variable_size/update_values()

	var/obj/item/material/shard/our_shard = holder

	if (our_shard.amount < 1)
		//Variable icon size based on material quantity
		//Shards will scale from 0.6 to 1.25 scale, in the range of 0..1 amount
		scale_x = (((1.25-0.8)*our_shard.amount)+0.8)
		scale_y = scale_x
	. = ..()
