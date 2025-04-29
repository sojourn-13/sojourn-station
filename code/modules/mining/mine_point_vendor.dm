/obj/machinery/mineral/equipment_vendor
	name = "mining equipment vendor"
	desc = "An equipment vendor for miners, points collected at a material processor can be spent here."
	icon = 'icons/obj/vending.dmi'
	icon_state = "engi"
	var/icon_deny = "engi-deny"
	density = TRUE
	anchored = TRUE
	circuit = /obj/item/circuitboard/mining_equipment_vendor
	var/obj/item/card/id/inserted_id
	var/list/prize_list = list(
		new /datum/data/mining_equipment("Ale",													/obj/item/reagent_containers/drinks/bottle/small/ale,			50),
		new /datum/data/mining_equipment("Whiskey",												/obj/item/reagent_containers/drinks/bottle/whiskey,			125),
		new /datum/data/mining_equipment("Absinthe",											/obj/item/reagent_containers/drinks/bottle/absinthe,			125),
		new /datum/data/mining_equipment("Random Booze",										/obj/random/booze,													125),
		new /datum/data/mining_equipment("Cigar",												/obj/item/clothing/mask/smokable/cigarette/cigar/havana,			150),
		new /datum/data/mining_equipment("Soap",												/obj/item/soap/nanotrasen,											200),
		new /datum/data/mining_equipment("Geiger Counter",										/obj/item/device/geiger,											750),
		new /datum/data/mining_equipment("Plush Toy",											/obj/random/toy/plushie,											300),
		new /datum/data/mining_equipment("GPS Device",											/obj/item/device/gps/mining,										100),
		new /datum/data/mining_equipment("Fuel Canister",										/obj/item/weldpack/canister,										250),
		new /datum/data/mining_equipment("Ore Sonar Device",									/obj/item/device/ore_sonar,											500),
		new /datum/data/mining_equipment("Aether Mining Drone ",								/mob/living/carbon/superior/robot/mining/aether,				1200),
		new /datum/data/mining_equipment("500 Point Transfer Card",								/obj/item/card/mining_point_card,									500),
		new /datum/data/mining_equipment("1000 Point Transfer Card",							/obj/item/card/mining_point_card/onethou,							1000),
		new /datum/data/mining_equipment("2000 Point Transfer Card",							/obj/item/card/mining_point_card/twothou,							2000),
		new /datum/data/mining_equipment("3000 Point Transfer Card",							/obj/item/card/mining_point_card/threethou,							3000),
		new /datum/data/mining_equipment("Quick-heal Brute Autoinjector",						/obj/item/reagent_containers/hypospray/autoinjector/quickhealbrute,	500),
		new /datum/data/mining_equipment("Quick-heal Burn Autoinjector",						/obj/item/reagent_containers/hypospray/autoinjector/quickhealburn,	500),
		new /datum/data/mining_equipment("Quick-Clot Autoinjector",								/obj/item/reagent_containers/hypospray/autoinjector/quickclot,		500),
		new /datum/data/mining_equipment("Anit-Rads Autoinjector",								/obj/item/reagent_containers/hypospray/autoinjector/antirad,		500),
		new /datum/data/mining_equipment("Tramadol Autoinjector",								/obj/item/reagent_containers/hypospray/autoinjector/tramadol,		500),
		new /datum/data/mining_equipment("Plasteel Pickaxe",									/obj/item/tool/pickaxe/upgraded,									1200),
		new /datum/data/mining_equipment("Advanced Ore Scanner",								/obj/item/device/scanner/mining/advanced,							2000),
		new /datum/data/mining_equipment("Space Cash",											/obj/item/spacecash/bundle/c100,									2500),
		new /datum/data/mining_equipment("Hardsuit - Control Module",							/obj/item/rig/industrial,											2000),
		new /datum/data/mining_equipment("Hardsuit - Equipped Control Module",					/obj/item/rig/industrial/equipped,									8000),
		new /datum/data/mining_equipment("Hardsuit - Drill",									/obj/item/rig_module/device/drill,									2000),
		new /datum/data/mining_equipment("Hardsuit - Ore Scanner",								/obj/item/rig_module/device/orescanner,								1000),
		new /datum/data/mining_equipment("Hardsuit - Meson Scanner",							/obj/item/rig_module/vision/meson,									500),
		new /datum/data/mining_equipment("Hardsuit - Maneuvering Jets",							/obj/item/rig_module/maneuvering_jets,								1250),
		new /datum/data/mining_equipment("Hardsuit - Intelligence Storage",						/obj/item/rig_module/ai_container,									2500),
		new /datum/data/mining_equipment("Hardsuit - Deployable Shield",						/obj/item/rig_module/held/shield,									6000),
		new /datum/data/mining_equipment("Industrial Equipment - Sheet-Snatcher",				/obj/item/storage/bag/sheetsnatcher,								500),
		new /datum/data/mining_equipment("Digital Tablet - Standard",							/obj/item/modular_computer/tablet/preset/custom_loadout/standard,	500),
		new /datum/data/mining_equipment("Digital Tablet - Advanced",							/obj/item/modular_computer/tablet/preset/custom_loadout/advanced,	1000),
		new /datum/data/mining_equipment("Nanopaste Tube",										/obj/item/stack/nanopaste,											1000),
		new /datum/data/mining_equipment("Defense Equipment - Smoke Bomb",						/obj/item/grenade/smokebomb,										250),
		new /datum/data/mining_equipment("Defense Equipment - Viscerator Deployer",				/obj/item/grenade/spawnergrenade/manhacks/colony,					1000),
		new /datum/data/mining_equipment("Armor Equipment - Kriosan Assault Armor",				/obj/item/clothing/suit/space/void/assault,							50000),
		new /datum/data/mining_equipment("Armor Equipment - Deployable: Bastion Shield",		/obj/item/shield/riot/bastion,										3000),
		new /datum/data/mining_equipment("Ammo Equipment - 20mm Illumination Shells",			/obj/item/ammo_magazine/ammobox/shotgun/flash,						700),
		new /datum/data/mining_equipment("Ammo Equipment - 20mm Slug",							/obj/item/ammo_magazine/ammobox/shotgun,							1000),
		new /datum/data/mining_equipment("Ammo Equipment - 7.62 Box",							/obj/item/ammo_magazine/ammobox/rifle_75,							15000)
		)

/datum/data/mining_equipment
	var/equipment_name = "generic"
	var/equipment_path = null
	var/cost = 0

/datum/data/mining_equipment/New(name, path, cost)
	src.equipment_name = name
	src.equipment_path = path
	src.cost = cost

/obj/machinery/mineral/equipment_vendor/power_change()
	var/old_stat = stat
	..()
	if(old_stat != stat)
		update_icon()
	if(inserted_id && !powered())
		visible_message("<span class='notice'>The ID slot indicator light flickers on \the [src] as it spits out a card before powering down.</span>")
		inserted_id.forceMove(get_turf(src))

/obj/machinery/mineral/equipment_vendor/update_icon()
	if(panel_open)
		icon_state = "[initial(icon_state)]-open"
	else if(powered())
		icon_state = initial(icon_state)
	else
		icon_state = "[initial(icon_state)]-off"

/obj/machinery/mineral/equipment_vendor/attack_hand(mob/user)
	if(..())
		return
	interact(user)

/obj/machinery/mineral/equipment_vendor/attack_ghost(mob/user)
	interact(user)

/obj/machinery/mineral/equipment_vendor/interact(mob/user)
	user.set_machine(src)

	var/dat
	dat +="<div class='statusDisplay'>"
	if(istype(inserted_id))
		dat += "You have [inserted_id.mining_points] mining points collected. <A href='?src=\ref[src];choice=eject'>Eject ID.</A><br>"
	else
		dat += "No ID inserted.  <A href='?src=\ref[src];choice=insert'>Insert ID.</A><br>"
	dat += "</div>"
	dat += "<br><b>Equipment point cost list:</b><BR><table border='0' width='100%'>"
	for(var/datum/data/mining_equipment/prize in prize_list)
		dat += "<tr><td>[prize.equipment_name]</td><td>[prize.cost]</td><td><A href='?src=\ref[src];purchase=\ref[prize]'>Purchase</A></td></tr>"
	dat += "</table>"
	var/datum/browser/popup = new(user, "miningvendor", "Mining Equipment Vendor", 400, 600)
	popup.set_content(dat)
	popup.open()

/obj/machinery/mineral/equipment_vendor/Topic(href, href_list)
	if(..())
		return 1
	if(href_list["choice"])
		if(istype(inserted_id))
			if(href_list["choice"] == "eject")
				to_chat(usr, "<span class='notice'>You eject the ID from [src]'s card slot.</span>")
				if(ishuman(usr))
					usr.put_in_hands(inserted_id)
					inserted_id = null
				else
					inserted_id.forceMove(get_turf(src))
					inserted_id = null
		else if(href_list["choice"] == "insert")
			var/obj/item/card/id/I = usr.get_active_hand()
			if(istype(I) && !inserted_id && usr.unEquip(I))
				I.forceMove(src)
				inserted_id = I
				interact(usr)
				to_chat(usr, "<span class='notice'>You insert the ID into [src]'s card slot.</span>")
			else
				to_chat(usr, "<span class='warning'>No valid ID.</span>")
				flick(icon_deny, src)

	if(href_list["purchase"])
		if(istype(inserted_id))
			var/datum/data/mining_equipment/prize = locate(href_list["purchase"])
			if (!prize || !(prize in prize_list))
				to_chat(usr, "<span class='warning'>Error: Invalid choice!</span>")
				flick(icon_deny, src)
				return
			if(prize.cost > inserted_id.mining_points)
				to_chat(usr, "<span class='warning'>Error: Insufficent points for [prize.equipment_name]!</span>")
				flick(icon_deny, src)
			else
				inserted_id.mining_points -= prize.cost
				to_chat(usr, "<span class='notice'>[src] clanks to life briefly before vending [prize.equipment_name]!</span>")
				new prize.equipment_path(drop_location())
		else
			to_chat(usr, "<span class='warning'>Error: Please insert a valid ID!</span>")
			flick(icon_deny, src)
	updateUsrDialog()

/obj/machinery/mineral/equipment_vendor/attackby(obj/item/I, mob/user, params)
	if(default_deconstruction(I, user))
		return

	if(default_part_replacement(I, user))
		return
	if(istype(I,/obj/item/card/id))
		if(!powered())
			return
		else if(!inserted_id && user.unEquip(I))
			I.forceMove(src)
			inserted_id = I
			interact(user)
		return
	..()

/obj/machinery/mineral/equipment_vendor/dismantle()
	if(inserted_id)
		inserted_id.forceMove(loc) //Prevents deconstructing the ORM from deleting whatever ID was inside it.
	. = ..()

/obj/machinery/mineral/equipment_vendor/proc/new_prize(var/name, var/path, var/cost) // Generic proc for adding new entries. Good for abusing for FUN and PROFIT.
	if(!cost)
		cost = 100
	if(!path)
		path = /obj/item/coin
	if(!name)
		name = "Generic Entry"
	prize_list += new /datum/data/mining_equipment(name, path, cost)

/obj/machinery/mineral/equipment_vendor/ex_act(severity, target)
	if(prob(50 / severity) && severity < 3)
		qdel(src)
