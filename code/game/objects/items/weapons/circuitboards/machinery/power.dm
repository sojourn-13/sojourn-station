/obj/item/circuitboard/smes
	build_name = "superconductive magnetic energy storage"
	build_path = /obj/machinery/power/smes/buildable
	board_type = "machine"
	origin_tech = list(TECH_POWER = 6, TECH_ENGINEERING = 4)
	req_components = list(
		/obj/item/stock_parts/smes_coil = 1,
		/obj/item/stack/cable_coil = 30
	)

/obj/item/circuitboard/batteryrack
	build_name = "battery rack PSU"
	build_path = /obj/machinery/power/smes/batteryrack
	board_type = "machine"
	origin_tech = list(TECH_POWER = 3, TECH_ENGINEERING = 2)
	req_components = list(
		/obj/item/cell/large = 3
	)

/obj/item/circuitboard/apc
	build_name = "power control module"
	icon = 'icons/obj/module.dmi'
	icon_state = "power_mod"
	desc = "Heavy-duty switching circuits for power control."
	flags = CONDUCT
	build_path = /obj/machinery/power/smes/batteryrack/makeshift
	board_type = "machine"
	req_components = list(
		/obj/item/cell/large = 3
	)
	matter = list(MATERIAL_PLASTIC = 2, MATERIAL_GLASS = 3)

/obj/item/circuitboard/antigrav
	build_name = "antigrav generator"
	build_path = /obj/machinery/antigrav
	board_type = "machine"
	origin_tech = list(TECH_ENGINEERING = 4, TECH_MAGNET = 4)
	req_components = list(
		/obj/item/stack/cable_coil = 30,
		/obj/item/stock_parts/subspace/crystal = 1,
		/obj/item/stock_parts/micro_laser = 3,
		/obj/item/stock_parts/capacitor = 3
	)

/obj/item/circuitboard/breakerbox
	build_name = "breaker box"
	build_path = /obj/machinery/power/breakerbox
	board_type = "machine"
	origin_tech = list(TECH_POWER = 4, TECH_ENGINEERING = 4)
	req_components = list(
			/obj/item/stock_parts/smes_coil = 1,
			/obj/item/stack/cable_coil = 10,
			/obj/item/stock_parts/capacitor = 1
		)

/obj/item/circuitboard/hydrogen_gen
	build_name = "hydrogen generator"
	build_path = /obj/machinery/power/hydrogen_gen
	board_type = "machine"
	origin_tech = list(TECH_DATA = 3, TECH_POWER = 3, TECH_PLASMA = 3, TECH_ENGINEERING = 3)
	req_components = list(
		/obj/item/stock_parts/micro_laser = 1,
		/obj/item/stock_parts/capacitor = 2,
		/obj/item/stock_parts/scanning_module = 1,
		/obj/item/stock_parts/manipulator = 1
	)


/obj/item/circuitboard/os_generator
	name = "fusion microgenerator"
	build_path = /obj/machinery/power/port_gen/os_generator
	board_type = "machine"
	origin_tech = list(TECH_DATA = 3, TECH_POWER = 5, TECH_ENGINEERING = 5)
	req_components = list(
		/obj/item/stock_parts/console_screen = 1,
		/obj/item/stock_parts/micro_laser/one_star = 1,		// If not OS, no output
		/obj/item/stack/cable_coil = 2,
		/obj/item/stock_parts/capacitor/one_star = 1			// If not OS, no output
	)