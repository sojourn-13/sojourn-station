/obj/item/circuitboard/recharge_station
	build_name = "cyborg recharging station"
	build_path = /obj/machinery/recharge_station
	board_type = "machine"
	origin_tech = list(TECH_DATA = 3, TECH_ENGINEERING = 3, TECH_POWER = 3)
	req_components = list(
		/obj/item/stack/cable_coil = 5,
		/obj/item/stock_parts/capacitor = 2,
		/obj/item/stock_parts/manipulator = 2,
		/obj/item/cell/large = 1
	)

/obj/item/circuitboard/repair_station
	build_name = "cyborg auto-repair platform"
	build_path = /obj/machinery/repair_station
	board_type = "machine"
	origin_tech = list(TECH_DATA = 2, TECH_ENGINEERING = 4)
	req_components = list(
		/obj/item/stock_parts/manipulator = 3,
		/obj/item/stock_parts/scanning_module = 1,
	)
