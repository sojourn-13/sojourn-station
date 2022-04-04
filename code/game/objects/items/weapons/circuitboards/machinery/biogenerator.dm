/obj/item/circuitboard/biogenerator
	build_name = "biogenerator"
	build_path = /obj/machinery/biogenerator
	board_type = "machine"
	origin_tech = list(TECH_DATA = 2)
	req_components = list(
		/obj/item/stock_parts/matter_bin = 1,
		/obj/item/stock_parts/manipulator = 1
	)

/obj/item/circuitboard/bullet_fab
	build_name = "bullet fabricator"
	build_path = /obj/machinery/bulletfabricator
	board_type = "machine"
	origin_tech = list(TECH_DATA = 4, TECH_MATERIAL = 6, TECH_ENGINEERING = 5, TECH_COMBAT = 9)
	req_components = list(
		/obj/item/stock_parts/matter_bin = 1,
		/obj/item/stock_parts/manipulator = 1
	)