#define TRADE_SYSTEM_IC_NAME "LS Automated Trading System"
GLOBAL_LIST_EMPTY(price_cache)
SUBSYSTEM_DEF(trade)
	name = "Trade"
	priority = SS_PRIORITY_SUPPLY
	flags = SS_NO_FIRE

	var/trade_stations_budget = 7 // Currently unused. This is the budget for stations with spawn_always = FALSE

	var/list/obj/machinery/trade_beacon/sending/beacons_sending = list()
	var/list/obj/machinery/trade_beacon/receiving/beacons_receiving = list()

	var/list/datum/trade_station/all_stations = list()
	var/list/datum/trade_station/discovered_stations = list()

	// For exports
	var/list/offer_types = list()						// List of offer datums
	var/list/hockable_tags = list(SPAWN_EXCELSIOR)		// List of spawn tags of hockable items
	var/list/junk_tags = list(SPAWN_JUNK)				// List of spawn tags of junk items

	// For tracking/logging
	var/export_invoice_number = 0
	var/shipping_invoice_number = 0
	var/offer_invoice_number = 0
	var/sell_invoice_number = 0

	var/list/export_log = list()
	var/list/order_log = list()
	var/list/offer_log = list()
	var/list/sell_log = list()

// === TRADE STATIONS ===

/datum/controller/subsystem/trade/proc/DiscoverAllTradeStations()
	discovered_stations = all_stations.Copy()

/datum/controller/subsystem/trade/Initialize()
	InitStations()
	. = ..()

/datum/controller/subsystem/trade/proc/ReInitStations()
	DeInitStations()
	InitStations()

/datum/controller/subsystem/trade/Destroy()
	DeInitStations()
	. = ..()

/datum/controller/subsystem/trade/proc/DeInitStations()
	for(var/datum/trade_station/s in all_stations)
		s.regain_trade_stations_budget()
		qdel(s)
		discovered_stations -= s
		all_stations -= s

/datum/controller/subsystem/trade/proc/InitStations()
	var/list/weightstationlist = collect_trade_stations()
	var/list/stations2init = collect_spawn_always()

	while(trade_stations_budget && length(weightstationlist))
		var/datum/trade_station/station_instance = pickweight(weightstationlist)
		if(istype(station_instance))
			stations2init += station_instance
			station_instance.cost_trade_stations_budget()
		weightstationlist.Remove(station_instance)
	init_stations_by_list(stations2init)

// Add a random trading station after the start of the round among pool of stations not already spawned
/datum/controller/subsystem/trade/proc/AddStation(var/turf/station_loc)
	var/list/availablestationlist = collect_available_trade_stations()

	if(length(availablestationlist))
		var/datum/trade_station/station_instance = pickweight(availablestationlist)
		if(istype(station_instance))
			station_instance.init_src(station_loc, TRUE)  // Spawn at custom location with discovered status

/datum/controller/subsystem/trade/proc/collect_trade_stations()
	. = list()
	for(var/path in subtypesof(/datum/trade_station))
		var/datum/trade_station/s = new path()
		if(!s.spawn_always && s.spawn_probability)
			.[s] = s.spawn_probability
		else
			qdel(s)

/datum/controller/subsystem/trade/proc/collect_spawn_always()
	. = list()
	for(var/path in subtypesof(/datum/trade_station))
		var/datum/trade_station/s = new path()
		if(s.spawn_always)
			. += s
		else
			qdel(s)

// Get a weighted list of all stations that have not already been spawned
/datum/controller/subsystem/trade/proc/collect_available_trade_stations()
	. = list()
	for(var/path in subtypesof(/datum/trade_station))
		var/is_available = TRUE
		for(var/datum/trade_station/S in SStrade.all_stations)
			if(istype(S, path))
				is_available = FALSE
		if(is_available)
			var/datum/trade_station/s = new path()
			if(s.spawn_probability)
				. += s
			else
				qdel(s)

/datum/controller/subsystem/trade/proc/init_station(stype)
	var/datum/trade_station/station
	if(istype(stype, /datum/trade_station))
		station = stype
		if(!station.name)
			station.init_src()
	else if(ispath(stype, /datum/trade_station))
		station = new stype(TRUE)
	. = station

/datum/controller/subsystem/trade/proc/init_stations_by_list(list/L)
	. = list()
	for(var/i in try_json_decode(L))
		var/a = init_station(i)
		if(a)
			. += a

/datum/controller/subsystem/trade/proc/discover_by_uid(list/uid_list)
	for(var/target_uid in uid_list)
		for(var/datum/trade_station/station in all_stations)
			if(station.uid == target_uid)
				station.recommendations_needed -= 1
				if(!station.recommendations_needed)
					discovered_stations |= station

// === PRICING ===

// Returns cost of an existing object including contents
/datum/controller/subsystem/trade/proc/get_cost(atom/movable/target, is_export = FALSE)
	. = 0
	for(var/atom/movable/A in target.GetAllContents(includeSelf = TRUE))
		. += A.get_item_cost(is_export)

//Returns cost of a newly created object including contents
/datum/controller/subsystem/trade/proc/get_new_cost(path)
	if(!ispath(path))
		var/atom/movable/A = path
		if(istype(A))
			path = A.type
		else
			. = 0
			CRASH("Unacceptable get_new_cost() by path ([path]) and type ([A?.type]).")

	if(!GLOB.price_cache[path])
		var/atom/movable/AM = new path
		GLOB.price_cache[path] = get_cost(AM)
		qdel(AM)
	return GLOB.price_cache[path]

/datum/controller/subsystem/trade/proc/get_price(atom/movable/target, is_export = FALSE)
	. = round(get_cost(target, is_export))

/datum/controller/subsystem/trade/proc/get_sell_price(path, datum/trade_station/station, price)
	var/selling_price = round(get_new_cost(path) * station.markdown)
	if(selling_price <= 0)
		selling_price = price * station.markdown
	. = selling_price

/datum/controller/subsystem/trade/proc/get_import_cost(path, datum/trade_station/station)
	. = station?.get_good_price(path)								// get_good_price() gets the custom price of the item, if it exists
	if(!.)
		. = get_new_cost(path) ? get_new_cost(path) : 100			// Should solve the issue of items without price tags
		if(istype(station))
			. *= station.markup

// === IMPORT/EXPORT ===

// Checks item stacks amd item containers to see if they match their base states (no more selling empty first-aid kits or split item stacks as if they were full)
// Checks reagent containers to see if they match their base state or if they match the special offer from a station
/datum/controller/subsystem/trade/proc/check_offer_contents(item, offer_path)
	if(istype(item, /obj/item/reagent_containers))
		var/obj/item/reagent_containers/current_container = item
		var/datum/reagent/target_reagent = offer_path
		var/target_volume = 60										// Each good requested in a reagent offer is a 60u container (container type is irrelevant)

		if(!ispath(offer_path, /datum/reagent))
			if(istype(item, /obj/item/reagent_containers/food))		// Food check (needed because contents are populated using something other than preloaded_reagents)
				return TRUE

			if(istype(item, /obj/item/reagent_containers/blood))	// Blood pack check (needed because contents are populated using something other than preloaded_reagents)
				if(current_container.reagents?.reagent_list[1]?.id == "blood" && current_container.reagents?.reagent_list[1]?.volume >= 200)
					return TRUE

			if(current_container.preloaded_reagents?.len < 1)		// If a new instance of the container does not start with reagents and the offer is not a reagent, pass
				return TRUE

		if(!current_container.reagents)								// If the previous check fails, we are looking for a container with reagents or a specific reagent
			return FALSE											// If the container is empty, fail

		for(var/datum/reagent/current_reagent in current_container.reagents?.reagent_list)
			if(current_reagent.volume >= target_volume && istype(current_reagent, target_reagent))		// Check volume and reagent type
				return TRUE

		return FALSE

	if(ispath(offer_path, /datum/reagent))		// If item is not of the types checked and the offer is for a reagent, fail
		return FALSE

	return TRUE

/datum/controller/subsystem/trade/proc/assess_offer(obj/machinery/trade_beacon/sending/beacon, datum/trade_station/station, offer_path)
	if(QDELETED(beacon) || !station)
		return

	. = list()

	for(var/atom/movable/AM in beacon.get_objects())
		if(AM.anchored || !(istype(AM, offer_path) || ispath(offer_path, /datum/reagent)))
			continue
		if(!check_offer_contents(AM, offer_path))		// Check contents after we know it's the same type
			continue
		. += AM

/datum/controller/subsystem/trade/proc/fulfill_offer(obj/machinery/trade_beacon/sending/beacon, datum/money_account/account, datum/trade_station/station, offer_path)
	var/list/exported = assess_offer(beacon, station, offer_path)

	var/list/offer_content = station.special_offers[offer_path]
	var/offer_amount = text2num(offer_content["amount"])
	var/offer_price = text2num(offer_content["price"])
	if(!exported || length(exported) < offer_amount)
		return

	exported.Cut(offer_amount + 1)

	if(account)
		var/invoice_contents_info

		for(var/atom/movable/AM in exported)
			SEND_SIGNAL(src, COMSIG_TRADE_BEACON, AM)
			invoice_contents_info += "<li>[AM.name]<li/>"
			qdel(AM)

		var/credits_to_account = round(offer_price * 0.8)
		var/credits_to_lonestar = round(offer_price * 0.2)

		create_log_entry("Special Offer", account.get_name(), invoice_contents_info, offer_price)

		beacon.activate()
		var/datum/transaction/T = new(credits_to_account, account.get_name(), "Special deal", station.name)
		var/datum/transaction/TL = new(credits_to_lonestar, department_accounts[DEPARTMENT_LSS].get_name(), "Special deal", station.name)
		T.apply_to(account)
		TL.apply_to(department_accounts[DEPARTMENT_LSS])
		station.add_to_wealth(offer_price, TRUE)
		offer_content["amount"] = 0
		offer_content["price"] = 0
		station.special_offers[offer_path] = offer_content

/datum/controller/subsystem/trade/proc/collect_counts_from(list/shoplist)
	. = 0
	for(var/category_name in shoplist)
		var/category = shoplist[category_name]
		if(length(category))
			for(var/path in category)
				. += category[path]

/datum/controller/subsystem/trade/proc/collect_price_for_list(list/shoplist, datum/trade_station/tradeStation = null)
	. = 0
	for(var/category_name in shoplist)
		var/category = shoplist[category_name]
		if(length(category))
			for(var/path in category)
				. += get_import_cost(path, tradeStation) * category[path]

/datum/controller/subsystem/trade/proc/buy(obj/machinery/trade_beacon/receiving/senderBeacon, datum/money_account/account, list/shoplist, datum/trade_station/station)
	if(QDELETED(senderBeacon) || !istype(senderBeacon) || !account || !recursiveLen(shoplist) || !istype(station))
		return

	var/obj/structure/closet/crate/C
	var/count_of_all = collect_counts_from(shoplist)
	var/price_for_all = collect_price_for_list(shoplist, station)
	if(isnum(count_of_all) && count_of_all > 1)
		C = senderBeacon.drop(/obj/structure/closet/crate)
	if(price_for_all && get_account_credits(account) < price_for_all)
		return

	var/order_contents_info
	var/invoice_location

	for(var/category_name in shoplist)
		var/list/shoplist_category = shoplist[category_name]
		var/list/inventory_category = station.inventory[category_name]
		if(length(shoplist_category) && length(inventory_category))
			for(var/good_path in shoplist_category)
				var/count_of_good = shoplist_category[good_path] //in shoplist
				var/index_of_good = inventory_category.Find(good_path) //in inventory
				for(var/i in 1 to count_of_good)
					if(istype(C))
						new good_path(C)
					else
						var/atom/movable/new_item = senderBeacon.drop(good_path)
						invoice_location = new_item.loc
				if(isnum(index_of_good))
					station.set_good_amount(category_name, index_of_good, max(0, station.get_good_amount(category_name, index_of_good) - count_of_good))

				// invoice gen stuff
				var/atom/movable/AM = good_path
				var/list/good_packet = inventory_category[good_path]
				var/item_name = initial(AM.name)
				if(islist(good_packet))
					item_name = good_packet["name"] ? good_packet["name"] : item_name
				order_contents_info += "<li>[count_of_good]x [item_name]</li>"

	if(count_of_all > 1)
		invoice_location = C

	create_log_entry("Shipping", account.get_name(), order_contents_info, price_for_all, TRUE, invoice_location)

	station.add_to_wealth(price_for_all)	// can only buy from one station at a time
	charge_to_account(account.account_number, account.get_name(), "Purchase", station.name, price_for_all)

//SoJ semi edit, readds direct selling
/datum/controller/subsystem/trade/proc/sell_thing(obj/machinery/trade_beacon/sending/senderBeacon, datum/money_account/account, atom/movable/thing, datum/trade_station/station)
	if(QDELETED(senderBeacon) || !istype(senderBeacon) || !account || !istype(thing) || !istype(station))
		return

	var/cost = get_sell_price(thing, station)

	if(cost <= 0)
		cost = get_import_cost(thing, station)

	if(account)
		create_log_entry("Individial Sale", account.get_name(), "<li>[thing.name]</li>", cost)
		qdel(thing)
		senderBeacon.activate()

		var/datum/money_account/A = account
		var/datum/money_account/lonestar_account = department_accounts[DEPARTMENT_LSS]
		var/datum/transaction/TA = new(cost * 0.8, account.get_name(), "Sold item", station.name)
		var/datum/transaction/T = new(cost * 0.2, lonestar_account.get_name(), "Sold item", TRADE_SYSTEM_IC_NAME)
		T.apply_to(lonestar_account)
		TA.apply_to(A)
		station.add_to_wealth(cost)

/datum/controller/subsystem/trade/proc/export(obj/machinery/trade_beacon/sending/senderBeacon)
	if(QDELETED(senderBeacon) || !istype(senderBeacon))
		return

	var/invoice_contents_info
	var/cost = 0

	for(var/atom/movable/AM in senderBeacon.get_objects())
		if(isliving(AM))
			var/mob/living/L = AM
			L.apply_damages(0,5,0,0,0,5)
			continue
		if(AM.anchored)
			continue

		var/list/contents_incl_self = AM.GetAllContents(5, TRUE)
		var/invoice_contents_info

		// We go backwards, so it'll be innermost objects sold first
		for(var/atom/movable/item in reverseRange(contents_incl_self))
			var/item_price = get_price(item, TRUE)
			var/export_multiplier = get_export_price_multiplier(item)
			var/export_value = item_price * export_multiplier

			if(export_multiplier)
				invoice_contents_info += "<li>[item.name]</li>"
				cost += export_value
				SEND_SIGNAL(src, COMSIG_TRADE_BEACON, item)
				qdel(item)
			else
				item.forceMove(get_turf(AM))		// Should be the same tile

	if(invoice_contents_info)	// If no info, then nothing was exported
		create_log_entry("Export", account.get_name(), invoice_contents_info, cost, TRUE, senderBeacon.loc)

	senderBeacon.start_export()
	var/datum/money_account/lonestar_account = department_accounts[DEPARTMENT_LSS]
	var/datum/transaction/T = new(cost, lonestar_account.get_name(), "Export", TRADE_SYSTEM_IC_NAME)
	T.apply_to(lonestar_account)

/datum/controller/subsystem/trade/proc/get_export_price_multiplier(atom/movable/target)
	if(!target)
		return NONEXPORTABLE
	. = EXPORTABLE
	var/list/target_spawn_tags = params2list(target?.spawn_tags)
	var/list/target_junk_tags = target_spawn_tags & junk_tags
	var/list/target_hockable_tags = target_spawn_tags & hockable_tags

	if(istype(AM, /obj/item/paper/invoice))	// Don't export our invoices!
		return NONEXPORTABLE

	// Junk tags override hockable tags and offer types override both
	if(target_hockable_tags.len)
		. = HOCKABLE
	if(target_junk_tags.len)
		. = JUNK
	for(var/offer_type in offer_types)
		if(istype(target, offer_type))
			return NONEXPORTABLE

// === LOGGING ===

/datum/controller/subsystem/trade/proc/create_log_entry(type, ordering_account, contents, total_paid, create_invoice = FALSE, invoice_location = null)
	var/log_id

	switch(type)
		if("Shipping")
			log_id = "[++shipping_invoice_number]-S"
			order_log += list(log_id, ordering_account, contents, total_paid, time2text(world.time, "hh:mm"))
		if("Export")
			log_id = "[++export_invoice_number]-E"
			export_log += list(log_id, ordering_account, contents, total_paid * 0.8, total_paid * 0.2, time2text(world.time, "hh:mm"))
		if("Special Offer")
			log_id = "[++offer_invoice_number]-SO"
			offer_log += list(log_id, ordering_account, contents, total_paid, time2text(world.time, "hh:mm"))
		if("Individial Sale")
			log_id = "[++sell_invoice_number]-IS"
			sell_log += list(log_id, ordering_account, contents, total_paid, time2text(world.time, "hh:mm"))
		else
			return

	if(create_invoice && invoice_location && log_id)
		var/obj/item/paper/invoice/I = new(invoice_location)

		I.invoice_type = type
		I.invoice_id = log_id
		I.recipient = ordering_account
		I.invoice_contents = contents
		I.total_paid = total_paid
		I.build_invoice()

		if(type == "Shipping")
			var/obj/item/paper/invoice/internal_copy = I
			new internal_copy(invoice_location)
			internal_copy.is_internal_copy = TRUE
			internal_copy.build_invoice()

// === INVOICE ===

/obj/item/paper/invoice
	var/invoice_type
	var/invoice_id
	var/recipient
	var/invoice_contents
	var/total_paid
	var/is_internal_copy

/obj/item/paper/invoice/proc/build_invoice()
	name = "[lowertext(invoice_type)] invoice - #[invoice_id]"
	name += is_internal_copy ? " (internal)" : null

	info += "<h2>[invoice_type] Invoice</h2>"
	info += "<hr/>"
	info += "Invoice #[invoice_id]<br/>"
	info += is_internal_copy ? "--- FOR INTERNAL USE ONLY ---<br/>" : null
	info += invoice_type != "Shipping" && invoice_type ? "Recipient: [recipient]<br/>" : "Recipient: \[field\]<br/>"
	info += invoice_type == "Shipping" ? "Package Name: \[field\]<br/>" : null
	info += "Contents: <br/>"
	info += "<ul>"
	info += invoice_contents
	info += "</ul>"
	info += invoice_type == "Individial Sale" ? "Credits Paid To Recipient: [total_paid * 0.8]<br/>" : null
	info += invoice_type == "Individial Sale" ? "Credits Paid To Lonestar: [total_paid * 0.2]<br/>" : null
	info += is_internal_copy ? "Order Cost: [total_paid] credits<br/>" : null
	info += invoice_type == "Shipping" ? "Total Credits Paid: \[field\] credits<br/>" : null
	info += invoice_type == "Shipping" ? "<h4>Stamp below to confirm receipt of goods:</h4>" : null
	update_icon()

// === ECONOMY ===

// The proc that is called when the price is being asked for. Use this to refer to another object if necessary.
/atom/movable/proc/get_item_cost(export)
	. = price_tag
