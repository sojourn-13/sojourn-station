/obj/item/circuitboard/pacman
	build_name = "PACMAN-type generator"
	build_path = /obj/machinery/power/port_gen/pacman
	board_type = "machine"
	origin_tech = list(TECH_DATA = 3, TECH_POWER = 3, TECH_PLASMA = 3, TECH_ENGINEERING = 3)
	req_components = list(
		/obj/item/stock_parts/matter_bin = 1,
		/obj/item/stock_parts/micro_laser = 1,
		/obj/item/stack/cable_coil = 2,
		/obj/item/stock_parts/capacitor = 1
	)

/obj/item/circuitboard/pacman/super
	build_name = "SUPERPACMAN-type generator"
	build_path = /obj/machinery/power/port_gen/pacman/super
	origin_tech = list(TECH_DATA = 3, TECH_POWER = 4, TECH_ENGINEERING = 4)

/obj/item/circuitboard/pacman/mrs
	build_name = "MRSPACMAN-type generator"
	build_path = /obj/machinery/power/port_gen/pacman/mrs
	origin_tech = list(TECH_DATA = 3, TECH_POWER = 5, TECH_ENGINEERING = 5)

/obj/item/circuitboard/pacman/camp
	build_name = "CAMPMAN-type generator"
	build_path = /obj/machinery/power/port_gen/pacman/camp
	origin_tech = list(TECH_DATA = 1, TECH_POWER = 2, TECH_ENGINEERING = 3)

/obj/item/circuitboard/pacman/miss
	build_name = "MISSSPACMAN-type generator"
	build_path = /obj/machinery/power/port_gen/pacman/miss
	origin_tech = list(TECH_DATA = 4, TECH_POWER = 6, TECH_ENGINEERING = 6)


/*
/obj/item/circuitboard/diesel
	build_name = "diesel generator"
	build_path = /obj/machinery/power/port_gen/pacman/diesel
	board_type = "machine"
	origin_tech = list(TECH_POWER = 2, TECH_ENGINEERING = 2)
	req_components = list(
		/obj/item/stock_parts/matter_bin = 1,
		/obj/item/stock_parts/micro_laser = 1,
		/obj/item/stack/cable_coil = 2,
		/obj/item/stock_parts/capacitor = 1
	)
*/
