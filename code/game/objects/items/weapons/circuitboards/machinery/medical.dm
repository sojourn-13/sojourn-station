/*/obj/item/weapon/circuitboard/autodoc
	build_name = "autodoc"
	build_path = /obj/machinery/autodoc
	board_type = "machine"
	origin_tech = list(TECH_DATA = 3, TECH_BIO = 3)
	req_components = list(
		/obj/item/weapon/stock_parts/scanning_module = 2,
		/obj/item/weapon/stock_parts/manipulator = 4,
		/obj/item/weapon/stock_parts/console_screen = 2,
		/obj/item/weapon/stock_parts/micro_laser = 2
)*/
/obj/item/weapon/circuitboard/sleeper
	build_name = "sleeper"
	build_path = /obj/machinery/sleeper
	board_type = "machine"
	origin_tech = list(TECH_BIO = 4)
	req_components = list(
		/obj/item/weapon/stock_parts/scanning_module = 2,
		/obj/item/weapon/stock_parts/manipulator = 2,
		/obj/item/weapon/stock_parts/console_screen = 1,
		/obj/item/weapon/stock_parts/micro_laser = 2,
		/obj/item/weapon/stock_parts/matter_bin = 1,
		/obj/item/weapon/reagent_containers/glass/beaker/large = 1
		)

/obj/item/weapon/circuitboard/sleeper/hyper
	build_name = "hyper-sleeper"
	build_path = /obj/machinery/sleeper/hyper
	board_type = "machine"
	origin_tech = list(TECH_BIO = 7)
	req_components = list(
		/obj/item/weapon/stock_parts/scanning_module = 4,
		/obj/item/weapon/stock_parts/manipulator = 5,
		/obj/item/weapon/stock_parts/console_screen = 1,
		/obj/item/weapon/stock_parts/micro_laser = 3,
		/obj/item/weapon/stock_parts/matter_bin = 1,
		/obj/item/weapon/reagent_containers/glass/beaker/large = 1
		)
