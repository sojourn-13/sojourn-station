
/obj/item/circuitboard/autodoc
	build_name = "autodoc"
	build_path = /obj/machinery/autodoc
	board_type = "machine"
	origin_tech = list(TECH_DATA = 3, TECH_BIO = 3)
	req_components = list(
		/obj/item/stock_parts/scanning_module = 2,
		/obj/item/stock_parts/manipulator = 4,
		/obj/item/stock_parts/console_screen = 2,
		/obj/item/stock_parts/micro_laser = 2
		)

/obj/item/circuitboard/sleeper
	build_name = "sleeper"
	build_path = /obj/machinery/sleeper
	board_type = "machine"
	origin_tech = list(TECH_BIO = 4)
	req_components = list(
		/obj/item/stock_parts/scanning_module = 2,
		/obj/item/stock_parts/manipulator = 2,
		/obj/item/stock_parts/console_screen = 1,
		/obj/item/stock_parts/micro_laser = 2,
		/obj/item/stock_parts/matter_bin = 1,
		/obj/item/reagent_containers/glass/beaker/large = 1
		)

/obj/item/circuitboard/sleeper/hyper
	build_name = "hyper-sleeper"
	desc = "An exceedingly rare and valuable bit of sleeper technology, so advanced that without proper maintenance it breaks down rather quickly, making it largely useless for longer than a single shift."
	build_path = /obj/machinery/sleeper/hyper
	board_type = "machine"
	origin_tech = list(TECH_BIO = 7)
	req_components = list(
		/obj/item/stock_parts/scanning_module = 4,
		/obj/item/stock_parts/manipulator = 5,
		/obj/item/stock_parts/console_screen = 1,
		/obj/item/stock_parts/micro_laser = 3,
		/obj/item/stock_parts/matter_bin = 1,
		/obj/item/reagent_containers/glass/beaker/large = 1
		)