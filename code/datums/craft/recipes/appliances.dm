/datum/craft_recipe/appliance
	category = "Appliances"

/datum/craft_recipe/appliance/beehive_assembly
	name = "beehive assembly"
	result = /obj/item/beehive_assembly
	icon_state = "woodworking"
	steps = list(
		list(CRAFT_MATERIAL, 10, MATERIAL_WOOD)
	)
	related_stats = list(STAT_MEC)

/datum/craft_recipe/appliance/beehive_frame
	name = "beehive frame"
	result = /obj/item/honey_frame
	icon_state = "woodworking"
	steps = list(
		list(CRAFT_MATERIAL, 1, MATERIAL_WOOD)
	)
	related_stats = list(STAT_MEC)

/datum/craft_recipe/appliance/canister
	name = "canister"
	result = /obj/machinery/portable_atmospherics/canister/empty
	flags = CRAFT_ON_FLOOR|CRAFT_ONE_PER_TURF
	steps = list(
		list(CRAFT_MATERIAL, 10, MATERIAL_STEEL)
	)
	related_stats = list(STAT_MEC)

/datum/craft_recipe/appliance/cannon_frame
	name = "cannon frame"
	result = /obj/item/cannonframe
	flags = CRAFT_ON_FLOOR|CRAFT_ONE_PER_TURF
	steps = list(
		list(CRAFT_MATERIAL, 10, MATERIAL_STEEL)
	)
	related_stats = list(STAT_MEC)

//You build a frame from rods, add metal shelves, plastic wheels and handles
/datum/craft_recipe/appliance/janicart
	name = "janitorial cart"
	result = /obj/structure/janitorialcart
	flags = CRAFT_ON_FLOOR|CRAFT_ONE_PER_TURF
	steps = list(
		list(/obj/item/stack/rods, 20),
		list(QUALITY_SCREW_DRIVING, 10, 60),
		list(CRAFT_MATERIAL, 10, MATERIAL_STEEL, "time" = 40),
		list(QUALITY_BOLT_TURNING, 10, 60),
		list(CRAFT_MATERIAL, 10, MATERIAL_PLASTIC, "time" = 40),
		list(QUALITY_BOLT_TURNING, 10, 60)
	)
	related_stats = list(STAT_COG)

/datum/craft_recipe/appliance/kitchen_spike
	name = "meat spike"
	result = /obj/structure/kitchenspike
	time = WORKTIME_NORMAL
	steps = list(
		list(/obj/item/stack/rods, 3),
		list(QUALITY_WELDING, 20, 50)
	)
	flags = CRAFT_ON_FLOOR|CRAFT_ONE_PER_TURF
	related_stats = list(STAT_MEC)

/datum/craft_recipe/appliance/tint_button
	name = "window tint controller"
	result = /obj/machinery/button/windowtint
	time = WORKTIME_NORMAL
	steps = list(
		list(/obj/item/device/assembly/signaler, 1)
		)
	flags = CRAFT_ON_FLOOR|CRAFT_ONE_PER_TURF
	related_stats = list(STAT_MEC)


//You get some article of clothing and shred it with a blade to make a mophead. Add in some metal rods for a handle
/datum/craft_recipe/appliance/mop
	name = "mop"
	result = /obj/item/mop
	steps = list(
		list(/obj/item/clothing, 1, time = 30),
		list(QUALITY_CUTTING, 10, 120),
		list(/obj/item/stack/rods, 2),
		list(QUALITY_BOLT_TURNING, 10, 60)
	)
	related_stats = list(STAT_COG)

//Cut variously sized bits of plastic down to size, tape them together, and then use a welder to melt gaps
//It just works!
/datum/craft_recipe/appliance/mopbucket
	name = "mop bucket"
	result = /obj/structure/mopbucket
	flags = CRAFT_ON_FLOOR|CRAFT_ONE_PER_TURF
	steps = list(
		list(CRAFT_MATERIAL, 15, MATERIAL_PLASTIC, "time" = 40),
		list(QUALITY_SEALING, 10, 60),
		list(QUALITY_WELDING, 10, 60)
	)
	related_stats = list(STAT_COG)

// Wheelchairs
/datum/craft_recipe/appliance/wheelchair
	name = "wheelchair"
	result = /obj/structure/bed/chair/wheelchair
	steps = list(
		list(CRAFT_MATERIAL, 5, MATERIAL_STEEL),
	)
	flags = CRAFT_ON_FLOOR|CRAFT_ONE_PER_TURF
	related_stats = list(STAT_MEC)
	time = 80