/obj/random/powercell
	name = "random powercell"
	icon_state = "battery-green"

/obj/random/powercell/item_to_spawn()
	return pickweight(list(/obj/item/cell/large = 30,\
				/obj/item/cell/large/high = 30,\
				/obj/item/cell/large/super = 9,\
				/obj/item/cell/large/hyper = 3,\
				/obj/item/cell/large/moebius = 20,\
				/obj/item/cell/large/moebius/high = 20,\
				/obj/item/cell/large/moebius/super = 10,\
				/obj/item/cell/large/moebius/hyper = 4,\
				/obj/item/cell/large/moebius/nuclear = 2,\
				/obj/item/cell/large/excelsior  = 1,\
				/obj/item/cell/medium = 30,\
				/obj/item/cell/medium/high = 30,\
				/obj/item/cell/medium/super = 12,\
				/obj/item/cell/medium/hyper = 3,\
				/obj/item/cell/medium/moebius = 20,\
				/obj/item/cell/medium/moebius/high = 20,\
				/obj/item/cell/medium/moebius/super = 10,\
				/obj/item/cell/medium/moebius/hyper = 4,\
				/obj/item/cell/medium/moebius/nuclear = 2,\
				/obj/item/cell/medium/excelsior = 3,\
				/obj/item/cell/small = 40,\
				/obj/item/cell/small/high = 40,\
				/obj/item/cell/small/super = 16,\
				/obj/item/cell/small/hyper = 4,\
				/obj/item/cell/small/moebius = 30,\
				/obj/item/cell/small/moebius/high = 30,\
				/obj/item/cell/small/moebius/super = 16,\
				/obj/item/cell/small/moebius/hyper = 5,\
				/obj/item/cell/small/moebius/nuclear = 2,\
				/obj/item/cell/small/excelsior = 1))

/obj/random/powercell/low_chance
	name = "low chance random powercell"
	icon_state = "battery-green-low"
	spawn_nothing_percentage = 60

/obj/random/powercell/large_safe
	name = "random large lonestar weighted powercell"
	icon_state = "battery-green"

/obj/random/powercell/large_safe/item_to_spawn()
	return pickweight(list(
				/obj/item/cell/large = 15,\
				/obj/item/cell/large/high = 10,\
				/obj/item/cell/large/super = 9,\
				/obj/item/cell/large/hyper = 3,\
				/obj/item/cell/large/moebius/high = 6,\
				/obj/item/cell/large/moebius/super = 4,\
				/obj/item/cell/large/moebius/hyper = 2,\
				/obj/item/cell/large/moebius/nuclear = 1
				))

/obj/random/powercell/large_safe_lonestar
	name = "random large lonestar only powercell"
	icon_state = "battery-green"

/obj/random/powercell/large_safe_lonestar/item_to_spawn()
	return pickweight(list(
				/obj/item/cell/large = 20,\
				/obj/item/cell/large/high = 15,\
				/obj/item/cell/large/super = 5,\
				/obj/item/cell/large/hyper = 1
				))


/obj/random/powercell/medium_safe
	name = "random medium lonestar weighted powercell"
	icon_state = "battery-green"

/obj/random/powercell/medium_safe/item_to_spawn()
	return pickweight(list(
				/obj/item/cell/medium = 30,\
				/obj/item/cell/medium/high = 20,\
				/obj/item/cell/medium/super = 12,\
				/obj/item/cell/medium/hyper = 3,\
				/obj/item/cell/medium/moebius = 20,\
				/obj/item/cell/medium/moebius/high = 20,\
				/obj/item/cell/medium/moebius/super = 10,\
				/obj/item/cell/medium/moebius/hyper = 4,\
				/obj/item/cell/medium/moebius/nuclear = 2
				))

/obj/random/powercell/medium_safe_lonestar
	name = "random medium lonestar only powercell"
	icon_state = "battery-green"

/obj/random/powercell/medium_safe_lonestar/item_to_spawn()
	return pickweight(list(
				/obj/item/cell/medium = 30,\
				/obj/item/cell/medium/high = 15,\
				/obj/item/cell/medium/super = 5,\
				/obj/item/cell/medium/hyper = 1
				))

/obj/random/powercell/small_safe
	name = "random small lonestar weighted powercell"
	icon_state = "battery-green"

/obj/random/powercell/small_safe/item_to_spawn()
	return pickweight(list(
				/obj/item/cell/small = 20,\
				/obj/item/cell/small/high = 20,\
				/obj/item/cell/small/super = 16,\
				/obj/item/cell/small/hyper = 4,\
				/obj/item/cell/small/moebius = 12,\
				/obj/item/cell/small/moebius/high = 10,\
				/obj/item/cell/small/moebius/super = 8,\
				/obj/item/cell/small/moebius/hyper = 6,\
				/obj/item/cell/small/moebius/nuclear = 2
				))

/obj/random/powercell/small_safe_lonestar
	name = "random small lonestar only powercell"
	icon_state = "battery-green"

/obj/random/powercell/small_safe_lonestar/item_to_spawn()
	return pickweight(list(
				/obj/item/cell/small = 20,\
				/obj/item/cell/small/high = 10,\
				/obj/item/cell/small/super = 5,\
				/obj/item/cell/small/hyper = 1
				))