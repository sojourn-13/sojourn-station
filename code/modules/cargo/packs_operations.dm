//----------------------------------------------
//-----------------OPERATIONS-------------------
//----------------------------------------------

/datum/supply_pack/mule
	name = "MULEbot Crate"
	contains = list(/obj/machinery/bot/mulebot)
	cost = 1200
	containertype = /obj/structure/largecrate/mule
	crate_name = "MULEbot Crate"
	group = "Operations"

/datum/supply_pack/lunchboxes
	name = "Lunchboxes"
	contains = list(/obj/item/weapon/storage/lunchbox/cat,
					/obj/item/weapon/storage/lunchbox/cat,
					/obj/item/weapon/storage/lunchbox/cat,
					/obj/item/weapon/storage/lunchbox/cat,
					/obj/item/weapon/storage/lunchbox,
					/obj/item/weapon/storage/lunchbox,
					/obj/item/weapon/storage/lunchbox,
					/obj/item/weapon/storage/lunchbox,
					/obj/item/weapon/storage/lunchbox/rainbow,
					/obj/item/weapon/storage/lunchbox/rainbow,
					/obj/item/weapon/storage/lunchbox/rainbow,
					/obj/item/weapon/storage/lunchbox/rainbow)
	cost = 400
	containertype = /obj/structure/closet/crate
	crate_name  = "\improper Lunchboxes"
	group = "Operations"

/datum/supply_pack/price_scanner
	name = "Export scanners"
	contains = list(/obj/item/device/scanner/price,
					/obj/item/device/scanner/price)
	cost = 700
	crate_name = "Export scanners crate"
	group = "Operations"

/datum/supply_pack/flares
	name = "Flare boxes"
	contains = list(/obj/item/weapon/storage/box/flares,
					/obj/item/weapon/storage/box/flares,
					/obj/item/weapon/storage/box/flares)
	cost = 1000
	crate_name = "Flare boxes crate"
	group = "Operations"