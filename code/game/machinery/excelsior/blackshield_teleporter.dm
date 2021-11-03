var/list/global/blackshield_teleporters = list() //This list is used to make turrets more efficient
var/global/blackshield_energy
var/global/blackshield_max_energy //Maximaum combined energy of all teleporters

/obj/machinery/blackshield_teleporter
	name = "blackshield short-range teleporter"
	desc = "A teleporter form made by the GP AI under the watchful eye of SI as they recrate a safe short range teleporter for \
	blackshield to quickly send down and up items at the cost of a lot of power, time and requested items."
	density = TRUE
	anchored = TRUE
	icon = 'icons/obj/machines/excelsior/blackshield_teleporter.dmi'
	icon_state = "idle"
	use_power = IDLE_POWER_USE
	idle_power_usage = 40
	active_power_usage = 15000
	circuit = /obj/item/circuitboard/blackshield_teleporter

	var/max_energy = 2500
	var/processing_order = FALSE
	var/nanoui_menu = 0 	// Based on Uplink
	var/mob/current_user
	var/time_until_scan
	var/engery_amout = 0 //We start at zero, no grants yet!

	var/list/nanoui_data = list()			// Additional data for NanoUI use
	var/list/materials_list = list(
		MATERIAL_STEEL = list("amount" = 15, "price" = 50), //base prices doubled untill new item are in
		MATERIAL_WOOD = list("amount" = 15, "price" = 15),
		MATERIAL_PLASTIC = list("amount" = 15, "price" = 50),
		MATERIAL_GLASS = list("amount" = 15, "price" = 50),
		MATERIAL_PLASTEEL = list("amount" = 10, "price" = 250)
		)

	var/list/parts_list = list(
		/obj/item/gun/projectile/automatic/slaught_o_matic = 15, //So blackshiled can trade with propis :P
		/obj/item/gun/projectile/boltgun = 50,
		/obj/item/ammo_magazine/speed_loader_rifle_75 = 30, //More or less for ammo rather then speedloader
		/obj/item/gun/projectile/colt/NM_colt = 70,
		/obj/item/ammo_magazine/highcap_pistol_35 = 25, //Idea with this is your sending up the mag more then ammo
		/obj/item/gun/projectile/automatic/sts/lrifle = 200,
		/obj/item/ammo_magazine/light_rifle_257_short = 60,
		/obj/item/gun/projectile/automatic/sts/rifle = 300,
		/obj/item/ammo_magazine/rifle_75_short = 90,
		/obj/item/gun/projectile/automatic/sts/hrifle = 500,
		/obj/item/ammo_magazine/heavy_rifle_408 = 120,
		/obj/item/gun/projectile/automatic/basstet = 250,
		/obj/item/ammo_magazine/light_rifle_257 = 100,
		/obj/item/clothing/suit/space/void/security/odst/mil = 300,
		/obj/item/clothing/suit/space/void/odst/corps = 300,
		/obj/item/tool/baton = 200,
		/obj/item/storage/firstaid/surgery/traitor = 500, //Advanced tools inside
		/obj/item/clothing/suit/space/void/SCAF/blackshield = 1250 //One of the best things we can get
		)
	var/entropy_value = 1 //It is still bluespace


/obj/machinery/complant_teleporter/Initialize()
	blackshield_teleporters |= src
	.=..()

/obj/machinery/complant_teleporter/Destroy()
	blackshield_teleporters -= src
	RefreshParts() // To avoid energy overfills if a teleporter gets destroyed
	.=..()

/obj/machinery/blackshield_teleporter/RefreshParts()
	var/man_rating = 0
	var/man_amount = 0
	for(var/obj/item/stock_parts/manipulator/M in component_parts)
		man_rating += M.rating
		entropy_value = initial(entropy_value)/M.rating
		man_amount++

	// +50% speed for each upgrade tier
	var/coef = 1 + (((man_rating / man_amount) - 1) / 2)

	active_power_usage = initial(active_power_usage) * coef

	var/obj/item/cell/C = locate() in component_parts
	if(C)
		max_energy = C.maxcharge //Big buff for max energy
		for (var/obj/machinery/complant_teleporter/t in blackshield_teleporters)
			blackshield_max_energy += t.max_energy
		blackshield_energy = min(blackshield_energy, blackshield_max_energy)


/obj/machinery/complant_teleporter/update_icon()
	overlays.Cut()

	if(panel_open)
		overlays += image("panel")

	if(stat & (BROKEN|NOPOWER))
		icon_state = "off"
	else
		icon_state = initial(icon_state)


/obj/machinery/complant_teleporter/attackby(obj/item/I, mob/user)
	if(default_deconstruction(I, user))
		return
	..()

/obj/machinery/complant_teleporter/power_change()
	..()
	SSnano.update_uis(src) // update all UIs attached to src

/obj/machinery/blackshield_teleporter/Process()
	if(stat & (BROKEN|NOPOWER))
		return

	if(blackshield_energy < blackshield_max_energy)
		SSnano.update_uis(src)
	else
		blackshield_energy = blackshield_max_energy
		use_power = IDLE_POWER_USE


/obj/machinery/blackshield_teleporter/ex_act(severity)
	switch(severity)
		if(1)
			qdel(src)
			return
		if(2)
			if (prob(50))
				qdel(src)
				return

 /**
  * The ui_interact proc is used to open and update Nano UIs
  * If ui_interact is not used then the UI will not update correctly
  * ui_interact is currently defined for /atom/movable
  *
  * @param user /mob The mob who is interacting with this ui
  * @param ui_key string A string key to use for this ui. Allows for multiple unique uis on one obj/mob (defaut value "main")
  *
  * @return nothing
  */
/obj/machinery/blackshield_teleporter/ui_interact(mob/user, ui_key = "main", datum/nanoui/ui = null, force_open = NANOUI_FOCUS)
	if(stat & (BROKEN|NOPOWER)) return
	if(user.stat || user.restrained()) return

	var/list/data = ui_data()

	time_until_scan = time2text((1800 - ((world.time - round_start_time) % 1800)), "mm:ss")

	ui = SSnano.try_update_ui(user, src, ui_key, ui, data, force_open)
	if (!ui)
		ui = new(user, src, ui_key, "excelsior_teleporter.tmpl", name, 390, 450) //Todo:make a blackshield backround
		ui.set_initial_data(data)
		ui.open()

/obj/machinery/blackshield_teleporter/ui_data()
	var/list/data = list()
	data["energy"] = round(blackshield_energy)
	data["maxEnergy"] = round(blackshield_max_energy)
	data["menu"] = nanoui_menu
	data["time_until_scan"] = time_until_scan
	data += nanoui_data

	var/list/order_list_m = list()
	for(var/item in materials_list)
		order_list_m += list(
			list(
				"title" = material_display_name(item),
				"amount" = materials_list[item]["amount"],
				"price" = materials_list[item]["price"],
				"commands" = list("order" = item)
				)
			) // list in a list because Byond merges the first list...

	data["materials_list"] = order_list_m

	var/list/order_list_p = list()
	for(var/item in parts_list)
		var/obj/item/I = item
		order_list_p += list(
			list(
				"name_p" = initial(I.name),
				"price_p" = parts_list[item],
				"commands_p" = list("order_p" = item)
			)
		)

	data["list_of_parts"] = order_list_p

	return data


/obj/machinery/blackshield_teleporter/Topic(href, href_list) //For the time being this will have to stay as exl looking.
	if(stat & (NOPOWER|BROKEN))
		return 0 // don't update UIs attached to this object

	if(processing_order)
		return 0

	if(href_list["order"])
		var/ordered_item = href_list["order"]
		if (materials_list.Find(ordered_item))
			var/order_energy_cost = materials_list[ordered_item]["price"]
			var/order_path = material_stack_type(ordered_item)
			var/order_amount = materials_list[ordered_item]["amount"]
			send_order(order_path, order_energy_cost, order_amount)

	if(href_list["order_p"])
		var/ordered_item = text2path(href_list["order_p"])
		if (parts_list.Find(ordered_item))
			var/order_energy_cost = parts_list[ordered_item]
			send_order(ordered_item, order_energy_cost, 1)

	if(href_list["open_menu"])
		nanoui_menu = 1

	if(href_list["close_menu"])
		nanoui_menu = 0

	add_fingerprint(usr)
	update_nano_data()
	return 1 // update UIs attached to this object


/obj/machinery/blackshield_teleporter/proc/update_nano_data()
	nanoui_data["menu"] = nanoui_menu
	if (nanoui_menu == 1)
		var/list/available_mandates = list()
		var/list/completed_mandates = list()
		for(var/datum/antag_contract/M in GLOB.blackshield_antag_contracts)
			var/list/entry = list(list(
				"name" = M.name,
				"desc" = M.desc,
				"reward" = M.reward,
				"status" = M.completed ? "Fulfilled" : "Available"
			))
			if(!M.completed)
				available_mandates.Add(entry)
			else
				completed_mandates.Add(entry)
		nanoui_data["available_mandates"] = available_mandates
		nanoui_data["completed_mandates"] = completed_mandates

/obj/machinery/blackshield_teleporter/proc/send_order(order_path, order_cost, amount)
	if(order_cost > blackshield_energy)
		to_chat(usr, SPAN_WARNING("Not enough energy."))
		return 0

	processing_order = TRUE
	blackshield_energy = max(blackshield_energy - order_cost, 0)
	flick("teleporting", src)
	spawn(17)
		complete_order(order_path, amount)

/obj/machinery/blackshield_teleporter/proc/complete_order(order_path, amount)
	use_power(active_power_usage * 3)
	new order_path(loc, amount)
	bluespace_entropy(entropy_value, get_turf(src))
	processing_order = FALSE

/obj/machinery/blackshield_teleporter/attackby(obj/item/I, mob/user)
	for(var/datum/antag_contract/blackshield/appropriate/M in GLOB.blackshield_antag_contracts)
		if(M.completed)
			continue
		if(M.target_type == I.type)
			I.Destroy()
			M.complete(user)
			flick("teleporting", src)
	..()

/obj/machinery/blackshield_teleporter/attack_hand(mob/user)
	if(stat & BROKEN)
		return
	current_user = user
	ui_interact(user)