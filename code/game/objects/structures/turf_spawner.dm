/obj/effect/flooring_type_spawner
	name = "underplating spawner"
	icon = 'icons/obj/structures.dmi'
	icon_state = "plating_spawner"
	density = 1
	anchored = 1
	var/change_floor_to_path = /turf/simulated/floor/plating/under
	var/activated = FALSE

/obj/effect/flooring_type_spawner/concrete
	name = "concrete spawner"
	change_floor_to_path = /turf/simulated/floor/rock/manmade/concrete
	icon_state = "concrete_spawner"

/obj/effect/flooring_type_spawner/mining_wall_oreful
	name = "mineral spawner - always give ores"
	change_floor_to_path = /turf/simulated/mineral/random
	icon_state = "raise_rocks"

/obj/effect/flooring_type_spawner/mining_wall
	name = "mineral spawner"
	change_floor_to_path = /turf/simulated/mineral
	icon_state = "raise_rocks"

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
	//Returns are for debugging spawners
		return TRUE
	return FALSE

/obj/effect/flooring_type_spawner/proc/activate()
	handle_flooring_spawn(src)
	activated = TRUE
	return
