/obj/random/turret
	name = "random advanced turret (66% to be a frame)"
	icon = 'icons/misc/landmarks.dmi'
	icon_state = "artifact-orange-low"

/obj/random/turret/item_to_spawn()
		return pickweight(list(
						/obj/machinery/porta_turret/prepper = 1,
						/obj/machinery/porta_turret_construct = 3
					))
