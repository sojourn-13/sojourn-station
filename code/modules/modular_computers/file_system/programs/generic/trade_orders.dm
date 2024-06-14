/datum/computer_file/program/trade/order
	filename = "trade_orders"
	filedesc = "LSS\'s Trade Order Requests"
	program_menu_icon = "truck-loading"
	nanomodule_path = /datum/nano_module/program/trade/order
	extended_desc = "Electronic handbook containing inventory information about discovered trade beacons. Trade orders can be requested using this."
	size = 2
	available_on_ntnet = TRUE
	clone_able = TRUE
	usage_flags = PROGRAM_ALL

	program_type = "ordering"	// master, slave, ordering

/datum/nano_module/program/trade/order
	name = "Trade Beacon Order Requests"
