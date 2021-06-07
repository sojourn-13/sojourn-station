/datum/craft_recipe/robotic
	category = "Robots"
	time = 100
	related_stats = list(STAT_MEC)
	avaliableToEveryone = TRUE

/datum/craft_recipe/robotic/roomba_frame
	name = "Roomba Frame"
	result = /obj/item/weapon/roomba_frame
	steps = list(
		list(CRAFT_MATERIAL, 10, MATERIAL_STEEL, "time" = 60),
		list(QUALITY_WELDING, 35, "time" = 60),
		list(QUALITY_HAMMERING, 35, "time" = 180),
		list(QUALITY_SCREW_DRIVING, 35, "time" = 90)
	)

/datum/craft_recipe/robotic/knife
	name = "Roomba Knife"
	result = /obj/item/weapon/tool/roomba_knife
	steps = list(
		list(/obj/item/weapon/tool/knife, 1, "time" = 30),
		list(QUALITY_ADHESIVE, 35, "time" = 30)
	)