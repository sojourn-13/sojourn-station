/datum/craft_recipe/guild
	category = "Guild"
	time = 100
	related_stats = list(STAT_MEC)
	requiredPerk = PERK_HANDYMAN

//Materal Craft ------------------

/datum/craft_recipe/guild/plasma_glass
	name = "borosilicate glass"
	result = /obj/item/stack/material/glass/plasmaglass
	icon_state = "clothing"
	steps = list(
		list(CRAFT_MATERIAL, 2, MATERIAL_GLASS, "time" = 1),
		list(QUALITY_WELDING, 40, "time" = 5), //Insanely quick do tobeing 1 sheet a time
		list(CRAFT_MATERIAL, 1, MATERIAL_PLASMA, "time" = 1),
		list(QUALITY_WELDING, 40, "time" = 5),
		list(QUALITY_SAWING, 30, "time" = 5)
	)

//bullets -----------------------------

/datum/craft_recipe/guild/payload_arrow
	name = "bulk empty payload arrow"
	result = /obj/item/ammo_casing/arrow/empty_payload/bulk
	icon_state = "woodworking"
	steps = list(
		list(CRAFT_MATERIAL, 1, MATERIAL_PLASTEEL, "time" = 1),
		list(QUALITY_WELDING, 40, "time" = 5),
		list(CRAFT_MATERIAL, 2, MATERIAL_PLASTIC, "time" = 1),
		list(QUALITY_CUTTING, 40, "time" = 5)
	)


//Armor mods ----------------------
/datum/craft_recipe/guild/melee
	name = "melee plating"
	result = /obj/item/tool_upgrade/armor/melee
	icon_state = "clothing"
	steps = list(
		list(CRAFT_MATERIAL, 30, MATERIAL_STEEL, "time" = 60),
		list(QUALITY_WELDING, 40, "time" = 60),
		list(QUALITY_CUTTING, 30, "time" = 180),
		list(QUALITY_HAMMERING, 30, "time" = 180),
		list(QUALITY_SCREW_DRIVING, 40, "time" = 90),
		list(/obj/item/tool_upgrade/reinforcement/rubbermesh, 1),
		list(QUALITY_BOLT_TURNING, 40, "time" = 120),
		list(QUALITY_SAWING, 30, "time" = 60)
	)

/datum/craft_recipe/guild/bullet
	name = "ballistic plating"
	result = /obj/item/tool_upgrade/armor/bullet
	icon_state = "clothing"
	steps = list(
		list(CRAFT_MATERIAL, 10, MATERIAL_PLASTEEL, "time" = 20),
		list(CRAFT_MATERIAL, 10, MATERIAL_PLASTIC , "time" = 20),
		list(CRAFT_MATERIAL, 10, MATERIAL_STEEL, "time" = 20),
		list(QUALITY_WELDING, 40, "time" = 60),
		list(QUALITY_CUTTING, 30, "time" = 180),
		list(QUALITY_HAMMERING, 30, "time" = 180),
		list(/obj/item/tool_upgrade/reinforcement/rubbermesh, 1),
		list(QUALITY_SCREW_DRIVING, 40, "time" = 90),
		list(QUALITY_BOLT_TURNING, 40, "time" = 120),
		list(QUALITY_SAWING, 30, "time" = 60)
	)

/datum/craft_recipe/guild/energy
	name = "energy plating"
	result = /obj/item/tool_upgrade/armor/energy
	icon_state = "clothing"
	steps = list(
		list(CRAFT_MATERIAL, 3, MATERIAL_PLATINUM, "time" = 30),
		list(CRAFT_MATERIAL, 12, MATERIAL_PLASTIC , "time" = 30),
		list(QUALITY_WELDING, 40, "time" = 60),
		list(QUALITY_CUTTING, 30, "time" = 180),
		list(QUALITY_HAMMERING, 30, "time" = 180),
		list(QUALITY_SCREW_DRIVING, 40, "time" = 90),
		list(/obj/item/tool_upgrade/reinforcement/rubbermesh, 1),
		list(QUALITY_BOLT_TURNING, 40, "time" = 120),
		list(QUALITY_SAWING, 30, "time" = 60)
	)

/datum/craft_recipe/guild/bomb
	name = "bomb proofing"
	result = /obj/item/tool_upgrade/armor/bomb
	icon_state = "clothing"
	steps = list(
		list(CRAFT_MATERIAL, 20, MATERIAL_PLASTEEL, "time" = 60),
		list(CRAFT_MATERIAL, 20, MATERIAL_STEEL, "time" = 60),
		list(QUALITY_WELDING, 40, "time" = 60),
		list(QUALITY_CUTTING, 30, "time" = 180),
		list(QUALITY_HAMMERING, 30, "time" = 180),
		list(QUALITY_SCREW_DRIVING, 40, "time" = 90),
		list(/obj/item/tool_upgrade/reinforcement/rubbermesh, 1),
		list(QUALITY_BOLT_TURNING, 40, "time" = 120),
		list(QUALITY_SAWING, 30, "time" = 60)
	)

/datum/craft_recipe/guild/robotmelee //Lots of heating and hammering. Forge your blade samurai.
	name = "robot mark III reinforced armor plating"
	result = /obj/item/robot_parts/robot_component/armor/mkiii
	steps = list(
		list(CRAFT_MATERIAL, 25, MATERIAL_STEEL, "time" = 30),
		list(QUALITY_WELDING, 40, "time" = 90),
		list(QUALITY_HAMMERING, 30, "time" = 180),
		list(QUALITY_WELDING, 40, "time" = 90),
		list(QUALITY_HAMMERING, 30, "time" = 180),
		list(QUALITY_WELDING, 40, "time" = 90),
		list(QUALITY_SCREW_DRIVING, 40, "time" = 90),
		list(QUALITY_CUTTING, 30, "time" = 180),
	)

/datum/craft_recipe/guild/robothp //Lots of steps
	name = "robot mark v extra armor plating"
	result = /obj/item/robot_parts/robot_component/armor/mkv
	steps = list(
		list(CRAFT_MATERIAL, 10, MATERIAL_PLASTEEL, "time" = 90),
		list(CRAFT_MATERIAL, 10, MATERIAL_STEEL, "time" = 30),
		list(QUALITY_WELDING, 40, "time" = 90),
		list(QUALITY_CUTTING, 30, "time" = 180),
		list(QUALITY_HAMMERING, 30, "time" = 180),
		list(QUALITY_SCREW_DRIVING, 40, "time" = 90),
		list(QUALITY_BOLT_TURNING, 40, "time" = 120),
		list(QUALITY_SAWING, 30, "time" = 60)
	)

//Cells --------------------------
/datum/craft_recipe/guild/cellsmall
	name = "Artificer's Guild \"Workhorse 300S\""
	result = /obj/item/cell/small/guild/depleted
	icon_state = "electronic"
	steps = list(
		list(CRAFT_MATERIAL, 1, MATERIAL_STEEL, "time" = 60),
		list(CRAFT_MATERIAL, 1, MATERIAL_PLASTIC, "time" = 30),
		list(QUALITY_DRILLING, 60, "time" = 180),
		list(CRAFT_MATERIAL, 1, MATERIAL_SILVER, "time" = 40),
		list(QUALITY_WELDING, 40, "time" = 60),
		list(QUALITY_SCREW_DRIVING, 40, "time" = 60),
		list(CRAFT_MATERIAL, 1, MATERIAL_GOLD, "time" = 40),
		list(QUALITY_WELDING, 40, "time" = 40),
		list(/obj/item/stack/cable_coil, 5, "time" = 20),
		list(QUALITY_WIRE_CUTTING, 40, "time" = 20),
		list(QUALITY_SCREW_DRIVING, 40, "time" = 20)
	)

/datum/craft_recipe/guild/cellmedium
	name = "Artificer's Guild \"Workhorse 1200M\""
	result = /obj/item/cell/medium/guild/depleted
	icon_state = "electronic"
	steps = list(
		list(CRAFT_MATERIAL, 2, MATERIAL_STEEL, "time" = 60),
		list(CRAFT_MATERIAL, 2, MATERIAL_PLASTIC, "time" = 30),
		list(QUALITY_DRILLING, 60, "time" = 180),
		list(CRAFT_MATERIAL, 1, MATERIAL_SILVER, "time" = 40),
		list(QUALITY_WELDING, 40, "time" = 60),
		list(QUALITY_SCREW_DRIVING, 40, "time" = 60),
		list(CRAFT_MATERIAL, 1, MATERIAL_GOLD, "time" = 40),
		list(QUALITY_WELDING, 40, "time" = 40),
		list(/obj/item/stack/cable_coil, 5, "time" = 20),
		list(QUALITY_WIRE_CUTTING, 40, "time" = 20),
		list(QUALITY_SCREW_DRIVING, 40, "time" = 20)
	)

/datum/craft_recipe/guild/cellbig
	name = "Artificer's Guild \"Workhorse 14000L\""
	result = /obj/item/cell/large/guild/depleted
	icon_state = "electronic"
	steps = list(
		list(CRAFT_MATERIAL, 3, MATERIAL_STEEL, "time" = 60),
		list(CRAFT_MATERIAL, 3, MATERIAL_PLASTIC, "time" = 30),
		list(QUALITY_DRILLING, 60, "time" = 180),
		list(CRAFT_MATERIAL, 2, MATERIAL_SILVER, "time" = 40),
		list(QUALITY_WELDING, 40, "time" = 60),
		list(QUALITY_SCREW_DRIVING, 40, "time" = 60),
		list(CRAFT_MATERIAL, 1, MATERIAL_GOLD, "time" = 40),
		list(QUALITY_WELDING, 40, "time" = 40),
		list(/obj/item/stack/cable_coil, 5, "time" = 20),
		list(QUALITY_WIRE_CUTTING, 40, "time" = 20),
		list(QUALITY_SCREW_DRIVING, 40, "time" = 20)
	)


//Tools --------------------------
/datum/craft_recipe/guild/arcwelder
	name = "arc welder"
	result = /obj/item/tool/baton/arcwelder
	steps = list(
		list(CRAFT_MATERIAL, 4, MATERIAL_PLASTEEL, "time" = 60),
		list(QUALITY_CUTTING, 20, "time" = 40),
		list(QUALITY_HAMMERING, 30, "time" = 40),
		list(/obj/item/stack/cable_coil, 5, "time" = 20),
		list(QUALITY_WIRE_CUTTING, 20, 30),
		list(QUALITY_SCREW_DRIVING, 20, "time" = 60),
		list(QUALITY_BOLT_TURNING, 30, "time" = 40)
	)

/datum/craft_recipe/guild/polytool
	name = "\"Jolly Co-operation\" polytool"
	result = /obj/item/tool/polytool
	steps = list(
		list(/obj/item/tool/omnitool, 1, "time" = 60),
		list(QUALITY_CUTTING, 20, "time" = 40),
		list(QUALITY_HAMMERING, 30, "time" = 40),
		list(/obj/item/cell/medium, 1, "time" = 60),
		list(/obj/item/stack/cable_coil, 5, "time" = 20),
		list(QUALITY_WIRE_CUTTING, 20, 30),
		list(/obj/item/tool_upgrade/augment/fuel_tank, 1, "time" = 60),
		list(QUALITY_SCREW_DRIVING, 20, "time" = 60),
		list(QUALITY_BOLT_TURNING, 30, "time" = 40)
	)

/datum/craft_recipe/guild/engimultitool
	name = "Artificer's Guild \"Little Helper\" omnitool"
	result = /obj/item/tool/polytool/engimultitool
	steps = list(
		list(CRAFT_MATERIAL, 5, MATERIAL_PLASTEEL, 60),
		list(QUALITY_WELDING, 30, 20),
		list(/obj/item/circuitboard, 1),
		list(QUALITY_SCREW_DRIVING, 20, 40),
		list(QUALITY_WIRE_CUTTING, 20, 40),
		list(CRAFT_MATERIAL, 3, MATERIAL_STEEL, 20),
		list(QUALITY_BOLT_TURNING, 30, 40),
		list(QUALITY_HAMMERING, 30, 20),
		list(/obj/item/stack/cable_coil, 30, 20),
		list(QUALITY_WIRE_CUTTING, 20, 40),
		list(/obj/item/stock_parts/capacitor/guild, 1, 40),
		list(QUALITY_PULSING, 30, 20),
		list(/obj/item/stock_parts/manipulator/guild, 1, 30),
		list(QUALITY_SCREW_DRIVING, 30)
	)

/datum/craft_recipe/guild/deadblow_hammer
	name = "deadblow hammer"
	result = /obj/item/tool/hammer/deadblow
	steps = list(
		list(CRAFT_MATERIAL, 2, MATERIAL_PLASTEEL, "time" = 10),
		list(QUALITY_CUTTING, 20, "time" = 20),
		list(QUALITY_WELDING, 15, "time" = 20),
		list(/obj/item/tool/hammer, 1, "time" = 5),
		list(CRAFT_MATERIAL, 1, MATERIAL_GLASS, "time" = 10),
		list(QUALITY_WIRE_CUTTING, 20, 30),
		list(QUALITY_SCREW_DRIVING, 20, "time" = 60),
		list(QUALITY_BOLT_TURNING, 30, "time" = 40)
	)

/datum/craft_recipe/guild/combat_shovel
	name = "combat crovel"
	result = /obj/item/tool/shovel/combat
	steps = list(
		list(/obj/item/tool/shovel, 1),
		list(QUALITY_SAWING, 20, "time" = 40),
		list(QUALITY_HAMMERING, 30, "time" = 40),
		list(CRAFT_MATERIAL, 6, MATERIAL_PLASTEEL, "time" = 60),
		list(QUALITY_SCREW_DRIVING, 20, "time" = 30),
		list(/obj/item/tool_upgrade/augment/spikes, 1),
		list(QUALITY_BOLT_TURNING, 30, "time" = 10)
	)

/datum/craft_recipe/guild/turbo_shovel
	name = "Artificer's power crovel"
	result = /obj/item/tool/shovel/combat/turbo
	steps = list(
		list(/obj/item/tool/shovel/combat, 1),
		list(QUALITY_SAWING, 45, "time" = 40),
		list(QUALITY_HAMMERING, 30, "time" = 40),
		list(CRAFT_MATERIAL, 4, MATERIAL_PLASTEEL, "time" = 60),
		list(/obj/item/tool_upgrade/productivity/motor, 1, "time" = 60),
		list(QUALITY_SCREW_DRIVING, 40, "time" = 30),
		list(/obj/item/tool_upgrade/augment/fuel_tank, 1),
		list(QUALITY_BOLT_TURNING, 40, "time" = 10),
		list(QUALITY_DRILLING, 45, 10),
		list(CRAFT_MATERIAL, 1, MATERIAL_DIAMOND, "time" = 60),
		list(QUALITY_HAMMERING, 30, "time" = 40),
		list(QUALITY_SAWING, 45, "time" = 40),
		list(QUALITY_WELDING, 30, "time" = 60)
	)


/datum/craft_recipe/guild/rocket_engine
	name = "rocket engine"
	result = /obj/item/tool_upgrade/productivity/rocket_engine
	icon_state = "electronic"
	steps = list(
		list(CRAFT_MATERIAL, 3, MATERIAL_PLASTEEL, "time" = 60),
		list(CRAFT_MATERIAL, 1, MATERIAL_GOLD, "time" = 20),
		list(QUALITY_CUTTING, 30, "time" = 40),
		list(QUALITY_HAMMERING, 30, "time" = 40),
		list(/obj/item/stack/cable_coil, 10, "time" = 20),
		list(QUALITY_WIRE_CUTTING, 40, 30),
		list(QUALITY_SCREW_DRIVING, 40, "time" = 60),
		list(QUALITY_BOLT_TURNING, 40, "time" = 40)
	)

/datum/craft_recipe/guild/supermop
	name = "pneumatic condensing mop"
	result = /obj/item/mop/guild
	steps = list(
		list(/obj/item/mop, 1),
		list(CRAFT_MATERIAL, 1, MATERIAL_PLASTIC, "time" = 40),
		list(QUALITY_CUTTING, 20, "time" = 40),
		list(QUALITY_HAMMERING, 30, "time" = 40),
		list(/obj/item/stack/cable_coil, 5, "time" = 20),
		list(CRAFT_MATERIAL, 1, MATERIAL_PLASTEEL, "time" = 20),
		list(QUALITY_WIRE_CUTTING, 20, 30),
		list(QUALITY_SCREW_DRIVING, 20, "time" = 60),
		list(QUALITY_BOLT_TURNING, 30, "time" = 40)
	)

//Weapons ------------------------
/datum/craft_recipe/guild/railgunrifle
	name = "reductor rail rifle"
	result = /obj/item/gun/energy/laser/railgun/railrifle
	icon_state = "gun"
	steps = list(
		list(CRAFT_MATERIAL, 20, MATERIAL_PLASTEEL, "time" = 60),
		list(CRAFT_MATERIAL, 8, MATERIAL_STEEL, "time" = 20),
		list(CRAFT_MATERIAL, 10, MATERIAL_SILVER, "time" = 20),
		list(QUALITY_CUTTING, 30, "time" = 40),
		list(QUALITY_HAMMERING, 30, "time" = 40),
		list(/obj/item/stack/cable_coil, 10, "time" = 20),
		list(QUALITY_WIRE_CUTTING, 40, 30),
		list(QUALITY_SCREW_DRIVING, 40, "time" = 60),
		list(QUALITY_BOLT_TURNING, 40, "time" = 40)
	)

/datum/craft_recipe/guild/gaussrifle
	name = "bat'ko gauss rifle"
	result = /obj/item/gun/energy/laser/railgun/gauss
	icon_state = "gun"
	steps = list(
		list(CRAFT_MATERIAL, 30, MATERIAL_PLASTEEL, "time" = 60),
		list(CRAFT_MATERIAL, 8, MATERIAL_GOLD, "time" = 20),
		list(CRAFT_MATERIAL, 10, MATERIAL_SILVER, "time" = 20),
		list(CRAFT_MATERIAL, 4, MATERIAL_PLATINUM, "time" = 20),
		list(QUALITY_CUTTING, 30, "time" = 40),
		list(QUALITY_HAMMERING, 30, "time" = 40),
		list(/obj/item/stack/cable_coil, 30, "time" = 20),
		list(QUALITY_WELDING, 40, "time" = 60),
		list(QUALITY_WIRE_CUTTING, 40, 30),
		list(QUALITY_SCREW_DRIVING, 40, "time" = 60),
		list(QUALITY_BOLT_TURNING, 40, "time" = 40)
	)

/datum/craft_recipe/guild/IRKDissolver
	name = "Dissolver Beam Rifle"
	result = /obj/item/gun/energy/IRKDissolver
	icon_state = "gun"
	steps = list(
		list(/obj/item/gun/energy/gun/nuclear, 1, "time" = 60),
		list(/obj/item/gun_upgrade/mechanism/overdrive, 1, "time" = 40),
		list(/obj/item/gun_upgrade/mechanism/battery_shunt, 1, "time" = 40),
		list(/obj/item/stack/cable_coil, 30, "time" = 20),
		list(CRAFT_MATERIAL, 20, MATERIAL_PLASTEEL, "time" = 60),
		list(CRAFT_MATERIAL, 6, MATERIAL_GOLD, "time" = 20),
		list(CRAFT_MATERIAL, 6, MATERIAL_SILVER, "time" = 20),
		list(CRAFT_MATERIAL, 4, MATERIAL_PLATINUM, "time" = 20),
		list(QUALITY_CUTTING, 30, "time" = 40),
		list(QUALITY_HAMMERING, 30, "time" = 40),
		list(QUALITY_WELDING, 40, "time" = 60),
		list(QUALITY_WIRE_CUTTING, 40, 30),
		list(QUALITY_SCREW_DRIVING, 40, "time" = 60),
		list(QUALITY_BOLT_TURNING, 40, "time" = 40)
	)

/datum/craft_recipe/guild/railgunpistol
	name = "myrmidon rail pistol"
	result = /obj/item/gun/energy/laser/railgun/pistol
	icon_state = "gun"
	steps = list(
		list(CRAFT_MATERIAL, 15, MATERIAL_PLASTEEL, "time" = 60),
		list(CRAFT_MATERIAL, 4, MATERIAL_STEEL, "time" = 20),
		list(CRAFT_MATERIAL, 5, MATERIAL_SILVER, "time" = 20),
		list(QUALITY_CUTTING, 30, "time" = 40),
		list(QUALITY_HAMMERING, 30, "time" = 40),
		list(/obj/item/stack/cable_coil, 5, "time" = 20),
		list(QUALITY_WIRE_CUTTING, 40, 30),
		list(QUALITY_SCREW_DRIVING, 40, "time" = 60),
		list(QUALITY_BOLT_TURNING, 40, "time" = 40)
	)

/datum/craft_recipe/guild/guild_bull
	name = "bison double barrel shotgun"
	result = /obj/item/gun/projectile/shotgun/pump/bull/bison
	steps = list(
		list(/obj/item/gun/projectile/shotgun/pump/bull, 1, "time" = 80),
		list(/obj/item/gun_upgrade/barrel/bore, 1, "time" = 60),
		list(CRAFT_MATERIAL, 10, MATERIAL_PLASTEEL, "time" = 60),
		list(QUALITY_DRILLING, 60, "time" = 90),
		list(QUALITY_WELDING, 40, "time" = 60),
		list(QUALITY_HAMMERING, 45, "time" = 40),
		list(QUALITY_SAWING, 50, "time" = 60),
		list(CRAFT_MATERIAL, 10, MATERIAL_PLASTIC, "time" = 60),
		list(QUALITY_CUTTING, 30, "time" = 40),
		list(QUALITY_SCREW_DRIVING, 40, "time" = 40),
		list(QUALITY_BOLT_TURNING, 40, "time" = 40)
	)

/datum/craft_recipe/guild/martinupgraded
	name = "overclocked martin energy pistol"
	result = /obj/item/gun/energy/gun/martin/upgraded
	steps = list(
		list(/obj/item/gun/energy/gun/martin, 1, time = 60),
		list(QUALITY_SCREW_DRIVING, 20, "time" = 40),
		list(/obj/item/stack/cable_coil, 5, "time" = 20),
		list(QUALITY_WIRE_CUTTING, 30, "time" = 15),
		list(QUALITY_WELDING, 40, "time" = 30),
		list(CRAFT_MATERIAL, 1, MATERIAL_URANIUM, "time" = 20),
		list(CRAFT_MATERIAL, 2, MATERIAL_PLASTEEL, "time" = 20),
		list(QUALITY_SCREW_DRIVING, 40, "time" = 20)
	)
//An exspensive but powerful CQC weapon that also can be used as a flar gun
/datum/craft_recipe/guild/abdicatorshotgun
	name ="abdicator energy shotgun"
	result = /obj/item/gun/energy/laser/railgun/abdicator
	steps = list(
		list(CRAFT_MATERIAL, 20, MATERIAL_PLASTEEL, "time" = 15),
		list(QUALITY_CUTTING, 30, "time" = 10),
		list(CRAFT_MATERIAL, 4, MATERIAL_PLASMA, "time" = 15),
		list(QUALITY_BOLT_TURNING, 40, "time" = 20),
		list(QUALITY_HAMMERING, 10, "time" = 20),
		list(/obj/item/stock_parts/smes_coil, 1, "time" = 5),
		list(QUALITY_WELDING, 40, "time" = 15),
		list(/obj/item/cell/large, 1, "time" = 5),
		list(QUALITY_SCREW_DRIVING, 40, "time" = 20),
		list(/obj/item/stack/cable_coil, 30, "time" = 15),
		list(QUALITY_WIRE_CUTTING, 40, "time" = 15),
		list(/obj/item/stock_parts/subspace/ansible, 1, "time" = 1),
		list(QUALITY_SCREW_DRIVING, 40, "time" = 20),
		list(CRAFT_MATERIAL, 10, MATERIAL_WOOD, "time" = 20),
		list(QUALITY_HAMMERING, 30, "time" = 20),
		list(CRAFT_MATERIAL, 6, MATERIAL_RGLASS, "time" = 10),
		list(/obj/item/stock_parts/capacitor/adv, 1, "time" = 10),
		list(/obj/item/stock_parts/micro_laser/high, 1, "time" = 10),
		list(/obj/item/pc_part/tesla_link, 1, "time" = 10),
		list(QUALITY_SCREW_DRIVING, 40, "time" = 20),
		list(CRAFT_MATERIAL, 1, MATERIAL_PLASMAGLASS, "time" = 20),
		list(CRAFT_MATERIAL, 1, MATERIAL_URANIUM, "time" = 20),
		list(QUALITY_HAMMERING, 40, "time" = 30),
		list(CRAFT_MATERIAL, 15, MATERIAL_PLASTIC, "time" = 20),
		list(CRAFT_MATERIAL, 4, MATERIAL_STEEL, "time" = 5),
		list(QUALITY_SCREW_DRIVING, 40, "time" = 5)
	)


/datum/craft_recipe/guild/tetrasmg
	name = "tetra laser smg"
	result = /obj/item/gun/energy/tetra
	icon_state = "gun"
	steps = list(
		list(CRAFT_MATERIAL, 18, MATERIAL_PLASTEEL, "time" = 60),
		list(CRAFT_MATERIAL, 8, MATERIAL_STEEL, "time" = 20),
		list(CRAFT_MATERIAL, 8, MATERIAL_PLASTIC, "time" = 20),
		list(QUALITY_CUTTING, 30, "time" = 40),
		list(QUALITY_HAMMERING, 30, "time" = 40),
		list(QUALITY_WELDING, 40, "time" = 40),
		list(CRAFT_MATERIAL, 12, MATERIAL_SILVER, "time" = 20),
		list(/obj/item/stack/cable_coil, 10, "time" = 20),
		list(CRAFT_MATERIAL, 2, MATERIAL_GOLD, "time" = 20),
		list(QUALITY_WIRE_CUTTING, 40, 30),
		list(/obj/item/stock_parts/micro_laser, 2, "time" = 80),
		list(QUALITY_SCREW_DRIVING, 40, "time" = 60),
		list(QUALITY_BOLT_TURNING, 40, "time" = 40)
	)

/datum/craft_recipe/guild/pilgrim_devout
	name = "pilgrim devout"
	result = /obj/item/gun/projectile/revolver/lemant/belt
	steps = list(
		list(/obj/item/gun/projectile/revolver/lemant, 1, "time" = 30),
		list(CRAFT_MATERIAL, 4, MATERIAL_PLASTEEL, "time" = 60),
		list(QUALITY_SCREW_DRIVING, 30, "time" = 40),
		list(QUALITY_BOLT_TURNING, 30, "time" = 40),
		list(QUALITY_SAWING, 30, "time" = 60),
		list(QUALITY_CUTTING, 30, "time" = 40),
		list(QUALITY_WELDING, 40, "time" = 60),
		list(QUALITY_HAMMERING, 30, "time" = 40),
	)

/datum/craft_recipe/guild/ten_shot_conversion
	name = "ten-shot conversion shotgun"
	result = /obj/item/gun/projectile/revolver/sixshot/conversion
	steps = list(
		list(/obj/item/gun/projectile/revolver/sixshot, 1, "time" = 30),
		list(CRAFT_MATERIAL, 4, MATERIAL_PLASTEEL, "time" = 60),
		list(QUALITY_SCREW_DRIVING, 30, "time" = 40),
		list(QUALITY_BOLT_TURNING, 30, "time" = 40),
		list(QUALITY_SAWING, 30, "time" = 60),
		list(QUALITY_CUTTING, 30, "time" = 40),
		list(QUALITY_WELDING, 40, "time" = 60),
		list(QUALITY_HAMMERING, 30, "time" = 40),
	)

/datum/craft_recipe/guild/heavypulserifle
	name = "\"PL-3\" Heavy Pulse Rifle"
	result = /obj/item/gun/energy/laser/heavypulserifle
	icon_state = "gun"
	steps = list(
		list(/obj/item/mecha_parts/mecha_equipment/ranged_weapon/energy/pulse, 1, "time" = 30),
		list(QUALITY_SAWING, 40, "time" = 60),
		list(QUALITY_BOLT_TURNING, 40, "time" = 40),
		list(/obj/item/stack/cable_coil, 30, "time" = 30),
		list(QUALITY_WIRE_CUTTING, 40, 30),
		list(CRAFT_MATERIAL, 20, MATERIAL_PLASTEEL, "time" = 30),
		list(QUALITY_WELDING, 40, "time" = 40),
		list(CRAFT_MATERIAL, 10, MATERIAL_STEEL, "time" = 20),
		list(QUALITY_SCREW_DRIVING, 40, "time" = 10)
	)

/datum/craft_recipe/guild/mace
	name = "war mace"
	result = /obj/item/tool/hammer/mace
	steps = list(
		list(CRAFT_MATERIAL, 15, MATERIAL_STEEL, "time" = 30),
		list(QUALITY_SAWING, 30, "time" = 60),
		list(QUALITY_HAMMERING, 30, "time" = 40),
		list(QUALITY_WELDING, 40, "time" = 60)
	)

/datum/craft_recipe/guild/claymore
	name = "claymore"
	result = /obj/item/tool/sword
	steps = list(
		list(CRAFT_MATERIAL, 15, MATERIAL_PLASTEEL, "time" = 30),
		list(QUALITY_SAWING, 30, "time" = 60),
		list(QUALITY_HAMMERING, 30, "time" = 40),
		list(QUALITY_WELDING, 40, "time" = 60)
	)

/datum/craft_recipe/guild/machete
	name = "machete"
	result = /obj/item/tool/sword/machete
	steps = list(
		list(CRAFT_MATERIAL, 15, MATERIAL_STEEL, "time" = 30),
		list(QUALITY_SAWING, 30, "time" = 60),
		list(QUALITY_HAMMERING, 30, "time" = 40),
		list(QUALITY_WELDING, 40, "time" = 60)
	)

/datum/craft_recipe/guild/katana
	name = "katana"
	result = /obj/item/tool/sword/katana
	steps = list(
	list(CRAFT_MATERIAL, 10, MATERIAL_PLASTEEL, "time" = 30),
		list(QUALITY_SAWING, 30, "time" = 60),
	list(CRAFT_MATERIAL, 5, MATERIAL_STEEL, "time" = 30),
		list(QUALITY_WELDING, 40, "time" = 60),
		list(CRAFT_MATERIAL, 1, MATERIAL_DIAMOND, "time" = 30),
		list(QUALITY_HAMMERING, 45, "time" = 40),
		list(/obj/item/tool_upgrade/productivity/whetstone, 1, "time" = 30)
	)

/datum/craft_recipe/guild/firebrand
	name = "firebrand"
	result = /obj/item/tool/sword/katana/firebrand
	steps = list(
	list(CRAFT_MATERIAL, 10, MATERIAL_PLASTEEL, "time" = 30),
	list(QUALITY_SAWING, 30, "time" = 60),
	list(CRAFT_MATERIAL, 5, MATERIAL_STEEL, "time" = 30),
	list(QUALITY_WELDING, 40, "time"= 60),
	list(/obj/item/tool_upgrade/productivity/oxyjet, 1, "time" = 30),
	list(QUALITY_HAMMERING, 45, "time" = 40),
	list(/obj/item/tool_upgrade/augment/fuel_tank, 1, "time" = 30)
	)

/datum/craft_recipe/guild/bastion
	name = "Bastion Shield"
	result = /obj/item/shield/riot/bastion
	steps = list(
	list(CRAFT_MATERIAL, 3, MATERIAL_PLASTEEL, "time" = 30),
	list(QUALITY_SAWING, 30, "time" = 60),
	list(CRAFT_MATERIAL, 2, MATERIAL_STEEL, "time" = 30),
	list(QUALITY_WELDING, 40, "time"= 60),
	list(/obj/item/shield/riot, 1, "time" = 30),
	list(QUALITY_HAMMERING, 45, "time" = 40),
	list(CRAFT_MATERIAL, 1, MATERIAL_PLASMAGLASS, "time" = 30)
	)


//Wearables =========================
/datum/craft_recipe/guild/nv_guild
	name = "Optimized NV Goggles"
	result = /obj/item/clothing/glasses/powered/night/guild/crafted
	icon_state = "clothing"
	steps = list(
		list(/obj/item/clothing/glasses/powered/meson, 1, "time" = 30),
		list(CRAFT_MATERIAL, 2, MATERIAL_RGLASS),
		list(QUALITY_WELDING, 40, "time"= 60),
		list(CRAFT_MATERIAL, 2, MATERIAL_PLASTEEL, "time" = 30),
		list(QUALITY_BOLT_TURNING, 40, "time" = 40),
		list(CRAFT_MATERIAL, 1, MATERIAL_URANIUM, "time" = 20),
		list(QUALITY_WIRE_CUTTING, 40, 30),
		list(/obj/item/stack/cable_coil, 2, "time" = 20),
		list(QUALITY_SCREW_DRIVING, 40, "time" = 60),
	)

/datum/craft_recipe/guild/technosuit
	name = "'Mark V' environmental protection suit"
	result = /obj/item/clothing/suit/armor/vest/technomancersuit
	icon_state = "clothing"
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
	name = "'Mark V' environmental protection helmet"
	result = /obj/item/clothing/head/helmet/technomancersuit
	icon_state = "clothing"
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

/datum/craft_recipe/guild/swat_yellow
	name = "Artificers insulated gloves"
	result = /obj/item/clothing/gloves/insulated/guild
	steps = list(
		list(/obj/item/clothing/gloves/thick, 1, "time" = 15),
		list(QUALITY_CUTTING, 15, 10),
		list(/obj/item/clothing/gloves/insulated, 1, "time" = 15),
		list(/obj/item/stack/cable_coil, 2, "time" = 5),
		list(QUALITY_CUTTING, 15, 10),
		list(CRAFT_MATERIAL, 3, MATERIAL_PLASTIC), //So if we use buget we have a reason to think its really shock proof
		list(QUALITY_WELDING, 10, "time" = 40),
		list(CRAFT_MATERIAL, 3, MATERIAL_STEEL),
		list(QUALITY_HAMMERING, 15, 10)
	)

/datum/craft_recipe/guild/webbing
	name = "Artificer Guild web harness"
	icon_state = "clothing"
	result = /obj/item/storage/belt/webbing/artificer
	steps = list(
		list(/obj/item/storage/belt, 1, "time" = 30),
		list(/obj/item/storage/belt, 1, "time" = 30),
		list(/obj/item/stack/cable_coil, 30, "time" = 30),
		list(/obj/item/storage/pouch/medium_generic, 1, "time" = 40)
	)

/datum/craft_recipe/guild/sheet_stacker
	name = "advanced sheet snatcher"
	icon_state = "woodworking"
	result = /obj/item/storage/bag/sheetsnatcher/guild
	steps = list(
		list(CRAFT_MATERIAL, 10, MATERIAL_WOOD, "time" = 30),
		list(QUALITY_SCREW_DRIVING, 40, "time" = 20),
		list(CRAFT_MATERIAL, 3, MATERIAL_STEEL, "time" = 60),
		list(QUALITY_ADHESIVE, 10, "time" = 60),
		list(/obj/item/stack/cable_coil, 30, "time" = 30),
		list(CRAFT_MATERIAL, 5, MATERIAL_PLASTEEL, "time" = 30),
	)

//Tool/Gun Mods ---------------------
//Reinforcement
/datum/craft_recipe/guild/plasmablock
	name = "Plasma Block"
	result = /obj/item/tool_upgrade/reinforcement/plasmablock
	steps = list(
		list(CRAFT_MATERIAL, 5, MATERIAL_PLASTEEL, "time" = 30),
		list(QUALITY_HAMMERING, 30, "time" = 40),
		list(CRAFT_MATERIAL, 2, MATERIAL_PLASTIC, "time" = 30),
		list(QUALITY_SCREW_DRIVING, 40, "time" = 90),
		list(CRAFT_MATERIAL, 2, MATERIAL_PLASMA, "time" = 30),
	)

/datum/craft_recipe/guild/rubbermesh
	name = "Rubber Mesh"
	result = /obj/item/tool_upgrade/reinforcement/rubbermesh
	steps = list(
		list(CRAFT_MATERIAL, 3, MATERIAL_PLASTIC, "time" = 30),
		list(QUALITY_WIRE_CUTTING, 20, "time" = 90)
	)

//Productivity
/datum/craft_recipe/guild/booster
	name = "Booster"
	result = /obj/item/tool_upgrade/productivity/booster
	steps = list(
		list(CRAFT_MATERIAL, 3, MATERIAL_STEEL, "time" = 30),
		list(QUALITY_HAMMERING, 30, "time" = 40),
		list(CRAFT_MATERIAL, 2, MATERIAL_PLASTIC, "time" = 30),
		list(QUALITY_SCREW_DRIVING, 25, "time" = 90),
		list(CRAFT_MATERIAL, 2, MATERIAL_GOLD, "time" = 30),
		list(QUALITY_BOLT_TURNING, 20, "time" = 40)
	)

/datum/craft_recipe/guild/injector
	name = "Plasma Injector"
	result = /obj/item/tool_upgrade/productivity/injector
	steps = list(
		list(CRAFT_MATERIAL, 3, MATERIAL_STEEL, "time" = 30),
		list(QUALITY_HAMMERING, 30, "time" = 40),
		list(CRAFT_MATERIAL, 2, MATERIAL_PLASTIC, "time" = 30),
		list(QUALITY_SCREW_DRIVING, 25, "time" = 90),
		list(CRAFT_MATERIAL, 2, MATERIAL_PLASMA, "time" = 30),
		list(QUALITY_WELDING, 40, "time" = 40)
	)

//Gun Mods
/datum/craft_recipe/guild/weintraub
	name = "\"Hurricane\" full auto kit"
	result = /obj/item/gun_upgrade/mechanism/weintraub
	icon_state = "gun"
	steps = list(
		list(CRAFT_MATERIAL, 3, MATERIAL_PLASTEEL, "time" = 30),
		list(QUALITY_SAWING, 30, "time" = 60),
		list(QUALITY_HAMMERING, 20, "time" = 40),
		list(QUALITY_WELDING, 40, "time" = 40),
		list(CRAFT_MATERIAL, 2, MATERIAL_PLASTIC, "time" = 30),
		list(QUALITY_SCREW_DRIVING, 25, "time" = 90)
	)

//Gun Mods
/datum/craft_recipe/guild/tensioner
	name =  "weighted pulley kit"
	result = /obj/item/gun_upgrade/mechanism/tensioner
	steps = list(
		list(CRAFT_MATERIAL, 5, MATERIAL_PLASTEEL, "time" = 30),
		list(QUALITY_SAWING, 30, "time" = 60),
		list(QUALITY_HAMMERING, 20, "time" = 40),
		list(QUALITY_WELDING, 40, "time" = 40),
		list(/obj/item/stack/cable_coil, 5, "time" = 30),
		list(QUALITY_WIRE_CUTTING, 25, "time" = 90)
	)

//Gun Mods
/datum/craft_recipe/guild/detensioner
	name =  "compound pulley kit"
	result = /obj/item/gun_upgrade/mechanism/detensioner
	steps = list(
		list(CRAFT_MATERIAL, 10, MATERIAL_STEEL, "time" = 30),
		list(QUALITY_SAWING, 30, "time" = 60),
		list(QUALITY_HAMMERING, 20, "time" = 40),
		list(QUALITY_WELDING, 40, "time" = 40),
		list(CRAFT_MATERIAL, 2, MATERIAL_PLASTIC, "time" = 30),
		list(QUALITY_WIRE_CUTTING, 25, "time" = 90)
	)

/datum/craft_recipe/guild/overshooter
	name = "\"Overshooter\" internal magazine kit"
	result = /obj/item/gun_upgrade/mechanism/overshooter
	icon_state = "gun"
	steps = list(
		list(CRAFT_MATERIAL, 1, MATERIAL_PLASTEEL, "time" = 30),
		list(QUALITY_SAWING, 30, "time" = 60),
		list(QUALITY_HAMMERING, 20, "time" = 40),
		list(QUALITY_WELDING, 40, "time" = 40),
		list(CRAFT_MATERIAL, 2, MATERIAL_PLASTIC, "time" = 30),
		list(QUALITY_SCREW_DRIVING, 25, "time" = 90)
	)

/datum/craft_recipe/guild/dangerzone
	name = "\"Danger Zone\" Trigger"
	result = /obj/item/gun_upgrade/trigger/dangerzone
	icon_state = "gun"
	steps = list(
		list(CRAFT_MATERIAL, 1, MATERIAL_PLASTEEL, "time" = 30),
		list(QUALITY_SAWING, 30, "time" = 60),
		list(QUALITY_HAMMERING, 20, "time" = 40),
		list(QUALITY_WELDING, 40, "time" = 40),
		list(CRAFT_MATERIAL, 2, MATERIAL_PLASTIC, "time" = 30),
		list(QUALITY_BOLT_TURNING, 25, "time" = 90)
	)

/datum/craft_recipe/guild/forged
	name = "Forged Barrel"
	result = /obj/item/gun_upgrade/barrel/forged
	icon_state = "gun"
	steps = list(
		list(CRAFT_MATERIAL, 1, MATERIAL_PLASTEEL, "time" = 30),
		list(QUALITY_SAWING, 30, "time" = 60),
		list(QUALITY_HAMMERING, 20, "time" = 40),
		list(QUALITY_WELDING, 40, "time" = 40),
		list(CRAFT_MATERIAL, 1, MATERIAL_PLASTIC, "time" = 30),
		list(QUALITY_BOLT_TURNING, 25, "time" = 90)
	)

/datum/craft_recipe/guild/kit
	name = "Kurz's refinement kit"
	result = /obj/item/gun_upgrade/mechanism/upgrade_kit
	icon_state = "gun"
	steps = list(
		list(CRAFT_MATERIAL, 20, MATERIAL_STEEL, "time" = 30),
		list(CRAFT_MATERIAL, 15, MATERIAL_PLASTEEL, "time" = 30),
		list(QUALITY_SAWING, 30, "time" = 60),
		list(QUALITY_HAMMERING, 20, "time" = 40),
		list(CRAFT_MATERIAL, 3, MATERIAL_SILVER),
		list(QUALITY_DRILLING, 60, "time" = 90),
		list(QUALITY_WELDING, 40, "time" = 40),
		list(CRAFT_MATERIAL, 10, MATERIAL_PLASTIC, "time" = 30),
		list(QUALITY_BOLT_TURNING, 25, "time" = 90)
	)

/datum/craft_recipe/guild/heavy_barrel
	name = "Heavy barrel"
	result = /obj/item/gun_upgrade/barrel/bore
	icon_state = "gun"
	steps = list(
		list(CRAFT_MATERIAL, 1, MATERIAL_PLASTEEL, "time" = 30),
		list(QUALITY_SAWING, 30, "time" = 60),
		list(QUALITY_HAMMERING, 20, "time" = 40),
		list(QUALITY_WELDING, 40, "time" = 40),
		list(CRAFT_MATERIAL, 1, MATERIAL_PLASTIC, "time" = 30),
		list(QUALITY_BOLT_TURNING, 25, "time" = 90),
		list(QUALITY_SAWING, 30, "time" = 60),
		list(QUALITY_HAMMERING, 20, "time" = 40),
		list(QUALITY_WELDING, 40, "time" = 40),
		list(QUALITY_DRILLING, 60, "time" = 90),
		list(/obj/item/tool_upgrade/refinement/ported_barrel, 1, "time" = 30),
		list(CRAFT_MATERIAL, 2, MATERIAL_PLASTEEL, "time" = 30),
		list(QUALITY_BOLT_TURNING, 25, "time" = 90)
	)

/datum/craft_recipe/guild/silencer
	name = "Silencer"
	result = /obj/item/gun_upgrade/muzzle/silencer
	icon_state = "gun"
	steps = list(
		list(CRAFT_MATERIAL, 3, MATERIAL_PLASTEEL, "time" = 30),
		list(QUALITY_SAWING, 30, "time" = 60),
		list(QUALITY_HAMMERING, 20, "time" = 40),
		list(QUALITY_WELDING, 40, "time" = 40),
		list(CRAFT_MATERIAL, 2, MATERIAL_PLASTIC, "time" = 30),
		list(QUALITY_CUTTING, 25, "time" = 90)
	)

/datum/craft_recipe/guild/watchman
	name = "Artificer's Guild \"Watchman\" scope"
	result = /obj/item/gun_upgrade/scope/watchman
	icon_state = "gun"
	steps = list(
		list(CRAFT_MATERIAL, 3, MATERIAL_PLASTEEL, "time" = 30),
		list(QUALITY_SAWING, 30, "time" = 60),
		list(QUALITY_HAMMERING, 20, "time" = 40),
		list(QUALITY_WELDING, 40, "time" = 40),
		list(CRAFT_MATERIAL, 2, MATERIAL_GLASS, "time" = 30),
		list(QUALITY_CUTTING, 25, "time" = 90)
	)
/*
//Traps
/datum/craft_recipe/guild/guild_mine_trap
	name = "land mine trap"
	result = /obj/item/mine
	icon_state = "gun"
	steps = list(
		list(/obj/item/mine/improvised, 1, "time" = 120),
		list(QUALITY_SCREW_DRIVING, 10, 70),
		list(CRAFT_MATERIAL, 20, MATERIAL_STEEL),
		list(QUALITY_BOLT_TURNING, 10, 70),
		list(/obj/item/stack/cable_coil, 2, "time" = 10)
	)*/

//Machines
/datum/craft_recipe/guild/turretcircuit
	name = "Circuit: Artificer Turret"
	result = /obj/item/circuitboard/artificer_turret
	icon_state = "electronic"
	steps = list(
		list(/obj/item/pc_part/processor_unit/adv, 1, "time" = 30),
		list(/obj/item/stack/cable_coil, 5, "time" = 20),
		list(QUALITY_SCREW_DRIVING, 40, "time" = 90),
		list(QUALITY_WELDING, 40, "time" = 90)
	)
/*
Thee would be able to smith tho
tis my failing
My deeplest sorrow for this keepsake of the rnd's hoard
- Trilby, a SI main (somehow)
/datum/craft_recipe/guild/autolathe_industrial
	name = "Circuit: Industrial Autolathe"
	result = /obj/item/circuitboard/autolathe_industrial
	icon_state = "electronic"
	steps = list(
		list(/obj/item/pc_part/processor_unit, 2, "time" = 30),
		list(CRAFT_MATERIAL, 1, MATERIAL_GOLD),
		list(CRAFT_MATERIAL, 1, MATERIAL_SILVER),
		list(/obj/item/circuitboard/autolathe, 1, "time" = 30),
		list(/obj/item/stack/cable_coil, 5, "time" = 20),
		list(CRAFT_MATERIAL, 2, MATERIAL_GLASS),
		list(QUALITY_SCREW_DRIVING, 40, "time" = 40),
		list(QUALITY_WELDING, 40, "time" = 20)
	)
*/
/datum/craft_recipe/guild/matter_nanoforge
	name = "Circuit: Matter Nano-Forge"
	result = /obj/item/circuitboard/matter_nanoforge
	icon_state = "electronic"
	steps = list(
		list(/obj/item/circuitboard/autolathe, 1, "time" = 30),
		list(CRAFT_MATERIAL, 2, MATERIAL_GOLD),
		list(CRAFT_MATERIAL, 2, MATERIAL_SILVER),
		list(/obj/item/stack/cable_coil, 5, "time" = 20),
		list(QUALITY_SCREW_DRIVING, 20, "time" = 90),
		list(QUALITY_WELDING, 30, "time" = 90)
	)

/datum/craft_recipe/guild/matter_nanoforge_blackbox
	name = "Black Box: Matter Nano-Forge"
	result = /obj/item/oddity/blackbox_nanoforge
	steps = list(
		list(/obj/item/pc_part/processor_unit, 1, "time" = 120),
		list(QUALITY_SCREW_DRIVING, 20, 70, "time" = 10),
		list(CRAFT_MATERIAL, 12, MATERIAL_PLASTEEL, "time" = 90),
		list(CRAFT_MATERIAL, 2, MATERIAL_RGLASS, "time" = 20),
		list(QUALITY_BOLT_TURNING, 10, 70),
		list(QUALITY_WELDING, 30, "time" = 90),
		list(/obj/item/stack/cable_coil, 10, "time" = 90),
		list(CRAFT_MATERIAL, 1, MATERIAL_DIAMOND, "time" = 20),
		list(/obj/item/stock_parts/manipulator, 1, "time" = 120),
		list(QUALITY_HAMMERING, 30, "time" = 40),
		list(QUALITY_SAWING, 30, "time" = 60),
		//list(QUALITY_DRILLING, 60, "time" = 90),
		list(CRAFT_MATERIAL, 2, MATERIAL_GOLD),
		list(QUALITY_BOLT_TURNING, 10, 70),
		list(CRAFT_MATERIAL, 2, MATERIAL_SILVER)
	)

/datum/craft_recipe/guild/safety_clamp
	name = "Hydraulic clamp overclock: KILL CLAMP"
	result = /obj/item/mecha_parts/mecha_equipment/tool/hydraulic_clamp/safety_clamp
	steps = list(
		list(/obj/item/mecha_parts/mecha_equipment/tool/hydraulic_clamp, 1, "time" = 60),
		list(QUALITY_BOLT_TURNING, 30, "time" = 40),
		list(/obj/item/tool_upgrade/productivity/motor, 1, "time" = 60),
		list(QUALITY_SCREW_DRIVING, 10, 70),
		list(/obj/item/tool_upgrade/augment/hydraulic, 1, "time" = 60),
		list(QUALITY_SCREW_DRIVING, 10, 70),
		list(CRAFT_MATERIAL, 6, MATERIAL_PLASTEEL),
		list(QUALITY_WELDING, 30, "time" = 40),
		list(/obj/item/tool_upgrade/augment/spikes, 1, "time" = 60)
	)

/datum/craft_recipe/guild/tesla_energy_relay
	name = "Mech energy relay"
	result = /obj/item/mecha_parts/mecha_equipment/tesla_energy_relay
	steps = list(
		list(CRAFT_MATERIAL, 10, MATERIAL_STEEL, "time" = 30),
		list(QUALITY_WELDING, 45, "time" = 40),
		list(QUALITY_BOLT_TURNING, 40, 70),
		list(/obj/item/pc_part/tesla_link, 2, "time" = 60),
		list(QUALITY_SCREW_DRIVING, 40, 70),
		list(/obj/item/stack/cable_coil, 15, "time" = 90),
		list(QUALITY_WIRE_CUTTING, 25, "time" = 90),
		list(/obj/item/stock_parts/capacitor/guild, 1, "time" = 60),
		list(QUALITY_SCREW_DRIVING, 10, 70),
		list(CRAFT_MATERIAL, 1, MATERIAL_GOLD)
	)

/datum/craft_recipe/guild/guild_bin
	name = "Hand Cast Matter Bin"
	result = /obj/item/stock_parts/matter_bin/handmade
	steps = list(
		list(/obj/item/stock_parts/matter_bin/super, 1, "time" = 10),
		list(QUALITY_SCREW_DRIVING, 10, 70, "time" = 10),
		list(CRAFT_MATERIAL, 1, MATERIAL_PLASTEEL, "time" = 10),
		list(CRAFT_MATERIAL, 1, MATERIAL_PLASMAGLASS, "time" = 10),
		list(QUALITY_BOLT_TURNING, 10, 70, "time" = 10),
		list(QUALITY_WELDING, 40, "time" = 10),
		list(QUALITY_HAMMERING, 40, "time" = 10),
		list(QUALITY_SAWING, 60, "time" = 10)
	)

/datum/craft_recipe/guild/guild_manip
	name = "Perfected Forged Manipulator"
	result = /obj/item/stock_parts/manipulator/handmade
	steps = list(
		list(/obj/item/stock_parts/manipulator/pico, 1, "time" = 10),
		list(QUALITY_SCREW_DRIVING, 40, 70, "time" = 10),
		list(CRAFT_MATERIAL, 2, MATERIAL_PLASTEEL, "time" = 10),
		list(CRAFT_MATERIAL, 2, MATERIAL_PLASTIC, "time" = 10),
		list(QUALITY_BOLT_TURNING, 10, 70, "time" = 10),
		list(QUALITY_WELDING, 40, "time" = 10),
		list(/obj/item/stack/cable_coil, 10, "time" = 10),
		list(QUALITY_HAMMERING, 40, "time" = 10),
		list(QUALITY_SAWING, 60, "time" = 10)
	)

/datum/craft_recipe/guild/guild_laser
	name = "Handmade Perfected Micro-Laser"
	result = /obj/item/stock_parts/micro_laser/handmade
	steps = list(
		list(/obj/item/stock_parts/micro_laser/ultra, 1, "time" = 10),
		list(QUALITY_SCREW_DRIVING, 40, 70, "time" = 10),
		list(CRAFT_MATERIAL, 1, MATERIAL_PLASMAGLASS, "time" = 10),
		list(CRAFT_MATERIAL, 1, MATERIAL_RGLASS, "time" = 10),
		list(QUALITY_BOLT_TURNING, 10, 70, "time" = 10),
		list(QUALITY_WELDING, 40, "time" = 10),
		list(QUALITY_SAWING, 60, "time" = 10)
	)

/datum/craft_recipe/guild/guild_scanner
	name = "Manually Perfected Scanning Module"
	result = /obj/item/stock_parts/scanning_module/handmade
	steps = list(
		list(/obj/item/stock_parts/scanning_module/phasic, 1, "time" = 10),
		list(QUALITY_SCREW_DRIVING, 40, 70, "time" = 10),
		list(CRAFT_MATERIAL, 1, MATERIAL_GOLD, "time" = 10),
		list(QUALITY_BOLT_TURNING, 10, 70, "time" = 10),
		list(QUALITY_WELDING, 40, "time" = 10),
		list(CRAFT_MATERIAL, 1, MATERIAL_SILVER, "time" = 10),
		list(QUALITY_SAWING, 60, "time" = 10)
	)

/datum/craft_recipe/guild/guild_capacitor
	name = "Crafted Ultra Capacitor"
	result = /obj/item/stock_parts/capacitor/handmade
	steps = list(
		list(/obj/item/stock_parts/capacitor/super, 1, "time" = 10),
		list(QUALITY_SCREW_DRIVING, 40, 70, "time" = 10),
		list(CRAFT_MATERIAL, 1, MATERIAL_GOLD, "time" = 10),
		list(QUALITY_BOLT_TURNING, 10, 70, "time" = 10),
		list(QUALITY_WELDING, 40, "time" = 10),
		list(CRAFT_MATERIAL, 1, MATERIAL_SILVER, "time" = 10),
		list(QUALITY_SAWING, 60, "time" = 10)
	)


// --- Advanced Greyson stock parts (craftable by Artificer's Guild) ---

/datum/craft_recipe/guild/greyson_capacitor_advanced
	name = "Greyson positronic hyper capacitor"
	result = /obj/item/stock_parts/capacitor/one_star/advanced
	icon_state = "electronic"
	steps = list(
		list(/obj/item/stock_parts/capacitor/one_star, 1, "time" = 10),
		list(QUALITY_SCREW_DRIVING, 40, 70, "time" = 10),
		list(CRAFT_MATERIAL, 1, MATERIAL_GOLD, "time" = 10),
		list(QUALITY_BOLT_TURNING, 10, 70, "time" = 10),
		list(QUALITY_WELDING, 40, "time" = 10),
		list(CRAFT_MATERIAL, 1, MATERIAL_SILVER, "time" = 10),
		list(QUALITY_SAWING, 60, "time" = 10),
		list(CRAFT_MATERIAL, 4, MATERIAL_PLATINUM, "time" = 10),
		list(QUALITY_SCREW_DRIVING, 40, "time" = 15)
	)

/datum/craft_recipe/guild/greyson_scanner_advanced
	name = "Greyson positronic multi-phasic scanning module"
	result = /obj/item/stock_parts/scanning_module/one_star/advanced
	icon_state = "electronic"
	steps = list(
		list(/obj/item/stock_parts/scanning_module/one_star, 1, "time" = 10),
		list(QUALITY_SCREW_DRIVING, 40, 70, "time" = 10),
		list(CRAFT_MATERIAL, 1, MATERIAL_GOLD, "time" = 10),
		list(QUALITY_BOLT_TURNING, 10, 70, "time" = 10),
		list(QUALITY_WELDING, 40, "time" = 10),
		list(CRAFT_MATERIAL, 1, MATERIAL_SILVER, "time" = 10),
		list(QUALITY_SAWING, 60, "time" = 10),
		list(CRAFT_MATERIAL, 4, MATERIAL_PLATINUM, "time" = 10),
		list(QUALITY_SCREW_DRIVING, 40, "time" = 15)
	)

/datum/craft_recipe/guild/greyson_manipulator_advanced
	name = "Greyson positronic femto manipulator"
	result = /obj/item/stock_parts/manipulator/one_star/advanced
	icon_state = "electronic"
	steps = list(
		list(/obj/item/stock_parts/manipulator/one_star, 1, "time" = 10),
		list(CRAFT_MATERIAL, 6, MATERIAL_STEEL, "time" = 10),
		list(CRAFT_MATERIAL, 6, MATERIAL_PLASTIC, "time" = 10),
		list(CRAFT_MATERIAL, 4, MATERIAL_PLATINUM, "time" = 10),
		list(QUALITY_SCREW_DRIVING, 40, "time" = 15)
	)

/datum/craft_recipe/guild/greyson_laser_advanced
	name = "Greyson positronic nano-lensed micro-laser"
	result = /obj/item/stock_parts/micro_laser/one_star/advanced
	icon_state = "electronic"
	steps = list(
		list(/obj/item/stock_parts/micro_laser/one_star, 1, "time" = 10),
		list(QUALITY_SCREW_DRIVING, 40, 70, "time" = 10),
		list(CRAFT_MATERIAL, 1, MATERIAL_PLASMAGLASS, "time" = 10),
		list(CRAFT_MATERIAL, 1, MATERIAL_RGLASS, "time" = 10),
		list(QUALITY_BOLT_TURNING, 10, 70, "time" = 10),
		list(QUALITY_WELDING, 40, "time" = 10),
		list(QUALITY_SAWING, 60, "time" = 10),
		list(CRAFT_MATERIAL, 4, MATERIAL_PLATINUM, "time" = 10),
		list(QUALITY_SCREW_DRIVING, 40, "time" = 15)
	)

/datum/craft_recipe/guild/greyson_matter_advanced
	name = "Greyson positronic ultra-capacity matter bin"
	result = /obj/item/stock_parts/matter_bin/one_star/advanced
	icon_state = "electronic"
	steps = list(
		list(/obj/item/stock_parts/matter_bin/one_star, 1, "time" = 10),
		list(QUALITY_SCREW_DRIVING, 10, 70, "time" = 10),
		list(CRAFT_MATERIAL, 1, MATERIAL_PLASTEEL, "time" = 10),
		list(CRAFT_MATERIAL, 1, MATERIAL_PLASMAGLASS, "time" = 10),
		list(QUALITY_BOLT_TURNING, 10, 70, "time" = 10),
		list(QUALITY_WELDING, 40, "time" = 10),
		list(QUALITY_HAMMERING, 40, "time" = 10),
		list(QUALITY_SAWING, 60, "time" = 10),
		list(CRAFT_MATERIAL, 4, MATERIAL_PLATINUM, "time" = 10),
		list(QUALITY_SCREW_DRIVING, 40, "time" = 15)
	)
/* Advanced versions of the basic stock parts, requiring 2 of the base part and more materials and crafting time
/datum/craft_recipe/guild/guild_bin_alt
	name = "Hand Cast Matter Bin Alt"
	result = /obj/item/stock_parts/matter_bin/handmade
	steps = list(
		list(/obj/item/stock_parts/matter_bin/adv, 2),
		list(QUALITY_SCREW_DRIVING, 10, 70),
		list(CRAFT_MATERIAL, 3, MATERIAL_PLASTEEL),
		list(CRAFT_MATERIAL, 1, MATERIAL_PLASMAGLASS),
		list(QUALITY_BOLT_TURNING, 10, 70),
		list(QUALITY_WELDING, 40),
		list(QUALITY_HAMMERING, 40),
		list(QUALITY_SAWING, 60)
	)

/datum/craft_recipe/guild/guild_manip_alt
	name = "Forged Manipulator Alt"
	result = /obj/item/stock_parts/manipulator/handmade
	steps = list(
		list(/obj/item/stock_parts/manipulator/nano, 2),
		list(QUALITY_SCREW_DRIVING, 40, 70),
		list(CRAFT_MATERIAL, 3, MATERIAL_PLASTEEL),
		list(CRAFT_MATERIAL, 3, MATERIAL_PLASTIC),
		list(QUALITY_BOLT_TURNING, 10, 70),
		list(QUALITY_WELDING, 40),
		list(/obj/item/stack/cable_coil, 10),
		list(QUALITY_HAMMERING, 40),
		list(QUALITY_SAWING, 60)
	)

/datum/craft_recipe/guild/guild_laser_alt
	name = "Perfected Micro-Laser Alt"
	result = /obj/item/stock_parts/micro_laser/handmade
	steps = list(
		list(/obj/item/stock_parts/micro_laser/high, 2),
		list(QUALITY_SCREW_DRIVING, 40, 70),
		list(CRAFT_MATERIAL, 1, MATERIAL_PLASMAGLASS),
		list(CRAFT_MATERIAL, 1, MATERIAL_RGLASS),
		list(QUALITY_BOLT_TURNING, 10, 70),
		list(QUALITY_WELDING, 40),
		list(QUALITY_SAWING, 60)
	)

/datum/craft_recipe/guild/guild_scanner_alt
	name = "Perfected Scanning Module Alt"
	result = /obj/item/stock_parts/scanning_module/handmade
	steps = list(
		list(/obj/item/stock_parts/scanning_module/adv, 2),
		list(QUALITY_SCREW_DRIVING, 40, 70),
		list(CRAFT_MATERIAL, 2, MATERIAL_GOLD),
		list(QUALITY_BOLT_TURNING, 10, 70),
		list(QUALITY_WELDING, 40),
		list(CRAFT_MATERIAL, 2, MATERIAL_SILVER),
		list(QUALITY_SAWING, 60)
	)

/datum/craft_recipe/guild/guild_capacitor_alt
	name = "Crafted Ultra Capacitor Alt"
	result = /obj/item/stock_parts/capacitor/handmade
	steps = list(
		list(/obj/item/stock_parts/capacitor/adv, 2),
		list(QUALITY_SCREW_DRIVING, 40, 70),
		list(CRAFT_MATERIAL, 2, MATERIAL_GOLD),
		list(QUALITY_BOLT_TURNING, 10, 70),
		list(QUALITY_WELDING, 40),
		list(CRAFT_MATERIAL, 2, MATERIAL_SILVER),
		list(QUALITY_SAWING, 60)
	)
*/
// Just speeder to make in bulk then one by one, and costs a upfrunt of 1 cardbord they can recoop
/datum/craft_recipe/guild/guild_bin_box
	name = "Box of Cast Matter Bins"
	result = /obj/item/storage/box/guild_bin
	steps = list(
		list(/obj/item/stock_parts/matter_bin/super, 4, "time" = 10),
		list(QUALITY_SCREW_DRIVING, 10, 70),
		list(CRAFT_MATERIAL, 4, MATERIAL_PLASTEEL, "time" = 10),
		list(CRAFT_MATERIAL, 4, MATERIAL_PLASMAGLASS, "time" = 10),
		list(QUALITY_BOLT_TURNING, 10, 70),
		list(QUALITY_WELDING, 40),
		list(QUALITY_HAMMERING, 40),
		list(QUALITY_SAWING, 60),
		list(CRAFT_MATERIAL, 1, MATERIAL_CARDBOARD, "time" = 10)
	)

/datum/craft_recipe/guild/guild_manip_box
	name = "Box of Forged Manipulators"
	result = /obj/item/storage/box/guild_manip
	steps = list(
		list(/obj/item/stock_parts/manipulator/pico, 4, "time" = 10),
		list(QUALITY_SCREW_DRIVING, 40, 70),
		list(CRAFT_MATERIAL, 8, MATERIAL_PLASTEEL, "time" = 10),
		list(CRAFT_MATERIAL, 8, MATERIAL_PLASTIC, "time" = 10),
		list(QUALITY_BOLT_TURNING, 10, 70),
		list(QUALITY_WELDING, 40),
		list(/obj/item/stack/cable_coil, 10, "time" = 10),
		list(QUALITY_HAMMERING, 40),
		list(QUALITY_SAWING, 60),
		list(CRAFT_MATERIAL, 1, MATERIAL_CARDBOARD, "time" = 10)
	)

/datum/craft_recipe/guild/guild_laser_box
	name = "Box of Perfected Micro-Lasers"
	result = /obj/item/storage/box/guild_laser
	steps = list(
		list(/obj/item/stock_parts/micro_laser/ultra, 4, "time" = 10),
		list(QUALITY_SCREW_DRIVING, 40, 70),
		list(CRAFT_MATERIAL, 4, MATERIAL_PLASMAGLASS, "time" =  10),
		list(CRAFT_MATERIAL, 4, MATERIAL_RGLASS, "time" = 10),
		list(QUALITY_BOLT_TURNING, 10, 70),
		list(QUALITY_WELDING, 40),
		list(QUALITY_SAWING, 60),
		list(CRAFT_MATERIAL, 1, MATERIAL_CARDBOARD, "time" = 10)
	)

/datum/craft_recipe/guild/guild_scanner_box
	name = "Box of Perfected Scanning Modules"
	result = /obj/item/storage/box/guild_scanner
	steps = list(
		list(/obj/item/stock_parts/scanning_module/phasic, 4, "time" = 10),
		list(QUALITY_SCREW_DRIVING, 40, 70),
		list(CRAFT_MATERIAL, 4, MATERIAL_GOLD, "time" = 10),
		list(QUALITY_BOLT_TURNING, 10, 70),
		list(QUALITY_WELDING, 40),
		list(CRAFT_MATERIAL, 4, MATERIAL_SILVER, "time" = 10),
		list(QUALITY_SAWING, 60),
		list(CRAFT_MATERIAL, 1, MATERIAL_CARDBOARD, "time" = 10)
	)

/datum/craft_recipe/guild/guild_capacitor_box
	name = "Box of Crafted Ultra Capacitors"
	result = /obj/item/storage/box/guild_capacitor
	steps = list(
		list(/obj/item/stock_parts/capacitor/super, 4, "time" = 10),
		list(QUALITY_SCREW_DRIVING, 40, 70),
		list(CRAFT_MATERIAL, 4, MATERIAL_GOLD, "time" = 10),
		list(QUALITY_BOLT_TURNING, 10, 70),
		list(QUALITY_WELDING, 40),
		list(CRAFT_MATERIAL, 4, MATERIAL_SILVER, "time" = 10),
		list(QUALITY_SAWING, 60),
		list(CRAFT_MATERIAL, 1, MATERIAL_CARDBOARD, "time" = 10)
	)

/datum/craft_recipe/guild/greyson_capacitor_box
    name = "Box of Greyson Hyper Capacitors"
    result = /obj/item/storage/box/greyson_capacitor
    steps = list(
        list(/obj/item/stock_parts/capacitor/one_star, 4, "time" = 10),
		list(QUALITY_SCREW_DRIVING, 40, 70),
		list(CRAFT_MATERIAL, 4, MATERIAL_GOLD, "time" = 10),
		list(QUALITY_BOLT_TURNING, 10, 70),
		list(QUALITY_WELDING, 40),
		list(CRAFT_MATERIAL, 4, MATERIAL_SILVER, "time" = 10),
		list(QUALITY_SAWING, 60),
		list(CRAFT_MATERIAL, 1, MATERIAL_PLATINUM, "time" = 10),
        list(QUALITY_SCREW_DRIVING, 40, "time" = 15),
        list(CRAFT_MATERIAL, 1, MATERIAL_CARDBOARD, "time" = 10)
    )

/datum/craft_recipe/guild/greyson_scanner_box
    name = "Box of Greyson Scanning Modules"
    result = /obj/item/storage/box/greyson_scanner
    steps = list(
        list(/obj/item/stock_parts/scanning_module/one_star, 4, "time" = 10),
		list(QUALITY_SCREW_DRIVING, 40, 70),
		list(CRAFT_MATERIAL, 4, MATERIAL_GOLD, "time" = 10),
		list(QUALITY_BOLT_TURNING, 10, 70),
		list(QUALITY_WELDING, 40),
		list(CRAFT_MATERIAL, 4, MATERIAL_SILVER, "time" = 10),
		list(QUALITY_SAWING, 60),
		list(CRAFT_MATERIAL, 1, MATERIAL_PLATINUM, "time" = 10),
        list(QUALITY_SCREW_DRIVING, 40, "time" = 15),
        list(CRAFT_MATERIAL, 1, MATERIAL_CARDBOARD, "time" = 10)
    )

/datum/craft_recipe/guild/greyson_manipulator_box
    name = "Box of Greyson Manipulators"
    result = /obj/item/storage/box/greyson_manip
    steps = list(
        list(/obj/item/stock_parts/manipulator/one_star, 4, "time" = 10),
		list(/obj/item/stock_parts/manipulator/pico, 4, "time" = 10),
		list(QUALITY_SCREW_DRIVING, 40, 70),
		list(CRAFT_MATERIAL, 8, MATERIAL_PLASTEEL, "time" = 10),
		list(CRAFT_MATERIAL, 8, MATERIAL_PLASTIC, "time" = 10),
		list(QUALITY_BOLT_TURNING, 10, 70),
		list(QUALITY_WELDING, 40),
		list(/obj/item/stack/cable_coil, 10, "time" = 10),
		list(QUALITY_HAMMERING, 40),
		list(QUALITY_SAWING, 60),
		list(CRAFT_MATERIAL, 1, MATERIAL_PLATINUM, "time" = 10),
        list(QUALITY_SCREW_DRIVING, 40, "time" = 15),
        list(CRAFT_MATERIAL, 1, MATERIAL_CARDBOARD, "time" = 10)
    )

/datum/craft_recipe/guild/greyson_laser_box
    name = "Box of Greyson Micro-Lasers"
    result = /obj/item/storage/box/greyson_laser
    steps = list(
        list(/obj/item/stock_parts/micro_laser/one_star, 4, "time" = 10),
        list(CRAFT_MATERIAL, 4, MATERIAL_PLASMAGLASS, "time" = 10),
        list(CRAFT_MATERIAL, 4, MATERIAL_RGLASS, "time" = 10),
        list(CRAFT_MATERIAL, 1, MATERIAL_CARDBOARD, "time" = 10),
		list(CRAFT_MATERIAL, 1, MATERIAL_PLATINUM, "time" = 10),
        list(QUALITY_SCREW_DRIVING, 40, "time" = 15),
        list(CRAFT_MATERIAL, 1, MATERIAL_CARDBOARD, "time" = 10)
    )

/datum/craft_recipe/guild/greyson_matter_box
    name = "Box of Greyson Matter Bins"
    result = /obj/item/storage/box/greyson_bin
    steps = list(
	list(/obj/item/stock_parts/matter_bin/super, 4, "time" = 10),
		list(QUALITY_SCREW_DRIVING, 10, 70),
		list(CRAFT_MATERIAL, 4, MATERIAL_PLASTEEL, "time" = 10),
		list(CRAFT_MATERIAL, 4, MATERIAL_PLASMAGLASS, "time" = 10),
		list(QUALITY_BOLT_TURNING, 10, 70),
		list(QUALITY_WELDING, 40),
		list(QUALITY_HAMMERING, 40),
		list(QUALITY_SAWING, 60),
		list(CRAFT_MATERIAL, 1, MATERIAL_PLATINUM, "time" = 10),
        list(QUALITY_SCREW_DRIVING, 40, "time" = 15),
        list(CRAFT_MATERIAL, 1, MATERIAL_CARDBOARD, "time" = 10)
    )
