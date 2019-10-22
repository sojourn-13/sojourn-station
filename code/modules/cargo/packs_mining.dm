/*Mining Packs*/

/datum/supply_pack/mining_drill
	name = "Drill Crate"
	contains = list(/obj/machinery/mining/drill)
	cost = 3000
	containertype = /obj/structure/closet/crate/secure/large
	crate_name = "Drill Crate"
	group = "Mining"

/datum/supply_pack/mining_brace
	name = "Brace Crate"
	contains = list(/obj/machinery/mining/brace)
	cost = 1500
	containertype = /obj/structure/closet/crate/secure/large
	crate_name = "Brace Crate"
	group = "Mining"

/datum/supply_pack/mining_supply
	name = "Mining Supply Crate"
	contains = list(
					/obj/item/weapon/reagent_containers/spray/cleaner,
					/obj/item/device/lighting/toggleable/flashlight,
					/obj/item/weapon/tool/pickaxe/jackhammer)
	cost = 1000
	containertype = /obj/structure/closet/crate/secure/gear
	crate_name = "Mining Supply Crate"
	group = "Mining"