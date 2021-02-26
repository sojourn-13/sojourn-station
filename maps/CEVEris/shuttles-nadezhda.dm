//Shuttle landmark code
/datum/shuttle/autodock/multi/surface_transport
	name = "Surface Transport Shuttle"
	move_time = 2 MINUTES
	shuttle_area = /area/shuttle/surface_transport_lz
	current_location = "nav_pad_surface_transport"
	landmark_transition = "nav_transit_surface_transport"
	destination_tags = list("nav_pad_surface_transport", "nav_hunting_lodge", "nav_deep_forest")

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

//Area code
/area/shuttle/surface_transport_lz
	name = "Surface Transit Landing Pad"
	icon_state = "shuttle"
	requires_power = FALSE
	dynamic_lighting = FALSE

/obj/machinery/computer/shuttle_control/multi/surface_transport
	name = "surface transport shuttle console"
	shuttle_tag = "Surface Transport Shuttle"
	req_one_access = list(access_security, access_heads)
	//circuit = /obj/item/weapon/electronics/circuitboard/shuttle/mining