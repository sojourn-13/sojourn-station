/datum/craft_recipe/weapon
	category = "Weapons"
	time = 60
	related_stats = list(STAT_COG)

/datum/craft_recipe/weapon/baseballbat
	name = "baseball bat"
	result = /obj/item/weapon/material/baseballbat
	icon_state = "woodworking"
	steps = list(
		list(CRAFT_MATERIAL, 6, MATERIAL_WOOD)
	)

/datum/craft_recipe/weapon/knife_blade
	name = "butterfly knife blade"
	result = /obj/item/weapon/material/butterflyblade
	steps = list(
		list(CRAFT_MATERIAL, 6, MATERIAL_STEEL)
	)

/datum/craft_recipe/weapon/knife_grip
	name = "butterfly knife grip"
	result = /obj/item/weapon/material/butterflyhandle
	steps = list(
		list(CRAFT_MATERIAL, 4, MATERIAL_PLASTEEL)
	)

/datum/craft_recipe/weapon/crossbow_frame
	name = "crossbow frame"
	result = /obj/item/weapon/crossbowframe
	icon_state = "woodworking"
	steps = list(
		list(CRAFT_MATERIAL, 5, MATERIAL_WOOD)
	)

/datum/craft_recipe/weapon/flamethrower
	name = "flamethrower"
	result = /obj/item/weapon/flamethrower
	steps = list(
		list(/obj/item/weapon/tool/weldingtool, 1, "time" = 60),
		list(QUALITY_SCREW_DRIVING, 10, 70),
		list(/obj/item/device/assembly/igniter, 1)
	)

/datum/craft_recipe/weapon/fork
	name = "fork"
	result = /obj/item/weapon/material/kitchen/utensil/fork
	steps = list(
		list(CRAFT_MATERIAL, 1, MATERIAL_STEEL)
	)

/datum/craft_recipe/weapon/grenade_casing
	name = "grenade casing"
	result = /obj/item/weapon/grenade/chem_grenade
	steps = list(
		list(CRAFT_MATERIAL, 2, MATERIAL_STEEL)
	)

/datum/craft_recipe/weapon/kenny
	name = "scrap bot deployer"
	result = /obj/item/weapon/grenade/spawnergrenade/manhacks/junkbot
	steps = list(
		list(/obj/item/weapon/grenade/chem_grenade, 1),
		list(/obj/item/clothing/head/space/void/riggedvoidsuit, 1),
		list(/obj/item/weapon/computer_hardware/processor_unit, 1),
		list(/obj/item/weapon/oddity, 1), //For the soul!
		list(/obj/item/stack/cable_coil, 4),
		list(/obj/item/clothing/suit/hooded/cloak/simple, 1),
		list(/obj/item/weapon/scrap_lump, 1),
		list(QUALITY_ADHESIVE, 15, "time" = 60)
	)

/datum/craft_recipe/weapon/handmade_shield
	name = "handmade shield"
	result = /obj/item/weapon/shield/riot/handmade
	icon_state = "woodworking"
	steps = list(
		list(CRAFT_MATERIAL, 12, MATERIAL_WOOD),
		list(/obj/item/stack/rods, 4, "time" = 10),
		list(CRAFT_MATERIAL, 2, MATERIAL_STEEL)
	)

/datum/craft_recipe/weapon/handmade_lid_shield
	name = "handmade lid shield"
	result = /obj/item/weapon/shield/riot/handmade/lid
	steps = list(
		list(/obj/item/stack/cable_coil, 4),
		list(/obj/structure/closet/crate/trashcart, 1, "time" = 30),
		list(QUALITY_SCREW_DRIVING, 10, 60)
	)

/datum/craft_recipe/weapon/handmade_tray_shield
	name = "handmade tray shield"
	result = /obj/item/weapon/shield/riot/handmade/tray
	steps = list(
		list(/obj/item/weapon/tray, 1),
		list(/obj/item/weapon/storage/belt, 1, "time" = 10)
	)

/datum/craft_recipe/weapon/homewrecker
	name = "homewrecker"
	result = /obj/item/weapon/tool/hammer/homewrecker
	steps = list(
		list(/obj/item/stack/rods, 12, "time" = 30),
		list(CRAFT_MATERIAL, 30, MATERIAL_STEEL),
		list(QUALITY_WELDING, 10, "time" = 30)
	)

/datum/craft_recipe/weapon/mechanical_trap
	name = "jury-rigged mechanical trap"
	result = /obj/item/weapon/beartrap/makeshift
	icon_state = "gun"
	steps = list(
		list(/obj/item/weapon/tool/saw, 1, "time" = 120),
		list(QUALITY_SCREW_DRIVING, 10, 70),
		list(CRAFT_MATERIAL, 20, MATERIAL_STEEL),
		list(QUALITY_BOLT_TURNING, 10, 70),
		list(/obj/item/stack/cable_coil, 2, "time" = 10)
	)

/datum/craft_recipe/weapon/scrap_mine_trap
	name = "improvised land mine trap"
	result = /obj/item/weapon/mine/improvised
	icon_state = "gun"
	steps = list(
		list(/obj/item/weapon/beartrap/makeshift, 1, "time" = 120),
		list(QUALITY_SCREW_DRIVING, 10, 70),
		list(/obj/item/weapon/grenade/frag, 1, "time" = 10),
		list(QUALITY_BOLT_TURNING, 10, 70),
		list(/obj/item/stack/cable_coil, 2, "time" = 10)
	)

/datum/craft_recipe/weapon/knife
	name = "kitchen knife"
	result = /obj/item/weapon/tool/knife
	steps = list(
		list(CRAFT_MATERIAL, 1, MATERIAL_STEEL)
	)

/datum/craft_recipe/weapon/hook
	name = "steel meat hook"
	result = /obj/item/weapon/tool/knife/hook
	steps = list(
		list(CRAFT_MATERIAL, 5, MATERIAL_PLASTEEL),
		list(QUALITY_HAMMERING, 15, 10),
		list(CRAFT_MATERIAL, 2, MATERIAL_PLASTIC),
		list(QUALITY_CUTTING, 10, 10)
	)

/datum/craft_recipe/weapon/laser_sabre
	name = "laser sabre"
	result = /obj/item/weapon/melee/energy/sword/sabre
	icon_state = "gun"
	steps = list(
		list(/obj/item/weapon/tool_upgrade/productivity/ergonomic_grip, 1, "time" = 5),
		list(/obj/item/weapon/stock_parts/subspace/crystal, 1),
		list(/obj/item/weapon/gun/energy/gun, 1, "time" = 5),
		list(/obj/item/weapon/cell/medium/moebius/nuclear, 1),
		list(/obj/item/stack/cable_coil, 10, "time" = 5),
		list(QUALITY_ADHESIVE, 15, 70)
	)

/datum/craft_recipe/weapon/laser_dagger
	name = "laser dagger"
	result = /obj/item/weapon/melee/energy/sword/sabre/dagger
	icon_state = "gun"
	steps = list(
		list(/obj/item/weapon/tool_upgrade/productivity/ergonomic_grip, 1, "time" = 5),
		list(/obj/item/weapon/stock_parts/subspace/crystal, 1),
		list(/obj/item/weapon/gun/energy/gun/martin, 1, "time" = 5),
		list(/obj/item/weapon/cell/small/moebius/nuclear, 1),
		list(/obj/item/stack/cable_coil, 5, "time" = 5),
		list(QUALITY_ADHESIVE, 15, 70)
	)

/datum/craft_recipe/weapon/mace
	name = "makeshift mace"
	result = /obj/item/weapon/tool/hammer/mace/makeshift
	steps = list(
		list(/obj/item/stack/rods, 5, "time" = 15),
		list(CRAFT_MATERIAL, 5, MATERIAL_STEEL),
		list(QUALITY_WELDING, 10, "time" = 30),
		list(/obj/item/stack/cable_coil, 2, "time" = 10)
	)

/datum/craft_recipe/weapon/katana_makeshift
	name = "makeshift katana"
	result = /obj/item/weapon/tool/sword/katana_makeshift
	steps = list(
		list(/obj/item/weapon/tool/knife, 1, "time" = 15),
		list(/obj/item/weapon/tool/knife, 1, "time" = 15),
		list(QUALITY_WELDING, 10, "time" = 30),
		list(/obj/item/stack/cable_coil, 2, "time" = 10)
	)

/datum/craft_recipe/weapon/nailed_bat
	name = "nailed bat"
	result = /obj/item/weapon/tool/nailstick
	icon_state = "woodworking"
	steps = list(
		list(CRAFT_MATERIAL, 6, MATERIAL_WOOD),
		list(/obj/item/stack/rods, 3, "time" = 50)
	)

/datum/craft_recipe/weapon/spoon
	name = "spoon"
	result = /obj/item/weapon/material/kitchen/utensil/spoon
	steps = list(
		list(CRAFT_MATERIAL, 1, MATERIAL_STEEL)
	)

/datum/craft_recipe/weapon/teleportation_spear
	name = "telespear"
	result = /obj/item/weapon/tele_spear
	steps = list(
		list(/obj/item/stack/rods, 2, "time" = 30),
		list(/obj/item/weapon/stock_parts/subspace/crystal, 1),
		list(/obj/item/device/assembly/igniter, 1),
		list(/obj/item/stack/cable_coil, 10, "time" = 10)
	)

/datum/craft_recipe/weapon/improvised_maul
	name = "toolbox maul"
	result = /obj/item/weapon/melee/toolbox_maul
	steps = list(
		list(/obj/item/weapon/mop, 1, "time" = 30),
		list(/obj/item/stack/cable_coil, 10, "time" = 10)
	)

/datum/craft_recipe/weapon/charge_hammer
	name = "rocket hammer"
	result = /obj/item/weapon/tool/hammer/charge
	icon_state = "electronic"
	steps = list(
		list(/obj/item/weapon/tool/hammer/homewrecker, 1, "time" = 120), //Get a homewrecker
		list(CRAFT_MATERIAL, 4, MATERIAL_PLASTEEL), //Shore it up with some plasteel
		list(/obj/item/rocket_engine, 1, "time" = 30),	//Attach a rocket engine
		list(QUALITY_WELDING, 10, "time" = 30),//Weld it on
		list(CRAFT_MATERIAL, 2, MATERIAL_PLASMA),//Fuel it up
		list(/obj/item/weapon/tool_upgrade/augment/cell_mount, 1, "time" = 30),//Attach a cell-mount
		list(QUALITY_SCREW_DRIVING, 10, "time" = 50), //Secure it
		list(/obj/item/stack/cable_coil, 2, "time" = 10), //Wire it up
		list(QUALITY_WIRE_CUTTING, 30, "time" = 50) //Fix the wires
	)
