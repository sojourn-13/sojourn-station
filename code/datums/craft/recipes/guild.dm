/datum/craft_recipe/guild
	category = "Guild"
	time = 100
	related_stats = list(STAT_COG)
	avaliableToEveryone = FALSE

/datum/craft_recipe/guild/ai_tool
	name = "Tool Mod:Integrated Tool AI"
	result = /obj/item/weapon/tool_upgrade/augment/guild_ai_tool
	steps = list(
		list(CRAFT_MATERIAL, 30, MATERIAL_STEEL, "time" = 60),
		list(CRAFT_MATERIAL, 7, MATERIAL_SILVER, "time" = 60),
		list(CRAFT_MATERIAL, 7, MATERIAL_GOLD, "time" = 60),
		list(QUALITY_CUTTING, 20, "time" = 180),
		list(QUALITY_SCREW_DRIVING, 30, "time" = 90),
		list(QUALITY_BOLT_TURNING, 30, "time" = 120),
		list(/obj/item/stack/cable_coil, 2, "time" = 10),
		list(/obj/item/device/aicard, 1, "time" = 360),
		list(/obj/item/stack/cable_coil, 2, "time" = 10),
		list(QUALITY_CUTTING, 30, "time" = 180),
		list(QUALITY_SCREW_DRIVING, 40, "time" = 90),
		list(QUALITY_BOLT_TURNING, 40, "time" = 120),
		list(/obj/item/weapon/cell/small/moebius/nuclear, 1),
		list(QUALITY_ADHESIVE, 15, 70, "time" = 10)
	)

/datum/craft_recipe/guild/oxy_fuel
	name = "Tool Mod: Oxy Fuel"
	result = /obj/item/weapon/tool_upgrade/combo/oxy_fuel
	steps = list(
		list(CRAFT_MATERIAL, 10, MATERIAL_PLASTIC, "time" = 60),
		list(QUALITY_WELDING, 40, "time" = 60),
		list(/obj/item/weapon/tool_upgrade/productivity/oxyjet, 1, "time" = 15),
		list(/obj/item/weapon/tool_upgrade/augment/fuel_tank, 1, "time" = 15),
		list(QUALITY_SCREW_DRIVING, 40, "time" = 90),
		list(QUALITY_BOLT_TURNING, 40, "time" = 20),
		list(QUALITY_ADHESIVE, 15, 70, "time" = 10)
	)

/datum/craft_recipe/guild/sound_sink
	name = "Tool Mod: Sound-Sunk"
	result = /obj/item/weapon/tool_upgrade/combo/sound_sink
	steps = list(
		list(/obj/item/weapon/tool_upgrade/reinforcement/heatsink, 1, "time" = 60),
		list(QUALITY_WELDING, 40, "time" = 60),
		list(QUALITY_CUTTING, 30, "time" = 60),
		list(/obj/item/weapon/tool_upgrade/augment/dampener, 1, "time" = 60),
		list(QUALITY_HAMMERING, 20, "time" = 90),
		list(QUALITY_SCREW_DRIVING, 30, "time" = 90),
		list(QUALITY_ADHESIVE, 15, 70, "time" = 10)
	)

/datum/craft_recipe/guild/grip
	name = "Tool Mod: Stabled Ergonomic Grip"
	result = /obj/item/weapon/tool_upgrade/combo/supper_grip
	steps = list(
		list(/obj/item/weapon/tool_upgrade/productivity/ergonomic_grip, 1,"time" = 60),
		list(QUALITY_WELDING, 40, "time" = 60),
		list(QUALITY_CUTTING, 30, "time" = 60),
		list(/obj/item/weapon/tool_upgrade/refinement/stabilized_grip, 1, "time" = 60),
		list(QUALITY_SCREW_DRIVING, 30, "time" = 90),
		list(QUALITY_ADHESIVE, 15, 70, "time" = 10)
	)

/datum/craft_recipe/guild/melee
	name = "melee plating"
	result = /obj/item/weapon/tool_upgrade/armor/melee
	steps = list(
		list(CRAFT_MATERIAL, 30, MATERIAL_STEEL, "time" = 60),
		list(QUALITY_WELDING, 40, "time" = 60),
		list(QUALITY_CUTTING, 30, "time" = 180),
		list(QUALITY_HAMMERING, 30, "time" = 180),
		list(QUALITY_SCREW_DRIVING, 40, "time" = 90),
		list(QUALITY_BOLT_TURNING, 40, "time" = 120),
		list(QUALITY_SAWING, 30, "time" = 60)
	)

/datum/craft_recipe/guild/bullet
	name = "ballistic plating"
	result = /obj/item/weapon/tool_upgrade/armor/bullet
	steps = list(
		list(CRAFT_MATERIAL, 30, MATERIAL_PLASTEEL, "time" = 60),
		list(QUALITY_WELDING, 40, "time" = 60),
		list(QUALITY_CUTTING, 30, "time" = 180),
		list(QUALITY_HAMMERING, 30, "time" = 180),
		list(QUALITY_SCREW_DRIVING, 40, "time" = 90),
		list(QUALITY_BOLT_TURNING, 40, "time" = 120),
		list(QUALITY_SAWING, 30, "time" = 60)
	)

/datum/craft_recipe/guild/energy
	name = "energy plating"
	result = /obj/item/weapon/tool_upgrade/armor/energy
	steps = list(
		list(CRAFT_MATERIAL, 30, MATERIAL_PLATINUM, "time" = 60),
		list(QUALITY_WELDING, 40, "time" = 60),
		list(QUALITY_CUTTING, 30, "time" = 180),
		list(QUALITY_HAMMERING, 30, "time" = 180),
		list(QUALITY_SCREW_DRIVING, 40, "time" = 90),
		list(QUALITY_BOLT_TURNING, 40, "time" = 120),
		list(QUALITY_SAWING, 30, "time" = 60)
	)

/datum/craft_recipe/guild/bomb
	name = "bomb proofing"
	result = /obj/item/weapon/tool_upgrade/armor/bomb
	steps = list(
		list(CRAFT_MATERIAL, 20, MATERIAL_PLASTEEL, "time" = 60),
		list(QUALITY_WELDING, 40, "time" = 60),
		list(QUALITY_CUTTING, 30, "time" = 180),
		list(QUALITY_HAMMERING, 30, "time" = 180),
		list(QUALITY_SCREW_DRIVING, 40, "time" = 90),
		list(QUALITY_BOLT_TURNING, 40, "time" = 120),
		list(QUALITY_SAWING, 30, "time" = 60)
	)

/datum/craft_recipe/guild/arcwelder
	name = "arc welder"
	result = /obj/item/weapon/tool/arcwelder
	steps = list(
		list(CRAFT_MATERIAL, 4, MATERIAL_PLASTEEL, "time" = 60),
		list(QUALITY_CUTTING, 20, "time" = 40),
		list(QUALITY_HAMMERING, 30, "time" = 40),
		list(/obj/item/stack/cable_coil, 5, "time" = 20),
		list(QUALITY_WIRE_CUTTING, 20, 30),
		list(QUALITY_SCREW_DRIVING, 20, "time" = 60),
		list(QUALITY_BOLT_TURNING, 30, "time" = 40)
	)

/datum/craft_recipe/guild/railgunrifle
	name = "reductor rail rifle"
	result = /obj/item/weapon/gun/energy/laser/railgun
	steps = list(
		list(CRAFT_MATERIAL, 20, MATERIAL_PLASTEEL, "time" = 60),
		list(/obj/item/stack/material/steel, 8, "time" = 20),
		list(/obj/item/stack/material/silver, 10, "time" = 20),
		list(QUALITY_CUTTING, 30, "time" = 40),
		list(QUALITY_HAMMERING, 30, "time" = 40),
		list(/obj/item/stack/cable_coil, 10, "time" = 20),
		list(QUALITY_WIRE_CUTTING, 40, 30),
		list(QUALITY_SCREW_DRIVING, 40, "time" = 60),
		list(QUALITY_BOLT_TURNING, 40, "time" = 40)
	)

/datum/craft_recipe/guild/railgunpistol
	name = "myrmidon rail pistol"
	result = /obj/item/weapon/gun/energy/laser/railgun/pistol
	steps = list(
		list(CRAFT_MATERIAL, 15, MATERIAL_PLASTEEL, "time" = 60),
		list(/obj/item/stack/material/steel, 4, "time" = 20),
		list(/obj/item/stack/material/silver, 5, "time" = 20),
		list(QUALITY_CUTTING, 30, "time" = 40),
		list(QUALITY_HAMMERING, 30, "time" = 40),
		list(/obj/item/stack/cable_coil, 5, "time" = 20),
		list(QUALITY_WIRE_CUTTING, 40, 30),
		list(QUALITY_SCREW_DRIVING, 40, "time" = 60),
		list(QUALITY_BOLT_TURNING, 40, "time" = 40)
	)

/datum/craft_recipe/guild/technosuit
	name = "'Mark V' enviromental protection suit"
	result = /obj/item/clothing/suit/armor/vest/technomancersuit
	steps = list(
		list(CRAFT_MATERIAL, 40, MATERIAL_PLASTEEL, "time" = 60),
		list(QUALITY_SAWING, 60, "time" = 60),
		list(QUALITY_WELDING, 40, "time" = 60),
		list(QUALITY_CUTTING, 30, "time" = 40),
		list(QUALITY_HAMMERING, 45, "time" = 40),
		list(/obj/item/stack/cable_coil, 30, "time" = 20),
		list(QUALITY_WIRE_CUTTING, 40, 30),
		list(QUALITY_SCREW_DRIVING, 40, "time" = 60),
		list(QUALITY_BOLT_TURNING, 40, "time" = 40)
	)

/datum/craft_recipe/guild/technohelmet
	name = "'Mark V' enviromental protection helmet"
	result = /obj/item/clothing/head/helmet/technomancersuit
	steps = list(
		list(CRAFT_MATERIAL, 20, MATERIAL_PLASTEEL, "time" = 60),
		list(QUALITY_SAWING, 60, "time" = 60),
		list(QUALITY_WELDING, 40, "time" = 60),
		list(QUALITY_CUTTING, 30, "time" = 40),
		list(QUALITY_HAMMERING, 45, "time" = 40),
		list(/obj/item/stack/cable_coil, 30, "time" = 20),
		list(QUALITY_WIRE_CUTTING, 40, 30),
		list(QUALITY_SCREW_DRIVING, 40, "time" = 60),
		list(QUALITY_BOLT_TURNING, 40, "time" = 40)
	)

/datum/craft_recipe/guild/webbing
	name = "Webbing"
	result = /obj/item/weapon/storage/belt/webbing
	steps = list(
		list(/obj/item/weapon/storage/belt, 1, "time" = 30),
		list(/obj/item/weapon/storage/belt, 1, "time" = 30),
		list(/obj/item/stack/cable_coil, 30, "time" = 30),
		list(/obj/item/weapon/storage/pouch/medium_generic, 1, "time" = 40)
	)
