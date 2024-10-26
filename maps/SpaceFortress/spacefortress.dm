//#include "map/spacefortress.dmm"
//#include "map/blackstone_temple.dmm"
//#include "map/space_dungeons.dmm"
//#include "map/space_ambush.dmm"

/obj/map_data/spacefortress
	name = "Excelsior Fortress"
	is_player_level = TRUE
	is_contact_level = FALSE
	is_accessable_level = TRUE
	height = 1

/obj/map_data/blackstone_temple
	name = "Blackstone Temple"
	is_player_level = TRUE
	is_contact_level = FALSE
	is_accessable_level = TRUE
	height = 2

/obj/map_data/space_dungeons
	name = "Space Dungeons"
	is_player_level = TRUE
	is_contact_level = FALSE
	is_accessable_level = TRUE
	height = 1

//MINING-1 // CLUSTER
/obj/effect/overmap/sector/fortress
	name = "excelsior fortress"
	desc = "An excelsior fortress, the key to the excelsiors power in this sector."
	icon_state = "sector"
	generic_waypoints = list(
		"nav_fortress_1",
		"nav_fortress_2"
	)
	known = 1

/obj/effect/shuttle_landmark/fortress/nav1
	name = "Excelsior Fortress Navpoint #1"
	icon_state = "shuttle-green"
	landmark_tag = "nav_fortress_1"
	base_turf = /turf/space

/obj/effect/shuttle_landmark/fortress/nav2
	name = "Excelsior Fortress Navpoint #2"
	icon_state = "shuttle-green"
	landmark_tag = "nav_fortress_2"
	base_turf = /turf/space

/obj/map_data/space_trap
	name = "Space Ambush"
	is_player_level = TRUE
	is_contact_level = FALSE
	is_accessable_level = TRUE
	height = 1

/obj/effect/shuttle_landmark/space_trap/nav0
	name = "Space Navpoint #0"
	icon_state = "shuttle-green"
	landmark_tag = "nav_space_0"
	base_turf = /turf/space

/obj/effect/shuttle_landmark/space_trap/nav1
	name = "Space Navpoint #1"
	icon_state = "shuttle-green"
	landmark_tag = "nav_space_1"
	base_turf = /turf/space

/obj/effect/shuttle_landmark/space_trap/nav2
	name = "Space Navpoint #2"
	icon_state = "shuttle-green"
	landmark_tag = "nav_space_2"
	base_turf = /turf/space