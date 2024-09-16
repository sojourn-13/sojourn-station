SUBSYSTEM_DEF(misc)
	name = "Misc"
	init_order = INIT_ORDER_DEFAULT
	flags = SS_NO_FIRE

/datum/controller/subsystem/misc/Initialize(timeofday)
	initialize_cursors()
	build_junk_field()
	return ..()

GLOBAL_LIST_INIT(cursor_icons, list()) //list of icon files, which point to lists of offsets, which point to icons

/proc/initialize_cursors()
	for(var/i = 0 to MAX_ACCURACY_OFFSET)
		make_cursor_icon('icons/obj/gun_cursors/standard/standard.dmi', i)

/datum/controller/subsystem/misc/proc/build_junk_field()
	var/obj/jtb_generator/jtb_gen = locate(/obj/jtb_generator)
	jtb_gen.generate_junk_field()