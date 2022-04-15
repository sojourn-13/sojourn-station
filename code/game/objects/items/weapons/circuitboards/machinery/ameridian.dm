/obj/item/circuitboard/ameridian_processor
	build_name = "ameridian processor"
	build_path = /obj/machinery/ameridian_processor
	board_type = "machine"
	origin_tech = list(TECH_DATA = 4, TECH_MATERIAL = 9, TECH_ENGINEERING = 5)
	req_components = list(
		/obj/item/stock_parts/matter_bin = 1,
		/obj/item/stock_parts/manipulator = 1
	)

/obj/item/circuitboard/ameridianshieldwallgen
	build_name = "sonic fence generator"
	board_type = "machine"
	build_path = /obj/machinery/shieldwallgen/ameridian
	origin_tech = list(TECH_BLUESPACE = 3, TECH_MAGNET = 3)
	req_components = list(
		/obj/item/stock_parts/subspace/transmitter = 1,
		/obj/item/stock_parts/subspace/crystal = 1,
		/obj/item/stock_parts/subspace/amplifier = 1,
		/obj/item/stock_parts/capacitor = 2,
		/obj/item/stack/cable_coil = 30
	)

/obj/item/circuitboard/ameridian_refinery
	name = "ameridian refinery"
	board_type = "machine"
	build_path = /obj/machinery/ameridian_refinery
	origin_tech = list(TECH_DATA = 4, TECH_MATERIAL = 9, TECH_ENGINEERING = 5)
	req_components = list(
		/obj/structure/reagent_dispensers/bidon = 1
	)
