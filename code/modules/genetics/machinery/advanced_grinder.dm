/*
===============================================================================================================================================
Advanced Reagent Grinder

A specialized Reagent Grinder that automatically processes items placed in a location south of it, and can optionally deposit it automatically
into a BIDON container to the east of it. It can even purge material that you don't want!

It is very goddamn convenient.

The bidon_filter variable has the following structure:

list(
	list("id"=reagent_id_1, "name"=reagent_name_1),
	list("id"=reagent_id_1, "name"=reagent_name_1)
)
===============================================================================================================================================
*/

/obj/machinery/reagentgrinder/advanced
	name = "Soteria Advanced Grinder"
	density = TRUE
	anchored = TRUE
	icon = 'icons/obj/machines/grinder.dmi'
	icon_state = "grinder_si"
	reagent_flags = NO_REACT
	circuit = /obj/item/circuitboard/advanced_grinder
	limit = 25
	nano_template = "advanced_grinder.tmpl"
	var/max_capacity = 3000

	//Bidon linked to the device
	var/obj/structure/reagent_dispensers/bidon/linked_bidon
	var/linked_bidon_loc

	anchor_direction = WEST //Direction the bidon can should be anchored in
	anchor_type = /obj/structure/reagent_dispensers/bidon //Allows a bidon can to be anchored to this.

	var/output_side = NORTH
	var/input_side = SOUTH //Direction input comes from


	var/list/bidon_filter = list() //Which reagents we are loading into the bidon, instead of keeping in the machine

/obj/item/circuitboard/advanced_grinder
	build_name = "Soteria Advanced Grinder"
	board_type = "machine"
	build_path = /obj/machinery/reagentgrinder/advanced
	origin_tech = list(TECH_BIO = 1)
	req_components = list(
		/obj/item/stock_parts/manipulator = 2,
		/obj/item/stock_parts/scanning_module = 1,
		/obj/item/stock_parts/matter_bin = 2
	)

/datum/design/research/circuit/advanced_grinder
	name = "Soteria Advanced Grinder"
	desc = "Invented by Dr. Belvoix to make her lab a little more tidy, this device is a strict upgrade to the Industrial Grinder. Supports automatic collection, and automatic dumping into a Bidon can."
	build_path = /obj/item/circuitboard/advanced_grinder
	category = CAT_MEDI

/obj/machinery/reagentgrinder/advanced/RefreshParts()
	var/man_rating = 0
	for(var/obj/item/stock_parts/manipulator/M in component_parts)
		man_rating += M.rating
	limit = (25 + (man_rating * 5))
	items_to_process = round(man_rating/2)

	var/bin_rating = 0
	for(var/obj/item/stock_parts/matter_bin/M in component_parts)
		bin_rating += M.rating
	max_capacity = 3000 * (bin_rating/2)


/obj/machinery/reagentgrinder/advanced/Initialize()
	. = ..()
	attempt_bidon_link()
	create_reagents(INFINITY)

/obj/machinery/reagentgrinder/advanced/Process()
	if(stat & (NOPOWER|BROKEN))
		return

	if(!linked_bidon)
		attempt_bidon_link()

	check_bidon_link()

	grind()

	grab()

/obj/machinery/reagentgrinder/advanced/proc/attempt_bidon_link()
	for(var/obj/structure/reagent_dispensers/bidon/adjacent_bidon in orange(1,src))
		if(adjacent_bidon.anchored_machine == src)
			linked_bidon = adjacent_bidon
			linked_bidon_loc = linked_bidon.loc
			SSnano.update_uis(src)

/obj/machinery/reagentgrinder/advanced/proc/check_bidon_link()
	if(linked_bidon && ((linked_bidon.loc != linked_bidon_loc) || !linked_bidon.anchored))
		bidon_filter = list()
		linked_bidon = null


/obj/machinery/reagentgrinder/advanced/attackby(obj/item/I, mob/user)
	if(istype(I, /obj/item/reagent_containers/borghypo) || istype(I, /obj/item/reagent_containers/spray)) //prevents borg items
		return
	..() //So we run the rest

/obj/machinery/reagentgrinder/advanced/proc/grab()
	if(holdingitems.len < limit)
		for(var/obj/object in get_step(src, input_side))
			if(holdingitems.len >= limit)
				break
			if(object.anchored)
				continue
			object.forceMove(src)
			if(!object.reagents || !object.reagents.total_volume)
				eject_invalid_object(object, output_side)
			else
				holdingitems += object


/obj/machinery/reagentgrinder/advanced/proc/eject_invalid_object(obj/O, output_dir)
	O.forceMove(get_step(src, output_dir))

/obj/machinery/reagentgrinder/advanced/update_icon()
	cut_overlays()

	if(panel_open)
		add_overlay(image(icon, "[icon_state]_p"))

/obj/machinery/reagentgrinder/advanced/nano_ui_data()
	var/list/data = ..()
	log_debug("advanced.nano_ui_data: Called function")
	data["reagents"] = reagents.nano_ui_data()

	var/bidon_is_linked = linked_bidon ? TRUE : FALSE
	data["bidon_linked"] = bidon_is_linked

	var/bidon_full = FALSE
	if(linked_bidon)
		if(linked_bidon.reagents.total_volume >= linked_bidon.volume)
			bidon_full = TRUE
	data["bidon_full"] = bidon_full

	data["bidon_filter"] = bidon_filter
	return data

/obj/machinery/reagentgrinder/advanced/Topic(href, href_list)
	if(..())
		return 1

	if(href_list["bottle"])
		var/amount = input(usr, "Enter how many bottles to dispense", "Bottles", 0)
		if(isnum(amount))
			var/i
			for(i=0, i<amount, i++)
				bottle(href_list["bottle"])
	if(href_list["filter"])
		if(linked_bidon)
			//Don't add this to the filter twice.
			for(var/list/reagent_data in bidon_filter)
				var/reagent_id = reagent_data["id"]
				if(reagent_id == href_list["filter"])
					return 1

			//Get the reagent name for the sake of our sanity
			var/reagent_name = ""
			for(var/reagent_raw in src.reagents.reagent_list)
				var/datum/reagent/reagent_defined = reagent_raw
				if(reagent_defined.id == href_list["filter"])
					reagent_name = reagent_defined.name

			//Add it to the filter
			bidon_filter.Add(list(list("id"=href_list["filter"], "name"=reagent_name)))

			//Add everything the first time around.
			src.reagents.trans_id_to(linked_bidon, href_list["filter"], reagents.get_reagent_amount(href_list["filter"]))

	if(href_list["unfilter"])
		for(var/list/reagent_data in bidon_filter)
			if(reagent_data["id"] == href_list["unfilter"])
				bidon_filter -= list(reagent_data)


	if(href_list["purge"])
		src.reagents.del_reagent(href_list["purge"])
	return 1

/obj/machinery/reagentgrinder/advanced/proc/bottle(id)
	if(reagents.has_reagent(id))
		var/obj/item/reagent_containers/glass/bottle/P = new(get_step(src, output_side))
		if(!reagents.trans_id_to(P, id, 60))
			qdel(P)
			return
		P.name = "[get_reagent_name_by_id(id)] bottle"
		P.pixel_x = rand(-7, 7)
		P.pixel_y = rand(-7, 7)
		//P.icon_state = pick(BOTTLE_SPRITES)
		P.toggle_lid()

/obj/machinery/reagentgrinder/advanced/proc/grind()
	var/i
	var/changed = FALSE
	var/filled_bidon = FALSE
	for(i = 0, i < items_to_process, i++)
		var/obj/item/I = locate() in holdingitems
		if(!I)
			break
		changed = TRUE
		if((src.reagents.total_volume + I.reagents.total_volume) <= max_capacity)
			grind_item(I, src.reagents)
		else
			eject_invalid_object(I, output_side)
			holdingitems -= I

		//TODO: Dispense liquid into a linked BIDON
		for(var/list/reagent_info in bidon_filter)
			var/reagent_id = reagent_info["id"]
			if (src.reagents.has_reagent(reagent_id))
				filled_bidon = TRUE
				reagents.trans_id_to(linked_bidon, reagent_id, reagents.get_reagent_amount(reagent_id))
	//Update the menu on grind
	if(changed)
		SSnano.update_uis(src)

	//Make sure the bidon icon is shown
	if(filled_bidon)
		linked_bidon.update_icon()