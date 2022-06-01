/datum/craft_recipe/robotic
	category = "Robots"
	time = 100
	related_stats = list(STAT_MEC)
	requiredPerk = PERK_ROBOTICS_EXPERT

// Control Module used in all the custom bots.
/datum/craft_recipe/robotic/custom_board
	name = "Custom Control Board"
	result = /obj/item/bot_part/control
	icon_state = "electronic"
	steps = list(
		list(/obj/item/circuitboard, 1, "time" = 20),
		list(CRAFT_MATERIAL, 3, MATERIAL_PLASTIC, "time" = 60),
		list(CRAFT_MATERIAL, 2, MATERIAL_SILVER, "time" = 60),
		list(CRAFT_MATERIAL, 1, MATERIAL_GOLD, "time" = 60),
		list(QUALITY_WELDING, 10, "time" = 60)
	)

// Roomba Section
/datum/craft_recipe/robotic/roomba_frame
	name = "Roomba Frame"
	result = /obj/item/bot_part/roomba/roomba_frame
	steps = list(
		list(CRAFT_MATERIAL, 5, MATERIAL_STEEL, "time" = 60),
		list(QUALITY_WELDING, 10, "time" = 60),
		list(QUALITY_BOLT_TURNING, 10, "time" = 180),
		list(QUALITY_SCREW_DRIVING, 10, "time" = 90)
	)

/datum/craft_recipe/robotic/roomba_treads
	name = "Roomba Treads"
	result = /obj/item/bot_part/roomba/roomba_treads
	steps = list(
		list(CRAFT_MATERIAL, 2, MATERIAL_PLASTIC, "time" = 60),
		list(QUALITY_WELDING, 10, "time" = 60)
	)

/datum/craft_recipe/robotic/roomba_knife
	name = "Roomba Knife"
	result = /obj/item/bot_part/roomba/roomba_knife
	steps = list(
		list(/obj/item/tool/knife, 1, "time" = 30),
		list(QUALITY_ADHESIVE, 10, "time" = 30)
	)

/datum/craft_recipe/robotic/roomba_armor
	name = "Roomba Plating"
	result = /obj/item/bot_part/roomba/roomba_plating
	steps = list(
		list(CRAFT_MATERIAL, 5, MATERIAL_STEEL, "time" = 60),
		list(QUALITY_WELDING, 10, "time" = 60)
	)

/datum/craft_recipe/robotic/roomba_armor/heavy
	name = "Heavy Roomba Plating"
	result = /obj/item/bot_part/roomba/roomba_plating/heavy
	steps = list(
		list(/obj/item/bot_part/roomba/roomba_plating, 1, "time" = 60),
		list(CRAFT_MATERIAL, 4, MATERIAL_PLASTEEL, "time" = 60),
		list(QUALITY_WELDING, 10, "time" = 60)
	)

// SI Sword Drone
/datum/craft_recipe/robotic/sword_frame
	name = "Sword Drone Frame"
	result = /obj/item/bot_part/sword_part/main_frame
	steps = list(
		list(CRAFT_MATERIAL, 5, MATERIAL_STEEL, "time" = 60),
		list(CRAFT_MATERIAL, 2, MATERIAL_PLASTEEL, "time" = 60),
		list(QUALITY_WELDING, 10, "time" = 60),
		list(QUALITY_BOLT_TURNING, 10, "time" = 180),
		list(QUALITY_SCREW_DRIVING, 10, "time" = 90)
	)

// SI Mantis Drone
/datum/craft_recipe/robotic/mantis_frame
	name = "Mantis Drone Frame"
	result = /obj/item/bot_part/mantis_part/main_frame
	steps = list(
		list(CRAFT_MATERIAL, 5, MATERIAL_STEEL, "time" = 60),
		list(CRAFT_MATERIAL, 5, MATERIAL_PLASTEEL, "time" = 60),
		list(QUALITY_WELDING, 10, "time" = 60),
		list(QUALITY_BOLT_TURNING, 10, "time" = 180),
		list(QUALITY_SCREW_DRIVING, 10, "time" = 90)
	)

// SI Drone Limbs
/datum/craft_recipe/robotic/head_frame
	name = "Head Frame"
	result = /obj/item/bot_part/head_frame
	steps = list(
		list(CRAFT_MATERIAL, 5, MATERIAL_STEEL, "time" = 60),
		list(CRAFT_MATERIAL, 2, MATERIAL_PLASTEEL, "time" = 60),
		list(/obj/item/robot_parts/robot_component/camera, 1, "time" = 60),
		list(QUALITY_WELDING, 10, "time" = 60),
		list(QUALITY_BOLT_TURNING, 10, "time" = 180),
		list(QUALITY_SCREW_DRIVING, 10, "time" = 90)
	)

/datum/craft_recipe/robotic/left_arm_frame
	name = "Left Arm Frame"
	result = /obj/item/bot_part/left_arm_frame
	steps = list(
		list(CRAFT_MATERIAL, 5, MATERIAL_STEEL, "time" = 60),
		list(CRAFT_MATERIAL, 1, MATERIAL_PLASTEEL, "time" = 60),
		list(/obj/item/robot_parts/robot_component/actuator, 1, "time" = 60),
		list(QUALITY_WELDING, 10, "time" = 60),
		list(QUALITY_BOLT_TURNING, 10, "time" = 180),
		list(QUALITY_SCREW_DRIVING, 10, "time" = 90)
	)

/datum/craft_recipe/robotic/right_arm_frame
	name = "Right Arm Frame"
	result = /obj/item/bot_part/right_arm_frame
	steps = list(
		list(CRAFT_MATERIAL, 5, MATERIAL_STEEL, "time" = 60),
		list(CRAFT_MATERIAL, 1, MATERIAL_PLASTEEL, "time" = 60),
		list(/obj/item/robot_parts/robot_component/actuator, 1, "time" = 60),
		list(QUALITY_WELDING, 10, "time" = 60),
		list(QUALITY_BOLT_TURNING, 10, "time" = 180),
		list(QUALITY_SCREW_DRIVING, 10, "time" = 90)
	)

/datum/craft_recipe/robotic/left_leg_frame
	name = "Left Leg Frame"
	result = /obj/item/bot_part/left_leg_frame
	steps = list(
		list(CRAFT_MATERIAL, 5, MATERIAL_STEEL, "time" = 60),
		list(CRAFT_MATERIAL, 1, MATERIAL_PLASTEEL, "time" = 60),
		list(/obj/item/robot_parts/robot_component/actuator, 1, "time" = 60),
		list(QUALITY_WELDING, 10, "time" = 60),
		list(QUALITY_BOLT_TURNING, 10, "time" = 180),
		list(QUALITY_SCREW_DRIVING, 10, "time" = 90)
	)

/datum/craft_recipe/robotic/right_leg_frame
	name = "Right Leg Frame"
	result = /obj/item/bot_part/right_leg_frame
	steps = list(
		list(CRAFT_MATERIAL, 5, MATERIAL_STEEL, "time" = 60),
		list(CRAFT_MATERIAL, 1, MATERIAL_PLASTEEL, "time" = 60),
		list(/obj/item/robot_parts/robot_component/actuator, 1, "time" = 60),
		list(QUALITY_WELDING, 10, "time" = 60),
		list(QUALITY_BOLT_TURNING, 10, "time" = 180),
		list(QUALITY_SCREW_DRIVING, 10, "time" = 90)
	)

/datum/craft_recipe/robotic/mining_bot
	name = "Aether Mining Bot"
	result = /mob/living/carbon/superior_animal/robot/mining/aether
	steps = list(
		list(CRAFT_MATERIAL, 10, MATERIAL_STEEL, "time" = 60),
		list(/obj/item/bot_part/roomba/roomba_treads, 2, "time" = 60),
		list(/obj/item/robot_parts/robot_component/actuator, 2, "time" = 60),
		list(/obj/item/robot_parts/robot_component/camera, 1, "time" = 60),
		list(/obj/item/tool/pickaxe/diamonddrill, 1, "time" = 60),
		list(QUALITY_WELDING, 10, "time" = 60),
		list(QUALITY_BOLT_TURNING, 10, "time" = 180),
		list(QUALITY_SCREW_DRIVING, 10, "time" = 90)
	)

/datum/craft_recipe/robotic/chicken
	name = "Chemical Housing Internal Combustion Kit"
	result = /mob/living/simple_animal/metal_chicken
	steps = list(
		list(CRAFT_MATERIAL, 10, MATERIAL_STEEL, "time" = 30),
		list(CRAFT_MATERIAL, 10, MATERIAL_PLASTIC, "time" = 30),
		list(CRAFT_MATERIAL, 10, MATERIAL_PLASTEEL, "time" = 30),
		list(CRAFT_MATERIAL, 10, MATERIAL_GLASS, "time" = 30),
		list(/obj/item/bot_part/roomba/roomba_treads, 2, "time" = 60),
		list(/obj/item/robot_parts/robot_component/actuator, 2, "time" = 60),
		list(/obj/item/robot_parts/robot_component/camera, 1, "time" = 60),
		list(/obj/structure/reagent_dispensers/bidon, 1, "time" = 30),
		list(/obj/item/circuitboard/chicken, 1,"time" = 30),
		list(QUALITY_WELDING, 10, "time" = 60),
		list(QUALITY_BOLT_TURNING, 10, "time" = 180),
		list(QUALITY_SCREW_DRIVING, 10, "time" = 90)
	)


// Ameridian Knight Rig recipe
/datum/craft_recipe/robotic/ameridian_knight
	name = "Ameridian Knight Rigsuit"
	result = /obj/item/rig/ameridian_knight
	icon_state = "device"
	steps = list(
		list(/obj/item/rig, 1, "time" = 20), // Any rig as base
		list(/obj/item/clothing, 1, "time" = 30),
		list(/obj/item/storage/belt, 1, "time" = 30),
		list(/obj/item/clothing/suit/armor/vest/soteriasuit, 1, "time" = 30),
		list(/obj/item/clothing/head/helmet/soteriasuit, 1, "time" = 30),
		list(/obj/item/stock_parts/scanning_module/phasic, 1, "time" = 30),
		list(/obj/item/robot_parts/robot_component/camera, 1, "time" = 30),
		list(/obj/item/robot_parts/robot_component/diagnosis_unit, 1, "time" = 30),
		list(/obj/item/computer_hardware/processor_unit/super, 1, "time" = 30),
		list(/obj/item/stack/cable_coil, 10, "time" = 30),
		list(QUALITY_WIRE_CUTTING, 20, "time" = 60),
		list(CRAFT_MATERIAL, 60, MATERIAL_STEEL, "time" = 30),
		list(QUALITY_WELDING, 45, "time" = 60),
		list(QUALITY_DRILLING, 45, "time" = 60),
		list(QUALITY_CUTTING, 45, "time" = 60),
		list(CRAFT_MATERIAL, 5, MATERIAL_PLASMAGLASS, "time" = 30),
		list(QUALITY_SCREW_DRIVING, 45, "time" = 60),
		list(/obj/item/stack/cable_coil, 30, "time" = 60),
		list(QUALITY_WIRE_CUTTING, 20, "time" = 60),
		list(CRAFT_MATERIAL, 30, MATERIAL_PLASTEEL, "time" = 60),
		list(/obj/item/tool_upgrade/productivity/motor, 1, "time" = 30),
		list(/obj/item/stock_parts/capacitor/super, 1, "time" = 30),
		list(/obj/item/tool_upgrade/productivity/booster, 1, "time" = 30),
		list(/obj/item/stock_parts/matter_bin/super, 1, "time" = 30),
		list(/obj/item/ameridian_core, 1, "time" = 30),
		list(/obj/item/stock_parts/manipulator/pico, 2, "time" = 30),
		list(/obj/item/gun_upgrade/mechanism/battery_shunt, 1, "time" = 30),
		list(/obj/item/tool_upgrade/productivity/rocket_engine, 1, "time" = 30),
		list(/obj/item/tool_upgrade/reinforcement/guard, 3, "time" = 30),
		list(/obj/item/cell/large/moebius/omega, 1, "time" = 30),
		list(QUALITY_PULSING, 10, "time" = 60),
		list(/obj/item/borg/upgrade/vtec, 1, "time" = 30),
		list(/obj/item/mecha_parts/part/durand_head, 1, "time" = 30),
		list(/obj/item/mecha_parts/part/durand_torso, 1, "time" = 30),
		list(/obj/item/mecha_parts/part/ripley_left_arm, 1, "time" = 30),
		list(/obj/item/mecha_parts/part/ripley_right_arm, 1, "time" = 30),
		list(/obj/item/mecha_parts/part/gygax_left_leg, 1, "time" = 30),
		list(/obj/item/mecha_parts/part/gygax_right_leg, 1, "time" = 30),
		list(/obj/item/clothing/shoes/magboots, 1, "time" = 30),
		list(CRAFT_MATERIAL, 5, MATERIAL_OSMIUM, "time" = 30),
		list(/obj/item/tool_upgrade/augment/hydraulic, 2, "time" = 30),
		list(/obj/item/robot_parts/robot_component/ion_jaunt, 1, "time" = 30),
		list(QUALITY_HAMMERING, 30, "time" = 90),
		list(QUALITY_WELDING, 60, "time" = WORKTIME_EXTREMELY_LONG)
	)
