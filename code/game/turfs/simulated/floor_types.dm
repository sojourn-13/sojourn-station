/turf/simulated/shuttle
	name = "shuttle"
	icon = 'icons/turf/shuttle.dmi'
	thermal_conductivity = 0.05
	heat_capacity = 0
	layer = 2

/turf/simulated/shuttle/floor
	name = "floor"
	icon_state = "floor"
	plane = FLOOR_PLANE

/turf/simulated/shuttle/floor/mining
	icon_state = "6,19"
	icon = 'icons/turf/shuttlemining.dmi'

/turf/simulated/shuttle/floor/science
	icon_state = "8,15"
	icon = 'icons/turf/shuttlescience.dmi'

/turf/simulated/shuttle/plating
	name = "plating"
	icon = 'icons/turf/floors.dmi'
	icon_state = "plating"
	level = BELOW_PLATING_LEVEL

/turf/simulated/shuttle/plating/is_plating()
	return TRUE


/turf/simulated/floor/plating
	icon = 'icons/turf/flooring/plating.dmi'
	name = "plating"
	icon_state = "plating"
	initial_flooring = /decl/flooring/reinforced/plating

/turf/simulated/floor/plating/under
	name = "underplating"
	icon_state = "under"
	icon = 'icons/turf/flooring/plating.dmi'
	initial_flooring = /decl/flooring/reinforced/plating/under


/turf/simulated/floor/grass
	name = "grass"
	icon = 'icons/turf/flooring/grass.dmi'
	icon_state = "grass0"
	initial_flooring = /decl/flooring/grass

/turf/simulated/floor/grass/virgoforest
	icon_state = "grass"

/turf/simulated/floor/grass/virgoforestdark
	icon_state = "grass-dark"

/turf/simulated/floor/grass/sif
	icon_state = "grass_sif"

/turf/simulated/floor/grass/sifdark
	icon_state = "grass_sif_dark"

/turf/simulated/floor/grass/jungle
	icon_state = "grass_jungle"

/turf/simulated/floor/grass/dry
	icon_state = "grass_dry"

/turf/simulated/floor/grass/colonial1
	icon_state = "cmgrass1"

/turf/simulated/floor/grass/colonial2
	icon_state = "cmgrass2"

/turf/simulated/floor/grass/colonial3
	icon_state = "cmgrass3"

/turf/simulated/floor/grass/colonialjungle1
	icon_state = "junglegrass1"

/turf/simulated/floor/grass/colonialjungle2
	icon_state = "junglegrass2"

/turf/simulated/floor/grass/colonialjungle3
	icon_state = "junglegrass3"

/turf/simulated/floor/grass/colonialjungle4
	icon_state = "junglegrass4"

/turf/simulated/floor/grass/colonialjungle1
	icon_state = "cmgrass3"

/turf/simulated/floor/grass/colonialbeach
	icon_state = "grassbeach"

/turf/simulated/floor/grass/colonialbeach/corner
	icon_state = "gbcorner"

/turf/simulated/floor/dirt
	name = "dirt"
	icon = 'icons/turf/flooring/dirt.dmi'
	icon_state = "dirt"
	initial_flooring = /decl/flooring/dirt

/turf/simulated/floor/dirt/dark
	icon_state = "dirtnewdark"

/turf/simulated/floor/dirt/dark/plough
	icon_state = "dirt_ploughed"

/turf/simulated/floor/dirt/flood
	icon_state = "flood_dirt"

/turf/simulated/floor/dirt/flood/plough
	icon_state = "flood_dirt_ploughed"

/turf/simulated/floor/dirt/dust
	icon_state = "dust"

/turf/simulated/floor/dirt/ground
	icon_state = "desert"

/turf/simulated/floor/dirt/coast
	name = "coastline"
	icon_state = "dirtbeach"

/turf/simulated/floor/dirt/coast/corner
	icon_state = "dirtbeachcorner1"

/turf/simulated/floor/dirt/coast/corner2
	icon_state = "dirtbeachcorner2"


/turf/simulated/floor/dirt/burned
	icon_state = "burned_dirt"

/turf/simulated/floor/dirt/mud
	name = "mud"
	icon_state = "mud_dark"

/turf/simulated/floor/dirt/mud/light
	name = "mud"
	icon_state = "mud_light"

/turf/simulated/floor/rock
	name = "rocks"
	icon = 'icons/turf/flooring/dirt.dmi'
	icon_state = "rock"

/turf/simulated/floor/rock/alt
	name = "rocks"
	icon_state = "rock_alt"

/turf/simulated/floor/rock/grey
	name = "rocks"
	icon_state = "rock_grey"

/turf/simulated/floor/rock/dark
	name = "rocks"
	icon_state = "rock_dark"

/turf/simulated/floor/rock/old
	name = "rocks"
	icon_state = "rock_old"

/turf/simulated/floor/rock/manmade/ruin1
	name = "rocks"
	icon_state = "stone_old"

/turf/simulated/floor/rock/manmade/ruin2
	name = "rocks"
	icon_state = "stone_old1"

/turf/simulated/floor/rock/manmade/ruin3
	name = "rocks"
	icon_state = "stone_old2"

/turf/simulated/floor/rock/seafloor
	name = "rocks"
	icon_state = "seafloor"

/turf/simulated/floor/rock/manmade/concrete
	name = "concrete"
	icon_state = "concrete6"

/turf/simulated/floor/rock/manmade/asphalt
	name = "asphalt"
	icon_state = "asphalt"

/turf/simulated/floor/rock/manmade/road
	name = "road"
	icon_state = "road_1"

/turf/simulated/floor/hull
	name = "hull"
	icon = 'icons/turf/flooring/hull.dmi'
	icon_state = "hullcenter0"
	initial_flooring = /decl/flooring/reinforced/plating/hull


/turf/simulated/floor/hull/New()
	if(icon_state != "hullcenter0")
		overrided_icon_state = icon_state
	..()

/turf/simulated/shuttle/plating/vox //Skipjack plating
	oxygen = 0
	nitrogen = MOLES_N2STANDARD + MOLES_O2STANDARD

/turf/simulated/shuttle/floor4 // Added this floor tile so that I have a seperate turf to check in the shuttle -- Polymorph
	name = "Brig floor"        // Also added it into the 2x3 brig area of the shuttle.
	icon_state = "floor4"

/turf/simulated/shuttle/floor4/vox //skipjack floors
	name = "skipjack floor"
	oxygen = 0
	nitrogen = MOLES_N2STANDARD + MOLES_O2STANDARD
