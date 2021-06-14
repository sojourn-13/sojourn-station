/datum/craft_recipe/robotic
	category = "Robots"
	time = 100
	related_stats = list(STAT_MEC)
	avaliableToEveryone = FALSE // Only Roboticists know how to make robots. When adding new recipe, also add them to code/game/jobs/job/science.dm

/datum/craft_recipe/robotic/roomba_frame
	name = "Roomba Frame"
	result = /obj/item/weapon/roomba_part/roomba_frame
	steps = list(
		list(CRAFT_MATERIAL, 10, MATERIAL_STEEL, "time" = 60),
		list(QUALITY_WELDING, 10, "time" = 60),
		list(QUALITY_BOLT_TURNING, 10, "time" = 180),
		list(QUALITY_SCREW_DRIVING, 10, "time" = 90)
	)

/* Commented out due to it being printable.
/datum/craft_recipe/robotic/roomba_board
	name = "Roomba Control Board"
	result = /obj/item/weapon/roomba_part/control
	steps = list(
		list(obj/item/weapon/circuitboard, "time" = 60),
		list(CRAFT_MATERIAL, 5, MATERIAL_PLASTIC, "time" = 60),
		list(CRAFT_MATERIAL, 3, MATERIAL_SILVER, "time" = 60),
		list(CRAFT_MATERIAL, 1, MATERIAL_GOLD, "time" = 60),
		list(QUALITY_WELDING, 10, "time" = 60)
	)
*/

/datum/craft_recipe/robotic/roomba_treads
	name = "Roomba Treads"
	result = /obj/item/weapon/roomba_part/treads
	steps = list(
		list(CRAFT_MATERIAL, 5, MATERIAL_PLASTIC, "time" = 60),
		list(QUALITY_WELDING, 10, "time" = 60)
	)

/datum/craft_recipe/robotic/roomba_knife
	name = "Roomba Knife"
	result = /obj/item/weapon/roomba_part/roomba_knife
	steps = list(
		list(/obj/item/weapon/tool/knife, 1, "time" = 30),
		list(QUALITY_ADHESIVE, 10, "time" = 30)
	)

/datum/craft_recipe/robotic/roomba_armor
	name = "Roomba Plating"
	result = /obj/item/weapon/roomba_part/roomba_plating
	steps = list(
		list(CRAFT_MATERIAL, 10, MATERIAL_STEEL, "time" = 60),
		list(QUALITY_WELDING, 10, "time" = 60)
	)

/datum/craft_recipe/robotic/roomba_armor/heavy
	name = "Heavy Roomba Plating"
	result = /obj/item/weapon/roomba_part/roomba_plating/heavy
	steps = list(
		list(/obj/item/weapon/roomba_part/roomba_plating, 10, "time" = 60),
		list(CRAFT_MATERIAL, 10, MATERIAL_PLASTEEL, "time" = 60),
		list(QUALITY_WELDING, 10, "time" = 60)
	)