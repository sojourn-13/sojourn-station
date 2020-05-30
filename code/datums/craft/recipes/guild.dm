/datum/craft_recipe/guild
	category = "Guild"
	time = 100
	related_stats = list(STAT_COG)
	avaliableToEveryone = FALSE

//A rod with bits of pointy shrapnel stuck to it. Good weapon
/datum/craft_recipe/guild/melee
	name = "melee plating"
	result = /obj/item/weapon/tool_upgrade/reinforcement/melee
	steps = list(
		list(CRAFT_MATERIAL, 10, MATERIAL_STEEL, "time" = 60),
		list(QUALITY_WELDING, 30, "time" = 60),
		list(QUALITY_CUTTING, 20, "time" = 180),
		list(QUALITY_HAMMERING, 30, "time" = 180),
		list(CRAFT_MATERIAL, 10, MATERIAL_STEEL, "time" = 60),
		list(QUALITY_WELDING, 30, "time" = 30),
		list(QUALITY_CUTTING, 20, "time" = 40),
		list(QUALITY_SCREW_DRIVING, 40, "time" = 90),
		list(QUALITY_WELDING, 40, "time" = 120),
		list(CRAFT_MATERIAL, 10, MATERIAL_STEEL, "time" = 60),
		list(QUALITY_BOLT_TURNING, 40, "time" = 120),
		list(QUALITY_SAWING, 30, "time" = 60)
	)

/datum/craft_recipe/guild/bullet
	name = "ballistic plating"
	result = /obj/item/weapon/tool_upgrade/reinforcement/bullet
	steps = list(
		list(CRAFT_MATERIAL, 10, MATERIAL_PLASTEEL, "time" = 60),
		list(QUALITY_WELDING, 30, "time" = 60),
		list(QUALITY_CUTTING, 20, "time" = 180),
		list(QUALITY_HAMMERING, 30, "time" = 180),
		list(CRAFT_MATERIAL, 10, MATERIAL_PLASTEEL, "time" = 60),
		list(QUALITY_WELDING, 30, "time" = 30),
		list(QUALITY_CUTTING, 20, "time" = 40),
		list(QUALITY_SCREW_DRIVING, 40, "time" = 90),
		list(QUALITY_WELDING, 40, "time" = 120),
		list(CRAFT_MATERIAL, 10, MATERIAL_PLASTEEL, "time" = 60),
		list(QUALITY_BOLT_TURNING, 40, "time" = 120),
		list(QUALITY_SAWING, 30, "time" = 60)
	)

/datum/craft_recipe/guild/energy
	name = "energy plating"
	result = /obj/item/weapon/tool_upgrade/reinforcement/energy
	steps = list(
		list(CRAFT_MATERIAL, 10, MATERIAL_PLATINUM, "time" = 60),
		list(QUALITY_WELDING, 30, "time" = 60),
		list(QUALITY_CUTTING, 20, "time" = 180),
		list(QUALITY_HAMMERING, 30, "time" = 180),
		list(CRAFT_MATERIAL, 10, MATERIAL_PLATINUM, "time" = 60),
		list(QUALITY_WELDING, 30, "time" = 30),
		list(QUALITY_CUTTING, 20, "time" = 40),
		list(QUALITY_SCREW_DRIVING, 40, "time" = 90),
		list(QUALITY_WELDING, 40, "time" = 120),
		list(CRAFT_MATERIAL, 10, MATERIAL_PLATINUM, "time" = 60),
		list(QUALITY_BOLT_TURNING, 40, "time" = 120),
		list(QUALITY_SAWING, 30, "time" = 60)
	)

/datum/craft_recipe/guild/bomb
	name = "bomb proofing"
	result = /obj/item/weapon/tool_upgrade/reinforcement/bomb
	steps = list(
		list(CRAFT_MATERIAL, 10, MATERIAL_PLASTEEL, "time" = 60),
		list(QUALITY_WELDING, 30, "time" = 60),
		list(QUALITY_CUTTING, 20, "time" = 180),
		list(QUALITY_HAMMERING, 30, "time" = 180),
		list(/obj/item/stack/material/cloth, 5, "time" = 60),
		list(QUALITY_WELDING, 30, "time" = 30),
		list(QUALITY_CUTTING, 20, "time" = 40),
		list(QUALITY_SCREW_DRIVING, 40, "time" = 90),
		list(QUALITY_WELDING, 40, "time" = 120),
		list(CRAFT_MATERIAL, 10, MATERIAL_PLASTEEL, "time" = 60),
		list(QUALITY_BOLT_TURNING, 40, "time" = 120),
		list(QUALITY_SAWING, 30, "time" = 60)
	)