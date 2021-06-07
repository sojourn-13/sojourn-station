/datum/craft_recipe/tool
	category = "Tools"
	time = 100
	related_stats = list(STAT_COG)

//A rod with bits of pointy shrapnel stuck to it. Good weapon
/datum/craft_recipe/tool/choppa
	name = "choppa"
	result = /obj/item/weapon/tool/saw/improvised
	steps = list(
		list(/obj/item/stack/rods, 1, 30),
		list(QUALITY_CUTTING, 15, 150)
	)

/datum/craft_recipe/tool/weaver
	name = "metal silk weaver"
	result = /obj/item/weapon/tool/silk_wand
	steps = list(
		list(/obj/item/stack/rods, 2, 30),
		list(QUALITY_WIRE_CUTTING, 10, 20)
	)

/datum/craft_recipe/tool/handmade_handtele
	name = "makeshift hand-teleporter"
	result = /obj/item/weapon/hand_tele/handmade
	icon_state = "electronic"
	steps = list(
		list(CRAFT_MATERIAL, 6, MATERIAL_PLASTIC, "time" = 30),
		list(CRAFT_MATERIAL, 2, MATERIAL_GLASS, "time" = 10),
		list(/obj/item/weapon/circuitboard, 1, "time" = 20),
		list(/obj/item/weapon/stock_parts/subspace/crystal, 1),
		list(/obj/item/weapon/stock_parts/capacitor, 1),
		list(/obj/item/weapon/cell/small, 1),
		list(/obj/item/stack/cable_coil, 5, "time" = 20)
	)
	related_stats = list(STAT_COG)

//A rod and a sheet bound together with ducks
/datum/craft_recipe/tool/junkshovel
	name = "junk shovel"
	result = /obj/item/weapon/tool/shovel/improvised
	steps = list(
		list(CRAFT_MATERIAL, 1, MATERIAL_STEEL),
		list(/obj/item/stack/rods, 1, 30),
		list(QUALITY_ADHESIVE, 15, 150)
	)

//Some pipes duct taped together, attached to a tank and an igniter
/datum/craft_recipe/tool/jurytorch
	name = "jury-rigged torch"
	result = /obj/item/weapon/tool/weldingtool/improvised
	icon_state = "gun"
	steps = list(
		list(/obj/item/device/assembly/igniter, 1),
		list(QUALITY_SCREW_DRIVING, 10, 40),
		list(/obj/item/weapon/tank/emergency_oxygen, 1),
		list(QUALITY_ADHESIVE, 15, 100)
	)

/datum/craft_recipe/tool/makeshift_centrifuge
	name = "manual centrifuge"
	result = /obj/item/device/makeshift_centrifuge

	steps = list(
		list(CRAFT_MATERIAL, 4, MATERIAL_STEEL),
		list(QUALITY_SAWING, 10, "time" = 80),
		list(/obj/item/stack/rods, 2, 30),
		list(QUALITY_WIRE_CUTTING, 10, 20),
		list(QUALITY_WELDING, 10, "time" = 70)
	)

/datum/craft_recipe/tool/makeshift_electrolyser
	name = "makeshift electrolyzer"
	result = /obj/item/device/makeshift_electrolyser
	icon_state = "electronic"
	steps = list(
		list(CRAFT_MATERIAL, 2, MATERIAL_STEEL),
		list(QUALITY_WIRE_CUTTING, 10, 20),
		list(/obj/item/stack/cable_coil, 30, "time" = 10),
		list(QUALITY_WIRE_CUTTING, 10, 20),
		list(/obj/item/stack/rods, 2, 30)
	)

/datum/craft_recipe/tool/makeshift_grinder
	name = "makeshift grinder"
	result = /obj/item/weapon/storage/makeshift_grinder

	steps = list(
		list(CRAFT_MATERIAL, 2, MATERIAL_STEEL),
		list(QUALITY_WIRE_CUTTING, 10, 20),
		list(QUALITY_PRYING, 10, 80),
		list(/obj/item/stack/rods, 1, 30)
	)

//A pair of rods laboriously twisted into a useful shape
/datum/craft_recipe/tool/rebar
	name = "rebar"
	result = /obj/item/weapon/tool/crowbar/improvised
	steps = list(
		list(/obj/item/stack/rods, 2, "time" = 300)
	)

//A rod wrapped in tape makes a crude screwthing
/datum/craft_recipe/tool/screwpusher
	name = "screw pusher"
	result = /obj/item/weapon/tool/screwdriver/improvised
	steps = list(
		list(/obj/item/stack/rods, 1, "time" = 30),
		list(QUALITY_ADHESIVE, 15, 70)
	)

//A metal sheet with some holes cut in it
/datum/craft_recipe/tool/sheetspanner
	name = "sheet spanner"
	result = /obj/item/weapon/tool/wrench/improvised
	steps = list(
		list(CRAFT_MATERIAL, 1, MATERIAL_STEEL),
		list(QUALITY_SAWING, 10, 70)
	)

//A shard of glass wrapped in tape makes a crude sort of knife
/datum/craft_recipe/tool/shiv
	name = "shiv"
	result = /obj/item/weapon/tool/knife/shiv
	steps = list(
		list(/obj/item/weapon/material/shard, 1, "time" = 30),
		list(QUALITY_ADHESIVE, 15, 70)
	)

/datum/craft_recipe/tool/webtape
	name = "web tape"
	result = /obj/item/weapon/tool/tape_roll/web
	steps = list(
		list(/obj/item/stack/medical/bruise_pack/handmade, 3, "time" = 50),
		list(/obj/item/stack/material/silk, 1, 30)
	)

//Rods bent into wierd shapes and held together with a screw
/datum/craft_recipe/tool/wiremanglers
	name = "wire manglers"
	result = /obj/item/weapon/tool/wirecutters/improvised
	steps = list(
		list(/obj/item/stack/rods, 1, "time" = 30),
		list(QUALITY_PRYING, 10, 70),
		list(/obj/item/stack/rods, 1, "time" = 30),
		list(QUALITY_PRYING, 10, 70),
		list(QUALITY_SCREW_DRIVING, 10, 70)
	)

//Metal rods reinforced with regular tape
/datum/craft_recipe/tool/brace
	name = "tool mod: brace bar"
	result = /obj/item/weapon/tool_upgrade/reinforcement/stick
	steps = list(
		list(/obj/item/stack/rods, 3, 30),
		list(CRAFT_MATERIAL, 5, MATERIAL_PLASTEEL),
		list(QUALITY_ADHESIVE, 30, 150)
	)

//Welding backpack disassembled into a smaller tank
/datum/craft_recipe/tool/fuel_tank
	name = "tool mod: expanded fuel tank"
	result = /obj/item/weapon/tool_upgrade/augment/fuel_tank

	steps = list(
		list(/obj/item/weapon/weldpack, 1, "time" = 30),
		list(QUALITY_SAWING, 10, "time" = 120),//Disassemble the backpack
		list(QUALITY_BOLT_TURNING, 10, 40) //And open some valves
	)

//just a clamp with a flat surface to hammer something
/*
/datum/craft_recipe/tool/hammer_addon
	name = "tool mod: flat surface"
	result = /obj/item/weapon/tool_upgrade/augment/hammer_addon
	steps = list(
		list(/obj/item/stack/rods, 2, 30),
		list(QUALITY_WELDING, 10, 150),
		list(CRAFT_MATERIAL, 3, MATERIAL_PLASTEEL),
		list(QUALITY_WELDING, 10, 150)
	)
*/
//An improvised adapter to fit a larger power cell. This is pretty fancy as crafted items go
//Requires an APC frame, a fuckton of wires, a large cell, and several tools
/datum/craft_recipe/tool/cell_mount
	name = "tool mod: heavy cell mount"
	result = /obj/item/weapon/tool_upgrade/augment/cell_mount
	icon_state = "electronic"
	steps = list(
		list(/obj/item/frame/apc, 2, "time" = 30),			//hull
		list(QUALITY_SCREW_DRIVING, 10, "time" = 40),		//prepare hull
		list(CRAFT_MATERIAL, 3, MATERIAL_PLASTEEL),			//additional frame to support wires
		list(QUALITY_WELDING, 10, "time" = 70),				//secure frame
		list(/obj/item/stack/cable_coil, 30, "time" = 10),	//add wiring
		list(QUALITY_WIRE_CUTTING, 10, "time" = 60),		//adjust wiring
		list(/obj/item/weapon/cell/large, 1),				//cell for parts
		list(QUALITY_SAWING, 10, "time" = 70),				//The large cell is disassembled for parts
		list(QUALITY_WELDING, 10, "time" = 70)				//weld parts in place
	)

//A metal plate with bolts drilled and wrenched into it
/datum/craft_recipe/tool/plate
	name = "tool mod: reinforcement plate"
	result = /obj/item/weapon/tool_upgrade/reinforcement/plating
	steps = list(
		list(CRAFT_MATERIAL, 5, MATERIAL_PLASTEEL),
		list(QUALITY_DRILLING, 10, 150),
		list(/obj/item/stack/rods, 2, 30),
		list(QUALITY_BOLT_TURNING, 10, 150)
	)


//An array of sharpened bits of metal to turn a tool into more of a weapon
/datum/craft_recipe/tool/spikes
	name = "tool mod: spikes"
	result = /obj/item/weapon/tool_upgrade/augment/spikes
	steps = list(
		list(/obj/item/stack/rods, 2, 30),
		list(QUALITY_WELDING, 10, 150),
		list(QUALITY_DRILLING, 20, 150),
		list(QUALITY_SAWING, 20, 150)
	)
