#define GOODS_SCREEN TRUE
#define OFFER_SCREEN FALSE
#define PRGSCREEN_MAIN TRUE
#define PRGSCREEN_TREE FALSE
/datum/computer_file/program/trade_catalog
	filename = "trade_catalog"
	filedesc = "LSS\'s Trade Catalog"
	extended_desc = "Electronic handbook containing inventory information about discovered trade beacons."
	program_icon_state = "generic"
	program_key_state = "generic_key"
	size = 2
	available_on_ntnet = 1
	nanomodule_path = /datum/nano_module/program/trade_catalog
	usage_flags = PROGRAM_ALL

	var/prg_screen = PRGSCREEN_TREE
	var/trade_screen = GOODS_SCREEN
	var/chosen_category
	var/datum/trade_station/station

/datum/computer_file/program/trade_catalog/proc/set_chosen_category(value)
	chosen_category = value

/datum/computer_file/program/trade_catalog/Topic(href, href_list)
	. = ..()
	if(.)
		return

	if(href_list["PRG_goods_category"])
		if(!chosen_category || !(chosen_category in station.inventory))
			set_chosen_category()
		set_chosen_category((text2num(href_list["PRG_goods_category"]) <= length(station.inventory)) ? station.inventory[text2num(href_list["PRG_goods_category"])] : "")
		return TRUE

	if(href_list["PRG_prg_screen"])
		prg_screen = !prg_screen
		return TRUE

	if(href_list["PRG_trade_screen"])
		trade_screen = !trade_screen
		return TRUE

	if(href_list["PRG_station"])
		var/datum/trade_station/S = SStrade.get_discovered_station_by_uid(href_list["PRG_station"])
		if(!S)
			return
		station = S
		return TRUE

/datum/nano_module/program/trade_catalog
	name = "Trade Catalog"

/datum/nano_module/program/trade_catalog/nano_ui_interact(mob/user, ui_key = "main", datum/nanoui/ui = null, force_open = NANOUI_FOCUS, state = GLOB.default_state)
	var/list/data = ui_data(user)
	ui = SSnano.try_update_ui(user, src, ui_key, ui, data, force_open)
	if(!ui)
		ui = new(user, src, ui_key, "trade_catalog.tmpl", name, 640, 700, state = state)
		ui.set_auto_update(TRUE)
		ui.set_initial_data(data)
		ui.open()

/datum/nano_module/program/trade_catalog/ui_data()
	. = ..()
	var/datum/computer_file/program/trade_catalog/PRG = program
	if(!istype(PRG))
		return

	.["prg_screen"] = PRG.prg_screen
	.["tradescreen"] = PRG.trade_screen

	if(PRG.station)
		.["station_name"] = PRG.station.name
		.["station_desc"] = PRG.station.desc
		.["station_index"] = SStrade.discovered_stations.Find(PRG.station)
		.["station_id"] = PRG.station.uid
		.["offer_time"] = time2text( (PRG.station.update_time - (world.time - PRG.station.update_timer_start)) , "mm:ss")

	if(PRG.prg_screen == PRGSCREEN_TREE)
		var/list/line_list = list()
		var/list/trade_tree = list()

		for(var/station in SStrade.all_stations)
			var/datum/trade_station/TS = station
			var/is_discovered = (locate(TS) in SStrade.discovered_stations) ? TRUE : FALSE
			var/list/trade_tree_data = list(
				"id" =				"[TS.uid]",
				"name" =			"[TS.name]",
				"description" =		"[TS.desc]",
				"is_discovered" =	"[is_discovered]",
				"x" =				round(TS.tree_x*100),
				"y" =				round(TS.tree_y*100),
				"icon" =			"[TS.icon_states[2 - is_discovered]]"
			)
			trade_tree += list(trade_tree_data)

			if(TS.stations_recommended.len)
				for(var/id in TS.stations_recommended)
					if(!istext(id))
						break
					var/datum/trade_station/RS = SStrade.get_station_by_uid(id)
					if(RS)
						var/line_x = (min(round(RS.tree_x*100), round(TS.tree_x*100)))
						var/line_y = (min(round(RS.tree_y*100), round(TS.tree_y*100)))
						var/width = (abs(round(RS.tree_x*100) - round(TS.tree_x*100)))
						var/height = (abs(round(RS.tree_y*100) - round(TS.tree_y*100)))

						var/istop = FALSE
						if(RS.tree_y > TS.tree_y)
							istop = TRUE
						var/isright = FALSE
						if(RS.tree_x < TS.tree_x)
							isright = TRUE

						var/list/line_data = list(
							"line_x" =           line_x,
							"line_y" =           line_y,
							"width" =            width,
							"height" =           height,
							"istop" =            istop,
							"isright" =          isright,
						)
						line_list += list(line_data)

		.["trade_tree"] = trade_tree
		.["tree_lines"] = line_list

	if(PRG.prg_screen == PRGSCREEN_MAIN)
		if(PRG.station)
			if(!PRG.chosen_category || !(PRG.chosen_category in PRG.station.inventory))
				PRG.set_chosen_category()
			.["current_category"] = PRG.chosen_category ? PRG.station.inventory.Find(PRG.chosen_category) : null
			.["goods"] = list()
			.["categories"] = list()
			for(var/i in PRG.station.inventory)
				if(istext(i))
					.["categories"] += list(list("name" = i, "index" = PRG.station.inventory.Find(i)))
			if(PRG.chosen_category)
				var/list/assort = PRG.station.inventory[PRG.chosen_category]
				if(islist(assort))
					for(var/path in assort)
						if(!ispath(path, /atom/movable))
							continue
						var/atom/movable/AM = path

						var/index = assort.Find(path)

						var/amount = PRG.station.get_good_amount(PRG.chosen_category, index)

						var/pathname = initial(AM.name)
						var/list/good_packet = assort[path]
						if(islist(good_packet))
							pathname = good_packet["name"] ? good_packet["name"] : pathname

						.["goods"] += list(list(
							"name" = pathname,
							"amount_available" = amount,
							"index" = index
						))
			if(!recursiveLen(.["goods"]))
				.["goods"] = null

			.["offers"] = list()
			for(var/offer_path in PRG.station.special_offers)
				var/path = offer_path
				var/list/offer_content = PRG.station.special_offers[offer_path]
				var/list/offer = list(
					"station" = PRG.station.name,
					"name" = offer_content["name"],
					"amount" = offer_content["amount"],
					"index" = SStrade.discovered_stations.Find(PRG.station),
					"path" = path,
				)
				.["offers"] += list(offer)

			if(!recursiveLen(.["offers"]))
				.["offers"] = null

#undef GOODS_SCREEN
#undef OFFER_SCREEN
#undef PRGSCREEN_MAIN
#undef PRGSCREEN_TREE
