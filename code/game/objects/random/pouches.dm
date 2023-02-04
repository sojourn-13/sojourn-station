/obj/random/pouch
	name = "random pouch"
	icon_state = "box-green"

/obj/random/pouch/item_to_spawn()
	return pickweight(list(
	/obj/item/storage/pouch/small_generic = 10,
	/obj/item/storage/pouch/medium_generic = 5,
	/obj/item/storage/pouch/large_generic = 1,
	/obj/item/storage/pouch/medical_supply = 3,
	/obj/item/storage/pouch/engineering_supply = 3,
	/obj/item/storage/pouch/engineering_tools = 5,
	/obj/item/storage/pouch/tubular = 7,
	/obj/item/storage/pouch/ammo = 3,
	/obj/item/storage/pouch/pistol_holster = 3,
	/obj/item/storage/pouch/pistol_holster/cowboy = 2,
	/obj/item/storage/pouch/kniferig = 3,
	/obj/item/storage/pouch/baton_holster = 3
	))

/obj/random/pouch/always_spawn
	name = "random always spawn pouch"
	spawn_nothing_percentage = 0

/obj/random/pouch/low_chance
	name = "low chance random pouch"
	icon_state = "box-green-low"
	spawn_nothing_percentage = 80
