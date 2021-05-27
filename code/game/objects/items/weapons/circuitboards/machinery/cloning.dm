/obj/item/weapon/circuitboard/clonepod
	build_name = "clone pod"
	build_path = /obj/machinery/clonepod
	board_type = "machine"
	origin_tech = list(TECH_DATA = 3, TECH_BIO = 3)
	req_components = list(
		/obj/item/stack/cable_coil = 2,
		/obj/item/weapon/stock_parts/scanning_module = 2,
		/obj/item/weapon/stock_parts/manipulator = 2,
		/obj/item/weapon/stock_parts/console_screen = 1
	)

/obj/item/weapon/circuitboard/clonescanner
	build_name = "cloning scanner"
	build_path = /obj/machinery/dna_scannernew
	board_type = "machine"
	origin_tech = list(TECH_DATA = 2, TECH_BIO = 2)
	req_components = list(
		/obj/item/weapon/stock_parts/scanning_module = 1,
		/obj/item/weapon/stock_parts/manipulator = 1,
		/obj/item/weapon/stock_parts/micro_laser = 1,
		/obj/item/weapon/stock_parts/console_screen = 1,
		/obj/item/stack/cable_coil = 2
	)

/obj/item/weapon/circuitboard/organ_printer
	build_name = "organ bioprinter"
	build_path = /obj/machinery/bioprinter
	board_type = "machine"
	origin_tech = list(TECH_DATA = 2, TECH_BIO = 2)
	req_components = list(
		/obj/item/weapon/stock_parts/matter_bin = 1
	)

/obj/item/weapon/circuitboard/prosthetics_printer
	build_name = "prosthetics printer"
	build_path = /obj/machinery/bioprinter/prosthetics
	board_type = "machine"
	origin_tech = list(TECH_DATA = 2, TECH_BIO = 2)
	req_components = list(
		/obj/item/weapon/stock_parts/matter_bin = 1,
	)
