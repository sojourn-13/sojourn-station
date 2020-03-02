/obj/turbolift_map_obj
	var/elevatorID = "Default"


/obj/turbolift_map_obj/turbolift_stop
	name = "Turbolift map stop"
	icon = 'icons/modules/turbolift/turbolift_preview_3x3.dmi'







// Map object.
/obj/turbolift_map_obj/turbolift_map_base
	name = "turbolift map placeholder"
	icon = 'icons/modules/turbolift/turbolift_preview_3x3.dmi'
	dir = SOUTH                 // Direction of the holder determines the placement of the lift control panel and doors.
	var/depth = 1               // Number of stops to generate, including the initial floor.
	var/lift_size_x = 2         // Number of turfs on each axis to generate in addition to the first
	var/lift_size_y = 2         // ie. a 3x3 lift would have a value of 2 in each of these variables.
	var/createInnerDoors = 0    // If we create inner doors or not

	// Various turf and door turftypes used when generating the turbolift stops.
	var/wall_type =  /turf/simulated/wall
	var/floor_type = /turf/simulated/shuttle/floor/mining
	var/door_type =  /obj/machinery/door/airlock/lift

	var/list/turbolift_stops = list()



    // Ghetto memory passing.  Sue me.
	var/tmp/elevatorBaseX
	var/tmp/elevatorBaseY
	var/tmp/elevatorBaseZ
	var/tmp/elevatorBaseDir

	var/tmp/elevatorSizeX
	var/tmp/elevatorSizeY

	var/tmp/make_walls
	var/tmp/int_panel_x
	var/tmp/int_panel_y

	var/tmp/door_x1
	var/tmp/door_y1
	var/tmp/door_x2
	var/tmp/door_y2
	var/tmp/light_x1
	var/tmp/light_x2
	var/tmp/light_y1
	var/tmp/light_y2




/obj/turbolift_map_obj/turbolift_map_base/proc/computeDirections(var/turf/stop)

	switch(dir)

		if(NORTH)

			int_panel_x = elevatorBaseX + FLOOR(lift_size_x/2, 1)
			int_panel_y = elevatorBaseY + (make_walls ? 1 : 0)

			door_x1 = elevatorBaseX + 1
			door_y1 = elevatorSizeY + (make_walls ? 0 : 1)
			door_x2 = elevatorSizeX - 1
			door_y2 = elevatorSizeY + 1

			light_x1 = elevatorBaseX + (make_walls ? 1 : 0)
			light_y1 = elevatorBaseY + (make_walls ? 1 : 0)
			light_x2 = elevatorBaseX + lift_size_x - (make_walls ? 1 : 0)
			light_y2 = elevatorBaseY + (make_walls ? 1 : 0)

		if(SOUTH)

			int_panel_x = elevatorBaseX + FLOOR(lift_size_x/2, 1)
			int_panel_y = elevatorSizeY - (make_walls ? 1 : 0)

			door_x1 = elevatorBaseX + 1
			door_y1 = elevatorBaseY - 1
			door_x2 = elevatorSizeX - 1
			door_y2 = elevatorBaseY - (make_walls ? 0 : 1)

			light_x1 = elevatorBaseX + (make_walls ? 1 : 0)
			light_y1 = elevatorBaseY + (make_walls ? 2 : 1)
			light_x2 = elevatorBaseX + lift_size_x - (make_walls ? 1 : 0)
			light_y2 = elevatorBaseY + lift_size_y - (make_walls ? 1 : 0)

		if(EAST)

			int_panel_x = elevatorBaseX + (make_walls ? 1 : 0)
			int_panel_y = elevatorBaseY + FLOOR(lift_size_y/2, 1)

			door_x1 = elevatorSizeX + (make_walls ? 0 : 1)
			door_y1 = elevatorBaseY + 1
			door_x2 = elevatorSizeX + 1
			door_y2 = elevatorSizeY - 1

			light_x1 = elevatorBaseX + (make_walls ? 1 : 0)
			light_y1 = elevatorBaseY + (make_walls ? 1 : 0)
			light_x2 = elevatorBaseX + (make_walls ? 1 : 0)
			light_y2 = elevatorBaseY + lift_size_x - (make_walls ? 1 : 0)

		if(WEST)

			int_panel_x = elevatorSizeX - (make_walls ? 1 : 0)
			int_panel_y = elevatorBaseY + FLOOR(lift_size_y/2, 1)

			door_x1 = stop.x - 1
			door_x2 = stop.x - (createInnerDoors ? 0 : 1)

			door_y1 = stop.y + 0
			door_y2 = stop.y + lift_size_y - 1



			light_x1 = stop.x + lift_size_x - (make_walls ? 1 : 0)
			light_x2 = stop.x + lift_size_x - (make_walls ? 1 : 0)

			light_y1 = stop.y + (make_walls ? 1 : 0)
			light_y2 = stop.y + lift_size_y-1 - (make_walls ? 1 : 0)



/obj/turbolift_map_obj/turbolift_map_base/Destroy()
	turbolifts -= src
	return ..()

/obj/turbolift_map_obj/turbolift_map_base/New()
	turbolifts += src
	..()

/obj/turbolift_map_obj/turbolift_map_base/Initialize()
	. = ..()
	// Create our system controller.
	var/datum/turbolift/lift = new()

	// Holder values since we're moving this object to null ASAP.
	elevatorBaseX   = x
	elevatorBaseY   = y
	elevatorBaseZ   = z
	elevatorBaseDir = dir
	elevatorSizeX 	= (elevatorBaseX+lift_size_x)
	elevatorSizeY 	= (elevatorBaseY+lift_size_y)
	forceMove(null)

	// These modifiers are used in relation to the origin
	// to place the system control panels and doors.
	make_walls = isnull(wall_type) ? FALSE : TRUE





	// Generate each floor and store it in the controller datum.

	var/level = 1

	for(var/stopAreaAsPseudoInstance in turbolift_stops)
		var/area/turbolift/stopArea = locate(stopAreaAsPseudoInstance) in world



		var/turf/stop = locate() in stopArea

		if(!stop)
			CRASH("Failed to find turf in area [stopArea.name].")

		computeDirections(stop)

		var/datum/turbolift_stop/cfloor = new()
		lift.stops += cfloor

		var/levelFloorType = floor_type
		if(level > 1)
			levelFloorType = stopArea.base_turf

		var/list/floor_turfs = list()
		// Update the appropriate turfs.
		for(var/turfX = stop.x to (stop.x + lift_size_x) )

			for(var/turfY = stop.y to (stop.y + lift_size_y-1) )

				var/turf/checking = locate(turfX,turfY,stop.z)

				if(!istype(checking))
					log_debug("[name] cannot find a component turf at [turfX],[turfY] on floor [stop.z]. Aborting.")
					qdel(src)
					return

				// Update path appropriately if needed.
				var/swap_to = /turf/simulated/open                                                                    // Elevator.
				if(wall_type && (turfX == elevatorBaseX || turfY == elevatorBaseY || turfX == elevatorSizeX || turfY == elevatorSizeY) && !(turfX >= door_x1 && turfX <= door_x2 && turfY >= door_y1 && turfY <= door_y2))
					swap_to = wall_type
				else
					swap_to = levelFloorType

				if(checking.type != swap_to)
					checking.ChangeTurf(swap_to)
					// Let's make absolutely sure that we have the right turf.
					checking = locate(turfX,turfY,stop.z)

				// Clear out contents.
				for(var/atom/movable/thing in checking.contents)
					if(thing.simulated)
						qdel(thing)

				if(turfX >= elevatorBaseX && turfX <= elevatorSizeX && turfY >= elevatorBaseY && turfY <= elevatorSizeY)
					floor_turfs += checking

		if(stopArea.lift_floor_label)
			// Place all doors.
			for(var/turfX = door_x1 to door_x2)
				for(var/turfY = door_y1 to door_y2)
					var/turf/checking = locate(turfX,turfY,stop.z)
					var/internal = 1
					if(!(checking in floor_turfs))
						internal = 0
						/*if(checking.type != levelFloorType)
							checking.ChangeTurf(levelFloorType)
							checking = locate(turfX,turfY,stop.z)
						for(var/atom/movable/thing in checking.contents)
							if(thing.simulated)
								qdel(thing)*/

				//	if(checking.type == levelFloorType) // Don't build over empty space on lower levels.
					var/obj/machinery/door/airlock/lift/newdoor = new door_type(checking)
					if(internal)
						lift.doors += newdoor
						newdoor.lift = cfloor
					else
						cfloor.doors += newdoor
						newdoor.floor = cfloor
				//	else
				//		log_debug("checking.type != floor_type,  [checking.x],[checking.y],[checking.z]")

			// Place exterior control panel.
			var/turf/placing = locate(stop.x-2, stop.y-1, stop.z)

			var/obj/structure/lift/button/panel_ext = new(placing, lift)
			panel_ext.floor = cfloor
			panel_ext.set_dir(elevatorBaseDir)
			cfloor.ext_panel = panel_ext


	        // Place lights
			if(level == 1)
				var/turf/placing1 = locate(light_x1, light_y1, stop.z)
				var/turf/placing2 = locate(light_x2, light_y2, stop.z)
				var/obj/machinery/light/light1 = new(placing1, light)
				var/obj/machinery/light/light2 = new(placing2, light)
				if(elevatorBaseDir == NORTH || elevatorBaseDir == SOUTH)
					light1.set_dir(WEST)
					light2.set_dir(EAST)
				else
					light1.set_dir(SOUTH)
					light2.set_dir(NORTH)



		var/area_path = turbolift_stops[level]
		for(var/thing in floor_turfs)
			new area_path(thing)
		var/area/A = locate(area_path)
		cfloor.set_area_ref("\ref[A]")
		level++

		if(level > 1)
			createInnerDoors = 0



	// Place lift panel.
	var/turf/T = locate(int_panel_x, int_panel_y, elevatorBaseZ)
	lift.control_panel_interior = new(T, lift)
	lift.control_panel_interior.set_dir(elevatorBaseDir)
	lift.current_stop = lift.stops[1]

	lift.open_doors()

	qdel(src) // We're done.
