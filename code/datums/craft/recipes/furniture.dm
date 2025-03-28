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

/datum/craft_recipe/furniture/bench
	name = "bench frame"
	result = /obj/structure/table/bench
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

//Sofas

// Red

/datum/craft_recipe/furniture/sofa
	name = "sofa middle, red"
	result = /obj/structure/bed/chair/sofa
	steps = list(
		list(CRAFT_MATERIAL, 5, MATERIAL_STEEL)
	)


/datum/craft_recipe/furniture/sofa/left
	name = "sofa left, red"
	result = /obj/structure/bed/chair/sofa/left

/datum/craft_recipe/furniture/sofa/right
	name = "sofa right, red"
	result = /obj/structure/bed/chair/sofa/right

/datum/craft_recipe/furniture/sofa/corner
	name = "sofa corner, red"
	result = /obj/structure/bed/chair/sofa/corner

// Black

/datum/craft_recipe/furniture/sofa/black
	name = "sofa middle, black"
	result = /obj/structure/bed/chair/sofa/black

/datum/craft_recipe/furniture/sofa/left/black
	name = "sofa left, black"
	result = /obj/structure/bed/chair/sofa/black/left

/datum/craft_recipe/furniture/sofa/right/black
	name = "sofa right, black"
	result = /obj/structure/bed/chair/sofa/black/right

/datum/craft_recipe/furniture/sofa/corner/black
	name = "sofa corner, black"
	result = /obj/structure/bed/chair/sofa/black/corner

// Blue

/datum/craft_recipe/furniture/sofa/blue
	name = "sofa middle, blue"
	result = /obj/structure/bed/chair/sofa/blue

/datum/craft_recipe/furniture/sofa/left/blue
	name = "sofa left, blue"
	result = /obj/structure/bed/chair/sofa/blue/left

/datum/craft_recipe/furniture/sofa/right/blue
	name = "sofa right, blue"
	result = /obj/structure/bed/chair/sofa/blue/right

/datum/craft_recipe/furniture/sofa/corner/blue
	name = "sofa corner, blue"
	result = /obj/structure/bed/chair/sofa/blue/corner

// Brown

/datum/craft_recipe/furniture/sofa/brown
	name = "sofa middle, brown"
	result = /obj/structure/bed/chair/sofa/brown

/datum/craft_recipe/furniture/sofa/left/brown
	name = "sofa left, brown"
	result = /obj/structure/bed/chair/sofa/brown/left

/datum/craft_recipe/furniture/sofa/right/brown
	name = "sofa right, brown"
	result = /obj/structure/bed/chair/sofa/brown/right

/datum/craft_recipe/furniture/sofa/corner/brown
	name = "sofa corner, brown"
	result = /obj/structure/bed/chair/sofa/brown/corner

// Green

/datum/craft_recipe/furniture/sofa/green
	name = "sofa middle, green"
	result = /obj/structure/bed/chair/sofa/green

/datum/craft_recipe/furniture/sofa/left/green
	name = "sofa left, green"
	result = /obj/structure/bed/chair/sofa/green/left

/datum/craft_recipe/furniture/sofa/right/green
	name = "sofa right, green"
	result = /obj/structure/bed/chair/sofa/green/right

/datum/craft_recipe/furniture/sofa/corner/green
	name = "sofa corner, green"
	result = /obj/structure/bed/chair/sofa/green/corner

// Beige

/datum/craft_recipe/furniture/sofa/beige
	name = "sofa middle, beige"
	result = /obj/structure/bed/chair/sofa/beige

/datum/craft_recipe/furniture/sofa/left/beige
	name = "sofa left, beige"
	result = /obj/structure/bed/chair/sofa/beige/left

/datum/craft_recipe/furniture/sofa/right/beige
	name = "sofa right, beige"
	result = /obj/structure/bed/chair/sofa/beige/right

/datum/craft_recipe/furniture/sofa/corner/beige
	name = "sofa corner, beige"
	result = /obj/structure/bed/chair/sofa/beige/corner

// Purple

/datum/craft_recipe/furniture/sofa/purple
	name = "sofa middle, purple"
	result = /obj/structure/bed/chair/sofa/purp

/datum/craft_recipe/furniture/sofa/left/purple
	name = "sofa left, purple"
	result = /obj/structure/bed/chair/sofa/purp/left

/datum/craft_recipe/furniture/sofa/right/purple
	name = "sofa right, purple"
	result = /obj/structure/bed/chair/sofa/purp/right

/datum/craft_recipe/furniture/sofa/corner/purple
	name = "sofa corner, purple"
	result = /obj/structure/bed/chair/sofa/purp/corner

// Teal

/datum/craft_recipe/furniture/sofa/teal
	name = "sofa middle, teal"
	result = /obj/structure/bed/chair/sofa/teal

/datum/craft_recipe/furniture/sofa/left/teal
	name = "sofa left, teal"
	result = /obj/structure/bed/chair/sofa/teal/left

/datum/craft_recipe/furniture/sofa/right/teal
	name = "sofa right, teal"
	result = /obj/structure/bed/chair/sofa/teal/right

/datum/craft_recipe/furniture/sofa/corner/teal
	name = "sofa corner, teal"
	result = /obj/structure/bed/chair/sofa/teal/corner
// -

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

