/datum/craft_recipe/ashtray
	name = "ashtray"
	result = /obj/item/weapon/material/ashtray
	steps = list(
		list(CRAFT_MATERIAL, 1, MATERIAL_STEEL)
	)
	related_stats = list(STAT_COG)

/datum/craft_recipe/medical/rag
	name = "rag"
	result = /obj/item/weapon/reagent_containers/glass/rag
	steps = list(
		list(/obj/item/clothing, 1, time = 30)
	)

/datum/craft_recipe/tray
	name = "dinner tray"
	result = /obj/item/weapon/tray
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
	result = /obj/item/weapon/folder/blue

/datum/craft_recipe/folder/cyan
	name = "folder, cyan"
	result = /obj/item/weapon/folder/cyan

/datum/craft_recipe/folder/grey
	name = "folder, grey"
	result = /obj/item/weapon/folder

/datum/craft_recipe/folder/red
	name = "folder, red"
	result = /obj/item/weapon/folder/red

/datum/craft_recipe/folder/yellow
	name = "folder, yellow"
	result = /obj/item/weapon/folder/yellow

/datum/craft_recipe/metal_rod
	name = "metal rod"
	result = /obj/item/stack/rods
	time = 0
	steps = list(
		list(CRAFT_MATERIAL, 1, MATERIAL_STEEL)
	)
	flags = CRAFT_BATCH
	related_stats = list(STAT_COG)

/datum/craft_recipe/plastic_bag
	name = "plastic bag"
	result = /obj/item/weapon/storage/bag/plastic
	steps = list(
		list(CRAFT_MATERIAL, 1, MATERIAL_PLASTIC)
	)
	related_stats = list(STAT_COG)

/datum/craft_recipe/pipe
	name = "Smoking pipe"
	result = /obj/item/clothing/mask/smokable/pipe
	steps = list(
		list(CRAFT_MATERIAL, 5, MATERIAL_WOOD, "time" = 0),
		list(QUALITY_CUTTING, 10, 10)
	)
	related_stats = list(STAT_COG)