/obj/item/reagent_containers/food/snacks/grown/ambrosiavulgaris
	plantname = "ambrosia"

/obj/item/reagent_containers/food/snacks/grown/ambrosiadeus
	plantname = "ambrosiadeus"

// Predefined types for placing on the map.
/obj/plant_spawner
	name = "plant spawner"
	var/seedtype = "ambrosia" //default to ambrosia for roach taming
/*
/obj/plant_spawner/Initialize(mapload)
	var/datum/seed/S = plant_controller.seeds[seedtype]
	S.harvest(loc,0,0,1)
	spawn(1) if(src) qdel(src)
*/
/obj/plant_spawner/New()
	addtimer(CALLBACK(src, /obj/plant_spawner/proc/spawn_growth), 2)

/obj/plant_spawner/proc/spawn_growth()
	var/datum/seed/S = plant_controller.seeds[seedtype]
	S.harvest(loc,force_amount = 1, harvest_sample = FALSE)
	spawn(5) if(src) qdel(src)

/obj/plant_spawner/libertycap
	seedtype = "libertycap"

/obj/plant_spawner/ambrosiavulgaris
	seedtype = "ambrosia"

/obj/plant_spawner/grass
	seedtype = "grass"

/obj/plant_spawner/wheat
	seedtype = "wheat"

/obj/plant_spawner/poppy
	seedtype = "poppies"

/obj/plant_spawner/sunflower
	seedtype = "sunflowers"

/obj/plant_spawner/harebells
	seedtype = "harebells"

/obj/plant_spawner/towercaps
	seedtype = "towercap"

/obj/plant_spawner/grapes
	seedtype = "grape"

/obj/plant_spawner/green_grapes
	seedtype = "greengrapes"

/obj/plant_spawner/sugarcane
	seedtype = "sugarcane"