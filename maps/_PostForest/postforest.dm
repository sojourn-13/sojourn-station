#include "map/_rocky_caves.dmm"

/obj/map_data/rocky_caves
	name = "Rocky Caves"
	is_player_level = TRUE
	is_contact_level = FALSE
	is_accessable_level = FALSE
	is_sealed = TRUE
	height = 1
	digsites = "TEMPLE" //No reason for this

/area/colony/rocky_caves_light
	ship_area = FALSE
	icon_state = "asteroid"
	area_light_color = COLOR_LIGHTING_DEFAULT_BRIGHT
	dynamic_lighting = FALSE
	base_turf = /turf/simulated/floor/asteroid/dirt

/area/colony/rocky_caves_dark
	ship_area = FALSE
	icon_state = "asteroid"
	area_light_color = COLOR_LIGHTING_DEFAULT_BRIGHT
	dynamic_lighting = TRUE
	base_turf = /turf/simulated/floor/asteroid/dirt
