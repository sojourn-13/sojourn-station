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
	/obj/item/storage/pouch/baton_holster = 3
	))

/obj/random/pouch/low_chance
	name = "low chance random pouch"
	icon_state = "box-green-low"
	spawn_nothing_percentage = 80

/obj/random/pouch/hardcase
	name = "random hardcase"
	icon_state = "box-green"

/obj/random/pouch/hardcase/item_to_spawn()
	return pickweight(list(
	/obj/item/storage/hcases = 3,
	/obj/item/storage/hcases/ammo = 3,
	/obj/item/storage/hcases/ammo/ih = 3,
	/obj/item/storage/hcases/ammo/serb = 3,
	/obj/item/storage/hcases/ammo/blackmarket = 3,
	/obj/item/storage/hcases/ammo/excel = 3,
	/obj/item/storage/hcases/ammo/scrap = 3,
	/obj/item/storage/hcases/parts = 3,
	/obj/item/storage/hcases/parts/scrap = 3,
	/obj/item/storage/hcases/med = 3,
	/obj/item/storage/hcases/med/scrap = 3,
	/obj/item/storage/hcases/engi = 3,
	/obj/item/storage/hcases/engi/scrap = 3,
	))

/obj/random/pouch/hardcase/low_chance
	name = "low chance random hardcase"
	icon_state = "box-green-low"
	spawn_nothing_percentage = 80

/obj/random/pouch/hardcase_scrap
	name = "random scrap hardcase"
	icon_state = "box-green"

/obj/random/pouch/hardcase_scrap/item_to_spawn()
	return pickweight(list(
	/obj/item/storage/hcases/ammo/excel = 1,
	/obj/item/storage/hcases/ammo/scrap = 3,
	/obj/item/storage/hcases/parts/scrap = 3,
	/obj/item/storage/hcases/med/scrap = 3,
	/obj/item/storage/hcases/engi/scrap = 3,
	))

/obj/random/pouch/hardcase_scrap/low_chance
	name = "low chance random scrap hardcase"
	icon_state = "box-green-low"
	spawn_nothing_percentage = 50