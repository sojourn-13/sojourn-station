/* // Going to finish this at some point, the template and menu is mostly set, might have a spacing issue, then I just need to set the machine to accept any material type, even in a stack, while also \
meed a gunpowder chem for the munitions. Side note, make a gunpowder chem.
/obj/machinery/bulletfabricator
	name = "Bullet Fabricator"
	desc = "A machine for producing ammo magazines, speed loaders, and exotic munitions."
	icon = 'icons/obj/biogenerator.dmi'
	icon_state = "biogen-stand"
	density = 1
	anchored = 1
	use_power = IDLE_POWER_USE
	idle_power_usage = 40
	var/processing = 0
	var/obj/item/weapon/reagent_containers/glass/beaker = null
	var/points = 0
	var/menustat = "menu"
	var/build_eff = 1
	var/eat_eff = 1


	var/list/recipes = list(
		"Standard",
			list(name="Standard Magazine (.35 Auto)", cost=50, path=/obj/item/ammo_magazine/pistol_35),
			list(name="Standard Magazine (.35 Auto high-velocity)", cost=50, path=/obj/item/ammo_magazine/pistol_35/highvelocity),
			list(name="Standard Magazine (.35 Auto hollow-point)", cost=50, path=/obj/item/ammo_magazine/pistol_35/lethal),
			list(name="Standard Magazine (.35 Auto rubber)", cost=50, path= /obj/item/ammo_magazine/pistol_35/rubber_35),
			list(name="Standard Magazine (.35 Auto practice)", cost=50, path=/obj/item/ammo_magazine/pistol_35/practice),
		"High Capacity",
			list(name="High Capacity Magazine (.35 Auto)", cost=100, path=/obj/item/ammo_magazine/smg_35),
			list(name="High Capacity Magazine (.35 Auto high-velocity)", cost=100, path=/obj/item/ammo_magazine/smg_35/hv),
			list(name="High Capacity Magazine (.35 Auto hollow-point)", cost=100, path=/obj/item/ammo_magazine/smg_35/lethal),
			list(name="High Capacity Magazine (.35 Auto rubber)", cost=100, path=/obj/item/ammo_magazine/smg_35/rubber),
			list(name="High Capacity Magazine (.35 Auto practice)", cost=100, path=/obj/item/ammo_magazine/smg_35/practice),
		".40 Pistol",
			list(name="Magnum Magazine (.40 Magnum standard)", cost=75, path=/obj/item/ammo_magazine/magnum_40),
			list(name="Magnum Magazine (.40 Magnum high velocity)", cost=75, path=/obj/item/ammo_magazine/magnum_40/hv),
			list(name="Magnum Magazine (.40 Magnum hollow-point)", cost=75, path=/obj/item/ammo_magazine/magnum_40/lethal),
			list(name="Magnum Magazine (.40 Magnum rubber)", cost=75, path=/obj/item/ammo_magazine/magnum_40/rubber),
			list(name="Magnum Magazine (.40 Magnum practice)", cost=75, path=/obj/item/ammo_magazine/magnum_40/practice),
		".50 Kurtz",
			list(name="Heavy Pistol Magazine (.50 Standard)", cost=100, path=/obj/item/ammo_magazine/kurtz_50),
			list(name="Heavy Pistol Magazine (.50 High velocity)", cost=100, path=/obj/item/ammo_magazine/kurtz_50/hv),
			list(name="Heavy Pistol Magazine (.50 Hollow point)", cost=100, path=/obj/item/ammo_magazine/kurtz_50/lethal),
			list(name="Heavy Pistol Magazine (.50 Rubber)", cost=100, path=/obj/item/ammo_magazine/kurtz_50/rubber),
			list(name="Heavy Pistol Magazine (.50 Practice)", cost=100, path=/obj/item/ammo_magazine/kurtz_50/practice),
		".35 Speed Loader",
			list(name="Speed Loader (.35 Special)", cost=50, path=/obj/item/ammo_magazine/speed_loader_pistol_35),
			list(name="Speed Loader (.35 High-velocity)", cost=50, path=/obj/item/ammo_magazine/speed_loader_pistol_35/hv),
			list(name="Speed Loader (.35 Hollow-point)", cost=50, path=/obj/item/ammo_magazine/speed_loader_pistol_35/lethal),
			list(name="Speed Loader (.35 Rubber)", cost=50, path=/obj/item/ammo_magazine/speed_loader_pistol_35/rubber),
			list(name="Speed Loader (.35 Practice)", cost=50, path=/obj/item/ammo_magazine/speed_loader_pistol_35/practice),
		".40 Magnum Speed Loader",
			list(name="Speed Loader (.40 Special)", cost=75, path=/obj/item/ammo_magazine/speed_loader_magnum_40),
			list(name="Speed Loader (.40 High-velocity)", cost=75, path=/obj/item/ammo_magazine/speed_loader_magnum_40/highvelocity),
			list(name="Speed Loader (.40 Hollow-point)", cost=75, path=/obj/item/ammo_magazine/speed_loader_magnum_40/lethal),
			list(name="Speed Loader (.40 Rubber)", cost=75, path=/obj/item/ammo_magazine/speed_loader_magnum_40/rubber),
			list(name="Speed Loader (.40 Practice)", cost=75, path=/obj/item/ammo_magazine/speed_loader_magnum_40/practice),
		".50 Kurtz Speed Loader",
			list(name="Speed Loader (.50 Special)", cost=100, path=/obj/item/ammo_magazine/speed_loader_kurtz_50),
			list(name="Speed Loader (.50 High-velocity)", cost=100, path=/obj/item/ammo_magazine/speed_loader_kurtz_50/highvelocity),
			list(name="Speed Loader (.50 Hollow-point)", cost=100, path=/obj/item/ammo_magazine/speed_loader_kurtz_50/lethal),
			list(name="Speed Loader (.50 Rubber)", cost=100, path=/obj/item/ammo_magazine/speed_loader_kurtz_50/rubber),
			list(name="Speed Loader (.50 Practice)", cost=100, path=/obj/item/ammo_magazine/speed_loader_kurtz_50/practice),
		"SMG",
			list(name="SMG Magazine (.35 Auto)", cost=250, path= /obj/item/ammo_magazine/highcap_pistol_35),
			list(name="SMG Magazine (.35 Auto high-velocity)", cost=250, path= /obj/item/ammo_magazine/highcap_pistol_35/highvelocity),
			list(name="SMG Magazine (.35 Auto hollow-point)", cost=250, path= /obj/item/ammo_magazine/highcap_pistol_35/lethal),
			list(name="SMG Magazine (.35 Auto rubber)", cost=250, path= /obj/item/ammo_magazine/highcap_pistol_35/rubber),
			list(name="SMG Magazine (.35 Auto practice)", cost=250, path= /obj/item/ammo_magazine/highcap_pistol_35/practice),
		".257 Carbine Long",
			list(name="Carbine Magazine (Standard)", cost=300, path=/obj/item/ammo_magazine/lrifle),
			list(name="Carbine Magazine (High velocity)", cost=300, path=/obj/item/ammo_magazine/lrifle/highvelocity),
			list(name="Carbine Magazine (Hollow-point)", cost=300, path=/obj/item/ammo_magazine/lrifle/lethal),
			list(name="Carbine Magazine (Rubber)", cost=300, path=/obj/item/ammo_magazine/lrifle/rubber),
			list(name="Carbine Magazine (Practice)", cost=300, path=/obj/item/ammo_magazine/lrifle/practice),
		".257 Carbine Short",
			list(name="Short Carbine Magazine (Standard)", cost=200, path=/obj/item/ammo_magazine/lrifle_short),
			list(name="Short Carbine Magazine (High velocity)", cost=200, path=/obj/item/ammo_magazine/lrifle_short/highvelocity),
			list(name="Short Carbine Magazine (Hollow-point)", cost=200, path=/obj/item/ammo_magazine/lrifle_short/lethal),
			list(name="Short Carbine Magazine (Rubber)", cost=200, path=/obj/item/ammo_magazine/lrifle_short/rubber),
			list(name="Short Carbine Magazine (Practice)", cost=200, path=/obj/item/ammo_magazine/lrifle_short/practice),
		"7.5 Rifle",
			list(name="Rifle Magazine (7.5 Standard)", cost=400, path=/obj/item/ammo_magazine/rifle_75),
			list(name="Rifle Magazine (7.5 High velocity)", cost=400, path=/obj/item/ammo_magazine/rifle_75/highvelocity),
			list(name="Rifle Magazine (7.5 Hollow point)", cost=400, path=/obj/item/ammo_magazine/rifle_75/lethal),
			list(name="Rifle Magazine (7.5 Rubber)", cost=400, path=/obj/item/ammo_magazine/rifle_75/rubber),
			list(name="Rifle Magazine (7.5 Practice)", cost=400, path=/obj/item/ammo_magazine/rifle_75/practice),
		"7.5 Short Rifle",
			list(name="Short Rifle Magazine (7.5 Standard)", cost=300, path=/obj/item/ammo_magazine/rifle_75_short),
			list(name="Short Rifle Magazine (7.5 High velocity)", cost=300, path=/obj/item/ammo_magazine/rifle_75_short/highvelocity),
			list(name="Short Rifle Magazine (7.5 Hollow point)", cost=300, path=/obj/item/ammo_magazine/rifle_75_short/lethal),
			list(name="Short Rifle Magazine (7.5 Rubber)", cost=300, path=/obj/item/ammo_magazine/rifle_75_short/rubber),
			list(name="Short Rifle Magazine (7.5 Practice)", cost=300, path=/obj/item/ammo_magazine/rifle_75_short/practice),
		".408 Rifle",
			list(name="Heavy Rifle Magazine (.408 Standard)", cost=400, path=/obj/item/ammo_magazine/heavy_rifle_408),
			list(name="Heavy Rifle Magazine (.408 SLAP)", cost=400, path=/obj/item/ammo_magazine/heavy_rifle_408/hv),
			list(name="Heavy Rifle Magazine (.408 Hollow point)", cost=400, path=/obj/item/ammo_magazine/heavy_rifle_408/lethal),
			list(name="Heavy Rifle Magazine (.408 Rubber)", cost=400, path=/obj/item/ammo_magazine/heavy_rifle_408/rubber),
			list(name="Heavy Rifle Magazine (.408 Practice)", cost=400, path=/obj/item/ammo_magazine/heavy_rifle_408/practice),
		"Shotgun",
			list(name="Ammo Drum (20mm Sabot slug)", cost=400, path=/obj/item/ammo_magazine/m12),
			list(name="Ammo Drum (20mm Buckshot)", cost=400, path=/obj/item/ammo_magazine/m12/pellet),
			list(name="Ammo Drum (20mm Beanbag)", cost=400, path=/obj/item/ammo_magazine/m12/beanbag),
			list(name="SBAW Magazine (20mm Sabot Slug)", cost=400, path=/obj/item/ammo_magazine/sbaw),
			list(name="SBAW Magazine (20mm Buckshot)", cost=400, path=/obj/item/ammo_magazine/sbaw/pellet),
			list(name="SBAW Magazine (20mm Beanbag)", cost=400, path=/obj/item/ammo_magazine/sbaw/beanbag),
			list(name="SBAW Magazine (20mm HEFI)", cost=400, path=/obj/item/ammo_magazine/sbaw/he),
		"Exotic",
			list(name="Ammo Strip (7.5mm Rifle)", cost=400, path=/obj/item/ammo_magazine/speed_loader_rifle_75),
			list(name="Ammo Strip (.408 Rifle)", cost=400, path=/obj/item/ammo_magazine/slhrifle),
			list(name="Linked Ammunition Box (7.5mm Rifle)", cost=500, path=/obj/item/ammo_magazine/rifle_75_pk),
			list(name="Linked Ammunition Box (7.5mm Rifle)", cost=500, path=/obj/item/ammo_magazine/rifle_75_pk),
			list(name="Linked Ammunition Box (.257 Carbine)", cost=500, path=/obj/item/ammo_magazine/rifle_75_pk/lrifle),
			list(name="Heavy Rifle Drum Magazine (.408 Drum)", cost=500, path=/obj/item/ammo_magazine/heavy_rifle_408_drum),
			list(name="Caseless Magazine (10x24 Standard)", cost=500, path=/obj/item/ammo_magazine/c10x24),
			list(name="Ammo Magazine (.70 Gyro)", cost=500, path=/obj/item/ammo_magazine/a75),
	)


/obj/machinery/bulletfabricator/New()
	..()
	create_reagents(1000)
	beaker = new /obj/item/weapon/reagent_containers/glass/beaker/large(src)

/obj/machinery/biogenerator/on_reagent_change()			//When the reagents change, change the icon as well.
	update_icon()

/obj/machinery/bulletfabricator/update_icon()
	if(!beaker)
		icon_state = "biogen-empty"
	else if(!processing)
		icon_state = "biogen-stand"
	else
		icon_state = "biogen-work"
	return

/obj/machinery/bulletfabricator/attackby(var/obj/item/I, var/mob/user)

	if(default_deconstruction(I, user))
		return

	if(default_part_replacement(I, user))
		return
	if(processing)
		to_chat(user, SPAN_NOTICE("\The [src] is currently processing."))
	else if(!istype(I, /obj/item/stack/material))
		to_chat(user, SPAN_NOTICE("You cannot put this in \the [src]."))
	else
		var/i = 0
		for(var/obj/item/stack/material/G in contents)
			i++
		if(i >= 120)
			to_chat(user, SPAN_NOTICE("\The [src] is full! Activate it."))
		else
			user.remove_from_mob(I)
			I.loc = src
			to_chat(user, SPAN_NOTICE("You put \the [I] in \the [src]"))
	update_icon()
	return

/obj/machinery/bulletfabricator/ui_interact(var/mob/user, var/ui_key = "main", var/datum/nanoui/ui = null, var/force_open = NANOUI_FOCUS, var/datum/topic_state/state =GLOB.outside_state)
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
		ui = new(user, src, ui_key, "bulletfabricator.tmpl", "Biogenerator", 550, 655)
		// when the ui is first opened this is the data it will use
		ui.set_initial_data(data)
		// open the new ui window
		ui.open()

/obj/machinery/bulletfabricator/attack_hand(mob/user as mob)
	if(..())
		return TRUE

	user.set_machine(src)
	ui_interact(user)

/obj/machinery/bulletfabricator/proc/activate()
	if (usr.stat)
		return
	if (stat) //NOPOWER etc
		return
	if(processing)
		to_chat(usr, SPAN_NOTICE("The bullet fabricator is in the process of working."))
		return
	var/S = 0
	for(var/obj/item/stack/material/I in contents)
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

/obj/machinery/bulletfabricator/proc/create_product(var/item, var/amount)
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
		beaker.reagents.add_reagent(reagent, 30)
	else
		for(var/i in 1 to amount)
			new creating(loc)
	processing = 0
	menustat = "complete"
	update_icon()
	return 1

/obj/machinery/bulletfabricator/Topic(href, href_list)
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

/obj/machinery/bulletfabricator/RefreshParts()
	..()
	var/man_rating = 0
	var/bin_rating = 0

	for(var/obj/item/weapon/stock_parts/P in component_parts)
		if(istype(P, /obj/item/weapon/stock_parts/matter_bin))
			bin_rating += P.rating
		if(istype(P, /obj/item/weapon/stock_parts/manipulator))
			man_rating += P.rating

	build_eff = man_rating
	eat_eff = bin_rating
*/