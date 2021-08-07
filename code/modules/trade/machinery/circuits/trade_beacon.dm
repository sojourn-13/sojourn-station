/obj/item/circuitboard/trade_beacon
	origin_tech = list(TECH_BLUESPACE = 2)
	board_type = "machine"
	req_components = list(
		/obj/item/stock_parts/subspace/crystal = 1,
	)

/obj/item/circuitboard/trade_beacon/receiving
	name = "receiving trade beacon"
	build_path = /obj/machinery/trade_beacon/receiving

/obj/item/circuitboard/sending_beacon
	name = "sending trade beacon"
	build_path = /obj/machinery/trade_beacon/sending