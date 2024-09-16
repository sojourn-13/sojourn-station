/obj/machinery/biogenerator
	name = "biogenerator"
	desc = "A machine for processing biomass."
	icon = 'icons/obj/biogenerator.dmi'
	icon_state = "biogen-stand"
	density = 1
	anchored = 1
	use_power = IDLE_POWER_USE
	idle_power_usage = 40
	circuit = /obj/item/circuitboard/biogenerator
	var/processing = 0
	var/obj/item/reagent_containers/glass/beaker = null
	var/points = 0
	var/menustat = "menu"
	var/build_eff = 1
	var/eat_eff = 1


	var/list/recipes = list(
		"Food",
			list(name="Milk, 30u", cost=60, reagent="milk"),
			list(name="Soy Milk, 30u", cost=60, reagent="soymilk"),
			list(name="Black Pepper, 30u", cost=30, reagent="blackpepper"), //Cost reduced to be in line with Sugar
			list(name="Flour, 30u", cost=600, reagent="flour"), //Got to be really lazy
			list(name="Rice, 30u", cost=600, reagent="rice"), //Got to be really lazy
			list(name="Salt, 30u", cost=30, reagent="sodiumchloride"), //Cost reduced to be in line with Sugar
			list(name="Sugar, 30u", cost=30, reagent="sugar"),
			list(name="Box of eggs", cost=3200, path=/obj/item/storage/fancy/egg_box), //lets not completely replace hens, but at a more reasonable price.
			list(name="Slab of meat", cost=50, path=/obj/item/reagent_containers/food/snacks/meat),
		"Nutrient",
			list(name="EZ-Nutrient, 30u", cost=30, reagent="eznutrient"),
			list(name="Left4Zed, 30u", cost=60, reagent="left4zed"),
			list(name="Robust Harvest, 30u", cost=75, reagent="robustharvest"),
			list(name="Mineral Water", cost=80, path=/obj/item/plantspray/water),
			list(name="Diethylamine, 30u", cost=150, reagent="diethylamine"), //Obtainable with a silver coin, but this is more for Hunters than Gardeners anyway.
		"Weedkillers",
			list(name="Weed Killer", cost=30, path=/obj/item/plantspray/weeds),
			list(name="Pest Killer", cost=60, path=/obj/item/plantspray/pests),
			list(name="Carbaryl", cost=75, path=/obj/item/plantspray/pests/old/carbaryl),
			list(name="Lindane", cost=75, path=/obj/item/plantspray/pests/old/lindane),
			list(name="Phosmet", cost=75, path=/obj/item/plantspray/pests/old/phosmet),
		"Leather",
			list(name="Cloth Sheet", cost=50, path=/obj/item/stack/material/cloth),
			list(name="Cloth Sheet x5", cost=250, path=/obj/item/stack/material/cloth/biogen),
			list(name="Leather Sheet", cost=800, path=/obj/item/stack/material/leather),//exspensive to make sure that hunters always have a better deal
			list(name="Leather Sheet x5", cost=4000, path=/obj/item/stack/material/leather/biogen),//Where we're going, we dont need to have boxes for our leather!
			list(name="Wallet", cost=100, path=/obj/item/storage/wallet),
			list(name="Botanical gloves", cost=250, path=/obj/item/clothing/gloves/botanic_leather),
			list(name="Utility belt", cost=300, path=/obj/item/storage/belt/utility),
			list(name="Leather Satchel", cost=400, path=/obj/item/storage/backpack/satchel/leather),
			list(name="Leather Jacket", cost=400, path=/obj/item/clothing/suit/storage/toggle/leather),
			list(name="Cash Bag", cost=400, path=/obj/item/storage/bag/money),
			list(name="Medical belt", cost=300, path=/obj/item/storage/belt/medical),
			list(name="Security belt", cost=300, path=/obj/item/storage/belt/security),
			list(name="EMT belt", cost=300, path=/obj/item/storage/belt/medical/emt),
			list(name="Champion belt", cost=500, path=/obj/item/storage/belt/champion),
		"Medicine",
			list(name="Medical splints", cost=100, path=/obj/item/stack/medical/splint),
			list(name="Roll of gauze", cost=100, path=/obj/item/stack/medical/bruise_pack),
			list(name="Roll of gauze * 5", cost=560, path=/obj/item/storage/box/gauzebulk),
			list(name="Ointment", cost=100, path=/obj/item/stack/medical/ointment),
			list(name="Ointment * 5", cost=560, path=/obj/item/storage/box/ointmentbulk),
			list(name="Advanced trauma kit", cost=200, path=/obj/item/stack/medical/bruise_pack/advanced),
			list(name="Advanced trauma kit x5", cost=1060, path=/obj/item/storage/box/advancedtraumakit),
			list(name="Advanced burn kit", cost=200, path=/obj/item/stack/medical/ointment/advanced),
			list(name="Advanced burn kit x5", cost=1060, path=/obj/item/storage/box/advancedburnkit),
		"Carpet",
			list(name="Red Carpet", cost=12, path=/obj/item/stack/tile/carpet),
			list(name="Red Carpet x15", cost=240, path=/obj/item/storage/box/carpetbulk),
			list(name="Black Carpet", cost=12, path=/obj/item/stack/tile/carpet/bcarpet),
			list(name="Black Carpet x15", cost=240, path=/obj/item/storage/box/bcarpetbulk),
			list(name="Blue Carpet", cost=12, path=/obj/item/stack/tile/carpet/blucarpet),
			list(name="Blue Carpet x15", cost=240, path=/obj/item/storage/box/bluecarpetbulk),
			list(name="Turquoise Carpet", cost=12, path=/obj/item/stack/tile/carpet/turcarpet),
			list(name="Turquoise Carpet x15", cost=240, path=/obj/item/storage/box/turcarpetbulk),
			list(name="Silver Carpet", cost=12, path=/obj/item/stack/tile/carpet/sblucarpet),
			list(name="Silver Carpet x15", cost=240, path=/obj/item/storage/box/sbluecarpetbulk),
			list(name="Purple Carpet", cost=12, path=/obj/item/stack/tile/carpet/purcarpet),
			list(name="Purple Carpet x15", cost=240, path=/obj/item/storage/box/purcarpetbulk),
			list(name="Orange Carpet", cost=12, path=/obj/item/stack/tile/carpet/oracarpet),
			list(name="Orange Carpet x15", cost=240, path=/obj/item/storage/box/oracarpetbulk),
		"Misc",
			list(name="Cardboard", cost=60, path=/obj/item/stack/material/cardboard),
			list(name="Cardboard x5", cost=360, path=/obj/item/storage/box/cardboardbulk),
			list(name="Crayon Box", cost=120, path=/obj/item/storage/fancy/crayons),
	)


/obj/machinery/biogenerator/New()
	..()
	create_reagents(1000)
	beaker = new /obj/item/reagent_containers/glass/beaker/large(src)


/obj/machinery/biogenerator/on_reagent_change()			//When the reagents change, change the icon as well.
	update_icon()

/obj/machinery/biogenerator/update_icon()
	if(!beaker)
		icon_state = "biogen-empty"
	else if(!processing)
		icon_state = "biogen-stand"
	else
		icon_state = "biogen-work"
	return

/obj/machinery/biogenerator/attackby(var/obj/item/I, var/mob/user)

	if(default_deconstruction(I, user))
		return

	if(default_part_replacement(I, user))
		return
	if(istype(I, /obj/item/reagent_containers/glass))
		if(beaker)
			to_chat(user, SPAN_NOTICE("The [src] is already loaded."))
		else
			user.remove_from_mob(I)
			I.loc = src
			beaker = I
			updateUsrDialog()
	else if(processing)
		to_chat(user, SPAN_NOTICE("\The [src] is currently processing."))
	else if(istype(I, /obj/item/storage/bag/produce))
		var/obj/item/storage/bag/produce/produce_bag = I
		var/i = 0
		for(var/obj/item/reagent_containers/food/snacks/grown/G in contents)
			i++
		if(i >= 10)
			to_chat(user, SPAN_NOTICE("\The [src] is already full! Activate it."))
		else
			for(var/obj/item/reagent_containers/food/snacks/grown/G in I.contents)
				G.loc = src
				i++
				if(i >= 10)
					to_chat(user, SPAN_NOTICE("You fill \the [src] to its capacity."))
					break
			if(i < 10)
				to_chat(user, SPAN_NOTICE("You empty \the [I] into \the [src]."))
		produce_bag.refresh_all()


	else if(!istype(I, /obj/item/reagent_containers/food/snacks/grown))
		to_chat(user, SPAN_NOTICE("You cannot put this in \the [src]."))
	else
		var/i = 0
		for(var/obj/item/reagent_containers/food/snacks/grown/G in contents)
			i++
		if(i >= 10)
			to_chat(user, SPAN_NOTICE("\The [src] is full! Activate it."))
		else
			user.remove_from_mob(I)
			I.loc = src
			to_chat(user, SPAN_NOTICE("You put \the [I] in \the [src]"))
	update_icon()
	return

/obj/machinery/biogenerator/nano_ui_interact(var/mob/user, var/ui_key = "main", var/datum/nanoui/ui = null, var/force_open = NANOUI_FOCUS, var/datum/nano_topic_state/state =GLOB.outside_state)
	user.set_machine(src)
	var/list/data = list()
	data["points"] = points
	if(menustat == "menu")
		data["beaker"] = beaker
		if(beaker)

			var/list/tmp_recipes = list()
			for(var/smth in recipes)
				if(istext(smth))
					tmp_recipes += list(list(
						"is_category" = 1,
						"name" = smth,
					))
				else
					var/list/L = smth
					tmp_recipes += list(list(
						"is_category" = 0,
						"name" = L["name"],
						"cost" = round(L["cost"]/build_eff),
						"allow_multiple" = L["allow_multiple"],
					))

			data["recipes"] = tmp_recipes

	data["processing"] = processing
	data["menustat"] = menustat
	if(menustat == "menu")
		data["beaker"] = beaker

	ui = SSnano.try_update_ui(user, src, ui_key, ui, data, force_open)
	if (!ui)
		// the ui does not exist, so we'll create a new() one
		// for a list of parameters and their descriptions see the code docs in \code\modules\nano\nanoui.dm
		ui = new(user, src, ui_key, "biogenerator.tmpl", "Biogenerator", 550, 655)
		// when the ui is first opened this is the data it will use
		ui.set_initial_data(data)
		// open the new ui window
		ui.open()

/obj/machinery/biogenerator/attack_hand(mob/user as mob)
	if(..())
		return TRUE

	user.set_machine(src)
	nano_ui_interact(user)

/obj/machinery/biogenerator/proc/activate()
	if (usr.stat)
		return
	if (stat) //NOPOWER etc
		return
	if(processing)
		to_chat(usr, SPAN_NOTICE("The biogenerator is in the process of working."))
		return
	var/S = 0
	for(var/obj/item/reagent_containers/food/snacks/grown/I in contents)
		S += 5
		if(I.reagents.get_reagent_amount("nutriment") < 0.1)
			points += 1
		else points += I.reagents.get_reagent_amount("nutriment") * 8 * eat_eff
		qdel(I)
	if(S)
		processing = 1
		update_icon()
		updateUsrDialog()
		playsound(src.loc, 'sound/machines/blender.ogg', 50, 1)
		use_power(S * 30)
		sleep((S + 15) / eat_eff)
		processing = 0
		update_icon()
	else
		menustat = "void"
	return

/obj/machinery/biogenerator/proc/create_product(var/item, var/amount)
	var/list/recipe = null
	if(processing)
		return

	for(var/list/R in recipes)
		if(R["name"] == item)
			recipe = R
			break
	if(!recipe)
		return

	if(!("allow_multiple" in recipe))
		amount = 1
	else
		amount = max(amount, 1)

	var/cost = recipe["cost"] * amount / build_eff

	if(cost > points)
		menustat = "nopoints"
		return 0

	processing = 1
	update_icon()
	updateUsrDialog() //maybe we can remove it
	points -= cost
	sleep(cost*0.5)

	var/creating = recipe["path"]
	var/reagent = recipe["reagent"]
	if(reagent) //For reagents like milk
		if(beaker)
			beaker.reagents.add_reagent(reagent, 30)
	else
		for(var/i in 1 to amount)
			new creating(loc)
	processing = 0
	menustat = "complete"
	update_icon()
	return 1

/obj/machinery/biogenerator/Topic(href, href_list)
	if(stat & BROKEN) return
	if(usr.stat || usr.restrained()) return
	if(!in_range(src, usr)) return
	usr.set_machine(src)

	switch(href_list["action"])
		if("activate")
			activate()
		if("detach")
			if(beaker)
				beaker.loc = src.loc
				beaker = null
				update_icon()
		if("create")
			create_product(href_list["item"], text2num(href_list["amount"]))
		if("menu")
			menustat = "menu"
	updateUsrDialog()

/obj/machinery/biogenerator/RefreshParts()
	..()
	var/man_rating = 0
	var/bin_rating = 0

	for(var/obj/item/stock_parts/P in component_parts)
		if(istype(P, /obj/item/stock_parts/matter_bin))
			bin_rating += P.rating
		if(istype(P, /obj/item/stock_parts/manipulator))
			man_rating += P.rating

	build_eff = man_rating
	eat_eff = bin_rating
