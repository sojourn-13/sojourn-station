/datum/craft_recipe/clothing
	category = "Clothing"
	icon_state = "armor_part"
	time = 50
	related_stats = list(STAT_COG)

/datum/craft_recipe/clothing/balaclava
	name = "balaclava"
	result = /obj/item/clothing/mask/balaclava
	steps = list(
		list(/obj/item/stack/material/cloth, 10, time = 15),
		list(QUALITY_CUTTING, 10, 60)
	)

/datum/craft_recipe/clothing/handmadebelt
	name = "hand-made tool belt"
	result = /obj/item/storage/belt/utility/handmade
	icon_state = "clothing"
	steps = list(
		list(/obj/item/stack/cable_coil, 30, time = 15),
		list(QUALITY_CUTTING, 10, 60)
	)

/datum/craft_recipe/clothing/blindfold
	name = "blindfold"
	result = /obj/item/clothing/glasses/blindfold
	icon_state = "clothing"
	steps = list(
		list(/obj/item/stack/material/cloth, 5, time = 15),
		list(QUALITY_CUTTING, 10, 60)
	)

/datum/craft_recipe/clothing/cardborg_helmet
	name = "cardborg helmet"
	result = /obj/item/clothing/head/costume/halloween/cardborg
	icon_state = "clothing"
	steps = list(
		list(CRAFT_MATERIAL, 1, MATERIAL_CARDBOARD)
	)

/datum/craft_recipe/clothing/cardborg_suit
	name = "cardborg suit"
	result = /obj/item/clothing/suit/costume/halloween/cardborg
	icon_state = "clothing"
	steps = list(
		list(CRAFT_MATERIAL, 3, MATERIAL_CARDBOARD)
	)

/datum/craft_recipe/clothing/chest_rig
	name = "chest rig"
	result = /obj/item/clothing/suit/storage/vest/chestrig
	steps = list(
		list(/obj/item/stack/medical/bruise_pack/handmade, 3, "time" = 10),
		list(/obj/item/stack/rods, 2, "time" = 10),
		list(/obj/item/stack/cable_coil, 2)
	)

/datum/craft_recipe/clothing/muzzle
	name = "muzzle"
	result = /obj/item/clothing/mask/muzzle
	icon_state = "clothing"
	steps = list(
		list(/obj/item/stack/material/cloth, 5, time = 15),
		list(CRAFT_MATERIAL, 1, MATERIAL_STEEL),
		list(QUALITY_CUTTING, 10, 60)
	)

// Flower Crowns

/datum/craft_recipe/clothing/poppycrown
	name = "Poppy Crown"
	result = /obj/item/clothing/head/flowercrown
	icon_state = "clothing"
	steps = list(
		list(/obj/item/stack/cable_coil, 15, time = 15),
		list(/obj/item/clothing/head/hairflower, 3, time = 30)
	)

/datum/craft_recipe/clothing/sunflowerflowercrown
	name = "Sunflower Crown"
	result = /obj/item/clothing/head/flowercrown/sunflower
	icon_state = "clothing"
	steps = list(
		list(/obj/item/stack/cable_coil, 15, time = 15),
		list(/obj/item/clothing/head/hairflower/yellow, 3, time = 30)
	)

/datum/craft_recipe/clothing/lilyflowercrown
	name = "Lily Crown"
	result = /obj/item/clothing/head/flowercrown/lily
	icon_state = "clothing"
	steps = list(
		list(/obj/item/stack/cable_coil, 15, time = 15),
		list(/obj/item/clothing/head/pin/clover, 3, time = 30)
	)

/datum/craft_recipe/clothing/rainbowflowercrown
	name = "Rainbow Crown"
	result = /obj/item/clothing/head/flowercrown/rainbow
	icon_state = "clothing"
	steps = list(
		list(/obj/item/stack/cable_coil, 15, time = 15),
		list(/obj/item/clothing/head/hairflower/violet, 3, time = 30)
	)

// Butcher some clothes into rags to make some cloak
/datum/craft_recipe/clothing/cloak
	name = "ragged cloak"
	result = /obj/item/clothing/suit/hooded/cloak/simple
	icon_state = "clothing"
	steps = list(
		list(/obj/item/clothing, 1, time = 30),
		list(/obj/item/clothing, 1, time = 30),
		list(QUALITY_CUTTING, 10, 60)
	)

/datum/craft_recipe/clothing/sandals
	name = "wooden sandals"
	result = /obj/item/clothing/shoes/sandal
	icon_state = "woodworking"
	steps = list(
		list(CRAFT_MATERIAL, 1, MATERIAL_WOOD)
	)

/***********************
* 	Outsider crafts
************************/

/datum/craft_recipe/clothing/tac_clothes
	name = "tactical baggy rags"
	result = /obj/item/clothing/under/outcast
	icon_state = "clothing"
	steps = list(
		list(/obj/item/clothing, 1, time = 30),
		list(/obj/item/clothing, 1, time = 30),
		list(QUALITY_CUTTING, 15, 30),
		list(CRAFT_MATERIAL, 5, MATERIAL_LEATHER, "time" = 60),
		list(QUALITY_SAWING, 15, 30)
		)

/datum/craft_recipe/clothing/outsider_cloak
	name = "outcast's cloak"
	result = /obj/item/clothing/suit/storage/raggedcape
	icon_state = "clothing"
	steps = list(
		list(/obj/item/clothing, 1, time = 30),
		list(/obj/item/clothing, 1, time = 30),
		list(QUALITY_CUTTING, 15, 30),
		list(CRAFT_MATERIAL, 5, MATERIAL_LEATHER, "time" = 60),
		list(QUALITY_SAWING, 15, 30)
		)

/datum/craft_recipe/clothing/outsider_hood
	name = "outcast's hood"
	result = /obj/item/clothing/head/outcasthood
	icon_state = "clothing"
	steps = list(
		list(/obj/item/clothing, 1, time = 30),
		list(/obj/item/clothing, 1, time = 30),
		list(QUALITY_CUTTING, 15, 30),
		list(CRAFT_MATERIAL, 1, MATERIAL_LEATHER, "time" = 60),
		list(QUALITY_SAWING, 15, 30)
		)

/datum/craft_recipe/clothing/outsider_cape
	name = "outcast's cape"
	result = /obj/item/clothing/accessory/cape/outsider
	icon_state = "clothing"
	steps = list(
		list(/obj/item/clothing/suit/storage/raggedcape, 1, "time" = 30),
		list(QUALITY_CUTTING, 15, 30)
	)
/datum/craft_recipe/clothing/tribalhide
	name = "Tribal Hides"
	result =  /obj/item/clothing/under/tribalhide
	icon_state = "clothing"
	steps = list(
		list(CRAFT_MATERIAL, 5, MATERIAL_LEATHER, "time" = 60),
		list(QUALITY_CUTTING, 15, 30),
	)

/datum/craft_recipe/clothing/swat_yellow
	name = "insulated combat gloves"
	result = /obj/item/clothing/gloves/thick/swat/insulated
	steps = list(
		list(/obj/item/clothing/gloves/thick/swat, 1, "time" = 30),
		list(QUALITY_CUTTING, 15, 30),
		list(/obj/item/clothing/gloves/insulated, 1, "time" = 30),
		list(QUALITY_CUTTING, 15, 30),
		list(CRAFT_MATERIAL, 3, MATERIAL_PLASTIC), //So if we use buget we have a reason to think its really shock proof
		list(QUALITY_WELDING, 10, "time" = 30), //melt down things
		list(QUALITY_HAMMERING, 15, 10) //Harden into shape
	)
