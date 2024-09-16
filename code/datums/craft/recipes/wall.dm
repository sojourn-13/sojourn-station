/datum/craft_recipe/wall
	category = "Walls"

/datum/craft_recipe/wall/barricade
	name = "barricade"
	result = /obj/structure/barricade
	icon_state = "woodworking"
	steps = list(
		list(CRAFT_MATERIAL, 5, MATERIAL_WOOD),
		list(QUALITY_HAMMERING, 10, 20)
	)

/datum/craft_recipe/wall/grille
	name = "grille"
	result = /obj/structure/grille
	flags = CRAFT_ON_FLOOR|CRAFT_ONE_PER_TURF
	steps = list(
		list(/obj/item/stack/rods, 2, "time" = 10)
	)

/datum/craft_recipe/wall/railing
	name = "railing, copper"
	result = /obj/structure/railing
	steps = list(
		list(CRAFT_MATERIAL, 4, MATERIAL_STEEL)
	)

/datum/craft_recipe/wall/railing_grey
	name = "railing, grey"
	result = /obj/structure/railing/grey
	steps = list(
		list(CRAFT_MATERIAL, 4, MATERIAL_STEEL)
	)

//wall or small you know them req only 2 list
/datum/craft_recipe/wall/wall
	steps = list(
		list(CRAFT_MATERIAL, 2, MATERIAL_STEEL)
	)
	flags = null
	time = 120
	related_stats = list(STAT_MEC)

/datum/craft_recipe/wall/wall_girders
	name = "wall girder"
	result = /obj/structure/girder
	time = WORKTIME_NORMAL
	flags = null
	steps = list(
		list(CRAFT_MATERIAL, 5, MATERIAL_STEEL)
	)
	flags = CRAFT_ON_FLOOR|CRAFT_ONE_PER_TURF
	related_stats = list(STAT_MEC)

/datum/craft_recipe/wall/wall_girders/low
	name = "wall girder, low"
	result = /obj/structure/girder/low
	time = WORKTIME_FAST
	flags = null
	steps = list(
		list(CRAFT_MATERIAL, 3, MATERIAL_STEEL)
	)
	related_stats = list(STAT_MEC)

/datum/craft_recipe/wall/lattice
	name = "lattice"
	result = /obj/structure/lattice
	time = WORKTIME_FAST
	flags = CRAFT_ON_FLOOR|CRAFT_ONE_PER_TURF
	steps = list(
		list(CRAFT_MATERIAL, 2, MATERIAL_STEEL)
	)
	related_stats = list(STAT_MEC)
