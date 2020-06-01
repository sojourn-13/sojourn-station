/*Mining Packs*/

/datum/supply_pack/mining_drill
	name = "Drill Crate"
	contains = list(/obj/machinery/mining/drill)
	cost = 2400
	containertype = /obj/structure/closet/crate/secure/large
	crate_name = "drill crate"
	group = "Mining"

/datum/supply_pack/mining_brace
	name = "Brace Crate"
	contains = list(/obj/machinery/mining/brace)
	cost = 1200
	containertype = /obj/structure/closet/crate/secure/large
	crate_name = "brace crate"
	group = "Mining"

/datum/supply_pack/mining_supply
	name = "Mining Supply Crate"
	contains = list(
					/obj/item/weapon/reagent_containers/spray/cleaner,
					/obj/item/device/lighting/toggleable/flashlight,
					/obj/item/weapon/tool/pickaxe/jackhammer)
	cost = 800
	containertype = /obj/structure/closet/crate/secure/gear
	crate_name = "mining supply crate"
	group = "Mining"