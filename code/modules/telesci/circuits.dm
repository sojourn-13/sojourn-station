/obj/item/circuitboard/telesci_pad
	build_name = "advanced telepad"
	build_path = /obj/machinery/telesci_pad
	board_type = "machine"
	origin_tech = list(TECH_DATA = 4, TECH_ENGINEERING = 3, TECH_MATERIAL = 3, TECH_BLUESPACE = 4)

	req_components = list(
		/obj/item/bluespace_crystal/artificial = 2,
		/obj/item/stock_parts/capacitor = 1
	)

/obj/item/circuitboard/telesci_console
	build_name = "Telescience Console"
	build_path = /obj/machinery/computer/telesci_console
	origin_tech = list(TECH_DATA = 3, TECH_BLUESPACE = 2)

/obj/item/circuitboard/telesci_relay
	build_name = "telepad relay"
	board_type = "machine"
	build_path = /obj/machinery/telesci_relay
	origin_tech = list(TECH_DATA = 4, TECH_ENGINEERING = 3, TECH_BLUESPACE = 3)

	req_components = list(
		/obj/item/stock_parts/manipulator = 1,
		/obj/item/stock_parts/micro_laser = 1
	)

/obj/item/circuitboard/tele_inhibitor
	build_name = "bluespace inhibitor"
	build_path = /obj/machinery/telesci_inhibitor
	board_type = "machine"
	origin_tech = list(TECH_MATERIAL = 2, TECH_POWER = 2, TECH_BLUESPACE = 2)

	req_components = list(
		/obj/item/stock_parts/subspace/ansible = 2
	)

/obj/item/circuitboard/tele_inhibitor/mini
	build_name = "mini bluespace inhibitor"
	build_path = /obj/machinery/telesci_inhibitor/mini
	board_type = "machine"
	origin_tech = list(TECH_MATERIAL = 2, TECH_POWER = 2, TECH_BLUESPACE = 2)

	req_components = list(
	/obj/item/stock_parts/subspace/ansible = 1
	)
