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

/datum/craft_recipe/furniture/doublebed
	name = "double bed"
	result = /obj/structure/bed/double/padded
	steps = list(
		list(CRAFT_MATERIAL, 10, MATERIAL_STEEL)
	)

/datum/craft_recipe/furniture/bonfire
	name = "bonfire"
	result = /obj/structure/bonfire
	steps = list(
		list(CRAFT_MATERIAL, 5, MATERIAL_WOOD)
	)

// Curtains

/datum/craft_recipe/furniture/curtains
	name = "Curtains (white)"
	result = /obj/structure/curtain
	time = 30
	steps = list(
		list(CRAFT_MATERIAL, 8, MATERIAL_CLOTH)
	)

/datum/craft_recipe/furniture/curtainsbed
	name = "Curtains (bed)"
	result = /obj/structure/curtain/open/bed
	time = 30
	steps = list(
		list(CRAFT_MATERIAL, 8, MATERIAL_CLOTH)
	)

/datum/craft_recipe/furniture/curtains_b
	name = "Curtains (black)"
	result = /obj/structure/curtain/black
	time = 30
	steps = list(
		list(CRAFT_MATERIAL, 8, MATERIAL_CLOTH)
	)

/datum/craft_recipe/furniture/curtains_p
	name = "Curtains (plastic)"
	result = /obj/structure/curtain/medical
	time = 30
	steps = list(
		list(CRAFT_MATERIAL, 8, MATERIAL_PLASTIC)
	)

/datum/craft_recipe/furniture/curtains_r
	name = "Curtains (red)"
	result = /obj/structure/curtain/red
	time = 30
	steps = list(
		list(CRAFT_MATERIAL, 8, MATERIAL_CLOTH)
	)

/datum/craft_recipe/furniture/table
	name = "table frame"
	result = /obj/structure/table
	steps = list(
		list(CRAFT_MATERIAL, 2, MATERIAL_STEEL)
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
	result = /obj/item/stool
	time = 30
	steps = list(
		list(CRAFT_MATERIAL, 1, MATERIAL_STEEL)
	)
	flags = null

/datum/craft_recipe/furniture/barstool
	name = "stool, bar"
	result = /obj/item/stool/custom/bar_special
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

/datum/craft_recipe/furniture/soilbed
	name = "soil"
	result = /obj/machinery/portable_atmospherics/hydroponics/soil
	time = 20
	icon_state = "woodworking"
	steps = list(
		list(/obj/item/stack/ore, 5),
		list(/obj/item/stack/ore/glass, 5),
		list(/obj/item/stack/rods, 3)
	)

/datum/craft_recipe/furniture/burnbarrel
	name = "burn barrel"
	result = /obj/machinery/microwave/burnbarrel
	steps = list(
		list(CRAFT_MATERIAL, 10, MATERIAL_STEEL),
		list(CRAFT_MATERIAL, 1, MATERIAL_WOOD),
	)

