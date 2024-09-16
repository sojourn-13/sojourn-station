//----------------------------------------------
//--------------------SUPPLY--------------------
//----------------------------------------------

/datum/supply_pack/misc/posters
	name = "Corporate Posters Crate"
	contains = list(/obj/item/contraband/poster,
					/obj/item/contraband/poster,
					/obj/item/contraband/poster,
					/obj/item/contraband/poster,
					/obj/item/contraband/poster)
	cost = 100
	crate_name = "corporate posters crate"
	group = "Supply"

/datum/supply_pack/boxes
	name = "Empty Boxes Crate"
	contains = list(/obj/item/storage/box,
	/obj/item/storage/box,
	/obj/item/storage/box,
	/obj/item/storage/box,
	/obj/item/storage/box,
	/obj/item/storage/box,
	/obj/item/storage/box,
	/obj/item/storage/box,
	/obj/item/storage/box,
	/obj/item/storage/box)
	cost = 120
	crate_name = "empty boxes crate"
	group = "Supply"

/datum/supply_pack/eftpos
	contains = list(/obj/item/device/eftpos)
	name = "EFTPOS Scanner Crate"
	cost = 140
	crate_name = "EFTPOS scanner crate"
	group = "Supply"

/datum/supply_pack/exportscanner
	name = "Export Scanners Crate"
	contains = list(/obj/item/device/scanner/price,
					/obj/item/device/scanner/price)
	cost = 150
	crate_name = "export scanners crate"
	group = "Supply"

/datum/supply_pack/janitor
	name = "Janitorial Supplies Crate"
	contains = list(/obj/item/reagent_containers/glass/bucket,
					/obj/item/mop,
					/obj/item/mop,
					/obj/item/mop,
					/obj/item/mop,
					/obj/item/caution,
					/obj/item/caution,
					/obj/item/caution,
					/obj/item/caution,
					/obj/item/storage/bag/trash,
					/obj/item/device/lightreplacer,
					/obj/item/reagent_containers/spray/cleaner,
					/obj/item/reagent_containers/glass/rag,
					/obj/item/grenade/chem_grenade/cleaner,
					/obj/item/grenade/chem_grenade/cleaner,
					/obj/item/grenade/chem_grenade/cleaner,
					/obj/structure/mopbucket)
	cost = 200
	crate_name = "janitorial supplies crate"
	group = "Supply"

/datum/supply_pack/chemgrenade
	name = "Cleaner Grenade Crate"
	contains = list(/obj/item/grenade/chem_grenade/cleaner,
					/obj/item/grenade/chem_grenade/cleaner,
					/obj/item/grenade/chem_grenade/cleaner,
					/obj/item/grenade/chem_grenade/cleaner,
					/obj/item/grenade/chem_grenade/cleaner,
					/obj/item/grenade/chem_grenade/cleaner,
					/obj/item/grenade/chem_grenade/cleaner,
					/obj/item/grenade/chem_grenade/cleaner,
					/obj/item/grenade/chem_grenade/cleaner,
					/obj/item/grenade/chem_grenade/cleaner)
	cost = 200
	crate_name = "cleaner grenade crate"
	group = "Supply"

/datum/supply_pack/gem
	name = "Gem Crate"
	contains = list(/obj/item/gem)
	containertype = /obj/structure/largecrate
	cost = 1000000
	crate_name = "giant gem crate"
	group = "Supply"

