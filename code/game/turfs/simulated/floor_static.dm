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


/*
Engine water turfs
*/
/turf/simulated/floor/fixed/hydrotile
	name = "freezing cold rushing water"
	desc = "Not safe to stand in."
	icon = 'icons/turf/flooring/beach.dmi'
	icon_state = "coolant"
	initial_flooring = /decl/flooring/beach/water/flooded
	temperature = T20C
	thermal_conductivity = OPEN_HEAT_TRANSFER_COEFFICIENT

/turf/simulated/floor/fixed/hydrotile/shallowcoolant
	name = "cold river water"
	desc = "The ice cold water flows from an underground river to cool the super heated pipes."
	icon_state = "coolantshallow"

/turf/simulated/floor/fixed/hydrotile/inputgate
	name = "river inlet gate"
	desc = "This gate allows the freezing water from an underground river to flow to the engine pipes for cooling."
	icon_state = "input"

/turf/simulated/floor/fixed/hydrotile/outputgate
	name = "river outlet gate"
	desc = "This gate allows the now heated water from an underground river to flow back underground."
	icon_state = "output"