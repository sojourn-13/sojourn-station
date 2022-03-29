/obj/item/circuitboard/rdserver
	build_name = "R&D server"
	build_path = /obj/machinery/r_n_d/server
	board_type = "machine"
	origin_tech = list(TECH_DATA = 3)
	req_components = list(
		/obj/item/stack/cable_coil = 2,
		/obj/item/stock_parts/scanning_module = 1
	)

/obj/item/circuitboard/destructive_analyzer
	build_name = "destructive analyzer"
	build_path = /obj/machinery/r_n_d/destructive_analyzer
	board_type = "machine"
	origin_tech = list(TECH_MAGNET = 2, TECH_ENGINEERING = 2, TECH_DATA = 2)
	req_components = list(
		/obj/item/stock_parts/scanning_module = 1,
		/obj/item/stock_parts/manipulator = 1,
		/obj/item/stock_parts/micro_laser = 1
	)

/obj/item/circuitboard/autolathe
	name = "circuit board (autolathe)"
	build_path = /obj/machinery/autolathe
	board_type = "machine"
	origin_tech = list(TECH_ENGINEERING = 2, TECH_DATA = 2)
	req_components = list(
		/obj/item/stock_parts/matter_bin = 3,
		/obj/item/stock_parts/manipulator = 1,
		/obj/item/stock_parts/console_screen = 1
	)

/obj/item/circuitboard/autolathe_industrial
	build_name = "industrial autolathe"
	build_path = /obj/machinery/autolathe/industrial
	matter = list(MATERIAL_STEEL = 6, MATERIAL_PLASTIC = 6, MATERIAL_GOLD = 2, MATERIAL_SILVER = 2)
	board_type = "machine"
	origin_tech = list(TECH_ENGINEERING = 4, TECH_DATA = 3)
	req_components = list(
		/obj/item/stock_parts/matter_bin = 6,
		/obj/item/stock_parts/manipulator = 2,
		/obj/item/stock_parts/micro_laser = 2,
		/obj/item/stock_parts/console_screen = 1
	)

/obj/item/circuitboard/autolathe_greyson
	build_name = "greyson autolathe"
	build_path = /obj/machinery/autolathe/greyson
	matter = list(MATERIAL_STEEL = 6, MATERIAL_PLASTIC = 6, MATERIAL_GOLD = 2, MATERIAL_SILVER = 2, MATERIAL_PLATINUM = 4)
	board_type = "machine"
	origin_tech = list(TECH_ENGINEERING = 8, TECH_DATA = 6)
	req_components = list(
		/obj/item/stock_parts/matter_bin = 6,
		/obj/item/stock_parts/manipulator = 4,
		/obj/item/stock_parts/micro_laser = 4,
		/obj/item/stock_parts/console_screen = 1
	)

/obj/item/circuitboard/autolathe_disk_cloner
	build_name = "autolathe disk cloner"
	build_path = /obj/machinery/autolathe_disk_cloner
	board_type = "machine"
	origin_tech = list(TECH_ENGINEERING = 2, TECH_DATA = 2)
	req_components = list(
		/obj/item/stock_parts/scanning_module = 1,
		/obj/item/stock_parts/micro_laser = 2,
		/obj/item/stock_parts/console_screen = 1
	)

/obj/item/circuitboard/protolathe
	build_name = "protolathe"
	build_path = /obj/machinery/autolathe/rnd/protolathe
	board_type = "machine"
	origin_tech = list(TECH_ENGINEERING = 2, TECH_DATA = 2)
	req_components = list(
		/obj/item/stock_parts/matter_bin = 2,
		/obj/item/stock_parts/manipulator = 2
	)

/obj/item/circuitboard/circuit_imprinter
	build_name = "circuit imprinter"
	build_path = /obj/machinery/autolathe/rnd/imprinter
	board_type = "machine"
	origin_tech = list(TECH_ENGINEERING = 2, TECH_DATA = 2)
	req_components = list(
		/obj/item/stock_parts/matter_bin = 1,
		/obj/item/stock_parts/manipulator = 1
	)

/obj/item/circuitboard/mechfab
	build_name = "Circuit board (Exosuit Fabricator)"
	build_path = /obj/machinery/autolathe/mechfab
	board_type = "machine"
	origin_tech = list(TECH_DATA = 3, TECH_ENGINEERING = 3)
	req_components = list(
		/obj/item/stock_parts/matter_bin = 2,
		/obj/item/stock_parts/manipulator = 2,
		/obj/item/stock_parts/micro_laser = 1,
		/obj/item/stock_parts/console_screen = 1
	)
/* //Leaving this here for when its made into the bullet fab.
/obj/item/circuitboard/armorfabricator
	build_name = "Circuit board (Armor Fabricator)"
	build_path = /obj/machinery/autolathe/armorfabricator
	board_type = "machine"
	origin_tech = list(TECH_DATA = 3, TECH_ENGINEERING = 3)
	req_components = list(
		/obj/item/stock_parts/matter_bin = 3,
		/obj/item/stock_parts/manipulator = 1,
		/obj/item/stock_parts/micro_laser = 1,
		/obj/item/stock_parts/console_screen = 1
	)
*/

/obj/item/circuitboard/slime_compresser
	build_name = "Circuit board (Slime Compresser)"
	build_path = /obj/machinery/slime_compresser
	board_type = "machine"
	origin_tech = list(TECH_DATA = 3, TECH_ENGINEERING = 1)
	req_components = list(
		/obj/item/stock_parts/matter_bin = 1,
		/obj/item/stock_parts/manipulator = 1
	)

/obj/item/circuitboard/matter_nanoforge
	build_name = "Circuit board (Matter NanoForge)"
	build_path = /obj/machinery/matter_nanoforge
	board_type = "machine"
	origin_tech = list(TECH_DATA = 3, TECH_ENGINEERING = 3)
	req_components = list(
		/obj/item/stock_parts/matter_bin = 2,
		/obj/item/stock_parts/manipulator = 1,
		/obj/item/stock_parts/console_screen = 1,
		/obj/item/oddity/blackbox_nanoforge = 1,
		/obj/item/stock_parts/micro_laser = 1
	)

/obj/item/circuitboard/teleporterstation
	name = "Circuit board (Teleporter station board)"
	build_path = /obj/machinery/teleport/station
	board_type = "machine"
	origin_tech = list(TECH_DATA = 2, TECH_BLUESPACE = 2)
	req_components = list(
		/obj/item/bluespace_crystal/artificial = 3,
		/obj/item/stack/cable_coil = 1,
		/obj/item/stock_parts/subspace/filter = 1
	)

/obj/item/circuitboard/teleporterhub
	name = "Circuit board (Teleporter hub board)"
	build_path = /obj/machinery/teleport/hub
	board_type = "machine"
	origin_tech = list(TECH_DATA = 2, TECH_BLUESPACE = 2)
	req_components = list(
		/obj/item/bluespace_crystal/artificial = 2,
		/obj/item/stock_parts/capacitor = 1
	)

obj/item/circuitboard/ntnet_relay
	build_name = "Circuit board (NTNet Quantum Relay)"
	build_path = /obj/machinery/ntnet_relay
	board_type = "machine"
	origin_tech = list(TECH_DATA = 4)
	req_components = list(
		/obj/item/stack/cable_coil = 15
	)
