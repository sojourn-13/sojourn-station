/datum/craft_recipe/medical
	category = "Medical"
	related_stats = list(STAT_COG)

/datum/craft_recipe/medical/bandage
	name = "bandages"
	result = /obj/item/stack/medical/bruise_pack/handmade
	icon_state = "clothing"
	steps = list(
		list(/obj/item/clothing, 1, time = 30)
	)

/datum/craft_recipe/medical/blood_pack
	name = "blood pack"
	result = /obj/item/weapon/reagent_containers/blood/empty
	steps = list(
		list(CRAFT_MATERIAL, 1, MATERIAL_PLASTIC)
	)