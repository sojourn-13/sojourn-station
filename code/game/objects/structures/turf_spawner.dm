/obj/effect/flooring_type_spawner
	name = "underplating spawner"
	icon = 'icons/obj/structures.dmi'
	icon_state = "plating_spawner"
	density = 1
	anchored = 1
	var/change_floor_to_path = /turf/simulated/floor/plating/under
	var/activated = FALSE

/obj/effect/flooring_type_spawner/Initialize()
	. = ..()
	if(!change_floor_to_path)
		return
	if(SSticker.current_state < GAME_STATE_PLAYING)
		if(activated)
			return
		activate()
		return INITIALIZE_HINT_QDEL
	else
		if(activated)
			return
		spawn(10)
			activate()
			qdel(src)

/obj/effect/flooring_type_spawner/proc/handle_flooring_spawn()
	var/turf/Tsrc = get_turf(src)
	if(Tsrc)
		Tsrc.ChangeTurf(change_floor_to_path)
	if(loc)
		new change_floor_to_path(src.loc)
	return

/obj/effect/flooring_type_spawner/proc/activate()
	handle_flooring_spawn(src)
	activated = TRUE
	return
