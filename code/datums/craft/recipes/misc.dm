/datum/craft_recipe/ashtray
	name = "ashtray"
	result = /obj/item/material/ashtray
	steps = list(
		list(CRAFT_MATERIAL, 1, MATERIAL_STEEL)
	)
	related_stats = list(STAT_COG)

/datum/craft_recipe/tray
	name = "dinner tray"
	result = /obj/item/tray
	steps = list(
		list(CRAFT_MATERIAL, 1, MATERIAL_STEEL, "time" = 40),
		list(QUALITY_WIRE_CUTTING, 10, 120)
	)
	related_stats = list(STAT_COG)

/datum/craft_recipe/folder
	name = "folder, black"
	steps = list(
		list(CRAFT_MATERIAL, 1, MATERIAL_CARDBOARD)
	)
	related_stats = list(STAT_COG)

/datum/craft_recipe/folder/blue
	name = "folder, blue"
	result = /obj/item/folder/blue

/datum/craft_recipe/folder/cyan
	name = "folder, cyan"
	result = /obj/item/folder/cyan

/datum/craft_recipe/folder/grey
	name = "folder, grey"
	result = /obj/item/folder

/datum/craft_recipe/folder/red
	name = "folder, red"
	result = /obj/item/folder/red

/datum/craft_recipe/folder/yellow
	name = "folder, yellow"
	result = /obj/item/folder/yellow

/datum/craft_recipe/plasticflaps
	name = "plastic flaps"
	result = /obj/structure/plasticflaps
	steps = list(
		list(CRAFT_MATERIAL, 4, MATERIAL_PLASTIC) //I can see people abusing this a lot
	)
	flags = CRAFT_ON_FLOOR|CRAFT_ONE_PER_TURF

/datum/craft_recipe/metal_rod
	name = "metal rod"
	result = /obj/item/stack/rods
	time = 0
	steps = list(
		list(CRAFT_MATERIAL, 1, MATERIAL_STEEL)
	)
	flags = CRAFT_BATCH
	related_stats = list(STAT_COG)

/datum/craft_recipe/pipe
	name = "Smoking pipe"
	result = /obj/item/clothing/mask/smokable/pipe
	icon_state = "woodworking"
	steps = list(
		list(CRAFT_MATERIAL, 5, MATERIAL_WOOD, "time" = 0),
		list(QUALITY_CUTTING, 10, 10)
	)
	related_stats = list(STAT_COG)

/datum/craft_recipe/cloth_stripe
	name = "salvage cloth"
	result = /obj/item/stack/material/cloth/random
	icon_state = "clothing"
	steps = list(
		list(/obj/item/clothing/under, 1, "time" = 25),
		list(QUALITY_CUTTING, 10, "time" = 30)
	)

/datum/craft_recipe/ameridian_seed
	name = "ameridian growth"
	flags = CRAFT_ON_FLOOR|CRAFT_ONE_PER_TURF
	result = /obj/structure/ameridian_crystal
	icon_state = "device"
	steps = list(
		list(CRAFT_MATERIAL, 5, MATERIAL_AMERIDIAN, "time" = 25)
	)

/datum/craft_recipe/ameridian_seed_red
	name = "red ameridian growth"
	flags = CRAFT_ON_FLOOR|CRAFT_ONE_PER_TURF
	result = /obj/structure/ameridian_crystal/red
	icon_state = "device"
	steps = list(
		list(/obj/item/ameridian_core, 1, "time" = 25)
	)
