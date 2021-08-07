/*Mining Packs*/

/datum/supply_pack/mining_drill
	name = "Drill Crate"
	contains = list(/obj/machinery/mining/drill)
	cost = 120
	containertype = /obj/structure/closet/crate/secure/large
	crate_name = "drill crate"
	group = "Mining"

/datum/supply_pack/mining_brace
	name = "Brace Crate"
	contains = list(/obj/machinery/mining/brace, /obj/machinery/mining/brace)
	cost = 120
	containertype = /obj/structure/closet/crate/secure/large
	crate_name = "brace crate"
	group = "Mining"

/datum/supply_pack/mining_box
	name = "Spear Ore Box Crate"
	contains = list(/obj/structure/ore_box)
	cost = 200
	containertype = /obj/structure/largecrate
	crate_name = "brace crate"
	group = "Mining"

/datum/supply_pack/mining_supply
	name = "Jackhammer Mining Supply Crate"
	contains = list(
					/obj/item/reagent_containers/spray/cleaner,
					/obj/item/device/lighting/toggleable/flashlight/heavy,
					/obj/item/cell/medium/high,
					/obj/item/storage/bag/ore,
					/obj/item/tool/pickaxe/jackhammer)
	cost = 200
	containertype = /obj/structure/closet/crate/secure/gear
	crate_name = "mining supply crate"
	group = "Mining"

/datum/supply_pack/drill_mining_supply
	name = "Diesel Drill Supply Crate"
	contains = list(
					/obj/item/reagent_containers/spray/cleaner,
					/obj/item/device/lighting/toggleable/flashlight/heavy,
					/obj/item/weldpack/canister,
					/obj/item/storage/bag/ore,
					/obj/item/tool/pickaxe/drill)
	cost = 300
	containertype = /obj/structure/closet/crate/secure/gear
	crate_name = "mining supply crate"
	group = "Mining"

/datum/supply_pack/diamond_drill_mining_supply
	name = "Diamond Diesel Drill Supply Crate"
	contains = list(
					/obj/item/reagent_containers/spray/cleaner,
					/obj/item/device/lighting/toggleable/flashlight/heavy,
					/obj/item/weldpack/canister,
					/obj/item/storage/bag/ore,
					/obj/item/tool/pickaxe/diamonddrill)
	cost = 600
	containertype = /obj/structure/closet/crate/secure/gear
	crate_name = "mining supply crate"
	group = "Mining"