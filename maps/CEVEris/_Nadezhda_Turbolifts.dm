/obj/turbolift_map_obj/turbolift_map_base/Nadezhda
	name = "Bluespace Turbolift"
	lift_size_x = 3 // Size of the actual lift, shaft walls are extra.
	lift_size_y = 3
	icon = 'icons/modules/turbolift/turbolift_preview_3x3 - no walls.dmi'


	wall_type = null // Don't make walls
	createInnerDoors = 1

	turbolift_stops = list(
		/area/turbolift/test/level1,
		/area/turbolift/test/level2,
		)


/area/turbolift/test/level1
	name = "surface (level 1)"
	lift_floor_label = "Surface 1"
	lift_floor_name = "Level One"
	lift_announce_str = "Bluespace transition complete.  Welcome to Base Level 1."
	base_turf = /turf/simulated/floor/plating

/area/turbolift/test/level2
	name = "surface (level 2)"
	lift_floor_label = "Surface 2"
	lift_floor_name = "Level Two"
	lift_announce_str = "Bluespace transition complete.  Welcome to Base Level 2."
	base_turf = /turf/simulated/floor/plating


/datum/turbolift
	music = list('sound/music/elevatormusic.ogg')  // Woo elevator music!
