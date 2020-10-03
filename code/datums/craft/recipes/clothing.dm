/datum/craft_recipe/clothing
	category = "Clothing"
	time = 50
	related_stats = list(STAT_COG)

/datum/craft_recipe/clothing/armorvest
	name = "armor vest"
	result = /obj/item/clothing/suit/armor/vest/handmade
	steps = list(
		list(/obj/item/clothing/suit/storage/hazardvest, 1, "time" = 30),
		list(CRAFT_MATERIAL, 4, MATERIAL_STEEL),
		list(/obj/item/stack/cable_coil, 4)
	)

/datum/craft_recipe/clothing/armorvest_black
	name = "black armor vest"
	result = /obj/item/clothing/suit/armor/vest/handmade_black
	steps = list(
		list(/obj/item/clothing/suit/storage/hazardvest_black, 1, "time" = 30),
		list(CRAFT_MATERIAL, 4, MATERIAL_STEEL),
		list(/obj/item/stack/cable_coil, 4)
	)

/datum/craft_recipe/clothing/balaclava
	name = "balaclava"
	result = /obj/item/clothing/mask/balaclava
	steps = list(
		list(/obj/item/stack/material/cloth, 10, time = 15),
		list(QUALITY_CUTTING, 10, 60)
	)

/datum/craft_recipe/clothing/handmadebelt
	name = "hand-made toolbelt"
	result = /obj/item/weapon/storage/belt/utility/handmade
	steps = list(
		list(/obj/item/stack/cable_coil, 30, time = 15),
		list(QUALITY_CUTTING, 10, 60)
	)

/datum/craft_recipe/clothing/blindfold
	name = "blindfold"
	result = /obj/item/clothing/glasses/blindfold
	steps = list(
		list(/obj/item/stack/material/cloth, 5, time = 15),
		list(QUALITY_CUTTING, 10, 60)
	)

// Masacare poor bucket, but gain some better protection. Cut bigger holes for eyes, drill small ones for some air.
/datum/craft_recipe/clothing/cheap_greathelm
	name = "bucket-helm"
	result = /obj/item/clothing/head/helmet/handmade/greathelm
	steps = list(
		list(/obj/item/weapon/reagent_containers/glass/bucket, 1, "time" = 30),
		list(QUALITY_CUTTING, 15, 120),
		list(QUALITY_DRILLING, 10, 60),
		list(CRAFT_MATERIAL, 6, MATERIAL_STEEL),
		list(/obj/item/stack/cable_coil, 4)
	)

/datum/craft_recipe/clothing/cardborg_helmet
	name = "cardborg helmet"
	result = /obj/item/clothing/head/costume/halloween/cardborg
	steps = list(
		list(CRAFT_MATERIAL, 1, MATERIAL_CARDBOARD)
	)

/datum/craft_recipe/clothing/cardborg_suit
	name = "cardborg suit"
	result = /obj/item/clothing/suit/costume/halloween/cardborg
	steps = list(
		list(CRAFT_MATERIAL, 3, MATERIAL_CARDBOARD)
	)

// Add some steel to gloves. Simple.
/datum/craft_recipe/clothing/combat_gloves
	name = "combat gloves"
	result = /obj/item/clothing/gloves/thick/handmade
	steps = list(
		list(/obj/item/clothing/gloves/thick, 1, "time" = 15),
		list(CRAFT_MATERIAL, 2, MATERIAL_STEEL),
		list(/obj/item/stack/cable_coil, 2)
	)

/datum/craft_recipe/clothing/combat_helmet
	name = "combat helmet"
	result = /obj/item/clothing/head/helmet/handmade
	steps = list(
		list(/obj/item/weapon/reagent_containers/glass/bucket, 1, "time" = 30),
		list(CRAFT_MATERIAL, 4, MATERIAL_STEEL),
		list(/obj/item/stack/cable_coil, 2)
	)

/datum/craft_recipe/clothing/muzzle
	name = "muzzle"
	result = /obj/item/clothing/mask/muzzle
	steps = list(
		list(/obj/item/stack/material/cloth, 5, time = 15),
		list(CRAFT_MATERIAL, 1, MATERIAL_STEEL),
		list(QUALITY_CUTTING, 10, 60)
	)

// Butcher some clothes into rags to make some cloak
/datum/craft_recipe/clothing/cloak
	name = "ragged cloak"
	result = /obj/item/clothing/suit/hooded/cloak/simple
	steps = list(
		list(/obj/item/clothing, 1, time = 30),
		list(/obj/item/clothing, 1, time = 30),
		list(QUALITY_CUTTING, 10, 60)
	)


/datum/craft_recipe/clothing/sandals
	name = "wooden sandals"
	result = /obj/item/clothing/shoes/sandal
	steps = list(
		list(CRAFT_MATERIAL, 1, MATERIAL_WOOD)
	)