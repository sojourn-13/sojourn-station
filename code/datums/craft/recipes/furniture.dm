/datum/craft_recipe/furniture
	category = "Furniture"
	flags = CRAFT_ON_FLOOR|CRAFT_ONE_PER_TURF
	related_stats = list(STAT_MEC)
	time = 80

/datum/craft_recipe/furniture/bed
	name = "bed"
	result = /obj/structure/bed
	steps = list(
		list(CRAFT_MATERIAL, 5, MATERIAL_STEEL)
	)

//Custom chairs
/datum/craft_recipe/furniture/bar_chair
	name = "chair, bar"
	result = /obj/structure/bed/chair/custom/bar_special
	steps = list(
		list(CRAFT_MATERIAL, 4, MATERIAL_STEEL),
		list(CRAFT_MATERIAL, 2, MATERIAL_PLASTIC),
		list(QUALITY_BOLT_TURNING, 10, 20)
	)

//Common chairs
/datum/craft_recipe/furniture/chair
	name = "chair, steel"
	result = /obj/structure/bed/chair
	steps = list(
		list(CRAFT_MATERIAL, 5, MATERIAL_STEEL)
	)

/datum/craft_recipe/furniture/wooden_chair
	name = "chair, wood"
	result = /obj/structure/bed/chair/custom/wood
	icon_state = "woodworking"
	steps = list(
		list(CRAFT_MATERIAL, 5, MATERIAL_WOOD)
	)

// Office chairs
/datum/craft_recipe/furniture/office_chair
	name = "chair, office dark"
	result = /obj/structure/bed/chair/office/dark
	steps = list(
		list(CRAFT_MATERIAL, 5, MATERIAL_STEEL)
	)

/datum/craft_recipe/furniture/office_chair/light
	name = "chair, office white"
	result = /obj/structure/bed/chair/office/light

// Comfy chairs
/datum/craft_recipe/furniture/comfy_chair
	name = "comfy chair, beige"
	result = /obj/structure/bed/chair/comfy/beige
	steps = list(
		list(CRAFT_MATERIAL, 5, MATERIAL_STEEL)
	)

/datum/craft_recipe/furniture/comfy_chair/black
	name = "comfy chair, black"
	result = /obj/structure/bed/chair/comfy/black

/datum/craft_recipe/furniture/comfy_chair/blue
	name = "comfy chair, blue"
	result = /obj/structure/bed/chair/comfy/blue

/datum/craft_recipe/furniture/comfy_chair/brown
	name = "comfy chair, brown"
	result = /obj/structure/bed/chair/comfy/brown

/datum/craft_recipe/furniture/comfy_chair/green
	name = "comfy chair, green"
	result = /obj/structure/bed/chair/comfy/green

/datum/craft_recipe/furniture/comfy_chair/lime
	name = "comfy chair, lime"
	result = /obj/structure/bed/chair/comfy/lime

/datum/craft_recipe/furniture/comfy_chair/purple
	name = "comfy chair, purple"
	result = /obj/structure/bed/chair/comfy/purp

/datum/craft_recipe/furniture/comfy_chair/red
	name = "comfy chair, red"
	result = /obj/structure/bed/chair/comfy/red

/datum/craft_recipe/furniture/comfy_chair/teal
	name = "comfy chair, teal"
	result = /obj/structure/bed/chair/comfy/teal

/datum/craft_recipe/furniture/stool
	name = "stool"
	result = /obj/item/weapon/stool
	time = 30
	steps = list(
		list(CRAFT_MATERIAL, 1, MATERIAL_STEEL)
	)
	flags = null

/datum/craft_recipe/furniture/barstool
	name = "stool, bar"
	result = /obj/item/weapon/stool/custom/bar_special
	time = 30
	steps = list(
		list(CRAFT_MATERIAL, 1, MATERIAL_STEEL),
		list(/obj/item/stack/rods, 3),
		list(QUALITY_WELDING, 10, 20)
	)

/datum/craft_recipe/furniture/dryingrack
	name = "drying rack"
	result = /obj/machinery/smartfridge/drying_rack
	time = 90
	icon_state = "woodworking"
	steps = list(
		list(CRAFT_MATERIAL, 20, MATERIAL_WOOD)
	)