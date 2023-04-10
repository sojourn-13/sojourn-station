
//We override boards do to a spawner using the "name" rather then build name
/obj/item/circuitboard/excelsiorshieldwallgen
	name = "circuit board excelsior shield wall generator"
	build_name = ""
	board_type = "machine"
	build_path = /obj/machinery/shieldwallgen/excelsior
	origin_tech = list(TECH_BLUESPACE = 3, TECH_MAGNET = 3, TECH_ILLEGAL = 2)
	req_components = list(
		/obj/item/stock_parts/subspace/transmitter = 1,
		/obj/item/stock_parts/subspace/crystal = 1,
		/obj/item/stock_parts/subspace/amplifier = 1,
		/obj/item/stock_parts/capacitor = 2,
		/obj/item/stack/cable_coil = 30
	)

/obj/item/circuitboard/excelsiorautolathe
	name = "circuit board excelsior autolathe"
	build_name = ""
	build_path = /obj/machinery/autolathe/excelsior
	board_type = "machine"
	origin_tech = list(TECH_ENGINEERING = 2, TECH_DATA = 2, TECH_ILLEGAL = 2)
	req_components = list(
		/obj/item/stock_parts/matter_bin = 3,
		/obj/item/stock_parts/manipulator = 1,
	)

/obj/item/circuitboard/excelsiorreconstructor
	name = "circuit board excelsior implant reconstructor"
	build_name = "excelsior implant reconstructor"
	build_path = /obj/machinery/complant_maker
	board_type = "machine"
	origin_tech = list(TECH_ENGINEERING = 2, TECH_BIOTECH = 3, TECH_ILLEGAL = 2)
	req_components = list(
		/obj/item/stock_parts/manipulator = 2,
		/obj/item/stock_parts/console_screen = 1
	)

/obj/item/circuitboard/diesel
	name = "circuit board diesel generator"
	build_name = ""
	build_path = /obj/machinery/power/port_gen/pacman/diesel
	board_type = "machine"
	origin_tech = list(TECH_DATA = 3, TECH_POWER = 3, TECH_PLASMA = 3, TECH_ENGINEERING = 3, TECH_ILLEGAL = 2)
	req_components = list(
		/obj/item/stock_parts/matter_bin = 1,
		/obj/item/stock_parts/micro_laser = 1,
		/obj/item/stack/cable_coil = 2,
		/obj/item/stock_parts/capacitor = 1
	)

/obj/item/circuitboard/excelsior_boombox
	name = "circuit board excelsior boombox"
	build_name = ""
	build_path = /obj/machinery/excelsior_boombox
	board_type = "machine"
	origin_tech = list(TECH_DATA = 3, TECH_ILLEGAL = 1)
	req_components = list(
		/obj/item/stock_parts/manipulator = 1,
		/obj/item/stock_parts/console_screen = 1
	)

/obj/item/circuitboard/excelsior_teleporter
	name = "circuit board excelsior teleporter"
	build_name = ""
	build_path = /obj/machinery/complant_teleporter
	board_type = "machine"
	origin_tech = list(TECH_DATA = 3, TECH_BLUESPACE = 3, TECH_ILLEGAL = 2)
	req_components = list(
		/obj/item/stock_parts/manipulator = 2,
		/obj/item/cell/large = 1,
		/obj/item/stock_parts/subspace/crystal = 1
	)

/obj/item/circuitboard/excelsior_turret
	name = "circuit board excelsior turret"
	build_name = ""
	build_path = /obj/machinery/porta_turret/excelsior
	board_type = "machine"
	origin_tech = list(TECH_COMBAT = 3, TECH_ILLEGAL = 2)
	req_components = list(
		/obj/item/stock_parts/manipulator = 2,
		/obj/item/device/assembly/prox_sensor = 1,
		/obj/item/cell/medium = 1
	)

/obj/item/circuitboard/excelsior_autodoc
	name = "excelsior autodoc"
	build_name = ""
	build_path = /obj/machinery/excelsior_autodoc
	board_type = "machine"
	origin_tech = list(TECH_BIO = 5, TECH_ILLEGAL = 2)
	req_components = list(
		/obj/item/stock_parts/manipulator/excelsior = 1,
		/obj/item/stock_parts/micro_laser/excelsior = 1,
		/obj/item/stock_parts/scanning_module/excelsior = 1,
		/obj/item/stock_parts/console_screen = 1
	)

/obj/item/circuitboard/ex_bluespace_repairer
	name = "excelsior bluespace aliner"
	build_name = ""
	build_path = /obj/machinery/power/ex_bluespace_repairer
	board_type = "machine"
	icon_state = "exl_fancy"
	origin_tech = list(TECH_BLUESPACE = 6, TECH_ILLEGAL = 1)
	req_components = list(
		/obj/item/stock_parts/manipulator/excelsior = 1,
		/obj/item/stock_parts/micro_laser/excelsior = 1,
		/obj/item/stock_parts/scanning_module/excelsior = 3,
		/obj/item/stock_parts/console_screen = 1,
		/obj/item/stock_parts/subspace/crystal = 1
	)


//Putting these here since its an antag type item and making a full .dm for 9 lines of code is.. dumb. -Kaz, Trilby

/obj/item/circuitboard/jukebox
	name = "circuit board jukebox"
	build_name = ""
	build_path = /obj/machinery/media/jukebox
	board_type = "machine"
	origin_tech = list(TECH_DATA = 3, TECH_ILLEGAL = 1)
	req_components = list(
		/obj/item/stock_parts/manipulator = 1,
		/obj/item/stock_parts/console_screen = 1
	)

/obj/item/circuitboard/artificer_turret
	build_name = "artificer turret"
	build_path = /obj/machinery/porta_turret/artificer
	board_type = "machine"
	origin_tech = list(TECH_COMBAT = 5)
	req_components = list(
		/obj/item/stock_parts/manipulator = 2,
		/obj/item/device/assembly/prox_sensor = 1,
	)

/obj/item/circuitboard/artificer_turret/opifex
	build_name = "opifex turret"
	build_path = /obj/machinery/porta_turret/artificer/opifex
	board_type = "machine"
	origin_tech = list(TECH_COMBAT = 3)
	req_components = list(
		/obj/item/stock_parts/manipulator = 1,
		/obj/item/device/assembly/prox_sensor = 1,
	)
/*
/obj/item/circuitboard/mindswapper
	build_name = "mind swapper"
	build_path = /obj/machinery/mindswapper
	board_type = "machine"
	origin_tech = list(TECH_DATA = 2, TECH_POWER = 2, TECH_ENGINEERING = 2)
	req_components = list(
		/obj/item/stock_parts/capacitor = 5,
		/obj/item/stock_parts/scanning_module = 3,
		/obj/item/stock_parts/manipulator = 4
	)
*/

/obj/item/circuitboard/blackshield_teleporter
	name = "circuit board blackshield teleporter"
	build_name = ""
	build_path = /obj/machinery/blackshield_teleporter
	board_type = "machine"
	origin_tech = list(TECH_DATA = 2, TECH_BLUESPACE = 2)
	req_components = list(
		/obj/item/stock_parts/manipulator = 2,
		/obj/item/cell/large = 1,
		/obj/item/stock_parts/subspace/crystal = 1
	)
