// TODO: Remove the back end beakers
// Note - For some reason the code shits itself if you try to remove the beakers and there isn't any real harm with it being there. Probably fix it later. Maybe. If I can be arsed. - Kazkin
/obj/machinery/bulletfabricator
	name = "Bullet Fabricator"
	desc = "A machine for producing ammo magazines, speed loaders, ammo boxes, and exotic munitions using any type of materials converted into an unknown state, \
	with rare or valuable materials having greater point values. Originally a scavenged design from the Greyson Positronics repurposed by the Artificer's Guild. \
	How it works? Nobody is quite sure. The time it takes to fabricate munitions varies by cost and the machine parts used."
	icon = 'icons/obj/machines/autolathe.dmi'
	icon_state = "ammolathe"
	density = TRUE
	anchored = TRUE
	layer = BELOW_OBJ_LAYER
	use_power = IDLE_POWER_USE
	idle_power_usage = 40
	circuit = /obj/item/circuitboard/bullet_fab
	var/processing = FALSE
	var/obj/item/reagent_containers/glass/beaker = null
	var/points = 0
	var/menustat = "menu"
	var/build_eff = 1
	var/eat_eff = 1


	var/list/recipes = list(
		"Standard",
			list(name="Standard Magazine (.35 Auto)", cost=50, path=/obj/item/ammo_magazine/pistol_35),
			list(name="Standard Magazine (.35 Auto high-velocity)", cost=50, path=/obj/item/ammo_magazine/pistol_35/highvelocity),
			list(name="Standard Magazine (.35 Auto hollow-point)", cost=50, path=/obj/item/ammo_magazine/pistol_35/lethal),
			list(name="Standard Magazine (.35 Auto rubber)", cost=50, path= /obj/item/ammo_magazine/pistol_35/rubber),
			list(name="Standard Magazine (.35 Auto practice)", cost=50, path=/obj/item/ammo_magazine/pistol_35/practice),
		"High Capacity",
			list(name="High Capacity Magazine (.35 Auto)", cost=100, path=/obj/item/ammo_magazine/highcap_pistol_35),
			list(name="High Capacity Magazine (.35 Auto high-velocity)", cost=100, path=/obj/item/ammo_magazine/highcap_pistol_35/highvelocity),
			list(name="High Capacity Magazine (.35 Auto hollow-point)", cost=100, path=/obj/item/ammo_magazine/highcap_pistol_35/lethal),
			list(name="High Capacity Magazine (.35 Auto rubber)", cost=100, path=/obj/item/ammo_magazine/highcap_pistol_35/rubber),
			list(name="High Capacity Magazine (.35 Auto practice)", cost=20, path=/obj/item/ammo_magazine/highcap_pistol_35/practice),
		"Standard Drum",
			list(name="Standard Drum (.35 Auto)", cost=375, path=/obj/item/ammo_magazine/highcap_pistol_35/drum),
			list(name="Standard Drum (.35 Auto high-velocity)", cost=375, path=/obj/item/ammo_magazine/highcap_pistol_35/drum/hv),
			list(name="Standard Drum (.35 Auto hollow-point)", cost=375, path=/obj/item/ammo_magazine/highcap_pistol_35/drum/lethal),
			list(name="Standard Drum (.35 Auto rubber)", cost=375, path=/obj/item/ammo_magazine/highcap_pistol_35/drum/rubber),
			list(name="Standard Drum (.35 Auto empty)", cost=200, path=/obj/item/ammo_magazine/highcap_pistol_35/drum/empty),
		".40 Pistol",
			list(name="Magnum Magazine (.40 Magnum standard)", cost=75, path=/obj/item/ammo_magazine/magnum_40),
			list(name="Magnum Magazine (.40 Magnum high velocity)", cost=75, path=/obj/item/ammo_magazine/magnum_40/hv),
			list(name="Magnum Magazine (.40 Magnum hollow-point)", cost=75, path=/obj/item/ammo_magazine/magnum_40/lethal),
			list(name="Magnum Magazine (.40 Magnum rubber)", cost=75, path=/obj/item/ammo_magazine/magnum_40/rubber),
			list(name="Magnum Magazine (.40 Magnum practice)", cost=30, path=/obj/item/ammo_magazine/magnum_40/practice),
		".50 Kurtz",
			list(name="Heavy Pistol Magazine (.50 Standard)", cost=100, path=/obj/item/ammo_magazine/kurtz_50),
			list(name="Heavy Pistol Magazine (.50 High velocity)", cost=100, path=/obj/item/ammo_magazine/kurtz_50/hv),
			list(name="Heavy Pistol Magazine (.50 Hollow point)", cost=100, path=/obj/item/ammo_magazine/kurtz_50/lethal),
			list(name="Heavy Pistol Magazine (.50 Rubber)", cost=100, path=/obj/item/ammo_magazine/kurtz_50/rubber),
			list(name="Heavy Pistol Magazine (.50 Practice)", cost=20, path=/obj/item/ammo_magazine/kurtz_50/practice),
		".35 Speed Loader",
			list(name="Speed Loader (.35 Special)", cost=30, path=/obj/item/ammo_magazine/speed_loader_pistol_35),
			list(name="Speed Loader (.35 High-velocity)", cost=30, path=/obj/item/ammo_magazine/speed_loader_pistol_35/hv),
			list(name="Speed Loader (.35 Hollow-point)", cost=30, path=/obj/item/ammo_magazine/speed_loader_pistol_35/lethal),
			list(name="Speed Loader (.35 Rubber)", cost=30, path=/obj/item/ammo_magazine/speed_loader_pistol_35/rubber),
			list(name="Speed Loader (.35 Practice)", cost=10, path=/obj/item/ammo_magazine/speed_loader_pistol_35/practice),
		".40 Magnum Speed Loader",
			list(name="Speed Loader (.40 Special)", cost=45, path=/obj/item/ammo_magazine/speed_loader_magnum_40),
			list(name="Speed Loader (.40 High-velocity)", cost=45, path=/obj/item/ammo_magazine/speed_loader_magnum_40/highvelocity),
			list(name="Speed Loader (.40 Hollow-point)", cost=45, path=/obj/item/ammo_magazine/speed_loader_magnum_40/lethal),
			list(name="Speed Loader (.40 Rubber)", cost=45, path=/obj/item/ammo_magazine/speed_loader_magnum_40/rubber),
			list(name="Speed Loader (.40 Practice)", cost=25, path=/obj/item/ammo_magazine/speed_loader_magnum_40/practice),
		".50 Kurtz Speed Loader",
			list(name="Speed Loader (.50 Special)", cost=60, path=/obj/item/ammo_magazine/speed_loader_kurtz_50),
			list(name="Speed Loader (.50 High-velocity)", cost=60, path=/obj/item/ammo_magazine/speed_loader_kurtz_50/highvelocity),
			list(name="Speed Loader (.50 Hollow-point)", cost=60, path=/obj/item/ammo_magazine/speed_loader_kurtz_50/lethal),
			list(name="Speed Loader (.50 Rubber)", cost=60, path=/obj/item/ammo_magazine/speed_loader_kurtz_50/rubber),
			list(name="Speed Loader (.50 Practice)", cost=20, path=/obj/item/ammo_magazine/speed_loader_kurtz_50/practice),
		"SMG",
			list(name="SMG Magazine (.35 Auto)", cost=180, path= /obj/item/ammo_magazine/smg_35),
			list(name="SMG Magazine (.35 Auto high-velocity)", cost=180, path= /obj/item/ammo_magazine/smg_35/hv),
			list(name="SMG Magazine (.35 Auto hollow-point)", cost=180, path= /obj/item/ammo_magazine/smg_35/lethal),
			list(name="SMG Magazine (.35 Auto rubber)", cost=180, path= /obj/item/ammo_magazine/smg_35/rubber),
			list(name="SMG Magazine (.35 Auto practice)", cost=70, path= /obj/item/ammo_magazine/smg_35/practice),
		".257 Carbine Long",
			list(name="Carbine Magazine (Standard)", cost=300, path=/obj/item/ammo_magazine/light_rifle_257),
			list(name="Carbine Magazine (High velocity)", cost=300, path=/obj/item/ammo_magazine/light_rifle_257/highvelocity),
			list(name="Carbine Magazine (Hollow-point)", cost=300, path=/obj/item/ammo_magazine/light_rifle_257/lethal),
			list(name="Carbine Magazine (Rubber)", cost=300, path=/obj/item/ammo_magazine/light_rifle_257/rubber),
			list(name="Carbine Magazine (Practice)", cost=100, path=/obj/item/ammo_magazine/light_rifle_257/practice),
		".257 Carbine Short",
			list(name="Short Carbine Magazine (Standard)", cost=200, path=/obj/item/ammo_magazine/light_rifle_257_short),
			list(name="Short Carbine Magazine (High velocity)", cost=200, path=/obj/item/ammo_magazine/ammobox/light_rifle_257_small/hv),
			list(name="Short Carbine Magazine (Hollow-point)", cost=200, path=/obj/item/ammo_magazine/light_rifle_257_short/lethal),
			list(name="Short Carbine Magazine (Rubber)", cost=200, path=/obj/item/ammo_magazine/light_rifle_257_short/rubber),
			list(name="Short Carbine Magazine (Practice)", cost=50, path=/obj/item/ammo_magazine/light_rifle_257_short/practice),
		"7.5 Rifle",
			list(name="Rifle Magazine (7.5 Standard)", cost=400, path=/obj/item/ammo_magazine/rifle_75),
			list(name="Rifle Magazine (7.5 High velocity)", cost=400, path=/obj/item/ammo_magazine/rifle_75/highvelocity),
			list(name="Rifle Magazine (7.5 Hollow point)", cost=400, path=/obj/item/ammo_magazine/rifle_75/lethal),
			list(name="Rifle Magazine (7.5 Rubber)", cost=400, path=/obj/item/ammo_magazine/rifle_75/rubber),
			list(name="Rifle Magazine (7.5 Practice)", cost=100, path=/obj/item/ammo_magazine/rifle_75/practice),
		"7.5 Short Rifle",
			list(name="Short Rifle Magazine (7.5 Standard)", cost=300, path=/obj/item/ammo_magazine/rifle_75_short),
			list(name="Short Rifle Magazine (7.5 High velocity)", cost=300, path=/obj/item/ammo_magazine/rifle_75_short/highvelocity),
			list(name="Short Rifle Magazine (7.5 Hollow point)", cost=300, path=/obj/item/ammo_magazine/rifle_75_short/lethal),
			list(name="Short Rifle Magazine (7.5 Rubber)", cost=300, path=/obj/item/ammo_magazine/rifle_75_short/rubber),
			list(name="Short Rifle Magazine (7.5 Practice)", cost=75, path=/obj/item/ammo_magazine/rifle_75_short/practice),
		".408 Rifle",
			list(name="Heavy Rifle Magazine (.408 Standard)", cost=400, path=/obj/item/ammo_magazine/heavy_rifle_408),
			list(name="Heavy Rifle Magazine (.408 SLAP)", cost=400, path=/obj/item/ammo_magazine/heavy_rifle_408/hv),
			list(name="Heavy Rifle Magazine (.408 Hollow point)", cost=400, path=/obj/item/ammo_magazine/heavy_rifle_408/lethal),
			list(name="Heavy Rifle Magazine (.408 Rubber)", cost=400, path=/obj/item/ammo_magazine/heavy_rifle_408/rubber),
			list(name="Heavy Rifle Magazine (.408 Practice)", cost=100, path=/obj/item/ammo_magazine/heavy_rifle_408/practice),
		"Shotgun",
			list(name="Shells (20mm Slug)", cost=400, path=/obj/item/ammo_casing/shotgun/prespawned),
			list(name="Shells (20mm Buckshot)", cost=400, path=/obj/item/ammo_casing/shotgun/pellet/prespawned),
			list(name="Shells (20mm Beanbag)", cost=400, path=/obj/item/ammo_casing/shotgun/beanbag/prespawned),
			list(name="Shells (20mm Stun)", cost=400, path=/obj/item/ammo_casing/shotgun/stunshell/prespawned),
			list(name="Shells (20mm Illumination)", cost=100, path=/obj/item/ammo_casing/shotgun/illumination/prespawned),
			list(name="Shells (20mm Blank)", cost=100, path=/obj/item/ammo_casing/shotgun/blank/prespawned),
			list(name="Shells (20mm Practice)", cost=100, path=/obj/item/ammo_casing/shotgun/practice/prespawned),
			list(name="Ammo Drum (20mm Sabot slug)", cost=550, path=/obj/item/ammo_magazine/m12),
			list(name="Ammo Drum (20mm Empty)", cost=300, path=/obj/item/ammo_magazine/m12/empty),
			list(name="Ammo Drum (20mm Buckshot)", cost=550, path=/obj/item/ammo_magazine/m12/pellet),
			list(name="Ammo Drum (20mm Beanbag)", cost=550, path=/obj/item/ammo_magazine/m12/beanbag),
			list(name="SBAW Magazine (20mm Sabot Slug)", cost=850, path=/obj/item/ammo_magazine/sbaw),
			list(name="SBAW Magazine (20mm Empty)", cost=450, path=/obj/item/ammo_magazine/sbaw/empty),
			list(name="SBAW Magazine (20mm Buckshot)", cost=850, path=/obj/item/ammo_magazine/sbaw/pellet),
			list(name="SBAW Magazine (20mm Beanbag)", cost=850, path=/obj/item/ammo_magazine/sbaw/beanbag),
			list(name="SBAW Magazine (20mm HEFI)", cost=850, path=/obj/item/ammo_magazine/sbaw/he),
		"Exotic",
			list(name="Ammo Strip (7.5mm Rifle)", cost=400, path=/obj/item/ammo_magazine/speed_loader_rifle_75),
			list(name="Ammo Strip (.408 Rifle)", cost=400, path=/obj/item/ammo_magazine/speed_loader_heavy_rifle_408),
			list(name="Shells (20mm Incendiary)", cost=400, path=/obj/item/ammo_casing/shotgun/incendiary/prespawned),
			list(name="Shells (20mm Payload)", cost=500, path=/obj/item/ammo_casing/shotgun/payload/prespawned),
			list(name="Heavy Rifle Drum Magazine (.408 Drum)", cost=500, path=/obj/item/ammo_magazine/heavy_rifle_408_drum),
			list(name="Caseless Magazine (10x24 Standard)", cost=500, path=/obj/item/ammo_magazine/c10x24),
			list(name="Caseless Light Rifle Magazine (10x24 Standard)", cost=100, path=/obj/item/ammo_magazine/rifle_10x24),
			list(name="Ammo Magazine (.70 Gyro)", cost=500, path=/obj/item/ammo_magazine/a75),
			list(name="Grenade Shell Baton", cost=250, path=/obj/item/ammo_casing/grenade),
			list(name="Grenade Shell Flash", cost=250, path=/obj/item/ammo_casing/grenade/flash),
			list(name="Grenade Shell Blast", cost=350, path=/obj/item/ammo_casing/grenade/blast),
			list(name="Grenade Shell Frag", cost=350, path=/obj/item/ammo_casing/grenade/frag),
			list(name="Grenade Shell EMP", cost=300, path=/obj/item/ammo_casing/grenade/emp),
			list(name=".60-06 Anti-Material \"Red-Nose\"", cost=2400, path=/obj/item/ammo_casing/antim/lethal/prespawned),
			list(name=".60-06 Anti-Material \"Off-Switch\"", cost=2400, path=/obj/item/ammo_casing/antim/ion/prespawned),
		".35 Ammo Packets",
			list(name="Packet (.35 Auto)", cost=165, path=/obj/item/ammo_magazine/ammobox/pistol_35),
			list(name="Packet (.35 Auto high-velocity)", cost=165, path=/obj/item/ammo_magazine/ammobox/pistol_35/hv),
			list(name="Packet (.35 Auto hollow-point)", cost=165, path=/obj/item/ammo_magazine/ammobox/pistol_35/lethal),
			list(name="Packet (.35 Auto rubber)", cost=165, path=/obj/item/ammo_magazine/ammobox/pistol_35/rubber),
			list(name="Packet (.35 Auto practice)", cost=100, path=/obj/item/ammo_magazine/ammobox/pistol_35/practice),
		".40 Ammo Packets",
			list(name="Packet (.40 Magnum standard)", cost=250, path=/obj/item/ammo_magazine/ammobox/magnum_40),
			list(name="Packet (.40 Magnum high velocity)", cost=250, path=/obj/item/ammo_magazine/ammobox/magnum_40/hv),
			list(name="Packet (.40 Magnum hollow-point)", cost=250, path=/obj/item/ammo_magazine/ammobox/magnum_40/lethal),
			list(name="Packet (.40 Magnum rubber)", cost=250, path=/obj/item/ammo_magazine/ammobox/magnum_40/rubber),
			list(name="Packet (.40 Magnum practice)", cost=100, path=/obj/item/ammo_magazine/ammobox/magnum_40/practice),
		".50 Ammo Boxes",
			list(name="Box (.50 Standard)", cost=330, path=/obj/item/ammo_magazine/ammobox/kurtz_50),
			list(name="Box (.50 High velocity)", cost=330, path=/obj/item/ammo_magazine/ammobox/kurtz_50/hv),
			list(name="Box (.50 Hollow point)", cost=330, path=/obj/item/ammo_magazine/ammobox/kurtz_50/lethal),
			list(name="Box (.50 Rubber)", cost=330, path=/obj/item/ammo_magazine/ammobox/kurtz_50/rubber),
			list(name="Box (.50 Practice)", cost=100, path=/obj/item/ammo_magazine/ammobox/kurtz_50/practice),
		".257 Ammo Packets",
			list(name="Packet (Standard)", cost=990, path=/obj/item/ammo_magazine/ammobox/light_rifle_257_small),
			list(name="Packet (High velocity)", cost=990, path=/obj/item/ammo_magazine/ammobox/light_rifle_257_small/hv),
			list(name="Packet (Hollow-point)", cost=990, path=/obj/item/ammo_magazine/ammobox/light_rifle_257_small/lethal),
			list(name="Packet (Rubber)", cost=990, path=/obj/item/ammo_magazine/ammobox/light_rifle_257/rubber),
			list(name="Packet (Practice)", cost=850, path=/obj/item/ammo_magazine/ammobox/light_rifle_257/practice),
		"7.5 Ammo Packets",
			list(name="Packet (Standard)", cost=990, path=/obj/item/ammo_magazine/ammobox/rifle_75_small),
			list(name="Packet (High velocity)", cost=990, path=/obj/item/ammo_magazine/ammobox/rifle_75_small/hv),
			list(name="Packet (Hollow-point)", cost=990, path=/obj/item/ammo_magazine/ammobox/rifle_75_small/lethal),
			list(name="Packet (Rubber)", cost=990, path=/obj/item/ammo_magazine/ammobox/rifle_75_small/rubber),
			list(name="Packet (Practice)", cost=850, path=/obj/item/ammo_magazine/ammobox/rifle_75_small/practice),
		".257 Ammo Box",
			list(name="Box (Standard)", cost=3300, path=/obj/item/ammo_magazine/ammobox/light_rifle_257),
			list(name="Box (High velocity)", cost=4300, path=/obj/item/ammo_magazine/ammobox/light_rifle_257/highvelocity),
			list(name="Box (Hollow-point)", cost=4300, path=/obj/item/ammo_magazine/ammobox/light_rifle_257/lethal),
			list(name="Box (Rubber)", cost=3300, path=/obj/item/ammo_magazine/ammobox/light_rifle_257/rubber),
			list(name="Box (Practice)", cost=2600, path=/obj/item/ammo_magazine/ammobox/light_rifle_257/practice),
			list(name="Linked Ammunition Box (Standard)", cost=1000, path=/obj/item/ammo_magazine/rifle_75_linked_box/light_rifle_257),
			list(name="Linked Ammunition Box (High velocity)", cost=1000, path=/obj/item/ammo_magazine/rifle_75_linked_box/light_rifle_257/highvelocity),
			list(name="Linked Ammunition Box (Hollow-point)", cost=1000, path=/obj/item/ammo_magazine/rifle_75_linked_box/light_rifle_257/lethal),
			list(name="Linked Ammunition Box (Rubber)", cost=675, path=/obj/item/ammo_magazine/rifle_75_linked_box/light_rifle_257/rubber),
			list(name="Linked Ammunition Box (Empty)", cost=200, path=/obj/item/ammo_magazine/rifle_75_linked_box/light_rifle_257/empty),
		"7.5 Ammo Boxes",
			list(name="Box (7.5 Standard)", cost=1320, path=/obj/item/ammo_magazine/ammobox/rifle_75),
			list(name="Box (7.5 High velocity)", cost=1320, path=/obj/item/ammo_magazine/ammobox/rifle_75/hv),
			list(name="Box (7.5 Hollow point)", cost=1320, path=/obj/item/ammo_magazine/ammobox/rifle_75/lethal),
			list(name="Box (7.5 Rubber)", cost=1320, path=/obj/item/ammo_magazine/ammobox/rifle_75/rubber),
			list(name="Box (7.5 Practice)", cost=200, path=/obj/item/ammo_magazine/ammobox/rifle_75/practice),
			list(name="Linked Ammunition Box (7.5mm Rifle)", cost=1000, path=/obj/item/ammo_magazine/rifle_75_linked_box),
			list(name="Linked Ammunition Box (7.5mm High velocity)", cost=1300, path=/obj/item/ammo_magazine/rifle_75_linked_box/highvelocity),
			list(name="Linked Ammunition Box (7.5mm Hollow-point)", cost=1300, path=/obj/item/ammo_magazine/rifle_75_linked_box/lethal),
			list(name="Linked Ammunition Box (7.5mm Rubber)", cost=800, path=/obj/item/ammo_magazine/rifle_75_linked_box/rubber),
			list(name="Linked Ammunition Box (7.5mm Empty)", cost=500, path=/obj/item/ammo_magazine/rifle_75_linked_box/empty),
		".408 Ammo Boxes",
			list(name="Box (.408 Standard)", cost=3820, path=/obj/item/ammo_magazine/ammobox/heavy_rifle_408),
			list(name="Box (.408 SLAP)", cost=4420, path=/obj/item/ammo_magazine/ammobox/heavy_rifle_408/hv),
			list(name="Box (.408 Hollow point)", cost=4420, path=/obj/item/ammo_magazine/ammobox/heavy_rifle_408/lethal),
			list(name="Box (.408 Rubber)", cost=3820, path=/obj/item/ammo_magazine/ammobox/heavy_rifle_408/rubber),
			list(name="Box (.408 Practice)", cost=200, path=/obj/item/ammo_magazine/ammobox/heavy_rifle_408/practice),
		"Shotgun Boxes",
			list(name="Box (20mm Slug)", cost=3080, path=/obj/item/ammo_magazine/ammobox/shotgun),
			list(name="Box (20mm Buckshot)", cost=3080, path=/obj/item/ammo_magazine/ammobox/shotgun/buckshot),
			list(name="Box (20mm Beanbag)", cost=3080, path=/obj/item/ammo_magazine/ammobox/shotgun/beanbags),
			list(name="Box (20mm Stun)", cost=3080, path=/obj/item/ammo_magazine/ammobox/shotgun/stunshells),
			list(name="Box (20mm Illumination)", cost=500, path=/obj/item/ammo_magazine/ammobox/shotgun/flash),
			list(name="Box (20mm Blank)", cost=500, path=/obj/item/ammo_magazine/ammobox/shotgun/blanks),
			list(name="Box (20mm Practice)", cost=500, path=/obj/item/ammo_magazine/ammobox/shotgun/practiceshells),
		"Exotic Boxes",
			list(name="Box (20mm Incendiary)", cost=3080, path=/obj/item/ammo_magazine/ammobox/shotgun/incendiary),
			list(name="Box (20mm Payload)", cost=3850, path=/obj/item/ammo_magazine/ammobox/shotgun/payload),
			list(name="Box (10x24mm Caseless)", cost=1650, path=/obj/item/ammo_magazine/ammobox/c10x24),
			list(name="Box (.60-06 AP)", cost=1650, path=/obj/item/ammo_magazine/ammobox/antim),
		"Mech Boxes",
			list(name="Ultra AC 2 ammunition box", cost=750, path=/obj/item/mech_ammo_box/lmg), //Cheap for the sake of sales, 35 x 2 = 70 so its a 11x~ mark up
			list(name="LBX AC 10 ammunition box", cost=750, path=/obj/item/mech_ammo_box/scattershot),
	)


/obj/machinery/bulletfabricator/New()
	..()
	create_reagents(1000)
	beaker = new /obj/item/reagent_containers/glass/beaker/large(src) //???

/obj/machinery/biogenerator/on_reagent_change()			//When the reagents change, change the icon as well.
	update_icon()

/obj/machinery/bulletfabricator/update_icon()
	if(!processing)
		icon_state = "ammolathe"
	else
		icon_state = "ammolathe_work"
	return

/obj/machinery/bulletfabricator/attackby(var/obj/item/I, var/mob/user)

	if(!check_user(user))
		return

	if(istype(I, /obj/item/stack/material/cyborg))
		return //Prevents borgs throwing their stuff into it

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
						"is_category" = TRUE,
						"name" = smth,
					))
				else
					var/list/L = smth
					tmp_recipes += list(list(
						"is_category" = FALSE,
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
		ui = new(user, src, ui_key, "bulletfabricator.tmpl", "Munitions Fabricator", 550, 655)
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
		points += I.amount * I.price_tag * 5
		//if(I.reagents.get_reagent_amount("nutriment") < 0.1)
		//	points += 1
		//else points += I.reagents.get_reagent_amount("nutriment") * 8 * eat_eff
		qdel(I)
	if(S)
		processing = TRUE
		update_icon()
		updateUsrDialog()
		playsound(src.loc, 'sound/sanity/hydraulic.ogg', 50, 1)
		use_power(S * 30)
		spawn((1 + S * 0.5) / eat_eff) //Max stack with t1 is 61 / 1 so long time
			processing = FALSE
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
		return FALSE

	processing = TRUE
	update_icon()
	updateUsrDialog() //maybe we can remove it
	points -= cost
	spawn(cost / eat_eff * 0.1) //Insainly quick do to being made to mass create ammo

		var/creating = recipe["path"]
		var/reagent = recipe["reagent"]
		if(reagent) //For reagents like milk
			beaker.reagents.add_reagent(reagent, 30)
		else
			for(var/i in 1 to amount)
				new creating(loc)
		processing = FALSE
		menustat = "menu" //complete adds an extra step thats annoying to deal with
		update_icon()
		return TRUE

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

	for(var/obj/item/stock_parts/P in component_parts)
		if(istype(P, /obj/item/stock_parts/matter_bin))
			bin_rating += P.rating
		if(istype(P, /obj/item/stock_parts/manipulator))
			man_rating += P.rating

	build_eff = man_rating
	eat_eff = bin_rating

/obj/machinery/bulletfabricator/proc/check_user(mob/user)
	if(user.stats?.getPerk(PERK_HANDYMAN) || user.stat_check(STAT_MEC, STAT_LEVEL_EXPERT))
		return TRUE
	to_chat(user, SPAN_NOTICE("You don't know how to make the [src] work, you lack the training or mechanical skill."))
	return FALSE
