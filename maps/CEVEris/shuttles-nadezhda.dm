//Colony Shuttle Pod
//Shuttle landmark code
/datum/shuttle/autodock/multi/surface_transport
	name = "Surface Transport Shuttle"
	move_time = (2 MINUTES) / (1 SECOND)
	shuttle_area = /area/shuttle/surface_transport_lz
	current_location = "nav_pad_surface_transport"
	landmark_transition = "nav_transit_surface_transport"
	destination_tags = list("nav_pad_surface_transport", "nav_hunting_lodge", "nav_deep_forest", "nav_swamps", "nav_river_forest")

/obj/effect/shuttle_landmark/surface_transport
	name = "Surface Transport Shuttle Pad"
	landmark_tag = "nav_pad_surface_transport"
	base_turf = /turf/simulated/floor/tiled/dark/cargo
	base_area = /area/nadezhda/security/maingate

/obj/effect/shuttle_landmark/transit/surface_transport
	name = "In transit"
	landmark_tag = "nav_transit_surface_transport"
	base_turf = /turf/space
	autoset = TRUE

/obj/effect/shuttle_landmark/hunting_lodge
	name = "Hunting Lodge Landing Zone"
	landmark_tag = "nav_hunting_lodge"
	base_turf = /turf/simulated/floor/asteroid/dirt
	autoset = TRUE

/obj/effect/shuttle_landmark/deep_forest
	name = "Deep Forest Landing Zone"
	landmark_tag = "nav_deep_forest"
	base_turf = /turf/simulated/floor/asteroid/dirt
	autoset = TRUE

/obj/effect/shuttle_landmark/swamp_caves
	name = "Swamps Landing Zone"
	landmark_tag = "nav_swamps"
	base_turf = /turf/simulated/floor/asteroid/dirt
	autoset = TRUE

/obj/effect/shuttle_landmark/river_forest
	name = "River Forest Landing Zone"
	landmark_tag = "nav_river_forest"
	base_turf = /turf/simulated/floor/asteroid/dirt
	autoset = TRUE

//Area code
/area/shuttle/surface_transport_lz
	name = "Surface Transit Landing Pad"
	icon_state = "shuttle"
	requires_power = FALSE
	dynamic_lighting = FALSE
	base_turf = /turf/simulated/floor/plating/under

//Consoles
/obj/machinery/computer/shuttle_control/multi/surface_transport
	name = "surface transport shuttle console"
	shuttle_tag = "Surface Transport Shuttle"
	req_one_access = list(access_security, access_heads)
	//circuit = /obj/item/weapon/electronics/circuitboard/shuttle/mining

//Skipjack Code
/datum/shuttle/autodock/multi/skipjack
	name = "Skipjack"
	move_time = (1 MINUTES) / (1 SECOND)
	shuttle_area = /area/shuttle/skipjack_area
	current_location = "nav_skipjack_homebase"
	landmark_transition = "nav_skipjack_transit"
	destination_tags = list("nav_skipjack_homebase", "nav_skipjack_colony", "nav_skipjack_forest", "nav_skipjack_river")

/obj/effect/shuttle_landmark/skipjack_home
	name = "Skipjack Homebase"
	landmark_tag = "nav_skipjack_homebase"
	base_turf = /turf/space
	base_area = /area/skipjack_station

/obj/effect/shuttle_landmark/transit/skipjack_transit
	name = "In transit"
	landmark_tag = "nav_skipjack_transit"
	base_turf = /turf/space
	autoset = TRUE

/obj/effect/shuttle_landmark/skipjack_colony
	name = "Nadezhda Landing Zone"
	landmark_tag = "nav_skipjack_colony"
	base_turf = /turf/simulated/floor/asteroid/dirt
	autoset = TRUE

/obj/effect/shuttle_landmark/skipjack_deepforest
	name = "Deep Forest Landing Zone"
	landmark_tag = "nav_skipjack_forest"
	base_turf = /turf/simulated/floor/asteroid/dirt
	autoset = TRUE

/obj/effect/shuttle_landmark/skipjack_riverforest
	name = "River Forest Landing Zone"
	landmark_tag = "nav_skipjack_river"
	base_turf = /turf/simulated/floor/asteroid/dirt
	autoset = TRUE

//skipjack console
/obj/machinery/computer/shuttle_control/multi/skipjack
	name = "skipjack shuttle console"
	shuttle_tag = "Skipjack"
	req_one_access = null

//Area code
/area/shuttle/skipjack_area
	name = "Skipjack Landing Pad"
	icon_state = "shuttle"
	requires_power = FALSE
	dynamic_lighting = TRUE
	base_turf = /turf/space