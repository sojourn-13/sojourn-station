/datum/craft_recipe/lodge
	category = "Lodge"
	time = 100
	related_stats = list(STAT_BIO)
	requiredPerk = PERK_BUTCHER

// Weaponry -----------------
/datum/craft_recipe/lodge/crossbow_bolts
	name = "Crossbow Bolts"
	result = /obj/item/ammo_casing/crossbow_bolts/bulk
	time = 0
	steps = list(
		list(/obj/item/stack/rods, 5)
	)
	flags = CRAFT_BATCH

/datum/craft_recipe/lodge/crossbow_bolts/lethal
	name = "Fragment Crossbow Bolt"
	result = /obj/item/ammo_casing/crossbow_bolts/fragment/bulk
	steps = list(
		list(/obj/item/stack/rods, 5),
		list(/obj/item/stack/ore, 1)
	)

/datum/craft_recipe/lodge/crossbow_bolts/speed
	name = "Aerodynamic Crossbow Bolts"
	result = /obj/item/ammo_casing/crossbow_bolts/speed/bulk
	time = 0
	steps = list(
		list(/obj/item/stack/rods, 5),
		list(CRAFT_MATERIAL, 1, MATERIAL_BONE, "time" = 1), //Takes a second
		list(CRAFT_MATERIAL, 1, MATERIAL_LEATHER, "time" = 1) //Takes a second
	)

/datum/craft_recipe/lodge/arrow_hunting
	name = "hunting arrows"
	result = /obj/item/ammo_casing/arrow/hunting/bulk
	time = 0
	flags = CRAFT_BATCH
	steps = list(
		list(/obj/item/stack/rods, 3),
		list(CRAFT_MATERIAL, 2, MATERIAL_BONE, "time" = 1), //Takes a second
		list(/obj/item/reagent_containers/food/snacks/grown, 3, "time" = 1) //Takes a second
	)

/datum/craft_recipe/lodge/arrow_hunting/heavy
	name = "broadhead hunting arrows"
	result = /obj/item/ammo_casing/arrow/hunting/heavy/bulk
	steps = list(
		list(/obj/item/stack/rods, 3),
		list(CRAFT_MATERIAL, 3, MATERIAL_BONE, "time" = 1), //Takes a second
		list(/obj/item/reagent_containers/food/snacks/grown, 3, "time" = 1) //Takes a second
	)

/datum/craft_recipe/lodge/baroqe
	name = "Baroque Bone Rifle"
	result = /obj/item/gun/projectile/boltgun/baroque
	icon_state = "gun"
	steps = list(
		list(CRAFT_MATERIAL, 20, MATERIAL_BONE, "time" = 60),
		list(CRAFT_MATERIAL, 10, MATERIAL_STEEL, "time" = 20),
		list(/obj/item/animal_part/stalker_spur, 1, "time" = 20),
		list(QUALITY_CUTTING, 30, "time" = 40),
		list(QUALITY_HAMMERING, 30, "time" = 40),
		list(QUALITY_WELDING, 30, "time" = 60),
		list(QUALITY_SCREW_DRIVING, 30, "time" = 60),
		list(QUALITY_BOLT_TURNING, 30, "time" = 40)
	)

/datum/craft_recipe/lodge/hunter_crossbow
	name = "Lodge Hunting Crossbow"
	result = /obj/item/gun/projectile/shotgun/pump/hunter_crossbow
	icon_state = "gun"
	steps = list(
		list(CRAFT_MATERIAL, 20, MATERIAL_PLASTEEL, "time" = 60),
		list(CRAFT_MATERIAL, 8, MATERIAL_PLASTIC, "time" = 20),
		list(/obj/item/tool_upgrade/augment/cell_mount, 1, "time" = 20),
		list(/obj/item/cell/large, 1, "time" = 20),
		list(/obj/item/tool_upgrade/augment/hydraulic, 1, "time" = 20),
		list(/obj/item/stack/cable_coil, 10, "time" = 20),
		list(QUALITY_WIRE_CUTTING, 30, 30),
		list(QUALITY_CUTTING, 30, "time" = 40),
		list(QUALITY_HAMMERING, 30, "time" = 40),
		list(QUALITY_WELDING, 40, "time" = 60),
		list(QUALITY_SCREW_DRIVING, 30, "time" = 60),
		list(QUALITY_BOLT_TURNING, 30, "time" = 40)
	)

/datum/craft_recipe/lodge/recurve_bow
	name = "Recurve Bow"
	result = /obj/item/gun/projectile/bow/hunting
	icon_state = "woodworking"
	steps = list(
		list(/obj/item/animal_part/stalker_chitin, "time" = 60),
		list(QUALITY_HAMMERING, 30, "time" = 40),
		list(CRAFT_MATERIAL, 10, MATERIAL_WOOD, "time" = 20),
		list(QUALITY_SAWING, 30, "time" = 40),
		list(QUALITY_HAMMERING, 30, "time" = 40),
		list(CRAFT_MATERIAL, 10, MATERIAL_BONE, "time" = 60),
		list(QUALITY_ADHESIVE, 30, "time" = 60),
		list(QUALITY_CUTTING, 30, "time" = 40),
		list(CRAFT_MATERIAL, 2, MATERIAL_CLOTH, "time" = 1),
		list(QUALITY_WIRE_CUTTING, 30, "time" = 40)
	)

/datum/craft_recipe/lodge/tensioner //less good than the lodge equivilent and requires drops from a Croaker lord, still a handy thing for murdering the hell outta anything you see.
	name =  "croaker sinew bowstring"
	result = /obj/item/gun_upgrade/mechanism/froggeytensioner
	steps = list(
		list(CRAFT_MATERIAL, 5, MATERIAL_PLASTEEL, "time" = 30),
		list(QUALITY_SAWING, 30, "time" = 60),
		list(QUALITY_HAMMERING, 20, "time" = 40),
		list(QUALITY_WELDING, 40, "time" = 40),
		list(/obj/item/animal_part/croaker_tongue, "time" = 30),
		list(QUALITY_WIRE_CUTTING, 25, "time" = 90)
	)

/datum/craft_recipe/lodge/hunting_halberd
	name = "Hunter's Halberd"
	result = /obj/item/tool/spear/hunter_halberd
	icon_state = "woodworking"
	steps = list(
		list(CRAFT_MATERIAL, 22, MATERIAL_STEEL, "time" = 60),
		list(CRAFT_MATERIAL, 10, MATERIAL_WOOD, "time" = 20),
		list(QUALITY_SAWING, 20, "time" = 40),
		list(QUALITY_HAMMERING, 30, "time" = 40),
		list(CRAFT_MATERIAL, 4, MATERIAL_PLASTEEL, "time" = 60),
		list(QUALITY_SCREW_DRIVING, 20, "time" = 30),
		list(/obj/item/tool_upgrade/augment/spikes, 1),
		list(QUALITY_WELDING, 30, "time" = 10)
	)

/datum/craft_recipe/lodge/render_gauntlet
	name = "Render Gauntlet"
	result = /obj/item/tool/gauntlet
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
	result = /obj/item/tool/knife/dagger/skinning
	icon_state = "woodworking"
	steps = list(
		list(CRAFT_MATERIAL, 3, MATERIAL_PLASTEEL, "time" = 60),
		list(CRAFT_MATERIAL, 2, MATERIAL_WOOD, "time" = 20),
		list(QUALITY_SAWING, 10, "time" = 60),
		list(QUALITY_SCREW_DRIVING, 20, "time" = 30),
		list(QUALITY_HAMMERING, 15, "time" = 40),
		list(/obj/item/tool_upgrade/productivity/whetstone, 1, "time" = 30)
	)

/datum/craft_recipe/lodge/woodsmans_axe
	name = "Woodsman's Axe"
	result = /obj/item/tool/fireaxe/woodsman
	icon_state = "woodworking"
	steps = list(
		list(CRAFT_MATERIAL, 3, MATERIAL_STEEL, "time" = 60),
		list(CRAFT_MATERIAL, 2, MATERIAL_WOOD, "time" = 20),
		list(QUALITY_SAWING, 10, "time" = 40),
		list(QUALITY_HAMMERING, 10, "time" = 40)
	)

/datum/craft_recipe/lodge/bone_shield
	name = "Bone Buckler"
	result = /obj/item/shield/buckler/handmade/bone
	icon_state = "woodworking"
	steps = list(
		list(CRAFT_MATERIAL, 6, MATERIAL_BONE, "time" = 60),
		list(CRAFT_MATERIAL, 1, MATERIAL_WOOD, "time" = 20),
		list(QUALITY_SAWING, 10, "time" = 40),
		list(/obj/item/stack/cable_coil, 5, "time" = 20),
		list(QUALITY_WIRE_CUTTING, 10, "time" = 40)
	)

/datum/craft_recipe/lodge/hunting_claw
	name = "Hunting Claw"
	result = /obj/item/tool/sword/huntingclaw
	icon_state = "woodworking"
	steps = list(
		list(CRAFT_MATERIAL, 6, MATERIAL_PLASTEEL, "time" = 30),
		list(QUALITY_WELDING, 15, "time" = 60),
		list(QUALITY_HAMMERING, 15, "time" = 60),
		list(/obj/item/animal_part/sarg_horn, "time" = 60),,
		list(QUALITY_CUTTING, 15, "time" = 60),
		list(CRAFT_MATERIAL, 2, MATERIAL_WOOD, "time" = 30),
		list(QUALITY_CUTTING, 15, "time" = 40),
		list(QUALITY_WIRE_CUTTING, 10, "time" = 40)
	)

/datum/craft_recipe/lodge/sun_cleaver
	name = "Sun Cleaver"
	result = /obj/item/tool/sword/cleaver
	icon_state = "woodworking"
	steps = list(
		list(CRAFT_MATERIAL, 4, MATERIAL_PLASTEEL, "time" = 30),
		list(QUALITY_WELDING, 15, "time" = 60),
		list(QUALITY_HAMMERING, 15, "time" = 60),
		list(QUALITY_WELDING, 15, "time" = 60),
		list(CRAFT_MATERIAL, 2, MATERIAL_WOOD, "time" = 30),
		list(QUALITY_CUTTING, 15, "time" = 40),
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

/datum/craft_recipe/lodge/hunter_boots
	name = "Hunter Boots"
	result = /obj/item/clothing/shoes/hunterboots
	icon_state = "clothing"
	steps = list(
		list(CRAFT_MATERIAL, 8, MATERIAL_LEATHER, "time" = 60),
		list(QUALITY_CUTTING, 15, "time" = 50),
		list(CRAFT_MATERIAL, 4, MATERIAL_WOOD, "time" = 30),
		list(QUALITY_HAMMERING, 15, 30)
	)

/datum/craft_recipe/lodge/hunter_gloves
	name = "Hunter Gloves"
	result = /obj/item/clothing/gloves/thick/hunter
	icon_state = "clothing"
	steps = list(
		list(CRAFT_MATERIAL, 4, MATERIAL_LEATHER, "time" = 60),
		list(QUALITY_CUTTING, 15, "time" = 50),
		list(CRAFT_MATERIAL, 2, MATERIAL_BONE, "time" = 10),
		list(/obj/item/stack/cable_coil, 10, "time" = 20),
		list(QUALITY_WIRE_CUTTING, 15, 30)
	)

// Medicine -----------------
/datum/craft_recipe/lodge/blood_tongue
	name = "Tatonka blood tongue"
	result = /obj/item/stack/medical/bruise_pack/advanced/tatonka_tongue
	icon_state = "clothing"
	steps = list(
		list(/obj/item/animal_part/tatonka_tongue, 1, "time" = 20),
		list(QUALITY_HAMMERING, 15, "time" = 40)
	)

/datum/craft_recipe/lodge/powder_pouch
	name = "Tatonka powder pouch"
	result = /obj/item/stack/medical/ointment/advanced/powder_pouch
	icon_state = "clothing"
	steps = list(
		list(CRAFT_MATERIAL, 1, MATERIAL_LEATHER, "time" = 60),
		list(/obj/item/animal_part/tatonka_horn, 1, "time" = 20),
		list(QUALITY_HAMMERING, 15, "time" = 40)
	)

/datum/craft_recipe/lodge/tangu_juice
	name = "Tangu Extract"
	result = /obj/item/reagent_containers/glass/bottle/tangu_extract
	icon_state = "clothing"
	steps = list(
		list(/obj/item/reagent_containers/glass/bottle, 1, "time" = 20),
		list(/obj/item/animal_part/tangu_horn, 1, "time" = 20),
		list(QUALITY_HAMMERING, 30, "time" = 40)
	)

/datum/craft_recipe/lodge/clucker_juice
	name = "Clucker Feather extract"
	result = /obj/item/reagent_containers/glass/bottle/clucker_extract
	icon_state = "clothing"
	steps = list(
		list(/obj/item/reagent_containers/glass/bottle, 1, "time" = 20),
		list(/obj/item/animal_part/clucker_feather, 1, "time" = 20),
		list(QUALITY_HAMMERING, 15, "time" = 40)
	)

/datum/craft_recipe/lodge/tahca_antiviral
	name = "Tahca Extract"
	result = /obj/item/reagent_containers/glass/bottle/tahcacillin
	icon_state = "clothing"
	steps = list(
		list(/obj/item/reagent_containers/glass/bottle, 1, "time" = 20),
		list(/obj/item/animal_part/tahca_antler, 1, "time" = 20),
		list(QUALITY_HAMMERING, 15, "time" = 40)
	)

/datum/craft_recipe/lodge/carp_juice
	name = "Carp-Fang Mince"
	result = /obj/item/reagent_containers/glass/bottle/carp_slurry
	icon_state = "clothing"
	steps = list(
		list(/obj/item/reagent_containers/glass/bottle, 1, "time" = 20),
		list(/obj/item/animal_part/carp_fang, 1, "time" = 20),
		list(/obj/item/reagent_containers/food/snacks/poppy_tisane, 1, "time" = 20),
		list(QUALITY_HAMMERING, 15, "time" = 40)
	)


// Misc. --------------------

/datum/craft_recipe/lodge/soap
	name = "Handmade Soap"
	result = /obj/item/soap/hunters
	steps = list(
		list(CRAFT_MATERIAL, 3, MATERIAL_WOOD, "time" = 60),
		list(/obj/item/animal_part/cerberus_snout, 1, "time" = 20),
		list(/obj/item/reagent_containers/food/snacks/egg/clucker, 1, "time" = 20),
		list(QUALITY_HAMMERING, 15, "time" = 40)
	)

/datum/craft_recipe/lodge/duct_tape_weak
	name = "Duct Tape"
	result = /obj/item/tool/tape_roll
	icon_state = "clothing"
	steps = list(
		list(CRAFT_MATERIAL, 3, MATERIAL_WOOD, "time" = 60),
		list(/obj/item/animal_part/cerberus_snout, 1, "time" = 20),
		list(QUALITY_HAMMERING, 15, "time" = 40)
	)

/datum/craft_recipe/lodge/duct_tape
	name = "Flex Tape"
	result = /obj/item/tool/tape_roll/flextape
	icon_state = "clothing"
	steps = list(
		list(CRAFT_MATERIAL, 3, MATERIAL_WOOD, "time" = 60),
		list(/obj/item/animal_part/slepnir_hoof, 1, "time" = 20),
		list(QUALITY_HAMMERING, 15, "time" = 40)
	)

/datum/craft_recipe/lodge/chimera_fang
	name = "Chimera Fang Trophy"
	result = /obj/item/oddity/chimeric_fang_trophy
	icon_state = "clothing"
	steps = list(
		list(/obj/item/animal_part/chimera_fang, 1, "time" = 10),
		list(QUALITY_CUTTING, 50, "time" = 90)
	)

/datum/craft_recipe/lodge/sheath
	name = "Claw Sheath"
	result = /obj/item/clothing/accessory/holster/saber/huntingclaw
	icon_state = "clothing"
	steps = list(
		list(CRAFT_MATERIAL, 10, MATERIAL_WOOD, "time" = 60),
		list(QUALITY_CUTTING, 15, "time" = 50),
		list(/obj/item/stack/cable_coil, 10, "time" = 20),
		list(QUALITY_WIRE_CUTTING, 10, 30),
		list(CRAFT_MATERIAL, 10, MATERIAL_LEATHER, "time" = 30),
		list(QUALITY_CUTTING, 15, "time" = 50)
	)

/datum/craft_recipe/lodge/hunting_belt
	name = "Hunting Belt"
	result = /obj/item/storage/belt/hunter
	icon_state = "clothing"
	steps = list(
		list(CRAFT_MATERIAL, 8, MATERIAL_LEATHER, "time" = 60),
		list(QUALITY_CUTTING, 15, "time" = 50),
		list(/obj/item/stack/cable_coil, 10, "time" = 20),
		list(QUALITY_WIRE_CUTTING, 10, 30),
		list(CRAFT_MATERIAL, 3, MATERIAL_LEATHER, "time" = 30),
		list(QUALITY_CUTTING, 15, "time" = 50)
	)

/datum/craft_recipe/lodge/leather_medium_pouch
	name = "medium leather pouch"
	result = /obj/item/storage/pouch/medium_generic/leather
	icon_state = "clothing"
	steps = list(
		list(CRAFT_MATERIAL, 4, MATERIAL_LEATHER, "time" = 30),
		list(QUALITY_ADHESIVE, 10, "time" = 60)
	)

/datum/craft_recipe/lodge/leather_large_pouch
	name = "large leather pouch"
	result = /obj/item/storage/pouch/large_generic/leather
	icon_state = "clothing"
	steps = list(
		list(CRAFT_MATERIAL, 8, MATERIAL_LEATHER, "time" = 30),
		list(QUALITY_ADHESIVE, 10, "time" = 60)
	)

/datum/craft_recipe/lodge/hunter_necklace
	name = "Fang Tooth Necklace"
	result = /obj/item/clothing/accessory/hunter_necklace
	icon_state = "clothing"
	steps = list(
		list(CRAFT_MATERIAL, 3, MATERIAL_LEATHER, "time" = 60),
		list(QUALITY_CUTTING, 15, "time" = 50),
		list(/obj/item/animal_part/wolf_tooth, 1, "time" = 10),
		list(/obj/item/animal_part/wolf_tooth, 1, "time" = 10),
		list(/obj/item/animal_part/wolf_tooth, 1, "time" = 10),
		list(/obj/item/animal_part/wolf_tooth, 1, "time" = 10),
		list(/obj/item/animal_part/wolf_tooth, 1, "time" = 10),
		list(QUALITY_WIRE_CUTTING, 15, "time" = 70)
	)
