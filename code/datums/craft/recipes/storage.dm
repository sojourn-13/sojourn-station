/datum/craft_recipe/storage
	category = "Storage"
	flags = CRAFT_ON_FLOOR|CRAFT_ONE_PER_TURF
	related_stats = list(STAT_MEC)
	time = 80

/datum/craft_recipe/box
	name = "box"
	result = /obj/item/weapon/storage/box
	steps = list(
		list(CRAFT_MATERIAL, 1, MATERIAL_CARDBOARD)
	)
	related_stats = list(STAT_COG)

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
//Pouches!
/datum/craft_recipe/storage/small_pouch
	name = "small pouch"
	result = /obj/item/weapon/storage/pouch/small_generic
	steps = list(
		list(/obj/item/weapon/storage/box, 1, time = 40),
		list(/obj/item/stack/cable_coil, 5,  time = 20),
		list(/obj/item/weapon/storage/box, 1, time = 40)
	)

/datum/craft_recipe/storage/med_pouch
	name = "medium pouch"
	result = /obj/item/weapon/storage/pouch/medium_generic
	steps = list(
		list(/obj/item/weapon/storage/pouch/small_generic, 1, time = 40),
		list(/obj/item/stack/cable_coil, 5,  time = 20),
		list(/obj/item/weapon/storage/pouch/small_generic, 1, time = 40)
	)

/datum/craft_recipe/storage/large_pouch
	name = "large pouch"
	result = /obj/item/weapon/storage/pouch/large_generic
	steps = list(
		list(/obj/item/weapon/storage/pouch/medium_generic, 1, time = 40),
		list(/obj/item/stack/cable_coil, 5,  time = 20),
		list(/obj/item/weapon/storage/pouch/medium_generic, 1, time = 40)
	)

//Tool belt
/datum/craft_recipe/storage/tool_blet
	name = "tool belt"
	result = /obj/item/weapon/storage/belt/utility
	steps = list(
		list(/obj/item/weapon/storage/pouch/engineering_supply, 1, time = 40),
		list(/obj/item/stack/cable_coil, 5,  time = 20),
		list(/obj/item/weapon/storage/pouch/engineering_tools, 1, time = 40)
	)

//Med belt
/datum/craft_recipe/storage/med_blet
	name = "medical belt"
	result = /obj/item/weapon/storage/belt/medical
	steps = list(
		list(/obj/item/weapon/storage/pouch/medical_supply, 1, time = 40),
		list(/obj/item/stack/cable_coil, 5,  time = 20),
		list(/obj/item/weapon/storage/pouch/medium_generic, 1, time = 40)
	)