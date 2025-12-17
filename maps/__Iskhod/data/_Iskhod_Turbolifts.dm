/obj/turbolift_map_obj/turbolift_map_base/Nadezhda/ElevOne
	name = "Turbolift"
	lift_size_x = 3 // Size of the actual lift, shaft walls are extra.
	lift_size_y = 3
	icon = 'icons/modules/turbolift/turbolift_preview_3x3 - no walls.dmi'
	dir = WEST

	wall_type = null // Don't make walls
	createInnerDoors = 1

	turbolift_stops = list(
		//area/turbolift/ElevatorOne/underground,
		//area/turbolift/ElevatorOne/midlevelThree,
		/area/turbolift/ElevatorOne/midlevelTwo,
		/area/turbolift/ElevatorOne/midlevelOne,
		/area/turbolift/ElevatorOne/surface,
		)


/obj/turbolift_map_obj/turbolift_map_base/Nadezhda/ElevTwo
	name = "Turbolift"
	lift_size_x = 3 // Size of the actual lift, shaft walls are extra.
	lift_size_y = 3
	icon = 'icons/modules/turbolift/turbolift_preview_3x3 - no walls.dmi'
	dir = WEST

	wall_type = null // Don't make walls
	createInnerDoors = 1

	turbolift_stops = list(
		//area/turbolift/ElevatorTwo/underground,
		//area/turbolift/ElevatorTwo/midlevelThree,
		/area/turbolift/ElevatorTwo/midlevelTwo,
		/area/turbolift/ElevatorTwo/midlevelOne,
		//area/turbolift/ElevatorTwo/surface,
		)


//MINING ELEVATOR
/obj/turbolift_map_obj/turbolift_map_base/Nadezhda/Mining
	name = "Turbolift"
	lift_size_x = 3 // Size of the actual lift, shaft walls are extra.
	lift_size_y = 3
	icon = 'icons/modules/turbolift/turbolift_preview_3x3 - no walls.dmi'
	dir = WEST

	wall_type = null // Don't make walls
	createInnerDoors = 1

	turbolift_stops = list(
		/area/turbolift/Mining/underground,
		//area/turbolift/Mining/midlevelOne,
		/area/turbolift/Mining/midlevelTwo,
		//area/turbolift/Mining/midlevelThree,
		/area/turbolift/Mining/colony,
		)


/area/turbolift/Mining/underground
	name = "Frontier Logistics - Mining Sublevel"
	lift_floor_label = "Mining Sublevel"
	lift_floor_name = "Mining"
	lift_announce_str = "Transition complete. Welcome to Mining.  Please stay safe!"
	base_turf = /turf/simulated/shuttle/floor/mining

/area/turbolift/Mining/midlevelOne
	name = "Transition One"
	lift_announce_str = "Transition complete. Welcome to Base Level 1."
	base_turf = /turf/simulated/shuttle/floor/mining

/area/turbolift/Mining/midlevelTwo
	name = "Transition Two"
	lift_announce_str = "Transition complete. Welcome to Base Level 2."
	base_turf = /turf/simulated/shuttle/floor/mining

/area/turbolift/Mining/midlevelThree
	name = "Transition Three"
	lift_announce_str = "Transition complete. Welcome to Base Level 3."
	base_turf = /turf/simulated/shuttle/floor/mining

/area/turbolift/Mining/colony
	name = "Frontier Logistics - Colony"
	lift_floor_label = "Main Colony"
	lift_floor_name = "Colony"
	lift_announce_str = "Transition complete. Welcome to the Iskhod Outpost Colony."
	base_turf = /turf/simulated/shuttle/floor/mining


//PROSPECTOR ELEVATOR
/obj/turbolift_map_obj/turbolift_map_base/Nadezhda/prospector
	name = "Turbolift"
	lift_size_x = 3 // Size of the actual lift, shaft walls are extra.
	lift_size_y = 3
	icon = 'icons/modules/turbolift/turbolift_preview_3x3 - no walls.dmi'
	dir = WEST

	wall_type = null // Don't make walls
	createInnerDoors = 1

	turbolift_stops = list(
		/area/turbolift/prospector/underground,
		//area/turbolift/prospector/surlevelOne,
		/area/turbolift/prospector/surlevelTwo,
		//area/turbolift/prospector/surlevelThree,
		/area/turbolift/prospector/surface,
		)

/area/turbolift/prospector/surlevelOne
	name = "Transition One"
	lift_announce_str = "Transition complete. Welcome to Base Level 1."
	base_turf = /turf/simulated/shuttle/floor/mining

/area/turbolift/prospector/surlevelTwo
	name = "Transition Two"
	lift_announce_str = "Transition complete. Welcome to Base Level 2."
	base_turf = /turf/simulated/shuttle/floor/mining

/area/turbolift/prospector/surlevelThree
	name = "Transition Three"
	lift_announce_str = "Transition complete. Welcome to Base Level 3."
	base_turf = /turf/simulated/shuttle/floor/mining

/area/turbolift/prospector/underground
	name = "Frontier Logistics Underground Access"
	lift_floor_label = "Frontier Logistics Underground Access"
	lift_floor_name = "Prospector Prep"
	lift_announce_str = "Transition complete. Welcome to the Iskhod Underground. Be mindful of all longarm firearm regulations."
	base_turf = /turf/simulated/shuttle/floor/mining

/area/turbolift/prospector/surface
	name = "Frontier Logistics Surface Access"
	lift_floor_label = "Frontier Logistics Surface Access"
	lift_floor_name = "Surface"
	lift_announce_str = "Transition complete. Welcome to the Iskhod Surface. Be mindful of all longarm firearm regulations."
	base_turf = /turf/simulated/shuttle/floor/mining

//SOLARS ELEVATOR
/obj/turbolift_map_obj/turbolift_map_base/Nadezhda/mountaintop
	name = "Turbolift"
	lift_size_x = 3 // Size of the actual lift, shaft walls are extra.
	lift_size_y = 3
	icon = 'icons/modules/turbolift/turbolift_preview_3x3 - no walls.dmi'
	dir = WEST

	wall_type = null // Don't make walls
	createInnerDoors = 1

	turbolift_stops = list(
		/area/turbolift/mountain/colony,
		//area/turbolift/mountain/transition1,
		/area/turbolift/mountain/transition2,
		//area/turbolift/mountain/transition3,
		/area/turbolift/mountain/solars,
		)

/area/turbolift/mountain/transition1
	name = "Transition One"
	lift_announce_str = "Transition complete. Welcome to Base Level 1."
	base_turf = /turf/simulated/shuttle/floor/mining

/area/turbolift/mountain/transition2
	name = "Transition Two"
	lift_announce_str = "Transition complete. Welcome to Base Level 2."
	base_turf = /turf/simulated/shuttle/floor/mining

/area/turbolift/mountain/transition3
	name = "Transition Three"
	lift_announce_str = "Transition complete. Welcome to Base Level 3."
	base_turf = /turf/simulated/shuttle/floor/mining

/area/turbolift/mountain/colony
	name = "Guild Solars - Colony"
	lift_floor_label = "Iskhod Colony"
	lift_floor_name = "Engine Room"
	lift_announce_str = "Transition complete. Welcome to the Iskhod Colony Underground."
	base_turf = /turf/simulated/shuttle/floor/mining

/area/turbolift/mountain/solars
	name = "Guild Solars - Mountain Top"
	lift_floor_label = "Iskhod Mountain Top"
	lift_floor_name = "Solars"
	lift_announce_str = "Transition complete. Welcome to the mountain top. Please stay safe!"
	base_turf = /turf/simulated/shuttle/floor/mining

//RESEARCH ELEVATOR
/obj/turbolift_map_obj/turbolift_map_base/Nadezhda/Research
	name = "Turbolift"
	lift_size_x = 3 // Size of the actual lift, shaft walls are extra.
	lift_size_y = 3
	icon = 'icons/modules/turbolift/turbolift_preview_3x3 - no walls.dmi'
	dir = WEST

	wall_type = null // Don't make walls
	createInnerDoors = 1

	turbolift_stops = list(
		/area/turbolift/Research/underground,
		//area/turbolift/Research/midlevelOne,
		/area/turbolift/Research/midlevelTwo,
		//area/turbolift/Research/midlevelThree,
		/area/turbolift/Research/colony,
		)

/area/turbolift/Research/midlevelOne
	name = "Transition One"
	lift_announce_str = "Transition complete. Welcome to Base Level 1."
	base_turf = /turf/simulated/shuttle/floor/mining

/area/turbolift/Research/midlevelTwo
	name = "Transition Two"
	lift_announce_str = "Transition complete. Welcome to Base Level 2."
	base_turf = /turf/simulated/shuttle/floor/mining

/area/turbolift/Research/midlevelThree
	name = "Transition Three"
	lift_announce_str = "Transition complete. Welcome to Base Level 3."
	base_turf = /turf/simulated/shuttle/floor/mining

/area/turbolift/Research/colony
	name = "Iskhod Research - Colony"
	lift_floor_label = "Iskhod Colony"
	lift_floor_name = "Research Colony"
	lift_announce_str = "Transition complete."
	base_turf = /turf/simulated/shuttle/floor/mining

/area/turbolift/Research/underground
	name = "Iskhod Research - Underground"
	lift_floor_label = "Iskhod Research"
	lift_floor_name = "Research Underground"
	lift_announce_str = "Transition complete"
	base_turf = /turf/simulated/shuttle/floor/mining






//colony
/area/turbolift/ElevatorOne/underground
	name = "Iskhod Underground"
	lift_floor_label = "Iskhod Underground"
	lift_floor_name = "Floor Two"
	lift_announce_str = "Transition complete. Welcome to the Iskhod Underground."
	base_turf = /turf/simulated/shuttle/floor/mining

/area/turbolift/ElevatorOne/midlevelOne
	name = "Colony Level One"
	lift_floor_label = "Floor One"
	lift_floor_name = "Colony Level One"
	lift_announce_str = "Transition complete. Welcome to Base Level 1."
	base_turf = /turf/simulated/shuttle/floor/mining

/area/turbolift/ElevatorOne/midlevelTwo
	name = "Colony Level Two"
	lift_floor_label = "Floor Two"
	lift_floor_name = "Colony Level Two"
	lift_announce_str = "Transition complete. Welcome to Base Level 2."
	base_turf = /turf/simulated/shuttle/floor/mining

/area/turbolift/ElevatorOne/midlevelThree
	name = "Colony Level Three"
	lift_floor_label = "Floor Three"
	lift_floor_name = "Colony Level Three"
	lift_announce_str = "Transition complete. Welcome to Base Level 3."
	base_turf = /turf/simulated/shuttle/floor/mining

/area/turbolift/ElevatorOne/surface
	name = "Colony Surface"
	lift_floor_label = "Surface"
	lift_floor_name = "Colony Surface"
	lift_announce_str = "Transition complete. Welcome to the Surface."
	base_turf = /turf/simulated/shuttle/floor/mining




/area/turbolift/ElevatorTwo/underground
	name = "Iskhod Underground"
	lift_floor_label = "Iskhod Underground"
	lift_floor_name = "Floor Two"
	lift_announce_str = "Transition complete. Welcome to the Iskhod Underground."
	base_turf = /turf/simulated/shuttle/floor/mining

/area/turbolift/ElevatorTwo/midlevelOne
	name = "Colony Level One"
	lift_floor_label = "Floor One"
	lift_floor_name = "Colony Level One"
	lift_announce_str = "Transition complete. Welcome to Base Level 1."
	base_turf = /turf/simulated/shuttle/floor/mining

/area/turbolift/ElevatorTwo/midlevelTwo
	name = "Colony Level Two"
	lift_floor_label = "Floor Two"
	lift_floor_name = "Colony Level Two"
	lift_announce_str = "Transition complete. Welcome to Base Level 2."
	base_turf = /turf/simulated/shuttle/floor/mining

/area/turbolift/ElevatorTwo/midlevelThree
	name = "Colony Level Three"
	lift_floor_label = "Floor Three"
	lift_floor_name = "Colony Level Three"
	lift_announce_str = "Transition complete. Welcome to Base Level 3."
	base_turf = /turf/simulated/shuttle/floor/mining

/area/turbolift/ElevatorTwo/surface
	name = "Colony Surface"
	lift_floor_label = "Surface"
	lift_floor_name = "Colony Surface"
	lift_announce_str = "Transition complete. Welcome to the Surface."
	base_turf = /turf/simulated/shuttle/floor/mining



/datum/turbolift
	music = list('sound/music/elevatormusic.ogg')  // Woo elevator music!
