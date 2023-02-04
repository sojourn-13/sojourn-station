/obj/random/pouch/hardcase
	name = "random hardcase"
	icon_state = "box-green"

/obj/random/pouch/hardcase/item_to_spawn()
	return pickweight(list(
	/obj/random/pouch/hardcase_ammo = 2,
	/obj/item/storage/hcases/parts/has_items_spawn = 3,
	/obj/item/storage/hcases/med/has_items_spawn = 4,
	/obj/item/storage/hcases/engi/has_items_spawn = 1,
	/obj/random/pouch/hardcase_scrap = 6,
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
	/obj/item/storage/hcases/ammo/scrap/has_items_spawn = 3,
	/obj/item/storage/hcases/parts/scrap/has_items_spawn = 3,
	/obj/item/storage/hcases/med/scrap/has_items_spawn = 3,
	/obj/item/storage/hcases/engi/scrap/has_items_spawn = 3,
	))

/obj/random/pouch/hardcase_scrap/low_chance
	name = "low chance random ammo hardcase"
	icon_state = "box-green-low"
	spawn_nothing_percentage = 50

/obj/random/pouch/hardcase_ammo/item_to_spawn()
	return pickweight(list(
	/obj/item/storage/hcases/ammo/has_items_spawn = 3,
	/obj/item/storage/hcases/ammo/ih/has_items_spawn = 3,
	/obj/item/storage/hcases/ammo/serb/has_items_spawn = 3,
	/obj/item/storage/hcases/ammo/blackmarket/has_items_spawn = 3,
	/obj/item/storage/hcases/ammo/excel/has_items_spawn = 1,
	))

/obj/random/pouch/hardcase_ammo/low_chance
	name = "low chance random ammo hardcase"
	icon_state = "box-green-low"
	spawn_nothing_percentage = 50



//////////////////////////////////////////Ammo//////////////////////////////////////////

/obj/item/storage/hcases/ammo/has_items_spawn

/obj/item/storage/hcases/ammo/has_items_spawn/populate_contents()
	new /obj/random/ammo/low_chance(src)
	new /obj/random/ammo_lowcost/low_chance(src)
	new /obj/random/ammo_fancy/low_chance(src)
	if(prob(20))
		new /obj/random/gun_parts/high_end(src)
		new /obj/random/gun_parts/frames(src)

/obj/item/storage/hcases/ammo/ih/has_items_spawn

/obj/item/storage/hcases/ammo/ih/has_items_spawn/populate_contents()
	new /obj/random/rubber_ammo/low_chance(src)
	new /obj/random/rubber_ammo/low_chance(src)
	new /obj/random/rubber_ammo/low_chance(src)
	new /obj/random/gun_parts/low(src)
	if(prob(10))
		new /obj/random/gun_parts/high_end(src)
		new /obj/random/gun_parts/frames(src)

/obj/item/storage/hcases/ammo/serb/has_items_spawn

/obj/item/storage/hcases/ammo/serb/has_items_spawn/populate_contents()
	new /obj/random/ammo/low_chance(src)
	new /obj/random/ammo/low_chance(src)
	new /obj/random/ammo/shotgun/low_chance(src)
	new /obj/random/ammo/shotgun/low_chance(src)
	new /obj/random/gun_parts/low(src)
	new /obj/random/gun_parts/low(src)
	if(prob(30))
		new /obj/random/gun_parts/high_end(src)
		new /obj/random/gun_parts/frames(src)

/obj/item/storage/hcases/ammo/blackmarket/has_items_spawn

/obj/item/storage/hcases/ammo/blackmarket/has_items_spawn/populate_contents()
	new /obj/random/ammo/low_chance(src)
	new /obj/random/ammo/low_chance(src)
	new /obj/random/ammo/shotgun/low_chance(src)
	new /obj/random/dungeon_ammo/really_low_chance(src)
	new /obj/random/gun_parts/low(src)
	new /obj/random/gun_parts/low(src)
	if(prob(25))
		new /obj/random/gun_parts/high_end(src)
		new /obj/random/gun_parts/frames(src)

/obj/item/storage/hcases/ammo/excel/has_items_spawn

/obj/item/storage/hcases/ammo/excel/has_items_spawn/populate_contents()
	new /obj/random/ammo/low_chance(src)
	new /obj/random/ammo/low_chance(src)
	new /obj/random/ammo/shotgun/low_chance(src)
	new /obj/random/dungeon_ammo/really_low_chance(src)
	new /obj/random/gun_parts/low(src)
	new /obj/random/gun_parts/low(src)
	new /obj/random/gun_parts/low(src)
	if(prob(70))
		new /obj/random/gun_parts/high_end(src)
		new /obj/random/gun_parts/frames(src)

/obj/item/storage/hcases/ammo/scrap/has_items_spawn

/obj/item/storage/hcases/ammo/scrap/has_items_spawn/populate_contents()
	new /obj/random/ammo_lowcost/low_chance(src)
	new /obj/random/ammo_lowcost/low_chance(src)
	new /obj/random/gun_parts/low(src)
	if(prob(20))
		new /obj/random/gun_parts/frames(src)
	if(prob(30))
		new /obj/item/ammo_kit(src)

//////////////////////////////////////////Parts//////////////////////////////////////////

/obj/item/storage/hcases/parts/has_items_spawn

/obj/item/storage/hcases/parts/has_items_spawn/populate_contents()
	new /obj/random/tool_upgrade/low_chance(src)
	new /obj/random/tool_upgrade/rare/low_chance(src)
	new /obj/random/powercell/low_chance(src)
	new /obj/random/circuitboard/low_chance(src)
	new /obj/random/lathe_disk/low_chance(src)
	new /obj/random/gun_parts/low(src)
	new /obj/random/gun_parts/low(src)
	if(prob(20))
		new /obj/random/gun_parts/frames(src)
		new /obj/random/gun_parts/high_end(src)
	if(prob(30))
		new /obj/item/stack/cable_coil/random(src)

/obj/item/storage/hcases/parts/scrap/has_items_spawn

/obj/item/storage/hcases/parts/scrap/has_items_spawn/populate_contents()
	new /obj/random/tool_upgrade/low_chance(src)
	new /obj/random/circuitboard/low_chance(src)
	new /obj/random/circuitboard/low_chance(src)
	new /obj/random/gun_parts/low(src)
	if(prob(10))
		new /obj/item/stack/cable_coil/random(src)

//////////////////////////////////////////Medical//////////////////////////////////////////

/obj/item/storage/hcases/med/has_items_spawn

/obj/item/storage/hcases/med/has_items_spawn/populate_contents()
	new /obj/random/medical/low_chance(src)
	new /obj/random/medical/low_chance(src)
	new /obj/random/medical_lowcost/low_chance(src)

/obj/item/storage/hcases/med/scrap/has_items_spawn

/obj/item/storage/hcases/med/scrap/has_items_spawn/populate_contents()
	new /obj/random/medical/low_chance(src)
	new /obj/random/medical_lowcost_handmade(src)
	new /obj/random/medical_lowcost_handmade(src)

//////////////////////////////////////////Engineering//////////////////////////////////////////

/obj/item/storage/hcases/engi/has_items_spawn

/obj/item/storage/hcases/engi/has_items_spawn/populate_contents()
	new /obj/random/powercell/low_chance(src)
	new /obj/random/tool_upgrade/low_chance(src)
	new /obj/random/material/low_chance(src)
	new /obj/random/material/low_chance(src)
	new /obj/random/handmade_tool/low_chance(src)
	if(prob(40))
		new /obj/item/stack/cable_coil/random(src)

/obj/item/storage/hcases/engi/scrap/has_items_spawn

/obj/item/storage/hcases/engi/scrap/has_items_spawn/populate_contents()
	new /obj/random/powercell/low_chance(src)
	new /obj/random/handmade_tool/low_chance(src)
	new /obj/random/handmade_tool/low_chance(src)
	new /obj/random/material/low_chance(src)