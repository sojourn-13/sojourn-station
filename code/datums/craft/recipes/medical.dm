/datum/craft_recipe/medical
	category = "Medical"
	related_stats = list(STAT_COG)

/datum/craft_recipe/medical/bandage
	name = "bandages"
	result = /obj/item/stack/medical/bruise_pack/handmade
	icon_state = "clothing"
	steps = list(
		list(CRAFT_MATERIAL, 5, MATERIAL_CLOTH, "time" = 15),
	)

/datum/craft_recipe/medical/silkointment
	name = "spider silk ointment"
	result = /obj/item/stack/medical/ointment/handmade
	steps = list(
		list(CRAFT_MATERIAL, 5, MATERIAL_SILK, "time" = 30),
	)

/datum/craft_recipe/medical/rag
	name = "rag from clothing"
	result = /obj/item/reagent_containers/glass/rag
	icon_state = "clothing"
	steps = list(
		list(/obj/item/clothing, 1, "time" = 30)
	)

/datum/craft_recipe/medical/rag/alt
	name = "rag from cloth"
	result = /obj/item/reagent_containers/glass/rag
	icon_state = "clothing"
	steps = list(
		list(CRAFT_MATERIAL, 3, MATERIAL_CLOTH, "time" = 15),
	)

/datum/craft_recipe/medical/blood_pack
	name = "blood pack"
	result = /obj/item/reagent_containers/blood/empty
	steps = list(
		list(CRAFT_MATERIAL, 1, MATERIAL_PLASTIC)
	)

/datum/craft_recipe/medical/bottle
	name = "bottle"
	result = /obj/item/reagent_containers/glass/bottle
	steps = list(
		list(CRAFT_MATERIAL, 1, MATERIAL_GLASS),
		list(QUALITY_WELDING, 10, 70)
	)

/datum/craft_recipe/medical/potion_bottle
	name = "elegant bottle"
	result = /obj/item/reagent_containers/glass/bottle/potion
	steps = list(
		list(CRAFT_MATERIAL, 1, MATERIAL_GLASS),
		list(QUALITY_WELDING, 10, 70)
	)

/datum/craft_recipe/medical/pointy_bottle
	name = "tincture bottle"
	result = /obj/item/reagent_containers/glass/bottle/tincture
	steps = list(
		list(CRAFT_MATERIAL, 1, MATERIAL_GLASS),
		list(QUALITY_WELDING, 10, 70)
	)

/datum/craft_recipe/medical/beaker
	name = "beaker"
	result = /obj/item/reagent_containers/glass/beaker
	steps = list(
		list(CRAFT_MATERIAL, 1, MATERIAL_GLASS),
		list(QUALITY_WELDING, 10, 70)
	)

/datum/craft_recipe/medical/beaker_large
	name = "large beaker"
	result = /obj/item/reagent_containers/glass/beaker/large
	steps = list(
		list(CRAFT_MATERIAL, 2, MATERIAL_GLASS),
		list(QUALITY_WELDING, 10, 70)
	)

/datum/craft_recipe/medical/bone_braces
	name = "bone braces"
	result = /obj/item/modification/organ/internal/electromechanical/bone_braces
	steps = list(
		list(CRAFT_MATERIAL, 3, MATERIAL_PLASTEEL),
		list(QUALITY_WELDING, 20, 50),
		list(QUALITY_WIRE_CUTTING, 10, 120)
	)
	related_stats = list(STAT_COG, STAT_BIO, STAT_MEC)

/datum/craft_recipe/medical/improsplint
	name = "improvised splints"
	result = /obj/item/stack/medical/splint/improvised
	steps = list(
		list(CRAFT_MATERIAL, 2, MATERIAL_WOOD),
		list(/obj/item/stack/cable_coil, 5, "time" = 5),
		list(QUALITY_WIRE_CUTTING, 10, "time" = 10)
	)
	related_stats = list(STAT_BIO, STAT_MEC)

/datum/craft_recipe/medical/makeshift_leg
	name = "Junktech prosthetic left leg"
	result = /obj/item/organ/external/robotic/junktech/l_leg
	steps = list(
		list(CRAFT_MATERIAL, 5, MATERIAL_STEEL, "time" = 0),
		list(QUALITY_CUTTING, 10, 10),
		list(QUALITY_WELDING, 10, 10),
		list(/obj/item/stack/cable_coil, 5, "time" = 0),
		list(QUALITY_WIRE_CUTTING, 10, 10),
		list(/obj/item/stock_parts/manipulator, 1),
		list(QUALITY_PULSING, 10, 10),
		list(/obj/item/reagent_containers/glass/bucket, 1)
	)
	related_stats = list(STAT_MEC)

/datum/craft_recipe/medical/makeshift_leg/right
	name = "Junktech prosthetic right leg"
	result = /obj/item/organ/external/robotic/junktech/r_leg

/datum/craft_recipe/medical/makeshift_arm
	name = "Junktech prosthetic left arm"
	result = /obj/item/organ/external/robotic/junktech/l_arm
	steps = list(
		list(CRAFT_MATERIAL, 5, MATERIAL_STEEL, "time" = 0),
		list(QUALITY_CUTTING, 10, 10),
		list(QUALITY_WELDING, 10, 10),
		list(/obj/item/stack/cable_coil, 5, "time" = 0),
		list(QUALITY_WIRE_CUTTING, 10, 10),
		list(/obj/item/stock_parts/manipulator, 1),
		list(QUALITY_PULSING, 10, 10),
		list(/obj/item/tool/knife/hook, 1)
	)
	related_stats = list(STAT_MEC)

/datum/craft_recipe/medical/makeshift_arm/right
	name = "Junktech prosthetic right arm"
	result = /obj/item/organ/external/robotic/junktech/r_arm
