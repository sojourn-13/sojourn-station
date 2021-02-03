/obj/random/gun_cheap
	name = "random cheap gun"
	icon_state = "gun-grey"
	spawn_nothing_percentage = 20

/obj/random/gun_cheap/item_to_spawn()
	return pickweight(list(/obj/item/weapon/gun/projectile/mk58 = 1,\
				//obj/item/weapon/gun/projectile/mk58/wood = 1,
				//obj/item/weapon/gun/projectile/revolver/detective = 4,
				/obj/item/weapon/gun/energy/shrapnel = 4,
				/obj/item/weapon/gun/energy/lasersmg = 3,
				/obj/item/weapon/gun/projectile/giskard = 2,\
				/obj/item/weapon/gun/projectile/boltgun/sa = 3,\
				//obj/item/weapon/gun/projectile/boltgun/scout/light = 2,
				//obj/item/weapon/gun/projectile/boltgun/scout/light/wood = 3,
				/obj/item/weapon/gun/projectile/shotgun/pump = 0.5,\
				/obj/item/weapon/gun/projectile/shotgun/pump/sawn = 1,\
				/obj/item/weapon/gun/projectile/shotgun/pump/obrez = 2,\
				/obj/item/weapon/gun/projectile/boltgun/sawn/light/wood = 0.5,\
				/obj/item/weapon/gun/projectile/boltgun/sawn/light = 0.5,\
				/obj/item/weapon/gun/projectile/boltgun/sawn = 0.5,\
				/obj/item/weapon/gun/projectile/boltgun/sawn/sa = 1,\
				/obj/item/weapon/gun/projectile/boltgun/sawn/scout = 0.5,\
				/obj/item/weapon/gun/projectile/handmade_pistol = 2,\
				/obj/item/weapon/gun/projectile/automatic/alemao = 2, \
				/obj/item/weapon/gun/projectile/automatic/luger = 0.1, \
				/obj/item/weapon/gun/projectile/boltgun/zatvor = 2, \
				//obj/item/weapon/gun/projectile/ladon/sa = 1,
				/obj/item/weapon/gun/projectile/olivaw = 2,
				/obj/item/weapon/gun_upgrade/barrel/forged = 2))

/obj/random/gun_cheap/low_chance
	name = "low chance random cheap gun"
	icon_state = "gun-grey-low"
	spawn_nothing_percentage = 80




/obj/random/gun_normal
	name = "random normal gun"
	icon_state = "gun-green"
	spawn_nothing_percentage = 20

/obj/random/gun_normal/item_to_spawn()
	return pickweight(list(/obj/item/weapon/gun/projectile/lamia = 0.1,\
				/obj/item/weapon/gun/projectile/automatic/texan = 0.5,\
				/obj/item/weapon/gun/projectile/lamia/dark = 0.1,\
				//obj/item/weapon/gun/projectile/lamia/dark/sf = 0.1,
				/obj/item/weapon/gun/projectile/ladon = 0.5,\
				/obj/item/weapon/gun/projectile/ladon/sa = 0.5,\
				/obj/item/weapon/gun/projectile/ladon/hs = 0.5,\
				/obj/item/weapon/gun/projectile/automatic/mac = 0.1,\
				//obj/item/weapon/gun/projectile/shotgun/pump/gladstone = 2,
				/obj/item/weapon/gun/projectile/shotgun/pump/gladstone/sawn = 0.5,\
				/obj/item/weapon/gun/projectile/colt = 2,\
				//obj/item/weapon/gun/projectile/automatic/bulldog = 0.5,
				//obj/item/weapon/gun/projectile/automatic/bulldog/rds = 0.5,
				/obj/item/weapon/gun/projectile/revolver = 2,\
				/obj/item/weapon/gun/projectile/revolver/mateba = 0.1,\
				//obj/item/weapon/gun/projectile/automatic/ostwind = 0.5,
				//obj/item/weapon/gun/projectile/automatic/omnirifle = 0.5,
				//obj/item/weapon/gun/projectile/automatic/omnirifle/omnicarbine = 0.5,
				/obj/item/weapon/gun/projectile/boltgun = 0.5,\
				/obj/item/weapon/gun/projectile/boltgun/sa = 2,\
				//obj/item/weapon/gun/projectile/boltgun/scout/light = 2,
				//obj/item/weapon/gun/projectile/boltgun/scout/light/wood = 2,
				/obj/item/weapon/gun/projectile/firefly = 2,
				/obj/item/weapon/gun_upgrade/trigger/dangerzone = 1,
				/obj/item/weapon/gun_upgrade/trigger/cop_block = 1,
				/obj/item/weapon/gun_upgrade/mechanism/overshooter = 1))
				//obj/item/weapon/gun/projectile/automatic/straylight = 2,
				//obj/item/weapon/gun/projectile/automatic/wirbelwind = 0.5))

/obj/random/gun_normal/low_chance
	name = "low chance random normal gun"
	icon_state = "gun-green-low"
	spawn_nothing_percentage = 80


/obj/random/gun_combat
	name = "random assault weapon"
	icon_state = "gun-green"
	spawn_nothing_percentage = 20

/obj/random/gun_combat/item_to_spawn()
	return pickweight(list(/obj/item/weapon/gun/projectile/automatic/texan = 1,\
				/obj/item/weapon/gun/projectile/automatic/mac = 1,\
				//obj/item/weapon/gun/projectile/automatic/sts/lrifle = 3,
				/obj/item/weapon/gun/projectile/automatic/sts/lrifle/sawn = 1,\
				//obj/item/weapon/gun/projectile/automatic/sts/rifle = 2,
				//obj/item/weapon/gun/projectile/automatic/sts/hrifle = 1,
				/obj/item/weapon/gun/projectile/automatic/sts/rifle/sawn = 1,\
				/obj/item/weapon/gun/projectile/automatic/sts/hrifle/sawn = 1,\
				//obj/item/weapon/gun/projectile/automatic/lmg/saw = 0.5,
				//obj/item/weapon/gun/projectile/automatic/pitbull = 1,
				//obj/item/weapon/gun/projectile/automatic/ak47/sa = 3,
				/obj/item/weapon/gun/projectile/automatic/ak47/sawn = 1,\
				//obj/item/weapon/gun/projectile/automatic/ostwind = 1,
				//obj/item/weapon/gun/projectile/automatic/bulldog = 3,
				//obj/item/weapon/gun/projectile/automatic/bulldog/rds = 2,
				//obj/item/weapon/gun/projectile/automatic/omnirifle/standard = 1,
				//obj/item/weapon/gun/projectile/automatic/omnirifle = 1,
				//obj/item/weapon/gun/projectile/automatic/omnirifle/omnicarbine = 1,
				//obj/item/weapon/gun/projectile/automatic/straylight = 3,
				/obj/item/weapon/gun/projectile/shotgun/pug = 0.1))
				//obj/item/weapon/gun/projectile/automatic/wirbelwind = 0.1))

/obj/random/gun_combat/low_chance
	name = "low chance assault weapon"
	icon_state = "gun-green-low"
	spawn_nothing_percentage = 80

/obj/random/gun_fancy
	name = "random fancy gun"
	icon_state = "gun-blue"
	spawn_nothing_percentage = 60

/obj/random/gun_fancy/item_to_spawn()
	return pickweight(list(/obj/item/weapon/gun/projectile/automatic/wirbelwind = 3,\
				//obj/item/weapon/gun/projectile/automatic/ostwind = 3,
				//obj/item/weapon/gun/projectile/automatic/omnirifle/omnicarbine/rds = 3,
				//obj/item/weapon/gun/projectile/automatic/omnirifle/fancy = 1,
				/obj/item/weapon/gun/projectile/ladon = 1,\
				/obj/item/weapon/gun/projectile/lamia/akurra = 1,\
				/obj/item/weapon/gun/projectile/basilisk = 2,\
				/obj/item/weapon/gun/projectile/revolver/mateba = 1,\
				/obj/item/weapon/gun/projectile/silenced = 2,\
				/obj/item/weapon/gun/projectile/revolver/mistral = 2,\
				/obj/item/weapon/gun/projectile/lamia/socom = 0.5,\
				/obj/item/weapon/gun/projectile/colt/NM_colt = 2,\
				/obj/item/weapon/gun/projectile/colt/ten = 2,\
				/obj/item/weapon/gun/projectile/colt/ten/dark = 1,\
				/obj/item/weapon/gun/projectile/automatic/nordwind/strelki = 0.3, \
				/obj/item/weapon/gun/projectile/boltgun/lever = 1, \
				/obj/item/weapon/gun/projectile/automatic/greasegun = 1.5, \
				//obj/item/weapon/gun/projectile/automatic/lmg/saw = 1,
				/obj/item/weapon/gun/projectile/lamia/scoped = 1,\
				/obj/item/weapon/gun/projectile/lamia/scoped/dark = 1,\
				/obj/item/weapon/gun/projectile/revolver/deckard = 0.4,\
				//obj/item/weapon/gun/projectile/automatic/nordwind = 2,
				/obj/item/weapon/gun/projectile/boltgun/scout = 0.5))
				//obj/item/weapon/gun/projectile/automatic/c20r = 2))

/obj/random/gun_fancy/low_chance
	name = "low chance fancy gun"
	icon_state = "gun-blue-low"
	spawn_nothing_percentage = 80

/obj/random/gun_energy_cheap
	name = "random cheap energy weapon"
	icon_state = "gun-blue"
	spawn_nothing_percentage = 60

/obj/random/gun_energy_cheap/item_to_spawn()
	return pickweight(list(/obj/item/weapon/gun/energy/gun/martin = 2,\
				/obj/item/weapon/gun/energy/ntpistol = 2,\
				/obj/item/weapon/gun/energy/gun = 2,\
				/obj/item/weapon/gun/energy/retro = 1))

/obj/random/gun_energy_cheap/low_chance
	name = "low chance random cheap energy weapon"
	icon_state = "gun-blue-low"
	spawn_nothing_percentage = 80


/obj/random/gun_shotgun
	name = "random shotgun"
	icon_state = "gun-red"
	spawn_nothing_percentage = 60

/obj/random/gun_shotgun/item_to_spawn()
	return pickweight(list(
				/obj/item/weapon/gun/projectile/shotgun/pump = 1,\
				/obj/item/weapon/gun/projectile/shotgun/pump/sawn = 2,\
				/obj/item/weapon/gun/projectile/shotgun/pump/obrez = 2,\
				//obj/item/weapon/gun/projectile/shotgun/bull = 2,
				//obj/item/weapon/gun/projectile/shotgun/doublebarrel = 2,
				/obj/item/weapon/gun/projectile/shotgun/doublebarrel/sawn = 2,\
				//obj/item/weapon/gun/projectile/shotgun/pump/combat = 1,
				/obj/item/weapon/gun/projectile/shotgun/pump/combat/sawn = 1,\
				/obj/item/weapon/gun/projectile/shotgun/pug = 0.1,\
				/obj/item/weapon/gun/projectile/revolver/sixshot = 0.7, \
				/obj/item/weapon/gun/projectile/shotgun/pump/gladstone/sawn = 0.5))
				//obj/item/weapon/gun/projectile/shotgun/pump/gladstone = 1))

/obj/random/gun_shotgun/low_chance
	name = "low chance random shotgun"
	icon_state = "gun-red-low"
	spawn_nothing_percentage = 80


//Dungeon based random spawners (use these only in dungeons, not maint)
/obj/random/dungeon_gun_ballistic
	name = "random special ballistic gun"
	icon_state = "gun-red"

/obj/random/dungeon_gun_ballistic/item_to_spawn()
	return pickweight(list(/obj/item/weapon/gun/projectile/automatic/pulse_rifle = 2,
				/obj/item/weapon/gun/projectile/automatic/sbaw = 3,
				/obj/item/weapon/gun/projectile/automatic/chaingun = 2,
				/obj/item/weapon/gun/projectile/automatic/lmg/pk = 3,
				/obj/item/weapon/gun/projectile/automatic/dp = 1,
				/obj/item/weapon/gun/projectile/automatic/mac/croon = 1,
				/obj/item/weapon/gun/projectile/lamia/scoped/dark = 3,
				/obj/item/weapon/gun/projectile/shotgun/pump/combat = 3,
				/obj/item/weapon/gun/projectile/shotgun/pug = 3,
				/obj/item/weapon/gun/projectile/gyropistol = 1,
				/obj/item/weapon/gun/projectile/automatic/sts/hrifle = 2,
				/obj/item/weapon/gun/projectile/automatic/c20r = 3,
				/obj/item/weapon/gun/projectile/basilisk = 3))

/obj/random/dungeon_gun_ballistic/low_chance
	name = "low chance random special ballistic gun"
	icon_state = "gun-red-low"
	spawn_nothing_percentage = 80

/obj/random/dungeon_gun_energy
	name = "random special energy gun"
	icon_state = "gun-red"

/obj/random/dungeon_gun_energy/item_to_spawn()
	return pickweight(list(/obj/item/weapon/gun/energy/mindflayer = 2,
				/obj/item/weapon/gun/energy/xray = 2,
				/obj/item/weapon/gun/energy/sniperrifle = 2,
				/obj/item/weapon/gun/energy/laser/railgun = 1,
				/obj/item/weapon/gun/energy/laser/railgun/pistol = 1,
				/obj/item/weapon/gun/energy/plasma/auretian = 1,
				/obj/item/weapon/gun/energy/centurio = 2,
				/obj/item/weapon/gun/energy/gun/nuclear = 2,
				/obj/item/weapon/gun/energy/plasma/destroyer = 1))

/obj/random/dungeon_gun_energy/low_chance
	name = "low chance random special energy gun"
	icon_state = "gun-red-low"
	spawn_nothing_percentage = 80


//Gun Mod Spawners
/obj/random/dungeon_gun_mods
	name = "random gun mod"
	icon_state = "gun-red"
/obj/random/dungeon_gun_mods/item_to_spawn()
	return pickweight(list(/obj/item/weapon/gun_upgrade/muzzle/silencer = 1,
				/obj/item/weapon/gun_upgrade/barrel/forged = 1,
				/obj/item/weapon/gun_upgrade/barrel/mag_accel = 1,
				/obj/item/weapon/gun_upgrade/barrel/overheat = 1,
				/obj/item/weapon/gun_upgrade/mechanism/bikehorn = 0.1,
				/obj/item/weapon/gun_upgrade/barrel/excruciator = 1,
				/obj/item/weapon/gun_upgrade/trigger/dangerzone = 1,
				/obj/item/weapon/gun_upgrade/trigger/cop_block = 0.5,
				/obj/item/weapon/gun_upgrade/mechanism/overshooter = 1,
				/obj/item/weapon/gun_upgrade/mechanism/weintraub = 1,
				/obj/item/weapon/gun_upgrade/mechanism/reverse_loader = 0.5,
				/obj/item/weapon/gun_upgrade/mechanism/battery_shunt = 1,
				/obj/item/weapon/gun_upgrade/mechanism/overdrive = 1,
				/obj/item/weapon/gun_upgrade/trigger/honker = 0.1,
				/obj/item/weapon/gun_upgrade/barrel/toxin_coater = 1,
				/obj/item/weapon/gun_upgrade/barrel/gauss = 1,
				/obj/item/weapon/gun_upgrade/trigger/boom = 0.5,
				/obj/item/weapon/gun_upgrade/scope/watchman = 0.7,
				/obj/item/weapon/gun_upgrade/scope/killer = 0.7,
				/obj/item/weapon/gun_upgrade/mechanism/greyson_master_catalyst = 0.01))

/obj/random/dungeon_gun_mods/low_chance
	name = "low chance random gun  mod"
	icon_state = "gun-red-low"
	spawn_nothing_percentage = 80

//Armor Mod Spawners
/obj/random/dungeon_armor_mods
	name = "random armor mod"
	icon_state = "gun-red"
/obj/random/dungeon_armor_mods/item_to_spawn()
	return pickweight(list(/obj/item/weapon/tool_upgrade/armor/bomb = 1,
				/obj/item/weapon/tool_upgrade/armor/melee = 1,
				/obj/item/weapon/tool_upgrade/armor/bullet = 1,
				/obj/item/weapon/tool_upgrade/armor/energy = 1))

/obj/random/dungeon_armor_mods/low_chance
	name = "low chance random armor mod"
	icon_state = "gun-red-low"
	spawn_nothing_percentage = 80
