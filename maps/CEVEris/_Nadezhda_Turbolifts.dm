/obj/turbolift_map_obj/turbolift_map_base/Nadezhda/ElevOne
	name = "Turbolift"
	lift_size_x = 3 // Size of the actual lift, shaft walls are extra.
	lift_size_y = 3
	icon = 'icons/modules/turbolift/turbolift_preview_3x3 - no walls.dmi'
	dir = WEST

	wall_type = null // Don't make walls
	createInnerDoors = 1

	turbolift_stops = list(
		/area/turbolift/ElevatorOne/underground,
		/area/turbolift/ElevatorOne/midlevelOne,
		/area/turbolift/ElevatorOne/midlevelTwo,
		/area/turbolift/ElevatorOne/midlevelThree,
		/area/turbolift/ElevatorOne/surface,
		)


/area/turbolift/ElevatorOne/underground
	name = "Nadezhda Underground"
	lift_floor_label = "Nadezhda Underground"
	lift_floor_name = "Floor Two"
	lift_announce_str = "Transition complete.  Welcome to the Nadezhda Underground."
	base_turf = /turf/simulated/floor/plating

/area/turbolift/ElevatorOne/midlevelOne
	name = "Transition One"
	lift_announce_str = "Transition complete.  Welcome to Base Level 1."
	base_turf = /turf/simulated/floor/plating

/area/turbolift/ElevatorOne/midlevelTwo
	name = "Transition Two"
	lift_announce_str = "Transition complete.  Welcome to Base Level 2."
	base_turf = /turf/simulated/floor/plating

/area/turbolift/ElevatorOne/midlevelThree
	name = "Transition Three"
	lift_announce_str = "Transition complete.  Welcome to Base Level 3."
	base_turf = /turf/simulated/floor/plating

/area/turbolift/ElevatorOne/surface
	name = "Nadezhda Surface"
	lift_floor_label = "Nadezhda Surface"
	lift_floor_name = "Floor One"
	lift_announce_str = "Transition complete.  Welcome to the Surface."
	base_turf = /turf/simulated/floor/plating




/datum/turbolift
	music = list('sound/music/elevatormusic.ogg')  // Woo elevator music!
