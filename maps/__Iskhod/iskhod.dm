#include "area/_Iskhod_areas.dm"
#include "data/_Iskhod_factions.dm"
#include "data/_Iskhod_Turbolifts.dm"
#include "data/shuttles-iskhod.dm"
#include "data/overmap-eris.dm"
#include "data/shuttles-eris.dm"
#include "data/reports.dm"

#include "map/_Iskhod_Colony.dmm"

/obj/map_data/eris
	name = "Eris"
	is_sealed = TRUE
	height = 1

/obj/map_data/iskhod //Omnie level has all three surface underground and stairs
	name = "Iskhod Map"
	is_station_level = TRUE
	is_player_level = TRUE
	is_contact_level = TRUE
	is_accessable_level = FALSE
	is_sealed = TRUE
	generate_asteroid = TRUE
	height = 3
	digsites = "HOUSE"

/obj/map_data/admin
	name = "Admin Level"
	is_admin_level = TRUE
	is_accessable_level = FALSE
	height = 1

/obj/map_data/hunting_lodge
	name = "Hunting Lodge"
	is_station_level = FALSE
	is_player_level = TRUE
	is_contact_level = FALSE
	is_accessable_level = FALSE
	is_sealed = TRUE
	height = 2


