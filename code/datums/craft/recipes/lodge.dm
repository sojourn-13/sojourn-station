/datum/craft_recipe/lodge
	category = "Lodge"
	time = 100
	related_stats = list(STAT_BIO)
	avaliableToEveryone = FALSE

// Weaponry -----------------
/datum/craft_recipe/lodge/crossbow_bolts
	name = "Crossbow Bolts"
	result = /obj/item/ammo_casing/crossbow_bolts
	time = 0
	steps = list(
		list(/obj/item/stack/rods, 1)
	)
	flags = CRAFT_BATCH

/datum/craft_recipe/lodge/crossbow_bolts/lethal
	name = "Fragment Crossbow Bolt"
	result = /obj/item/ammo_casing/crossbow_bolts/fragment/bulk
	steps = list(
		list(/obj/item/ammo_casing/crossbow_bolts, 10),
		list(/obj/item/weapon/ore, 1)
	)

/datum/craft_recipe/lodge/crossbow_bolts/speed
	name = "Aerodynamic Crossbow Bolts"
	result = /obj/item/ammo_casing/crossbow_bolts/speed/bulk
	time = 0
	steps = list(
		list(/obj/item/ammo_casing/crossbow_bolts, 10),
		list(CRAFT_MATERIAL, 1, MATERIAL_BONE, "time" = 1), //Takes a second
		list(CRAFT_MATERIAL, 1, MATERIAL_LEATHER, "time" = 1) //Takes a second
	)

/datum/craft_recipe/lodge/hunter_crossbow
	name = "Lodge Hunting Crossbow"
	result = /obj/item/weapon/gun/projectile/shotgun/pump/hunter_crossbow
	icon_state = "gun"
	steps = list(
		list(CRAFT_MATERIAL, 20, MATERIAL_PLASTEEL, "time" = 60),
		list(/obj/item/stack/material/plastic, 8, "time" = 20),
		list(/obj/item/weapon/tool_upgrade/augment/cell_mount, 1, "time" = 20),
		list(/obj/item/weapon/cell/large, 1, "time" = 20),
		list(/obj/item/weapon/tool_upgrade/augment/hydraulic, 1, "time" = 20),
		list(/obj/item/stack/cable_coil, 10, "time" = 20),
		list(QUALITY_WIRE_CUTTING, 30, 30),
		list(QUALITY_CUTTING, 30, "time" = 40),
		list(QUALITY_HAMMERING, 30, "time" = 40),
		list(QUALITY_WELDING, 40, "time" = 60),
		list(QUALITY_SCREW_DRIVING, 30, "time" = 60),
		list(QUALITY_BOLT_TURNING, 30, "time" = 40)
	)

/datum/craft_recipe/lodge/hunting_halberd
	name = "Hunter's Halberd"
	result = /obj/item/weapon/tool/spear/hunter_halberd
	icon_state = "woodworking"
	steps = list(
		list(CRAFT_MATERIAL, 22, MATERIAL_STEEL, "time" = 60),
		list(/obj/item/stack/material/wood, 10, "time" = 20),
		list(QUALITY_SAWING, 20, "time" = 40),
		list(QUALITY_HAMMERING, 30, "time" = 40),
		list(CRAFT_MATERIAL, 4, MATERIAL_PLASTEEL, "time" = 60),
		list(QUALITY_SCREW_DRIVING, 20, "time" = 30),
		list(/obj/item/weapon/tool_upgrade/augment/spikes, 1),
		list(QUALITY_WELDING, 30, "time" = 10)
	)

/datum/craft_recipe/lodge/render_gauntlet
	name = "Render Gauntlet"
	result = /obj/item/weapon/tool/gauntlet
	icon_state = "woodworking"
	steps = list(
		list(/obj/item/animal_part/render_claw, 1, "time" = 20),
		list(/obj/item/stack/rods, 4, "time" = 20),
		list(CRAFT_MATERIAL, 5, MATERIAL_LEATHER, "time" = 60),
		list(QUALITY_SAWING, 20, "time" = 40),
		list(/obj/item/stack/cable_coil, 5, "time" = 20),
		list(QUALITY_WIRE_CUTTING, 10, "time" = 40)
	)

/datum/craft_recipe/lodge/skinning_knife
	name = "Skinning Knife"
	result = /obj/item/weapon/tool/knife/dagger/skinning
	icon_state = "woodworking"
	steps = list(
		list(CRAFT_MATERIAL, 3, MATERIAL_PLASTEEL, "time" = 60),
		list(/obj/item/stack/material/wood, 2, "time" = 20),
		list(QUALITY_SAWING, 10, "time" = 60),
		list(QUALITY_SCREW_DRIVING, 20, "time" = 30),
		list(QUALITY_HAMMERING, 15, "time" = 40),
		list(/obj/item/weapon/tool_upgrade/productivity/whetstone, 1, "time" = 30)
	)

/datum/craft_recipe/lodge/woodsmans_axe
	name = "Woodsman's Axe"
	result = /obj/item/weapon/tool/fireaxe/woodsman
	icon_state = "woodworking"
	steps = list(
		list(CRAFT_MATERIAL, 3, MATERIAL_STEEL, "time" = 60),
		list(/obj/item/stack/material/wood, 2, "time" = 20),
		list(QUALITY_SAWING, 10, "time" = 40),
		list(QUALITY_HAMMERING, 10, "time" = 40)
	)

/datum/craft_recipe/lodge/bone_shield
	name = "Bone Buckler"
	result = /obj/item/weapon/shield/riot/handmade/bone
	icon_state = "woodworking"
	steps = list(
		list(CRAFT_MATERIAL, 6, MATERIAL_BONE, "time" = 60),
		list(/obj/item/stack/material/wood, 1, "time" = 20),
		list(QUALITY_SAWING, 10, "time" = 40),
		list(/obj/item/stack/cable_coil, 5, "time" = 20),
		list(QUALITY_WIRE_CUTTING, 10, "time" = 40)
	)

// Armor --------------------
/datum/craft_recipe/lodge/hunter_hood
	name = "Hunter's Hood"
	result = /obj/item/clothing/head/helmet/hunter
	icon_state = "clothing"
	steps = list(
		list(CRAFT_MATERIAL, 10, MATERIAL_LEATHER, "time" = 60),
		list(QUALITY_CUTTING, 10, "time" = 50),
		list(CRAFT_MATERIAL, 5, MATERIAL_BONE, "time" = 40),
		list(/obj/item/stack/cable_coil, 10, "time" = 20),
		list(QUALITY_WIRE_CUTTING, 15, 30)
	)

/datum/craft_recipe/lodge/hunter_armor_basic
	name = "Hunter Armor - Basic"
	result = /obj/item/clothing/suit/armor/hunter
	icon_state = "clothing"
	steps = list(
		list(CRAFT_MATERIAL, 20, MATERIAL_LEATHER, "time" = 60),
		list(QUALITY_CUTTING, 15, "time" = 50),
		list(/obj/item/stack/cable_coil, 10, "time" = 20),
		list(QUALITY_WIRE_CUTTING, 15, 30)
	)

/datum/craft_recipe/lodge/hunter_armor_bonedaddy
	name = "Hunter Armor - Bone Armor"
	result = /obj/item/clothing/suit/armor/hunter/bone
	icon_state = "clothing"
	steps = list(
		list(/obj/item/clothing/suit/armor/hunter, 1, "time" = 20),
		list(QUALITY_CUTTING, 15, "time" = 50),
		list(CRAFT_MATERIAL, 15, MATERIAL_BONE, "time" = 40),
		list(/obj/item/stack/cable_coil, 10, "time" = 20),
		list(QUALITY_WIRE_CUTTING, 15, 30)
	)

/datum/craft_recipe/lodge/hunter_armor_metalman
	name = "Hunter Armor - Metal Plating"
	result = /obj/item/clothing/suit/armor/hunter/reinforced
	icon_state = "clothing"
	steps = list(
		list(/obj/item/clothing/suit/armor/hunter, 1, "time" = 20),
		list(CRAFT_MATERIAL, 20, MATERIAL_STEEL, "time" = 60),
		list(QUALITY_SCREW_DRIVING, 15, "time" = 50),
		list(/obj/item/stack/cable_coil, 10, "time" = 20),
		list(QUALITY_WIRE_CUTTING, 15, 30),
		list(QUALITY_WELDING, 20, "time" = 90)
	)

/datum/craft_recipe/lodge/hunter_armor_leatherdom
	name = "Hunter Armor - Reinforced Leather"
	result = /obj/item/clothing/suit/armor/hunter/leather
	icon_state = "clothing"
	steps = list(
		list(/obj/item/clothing/suit/armor/hunter, 1, "time" = 20),
		list(CRAFT_MATERIAL, 20, MATERIAL_LEATHER, "time" = 60),
		list(QUALITY_CUTTING, 15, "time" = 50),
		list(/obj/item/stack/cable_coil, 10, "time" = 20),
		list(QUALITY_WIRE_CUTTING, 15, 30)
	)

// Medicine -----------------
/datum/craft_recipe/lodge/blood_tongue
	name = "Tatonka blood tongue"
	result = /obj/item/stack/medical/advanced/bruise_pack/tatonka_tongue
	icon_state = "clothing"
	steps = list(
		list(/obj/item/animal_part/tatonka_tongue, 1, "time" = 20),
		list(QUALITY_HAMMERING, 15, "time" = 40)
	)

/datum/craft_recipe/lodge/powder_pouch
	name = "Tatonka powder pouch"
	result = /obj/item/stack/medical/advanced/ointment/powder_pouch
	icon_state = "clothing"
	steps = list(
		list(CRAFT_MATERIAL, 2, MATERIAL_LEATHER, "time" = 60),
		list(/obj/item/animal_part/tatonka_horn, 1, "time" = 20),
		list(QUALITY_HAMMERING, 15, "time" = 40)
	)

/datum/craft_recipe/lodge/tangu_juice
	name = "Tangu Extract"
	result = /obj/item/weapon/reagent_containers/glass/bottle/tangu_extract
	icon_state = "clothing"
	steps = list(
		list(/obj/item/weapon/reagent_containers/glass/bottle, 1, "time" = 20),
		list(/obj/item/animal_part/tangu_horn, 1, "time" = 20),
		list(QUALITY_HAMMERING, 30, "time" = 40)
	)

/datum/craft_recipe/lodge/clucker_juice
	name = "Clucker Feather extract"
	result = /obj/item/weapon/reagent_containers/glass/bottle/clucker_extract
	icon_state = "clothing"
	steps = list(
		list(/obj/item/weapon/reagent_containers/glass/bottle, 1, "time" = 20),
		list(/obj/item/animal_part/clucker_feather, 1, "time" = 20),
		list(QUALITY_HAMMERING, 15, "time" = 40)
	)

/datum/craft_recipe/lodge/tahca_antiviral
	name = "Tahca Extract"
	result = /obj/item/weapon/reagent_containers/glass/bottle/tahcacillin
	icon_state = "clothing"
	steps = list(
		list(/obj/item/weapon/reagent_containers/glass/bottle, 1, "time" = 20),
		list(/obj/item/animal_part/tahca_antler, 1, "time" = 20),
		list(QUALITY_HAMMERING, 15, "time" = 40)
	)

// Misc. --------------------

/datum/craft_recipe/lodge/soap
	name = "Handmade Soap"
	result = /obj/item/weapon/soap/hunters
	steps = list(
		list(CRAFT_MATERIAL, 3, MATERIAL_PLASTIC, "time" = 60),
		list(/obj/item/animal_part/cerberus_snout, 1, "time" = 20),
		list(/obj/item/weapon/reagent_containers/food/snacks/egg/clucker, 1, "time" = 20),
		list(QUALITY_HAMMERING, 15, "time" = 40)
	)

/datum/craft_recipe/lodge/duct_tape_weak
	name = "Duct Tape"
	result = /obj/item/weapon/tool/tape_roll
	icon_state = "clothing"
	steps = list(
		list(CRAFT_MATERIAL, 3, MATERIAL_PLASTIC, "time" = 60),
		list(/obj/item/animal_part/cerberus_snout, 1, "time" = 20),
		list(QUALITY_HAMMERING, 15, "time" = 40)
	)

/datum/craft_recipe/lodge/duct_tape
	name = "Flex Tape"
	result = /obj/item/weapon/tool/tape_roll/flextape
	icon_state = "clothing"
	steps = list(
		list(CRAFT_MATERIAL, 3, MATERIAL_PLASTIC, "time" = 60),
		list(/obj/item/animal_part/slepnir_hoof, 1, "time" = 20),
		list(QUALITY_HAMMERING, 15, "time" = 40)
	)

/datum/craft_recipe/lodge/chimera_fang
	name = "Chimera Fang Trophy"
	result = /obj/item/weapon/oddity/chimeric_fang_trophy
	icon_state = "clothing"
	steps = list(
		list(/obj/item/animal_part/chimera_fang, 1, "time" = 10),
		list(QUALITY_CUTTING, 50, "time" = 90)
	)