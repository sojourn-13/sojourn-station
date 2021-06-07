/datum/craft_recipe/storage
	category = "Storage"
	flags = CRAFT_ON_FLOOR|CRAFT_ONE_PER_TURF
	related_stats = list(STAT_MEC)
	time = 80

/datum/craft_recipe/storage/plastic_bag
	name = "plastic bag"
	icon_state = "clothing"
	result = /obj/item/weapon/storage/bag/plastic
	steps = list(
		list(CRAFT_MATERIAL, 1, MATERIAL_PLASTIC)
	)
	related_stats = list(STAT_COG)

/datum/craft_recipe/storage/sheet_bag
	name = "sheet snatcher"
	result = /obj/item/weapon/storage/bag/sheetsnatcher
	steps = list(
		list(CRAFT_MATERIAL, 10, MATERIAL_WOOD, "time" = 30),
		list(QUALITY_SCREW_DRIVING, 40, "time" = 20),
		list(CRAFT_MATERIAL, 3, MATERIAL_STEEL, "time" = 60),
		list(QUALITY_ADHESIVE, 10, "time" = 60)
	)
	related_stats = list(STAT_COG)

/datum/craft_recipe/storage/ore_bag
	name = "ore bag"
	result = /obj/item/weapon/storage/bag/ore
	icon_state = "clothing"
	steps = list(
		list(CRAFT_MATERIAL, 5, MATERIAL_PLASTIC, "time" = 30),
		list(CRAFT_MATERIAL, 1, MATERIAL_CARDBOARD, "time" = 60),
		list(QUALITY_ADHESIVE, 10, "time" = 60)
	)
	related_stats = list(STAT_COG)

/datum/craft_recipe/storage/plant_bag
	name = "plant bag"
	result = /obj/item/weapon/storage/bag/produce
	steps = list(
		list(CRAFT_MATERIAL, 5, MATERIAL_PLASTIC, "time" = 30),
		list(CRAFT_MATERIAL, 1, MATERIAL_CARDBOARD, "time" = 60),
		list(QUALITY_ADHESIVE, 10, "time" = 60)
	)
	related_stats = list(STAT_COG)

/datum/craft_recipe/storage/chem_bag
	name = "chemistry bag"
	result = /obj/item/weapon/storage/bag/chemistry
	icon_state = "clothing"
	steps = list(
		list(CRAFT_MATERIAL, 5, MATERIAL_PLASTIC, "time" = 30),
		list(CRAFT_MATERIAL, 1, MATERIAL_CARDBOARD, "time" = 60),
		list(QUALITY_ADHESIVE, 10, "time" = 60)
	)
	related_stats = list(STAT_COG)

/datum/craft_recipe/box/adv
	icon_state = "clothing"
	avaliableToEveryone = FALSE
	steps = list(
		list(CRAFT_MATERIAL, 1, MATERIAL_CARDBOARD),
		list(QUALITY_ADHESIVE, 10, "time" = 60)
	)
	related_stats = list(STAT_COG)

/datum/craft_recipe/box
	category = "Storage"
	name = "box"
	result = /obj/item/weapon/storage/box
	steps = list(
		list(CRAFT_MATERIAL, 1, MATERIAL_CARDBOARD)
	)
	related_stats = list(STAT_COG)

/datum/craft_recipe/box/adv/syringes
	name = "box - syringes"
	result = /obj/item/weapon/storage/box/syringes/empty
	avaliableToEveryone = TRUE

/datum/craft_recipe/box/adv/bodybags
	name = "box - bodybags"
	result = /obj/item/weapon/storage/box/bodybags/empty
	avaliableToEveryone = TRUE

/datum/craft_recipe/box/adv/condimentbottles
	name = "box - condiment bottles"
	result = /obj/item/weapon/storage/box/condimentbottles/empty
	avaliableToEveryone = TRUE

/datum/craft_recipe/box/adv/mixed_lights
	name = "box - light storage"
	result = /obj/item/weapon/storage/box/lights/mixed/empty
	avaliableToEveryone = TRUE

/datum/craft_recipe/box/adv/pillbottles
	name = "box - pill bottles"
	result = /obj/item/weapon/storage/box/pillbottles/empty
	avaliableToEveryone = TRUE

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

/datum/craft_recipe/storage/bottle
	name = "bottle"
	result = /obj/item/weapon/reagent_containers/glass/bottle
	steps = list(
		list(CRAFT_MATERIAL, 1, MATERIAL_GLASS),
		list(QUALITY_WELDING, 10, 70)
	)

/datum/craft_recipe/storage/beaker
	name = "beaker"
	result = /obj/item/weapon/reagent_containers/glass/beaker
	steps = list(
		list(CRAFT_MATERIAL, 1, MATERIAL_GLASS),
		list(QUALITY_WELDING, 10, 70)
	)

/datum/craft_recipe/storage/beaker_large
	name = "large beaker"
	result = /obj/item/weapon/reagent_containers/glass/beaker/large
	steps = list(
		list(CRAFT_MATERIAL, 2, MATERIAL_GLASS),
		list(QUALITY_WELDING, 10, 70)
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

/datum/craft_recipe/storage/table
	name = "table frame"
	result = /obj/structure/table
	steps = list(
		list(CRAFT_MATERIAL, 2, MATERIAL_STEEL)
	)
