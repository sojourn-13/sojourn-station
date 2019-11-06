//----------------------------------------------
//-----------------OPERATIONS-------------------
//----------------------------------------------

/datum/supply_pack/flares
	name = "Flare Boxes Crate"
	contains = list(/obj/item/weapon/storage/box/flares,
					/obj/item/weapon/storage/box/flares,
					/obj/item/weapon/storage/box/flares)
	cost = 1000
	crate_name = "flare boxes crate"
	group = "Operations"

/datum/supply_pack/exportscanner
	name = "Export Scanners Crate"
	contains = list(/obj/item/device/scanner/price,
					/obj/item/device/scanner/price)
	cost = 700
	crate_name = "export scanners crate"
	group = "Operations"

/datum/supply_pack/mule
	name = "MULEbot Crate"
	contains = list(/obj/machinery/bot/mulebot)
	cost = 1200
	containertype = /obj/structure/largecrate/mule
	crate_name = "MULEbot crate"
	group = "Operations"

/datum/supply_pack/janitor
	name = "Janitorial Supplies Crate"
	contains = list(/obj/item/weapon/reagent_containers/glass/bucket,
					/obj/item/weapon/mop,
					/obj/item/weapon/mop,
					/obj/item/weapon/mop,
					/obj/item/weapon/mop,
					/obj/item/weapon/caution,
					/obj/item/weapon/caution,
					/obj/item/weapon/caution,
					/obj/item/weapon/caution,
					/obj/item/weapon/storage/bag/trash,
					/obj/item/device/lightreplacer,
					/obj/item/weapon/reagent_containers/spray/cleaner,
					/obj/item/weapon/reagent_containers/glass/rag,
					/obj/item/weapon/grenade/chem_grenade/cleaner,
					/obj/item/weapon/grenade/chem_grenade/cleaner,
					/obj/item/weapon/grenade/chem_grenade/cleaner,
					/obj/structure/mopbucket)
	cost = 1000
	crate_name = "janitorial supplies crate"
	group = "Operations"

/datum/supply_pack/toner
	name = "Toner Cartridges Crate"
	contains = list(/obj/item/device/toner,
					/obj/item/device/toner,
					/obj/item/device/toner,
					/obj/item/device/toner,
					/obj/item/device/toner,
					/obj/item/device/toner)
	cost = 600
	crate_name = "toner cartridges crate"
	group = "Operations"