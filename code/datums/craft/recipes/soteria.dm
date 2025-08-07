/datum/craft_recipe/soteria
	category = "Soteria"
	time = 100
	related_stats = list(STAT_BIO)
	requiredPerk = PERK_NERD //Give me your lunch money.

//Soteria healing kits

// 10.03.25 - CFW - Moving to miscelaneous as a test QOL patch
/*
/datum/craft_recipe/soteria/cloth
	name = "salvage cloth"
	result = /obj/item/stack/material/cloth/soteria
	icon_state = "clothing"
	steps = list(
		list(/obj/item/clothing, 1, "time" = 25),
		list(QUALITY_CUTTING, 10, "time" = 30)
	)
*/

/datum/craft_recipe/soteria/gauze
	name = "Soteria medical gauze"
	result = /obj/item/stack/medical/bruise_pack/soteria
	icon_state = "clothing"
	steps = list(
		list(CRAFT_MATERIAL, 8, MATERIAL_CLOTH, "time" = 1),
		list(QUALITY_CUTTING, 30, "time" = 5),
		list(QUALITY_CAUTERIZING, 30, "time" = 1),
		list(/obj/item/stack/sterilizer_crystal, 1),
		list(QUALITY_BONE_SETTING, 30, "time" = 5),
		list(QUALITY_CLAMPING, 30, "time" = 1)
	)

/datum/craft_recipe/soteria/ointment
	name = "Soteria medical ointment"
	result = /obj/item/stack/medical/ointment/soteria
	icon_state = "clothing"
	steps = list(
		list(CRAFT_MATERIAL, 3, MATERIAL_PLASTIC, "time" = 1),
		list(QUALITY_CUTTING, 30, "time" = 5),
		list(QUALITY_CAUTERIZING, 30, "time" = 1),
		list(/obj/item/stack/sterilizer_crystal, 1),
		list(QUALITY_BONE_SETTING, 30, "time" = 5),
		list(QUALITY_CLAMPING, 30, "time" = 1),
	)

/datum/craft_recipe/soteria/blackshield_gauze
	name = "Blackshield trauma gauze"
	result = /obj/item/stack/medical/bruise_pack/blacshield
	icon_state = "clothing"
	steps = list(
		list(CRAFT_MATERIAL, 6, MATERIAL_CLOTH, "time" = 1),
		list(QUALITY_CUTTING, 25, "time" = 5),
		list(QUALITY_CAUTERIZING, 25, "time" = 1),
		list(QUALITY_BONE_SETTING, 25, "time" = 5),
		list(QUALITY_CLAMPING, 25, "time" = 1),
	)

/datum/craft_recipe/soteria/blackshield_ointment
	name = "Blackshield trauma ointment"
	result = /obj/item/stack/medical/ointment/blacshield
	icon_state = "clothing"
	steps = list(
		list(CRAFT_MATERIAL, 3, MATERIAL_PLASTIC, "time" = 1),
		list(QUALITY_CUTTING, 25, "time" = 5),
		list(QUALITY_CAUTERIZING, 25, "time" = 1),
		list(QUALITY_BONE_SETTING, 25, "time" = 5),
		list(QUALITY_CLAMPING, 25, "time" = 1),
	)

/datum/craft_recipe/soteria/soteria_gauze
	name = "roll of gauze"
	result = /obj/item/stack/medical/bruise_pack
	icon_state = "clothing"
	steps = list(
		list(CRAFT_MATERIAL, 8, MATERIAL_CLOTH, "time" = 1),
		list(QUALITY_CUTTING, 30, "time" = 5),
		list(QUALITY_CAUTERIZING, 30, "time" = 1),
	)

/datum/craft_recipe/soteria/soteria_ointment
	name = "bottle of ointment"
	result = /obj/item/stack/medical/ointment
	icon_state = "clothing"
	steps = list(
		list(CRAFT_MATERIAL, 3, MATERIAL_PLASTIC, "time" = 1),
		list(QUALITY_CUTTING, 30, "time" = 5),
		list(QUALITY_CAUTERIZING, 30, "time" = 1),
	)
