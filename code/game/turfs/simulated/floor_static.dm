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
	desc = "It's freezing cold and moving quite fast, but it only comes up past the knees to the average person. Bit uncomfortable, but safe to stand in."
	icon = 'icons/turf/flooring/beach.dmi'
	icon_state = "coolant"
	initial_flooring = /decl/flooring/beach/water/flooded
	temperature = T0C
	thermal_conductivity = OPEN_HEAT_TRANSFER_COEFFICIENT
	wet = 1

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

/*
Outdoor turfs for atmos buggery.
*/
/turf/simulated/floor/fixed/fdirt
	name = "dirt"
	icon = 'icons/turf/flooring/dirt.dmi'
	icon_state = "dirt"
	initial_flooring = /decl/flooring/dirt

/turf/simulated/floor/fixed/fgrass
	name = "grass"
	icon = 'icons/turf/flooring/grass.dmi'
	icon_state = "grass0"
	initial_flooring = /decl/flooring/grass

/*
Shale turfs - Credit to CM-SS13!
*/

/turf/simulated/floor/fixed/shale/rock
	name = "coarse shale"
	icon = 'icons/turf/flooring/dirt.dmi'
	icon_state = "shale_alt"
	initial_flooring = /decl/flooring/shale/rock
	layer = ABOVE_NORMAL_TURF_LAYER //ensures that the rock is above the other layers!
	oxygen = 0
	nitrogen = 0
	carbon_dioxide = 850

/turf/simulated/floor/fixed/shale/dark
	name = "dark shale"
	icon = 'icons/turf/flooring/dirt.dmi'
	icon_state = "shale_dark"
	initial_flooring = /decl/flooring/shale/dark
	oxygen = 0
	nitrogen = 0
	carbon_dioxide = 850

/turf/simulated/floor/fixed/shale/windswept
	name = "windswept shale"
	icon = 'icons/turf/flooring/dirt.dmi'
	icon_state = "shale_windswept"
	initial_flooring = /decl/flooring/shale/windswept
	oxygen = 0
	nitrogen = 0
	carbon_dioxide = 850
