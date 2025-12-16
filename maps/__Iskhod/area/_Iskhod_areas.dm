
////////////
//Iskhod//
////////////

/area/colony
	base_turf = /turf/simulated/floor/asteroid
	prevent_ship_area = TRUE

/area/colony/exposedsun
	ship_area = FALSE
	icon_state = "asteroid"
	area_light_color = COLOR_LIGHTING_DEFAULT_BRIGHT
	dynamic_lighting = FALSE
	base_turf = /turf/simulated/floor/asteroid/dirt

/area/colony/exposedsun/pastgate
	ship_area = FALSE
	icon_state = "erisblue"
	area_light_color = COLOR_LIGHTING_DEFAULT_BRIGHT
	ambience = list('sound/ambience/ambigen9.ogg', 'sound/ambience/ambigen10.ogg', 'sound/ambience/ambigen11.ogg', 'sound/ambience/ambigen12.ogg')

/area/colony/exposedsun/crashed_shop
	name = "Scrap Haven"
	ship_area = FALSE
	icon_state = "erisblue"
	area_light_color = COLOR_LIGHTING_DEFAULT_BRIGHT
	ambience = list('sound/ambience/ambigen9.ogg', 'sound/ambience/ambigen10.ogg', 'sound/ambience/ambigen11.ogg', 'sound/ambience/ambigen12.ogg')
	dynamic_lighting = TRUE

/area/colony/exposedsun/crashed_shop/bottom_floor
	dynamic_lighting = FALSE
	icon_state = "erisgreen"

/area/colony/exposedsun/crashed_shop/workshop
	icon_state = "erisyellow"

/area/colony/exposedsun/crashed_shop/outsider
	icon_state = "erisyellow"

/area/iskhod
	ship_area = TRUE
	icon_state = "erisyellow"
	base_turf = /turf/simulated/floor/plating/under
	flags = AREA_FLAG_RAD_SHIELDED

//Maintenance

/area/iskhod/maintenance
	is_maintenance = TRUE
	ship_area = TRUE
	flags = AREA_FLAG_RAD_SHIELDED
	sound_env = TUNNEL_ENCLOSED
	turf_initializer = new /datum/turf_initializer/maintenance()
	forced_ambience = list('sound/ambience/maintambience.ogg')
	area_light_color = COLOR_LIGHTING_MAINT_DARK

/area/iskhod/maintenance/guild
	name = "Guild Maintence"

/area/iskhod/maintenance/junk
	name = "Junk Beacon"
	icon_state = "disposal"
	dynamic_lighting = FALSE

/area/iskhod/maintenance/surface_disposal
	name = "Surface Disposal"
	icon_state = "disposal"

/area/iskhod/maintenance/arcade
	name = "Junk Arcade"
	icon_state = "disposal"

/area/iskhod/maintenance/northcave
	name = "Caves"
	icon_state = "erisblue"

/area/iskhod/maintenance/disposal
	name = "Waste Disposal"
	icon_state = "disposal"

/area/iskhod/maintenance/fueltankstorage
	name = "Fueltank Storage"
	icon_state = "erisblue"

/area/iskhod/maintenance/undergroundfloor1north
	name = "Underground Floor 1 North Maintenance"
	icon_state = "erisblue"

/area/iskhod/maintenance/undergroundfloor1west
	name = "Underground Floor 1 West Maintenance"
	icon_state = "erisyellow"

/area/iskhod/maintenance/undergroundfloor1east
	name = "Underground Floor 1 East Maintenance"
	icon_state = "erisgreen"

/area/iskhod/maintenance/undergroundfloor1central
	name = "Underground Floor 1 Central Maintenance"
	icon_state = "erisblue"

/area/iskhod/maintenance/undergroundfloor1oldgarden
	name = "Underground Floor 1 Old Garden"
	icon_state = "erisyellow"

/area/iskhod/maintenance/undergroundfloor1oldconstruction
	name = "Underground Floor 1 Old Construction Site"
	icon_state = "erisgreen"

/area/iskhod/maintenance/undergroundfloor1south
	name = "Underground Floor 1 South Maintenance"
	icon_state = "erisblue"

/area/iskhod/maintenance/undergroundfloor2north
	name = "Underground Floor 2 North Maintenance"
	icon_state = "erisyellow"

/area/iskhod/maintenance/undergroundfloor2west
	name = "Underground Floor 2 West Maintenance"
	icon_state = "erisblue"

/area/iskhod/maintenance/undergroundfloor2east
	name = "Underground Floor 2 East Maintenance"
	icon_state = "erisyellow"

/area/iskhod/maintenance/undergroundfloor2south
	name = "Underground Floor 2 South Maintenance"
	icon_state = "erisgreen"

/area/iskhod/maintenance/surfacenorth
	name = "Surface North Maintenance"
	icon_state = "erisyellow"

/area/iskhod/maintenance/surfaceeast
	name = "Surface East Maintenance"
	icon_state = "erisgreen"

/area/iskhod/maintenance/surfacesec
	name = "Surface Security Maintenance"
	icon_state = "erisblue"

/area/iskhod/maintenance/cavehideout
	name = "Abandoned Cave Shed"
	icon_state = "section2deck2starboard"

/area/iskhod/maintenance/sunkenclub
	name = "Sunken Club"
	icon_state = "section2deck3port"

/area/iskhod/maintenance/constructionarea
	name = "Construction Area"
	icon_state = "section2deck3starboard"

/area/iskhod/maintenance/hideout
	name = "Abandoned Maintenance Shed"
	icon_state = "section2deck3starboard"

//Outside abandoned structures

/area/iskhod/dungeon/outside
	is_maintenance = TRUE
	flags = AREA_FLAG_RAD_SHIELDED
	sound_env = TUNNEL_ENCLOSED
	ship_area = FALSE
	turf_initializer = new /datum/turf_initializer/maintenance()
	ambience = list('sound/ambience/maintambience.ogg')
	area_light_color = COLOR_LIGHTING_MAINT_DARK
	dynamic_lighting = FALSE
	is_dungeon_lootable = TRUE


/area/iskhod/dungeon/outside/trashcave
	name = "Trash Cave"
	icon_state = "nadezhdagreen"
	ambience = list('sound/ambience/ambigen9.ogg', 'sound/ambience/ambigen10.ogg', 'sound/ambience/ambigen11.ogg', 'sound/ambience/ambigen12.ogg')
	dynamic_lighting = TRUE

/area/iskhod/dungeon/outside/abandoned_solars
	name = "Vesalius-Andra Solar Outpost"
	icon_state = "erisgreen"
	forced_ambience = list('sound/ambience/forestamb1.ogg', 'sound/ambience/forestamb2.ogg', 'sound/ambience/forestamb3.ogg', 'sound/ambience/forestamb5.ogg', 'sound/ambience/forestamb6.ogg')

/area/iskhod/dungeon/outside/abandoned_solars/powered
	requires_power = FALSE

/area/iskhod/dungeon/outside/burned_outpost
	name = "Burned Outpost"
	icon_state = "erisgreen"

/area/iskhod/dungeon/outside/hunter_cabin
	name = "Abandoned Hunter Cabin"
	icon_state = "erisgreen"
	dynamic_lighting = TRUE
	requires_power = FALSE

/area/iskhod/dungeon/outside/campground
	name = "Campground"
	icon_state = "erisgreen"
	ambience = list('sound/ambience/ambigen9.ogg', 'sound/ambience/ambigen10.ogg', 'sound/ambience/ambigen11.ogg', 'sound/ambience/ambigen12.ogg')

/area/iskhod/dungeon/outside/farm
	name = "Lost Farm"
	icon_state = "erisgreen"
	ambience = list('sound/ambience/ambigen9.ogg', 'sound/ambience/ambigen10.ogg', 'sound/ambience/ambigen11.ogg', 'sound/ambience/ambigen12.ogg')

/area/iskhod/dungeon/outside/abandoned_outpost
	name = "Lost Outpost"
	icon_state = "erisgreen"

/area/iskhod/dungeon/outside/zoo
	name = "Abandoned Research Lab"
	icon_state = "erisgreen"
	dynamic_lighting = TRUE

/area/iskhod/dungeon/outside/prepper
	name = "Prepper Base"
	icon_state = "erisgreen"
	ambience = list('sound/ambience/ambimo1.ogg', 'sound/ambience/ambimo2.ogg')
	dynamic_lighting = TRUE
	requires_power = 0

/area/iskhod/dungeon/outside/prepper/vault
	name = "Vault Bunker"
	icon_state = "erisblue"
	requires_power = 1

// CFW - Safehouse Rework
/*
/area/iskhod/dungeon/outside/safehouse
	name = "Abandoned Safehouse"
	icon_state = "nadezhdagreen"
	dynamic_lighting = TRUE
	is_dungeon_lootable = FALSE
	ambience = list('sound/ambience/ambigen1.ogg','sound/ambience/ambigen3.ogg','sound/ambience/ambigen4.ogg','sound/ambience/ambigen5.ogg','sound/ambience/ambigen6.ogg','sound/ambience/ambigen7.ogg','sound/ambience/ambigen8.ogg','sound/ambience/ambigen9.ogg','sound/ambience/ambigen10.ogg','sound/ambience/ambigen11.ogg','sound/ambience/ambigen12.ogg','sound/ambience/ambigen14.ogg')
	area_light_color = COLOR_LIGHTING_CREW_SOFT
*/

/area/iskhod/dungeon/outside/safehouse
	name = "Safehouse"
	icon_state = "nadezhdagreen"
	is_maintenance = FALSE
	dynamic_lighting = TRUE
	is_dungeon_lootable = FALSE
	ambience = list('sound/ambience/ambigen1.ogg','sound/ambience/ambigen3.ogg','sound/ambience/ambigen4.ogg','sound/ambience/ambigen5.ogg','sound/ambience/ambigen6.ogg','sound/ambience/ambigen7.ogg','sound/ambience/ambigen8.ogg','sound/ambience/ambigen9.ogg','sound/ambience/ambigen10.ogg','sound/ambience/ambigen11.ogg','sound/ambience/ambigen12.ogg','sound/ambience/ambigen14.ogg')
	area_light_color = COLOR_LIGHTING_CREW_SOFT

/area/iskhod/dungeon/outside/safehouse/substation
	name = "Safehouse Substation"

/area/iskhod/dungeon/outside/safehouse/kitchen
	name = "Safehouse Kitchen"

/area/iskhod/dungeon/outside/safehouse/restroom
	name = "Safehouse Restroom"

/area/iskhod/dungeon/outside/safehouse/operations
	name = "Safehouse Operations"

/area/iskhod/dungeon/outside/safehouse/laboratory
	name = "Safehouse Laboratory"

/area/iskhod/dungeon/outside/safehouse/mechbay
	name = "Safehouse Mech-Bay"

/area/iskhod/dungeon/outside/safehouse/infirmary
	name = "Safehouse Infirmary"

/area/iskhod/dungeon/outside/safehouse/warehouse
	name = "Safehouse Warehouse"

//This is put here because the floors are seperated by power needs, the reason being if not powering 1 floor lags the server to hell and back. -Kaz
/area/iskhod/dungeon/outside/prepper/vault/floor1

/area/iskhod/dungeon/outside/prepper/vault/floor2

/area/iskhod/dungeon/outside/prepper/vault/floor3

/area/iskhod/dungeon/outside/prepper/vault/floor4

/area/iskhod/dungeon/outside/prepper/vault/floor5

/area/iskhod/dungeon/outside/prepper/vault/entryway


/area/iskhod/dungeon/outside/prepper/lima
	name = "Site LIMA-09"
	icon_state = "erisblue"
	narrate = "The remnants of an outpost, once a beacon of a great corporation, it now lies in decay"
	requires_power = TRUE

/area/iskhod/dungeon/outside/prepper/lima/turret_powered_tile
	name = "Site LIMA-09"
	icon_state = "erisred"
	narrate = "The remnants of an outpost, once a beacon of a great corporation, it now lies in decay"
	requires_power = TRUE

/area/iskhod/dungeon/outside/prepper/lima/outside
	name = "Site LIMA-09"
	icon_state = "erisgreen"
	narrate = "The remnants of an outpost, once a beacon of a great corporation, it now lies in decay"
	dynamic_lighting = FALSE

/area/iskhod/dungeon/outside/prepper/delta
	name = "Site DELTA-09"
	icon_state = "erisblue"
	narrate = "The remnants of an outpost, once a beacon of a great corporation, it now lies in decay"
	requires_power = TRUE

/area/iskhod/dungeon/outside/prepper/alpha
	name = "Site Alpha-09"
	icon_state = "erisblue"
	narrate = "The remnants of an outpost, once a beacon of a great corporation, it now lies in decay"
	requires_power = TRUE

/area/iskhod/dungeon/outside/prepper/delta/turret_powered_tile
	name = "Site DELTA-09"
	icon_state = "erisred"
	requires_power = FALSE

/area/iskhod/dungeon/outside/monster_cave
	name = "Monster Cave"
	icon_state = "erisgreen"
	forced_ambience = list('sound/ambience/ambisin1.ogg', 'sound/ambience/ambisin2.ogg', 'sound/ambience/ambisin3.ogg', 'sound/ambience/ambisin4.ogg')
	dynamic_lighting = TRUE

/area/iskhod/dungeon/outside/smuggler_zone
	name = "Smuggler Base"
	icon_state = "erisgreen"
	ambience = list('sound/ambience/ambimo1.ogg', 'sound/ambience/ambimo2.ogg')
	dynamic_lighting = TRUE
	requires_power = 0

/area/iskhod/dungeon/outside/smuggler_zone_u
	name = "Smuggler Base Underground"
	icon_state = "erisgreen"
	dynamic_lighting = TRUE
	requires_power = 0

//Outside natural areas

/area/iskhod/outside
	area_light_color = COLOR_LIGHTING_DEFAULT_BRIGHT
	ambience = list('sound/ambience/ambigen9.ogg', 'sound/ambience/ambigen10.ogg', 'sound/ambience/ambigen11.ogg', 'sound/ambience/ambigen12.ogg')
	dynamic_lighting = FALSE
	flags = null
	is_dungeon_lootable = TRUE
	ship_area = FALSE
	prevent_ship_area = TRUE

/area/iskhod/outside/one_star
	name = "Greyson Positronic Base"
	icon_state = "erisgreen"
	ambience = list('sound/ambience/ambigen13.ogg', 'sound/ambience/ambigen14.ogg', 'sound/ambience/ambimalf.ogg')
	dynamic_lighting = TRUE
	requires_power = FALSE
	flags = AREA_FLAG_RAD_SHIELDED

/area/iskhod/outside/one_star/fo_outside
	name = "Greyson Grounds"
	icon_state = "erisgreen"
	dynamic_lighting = FALSE

/area/iskhod/outside/one_star/fo_internal
	name = "Greyson Field Offices"
	icon_state = "erisblue"

/area/iskhod/outside/dcave
	name = "Tengolo Cave East"
	icon_state = "erisgreen"

/area/iskhod/outside/fnest
	name = "Fennec Nest"
	icon_state = "erisgreen"

/area/iskhod/outside/pond
	name = "Pond"
	icon_state = "erisgreen"
	forced_ambience = list('sound/ambience/forestamb1.ogg', 'sound/ambience/forestamb2.ogg', 'sound/ambience/forestamb3.ogg', 'sound/ambience/forestamb5.ogg', 'sound/ambience/forestamb6.ogg')

/area/iskhod/outside/bcave
	name = "Tengolo Cave West"
	icon_state = "erisgreen"
	dynamic_lighting = TRUE

/area/iskhod/outside/scave
	name = "Spider Cave"
	icon_state = "erisgreen"
	dynamic_lighting = TRUE

/area/iskhod/outside/forest
	name = "Forest"
	icon_state = "forest"
	is_maintenance = TRUE
	sound_env = FOREST
	forced_ambience = list('sound/ambience/forestamb1.ogg', 'sound/ambience/forestamb2.ogg', 'sound/ambience/forestamb3.ogg', 'sound/ambience/forestamb5.ogg', 'sound/ambience/forestamb6.ogg')

/area/iskhod/outside/forest/beast_cave_light
	name = "Swamp Caves"
	icon_state = "forest"

/area/iskhod/outside/forest/beast_cave_dark
	name = "Swamp Caves"
	icon_state = "erisblue"
	dynamic_lighting = TRUE

/area/iskhod/outside/forest/river_forest_nightmare
	name = "Hunting plains dark forest"
	icon_state = "erisblue"
	dynamic_lighting = TRUE

/area/iskhod/outside/forest/swamp_hut
	name = "Swamp Hut"
	icon_state = "erisblue"
	dynamic_lighting = TRUE
	requires_power = FALSE

/area/iskhod/outside/forest/plains_farm
	name = "Desolate Farmstead"
	icon_state = "erisblue"
	requires_power = FALSE

/area/iskhod/outside/forest/river_forest_light
	name = "Hunting Plains"
	icon_state = "forest"

/area/iskhod/outside/forest/river_forest_lake
	name = "Hunting Plains River"
	icon_state = "hammerblue"

/area/iskhod/outside/forest/carp_lair
	name = "Carp Lair"
	icon_state = "hammerblue"

/area/iskhod/outside/forest/river_forest_cabin
	name = "Hunting Plains Cabin"
	icon_state = "erisgreen"
	requires_power = FALSE
	dynamic_lighting = TRUE

/area/iskhod/outside/forest/river_forest_dark
	name = "Hunting Plains Caves"
	icon_state = "erisblue"
	dynamic_lighting = TRUE

/area/iskhod/outside/forest/river_forest_underground
	name = "Hunting plains underground caves"
	icon_state = "erisblue"
	dynamic_lighting = TRUE

/area/iskhod/outside/forest/hunting_lodge
	name = "Hunting Lodge"
	icon_state = "forest"
	is_maintenance = FALSE
	is_dungeon_lootable = FALSE

/area/iskhod/outside/forest/hunting_lodge_dark
	name = "Hunting Lodge"
	icon_state = "erisblue"
	is_maintenance = FALSE
	dynamic_lighting = TRUE
	is_dungeon_lootable = FALSE

/area/iskhod/outside/forest/hunting_lodge_shed_dark
	name = "Lodge Barn"
	icon_state = "erisblue"
	dynamic_lighting = TRUE
	is_dungeon_lootable = FALSE

/area/iskhod/outside/lakeside
	name = "Lakeside"
	icon_state = "erisblue"
	sound_env = MOUNTAINS
	forced_ambience = list('sound/ambience/lakeamb1.ogg', 'sound/ambience/lakeamb2.ogg', 'sound/ambience/lakeamb3.ogg')

/area/iskhod/outside/meadow
	name = "Deep Forest"
	icon_state = "meadow"
	sound_env = MOUNTAINS
	forced_ambience = list('sound/ambience/meadowamb1.ogg', 'sound/ambience/meadowamb2.ogg', 'sound/ambience/meadowamb3.ogg', 'sound/ambience/meadowamb4.ogg')

/area/iskhod/outside/inside_colony
	name = "Colony Meadow"
	icon_state = "meadow"
	sound_env = MOUNTAINS
	forced_ambience = list('sound/ambience/meadowamb1.ogg', 'sound/ambience/meadowamb2.ogg', 'sound/ambience/meadowamb3.ogg', 'sound/ambience/meadowamb4.ogg')

/area/iskhod/outside/inside_colony/east
	name = "Colony Meadow - East"

/area/iskhod/outside/inside_colony/west
	name = "Colony Meadow - West"
/area/iskhod/outside/mountainsolars
	name = "Mountain Solars"
	icon_state = "meadow"
	sound_env = MOUNTAINS
	forced_ambience = list('sound/ambience/meadowamb1.ogg', 'sound/ambience/meadowamb2.ogg', 'sound/ambience/meadowamb3.ogg', 'sound/ambience/meadowamb4.ogg')
	is_dungeon_lootable = FALSE

/area/iskhod/outside/kepler //Off-world location
	name = "barren planet"
	icon_state = "erisblue"
	area_light_color = COLOR_LIGHTING_BLUE_DARK
	forced_ambience = list('sound/ambience/windamb1.ogg')
	dynamic_lighting = TRUE
	sound_env = PSYCHOTIC
	is_dungeon_lootable = TRUE
	ship_area = FALSE

/area/iskhod/outside/kepler/red //Off-world location, meant for areas near and inside huts
	name = "barren planet - indoors"
	area_light_color = COLOR_LIGHTING_RED_DARK
	forced_ambience = list('sound/ambience/windamb2.ogg')
	dynamic_lighting = TRUE
	sound_env = PSYCHOTIC
	is_dungeon_lootable = TRUE
	ship_area = FALSE

// SUBSTATIONS (Subtype of maint, that should let them serve as shielded area during radstorm)

/area/iskhod/maintenance/substation
	name = "Substation"
	icon_state = "substation"
	sound_env = SMALL_ENCLOSED
	forced_ambience = list('sound/ambience/maintambience.ogg')

/area/iskhod/maintenance/substation/engineering
	name = "Engineering Substation"

/area/iskhod/maintenance/substation/medical
	name = "Medial Substation"

/area/iskhod/maintenance/substation/science
	name = "Science Substation"

/area/iskhod/maintenance/substation/sec
	name = "Marshal Substation"

/area/iskhod/maintenance/substation/cargo
	name = "Cargo Substation"

/area/iskhod/maintenance/substation/servist
	name = "Service Substation"

/area/iskhod/maintenance/substation/misc1
	name = "MISC Substation 1"

/area/iskhod/maintenance/substation/misc2
	name = "MISC Substation 2"

/area/iskhod/maintenance/substation/misc3
	name = "MISC Substation 3"

/area/iskhod/maintenance/substation/bridge
	name = "Bridge Substation"

//Hallway

/area/iskhod/hallway
	sound_env = LARGE_ENCLOSED
	icon_state = "erisgreen"
	flags = AREA_FLAG_RAD_SHIELDED

/area/iskhod/hallway/main/f1section1
	name = "Floor One Hallway One"
	icon_state = "hallway1"

/area/iskhod/hallway/main/f1section2
	name = "Floor One Hallway Two"
	icon_state = "hallway2"

/area/iskhod/hallway/main/f1section3
	name = "Floor One Hallway Three"
	icon_state = "hallway3"

/area/iskhod/hallway/main/f1section4
	name = "Floor One Hallway Four"
	icon_state = "hallway4"

/area/iskhod/hallway/side/cavernhallway
	name = "Floor Two Cavern Hallway"
	icon_state = "hallway3side"

/area/iskhod/hallway/side/f2section1
	name = "Floor Two Hallway One"
	icon_state = "hallway3side"

/area/iskhod/hallway/side/f2section2
	name = "Floor Two Hallway Two"
	icon_state = "hallway3side"

/area/iskhod/hallway/side/f2section3
	name = "Floor Two Hallway Three"
	icon_state = "erisayellow"

/area/iskhod/hallway/side/f2section4
	name = "Floor Two Hallway Four"
	icon_state = "erisyellow"

/area/iskhod/hallway/surface/section1
	name = "Surface Hallway One"
	icon_state = "hallway3side"

/area/iskhod/hallway/surface/section2
	name = "Surface Hallway Two"
	icon_state = "hallway3side"

/area/iskhod/hallway/surface/section3
	name = "Surface Hallway Three"
	icon_state = "erisyellow"

/area/iskhod/hallway/surface/section4
	name = "Surface Hallway Four"
	icon_state = "erisyellow"

/area/iskhod/hallway/surface/section5
	name = "Surface Hallway Five"
	icon_state = "erisyellow"

/area/iskhod/hallway/side/morguehallway
	name = "Morgue Hallway"

/area/iskhod/hallway/side/atmosphericshallway
	name = "Atmospherics Hallway"

/area/iskhod/hallway/side/cryo
	name = "Cryo Hallway"

/area/iskhod/hallway/side/bridgehallway
	name = "Bridge Hallway"
	icon_state = "erisblue"

/area/iskhod/hallway/side/eschangara
	name = "Escape Hangar A"
	icon_state = "erisred"

/area/iskhod/hallway/side/eschangarb
	name = "Escape Hangar B"
	icon_state = "erisred"

/area/iskhod/hallway/main/stairwell
	name = "Stairwell"
	icon_state = "hallway4"

//Command

/area/iskhod/command
	name = "\improper Command"
	area_light_color = COLOR_PALE_BLUE_GRAY

/area/iskhod/command/bridge
	name = "\improper Control Room"
	icon_state = "bridge"

/area/iskhod/command/hallway
	name = "\improper Command Hallway"
	icon_state = "bridge"

/area/iskhod/command/meeting_room
	name = "\improper Heads of Staff Meeting Room"
	icon_state = "bridge"
	ambience = list()
	sound_env = MEDIUM_SOFTFLOOR
	area_light_color = COLOR_COMMAND_BLUE

/area/iskhod/command/armory
	name = "\improper Command Center Armory"
	icon_state = "bridge"
	sound_env = SMALL_ENCLOSED

/area/iskhod/command/panic_room
	name = "\improper Panic Room"
	icon_state = "bridge"
	flags = AREA_FLAG_CRITICAL | AREA_FLAG_RAD_SHIELDED
	sound_env = SMALL_ENCLOSED

/area/iskhod/command/bridgebar
	name = "V.I.P. Bar"
	icon_state = "bar"
	area_light_color = COLOR_LIGHTING_CREW_SOFT

/area/iskhod/command/captain
	name = "\improper Command - Premier's Office"
	icon_state = "captain"
	sound_env = SMALL_SOFTFLOOR
	flags = AREA_FLAG_CRITICAL
	area_light_color = COLOR_LIGHTING_CREW_SOFT

/area/iskhod/command/captain/quarters
	name = "\improper Command - Premier's Quarters"
	area_light_color = COLOR_LIGHTING_CREW_SOFT

/area/iskhod/command/fo
	name = "\improper Command - Steward's Quarters"
	icon_state = "head_quarters"
	sound_env = SMALL_SOFTFLOOR
	flags = AREA_FLAG_CRITICAL
	area_light_color = COLOR_LIGHTING_CREW_SOFT

/area/iskhod/command/cro
	name = "\improper Research - Overseer's Office"
	icon_state = "head_quarters"
	flags = AREA_FLAG_CRITICAL
	sound_env = SMALL_SOFTFLOOR
	area_light_color = COLOR_LIGHTING_CREW_SOFT

/area/iskhod/command/cro/quarters
	name = "\improper Research - Overseer's Quarters"
	icon_state = "head_quarters"
	sound_env = SMALL_SOFTFLOOR
	area_light_color = COLOR_LIGHTING_CREW_SOFT

/area/iskhod/command/gmaster
	name = "\improper Engineering - Guild Master's Office"
	icon_state = "head_quarters"
	flags = AREA_FLAG_CRITICAL
	sound_env = SMALL_SOFTFLOOR
	area_light_color = COLOR_LIGHTING_CREW_SOFT

/area/iskhod/command/gmaster/quarters
	name = "\improper Engineering - Guild Master's Quarters"
	icon_state = "head_quarters"
	sound_env = SMALL_SOFTFLOOR
	area_light_color = COLOR_LIGHTING_CREW_SOFT

/area/iskhod/command/cbo
	name = "\improper Biolab - Overseer's Office"
	icon_state = "head_quarters"
	flags = AREA_FLAG_CRITICAL
	sound_env = SMALL_SOFTFLOOR
	area_light_color = COLOR_LIGHTING_CREW_SOFT

/area/iskhod/command/cbo/quarters
	name = "\improper Biolab - Overseer's Quarters"
	icon_state = "head_quarters"
	sound_env = SMALL_SOFTFLOOR
	area_light_color = COLOR_LIGHTING_CREW_SOFT

/area/iskhod/command/swo
	name = "Warrant Officer's Office"
	icon_state = "hammerred"
	flags = AREA_FLAG_CRITICAL
	sound_env = SMALL_SOFTFLOOR
	area_light_color = COLOR_LIGHTING_CREW_SOFT

/area/iskhod/command/swo/quarters
	name = "Warrant Officer's Quarters"
	icon_state = "hammerred"
	sound_env = SMALL_SOFTFLOOR
	area_light_color = COLOR_LIGHTING_CREW_SOFT

/area/iskhod/command/smc
	name = "Blackshield Commander's Office"
	icon_state = "hammerred"
	flags = AREA_FLAG_CRITICAL
	sound_env = SMALL_SOFTFLOOR
	area_light_color = COLOR_LIGHTING_CREW_SOFT

/area/iskhod/command/smc/quarters
	name = "Blackshield Commander's Quarters"
	icon_state = "hammerred"
	sound_env = SMALL_SOFTFLOOR
	area_light_color = COLOR_LIGHTING_CREW_SOFT

/area/iskhod/command/Priest
	name = "Priest's Office"
	icon_state = "head_quarters"
	flags = AREA_FLAG_CRITICAL
	sound_env = SMALL_SOFTFLOOR
	area_light_color = COLOR_LIGHTING_CREW_SOFT

/area/iskhod/command/Priest/quarters
	name = "Priest's Quarters"
	icon_state = "head_quarters"
	sound_env = SMALL_SOFTFLOOR
	area_light_color = COLOR_LIGHTING_CREW_SOFT

/area/iskhod/command/merchant
	name = "\improper Frontier Logistics - Quartermaster's Office"
	icon_state = "quart"
	flags = AREA_FLAG_CRITICAL
	sound_env = SMALL_SOFTFLOOR
	area_light_color = COLOR_LIGHTING_CREW_SOFT

/area/iskhod/command/teleporter
	name = "\improper Teleporter"
	icon_state = "teleporter"

/area/iskhod/command/tcommsat
	ambience = list('sound/ambience/ambisin2.ogg', 'sound/ambience/signal.ogg', 'sound/ambience/signal.ogg', 'sound/ambience/ambigen10.ogg')
	flags = AREA_FLAG_CRITICAL

/area/iskhod/command/tcommsat/chamber
	name = "\improper Telecoms Central Compartment"
	icon_state = "tcomsatcham"

/area/iskhod/command/tcommsat/computer
	name = "\improper Telecoms Control Room"
	icon_state = "tcomsatcomp"

/area/iskhod/command/courtroom
	name = "\improper Courtroom"
	icon_state = "courtroom"

/area/iskhod/command/crematorium
	name = "\improper Crematorium"
	icon_state = "erisyellow"

//Crew Quarters

/area/iskhod/crew_quarters
	name = "\improper Dormitories"
	icon_state = "Sleep"
	area_light_color = COLOR_LIGHTING_CREW_SOFT

/area/iskhod/crew_quarters/toilet
	name = "\improper Dormitory Toilets"
	icon_state = "toilet"
	sound_env = SMALL_ENCLOSED

/area/iskhod/crew_quarters/toilet/public
	name = "Public Toilet"
	icon_state = "nadezhdayellow"

/area/iskhod/crew_quarters/toilet/medbay
	name = "Medbay Toilet"
	icon_state = "nadezhdayellow"

/area/iskhod/crew_quarters/arcade
	name = "Arcade"
	icon_state = "nadezhdayellow"

/area/iskhod/crew_quarters/dorm1
	name = "\improper Dormitories"
	icon_state = "Sleep"

/area/iskhod/crew_quarters/dorm2
	name = "\improper Dormitories"

/area/iskhod/crew_quarters/dorm3
	name = "\improper Dormitories"

/area/iskhod/crew_quarters/dorm4
	name = "\improper Dormitories"

/area/iskhod/crew_quarters/dorm5
	name = "\improper Dormitories"

/area/iskhod/crew_quarters/podrooms
	name = "\improper Upper Pod Dormitories"

/area/iskhod/crew_quarters/podrooms2
	name = "\improper Lower Pod Dormitories"

/area/iskhod/crew_quarters/sleep
	name = "\improper Dormitories"

/area/iskhod/crew_quarters/sleep/engi_wash
	name = "\improper Engineering Washroom"
	icon_state = "toilet"
	sound_env = SMALL_ENCLOSED

/area/iskhod/crew_quarters/sleep/bedrooms
	name = "\improper Dormitory Bedroom One"
	icon_state = "Sleep"
	sound_env = SMALL_SOFTFLOOR

/area/iskhod/crew_quarters/sleep/cryo
	name = "\improper Colony Cryosleep Storage"
	icon_state = "Sleep"
	area_light_color = COLOR_LIGHTING_SCI_BRIGHT
	flags = AREA_FLAG_CRITICAL | AREA_FLAG_RAD_SHIELDED

/area/iskhod/crew_quarters/sleep/cryo2
	name = "\improper Lower Colony Elevator Lobby"
	icon_state = "Sleep"
	area_light_color = COLOR_LIGHTING_SCI_BRIGHT
	flags = AREA_FLAG_CRITICAL | AREA_FLAG_RAD_SHIELDED

/area/iskhod/crew_quarters/sleep_male
	name = "\improper Male Dorm"
	icon_state = "Sleep"

/area/iskhod/crew_quarters/sleep_male/toilet_male
	name = "\improper Male Toilets"
	icon_state = "toilet"
	sound_env = SMALL_ENCLOSED

/area/iskhod/crew_quarters/sleep_female
	name = "\improper Female Dorm"
	icon_state = "Sleep"

/area/iskhod/crew_quarters/sleep_female/toilet_female
	name = "\improper Female Toilets"
	icon_state = "toilet"
	sound_env = SMALL_ENCLOSED

/area/iskhod/crew_quarters/locker
	name = "\improper Locker Room"
	icon_state = "locker"

/area/iskhod/crew_quarters/locker/locker_toilet
	name = "\improper Locker Toilets"
	icon_state = "toilet"
	sound_env = SMALL_ENCLOSED

/area/iskhod/crew_quarters/fitness
	name = "\improper Fitness Room"
	icon_state = "fitness"

/area/iskhod/crew_quarters/pool
	name = "\improper Public Pool"
	icon_state = "fitness"

/area/iskhod/crew_quarters/cafeteria
	name = "\improper Cafeteria"
	icon_state = "cafeteria"

/area/iskhod/crew_quarters/kitchen
	name = "\improper Kitchen"
	icon_state = "kitchen"

/area/iskhod/crew_quarters/bar
	name = "\improper Bar"
	icon_state = "bar"
	sound_env = LARGE_SOFTFLOOR

/area/iskhod/crew_quarters/bar/vip
	name = "\improper VIP Room"
	icon_state = "bar"

/area/iskhod/crew_quarters/outerspess
	name = "\improper Shuttle Room"
	icon_state = "Sleep"

/area/iskhod/crew_quarters/barbackroom
	name = "Bar Backroom"
	icon_state = "erisgreen"

/area/iskhod/crew_quarters/theatre
	name = "\improper Theatre"
	icon_state = "Theatre"
	sound_env = LARGE_SOFTFLOOR

/area/iskhod/crew_quarters/clownoffice
	name = "Entertainment Studio"
	icon_state = "erisblue"

/area/iskhod/crew_quarters/library
 	name = "\improper Library"
 	icon_state = "library"
 	sound_env = LARGE_SOFTFLOOR

/area/iskhod/crew_quarters/librarybackroom
	name = "Library Backroom"
	icon_state = "erisgreen"

/area/iskhod/crew_quarters/janitor/
	name = "\improper Custodial Closet"
	icon_state = "janitor"

/area/iskhod/crew_quarters/hydroponics
	name = "\improper Hydroponics"
	icon_state = "hydro"

/area/iskhod/crew_quarters/botanist
	name = "\improper Gardener's room"
	icon_state = "hydro"

/area/iskhod/crew_quarters/hydroponics/garden
	name = "\improper Garden"
	icon_state = "garden"
	dynamic_lighting = FALSE
	forced_ambience = list('sound/ambience/meadowamb1.ogg', 'sound/ambience/meadowamb2.ogg', 'sound/ambience/meadowamb3.ogg', 'sound/ambience/meadowamb4.ogg')

/area/iskhod/crew_quarters/clothingstorage
	name = "Clothing Storage"
	icon_state = "erisyellow"

/area/iskhod/crew_quarters/pubeva
	name = "Public E.V.A. Storage"
	icon_state = "erisblue"

/area/iskhod/crew_quarters/publichydro
	name = "Public Hydroponics"
	icon_state = "erisblue"

/area/iskhod/crew_quarters/techshop
	name =  "Vacant Tech shops"
	icon_state = "construction"

//Church

/area/iskhod/absolutism
	icon_state = "erisgreen"
	area_light_color = COLOR_LIGHTING_NEOTHEOLOGY_BRIGHT

/area/iskhod/absolutism/chapel
	name = "\improper Chapel"
	icon_state = "chapel"
	ambience = list('sound/ambience/ambicha1.ogg','sound/ambience/ambicha2.ogg','sound/ambience/ambicha3.ogg','sound/ambience/ambicha4.ogg')
	sound_env = LARGE_ENCLOSED

/area/iskhod/absolutism/hallways
	name = "\improper Church Hallways"
	icon_state = "erisyellow"
	area_light_color = COLOR_LIGHTING_NEOTHEOLOGY_BRIGHT

/area/iskhod/absolutism/skyyard
	name = "\improper Junk Sky Field Teleporter"
	icon_state = "erisyellow"
	area_light_color = COLOR_LIGHTING_NEOTHEOLOGY_BRIGHT

/area/iskhod/absolutism/bioreactor
	name = "\improper Church Bioreactor Room"
	icon_state = "erisblue"
	area_light_color = COLOR_LIGHTING_NEOTHEOLOGY_BRIGHT

/area/iskhod/absolutism/vectorrooms
	name = "\improper Church Commons"
	icon_state = "erisblue"
	area_light_color = COLOR_LIGHTING_NEOTHEOLOGY_BRIGHT

/area/iskhod/absolutism/office
	name = "\improper Chapel Office"
	icon_state = "chapeloffice"
	area_light_color = COLOR_LIGHTING_NEOTHEOLOGY_DARK

/area/iskhod/absolutism/chapelritualroom
	name = "Chapel Rituals Room"
	icon_state = "erisgreen"

//Engineering

/area/iskhod/engineering
	name = "\improper Engineering"
	icon_state = "engineering"
	area_light_color = COLOR_LIGHTING_SCI_BRIGHT

/area/iskhod/engineering/gravity_generator
	name = "Gravity Generator Room"
	icon_state = "blue"
	flags = AREA_FLAG_CRITICAL

/area/iskhod/engineering/shield_generator
	name = "Shield Generator Room"
	icon_state = "blueold"

/area/iskhod/engineering/atmos
 	name = "\improper Atmospherics"
 	icon_state = "atmos"
 	sound_env = LARGE_ENCLOSED

/area/iskhod/engineering/workshop
 	name = "\improper Workshop"
 	icon_state = "blueold"
 	sound_env = LARGE_ENCLOSED

/area/iskhod/engineering/atmos/monitoring
	name = "\improper Atmospherics Monitoring Room"
	icon_state = "atmos_monitoring"
	sound_env = STANDARD_STATION

/area/iskhod/engineering/atmos/storage
	name = "\improper Atmospherics Storage"
	icon_state = "atmos_storage"
	sound_env = SMALL_ENCLOSED

/area/iskhod/engineering/atmos/surface
	name = "\improper Atmospherics Surface"
	icon_state = "atmos_storage"
	sound_env = SMALL_ENCLOSED

/area/iskhod/engineering/drone_fabrication
	name = "\improper Engineering Drone Fabrication"
	icon_state = "drone_fab"
	sound_env = SMALL_ENCLOSED

/area/iskhod/engineering/engine_smes
	name = "\improper Engineering SMES"
	icon_state = "engine_smes"
	sound_env = SMALL_ENCLOSED

/area/iskhod/engineering/engine_room
	name = "\improper Engine Room"
	icon_state = "engine"
	sound_env = LARGE_ENCLOSED
	flags = AREA_FLAG_CRITICAL

/area/iskhod/engineering/engine_airlock
	name = "\improper Engine Room Airlock"
	icon_state = "engine"

/area/iskhod/engineering/enginehallway
	name = "\improper Engine Room Hallway"
	icon_state = "engine"

/area/iskhod/engineering/engine_monitoring
	name = "\improper Engine Monitoring Room"
	icon_state = "engine_monitoring"
	flags = AREA_FLAG_CRITICAL

/area/iskhod/engineering/engine_waste
	name = "\improper Engine Waste Handling"
	icon_state = "engine_waste"
	flags = AREA_FLAG_CRITICAL

/area/iskhod/engineering/engineering_monitoring
	name = "\improper Engineering Monitoring Room"
	icon_state = "engine_monitoring"

/area/iskhod/engineering/foyer
	name = "\improper Engineering Foyer"
	icon_state = "engineering_foyer"

/area/iskhod/engineering/storage
	name = "\improper Engineering Storage"
	icon_state = "engineering_storage"
	area_light_color = COLOR_LIGHTING_SCI_DARK

/area/iskhod/engineering/break_room
	name = "\improper Engineering Break Room"
	icon_state = "engineering_break"
	sound_env = MEDIUM_SOFTFLOOR

/area/iskhod/engineering/dorm
	name = "\improper Guild Dorm"
	icon_state = "engineering_break"
	sound_env = MEDIUM_SOFTFLOOR

/area/iskhod/engineering/dorm/one
	name = "\improper Guild Dorm One"

/area/iskhod/engineering/dorm/two
	name = "\improper Guild Dorm Two"

/area/iskhod/engineering/dorm/three
	name = "\improper Guild Dorm Three"

/area/iskhod/engineering/dorm/four
	name = "\improper Guild Dorm Four"

/area/iskhod/engineering/engine_eva
	name = "\improper Engine EVA"
	icon_state = "engine_eva"
	area_light_color = COLOR_LIGHTING_SCI_DARK

/area/iskhod/engineering/locker_room
	name = "\improper Engineering Locker Room"
	icon_state = "engineering_locker"

/area/iskhod/engineering/workshop
	name = "\improper Engineering Workshop"
	icon_state = "engineering_workshop"

/area/iskhod/engineering/starboardhallway
	name = "Engineering Starboard Hallway"
	icon_state = "nadezhdagreen"

/area/iskhod/engineering/wastingroom
	name = "Wasting Room"
	icon_state = "nadezhdared"
	area_light_color = COLOR_LIGHTING_SCI_DARK

/area/iskhod/engineering/post
	name = "Engineering Post"
	icon_state = "nadezhdared"
	area_light_color = COLOR_LIGHTING_SCI_DARK

/area/iskhod/engineering/wastingroom
	name = "Wasting Room"
	icon_state = "nadezhdared"

/area/iskhod/engineering/techstorage
	name = "Tools Storage"
	icon_state = "nadezhdared"

/area/iskhod/engineering/telecommonitor
	name = "Telecommunications Monitor Room"
	icon_state = "nadezhdared"

/area/iskhod/engineering/breakroom
	name = "Engineering Break Room"
	icon_state = "nadezhdared"

/area/iskhod/engineering/freezercontrol
	name = "Freezer Control"
	icon_state = "nadezhdared"

/area/iskhod/engineering/atmoscontrol
	name = "Atmospherics Control"
	icon_state = "nadezhdared"

/area/iskhod/engineering/engeva
	name = "Engineering E.V.A. Storage"
	icon_state = "nadezhdablue"
	area_light_color = COLOR_LIGHTING_SCI_DARK

/area/iskhod/engineering/construction
	name = "\improper Engineering Construction Area"
	is_maintenance = TRUE
	icon_state = "yellow"

/area/iskhod/engineering/propulsion
	name = "Propulsion Hangar"
	icon_state = "propulsion"

/area/iskhod/engineering/propulsion/left
	name = "Left Propulsion Hangar"

/area/iskhod/engineering/propulsion/right
	name = "Right Propulsion Hangar"

//MedBay

/area/iskhod/medical/medbay
	name = "\improper Biolab - Medical"
	icon_state = "nadezhdagreen"
	area_light_color = COLOR_LIGHTING_SCI_BRIGHT

/area/iskhod/medical/medbay
	name = "\improper Biolab - Medbay"
	icon_state = "medbay"
	ambience = list('sound/ambience/signal.ogg')

area/nadezhda/medical/medbayshowers
	name = "\improper Biolab - Medbay Showers"
	icon_state = "medbay"
	ambience = list('sound/ambience/signal.ogg')

area/nadezhda/medical/medbaymeeting
	name = "\improper Biolab - Medbay Meeting Room"
	icon_state = "medbay"
	ambience = list('sound/ambience/signal.ogg')

//Medbay is a large area, these additional areas help level out APC load.
/area/iskhod/medical/medbay2
	name = "\improper Biolab - Medbay Hallway Floor 2"
	icon_state = "medbay2"
	ambience = list('sound/ambience/signal.ogg')

/area/iskhod/medical/medbay3
	name = "\improper Biolab - Medbay Hallway Floor 1 Section 1"
	icon_state = "medbay3"
	ambience = list('sound/ambience/signal.ogg')

/area/iskhod/medical/medbay4
	name = "\improper Biolab - Medbay Hallway Floor 1 Section 2"
	icon_state = "medbay4"
	ambience = list('sound/ambience/signal.ogg')

/area/iskhod/medical/biostorage
	name = "\improper Biolab - Secondary Storage"
	icon_state = "medbay2"
	ambience = list('sound/ambience/signal.ogg')

/area/iskhod/medical/bathroom
	name = "\improper Biolab - Medical Bathroom"
	icon_state = "medbay2"

/area/iskhod/medical/reception
	name = "\improper Biolab - Medbay Reception"
	icon_state = "medbay"
	ambience = list('sound/ambience/signal.ogg')

/area/iskhod/medical/psych
	name = "\improper Biolab - Psych Room"
	icon_state = "medbay3"
	ambience = list('sound/ambience/signal.ogg')
	area_light_color = COLOR_LIGHTING_CREW_SOFT

/area/iskhod/medical/medbreak
	name = "\improper Biolab - Break Room"
	icon_state = "medbay3"
	ambience = list('sound/ambience/signal.ogg')

/area/iskhod/medical/medsleep
	name = "\improper Biolab - Medbay Sleeping Room"
	icon_state = "medbay3"
	ambience = list('sound/ambience/signal.ogg')

/area/iskhod/medical/patients_rooms
	name = "\improper Biolab - Patient's Rooms"
	icon_state = "patients"

/area/iskhod/medical/ward
	name = "\improper Biolab - Recovery Ward"
	icon_state = "patients"

/area/iskhod/medical/patient_a
	name = "\improper Biolab - Patient Room A"
	icon_state = "patients"

/area/iskhod/medical/patient_b
	name = "\improper Biolab - Patient Room B"
	icon_state = "patients"

/area/iskhod/medical/patient_c
	name = "\improper Biolab - Patient Room C"
	icon_state = "patients"

/area/iskhod/medical/patient_wing
	name = "\improper Biolab - Patient Wing"
	icon_state = "patients"

/area/iskhod/medical/cmostore
	name = "\improper Biolab - Overseer`s Storage"
	icon_state = "CMO"

/area/iskhod/medical/virology
	name = "\improper Biolab - Virology"
	icon_state = "virology"

/area/iskhod/medical/virologyaccess
	name = "\improper Biolab - Virology Access"
	icon_state = "virology"

/area/iskhod/medical/morgue
	name = "\improper Biolab - Morgue"
	icon_state = "morgue"
	ambience = list('sound/ambience/ambimo1.ogg','sound/ambience/ambimo2.ogg')

/area/iskhod/medical/chemistry
	name = "\improper Biolab - Chemistry"
	icon_state = "chem"

/area/iskhod/medical/surgery
	name = "\improper Biolab - Operating Theatre"
	icon_state = "surgery"

/area/iskhod/medical/surgery2
	name = "\improper Biolab - Operating Theatre 2"
	icon_state = "surgery"

/area/iskhod/medical/surgeryobs
	name = "\improper Biolab - Operation Observation Room"
	icon_state = "surgery"

/area/iskhod/medical/surgeryprep
	name = "\improper Biolab - Pre-Op Prep Room"
	icon_state = "surgery"

/area/iskhod/medical/cryo
	name = "\improper Biolab - Cryogenics Bay"
	icon_state = "cryo"

/area/iskhod/medical/exam_room
	name = "\improper Biolab - Exam Room"
	icon_state = "exam_room"

/area/iskhod/medical/genetics
	name = "\improper Research - Genetics Lab"
	icon_state = "genetics"

/area/iskhod/medical/genetics_cloning
	name = "\improper Research - Cloning Lab"
	icon_state = "cloning"

/area/iskhod/medical/sleeper
	name = "\improper Biolab - Emergency Treatment Centre"
	icon_state = "exam_room"

/area/iskhod/medical/chemstor
	name = "\improper Biolab - Chemical Storage"
	icon_state = "erisblue"
	area_light_color = COLOR_LIGHTING_SCI_DARK

/area/iskhod/medical/medeva
	name = "\improper Biolab - Medical E.V.A. Storage"
	icon_state = "erisblue"
	area_light_color = COLOR_LIGHTING_SCI_DARK

/area/iskhod/medical/paramedic
	name = "\improper Biolab - Paramedic Closet"
	icon_state = "erisyellow"
	area_light_color = COLOR_LIGHTING_SCI_DARK

/area/iskhod/medical/medbay/iso
	name = "\improper Biolab - Isolation Wing"
	icon_state = "erisgreen"

/area/iskhod/medical/medbay/uppercor
	name = "\improper Biolab - Medbay Upper Coridor"
	icon_state = "erisgreen"

/area/iskhod/medical/organ_lab
	name = "\improper Biolab - Organ Laboratory"

//Security

/area/iskhod/security
	name = "Security"
	icon_state = "security"
	area_light_color = COLOR_LIGHTING_SCI_BRIGHT

/area/iskhod/security/main
	name = "\improper Security Office"
	icon_state = "security"

/area/iskhod/security/sechall
	name = "\improper Security Hallway"
	icon_state = "security"

/area/iskhod/security/brig
	name = "\improper Security - Brig"
	icon_state = "brig"

/area/iskhod/security/brig/prison_break()
	for(var/obj/structure/closet/secure_closet/brig/temp_closet in src)
		temp_closet.set_locked(FALSE)
	for(var/obj/machinery/door_timer/temp_timer in src)
		temp_timer.releasetime = 1
	..()

/area/iskhod/security/prison
	name = "\improper Security - Prison Wing"
	icon_state = "sec_prison"

/area/iskhod/security/prison/prison_break()
	for(var/obj/structure/closet/secure_closet/brig/temp_closet in src)
		temp_closet.set_locked(FALSE)
	for(var/obj/machinery/door_timer/temp_timer in src)
		temp_timer.releasetime = 1
	..()

/area/iskhod/security/warden
	name = "\improper Security - Command Center"
	icon_state = "Warden"

/area/iskhod/security/armory
	name = "\improper Security - Armory"
	icon_state = "Warden"

/area/iskhod/security/armory_blackshield
	name = "\improper Blackshield - Armory"
	icon_state = "Warden"

/area/iskhod/security/armoryshop
	name = "\improper Security - Armory Shop"
	icon_state = "Warden"

/area/iskhod/security/detectives_office
	name = "\improper Security - Forensic Office"
	icon_state = "detective"
	sound_env = MEDIUM_SOFTFLOOR

/area/iskhod/security/range
	name = "\improper Security - Firing Range"
	icon_state = "firingrange"

/area/iskhod/security/tactical
	name = "\improper Security - Tactical Equipment"
	icon_state = "Tactical"

/area/iskhod/security/tactical_blackshield
	name = "\improper Blackshield - Tactical Equipment"
	icon_state = "Tactical"

/area/iskhod/security/nuke_storage
	name = "\improper Vault"
	icon_state = "nuke_storage"

/area/iskhod/security/nuke_vault
	name = "\improper Nuclear Vault"
	flags = AREA_FLAG_CRITICAL
	area_light_color = COLOR_LIGHTING_SCI_DARK
	icon_state = "nuke_storage"

/area/iskhod/security/nuke_hallway
	name = "\improper Nuclear Vault Access"
	flags = AREA_FLAG_CRITICAL | AREA_FLAG_RAD_SHIELDED
	area_light_color = COLOR_LIGHTING_SCI_BRIGHT
	icon_state = "nuke_storage"

/area/iskhod/security/checkpoint
	name = "\improper Security Checkpoint"
	icon_state = "checkpoint1"

/area/iskhod/security/maingate
	name = "\improper Security - Main Gate"
	icon_state = "security"
	dynamic_lighting = FALSE
	forced_ambience = list('sound/ambience/meadowamb1.ogg', 'sound/ambience/meadowamb2.ogg', 'sound/ambience/meadowamb3.ogg', 'sound/ambience/meadowamb4.ogg')

/area/iskhod/security/maingate/east
	name = "\improper Security - Eastern Perimeter"

/area/iskhod/security/maingate/west
	name = "\improper Security - Western Perimeter"

/area/iskhod/security/checkpoint/supply
	name = "Security Post - Cargo Bay"
	icon_state = "checkpoint1"

/area/iskhod/security/checkpoint/engineering
	name = "Security Post - Engineering"
	icon_state = "checkpoint1"

/area/iskhod/security/checkpoint/medical
	name = "Security Post - Medbay"
	icon_state = "checkpoint1"

/area/iskhod/security/checkpoint/science
	name = "Security Post - Science"
	icon_state = "checkpoint1"

/area/iskhod/security/checkpoint/cryo
	name = "Security Post - Cryogenics"
	icon_state = "checkpoint1"

/area/iskhod/security/triage
	name = "\improper Security Triage"
	icon_state = "security"

/area/iskhod/security/triage_blackshield
	name = "\improper Blackshield Triage"
	icon_state = "security"

/area/iskhod/security/vacantoffice2
	name = "\improper Vacant Office"
	icon_state = "security"

/area/iskhod/security/secrecroom
	name = "Security - Recreation Room"
	icon_state = "security"

/area/iskhod/security/inspectors_office
	name = "Inspectors Office"
	icon_state = "hammerblue"
	area_light_color = COLOR_LIGHTING_CREW_SOFT

/area/iskhod/security/disposal
	name = "Security Disposal"
	flags = AREA_FLAG_RAD_SHIELDED
	icon_state = "hammerblue"
	is_maintenance = TRUE

/area/iskhod/security/barracks
	name = "Barracks"
	icon_state = "hammerblue"

/area/iskhod/security/dorm1
	name = "Security Dormitory 1"
	icon_state = "hammerblue"

/area/iskhod/security/dorm2
	name = "Security Dormitory 2"
	icon_state = "hammerblue"

/area/iskhod/security/dorm3
	name = "Security Dormitory 3"
	icon_state = "hammerblue"

/area/iskhod/security/dorm4
	name = "Security Dormitory 4"
	icon_state = "hammerblue"

/area/iskhod/security/dorm5
	name = "Security Dormitory 5"
	icon_state = "hammerblue"

/area/iskhod/security/dorm6
	name = "Security Dormitory 6"
	icon_state = "hammerblue"

/area/iskhod/security/dorm7
	name = "Security Dormitory 7"
	icon_state = "hammerblue"

/area/iskhod/security/dorm8
	name = "Security Dormitory 8"
	icon_state = "hammerblue"

/area/iskhod/security/prisoncells
	name = "Prison Cells"
	icon_state = "hammerblue"

/area/iskhod/security/laber_area
	name = "Labor Transfer"
	icon_state = "hammerblue"

/area/iskhod/security/hut_cell1
	name = "HuT Cell 1"
	icon_state = "hammerblue"

/area/iskhod/security/hut_cell2
	name = "HuT Cell 2"
	icon_state = "hammerblue"

/area/iskhod/security/evidencestorage
	name = "Evidence Storage"
	icon_state = "hammerred"
	area_light_color = COLOR_LIGHTING_SCI_DARK

/area/iskhod/security/exerooms
	name = "Executive Rooms"
	icon_state = "hammerred"
	area_light_color = COLOR_LIGHTING_SCI_DARK

/area/iskhod/security/maintpost
	name = "Maintenance Post"
	flags = AREA_FLAG_RAD_SHIELDED
	icon_state = "hammerred"
	is_maintenance = TRUE

//Cargo

/area/iskhod/quartermaster
	name = "\improper Merchants"
	icon_state = "quart"
	area_light_color = COLOR_LIGHTING_SCI_BRIGHT

/area/iskhod/quartermaster/office
	name = "\improper Cargo Office"
	icon_state = "quartoffice"

/area/iskhod/quartermaster/pods
	name = "\improper Frontier Logistics Pod Dorms"
	icon_state = "quartoffice"

/area/iskhod/quartermaster/storage
	name = "\improper Cargo Bay"
	icon_state = "quartstorage"
	sound_env = LARGE_ENCLOSED

/area/iskhod/quartermaster/miningdock
	name = "\improper Cargo Mining Dock"
	icon_state = "mining"

/area/iskhod/quartermaster/mining_outside_doc
	name = "\improper Cargo Mining Area"
	icon_state = "mining"
	ship_area = FALSE

/area/iskhod/quartermaster/mining_dreg
	name = "Slate Mining Pad MEH A" //Mining Excation Head
	icon_state = "erisblue"
	ship_area = FALSE

/area/iskhod/quartermaster/disposaldrop
	name = "Disposal and Delivery"
	icon_state = "erisred"

/area/iskhod/quartermaster/underground_to_surface_disposal
	name = "Disposal surface access"
	icon_state = "erisblue"
	requires_power = FALSE

/area/iskhod/quartermaster/hangarsupply
	name = "Supply Shuttle Hangar"
	icon_state = "erisblue"

/area/iskhod/quartermaster/hangarsupply_nolight
	name = "Supply Shuttle Dock"
	icon_state = "erisgreen"

/area/iskhod/quartermaster/misc
	name = "\improper Cargo Barracks"
	icon_state = "nadezhdayellow"

/area/iskhod/quartermaster/supplydock
	name = "\improper Cargo Delivery Dock"
	icon_state = "erisgreen"
	base_turf = /turf/simulated/floor/tiled/dark/cargo


//Research and Development

/area/iskhod/rnd
	area_light_color = COLOR_LIGHTING_SCI_BRIGHT

/area/iskhod/rnd/research
	name = "\improper Research - Research and Development"
	icon_state = "research"
	flags = AREA_FLAG_CRITICAL

/area/iskhod/rnd/research/fabrication
	name = "\improper Research - Fabrication"
	icon_state = "research"

/area/iskhod/rnd/researchbathroom
	name = "\improper Research - Bathroom"
	icon_state = "research"

/area/iskhod/rnd/circuitlab
	name = "\improper Research - Circuit Lab"
	icon_state = "research"

/area/iskhod/rnd/rbreakroom
	name = "\improper Research - Breakroom"
	icon_state = "research"

/area/iskhod/rnd/scient
	name = "\improper Research - Department Entrance"
	icon_state = "erisblue"

/area/iskhod/rnd/docking
	name = "\improper Research - Elevator"
	icon_state = "research_dock"

/area/iskhod/rnd/lab
	name = "\improper Research - Lab"
	icon_state = "toxlab"

/area/iskhod/rnd/chargebay
	name = "\improper Research - Mech Bay"
	icon_state = "mechbay"

/area/iskhod/rnd/robotics
	name = "\improper Research - Robotics Lab"
	icon_state = "robotics"
	flags = AREA_FLAG_CRITICAL

/area/iskhod/rnd/rdoffice
	name = "\improper Research - Research Office"
	icon_state = "head_quarters"

/area/iskhod/rnd/supermatter
	name = "\improper Research - Supermatter Lab"
	icon_state = "toxlab"

/area/iskhod/rnd/xenobiology
	name = "\improper Research - Xenobiology Lab"
	icon_state = "xeno_lab"

/area/iskhod/rnd/xenobiology/xenoflora_storage
	name = "\improper Research - Xenoflora Storage"
	icon_state = "xeno_f_store"

/area/iskhod/rnd/xenobiology/xenoflora
	name = "\improper Research - Xenoflora Lab"
	icon_state = "xeno_f_lab"

/area/iskhod/rnd/xenobiology/ameridian
	name = "\improper Research - Ameridian Lab"
	icon_state = "xeno_lab"

/area/iskhod/rnd/storage
	name = "\improper Research - Toxins Storage"
	icon_state = "toxstorage"
	area_light_color = COLOR_LIGHTING_SCI_DARK

/area/iskhod/rnd/mixing
	name = "\improper Research - Toxins Mixing Room"
	icon_state = "toxmix"

/area/iskhod/rnd/misc_lab
	name = "\improper Miscellaneous Research"
	icon_state = "toxmisc"
	area_light_color = COLOR_LIGHTING_SCI_DARK

/area/iskhod/rnd/server
	name = "\improper Research - Server Room"
	icon_state = "server"

/area/iskhod/rnd/podbay
	name = "\improper Research - Pod Bay"
	icon_state = "nadezhdablue"

/area/iskhod/rnd/anomal
	name = "\improper Research - Anomalous Research Laboratory"
	icon_state = "nadezhdablue"

/area/iskhod/rnd/anomalisolone
	name = "\improper Research - Anomalous Research Isolation One"
	flags = AREA_FLAG_RAD_SHIELDED
	icon_state = "nadezhdagreen"

/area/iskhod/rnd/anomalisoltwo
	name = "\improper Research - Anomalous Research Isolation Two"
	flags = AREA_FLAG_RAD_SHIELDED
	icon_state = "nadezhdagreen"

/area/iskhod/rnd/anomalisolthree
	name = "\improper Research - Anomalous Research Isolation Three"
	flags = AREA_FLAG_RAD_SHIELDED
	icon_state = "nadezhdagreen"

/area/iskhod/rnd/anomalisolfour
	name = "\improper Research - Anomalous Research Isolation Four"
	flags = AREA_FLAG_RAD_SHIELDED
	icon_state = "nadezhdagreen"

/area/iskhod/rnd/anomalisolfive
	name = "\improper Research - Anomalous Research Isolation Five"
	flags = AREA_FLAG_RAD_SHIELDED
	icon_state = "nadezhdagreen"

/area/iskhod/rnd/outpostgeneral
	name = "\improper Research - Anomalous Research Outpost General"
	flags = AREA_FLAG_RAD_SHIELDED
	icon_state = "erisgreen"

/area/iskhod/rnd/outpostbotany
	name = "\improper Research - Anomalous Research Outpost Botany"
	flags = AREA_FLAG_RAD_SHIELDED
	icon_state = "erisblue"

/area/iskhod/rnd/outpostmachineroom
	name = "\improper Research - Anomalous Research Outpost Machine Rooms"
	flags = AREA_FLAG_RAD_SHIELDED
	icon_state = "erisblue"

/area/iskhod/rnd/outpostbreakroom
	name = "\improper Research - Anomalous Research Outpost Break Room"
	flags = AREA_FLAG_RAD_SHIELDED
	icon_state = "erisblue"

/area/iskhod/rnd/outpostmedical
	name = "\improper Research - Anomalous Research Outpost Medstation"
	flags = AREA_FLAG_RAD_SHIELDED
	icon_state = "erisblue"

/area/iskhod/rnd/outpoststorage
	name = "\improper Research - Anomalous Research Outpost Storage"
	flags = AREA_FLAG_RAD_SHIELDED
	icon_state = "erisgreen"

/area/iskhod/rnd/server
	name = "\improper Research - Server Room"
	flags = AREA_FLAG_RAD_SHIELDED
	icon_state = "server"


//Prospector

/area/iskhod/pros/dorm
	name = "\improper Prospector Dorm"
	icon_state = "erisgreen"

/area/iskhod/pros/prep
	name = "\improper Prospector Prep"
	icon_state = "erisgreen"

/area/iskhod/pros/foreman
	name = "\improper Foreman Office"
	icon_state = "erisgreen"

/area/iskhod/pros/shuttle
	name = "\improper Shuttle Hangar"
	icon_state = "erisgreen"
	dynamic_lighting = FALSE

/area/iskhod/pros/proelav
	name = "\improper Frontier Logistics Surface Elevator"
	icon_state = "erisgreen"

/area/iskhod/pros/prostorage
	name = "\improper Prospector Storage"
	icon_state = "erisgreen"

//Storage


/area/iskhod/storage/primary
	name = "Primary Tool Storage"
	icon_state = "primarystorage"

/area/iskhod/storage/tech
	name = "Technical Storage"
	icon_state = "auxstorage"
