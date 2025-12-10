// Legacy cleanable water decal shimmed to the new fluid system.

/obj/effect/decal/cleanable/water
	name = "water"
	desc = "A puddle of water."
	icon = 'icons/effects/effects.dmi'
	icon_state = "water_floor"
	layer = TURF_LAYER + 0.2
	anchored = TRUE
	mouse_opacity = 0

/obj/effect/decal/cleanable/water/Initialize(mapload, amount = 10)
	. = ..()
	var/turf/T = get_turf(src)
	if(!T)
		return INITIALIZE_HINT_QDEL

	var/depth_gain = max(1, round(amount)) * FLUID_CONDENSE_MULTIPLIER
	var/obj/effect/fluid/F = T.GetFluid()
	if(F)
		F.add_depth(depth_gain)
	else
		new /obj/effect/fluid(T, depth_gain)

	return INITIALIZE_HINT_QDEL


