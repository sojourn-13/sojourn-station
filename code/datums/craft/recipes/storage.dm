/datum/craft_recipe/storage
	category = "Storage"
	flags = CRAFT_ON_FLOOR|CRAFT_ONE_PER_TURF
	related_stats = list(STAT_MEC)
	time = 80

/datum/craft_recipe/box/adv
	avaliableToEveryone = FALSE
	steps = list(
		list(CRAFT_MATERIAL, 1, MATERIAL_CARDBOARD),
		list(QUALITY_ADHESIVE, 10, "time" = 60), 
	)
	related_stats = list(STAT_COG)

/datum/craft_recipe/box
	name = "box"
	result = /obj/item/weapon/storage/box
	steps = list(
		list(CRAFT_MATERIAL, 1, MATERIAL_CARDBOARD)
	)
	related_stats = list(STAT_COG)

/datum/craft_recipe/box/adv/syringes
	name = "box - syringes"
	result = /obj/item/weapon/storage/box/syringes
	avaliableToEveryone = TRUE

/datum/craft_recipe/box/adv/bodybags
	name = "box - bodybags"
	result = /obj/item/weapon/storage/box/bodybags
	avaliableToEveryone = TRUE

/datum/craft_recipe/box/adv/ammo_shotgun
	name = "box - shotgun shell storage"
	result = /obj/item/weapon/storage/box/shotgunammo/buckshot //For ammo sorting
	avaliableToEveryone = TRUE

/datum/craft_recipe/box/adv/condimentbottles
	name = "box - condiment bottles"
	result = /obj/item/weapon/storage/box/condimentbottles
	avaliableToEveryone = TRUE

/datum/craft_recipe/box/adv/mixed_lights
	name = "box - light storage"
	result = /obj/item/weapon/storage/box/lights/mixed
	avaliableToEveryone = TRUE

/datum/craft_recipe/box/adv/pillbottles
	name = "box - pill bottles"
	result = /obj/item/weapon/storage/box/pillbottles
	avaliableToEveryone = TRUE

/datum/craft_recipe/storage/bookshelf
	name = "book shelf"
	result = /obj/structure/bookcase
	steps = list(
		list(CRAFT_MATERIAL, 10, MATERIAL_WOOD),
	)

/datum/craft_recipe/storage/closet
	name = "closet"
	result = /obj/structure/closet
	steps = list(
		list(CRAFT_MATERIAL, 10, MATERIAL_STEEL),
	)

/datum/craft_recipe/storage/coffin
	name = "coffin"
	result = /obj/structure/closet/coffin
	steps = list(
		list(CRAFT_MATERIAL, 10, MATERIAL_WOOD),
	)

/datum/craft_recipe/storage/crate/plastic
	name = "crate, plastic"
	result = /obj/structure/closet/crate/plastic
	steps = list(
		list(CRAFT_MATERIAL, 10, MATERIAL_PLASTIC),
	)

/datum/craft_recipe/storage/crate/steel
	name = "crate, steel"
	result = /obj/structure/closet/crate
	steps = list(
		list(CRAFT_MATERIAL, 10, MATERIAL_STEEL),
	)

/datum/craft_recipe/storage/rack
	name = "rack"
	result = /obj/structure/table/rack
	steps = list(
		list(CRAFT_MATERIAL, 2, MATERIAL_STEEL),
	)

/datum/craft_recipe/storage/shelf
	name = "shelf"
	result = /obj/structure/table/rack/shelf
	steps = list(
		list(CRAFT_MATERIAL, 2, MATERIAL_STEEL),
	)

/datum/craft_recipe/storage/table
	name = "table frame"
	result = /obj/structure/table
	steps = list(
		list(CRAFT_MATERIAL, 2, MATERIAL_STEEL),
	)
