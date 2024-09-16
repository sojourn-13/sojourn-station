/obj/item/circuitboard/tesla_turret
	build_name = "Tesla Turret"
	build_path = /obj/machinery/tesla_turret
	board_type = "machine"
	frame_type = FRAME_VERTICAL
	origin_tech = list(TECH_POWER = 4, TECH_ENGINEERING = 5)
	req_components = list(
		/obj/item/stock_parts/capacitor = 1,
		/obj/item/stock_parts/smes_coil = 1
	)

/obj/item/circuitboard/os_turret
	build_name = "Greyson Positronic gauss turret"
	board_type = "machine"
	origin_tech = list(TECH_DATA = 3, TECH_ENGINEERING = 5)
	req_components = list(
		/obj/item/stock_parts/capacitor/one_star = 2,
		/obj/item/stock_parts/matter_bin/one_star = 2,
		/obj/item/stock_parts/micro_laser/one_star = 2,
		/obj/item/stock_parts/scanning_module/one_star = 1,
		/obj/item/cell/large = 1
	)
	var/should_target_players = TRUE

/obj/item/circuitboard/os_turret/laser
	build_name = "Greyson Positronic laser turret"
	build_path = /obj/machinery/power/os_turret/laser
	board_type = "machine"
	origin_tech = list(TECH_DATA = 3, TECH_ENGINEERING = 5)
	req_components = list(
		/obj/item/stock_parts/capacitor/one_star = 2,
		/obj/item/stock_parts/matter_bin/one_star = 2,
		/obj/item/stock_parts/micro_laser/one_star = 2,
		/obj/item/stock_parts/scanning_module/one_star = 1,
		/obj/item/cell/large = 1
	)
