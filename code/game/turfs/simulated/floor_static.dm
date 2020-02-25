// This type of flooring cannot be altered short of being destroyed and rebuilt.
// Use this to bypass the flooring system entirely ie. event areas, holodeck, etc.

/turf/simulated/floor/fixed
	name = "floor"
	icon = 'icons/turf/flooring/tiles.dmi'
	icon_state = "steel"
	initial_flooring = null

/turf/simulated/floor/fixed/attackby(var/obj/item/C, var/mob/user)
	if(istype(C, /obj/item/stack) && !istype(C, /obj/item/stack/cable_coil))
		return
	return ..()

/turf/simulated/floor/fixed/update_icon()
	return

/turf/simulated/floor/fixed/is_plating()
	return 0

/turf/simulated/floor/fixed/set_flooring()
	return

/turf/simulated/floor/fixed/hydrotile
	name = "freezing cold rushing water"
	desc = "Not safe to stand in."
	icon = 'icons/turf/flooring/beach.dmi'
	icon_state = "coolant"
	initial_flooring = /decl/flooring/beach/water/flooded
	temperature = T20C
	thermal_conductivity = OPEN_HEAT_TRANSFER_COEFFICIENT

