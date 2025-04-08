// This machine turn ameridian crystals into liquid ameridian and put it in a bidon connected to it.
/obj/machinery/ameridian_refinery
	name = "ameridian refinery"
	desc = "Refine raw ameridian crystals into liquid ameridian for further processing."
	icon = 'icons/obj/machines/ameridian_refinery.dmi'
	icon_state = "refinery_base"
	density = TRUE
	anchored = TRUE
	layer = ABOVE_ALL_MOB_LAYER
	use_power = IDLE_POWER_USE
	anchor_type = /obj/structure/reagent_dispensers/bidon
	anchor_direction = WEST
	circuit = /obj/item/circuitboard/ameridian_refinery
	frame_type = FRAME_VERTICAL
	var/obj/structure/reagent_dispensers/bidon/Container
	var/crystal_worth = 8 // How much liquid ameridian is each solid crystal worth.

/obj/machinery/ameridian_refinery/New()
	..()
	create_reagents(6000)
	update_icon()

/obj/machinery/ameridian_refinery/update_icon()
	cut_overlays()
	add_overlay("liquid_overlay")
	add_overlay("refinery_top")
	add_overlay("glass_overlay")

/obj/machinery/ameridian_refinery/examine(mob/user)
	..()
	if(isghost(user))
		interact(user)

/obj/machinery/ameridian_refinery/attackby(obj/item/I, mob/user)

	if(default_deconstruction(I, user))
		return

	if(default_part_replacement(I, user))
		return

	if(istype(I, /obj/item/stack/material/ameridian))
		insert_item(I, user)

	updateDialog()

/obj/machinery/ameridian_refinery/on_deconstruction()
	var/obj/structure/reagent_dispensers/bidon/Bidon = locate() in component_parts
	if(Bidon && reagents.total_volume)
		reagents.trans_to_holder(Bidon.reagents, reagents.total_volume)
		Bidon.update_icon()
	remove_crystals(get_solid_ameridian()) // Eject all the crystals left in the refinery

/obj/machinery/ameridian_refinery/RefreshParts()
	var/obj/structure/reagent_dispensers/bidon/Bidon = locate() in component_parts
	if(Bidon && Bidon.reagents.total_volume)
		Bidon.reagents.trans_to_holder(src.reagents, Bidon.reagents.total_volume)
		reagents.maximum_volume = Bidon.reagents.maximum_volume
		Bidon.update_icon()

	var/man_rating = 0
	for(var/obj/item/stock_parts/manipulator/M in component_parts)
		man_rating += M.rating

	crystal_worth = man_rating + 8

/obj/machinery/ameridian_refinery/attack_hand(mob/user as mob)
	interact(user)
	return

// Those procs return the stuff inside the refinery and the bidon connected to it.
/obj/machinery/ameridian_refinery/proc/get_solid_ameridian()
	var/count = 0
	for(var/obj/item/stack/material/ameridian/AC in contents)
		count += AC.amount
	return count

// Return the amount of liquid ameridian we currently have
/obj/machinery/ameridian_refinery/proc/get_liquid_ameridian()
	return reagents.get_reagent_amount(MATERIAL_AMERIDIAN)

// Return the amount of ameridian the bidon has.
/obj/machinery/ameridian_refinery/proc/get_bidon_ameridian()
	return Container?.reagents.get_reagent_amount(MATERIAL_AMERIDIAN)

// This proc turn solid ameridian into its liquid counterpart.
/obj/machinery/ameridian_refinery/proc/process_crystals()
	for(var/obj/item/stack/material/ameridian/AC in contents)
		while(AC.amount >= 1)
			if(reagents.maximum_volume - reagents.total_volume < crystal_worth)
				return
			reagents.add_reagent(MATERIAL_AMERIDIAN, crystal_worth) // Create liquid ameridian
			AC.use(1) // Use one crystal

// Transfer all of the liquid ameridian that we can
/obj/machinery/ameridian_refinery/proc/transfer_to_bidon()
	if(Container)
		var/free_space = Container.reagents.get_free_space()
		reagents.trans_to_holder(Container.reagents, free_space > reagents.total_volume ? reagents.total_volume : free_space)
		Container.update_icon()
	return

// This proc search for nearby anchored BIDONS
/obj/machinery/ameridian_refinery/proc/search_bidons()
	for(var/obj/structure/reagent_dispensers/bidon/B in range(1, src))
		if(B.anchored_machine == src)
			Container = B
			return
	Container = null // This should only happen if there was no anchored BIDONs nearby

// Eject a given number of Ameridian Shards.
/obj/machinery/ameridian_refinery/proc/remove_crystals(var/amount = 0)
	if(amount < 1)
		return

	var/amount_to_eject = (amount > get_solid_ameridian() ? get_solid_ameridian() : amount)
	var/obj/item/stack/material/ameridian/Current_Sheet = new(get_turf(src))
	var/use_extra_sheet = TRUE // We need to use an extra sheet to compensate for the one that come with the object we spawned
	while(amount_to_eject)
		if(Current_Sheet?.get_amount() >= Current_Sheet?.get_max_amount())
			Current_Sheet = null
		if(!Current_Sheet)
			Current_Sheet = new(get_turf(src))
			use_extra_sheet = TRUE
		for(var/obj/item/stack/material/ameridian/AC in contents)
			if(use_extra_sheet)
				AC.use(1) // We're using and not transfering because the destination has one sheet extra
				amount_to_eject--
				use_extra_sheet = FALSE
				break

			AC.transfer_to(Current_Sheet, 1)
			amount_to_eject--
			break


/obj/machinery/ameridian_refinery/interact(mob/user as mob)
	if((get_dist(src, user) > 1) || (stat & (BROKEN|NOPOWER)))
		if(!isAI(user) && !isghost(user))
			user.unset_machine()
			user << browse(null, "window=AMcontrol")
			return

	search_bidons()

	user.set_machine(src)

	var/dat = ""
	dat += "<head><title>Ameridian Refinery</title></head>"
	dat += "Ameridian Refinery<BR>"
	dat += "<A href='?src=\ref[src];close=1'>Close</A><BR>"
	dat += "<A href='?src=\ref[src];refresh=1'>Refresh</A><BR><BR>"
	dat += "Current quantity of solid ameridian : [get_solid_ameridian()].<BR>"
	if(get_solid_ameridian())
		dat += "<A href='?src=\ref[src];process=1'>Process Crystals</A><BR>"
		dat += "<A href='?src=\ref[src];eject=1'>Eject Crystals</A><BR>"
	else
		dat += "<BR><BR>"
	dat += "Current quantity of liquid ameridian : [get_liquid_ameridian()]/[reagents.maximum_volume].<BR>"

	if(Container)
		if(get_liquid_ameridian())
			dat += "<A href='?src=\ref[src];transfer=1'>Transfer to connected Bidon</A><BR>"
		else
			dat += "<BR>"
		dat += "Current Bidon Capacity : [Container.reagents.total_volume]/[Container.reagents.maximum_volume].<BR>"
	else
		dat += "No Bidon connected. Please connect a Bidon to start the transfer.<BR>"

	user << browse(dat, "window=AmeridianRefinery")
	onclose(user, "AmeridianRefinery")
	return

/obj/machinery/ameridian_refinery/Topic(href, href_list)
	if(isghost(usr)) // Ghosts can't do shit
		return

	//Ignore input if we are broken or guy is not touching us, AI can control from a ways away
	if(stat & (BROKEN|NOPOWER) || (get_dist(src, usr) > 1 && !isAI(usr)))
		usr.unset_machine()
		usr << browse(null, "window=AmeridianRefinery")
		return

	..()

	if(href_list["close"])
		usr << browse(null, "window=AmeridianRefinery")
		usr.unset_machine()
		return

	if(href_list["process"])
		process_crystals()

	if(href_list["transfer"])
		transfer_to_bidon()

	if(href_list["eject"])
		remove_crystals(input(usr, "How many crystals do you want to remove?", "Remove crystals", 0) as null|num)

	updateDialog()
	return
