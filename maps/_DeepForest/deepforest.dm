#include "map/_Deep_Forest.dmm"
#include "map/_Beast_Cave.dmm"
#include "map/_Greyson_Field_Office.dmm"
#include "map/_Prepper_Bunker.dmm"
#include "map/_River_Forest.dmm"
#include "map/_River_To_Swamp.dmm"

/obj/map_data/nadezda_f
	name = "Deep Forest"
	is_player_level = TRUE
	is_contact_level = FALSE
	is_accessable_level = FALSE
	is_sealed = TRUE
	height = 2
	digsites = "TECHNICAL"

/obj/map_data/beast_cave
	name = "Beast Cave"
	is_player_level = TRUE
	is_contact_level = FALSE
	is_accessable_level = FALSE
	is_sealed = TRUE
	height = 1
	digsites = "TEMPLE"

/obj/map_data/greyson_field_offices
	name = "Greyson Field Offices"
	is_player_level = TRUE
	is_contact_level = FALSE
	is_accessable_level = FALSE
	is_sealed = TRUE
	height = 3

/obj/map_data/the_vault
	name = "Bunker Vault"
	is_player_level = TRUE
	is_contact_level = FALSE
	is_accessable_level = FALSE
	is_sealed = TRUE
	height = 1

/obj/map_data/river_forest
	name = "River Forest"
	is_player_level = TRUE
	is_contact_level = FALSE
	is_accessable_level = FALSE
	is_sealed = TRUE
	height = 2
	digsites = "Fossil"

/obj/map_data/river_to_colony
	name = "Scrap Haven"
	is_station_level = FALSE
	is_player_level = TRUE
	is_contact_level = FALSE
	is_accessable_level = FALSE
	is_sealed = TRUE
	height = 5
	generate_asteroid = TRUE
	digsites = "WAR"
