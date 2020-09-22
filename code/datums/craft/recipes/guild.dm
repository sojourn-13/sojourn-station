/datum/craft_recipe/guild
	category = "Guild"
	time = 100
	related_stats = list(STAT_COG)
	avaliableToEveryone = FALSE


//Armor mods ----------------------
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

//Tools --------------------------
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

//Weapons ------------------------
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

/datum/craft_recipe/guild/mace
	name = "War Mace"
	result = /obj/item/weapon/tool/hammer/mace
	steps = list(
		list(/obj/item/stack/material/steel, 15, "time" = 30),
		list(QUALITY_SAWING, 30, "time" = 60),
		list(QUALITY_HAMMERING, 30, "time" = 40),
		list(QUALITY_WELDING, 40, "time" = 60)
	)

/datum/craft_recipe/guild/claymore
	name = "Claymore"
	result = /obj/item/weapon/tool/sword
	steps = list(
		list(/obj/item/stack/material/steel, 15, "time" = 30),
		list(QUALITY_SAWING, 30, "time" = 60),
		list(QUALITY_HAMMERING, 30, "time" = 40),
		list(QUALITY_WELDING, 40, "time" = 60)
	)

/datum/craft_recipe/guild/machete
	name = "Machete"
	result = /obj/item/weapon/tool/sword/machete
	steps = list(
		list(/obj/item/stack/material/steel, 15, "time" = 30),
		list(QUALITY_SAWING, 30, "time" = 60),
		list(QUALITY_HAMMERING, 30, "time" = 40),
		list(QUALITY_WELDING, 40, "time" = 60)
	)

/datum/craft_recipe/guild/katana
	name = "Katana"
	result = /obj/item/weapon/tool/sword/katana
	steps = list(
		list(/obj/item/stack/material/plasteel, 10, "time" = 30),
		list(QUALITY_SAWING, 30, "time" = 60),
		list(/obj/item/stack/material/steel, 5, "time" = 30),
		list(QUALITY_WELDING, 40, "time" = 60),
		list(/obj/item/stack/material/diamond, 1, "time" = 30),
		list(QUALITY_HAMMERING, 45, "time" = 40),
		list(/obj/item/weapon/tool_upgrade/productivity/whetstone, 1, "time" = 30)
	)

//Wearables =========================
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

//Tool/Gun Mods ---------------------
//Reinforcement
/datum/craft_recipe/guild/plasmablock
	name = "Plasma Block"
	result = /obj/item/weapon/tool_upgrade/reinforcement/plasmablock
	steps = list(
		list(/obj/item/stack/material/plasteel, 5, "time" = 30),
		list(QUALITY_HAMMERING, 30, "time" = 40),
		list(/obj/item/stack/material/plastic, 2, "time" = 30),
		list(QUALITY_SCREW_DRIVING, 40, "time" = 90),
		list(/obj/item/stack/material/plasma, 1, "time" = 30)
	)

/datum/craft_recipe/guild/rubbermesh
	name = "Rubber Mesh"
	result = /obj/item/weapon/tool_upgrade/reinforcement/rubbermesh
	steps = list(
		list(/obj/item/stack/material/plastic, 3, "time" = 30),
		list(QUALITY_WIRE_CUTTING, 20, "time" = 90)
	)

//Productivity
/datum/craft_recipe/guild/booster
	name = "Booster"
	result = /obj/item/weapon/tool_upgrade/productivity/booster
	steps = list(
		list(/obj/item/stack/material/steel, 3, "time" = 30),
		list(QUALITY_HAMMERING, 20, "time" = 40),
		list(/obj/item/stack/material/plastic, 2, "time" = 30),
		list(QUALITY_SCREW_DRIVING, 25, "time" = 90),
		list(/obj/item/stack/material/gold, 1, "time" = 30),
		list(QUALITY_BOLT_TURNING, 20, "time" = 40)
	)

/datum/craft_recipe/guild/injector
	name = "Plasma Injector"
	result = /obj/item/weapon/tool_upgrade/productivity/injector
	steps = list(
		list(/obj/item/stack/material/steel, 3, "time" = 30),
		list(QUALITY_HAMMERING, 30, "time" = 40),
		list(/obj/item/stack/material/plastic, 2, "time" = 30),
		list(QUALITY_SCREW_DRIVING, 25, "time" = 90),
		list(/obj/item/stack/material/plasma, 2, "time" = 30),
		list(QUALITY_WELDING, 40, "time" = 40)
	)

//Gun Mods
/datum/craft_recipe/guild/weintraub
	name = "\"Hurricane\" full auto kit"
	result = /obj/item/weapon/gun_upgrade/mechanism/weintraub
	steps = list(
		list(/obj/item/stack/material/plasteel, 3, "time" = 30),
		list(QUALITY_SAWING, 30, "time" = 60),
		list(QUALITY_HAMMERING, 20, "time" = 40),
		list(QUALITY_WELDING, 40, "time" = 40),
		list(/obj/item/stack/material/plastic, 2, "time" = 30),
		list(QUALITY_SCREW_DRIVING, 25, "time" = 90),
	)

/datum/craft_recipe/guild/overshooter
	name = "\"Overshooter\" internal magazine kit"
	result = /obj/item/weapon/gun_upgrade/mechanism/overshooter
	steps = list(
		list(/obj/item/stack/material/plasteel, 3, "time" = 30),
		list(QUALITY_SAWING, 30, "time" = 60),
		list(QUALITY_HAMMERING, 20, "time" = 40),
		list(QUALITY_WELDING, 40, "time" = 40),
		list(/obj/item/stack/material/plastic, 2, "time" = 30),
		list(QUALITY_SCREW_DRIVING, 25, "time" = 90),
	)

/datum/craft_recipe/guild/dangerzone
	name = "\"Danger Zone\" Trigger"
	result = /obj/item/weapon/gun_upgrade/trigger/dangerzone
	steps = list(
		list(/obj/item/stack/material/plasteel, 1, "time" = 30),
		list(QUALITY_SAWING, 30, "time" = 60),
		list(QUALITY_HAMMERING, 20, "time" = 40),
		list(QUALITY_WELDING, 40, "time" = 40),
		list(/obj/item/stack/material/plastic, 2, "time" = 30),
		list(QUALITY_BOLT_TURNING, 25, "time" = 90),
	)

/datum/craft_recipe/guild/forged
	name = "Forged Barrel"
	result = /obj/item/weapon/gun_upgrade/barrel/forged
	steps = list(
		list(/obj/item/stack/material/plasteel, 1, "time" = 30),
		list(QUALITY_SAWING, 30, "time" = 60),
		list(QUALITY_HAMMERING, 20, "time" = 40),
		list(QUALITY_WELDING, 40, "time" = 40),
		list(/obj/item/stack/material/plastic, 2, "time" = 30),
		list(QUALITY_BOLT_TURNING, 25, "time" = 90),
	)

/datum/craft_recipe/guild/silencer
	name = "Silencer"
	result = /obj/item/weapon/gun_upgrade/barrel/silencer
	steps = list(
		list(/obj/item/stack/material/plasteel, 3, "time" = 30),
		list(QUALITY_SAWING, 30, "time" = 60),
		list(QUALITY_HAMMERING, 20, "time" = 40),
		list(QUALITY_WELDING, 40, "time" = 40),
		list(/obj/item/stack/material/plastic, 1, "time" = 30),
		list(QUALITY_CUTTING, 25, "time" = 90),
	)

//Machines
/datum/craft_recipe/guild/turretcircuit
	name = "Circuit: Artificer Turret"
	result = /obj/item/weapon/circuitboard/artificer_turret
	steps = list(
		list(/obj/item/weapon/computer_hardware/processor_unit/super, 1, "time" = 30),
		list(/obj/item/stack/cable_coil, 5, "time" = 20),
		list(QUALITY_SCREW_DRIVING, 40, "time" = 90),
		list(QUALITY_WELDING, 40, "time" = 90),
	)