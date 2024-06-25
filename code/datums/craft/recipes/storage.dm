/datum/craft_recipe/storage
	category = "Storage"
	flags = CRAFT_ON_FLOOR|CRAFT_ONE_PER_TURF
	related_stats = list(STAT_MEC)
	time = 80

/datum/craft_recipe/storage/heavytrash
	name = "big trash bag"
	icon_state = "clothing"
	result = /obj/item/storage/bag/trash/big
	steps = list(
		list(/obj/item/storage/bag/trash, 1, "time" = 60),
		list(QUALITY_CUTTING, 20, "time" = 60),
		list(CRAFT_MATERIAL, 12, MATERIAL_PLASTIC),
		list(/obj/item/storage/bag/trash, 1, "time" = 60),
		list(QUALITY_CUTTING, 20, "time" = 60)
	)
	related_stats = list(STAT_COG)

/datum/craft_recipe/storage/plastic_bag
	name = "plastic bag"
	icon_state = "clothing"
	result = /obj/item/storage/bag/plastic
	steps = list(
		list(CRAFT_MATERIAL, 1, MATERIAL_PLASTIC)
	)
	related_stats = list(STAT_COG)

/datum/craft_recipe/storage/plastic_jug
	name = "plastic jug"
	icon_state = "device"
	result = /obj/item/reagent_containers/glass/plastic_jug
	steps = list(
		list(CRAFT_MATERIAL, 3, MATERIAL_PLASTIC, "time" = 60)
	)

/datum/craft_recipe/storage/sheet_bag
	name = "sheet snatcher"
	result = /obj/item/storage/bag/sheetsnatcher
	steps = list(
		list(CRAFT_MATERIAL, 10, MATERIAL_WOOD, "time" = 30),
		list(QUALITY_SCREW_DRIVING, 10, "time" = 20), //So knifes and other misc tools work on it.
		list(CRAFT_MATERIAL, 3, MATERIAL_STEEL, "time" = 60),
		list(QUALITY_ADHESIVE, 10, "time" = 60)
	)
	related_stats = list(STAT_COG)

/datum/craft_recipe/storage/ore_bag
	name = "ore bag"
	result = /obj/item/storage/bag/ore
	icon_state = "clothing"
	steps = list(
		list(CRAFT_MATERIAL, 5, MATERIAL_PLASTIC, "time" = 30),
		list(CRAFT_MATERIAL, 1, MATERIAL_CARDBOARD, "time" = 60),
		list(QUALITY_ADHESIVE, 10, "time" = 60)
	)
	related_stats = list(STAT_COG)

/datum/craft_recipe/storage/plant_bag
	name = "plant bag"
	result = /obj/item/storage/bag/produce
	steps = list(
		list(CRAFT_MATERIAL, 5, MATERIAL_PLASTIC, "time" = 30),
		list(CRAFT_MATERIAL, 1, MATERIAL_CARDBOARD, "time" = 60),
		list(QUALITY_ADHESIVE, 10, "time" = 60)
	)
	related_stats = list(STAT_COG)

/datum/craft_recipe/storage/plant_bag/big
	name = "big plant bag"
	result = /obj/item/storage/bag/produce/big
	steps = list(
		list(/obj/item/storage/bag/produce, 1, "time" = 20),
		list(QUALITY_CUTTING, 15, 50),
		list(/obj/item/storage/bag/produce, 1, "time" = 20),
		list(QUALITY_CUTTING, 15, 50),
		list(QUALITY_ADHESIVE, 10, "time" = 60)
	)
	related_stats = list(STAT_COG)

/datum/craft_recipe/storage/chem_bag
	name = "chemistry bag"
	result = /obj/item/storage/bag/chemistry
	icon_state = "clothing"
	steps = list(
		list(CRAFT_MATERIAL, 5, MATERIAL_PLASTIC, "time" = 30),
		list(CRAFT_MATERIAL, 1, MATERIAL_CARDBOARD, "time" = 60),
		list(QUALITY_ADHESIVE, 10, "time" = 60)
	)
	related_stats = list(STAT_COG)

/datum/craft_recipe/storage/quiver
	name = "arrows quiver"
	result = /obj/item/storage/pouch/quiver
	icon_state = "clothing"
	steps = list(
		list(/obj/item/clothing, 1, "time" = 25),
		list(QUALITY_CUTTING, 10, "time" = 10),
		list(/obj/item/stack/cable_coil, 10, "time" = 5),
		list(CRAFT_MATERIAL, 5, MATERIAL_CLOTH, 10),
		list(QUALITY_ADHESIVE, 30)
	)

/datum/craft_recipe/storage/bolts
	name = "crossbow bolts quiver"
	result = /obj/item/storage/pouch/bolts
	icon_state = "clothing"
	steps = list(
		list(/obj/item/clothing, 1, "time" = 25),
		list(QUALITY_CUTTING, 10, "time" = 10),
		list(/obj/item/stack/cable_coil, 10, "time" = 5),
		list(CRAFT_MATERIAL, 5, MATERIAL_CLOTH, 10),
		list(QUALITY_ADHESIVE, 30)
	)

/datum/craft_recipe/storage/leather_backpack
	name = "leather backpack"
	result = /obj/item/storage/backpack/leather
	icon_state = "clothing"
	steps = list(
		list(CRAFT_MATERIAL, 10, MATERIAL_LEATHER, "time" = 30),
		list(QUALITY_ADHESIVE, 10, "time" = 60)
	)
	related_stats = list(STAT_COG)

/datum/craft_recipe/storage/leather_backsport
	name = "leather sport backpack"
	result = /obj/item/storage/backpack/leather/sport
	icon_state = "clothing"
	steps = list(
		list(CRAFT_MATERIAL, 10, MATERIAL_LEATHER, "time" = 30),
		list(QUALITY_ADHESIVE, 10, "time" = 60)
	)
	related_stats = list(STAT_COG)

/datum/craft_recipe/storage/leather_satchel
	name = "leather satchel"
	result = /obj/item/storage/backpack/satchel/leather
	icon_state = "clothing"
	steps = list(
		list(CRAFT_MATERIAL, 5, MATERIAL_LEATHER, "time" = 30),
		list(QUALITY_ADHESIVE, 10, "time" = 60)
	)
	related_stats = list(STAT_COG)

/datum/craft_recipe/storage/leather_duffel
	name = "leather duffel bag"
	result = /obj/item/storage/backpack/duffelbag/leather
	icon_state = "clothing"
	steps = list(
		list(CRAFT_MATERIAL, 20, MATERIAL_LEATHER, "time" = 30),
		list(QUALITY_ADHESIVE, 10, "time" = 60)
	)
	related_stats = list(STAT_COG)

/datum/craft_recipe/storage/leather_small_pouch
	name = "small leather pouch"
	result = /obj/item/storage/pouch/small_generic/leather
	icon_state = "clothing"
	steps = list(
		list(CRAFT_MATERIAL, 2, MATERIAL_LEATHER, "time" = 30),
		list(QUALITY_ADHESIVE, 10, "time" = 60)
	)

/datum/craft_recipe/storage/backpack/militia
	name = "blackshield backpack"
	result = /obj/item/storage/backpack/militia
	icon_state = "clothing"
	steps = list(
		list(/obj/item/storage/backpack/ironhammer, 1, "time"= 30),
		list(QUALITY_CUTTING,5, "time" = 5),
		list(QUALITY_ADHESIVE, 10, "time" = 5)
	)

/datum/craft_recipe/box
	category = "Storage"
	name = "box"
	result = /obj/item/storage/box
	steps = list(
		list(CRAFT_MATERIAL, 1, MATERIAL_CARDBOARD)
	)
	related_stats = list(STAT_COG)

/datum/craft_recipe/box/syringes
	name = "box - syringes"
	steps = list(
		list(CRAFT_MATERIAL, 1, MATERIAL_CARDBOARD),
		list(QUALITY_ADHESIVE, 10, "time" = 60)
	)
	result = /obj/item/storage/box/syringes/empty

/datum/craft_recipe/box/bodybags
	name = "box - bodybags"
	steps = list(
		list(CRAFT_MATERIAL, 1, MATERIAL_CARDBOARD),
		list(QUALITY_ADHESIVE, 10, "time" = 60)
	)
	result = /obj/item/storage/box/bodybags/empty

/datum/craft_recipe/box/condimentbottles
	name = "box - condiment bottles"
	steps = list(
		list(CRAFT_MATERIAL, 1, MATERIAL_CARDBOARD),
		list(QUALITY_ADHESIVE, 10, "time" = 60)
	)
	result = /obj/item/storage/box/condimentbottles/empty

/datum/craft_recipe/box/mixed_lights
	name = "box - light storage"
	steps = list(
		list(CRAFT_MATERIAL, 1, MATERIAL_CARDBOARD),
		list(QUALITY_ADHESIVE, 10, "time" = 60)
	)
	result = /obj/item/storage/box/lights/mixed/empty

/datum/craft_recipe/box/pillbottles
	name = "box - pill bottles"
	steps = list(
		list(CRAFT_MATERIAL, 1, MATERIAL_CARDBOARD),
		list(QUALITY_ADHESIVE, 10, "time" = 60)
	)
	result = /obj/item/storage/box/pillbottles/empty

/datum/craft_recipe/storage/bookshelf
	name = "book shelf"
	result = /obj/structure/bookcase
	icon_state = "woodworking"
	steps = list(
		list(CRAFT_MATERIAL, 10, MATERIAL_WOOD)
	)

/datum/craft_recipe/storage/closet
	name = "closet"
	result = /obj/structure/closet
	steps = list(
		list(CRAFT_MATERIAL, 10, MATERIAL_STEEL)
	)

/datum/craft_recipe/storage/coffin
	name = "coffin"
	result = /obj/structure/closet/coffin
	icon_state = "woodworking"
	steps = list(
		list(CRAFT_MATERIAL, 10, MATERIAL_WOOD)
	)

/datum/craft_recipe/storage/crate/plastic
	name = "crate, plastic"
	result = /obj/structure/closet/crate/plastic
	steps = list(
		list(CRAFT_MATERIAL, 10, MATERIAL_PLASTIC)
	)

/datum/craft_recipe/storage/crate/steel
	name = "crate, steel"
	result = /obj/structure/closet/crate
	steps = list(
		list(CRAFT_MATERIAL, 10, MATERIAL_STEEL)
	)

/datum/craft_recipe/storage/rack
	name = "rack"
	result = /obj/structure/table/rack
	steps = list(
		list(CRAFT_MATERIAL, 2, MATERIAL_STEEL)
	)

/datum/craft_recipe/storage/shelf
	name = "shelf"
	result = /obj/structure/table/rack/shelf
	steps = list(
		list(CRAFT_MATERIAL, 2, MATERIAL_STEEL)
	)

/datum/craft_recipe/storage/ammo_case
	name = "Scrap ammo case"
	result = /obj/item/storage/hcases/ammo/scrap
	steps = list(
		list(CRAFT_MATERIAL, 25, MATERIAL_STEEL),
		list(QUALITY_WELDING, 10, 20)
	)

/datum/craft_recipe/storage/engi_hardcase
	name = "Scrap Engi Hardcase"
	result = /obj/item/storage/hcases/engi/scrap
	steps = list(
		list(CRAFT_MATERIAL, 25, MATERIAL_STEEL),
		list(QUALITY_WELDING, 10, 20)
	)

/datum/craft_recipe/storage/parts_hardcase
	name = "Scrap Parts Hardcase"
	result = /obj/item/storage/hcases/parts/scrap
	steps = list(
		list(CRAFT_MATERIAL, 25, MATERIAL_STEEL),
		list(QUALITY_WELDING, 10, 20)
	)

/datum/craft_recipe/storage/medi_hardcase
	name = "Scrap Medi Hardcase"
	result = /obj/item/storage/hcases/med/scrap
	steps = list(
		list(CRAFT_MATERIAL, 25, MATERIAL_STEEL),
		list(QUALITY_WELDING, 10, 20)
	)

//Techinally it stores produce
/datum/craft_recipe/storage/fermentation_keg
	name = "fermentation keg"
	result = /obj/structure/fermentation_keg
	related_stats = list(STAT_MEC)
	icon_state = "woodworking"
	steps = list(
		list(CRAFT_MATERIAL, 10, MATERIAL_WOOD),
		list(/obj/item/stack/rods, 2)
	)
