/obj/random/ammo
	name = "random ammunition"
	icon_state = "ammo-green"
	spawn_nothing_percentage = 40

/obj/random/ammo/item_to_spawn()
	return pickweight(list(
				/obj/item/ammo_magazine/ammobox/shotgun/beanbags = 3,
				/obj/item/ammo_magazine/ammobox/shotgun = 2,
				/obj/item/ammo_magazine/ammobox/shotgun/buckshot = 3,
				/obj/item/ammo_magazine/ammobox/shotgun/scrap_pellet = 2,
				/obj/item/ammo_magazine/ammobox/shotgun/scrap_beanbag = 3,
				/obj/item/ammo_magazine/ammobox/shotgun/scrap_slug = 2,
				/obj/item/ammo_casing/shotgun/scrap/prespawned = 2,
				/obj/item/ammo_casing/shotgun/pellet/scrap/prespawned = 3,
				/obj/item/ammo_casing/shotgun/beanbag/scrap/prespawned = 4,
				/obj/item/ammo_magazine/magnum_40/old = 2,
				/obj/item/ammo_magazine/ammobox/magnum_40 = 1,
				/obj/item/ammo_magazine/ammobox/magnum_40/lethal = 1,
				/obj/item/ammo_magazine/ammobox/magnum_40/rubber = 1,
				/obj/item/ammo_magazine/ammobox/magnum_40/scrap = 1,
				/obj/item/ammo_magazine/speed_loader_magnum_40/scrap = 2,
				/obj/item/ammo_magazine/ammobox/kurtz_50 = 1,
				/obj/item/ammo_magazine/ammobox/kurtz_50/rubber = 1,
				/obj/item/ammo_magazine/ammobox/kurtz_50/lethal = 1,
				/obj/item/ammo_magazine/ammobox/light_rifle_257 = 1,
				/obj/item/ammo_magazine/ammobox/light_rifle_257_small/rubber = 2,
				/obj/item/ammo_magazine/ammobox/light_rifle_257_small/lethal = 1,
				/obj/item/ammo_magazine/ammobox/light_rifle_257/scrap = 2,
				/obj/item/ammo_magazine/light_rifle_257/scrap = 3,
				/obj/item/ammo_magazine/rifle_75/scrap = 2,
				/obj/item/ammo_magazine/rifle_75_short = 1,
				/obj/item/ammo_magazine/rifle_75_short/lethal = 1,
				/obj/item/ammo_magazine/rifle_75_short/rubber = 2,
				/obj/item/ammo_magazine/ammobox/rifle_75_small/scrap = 2,
				/obj/item/ammo_magazine/ammobox/heavy_rifle_408_small= 1,
				/obj/item/ammo_magazine/ammobox/heavy_rifle_408_small/rubber = 2,
				/obj/item/ammo_magazine/ammobox/pistol_35 = 2,
				/obj/item/ammo_magazine/ammobox/pistol_35/rubber = 2,
				/obj/item/ammo_magazine/ammobox/pistol_35/scrap = 2,
				/obj/item/ammo_magazine/ammobox/pistol_35/lethal = 1,
				/obj/item/ammo_magazine/ammobox/pistol_35/scrap = 2,
				/obj/item/ammo_magazine/smg_35 = 1,
				/obj/item/ammo_magazine/smg_35/rubber = 1,
				/obj/item/ammo_magazine/speed_loader_pistol_35/scrap = 5,
				/obj/item/ammo_magazine/pistol_35/scrap = 4,
				/obj/item/ammo_magazine/pistol_35 = 2,
				/obj/item/ammo_magazine/pistol_35/rubber = 4,
				/obj/item/ammo_magazine/pistol_35/practice = 4,
				/obj/item/ammo_magazine/highcap_pistol_35 = 2,
				/obj/item/ammo_magazine/highcap_pistol_35/rubber = 4,
				/obj/item/ammo_magazine/highcap_pistol_35/practice = 1,
				/obj/item/ammo_magazine/speed_loader_magnum_40 = 2,
				/obj/item/ammo_magazine/kurtz_50 = 1,
				/obj/item/ammo_magazine/kurtz_50/lethal = 1,
				/obj/item/ammo_magazine/kurtz_50/rubber = 2,
				/obj/item/ammo_magazine/speed_loader_kurtz_50 = 1,
				/obj/item/ammo_magazine/speed_loader_kurtz_50/rubber = 2,
				/obj/item/ammo_magazine/speed_loader_kurtz_50/lethal = 1,
				/obj/item/ammo_magazine/speed_loader_pistol_35 = 3,
				/obj/item/ammo_magazine/speed_loader_pistol_35/rubber = 4,
				/obj/item/ammo_magazine/ammobox/heavy_rifle_408_small/scrap = 1,
				/obj/item/ammo_magazine/heavy_rifle_408/scrap = 2))

/obj/random/ammo/low_chance
	name = "low chance random ammunition"
	icon_state = "ammo-green-low"
	spawn_nothing_percentage = 60

/obj/random/ammo_fancy
	name = "random advanced ammunition"
	icon_state = "ammo-blue"
	spawn_nothing_percentage = 60

/obj/random/ammo_fancy/item_to_spawn()
	return pick(/obj/item/ammo_magazine/rifle_75/rubber,
				/obj/item/ammo_magazine/rifle_75,
				/obj/item/ammo_magazine/heavy_rifle_408,
				/obj/item/ammo_magazine/heavy_rifle_408/rubber,
				/obj/item/ammo_magazine/heavy_rifle_408/hv,
				/obj/item/ammo_magazine/heavy_rifle_408/lethal,
				/obj/item/ammo_magazine/rifle_75_short/lethal,
				/obj/item/ammo_magazine/rifle_75_short,
				/obj/item/ammo_magazine/rifle_75_short/rubber,
				/obj/item/ammo_magazine/ammobox/heavy_rifle_408_small/rubber,
				/obj/item/ammo_magazine/ammobox/heavy_rifle_408_small,
				/obj/item/ammo_magazine/ammobox/heavy_rifle_408_small/lethal,
				/obj/item/ammo_magazine/ammobox/light_rifle_257_small/rubber,
				/obj/item/ammo_magazine/ammobox/light_rifle_257_small,
				/obj/item/ammo_magazine/ammobox/light_rifle_257,
				/obj/item/ammo_magazine/ammobox/light_rifle_257/rubber,
				/obj/item/ammo_magazine/magnum_40/rubber,
				/obj/item/ammo_magazine/speed_loader_magnum_40,
				/obj/item/ammo_magazine/speed_loader_kurtz_50,
				/obj/item/ammo_magazine/speed_loader_kurtz_50/rubber,
				/obj/item/ammo_magazine/kurtz_50,
				/obj/item/ammo_magazine/kurtz_50/lethal,
				/obj/item/ammo_magazine/ammobox/kurtz_50/rubber,
				/obj/item/ammo_magazine/ammobox/kurtz_50/lethal,
				/obj/item/ammo_magazine/ammobox/kurtz_50,
				/obj/item/ammo_magazine/magnum_40/rubber,
				/obj/item/ammo_magazine/magnum_40,
				/obj/item/cell/medium/high,
				/obj/item/ammo_magazine/m12,
				/obj/item/ammo_magazine/m12/pellet,
				/obj/item/ammo_magazine/m12/beanbag)

/obj/random/ammo_fancy/low_chance
	name = "low chance random random ironhammer ammunition"
	icon_state = "ammo-blue-low"
	spawn_nothing_percentage = 60

/obj/random/ammo/shotgun
	name = "random shotgun ammunition"
	icon_state = "ammo-orange"
	spawn_nothing_percentage = 60

/obj/random/ammo/shotgun/item_to_spawn()
	return pickweight(list(
				/obj/item/ammo_magazine/ammobox/shotgun/scrap_pellet = 2,
				/obj/item/ammo_magazine/ammobox/shotgun/scrap_beanbag = 3,
				/obj/item/ammo_magazine/ammobox/shotgun/scrap_slug = 2,
				/obj/item/ammo_magazine/ammobox/shotgun/beanbags = 4,
				/obj/item/ammo_casing/shotgun/beanbag/scrap/prespawned = 4,
				/obj/item/ammo_magazine/ammobox/shotgun = 2,
				/obj/item/ammo_casing/shotgun/scrap/prespawned = 2,
				/obj/item/ammo_magazine/ammobox/shotgun/stunshells = 1,
				/obj/item/ammo_magazine/ammobox/shotgun/buckshot = 3,
				/obj/item/ammo_casing/shotgun/pellet/scrap/prespawned = 3,
				/obj/item/ammo_magazine/m12/empty = 0.3))

/obj/random/ammo/shotgun/low_chance
	name = "low chance random shotgun ammunition"
	icon_state = "ammo-orange-low"
	spawn_nothing_percentage = 60

/obj/random/ammo_lowcost
	name = "random low tier ammunition"
	icon_state = "ammo-grey"
	spawn_nothing_percentage = 40

/obj/random/ammo_lowcost/item_to_spawn()
	return pickweight(list(/obj/item/ammo_magazine/ammobox/shotgun/beanbags = 2,
				/obj/item/ammo_magazine/ammobox/shotgun = 2,
				/obj/item/ammo_magazine/ammobox/shotgun = 1,
				/obj/item/ammo_magazine/ammobox/shotgun/scrap_pellet = 2,
				/obj/item/ammo_magazine/ammobox/shotgun/scrap_beanbag = 4,
				/obj/item/ammo_magazine/ammobox/shotgun/scrap_slug = 2,
				/obj/item/ammo_casing/shotgun/scrap/prespawned = 2,
				/obj/item/ammo_casing/shotgun/pellet/scrap/prespawned = 3,
				/obj/item/ammo_casing/shotgun/beanbag/scrap/prespawned = 4,
				/obj/item/ammo_magazine/ammobox/pistol_35 = 1,
				/obj/item/ammo_magazine/ammobox/pistol_35/rubber = 6,
				/obj/item/ammo_magazine/ammobox/pistol_35/scrap = 6,
				/obj/item/ammo_magazine/highcap_pistol_35 = 2,
				/obj/item/ammo_magazine/highcap_pistol_35/rubber = 4,
				/obj/item/ammo_magazine/highcap_pistol_35/practice = 1,
				/obj/item/ammo_magazine/pistol_35 = 3,
				/obj/item/ammo_magazine/pistol_35/rubber = 4,
				/obj/item/ammo_magazine/pistol_35/practice = 1,
				/obj/item/ammo_magazine/ammobox/magnum_40/scrap = 1,
				/obj/item/cell/medium = 1))

/obj/random/ammo_lowcost/low_chance
	name = "low chance random low tier ammunition"
	icon_state = "ammo-grey-low"
	spawn_nothing_percentage = 60

//Rubber ammo, used in some spawns
/obj/random/rubber_ammo
	name = "random rubber ammunition"
	icon_state = "ammo-grey"

/obj/random/rubber_ammo/item_to_spawn()
	return pickweight(list(
				/obj/item/ammo_magazine/ammobox/shotgun/beanbags = 3,
				/obj/item/ammo_magazine/ammobox/shotgun/scrap_beanbag = 2,
				/obj/item/ammo_casing/shotgun/beanbag/scrap/prespawned = 4,
				/obj/item/ammo_magazine/ammobox/magnum_40/rubber = 3,
				/obj/item/ammo_magazine/ammobox/kurtz_50/rubber = 1,
				/obj/item/ammo_magazine/ammobox/light_rifle_257_small/rubber = 2,
				/obj/item/ammo_magazine/rifle_75_short/rubber = 2,
				/obj/item/ammo_magazine/ammobox/heavy_rifle_408_small/rubber = 1,
				/obj/item/ammo_magazine/ammobox/pistol_35/rubber = 2,
				/obj/item/ammo_magazine/smg_35/rubber = 2,
				/obj/item/ammo_magazine/pistol_35/rubber = 6,
				/obj/item/ammo_magazine/highcap_pistol_35/rubber = 5,
				/obj/item/ammo_magazine/kurtz_50/rubber = 2,
				/obj/item/ammo_magazine/speed_loader_kurtz_50/rubber = 4,
				/obj/item/ammo_magazine/speed_loader_pistol_35/rubber = 7))

/obj/random/rubber_ammo/low_chance
	name = "low chance random special ammunition"
	icon_state = "ammo-grey-low"
	spawn_nothing_percentage = 60

//Dungeon based random spawners (use these only in dungeons, not maint)
/obj/random/dungeon_ammo
	name = "random special ammunition"
	icon_state = "ammo-grey"

/obj/random/dungeon_ammo/item_to_spawn()
	return pickweight(list(/obj/item/ammo_magazine/c10x24 = 3,
				//obj/item/ammo_magazine/a75 = 3,
				/obj/item/ammo_magazine/heavy_rifle_408_drum = 3,
				/obj/item/ammo_magazine/m12/pellet = 6,
				/obj/item/ammo_magazine/ammobox/rifle_75/lethal = 6,
				/obj/item/ammo_magazine/smg_35/lethal = 9,
				/obj/item/ammo_magazine/pistol_35/lethal = 9,
				/obj/item/ammo_magazine/kurtz_50/lethal = 3,
				/obj/item/ammo_magazine/ammobox/shotgun/buckshot = 6,
				/obj/item/ammo_magazine/ammobox/heavy_rifle_408/hv = 6,
				/obj/item/ammo_casing/antim/lethal/prespawned = 1,
				/obj/item/ammo_casing/antim/ion/prespawned = 1,
				/obj/item/grenade/frag/white_phosphorous = 1))

/obj/random/dungeon_ammo/low_chance
	name = "low chance random special ammunition"
	icon_state = "ammo-grey-low"
	spawn_nothing_percentage = 60

/obj/random/dungeon_ammo/really_low_chance
	name = "really low chance random special ammunition"
	icon_state = "ammo-grey-low"
	spawn_nothing_percentage = 90
