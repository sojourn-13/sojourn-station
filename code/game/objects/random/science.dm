/obj/random/science
	name = "random scientific item"
	icon_state = "box-green"

/obj/random/science/item_to_spawn()
	return pickweight(list(
	/obj/item/device/science_tool = 8,
	/obj/item/device/scanner/reagent = 6,
	/obj/item/computer_hardware/scanner/reagent = 3,
	/obj/item/reagent_containers/dropper = 2,
	/obj/item/reagent_containers/glass/beaker/vial = 3,
	/obj/item/reagent_containers/glass/beaker/vial/random = 2,
	/obj/item/reagent_containers/glass/beaker/vial/random/toxin = 2,
	/obj/item/reagent_containers/glass/beaker/vial/nanites = 2,
	/obj/item/stock_parts/scanning_module/adv = 3,
	/obj/item/stock_parts/manipulator/nano = 3,
	/obj/item/stock_parts/matter_bin/adv = 2,
	/obj/item/stock_parts/micro_laser/high = 2,
	/obj/item/computer_hardware/hard_drive/portable/research_points = 5,
	/obj/item/computer_hardware/hard_drive/portable/research_points/rare = 1,
	/obj/item/rig/hazmat = 0.5,
	/obj/item/rig/hazmat/equipped = 0.25,
	/obj/item/tool/multitool/uplink = 0.001, //REALLY RARE
	/obj/item/device/radio/headset/uplink = 0.001,
	/obj/item/hydrogen_fuel_cell = 0.1,
	/obj/item/hydrogen_fuel_cell/backpack = 0.1
	))

/obj/random/science/low_chance
	name = "low chance random scientific item"
	icon_state = "box-green-low"
	spawn_nothing_percentage = 80

