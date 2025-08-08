GLOBAL_LIST_EMPTY(all_crafting_station_recipes)

/proc/populate_all_crafting_station_recipes()
	for(var/type in subtypesof(/datum/recipe_crafting_station))
		var/datum/recipe_crafting_station/recipe = type
		if(initial(recipe.name) == null)
			continue
		GLOB.all_crafting_station_recipes[type] = new type()

/datum/recipe_crafting_station
	var/name
	var/category = "Misc"
	var/subcategory = null
	var/result = null
	var/list/required_resources = list()

/datum/recipe_crafting_station/proc/can_craft(mob/user, productivity_bonus, list/available_materials)
	. = TRUE

	var/cost = get_cost(user, productivity_bonus)
	if(cost == -1)
		return FALSE

	var/list/costs = cost
	for(var/mat in costs)
		var/amt_required = costs[mat]
		if(amt_required > available_materials[mat])
			. = FALSE

/datum/recipe_crafting_station/proc/get_cost(mob/user, productivity_bonus)
	return required_resources

/datum/recipe_crafting_station/proc/make_result(mob/user, obj/source)
	new result(source.drop_location())

/datum/recipe_crafting_station/proc/get_ui_data(mob/user, productivity_bonus)
	var/list/data = list()

	data["name"] = name
	data["type"] = type
	data["category"] = category
	data["subcategory"] = subcategory
	data["cost"] = get_cost(user, productivity_bonus)

	return data

// |----------------------------|
// | AMMO                       |
// |----------------------------|
/datum/recipe_crafting_station/ammo
	category = "Misc Ammo"
	required_resources = list(MATERIAL_STEEL = 10, MATERIAL_CARDBOARD = 2)
	var/point_cost = 0

/datum/recipe_crafting_station/ammo/proc/available_points(mob/user, productivity_bonus)
	var/material_points = 15 + productivity_bonus
	if(user.stats)
		if(user.stats.getPerk(PERK_HANDYMAN))
			material_points += 11
		if(user.stats.getPerk(PERK_GUNSMITH))
			material_points += 11
		switch(user.stats.getStat(STAT_MEC))
			if(STAT_LEVEL_BASIC to STAT_LEVEL_ADEPT)
				material_points += 3
			if(STAT_LEVEL_ADEPT to STAT_LEVEL_EXPERT)
				material_points += 6
			if(STAT_LEVEL_EXPERT to STAT_LEVEL_PROF)
				material_points += 9
			if(STAT_LEVEL_PROF to STAT_LEVEL_MASTER)
				material_points += 12
			if(STAT_LEVEL_MASTER to INFINITY)
				material_points += 15

	return material_points

/datum/recipe_crafting_station/ammo/get_cost(mob/user, productivity_bonus)
	var/list/cost = required_resources.Copy()

	var/material_points = available_points(user, productivity_bonus)

	if(point_cost > material_points)
		return -1

	var/proportional_cost = point_cost / material_points

	for(var/material in cost)
		cost[material] *= proportional_cost

	return cost

/datum/recipe_crafting_station/ammo/get_ui_data(mob/user, productivity_bonus)
	var/list/data = ..()
	data["available_points"] = available_points(user, productivity_bonus)
	data["point_cost"] = point_cost
	return data

// .35
/datum/recipe_crafting_station/ammo/nine_mm
	category = "Small Arms Ammo"
	subcategory = CAL_PISTOL

/datum/recipe_crafting_station/ammo/nine_mm/scrap_ammo_pile
	name = "Scrap .35 ammo pile"
	point_cost = 5
	result = /obj/item/ammo_casing/pistol_35/scrap/prespawned

/datum/recipe_crafting_station/ammo/nine_mm/scrap_speedloader
	name = "Scrap .35 speedloader"
	point_cost = 3
	result = /obj/item/ammo_magazine/speed_loader_pistol_35/scrap

/datum/recipe_crafting_station/ammo/nine_mm/scrap_packet
	name = "Scrap .35 ammo packet"
	point_cost = 12
	result = /obj/item/ammo_magazine/ammobox/pistol_35/scrap

/datum/recipe_crafting_station/ammo/nine_mm/ammo_pile
	name = ".35 ammo pile"
	point_cost = 8
	result = /obj/item/ammo_casing/pistol_35/prespawned

/datum/recipe_crafting_station/ammo/nine_mm/ammo_packet
	name = ".35 ammo packet"
	point_cost = 18
	result = /obj/item/ammo_magazine/ammobox/pistol_35

/datum/recipe_crafting_station/ammo/nine_mm/pistol_mag
	name = "EMPTY .35 pistol magazine"
	point_cost = 5
	result = /obj/item/ammo_magazine/pistol_35/empty

/datum/recipe_crafting_station/ammo/nine_mm/extended_mag
	name = "EMPTY .35 extended magazine"
	point_cost = 7
	result = /obj/item/ammo_magazine/highcap_pistol_35/empty

/datum/recipe_crafting_station/ammo/nine_mm/smg_mag
	name = "EMPTY .35 SMG magazine"
	point_cost = 12
	result = /obj/item/ammo_magazine/smg_35/empty

// .40
/datum/recipe_crafting_station/ammo/ten_mm
	category = "Small Arms Ammo"
	subcategory = CAL_MAGNUM

/datum/recipe_crafting_station/ammo/ten_mm/scrap_ammo_pile
	name = "Scrap .40 ammo pile"
	point_cost = 3
	result = /obj/item/ammo_casing/magnum_40/scrap/prespawned

/datum/recipe_crafting_station/ammo/ten_mm/scrap_speedloader
	name = "Scrap .40 speedloader"
	point_cost = 5
	result = /obj/item/ammo_magazine/speed_loader_magnum_40/scrap

/datum/recipe_crafting_station/ammo/ten_mm/scrap_ammo_packet
	name = "Scrap .40 ammo packet"
	point_cost = 15
	result = /obj/item/ammo_magazine/ammobox/magnum_40/scrap

/datum/recipe_crafting_station/ammo/ten_mm/ammo_pile
	name = ".40 magnum ammo pile"
	point_cost = 7
	result = /obj/item/ammo_casing/magnum_40/prespawned

/datum/recipe_crafting_station/ammo/ten_mm/ammo_packet
	name = ".40 ammo packet"
	point_cost = 26
	result = /obj/item/ammo_magazine/ammobox/magnum_40

/datum/recipe_crafting_station/ammo/ten_mm/pistol_mag
	name = "EMPTY .40 pistol magazine"
	point_cost = 7
	result = /obj/item/ammo_magazine/magnum_40/empty

// .50 Kurz
/datum/recipe_crafting_station/ammo/twelve_mm
	category = "Small Arms Ammo"
	subcategory = CAL_50

/datum/recipe_crafting_station/ammo/twelve_mm/ammo_pile
	name = ".50 Kurz ammo pile"
	point_cost = 8
	result = /obj/item/ammo_casing/kurz_50/prespawned

/datum/recipe_crafting_station/ammo/twelve_mm/speed_loader
	name = ".50 Kurz speedloader"
	point_cost = 10
	result = /obj/item/ammo_magazine/speed_loader_kurz_50

/datum/recipe_crafting_station/ammo/twelve_mm/ammo_box
	name = ".50 Kurz ammo box"
	point_cost = 26
	result = /obj/item/ammo_magazine/ammobox/kurz_50

/datum/recipe_crafting_station/ammo/twelve_mm/mag
	name = "EMPTY .50 Kurz heavy pistol magazine"
	point_cost = 8
	result = /obj/item/ammo_magazine/kurz_50/empty

// shotgun
/datum/recipe_crafting_station/ammo/shotgun
	category = "Long Arms Ammo"
	subcategory = CAL_SHOTGUN

/datum/recipe_crafting_station/ammo/shotgun/scrap_beanbag_pile
	name = "Scrap beanbags pile"
	point_cost = 3
	result = /obj/item/ammo_casing/shotgun/beanbag/scrap/prespawned

/datum/recipe_crafting_station/ammo/shotgun/scrap_buckshot_pile
	name = "Scrap buckshot pile"
	point_cost = 4
	result = /obj/item/ammo_casing/shotgun/pellet/scrap/prespawned

/datum/recipe_crafting_station/ammo/shotgun/scrap_slug_pile
	name = "Scrap slugs pile"
	point_cost = 4
	result = /obj/item/ammo_casing/shotgun/scrap/prespawned

/datum/recipe_crafting_station/ammo/shotgun/scrap_slug_packet
	name = "Scrap slugs packet"
	point_cost = 15
	result = /obj/item/ammo_magazine/ammobox/shotgun/scrap_slug

/datum/recipe_crafting_station/ammo/shotgun/scrap_buckshot_packet
	name = "Scrap buckshot packet"
	point_cost = 12
	result = /obj/item/ammo_magazine/ammobox/shotgun/scrap_pellet

/datum/recipe_crafting_station/ammo/shotgun/scrap_beanbag_packet
	name = "Scrap beanbag packet"
	point_cost = 10
	result = /obj/item/ammo_magazine/ammobox/shotgun/scrap_beanbag

/datum/recipe_crafting_station/ammo/shotgun/beanbag_pile
	name = "20mm beanbag pile"
	point_cost = 6
	result = /obj/item/ammo_casing/shotgun/beanbag/prespawned

/datum/recipe_crafting_station/ammo/shotgun/buckshot_pile
	name = "20mm buckshot pile"
	point_cost = 9
	result = /obj/item/ammo_casing/shotgun/pellet/prespawned

/datum/recipe_crafting_station/ammo/shotgun/slug_pile
	name = "20mm slug pile"
	point_cost = 9
	result = /obj/item/ammo_casing/shotgun/prespawned

/datum/recipe_crafting_station/ammo/shotgun/beanbag_packet
	name = "20mm beanbag packet"
	point_cost = 15
	result = /obj/item/ammo_magazine/ammobox/shotgun/beanbags

/datum/recipe_crafting_station/ammo/shotgun/buckshot_packet
	name = "20mm buckshot packet"
	point_cost = 20
	result = /obj/item/ammo_magazine/ammobox/shotgun/buckshot

/datum/recipe_crafting_station/ammo/shotgun/slug_packet
	name = "20mm slug packet"
	point_cost = 25
	result = /obj/item/ammo_magazine/ammobox/shotgun

/datum/recipe_crafting_station/ammo/shotgun/cermaic_pile
	name = "20mm ceramic pile"
	point_cost = 5
	result = /obj/item/ammo_casing/shotgun/ceramic/prespawned

/datum/recipe_crafting_station/ammo/shotgun/cermaic_packet
	name = "20mm ceramic packet"
	point_cost = 20
	result = /obj/item/ammo_magazine/ammobox/shotgun/ceramic

/datum/recipe_crafting_station/ammo/shotgun/incendiary_pile
	name = "20mm incendiary pile"
	point_cost = 12
	result = /obj/item/ammo_casing/shotgun/incendiary/prespawned

/datum/recipe_crafting_station/ammo/shotgun/incendiary_packet
	name = "20mm incendiary packet"
	point_cost = 28
	result = /obj/item/ammo_magazine/ammobox/shotgun/incendiary

// .257
/datum/recipe_crafting_station/ammo/lrifle
	category = "Long Arms Ammo"
	subcategory = CAL_LRIFLE

/datum/recipe_crafting_station/ammo/lrifle/scrap_pile
	name = "Scrap carbine ammo pile"
	point_cost = 3
	result = /obj/item/ammo_casing/light_rifle_257/scrap/prespawned

/datum/recipe_crafting_station/ammo/lrifle/scrap_packet
	name = "Scrap carbine ammo packet"
	point_cost = 10
	result = /obj/item/ammo_magazine/ammobox/light_rifle_257/scrap

/datum/recipe_crafting_station/ammo/lrifle/pile
	name = "Carbine ammo pile"
	point_cost = 8
	result = /obj/item/ammo_casing/light_rifle_257/prespawned

/datum/recipe_crafting_station/ammo/lrifle/packet
	name = "Carbine ammo packet"
	point_cost = 26
	result = /obj/item/ammo_magazine/ammobox/light_rifle_257_small

/datum/recipe_crafting_station/ammo/lrifle/incendiary_pile
	name = "Incendiary carbine ammo pile"
	point_cost = 8
	result = /obj/item/ammo_casing/light_rifle_257/incend/prespawned

/datum/recipe_crafting_station/ammo/lrifle/incendiary_packet
	name = "Incendiary carbine ammo packet"
	point_cost = 26
	result = /obj/item/ammo_magazine/ammobox/light_rifle_257_small/incend

/datum/recipe_crafting_station/ammo/lrifle/mag
	name = "EMPTY carbine standard magazine"
	point_cost = 5
	result = /obj/item/ammo_magazine/light_rifle_257_short/empty

/datum/recipe_crafting_station/ammo/lrifle/extended_mag
	name = "EMPTY carbine extended magazine"
	point_cost = 10
	result = /obj/item/ammo_magazine/light_rifle_257/scrap/empty

/datum/recipe_crafting_station/ammo/lrifle/drum_mag
	name = "EMPTY carbine drum magazine"
	point_cost = 30
	result = /obj/item/ammo_magazine/light_rifle_257_drum/empty

/datum/recipe_crafting_station/ammo/lrifle/box_mag
	name = "EMPTY carbine linked box"
	point_cost = 20
	result = /obj/item/ammo_magazine/rifle_75_linked_box/light_rifle_257/empty

// 7.5mm
/datum/recipe_crafting_station/ammo/rifle
	category = "Long Arms Ammo"
	subcategory = CAL_RIFLE

/datum/recipe_crafting_station/ammo/rifle/scrap_pile
	name = "Scrap ammo pile"
	point_cost = 3
	result = /obj/item/ammo_casing/rifle_75/scrap/prespawned

/datum/recipe_crafting_station/ammo/rifle/scrap_packet
	name = "Scrap rifle ammo packet"
	point_cost = 15
	result = /obj/item/ammo_magazine/ammobox/rifle_75_small/scrap

/datum/recipe_crafting_station/ammo/rifle/pile
	name = "Rifle ammo pile"
	point_cost = 8
	result = /obj/item/ammo_casing/rifle_75/prespawned

/datum/recipe_crafting_station/ammo/rifle/packet
	name = "Rifle ammo packet"
	point_cost = 26
	result = /obj/item/ammo_magazine/ammobox/rifle_75_small

/datum/recipe_crafting_station/ammo/rifle/incendiary_pile
	name = "Incendiary rifle ammo pile"
	point_cost = 8
	result = /obj/item/ammo_casing/rifle_75/incend/prespawned

/datum/recipe_crafting_station/ammo/rifle/incendiary_packet
	name = "Incendiary rifle ammo packet"
	point_cost = 26
	result = /obj/item/ammo_magazine/ammobox/rifle_75_small/incend

/datum/recipe_crafting_station/ammo/rifle/mag
	name = "EMPTY Rifle short magazine"
	point_cost = 5
	result = /obj/item/ammo_magazine/rifle_75_short/scrap/empty

/datum/recipe_crafting_station/ammo/rifle/extended_mag
	name = "EMPTY Rifle extended magazine"
	point_cost = 10
	result = /obj/item/ammo_magazine/rifle_75/empty

/datum/recipe_crafting_station/ammo/rifle/drum_mag
	name = "EMPTY Rifle drum magazine"
	point_cost = 30
	result = /obj/item/ammo_magazine/rifle_75_drum/empty

/datum/recipe_crafting_station/ammo/rifle/box_mag
	name = "EMPTY Rifle linked box"
	point_cost = 20
	result = /obj/item/ammo_magazine/rifle_75_linked_box/empty

// .408
/datum/recipe_crafting_station/ammo/hrifle
	category = "Long Arms Ammo"
	subcategory = CAL_HRIFLE

/datum/recipe_crafting_station/ammo/hrifle/scrap_pile
	name = "Scrap heavy rifle ammo pile"
	point_cost = 3
	result = /obj/item/ammo_casing/heavy_rifle_408/scrap/prespawned

/datum/recipe_crafting_station/ammo/hrifle/scrap_packet
	name = "Scrap heavy rifle ammo packet"
	point_cost = 15
	result = /obj/item/ammo_magazine/ammobox/heavy_rifle_408_small/scrap

/datum/recipe_crafting_station/ammo/hrifle/pile
	name = "Heavy rifle ammo pile"
	point_cost = 8
	result = /obj/item/ammo_casing/heavy_rifle_408/prespawned

/datum/recipe_crafting_station/ammo/hrifle/packet
	name = "Heavy rifle ammo packet"
	point_cost = 26
	result = /obj/item/ammo_magazine/ammobox/heavy_rifle_408_small

/datum/recipe_crafting_station/ammo/hrifle/incendiary_pile
	name = "Incendiary heavy rifle ammo pile"
	point_cost = 8
	result = /obj/item/ammo_casing/heavy_rifle_408/incend/prespawned

/datum/recipe_crafting_station/ammo/hrifle/incendiary_packet
	name = "Incendiary heavy rifle ammo packet"
	point_cost = 26
	result = /obj/item/ammo_magazine/ammobox/heavy_rifle_408_small/incend

/datum/recipe_crafting_station/ammo/hrifle/mag
	name = "EMPTY heavy rifle magazine"
	point_cost = 5
	result = /obj/item/ammo_magazine/heavy_rifle_408/scrap/empty

/datum/recipe_crafting_station/ammo/hrifle/drum_mag
	name = "EMPTY heavy rifle drum magazine"
	point_cost = 30
	result = /obj/item/ammo_magazine/heavy_rifle_408_drum/empty

// .60-06
/datum/recipe_crafting_station/ammo/antim
	category = "Long Arms Ammo"
	subcategory = CAL_ANTIM

/datum/recipe_crafting_station/ammo/antim/scrap_pile
	name = "Scrap .60-06 ammo pile"
	point_cost = 5
	result = /obj/item/ammo_casing/antim/scrap/prespawned

/datum/recipe_crafting_station/ammo/antim/scrap_box
	name = "Scrap .60-06 ammo box"
	point_cost = 10
	result = /obj/item/ammo_magazine/ammobox/antim/scrap

/datum/recipe_crafting_station/ammo/antim/pile
	name = ".60-06 ammo pile"
	point_cost = 10
	result = /obj/item/ammo_casing/antim/prespawned

/datum/recipe_crafting_station/ammo/antim/packet
	name = ".60-06 ammo packet"
	point_cost = 26
	result = /obj/item/ammo_magazine/ammobox/antim_small // Same price as every packet for half the ammo, otherwise impossible to get

// flare
/datum/recipe_crafting_station/ammo/flare
	subcategory = CAL_FLARE

/datum/recipe_crafting_station/ammo/flare/old
	name = "old flare"
	point_cost = 1
	result = /obj/item/ammo_casing/flare/old

/datum/recipe_crafting_station/ammo/flare/red
	name = "red flare"
	point_cost = 2
	result = /obj/item/ammo_casing/flare

/datum/recipe_crafting_station/ammo/flare/blue
	name = "blue flare"
	point_cost = 2
	result = /obj/item/ammo_casing/flare/blue

/datum/recipe_crafting_station/ammo/flare/green
	name = "green flare"
	point_cost = 2
	result = /obj/item/ammo_casing/flare/green

// 17mm ball
/datum/recipe_crafting_station/ammo/ball
	subcategory = CAL_BALL

/datum/recipe_crafting_station/ammo/ball/pile
	name = "17mm ball ammo pile"
	point_cost = 1
	result = /obj/item/ammo_casing/ball/prespawned

/datum/recipe_crafting_station/ammo/ball/box
	name = "17mm ball ammo box"
	point_cost = 15
	result = /obj/item/ammo_magazine/ammobox/ball
/*
// gyrojet
/datum/recipe_crafting_station/ammo/gyrojet
	subcategory = CAL_70

/datum/recipe_crafting_station/ammo/gyrojet/mag
	name = "EMPTY 19mm Gyrojet magazine"
	point_cost = 26
	result = /obj/item/ammo_magazine/a75/empty
*/
// |----------------------------|
// | BARRELS                    |
// |----------------------------|
/datum/recipe_crafting_station/barrels
	category = "Barrels"

// |----------------------------|
// | SMALL BARRELS              |
// |----------------------------|
/datum/recipe_crafting_station/barrels/small
	subcategory = "Small Arms"
	required_resources = list(MATERIAL_PLASTEEL = 4)

/datum/recipe_crafting_station/barrels/small/nine_mm
	name = ".35 barrel"
	result = /obj/item/part/gun/barrel/pistol

/datum/recipe_crafting_station/barrels/small/ten_mm
	name = ".40 barrel"
	result = /obj/item/part/gun/barrel/magnum

/datum/recipe_crafting_station/barrels/small/twelve_mm
	name = ".50 Kurz barrel"
	result = /obj/item/part/gun/barrel/kurz
	required_resources = list(MATERIAL_PLASTEEL = 8)

// |----------------------------|
// | LONG BARRELS               |
// |----------------------------|
/datum/recipe_crafting_station/barrels/long
	subcategory = "Long Arms"
	required_resources = list(MATERIAL_PLASTEEL = 8)

/datum/recipe_crafting_station/barrels/long/sixfive_mm
	name = ".257 barrel"
	result = /obj/item/part/gun/barrel/srifle

/datum/recipe_crafting_station/barrels/long/sevensixtwo_mm
	name = "7.5mm barrel"
	result = /obj/item/part/gun/barrel/lrifle

/datum/recipe_crafting_station/barrels/long/shotgun
	name = "Shotgun barrel"
	result = /obj/item/part/gun/barrel/shotgun

// |----------------------------|
// | CHEAP SMALL BARRELS        |
// |----------------------------|
/datum/recipe_crafting_station/barrels/small_cheap
	subcategory = "Cheap Small Arms"
	required_resources = list(MATERIAL_STEEL = 4)

/datum/recipe_crafting_station/barrels/small_cheap/nine_mm
	name = ".35 barrel"
	result = /obj/item/part/gun/barrel/pistol/steel

/datum/recipe_crafting_station/barrels/small_cheap/ten_mm
	name = ".40 barrel"
	result = /obj/item/part/gun/barrel/magnum/steel

/datum/recipe_crafting_station/barrels/small_cheap/twelve_mm
	name = ".50 Kurz barrel"
	result = /obj/item/part/gun/barrel/kurz/steel
	required_resources = list(MATERIAL_STEEL = 8)

// |----------------------------|
// | CHEAP LONG BARRELS         |
// |----------------------------|
/datum/recipe_crafting_station/barrels/long_cheap
	subcategory = "Cheap Long Arms"
	required_resources = list(MATERIAL_STEEL = 8)

/datum/recipe_crafting_station/barrels/long_cheap/sixfive_mm
	name = ".257 barrel"
	result = /obj/item/part/gun/barrel/srifle/steel

/datum/recipe_crafting_station/barrels/long_cheap/caseless
	name = "Caseless barrel"
	result = /obj/item/part/gun/barrel/clrifle/steel

/datum/recipe_crafting_station/barrels/long_cheap/sevenfive_mm
	name = "7.5mm barrel"
	result = /obj/item/part/gun/barrel/lrifle/steel

/datum/recipe_crafting_station/barrels/long_cheap/eightsix_mm
	name = ".408 barrel"
	result = /obj/item/part/gun/barrel/hrifle/steel

/datum/recipe_crafting_station/barrels/long_cheap/shotgun
	name = "Shotgun barrel"
	result = /obj/item/part/gun/barrel/shotgun/steel

// |----------------------------|
// | MECHANISMS                 |
// |----------------------------|
/datum/recipe_crafting_station/mechanisms
	category = "Mechanisms"

// |----------------------------|
// | SMALL ARMS MECHANISMS      |
// |----------------------------|
/datum/recipe_crafting_station/mechanisms/small
	subcategory = "Small Arms"
	required_resources = list(MATERIAL_PLASTEEL = 5)

/datum/recipe_crafting_station/mechanisms/small/pistol
	name = "Pistol mechanism"
	result = /obj/item/part/gun/mechanism/pistol

/datum/recipe_crafting_station/mechanisms/small/revolver
	name = "Revolver mechanism"
	result = /obj/item/part/gun/mechanism/revolver

/datum/recipe_crafting_station/mechanisms/small/smg
	name = "SMG mechanism"
	result = /obj/item/part/gun/mechanism/smg

// |----------------------------|
// | LONG ARMS MECHANISMS       |
// |----------------------------|
/datum/recipe_crafting_station/mechanisms/long
	subcategory = "Long Arms"
	required_resources = list(MATERIAL_PLASTEEL = 10)

/datum/recipe_crafting_station/mechanisms/long/autorifle
	name = "Self-loading mechanism"
	result = /obj/item/part/gun/mechanism/autorifle

/datum/recipe_crafting_station/mechanisms/long/shotgun
	name = "Shotgun mechanism"
	result = /obj/item/part/gun/mechanism/shotgun

// |----------------------------|
// | CHEAP SMALL ARMS MECHANISMS|
// |----------------------------|
/datum/recipe_crafting_station/mechanisms/small_cheap
	subcategory = "Cheap Small Arms"
	required_resources = list(MATERIAL_STEEL = 5)

/datum/recipe_crafting_station/mechanisms/small_cheap/pistol
	name = "Pistol mechanism"
	result = /obj/item/part/gun/mechanism/pistol/steel

/datum/recipe_crafting_station/mechanisms/small_cheap/revolver
	name = "Revolver mechanism"
	result = /obj/item/part/gun/mechanism/revolver/steel

/datum/recipe_crafting_station/mechanisms/small_cheap/smg
	name = "SMG mechanism"
	result = /obj/item/part/gun/mechanism/smg/steel

// |----------------------------|
// | CHEAP LONG ARMS MECHANISMS |
// |----------------------------|
/datum/recipe_crafting_station/mechanisms/long_cheap
	subcategory = "Cheap Long Arms"
	required_resources = list(MATERIAL_STEEL = 10)

/datum/recipe_crafting_station/mechanisms/long_cheap/boltgun
	name = "Bolt-action mechanism"
	result = /obj/item/part/gun/mechanism/boltgun

/datum/recipe_crafting_station/mechanisms/long_cheap/autorifle
	name = "Self-loading mechanism"
	result = /obj/item/part/gun/mechanism/autorifle/steel

/datum/recipe_crafting_station/mechanisms/long_cheap/shotgun
	name = "Shotgun mechanism"
	result = /obj/item/part/gun/mechanism/shotgun/steel

// |----------------------------|
// | GRIPS                      |
// |----------------------------|
/datum/recipe_crafting_station/grips
	category = "Grips"

// |----------------------------|
// | PLASTIC GRIPS              |
// |----------------------------|
/datum/recipe_crafting_station/grips/plastic
	required_resources = list(MATERIAL_PLASTIC = 6)

/datum/recipe_crafting_station/grips/plastic/bakelite
	name = "Bakelite grip"
	result = /obj/item/part/gun/grip/serb

/datum/recipe_crafting_station/grips/plastic/plastic
	name = "Plastic grip"
	result = /obj/item/part/gun/grip/black

// |----------------------------|
// | WOOD GRIPS                 |
// |----------------------------|
/datum/recipe_crafting_station/grips/wood
	required_resources = list(MATERIAL_WOOD = 6)

/datum/recipe_crafting_station/grips/wood/wood
	name = "Wooden grip"
	result = /obj/item/part/gun/grip/wood

// |----------------------------|
// | ROCKETS                    |
// |----------------------------|
/datum/recipe_crafting_station/rocket
	category = "Misc Ammo"
	subcategory = "Rockets"
	required_resources = list(MATERIAL_PLASMA = 5, MATERIAL_PLASTIC = 5, MATERIAL_PLASTEEL = 5, MATERIAL_STEEL = 10)

/datum/recipe_crafting_station/rocket/rpg
	name = "RPG shell"
	result = /obj/item/ammo_casing/rocket/scrap/prespawned

/datum/recipe_crafting_station/rocket/gyrojet
	name = "19mm gyrojet rocket"
	result = /obj/item/ammo_casing/a75

