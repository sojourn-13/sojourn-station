/obj/structure/termite_burrow
	name = "termite burrow"
	icon = 'icons/obj/burrows.dmi'
	icon_state = "maint_hole"
	desc = "A pile of rocks that regularly pulses as if it was alive. It's constantly reinforced and opened as long as the termites are agitated."
	anchored = TRUE

	var/datum/termite_controller/controller

/obj/structure/termite_burrow/New(loc, parent)
	..()
	controller = parent  // Link burrow with termite controller

/obj/structure/termite_burrow/Destroy()
	visible_message(SPAN_DANGER("\The [src] crumbles!"))
	if(controller)
		controller.burrows -= src
		controller = null
	..()

/obj/structure/termite_burrow/proc/stop()
	qdel(src)  // Delete burrow
