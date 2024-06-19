// This machine turn ameridian crystals into liquid ameridian and put it in a bidon connected to it.
/obj/machinery/liquid_ameridian_processor
	name = "liquid ameridian processor"
	desc = "Convert Liquid Ameridian into multiple materials."
	icon = 'icons/obj/machines/grinder.dmi'
	icon_state = "ameridian_processor"
	density = TRUE
	anchored = TRUE
	layer = BELOW_OBJ_LAYER
	use_power = IDLE_POWER_USE
	anchor_type = /obj/structure/reagent_dispensers/bidon
	anchor_direction = WEST
	circuit = /obj/item/circuitboard/liquid_ameridian_processor
	var/obj/structure/reagent_dispensers/bidon/Container
	/*
	Current as of wrighting is balance is around t5 parts aka 50% reduction
	Meaning: 1 ameridain shard is worth 10, and 50% of 10 = 5 this 1 shards makes 2 steel
	Its balance this way to both encurage its use to fill in gaps when a drill is failing or to round out numbers when needed
	Ontop of it being able to be farmed semi-easily with an invest of 1 to 3 cores + time on return.
	- Trilby 8/24/2022
	*/
	var/outputs = list(
						list(name = "Steel", cost = 10, path = /obj/item/stack/material/steel),
						list(name = "Plastic", cost = 10, path = /obj/item/stack/material/plastic),
						list(name = "Glass", cost = 10, path = /obj/item/stack/material/glass),
						list(name = "Plasteel", cost = 50, path = /obj/item/stack/material/plasteel),
						list(name = "Silver", cost = 20, path = /obj/item/stack/material/silver),
						list(name = "Gold", cost = 20, path = /obj/item/stack/material/gold),
						list(name = "Platinum", cost = 60, path = /obj/item/stack/material/platinum),
						list(name = "Uranium", cost = 60, path = /obj/item/stack/material/uranium),
						list(name = "Plasma", cost = 60, path = /obj/item/stack/material/plasma),
						list(name = "Osmium", cost = 100, path = /obj/item/stack/material/osmium),
						list(name = "Diamonds", cost = 180, path = /obj/item/stack/material/diamond),
						list(name = "Metallic Hydrogen", cost = 180, path=/obj/item/stack/material/mhydrogen),
						list(name = "Tritium", cost = 180, path = /obj/item/stack/material/tritium),
						list(name = "Ameridian Core", cost = 1200, path=/obj/item/ameridian_core) //At t8 parts its 1:1
						)
	var/cost_modifier = 1

/obj/machinery/liquid_ameridian_processor/New()
	..()

/obj/machinery/liquid_ameridian_processor/examine(mob/user)
	..()
	if(isghost(user))
		interact(user)

/obj/machinery/liquid_ameridian_processor/attackby(obj/item/I, mob/user)

	if(default_deconstruction(I, user))
		return

	if(default_part_replacement(I, user))
		return

	..()

	updateDialog()

/obj/machinery/liquid_ameridian_processor/RefreshParts()
	var/man_rating = 0
	var/man_amount = 0
	for(var/obj/item/stock_parts/manipulator/M in component_parts)
		man_rating += M.rating
		man_amount++
	man_rating /= man_amount

	cost_modifier = man_rating

	if(cost_modifier < 0.2)
		cost_modifier = 0.2 //Sanity so we dont end up giving or being 0 costs

	updateDialog()

/obj/machinery/liquid_ameridian_processor/attack_hand(mob/user as mob)
	interact(user)
	return

// Return the amount of ameridian the bidon has.
/obj/machinery/liquid_ameridian_processor/proc/get_bidon_ameridian()
	return Container?.reagents.get_reagent_amount(MATERIAL_AMERIDIAN)

// Check if we have at least [amount] amount of liquid ameridian. It is different from get_bidon_ameridian() in that it only return TRUE or FALSE, and not the quantity of ameridian we have
/obj/machinery/liquid_ameridian_processor/proc/check_bidon_ameridian(var/amount)
	return Container?.reagents.has_reagent(MATERIAL_AMERIDIAN, amount)

// Use [amount] of liquid ameridian
/obj/machinery/liquid_ameridian_processor/proc/use_bidon_ameridian(var/amount)
	return check_bidon_ameridian(amount) ? Container?.reagents.remove_reagent(MATERIAL_AMERIDIAN, amount) : 0

// This proc search for nearby anchored BIDONS
/obj/machinery/liquid_ameridian_processor/proc/search_bidons()
	for(var/obj/structure/reagent_dispensers/bidon/B in range(1, src))
		if(B.anchored_machine == src)
			Container = B
			return
	Container = null // This should only happen if there was no anchored BIDONs nearby

/obj/machinery/liquid_ameridian_processor/interact(mob/user as mob)
	if((get_dist(src, user) > 1) || (stat & (BROKEN|NOPOWER)))
		if(!isAI(user) && !isghost(user))
			user.unset_machine()
			user << browse(null, "window=LiquidAmeridianProcessor")
			return

	search_bidons()

	user.set_machine(src)

	var/dat = ""
	dat += "<head><title>Liquid Ameridian Processor</title></head>"
	dat += "Liquid Ameridian Processor<BR>"
	dat += "<A href='?src=\ref[src];close=1'>Close</A><BR>"
	dat += "<A href='?src=\ref[src];refresh=1'>Refresh</A><BR><BR>"
	if(Container)
		dat += "Current quantity of liquid ameridian : [get_bidon_ameridian()].<BR><BR>"
		dat += mats_list_html()
	else
		dat += "No bidon detected. Please connect a bidon."

	user << browse(dat, "window=LiquidAmeridianProcessor")
	onclose(user, "LiquidAmeridianProcessor")
	return

/obj/machinery/liquid_ameridian_processor/Topic(href, href_list)
	if(isghost(usr)) // Ghosts can't do shit
		return

	//Ignore input if we are broken or guy is not touching us, AI can control from a ways away
	if(stat & (BROKEN|NOPOWER) || (get_dist(src, usr) > 1 && !isAI(usr)))
		usr.unset_machine()
		usr << browse(null, "window=LiquidAmeridianProcessor")
		return

	..()

	if(href_list["close"])
		usr << browse(null, "window=LiquidAmeridianProcessor")
		usr.unset_machine()
		return

	if(href_list["material"])
		var/list/L = list(path=text2path(href_list["material"]), cost=round(text2num(href_list["cost"])), amount=text2num(href_list["amount"]))
		var/L_path = L["path"]
		var/successful = FALSE
		for(var/path in outputs)
			if(path["path"] == L_path)
				successful = TRUE
				break
		if(L["cost"] <= 0 || L["amount"] <= 0 || L["amount"] > 120)
			successful = FALSE
		if(!successful)
			return

		if(use_bidon_ameridian((L["cost"]) * L["amount"])) // Check if we have enough liquid ameridian
			if(ispath(L["path"], /obj/item/stack/material)) // Material sheets are handled differently
				new L_path(get_turf(src), L["amount"])
			else
				for(var/i = 0, L["amount"] > i, i++) // Create 1 item at a time
					new L_path(get_turf(src))
		else
			ping("Not enough liquid ameridian.")

	updateDialog()
	return



// Output list format : list(name=[text], cost=[num], path=[path])
// name is the visible name of what we're trying to make.
// cost is how much liquid ameridian is used to make 1 object.
// path is the actual path of the object

/obj/machinery/liquid_ameridian_processor/proc/mats_list_html()
	var/dat = ""
	dat += "List of materials : <BR>"
	for(var/list/L in outputs)
		dat += "[L["name"]], cost : [L["cost"] / cost_modifier] Liquid Ameridian.<BR>"
		dat += "- Print : "
		dat += "[check_bidon_ameridian((L["cost"]/cost_modifier)*1) ? "<A href='?src=\ref[src];material=[L["path"]];cost=[L["cost"]/cost_modifier];amount=1'>x1</A>" : "Not enough liquid ameridian"]"
		dat += "[check_bidon_ameridian((L["cost"]/cost_modifier)*5) ? ", <A href='?src=\ref[src];material=[L["path"]];cost=[L["cost"]/cost_modifier];amount=5'>x5</A>" : ""]"
		dat += "[check_bidon_ameridian((L["cost"]/cost_modifier)*10) ? ", <A href='?src=\ref[src];material=[L["path"]];cost=[L["cost"]/cost_modifier];amount=10'>x10</A>" : ""]"
		dat += "[check_bidon_ameridian((L["cost"]/cost_modifier)*20) ? ", <A href='?src=\ref[src];material=[L["path"]];cost=[L["cost"]/cost_modifier];amount=20'>x20</A>" : ""]"
		dat += "[check_bidon_ameridian((L["cost"]/cost_modifier)*60) ? ", <A href='?src=\ref[src];material=[L["path"]];cost=[L["cost"]/cost_modifier];amount=60'>x60</A>" : ""]"
		dat += "[check_bidon_ameridian((L["cost"]/cost_modifier)*120) ? ", <A href='?src=\ref[src];material=[L["path"]];cost=[L["cost"]/cost_modifier];amount=120'>x120</A>" : ""]"
		dat += ".<BR><BR>"
	return dat
