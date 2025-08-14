//Colony Shuttle Pod
//Shuttle landmark code
/datum/shuttle/autodock/multi/surface_transport
	name = "Surface Transport Shuttle"
	move_time = (2 MINUTES) / (1 SECOND)
	shuttle_area = /area/shuttle/surface_transport_lz
	current_location = "nav_pad_surface_transport"
	landmark_transition = "nav_transit_surface_transport"
	destination_tags = list("nav_pad_surface_transport", "nav_hunting_lodge", "nav_deep_forest", "nav_swamps", "nav_river_forest", "nav_space_0", "nav_greyson_field")

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

/obj/effect/shuttle_landmark/greyson_field
	name = "Greyson Field Office Landing Zone"
	landmark_tag = "nav_greyson_field"
	base_turf = /turf/simulated/floor/tiled/dark/cargo
	autoset = TRUE

//Area code
/area/shuttle/surface_transport_lz
	name = "Surface Transit Landing Pad"
	icon_state = "shuttle"
	requires_power = FALSE
	dynamic_lighting = FALSE
	base_turf = /turf/simulated/floor/tiled/dark/cargo

//Consoles
/obj/machinery/computer/shuttle_control/multi/surface_transport
	name = "surface transport shuttle console"
	shuttle_tag = "Surface Transport Shuttle"
	req_one_access = list(access_security, access_moebius, access_heads, access_huntmaster)
	//circuit = /obj/item/electronics/circuitboard/shuttle/mining

//Skipjack Code
/datum/shuttle/autodock/multi/skipjack
	name = "Skipjack"
	move_time = (7 MINUTES) / (1 SECOND)
	shuttle_area = /area/shuttle/skipjack_area
	current_location = "nav_skipjack_homebase"
	landmark_transition = "nav_skipjack_transit"
	destination_tags = list("nav_skipjack_homebase", "nav_skipjack_colony", "nav_skipjack_forest", "nav_skipjack_river") // "nav_skipjack_spacefortress" was lost

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
	base_turf = /turf/simulated/floor/asteroid/grass
	autoset = TRUE

/obj/effect/shuttle_landmark/skipjack_space_fortress
	name = "Space Fortress Dock"
	landmark_tag = "nav_skipjack_spacefortress"
	base_turf = /turf/space
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

//Merc shuttle Code
/datum/shuttle/autodock/multi/mercshuttle
	name = "Mercenary Shuttle"
	move_time = (7 MINUTES) / (1 SECOND)
	shuttle_area = /area/shuttle/mercshuttle_area
	current_location = "nav_mercshuttle_homebase"
	landmark_transition = "nav_mercshuttle_transit"
	destination_tags = list("nav_mercshuttle_homebase", "nav_mercshuttle_colony", "nav_mercshuttle_forest", "nav_mercshuttle_river")
	default_docking_controller = "merc_shuttle"

/obj/effect/shuttle_landmark/mercshuttle_home
	name = "Mercenary Shuttle Homebase"
	landmark_tag = "nav_mercshuttle_homebase"
	base_turf = /turf/space
	base_area = /area/centcom/merc_base
	dock_target = "merc_base"

/obj/effect/shuttle_landmark/transit/mercshuttle_transit
	name = "In transit"
	landmark_tag = "nav_mercshuttle_transit"
	base_turf = /turf/space
	autoset = TRUE

/obj/effect/shuttle_landmark/mercshuttle_colony
	name = "Nadezhda Landing Pad"
	landmark_tag = "nav_mercshuttle_colony"
	base_turf = /turf/simulated/floor/tiled/dark/gray_platform
	autoset = TRUE

/obj/effect/shuttle_landmark/mercshuttle_deepforest
	name = "Deep Forest Landing Zone"
	landmark_tag = "nav_mercshuttle_forest"
	base_turf = /turf/simulated/floor/asteroid/dirt
	autoset = TRUE

/obj/effect/shuttle_landmark/mercshuttle_riverforest
	name = "River Forest Landing Zone"
	landmark_tag = "nav_mercshuttle_river"
	base_turf = /turf/simulated/floor/asteroid/grass
	autoset = TRUE

/obj/effect/shuttle_landmark/mercshuttle_space_fortress
	name = "Excelsior Fortress Hanger"
	landmark_tag = "nav_mercshuttle_spacefortress"
	base_turf = /turf/space
	autoset = TRUE

//merc shuttle console
/obj/machinery/computer/shuttle_control/multi/mercshuttle
	name = "mercenary shuttle console"
	shuttle_tag = "Mercenary Shuttle"
	req_one_access = null

//Area code
/area/shuttle/mercshuttle_area
	name = "Mercenary Landing Pad"
	icon_state = "shuttle"
	requires_power = FALSE
	dynamic_lighting = TRUE
	base_turf = /turf/space

//Scav shuttle
/datum/shuttle/autodock/multi/rocinante
	name = "The Rocinante"
	move_time = (7 MINUTES) / (1 SECOND)
	shuttle_area = /area/shuttle/rocinante_shuttle_area
	current_location = "nav_rocinante_homebase"
	landmark_transition = "nav_rocinante_transit"
	destination_tags = list("nav_rocinante_homebase", "nav_rocinante_river", "nav_rocinante_swamp", "nav_rocinante_graysonfield", "nav_space_1")//, "nav_rocinante_spacefort"

/obj/effect/shuttle_landmark/rocinante_home
	name = "The Rocinante Home Pad "
	landmark_tag = "nav_rocinante_homebase"
	base_turf = /turf/simulated/floor/reinforced
	base_area = /area/skipjack_station

/obj/effect/shuttle_landmark/transit/rocinante_transit
	name = "In transit"
	landmark_tag = "nav_rocinante_transit"
	base_turf = /turf/space
	autoset = TRUE

/obj/effect/shuttle_landmark/rocinante_riverforest
	name = "River Forest Landing Zone"
	landmark_tag = "nav_rocinante_river"
	base_turf = /turf/simulated/floor/asteroid/dirt
	autoset = TRUE

/obj/effect/shuttle_landmark/rocinante_swamp
	name = "Swamp Dock"
	landmark_tag = "nav_rocinante_swamp"
	base_turf = /turf/simulated/floor/asteroid/grass
	autoset = TRUE

/obj/effect/shuttle_landmark/rocinante_field_office
	name = "Greyson Field Office Dock"
	landmark_tag = "nav_rocinante_graysonfield"
	base_turf = /turf/simulated/floor/reinforced
	autoset = TRUE

/obj/effect/shuttle_landmark/rocinante_spacefort
	name = "Local Space Station Dock"
	landmark_tag = "nav_rocinante_spacefort"
	base_turf = /turf/simulated/floor/reinforced
	autoset = TRUE

//Rocinante console
/obj/machinery/computer/shuttle_control/multi/rocinante
	name = "The Rocinante shuttle console"
	shuttle_tag = "The Rocinante"
	req_one_access = null

//Area code
/area/shuttle/rocinante_shuttle_area
	name = "The Rocinante Landing Pad"
	icon_state = "shuttle"
	requires_power = FALSE
	dynamic_lighting = FALSE
	base_turf = /turf/simulated/floor/reinforced

//Marshal shuttle
/datum/shuttle/autodock/multi/vasiliy
	name = "The Vasiliy"
	move_time = (3 MINUTES) / (1 SECOND)
	shuttle_area = /area/shuttle/vasiliy_shuttle_area
	current_location = "nav_vasiliy_homebase"
	landmark_transition = "nav_vasiliy_transit"
	destination_tags = list("nav_vasiliy_homebase", "nav_vasiliy_deep_forest", "nav_vasiliy_swamps", "nav_vasiliy_river_forest", "nav_vasiliy_graysonfield", "nav_space_2") //, "nav_vasiliy_spacefort"

//, "nav_vasiliy_spacefort"

/obj/effect/shuttle_landmark/vasiliy_home
	name = "The Vasiliy Home Pad "
	landmark_tag = "nav_vasiliy_homebase"
	base_turf = /turf/simulated/floor/reinforced
	base_area = /area/skipjack_station

/obj/effect/shuttle_landmark/transit/vasiliy_transit
	name = "In transit"
	landmark_tag = "nav_vasiliy_transit"
	base_turf = /turf/space
	autoset = TRUE

/obj/effect/shuttle_landmark/vasiliy_deep_forest
	name = "Deep Forest Landing Zone"
	landmark_tag = "nav_vasiliy_deep_forest"
	base_turf = /turf/simulated/floor/reinforced
	autoset = TRUE

/obj/effect/shuttle_landmark/vasiliy_swamp_caves
	name = "Swamps Landing Zone"
	landmark_tag = "nav_vasiliy_swamps"
	base_turf = /turf/simulated/floor/reinforced
	autoset = TRUE

/obj/effect/shuttle_landmark/vasiliy_river_forest
	name = "River Forest Landing Zone"
	landmark_tag = "nav_vasiliy_river_forest"
	base_turf = /turf/simulated/floor/reinforced
	autoset = TRUE

/obj/effect/shuttle_landmark/vasiliy_field_office
	name = "Greyson Field Office Dock"
	landmark_tag = "nav_vasiliy_graysonfield"
	base_turf = /turf/simulated/floor/reinforced
	autoset = TRUE

/* Pretty sure this isn't even active?
/obj/effect/shuttle_landmark/vasiliy_spacefort
	name = "Local Space Station Dock"
	landmark_tag = "nav_vasiliy_spacefort"
	base_turf = /turf/simulated/floor/reinforced
	autoset = TRUE
*/
//Vasiliy console
/obj/machinery/computer/shuttle_control/multi/vasiliy
	name = "The Vasiliy shuttle console"
	shuttle_tag = "The Vasiliy"
	req_one_access = null

//Area code
/area/shuttle/vasiliy_shuttle_area
	name = "The Vasiliy Landing Pad"
	icon_state = "shuttle"
	requires_power = FALSE
	dynamic_lighting = FALSE
	base_turf = /turf/simulated/floor/reinforced
