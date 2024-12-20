/obj/random/gun_cheap
	name = "random cheap gun"
	icon_state = "gun-grey"
	spawn_nothing_percentage = 10

/obj/random/gun_cheap/item_to_spawn()
	return pickweight(list(
				/obj/item/part/gun/frame/boltgun = 0.5,
				/obj/item/part/gun/frame/roe = 0.5,
				/obj/item/part/gun/frame/colt = 0.5,
				/obj/item/part/gun/frame/olivaw = 0.5,
				/obj/item/part/gun/frame/mk58 = 0.5,
				/obj/item/part/gun/frame/grizzly = 0.5,
				/obj/item/part/gun/frame/doublebarrel = 0.5,
				/obj/item/part/gun/frame/kalash = 0.5,
				/obj/item/part/gun/frame/havelock = 0.5,
				/obj/item/part/gun/frame/sixshot = 0.5,
				/obj/item/part/gun/frame/luger = 0.5,
				/obj/random/gun_parts/frames = 3,

				/obj/item/gun/projectile/revolver/rev10/rex10 = 2,\
				/obj/item/gun/projectile/revolver/detective = 3,\
				/obj/item/gun/energy/shrapnel = 3,\
				/obj/item/gun/energy/lasersmg = 0.5,\
				/obj/item/ammo_kit = 3,\
				/obj/item/gun/projectile/giskard = 1,\
				/obj/item/gun/projectile/automatic/luger = 0.5,\
				/obj/item/gun/projectile/ladon/sa = 0.5,  \
				/obj/item/gun/projectile/boltgun/sa = 2,\
				/obj/item/gun/projectile/shotgun/pump = 0.1,\
				/obj/item/gun/projectile/revolver/sixshot/sawn = 0.5,\
				/obj/item/gun/projectile/shotgun/pump/sawn = 0.5,\
				/obj/item/gun/projectile/shotgun/pump/obrez = 1.5,\
				/obj/item/gun/projectile/boltgun/sawn/light = 0.5,\
				/obj/item/gun/projectile/boltgun/sawn/true = 0.5,\
				/obj/item/gun/projectile/boltgun/sawn/sa = 1,\
				/obj/item/gun/projectile/automatic/omnirifle/solmarine/shotgunless = 0.1, \
				/obj/item/gun/projectile/olivaw = 1.5,
				/obj/item/gun_upgrade/barrel/forged = 1))

/obj/random/gun_cheap/low_chance
	name = "low chance random cheap gun"
	icon_state = "gun-grey-low"
	spawn_nothing_percentage = 80


/obj/random/gun_normal
	name = "random normal gun"
	icon_state = "gun-green"
	spawn_nothing_percentage = 10

/obj/random/gun_normal/always_spawn
	name = "random always spawn normal gun"
	spawn_nothing_percentage = 0

/obj/random/gun_normal/item_to_spawn()
	return pickweight(list(/obj/item/part/gun/frame/grizzly = 0.5,
				/obj/item/part/gun/frame/sixshot = 0.5,
				/obj/item/part/gun/frame/regulator = 0.5,
				/obj/item/part/gun/frame/gladstone = 0.5,
				/obj/item/part/gun/frame/grease = 0.5,
				/obj/item/part/gun/frame/basilisk = 0.5,
				/obj/item/part/gun/frame/sts = 0.5,
				/obj/item/part/gun/frame/minotaur = 0.5,
				/obj/item/part/gun/frame/minstral = 0.5,
				/obj/item/part/gun/frame/armstrong = 0.5,
				/obj/item/part/gun/frame/strelki = 0.5,
				/obj/item/part/gun/frame/ak47 = 0.5,
				/obj/item/part/gun/frame/pug = 0.5,

				/obj/item/gun/projectile/lamia = 0.1,\
				/obj/item/gun/projectile/automatic/texan = 0.5,\
				/obj/item/gun/projectile/lamia/gemini = 0.09,\
				/obj/item/gun/projectile/revolver/rev10/rex10 = 0.5,\
				/obj/item/gun/projectile/revolver/rev10 = 0.3,\
				/obj/item/gun/projectile/basilisk = 0.5,\
				/obj/item/gun/projectile/ladon = 0.5,\
				/obj/item/gun/projectile/ladon/sa = 1.0,\
				/obj/item/gun/projectile/ladon/hs = 0.5,\
				/obj/item/gun/projectile/automatic/nordwind/strelki = 0.3,\
				/obj/item/gun/projectile/revolver/sixshot = 1,\
				/obj/item/gun/projectile/boltgun/lever = 1.5,\
				/obj/item/gun/projectile/automatic/greasegun = 0.1,\
				/obj/item/gun/projectile/shotgun/pump/gladstone = 0.5,\
				/obj/item/gun/projectile/colt = 2,\
				/obj/item/gun/projectile/revolver = 2,\
				/obj/item/gun/projectile/boltgun = 0.5,\
				/obj/item/gun/projectile/boltgun/sa = 2,\
				/obj/item/ammo_kit = 2,
				/obj/item/gun_upgrade/trigger/dangerzone = 1,
				/obj/item/gun_upgrade/mechanism/overshooter = 1))

/obj/random/gun_normal/low_chance
	name = "low chance random normal gun"
	icon_state = "gun-green-low"
	spawn_nothing_percentage = 80


/obj/random/gun_combat
	name = "random assault weapon"
	icon_state = "gun-green"
	spawn_nothing_percentage = 10

/obj/random/gun_combat/item_to_spawn()
	return pickweight(list(/obj/item/part/gun/frame/grease = 0.5,
				/obj/item/part/gun/frame/makarov = 0.5,
				/obj/item/part/gun/frame/hornet = 0.5,
				/obj/item/part/gun/frame/regulator = 0.5,
				/obj/item/part/gun/frame/gladstone = 0.5,
				/obj/item/part/gun/frame/pug = 0.5,
				/obj/item/part/gun/frame/saiga = 0.5,
				/obj/item/part/gun/frame/strelki = 0.5,
				/obj/item/part/gun/frame/thompson = 0.5,
				/obj/item/part/gun/frame/ak47 = 0.5,
				/obj/item/part/gun/frame/sts = 0.5,
				/obj/item/gun/projectile/automatic/sts/rifle/heavy/sawn = 1,\
				/obj/item/part/gun/frame/solmarine = 0.5,
				/obj/random/gun_parts/frames = 1,

				/obj/item/gun/projectile/automatic/greasegun = 1,\
				/obj/item/gun/projectile/automatic/mac = 1,\
				/obj/item/gun/projectile/automatic/mac/croon = 0.7,\
				/obj/item/gun/projectile/automatic/duty = 1,\
				/obj/item/ammo_kit = 0.8,
				/obj/item/gun/projectile/automatic/sts/rifle/sawn = 1,\
				/obj/item/gun/projectile/automatic/omnirifle/solmarine = 1,\
				/obj/item/gun/projectile/automatic/thompson = 0.5,\
				/obj/item/gun/projectile/automatic/bren = 0.5,\
				/obj/item/gun/projectile/automatic/ak47/sa/sawn = 1,\
				/obj/item/gun/projectile/makarov = 1,\
				/obj/item/gun/projectile/shotgun/pug = 0.5,
				/obj/item/gun/projectile/revolver/hornet = 0.5))

/obj/random/gun_combat/low_chance
	name = "low chance assault weapon"
	icon_state = "gun-green-low"
	spawn_nothing_percentage = 80

/obj/random/gun_fancy
	name = "random fancy gun"
	icon_state = "gun-blue"
	spawn_nothing_percentage = 30

/obj/random/gun_fancy/alawys_spawn
	name = "random always spawn fancy gun"

/obj/random/gun_fancy/item_to_spawn()
	return pickweight(list(/obj/item/part/gun/frame/makarov = 0.5,
				/obj/item/part/gun/frame/mamba = 0.5,
				/obj/item/part/gun/frame/lamia = 0.5,
				/obj/item/part/gun/frame/minstral = 0.5,
				/obj/item/part/gun/frame/tacticool = 0.5,
				/obj/item/part/gun/frame/deckard = 0.5,
				/obj/item/part/gun/frame/hornet = 0.5,
				/obj/item/part/gun/frame/scout = 0.5,
				/obj/item/part/gun/frame/nord = 0.5,
				/obj/item/part/gun/frame/solmarine = 0.5,
				/obj/random/gun_parts/frames = 2,

				/obj/item/gun/projectile/ladon = 1,\
				/obj/item/gun/projectile/revolver/lemant = 1,\
				/obj/item/gun/projectile/basilisk = 2,\
				/obj/item/gun/projectile/automatic/survivalrifle = 1,\
				/obj/item/gun/projectile/revolver/tacticool_revolver = 1,\
				/obj/item/gun/projectile/silenced = 2,\
				/obj/item/gun/projectile/revolver/mistral = 2,\
				/obj/item/gun/projectile/colt/ten = 2,\
				/obj/item/gun/projectile/automatic/nordwind/strelki = 0.3, \
				/obj/item/gun/projectile/boltgun/lever = 1, \
				/obj/item/gun/projectile/lamia/scoped = 1,\
				/obj/item/gun/projectile/revolver/deckard = 0.4,\
				/obj/item/gun/projectile/makarov = 1.5,\
				/obj/item/gun/energy/lasercannon = 0.5,\
				/obj/item/gun/projectile/boltgun/scout = 0.5,\
				/obj/item/gun/projectile/revolver/rev10/mateba = 0.5))

/obj/random/gun_fancy/low_chance
	name = "low chance fancy gun"
	icon_state = "gun-blue-low"
	spawn_nothing_percentage = 80

/obj/random/gun_energy_cheap
	name = "random cheap energy weapon"
	icon_state = "gun-blue"
	spawn_nothing_percentage = 30

/obj/random/gun_energy_cheap/item_to_spawn()
	return pickweight(list(/obj/item/gun/energy/gun/martin = 2,\
				/obj/item/gun/energy/ntpistol = 2,\
				/obj/item/gun/energy/gun = 2,\
				/obj/item/gun/energy/cog = 1,\
				/obj/item/gun/energy/lasercore = 0.5,\
				/obj/item/gun/energy/firestorm = 0.5,\
				/obj/item/gun/energy/centauri = 0.1))

/obj/random/gun_energy_cheap/low_chance
	name = "low chance random cheap energy weapon"
	icon_state = "gun-blue-low"
	spawn_nothing_percentage = 80


/obj/random/gun_handmade
	name = "random handmade gun weapon"
	icon_state = "gun-black"
	spawn_nothing_percentage = 30

/obj/random/gun_handmade/item_to_spawn()
	return pickweight(list(
				/obj/item/gun/projectile/revolver/handmade = 1,\
				/obj/item/gun/projectile/boltgun/handmade = 1,\
				/obj/item/gun/projectile/shotgun/slidebarrel = 1,\
				/obj/item/gun/energy/laser/makeshift = 1,\
				/obj/item/gun/energy/lasersmg = 1,\
				/obj/item/gun/projectile/automatic/ak47/makeshift = 1,\
				/obj/item/gun/projectile/automatic/luty = 1))

/obj/random/gun_handmade/willspawn
	name = "will spawn random handmade gun weapon"
	spawn_nothing_percentage = 0
	icon_state = "gun-black-hight"

/obj/random/gun_handmade/low_chance
	name = "low chance random handmade gun weapon"
	icon_state = "gun-black-low"
	spawn_nothing_percentage = 80

/obj/random/gun_shotgun
	name = "random shotgun"
	icon_state = "gun-red"
	spawn_nothing_percentage = 30

/obj/random/gun_shotgun/item_to_spawn()
	return pickweight(list(/obj/item/part/gun/frame/sixshot = 0.5,
				/obj/item/part/gun/frame/grizzly = 0.5,
				/obj/item/part/gun/frame/regulator = 0.5,
				/obj/item/part/gun/frame/gladstone = 0.5,
				/obj/item/part/gun/frame/bull = 0.5,
				/obj/item/part/gun/frame/pug = 0.5,

				/obj/item/gun/projectile/shotgun/pump = 1,\
				/obj/item/gun/projectile/shotgun/pump/sawn = 2,\
				/obj/item/gun/projectile/shotgun/pump/obrez = 2,\
				/obj/item/gun/projectile/shotgun/pump/bull = 0.3,\
				/obj/item/gun/projectile/shotgun/doublebarrel/sawn = 2,\
				/obj/item/gun/projectile/shotgun/pump/combat/sawn = 1,\
				/obj/item/gun/projectile/shotgun/pump/gladstone/sawn = 1,\
				/obj/item/gun/projectile/shotgun/pug = 0.3,\
				/obj/item/gun/projectile/revolver/sixshot = 0.7))

/obj/random/gun_shotgun/low_chance
	name = "low chance random shotgun"
	icon_state = "gun-red-low"
	spawn_nothing_percentage = 80


//Dungeon based random spawners (use these only in dungeons, not maint)
/obj/random/dungeon_gun_ballistic
	name = "random special ballistic gun"
	icon_state = "gun-red"

/obj/random/dungeon_gun_ballistic/item_to_spawn()
	return pickweight(list(/obj/item/part/gun/frame/dallas = 0.5,
				/obj/item/part/gun/frame/dp27 = 0.5,
				/obj/item/part/gun/frame/tk = 0.5,
				/obj/item/part/gun/frame/pk = 0.5,
				/obj/item/part/gun/frame/bastard = 0.5,
				/obj/item/part/gun/frame/regulator = 0.5,
				/obj/item/part/gun/frame/pug = 0.5,
				/obj/item/part/gun/frame/saiga = 0.5,
				/obj/item/part/gun/frame/solmarine = 0.5,
				/obj/item/gun/projectile/automatic/sts/rifle/heavy = 2,
				/obj/item/part/gun/frame/c20r = 0.5,
				/obj/item/part/gun/frame/omni = 0.5,
				/obj/item/part/gun/frame/ak47 = 0.5,
				/obj/random/gun_parts/frames/better_spawns = 2,

				/obj/item/gun/projectile/automatic/pulse_rifle = 2,
				/obj/item/gun/projectile/shotgun/sbaw = 0.7, // Too good, needs to be rare.
				/obj/item/gun/projectile/automatic/chaingun = 1,
				/obj/item/gun/projectile/automatic/lmg/pk = 3,
				/obj/item/gun/projectile/automatic/dp = 2,
				/obj/item/gun/projectile/automatic/bren = 1.5,
				/obj/item/gun/projectile/automatic/bastard = 2,
				/obj/item/gun/projectile/automatic/sts/rifle/blackshield = 2,
				/obj/item/gun/projectile/automatic/ak47/sa/tac = 1,
				/obj/item/gun/projectile/automatic/pulse_rifle = 0.1,
				/obj/item/gun/projectile/shotgun/pump/combat = 3,
				/obj/item/gun/projectile/shotgun/pug = 2,
				///obj/item/gun/projectile/gyropistol = 1,
				/obj/item/gun/projectile/automatic/omnirifle/solmarine = 2,
				/obj/item/gun/projectile/automatic/omnirifle = 1,
				/obj/item/gun/projectile/automatic/c20r = 3,
				/obj/item/gun/projectile/revolver/deckard = 2))

/obj/random/dungeon_gun_ballistic/low_chance
	name = "low chance random special ballistic gun"
	icon_state = "gun-red-low"
	spawn_nothing_percentage = 80

/obj/random/dungeon_gun_energy
	name = "random special energy gun"
	icon_state = "gun-red"

/obj/random/dungeon_gun_energy/item_to_spawn()
	return pickweight(list(
				/obj/item/gun/energy/xray = 2,
				/obj/item/gun/energy/sniperrifle = 2,
				/obj/item/gun/energy/laser/railgun/railrifle = 1,
				/obj/item/gun/energy/laser/railgun/pistol = 1,
				/obj/item/gun/energy/plasma/auretian = 1,
				/obj/item/gun/energy/centurio = 2,
				/obj/item/gun/energy/centauri = 1,
				/obj/item/gun/energy/gun/nuclear = 2,
				/obj/item/gun/energy/plasma/destroyer = 1,
				/obj/item/gun/energy/sunrise = 1))

/obj/random/dungeon_gun_energy/low_chance
	name = "low chance random special energy gun"
	icon_state = "gun-red-low"
	spawn_nothing_percentage = 80


//Gun Mod Spawners
/obj/random/dungeon_gun_mods
	name = "random gun mod"
	icon_state = "gun-red"

/obj/random/dungeon_gun_mods/item_to_spawn()
	return pickweight(list(/obj/item/gun_upgrade/muzzle/silencer = 1,
				/obj/item/gun_upgrade/muzzle/pain_maker = 0.3,
				/obj/item/gun_upgrade/barrel/forged = 1,
				/obj/item/gun_upgrade/barrel/mag_accel = 1,
				/obj/item/gun_upgrade/barrel/overheat = 1,
				/obj/item/gun_upgrade/mechanism/bikehorn = 0.1,
				/obj/item/gun_upgrade/barrel/excruciator = 1,
				/obj/item/gun_upgrade/trigger/dangerzone = 1,
				/obj/item/gun_upgrade/trigger/cop_block = 0.5,
				/obj/item/gun_upgrade/magwell/auto_eject = 0.5,
				/obj/item/gun_upgrade/magwell/auto_eject/no_removal = 0.5,
				/obj/item/gun_upgrade/mechanism/overshooter = 1,
				/obj/item/gun_upgrade/mechanism/weintraub = 1,
				/obj/item/gun_upgrade/mechanism/reverse_loader = 0.5,
				/obj/item/gun_upgrade/mechanism/battery_shunt = 1,
				/obj/item/gun_upgrade/mechanism/overdrive = 1,
				/obj/item/gun_upgrade/trigger/honker = 0.1,
				/obj/item/gun_upgrade/barrel/toxin_coater = 1,
				/obj/item/gun_upgrade/barrel/gauss = 1,
				/obj/item/gun_upgrade/trigger/boom = 0.5,
				/obj/item/gun_upgrade/scope/watchman = 0.7,
				/obj/item/gun_upgrade/scope/killer = 0.7,
				/obj/item/gun_upgrade/underbarrel/bipod = 1,
				/obj/item/gun_upgrade/mechanism/greyson_master_catalyst = 0.01))

/obj/random/dungeon_gun_mods/low_chance
	name = "low chance random gun mod"
	icon_state = "gun-red-low"
	spawn_nothing_percentage = 80

/obj/random/dungeon_gun_mods/voidwolf
	name = "random voidwolf good only gun mod"
	icon_state = "gun-red-low"
	spawn_nothing_percentage = 0

/obj/random/dungeon_gun_mods/voidwolf/item_to_spawn()
	return pickweight(list( // i hate pickweight but fine
		/obj/item/gun_upgrade/barrel/gauss = 1,
		/obj/item/gun_upgrade/scope/killer = 1,
		/obj/item/gun_upgrade/trigger/dangerzone = 1 //only good mods
	))

//Armor Mod Spawners
/obj/random/dungeon_armor_mods
	name = "random armor mod"
	icon_state = "gun-red"
/obj/random/dungeon_armor_mods/item_to_spawn()
	return pickweight(list(/obj/item/tool_upgrade/armor/bomb = 1,
				/obj/item/tool_upgrade/armor/melee = 1,
				/obj/item/tool_upgrade/armor/bullet = 1,
				/obj/item/tool_upgrade/armor/energy = 1))

/obj/random/dungeon_armor_mods/low_chance
	name = "low chance random armor mod"
	icon_state = "gun-red-low"
	spawn_nothing_percentage = 80

//Gun parts spawners - Wasn't sure where tf to put these, they're here for orgnizations sake.
/obj/random/gun_parts
	name = "random gun part"
	icon_state = "gun-black"

/obj/random/gun_parts/item_to_spawn()
	return pickweight(list(/obj/item/part/gun/barrel/pistol/steel = 3,
	/obj/item/part/gun/barrel/magnum/steel = 3,
	/obj/item/part/gun/barrel/shotgun/steel = 1,
	/obj/item/part/gun/barrel/srifle/steel = 1,
	/obj/item/part/gun/barrel/lrifle/steel = 1,
	/obj/item/part/gun/barrel/clrifle/steel = 0.5,
	/obj/item/part/gun/barrel/kurtz/steel = 0.5,
	/obj/item/part/gun/barrel/hrifle/steel = 0.1,
	/obj/item/part/gun/barrel/pistol = 5,
	/obj/item/part/gun/barrel/magnum = 5,
	/obj/item/part/gun/barrel/kurtz = 1.5,
	/obj/item/part/gun/barrel/srifle = 4,
	/obj/item/part/gun/barrel/clrifle = 3,
	/obj/item/part/gun/barrel/lrifle = 4,
	/obj/item/part/gun/barrel/shotgun = 4,
	/obj/item/part/gun/barrel/hrifle = 1,
	/obj/item/part/gun/grip/wood = 5,
	/obj/item/part/gun/grip/black = 3,
	/obj/item/part/gun/grip/serb = 2,
	/obj/item/part/gun/grip/rubber = 1,
	/obj/item/part/gun/grip/excel = 0.5,
	/obj/item/part/gun/mechanism/pistol/steel = 2.5,
	/obj/item/part/gun/mechanism/revolver/steel = 2,
	/obj/item/part/gun/mechanism/boltgun = 4,
	/obj/item/part/gun/mechanism/shotgun/steel = 2,
	/obj/item/part/gun/mechanism/smg/steel = 1,
	/obj/item/part/gun/mechanism/autorifle/steel = 0.1,
	/obj/item/part/gun/mechanism/pistol = 4,
	/obj/item/part/gun/mechanism/revolver = 4,
	/obj/item/part/gun/mechanism/shotgun = 3,
	/obj/item/part/gun/mechanism/smg = 3,
	/obj/item/part/gun/mechanism/autorifle = 0.5,
	/obj/item/part/gun/mechanism/machinegun = 2,
	/obj/random/gun_parts/frames = 2,
	/obj/random/gun_parts/high_end = 1
	))

/obj/random/gun_parts/low
	name = "low chance random gun part"
	icon_state = "gun-black-low"
	spawn_nothing_percentage = 50

/obj/random/gun_parts/high_end
	name = "high-end random gun part"

/obj/random/gun_parts/high_end/item_to_spawn()
	return pickweight(list(/obj/item/part/gun/mechanism/machinegun = 1,
	/obj/item/part/gun/mechanism/autorifle = 3,
	/obj/item/part/gun/mechanism/smg = 2,
	/obj/item/part/gun/barrel/hrifle = 1,
	/obj/item/part/gun/barrel/lrifle = 2,
	/obj/item/part/gun/barrel/clrifle = 1,
	/obj/item/part/gun/barrel/srifle = 3,
	/obj/item/part/gun/barrel/kurtz = 2,
	/obj/item/part/gun/grip/rubber = 2,
	/obj/item/part/gun/grip/serb = 3,
	/obj/item/part/gun/barrel/antim = 0.3,
	/obj/random/gun_parts/frames = 3))


/obj/random/gun_parts/frames
	name = "low chance random gun part"
	icon_state = "gun-black-low"
	spawn_nothing_percentage = 30

/obj/random/gun_parts/frames/item_to_spawn()
	return pickweight(list(/obj/item/part/gun/frame/omni = 3,
	//obj/item/part/gun/frame/c20r/sci = 1,
	//obj/item/part/gun/frame/c20r = 1,
	//obj/item/part/gun/frame/dp27 = 1,
	/obj/item/part/gun/frame/drozd = 4,
	/obj/item/part/gun/frame/judge = 2,
	/obj/item/part/gun/frame/grease = 5,
	/obj/item/part/gun/frame/luger = 5,
	//obj/item/part/gun/frame/pk = 1,
	//obj/item/part/gun/frame/tk = 1,
	/obj/item/part/gun/frame/luty = 6,
	/obj/item/part/gun/frame/mamba = 5,
	//obj/item/part/gun/frame/maxim = 1,
	/obj/item/part/gun/frame/motherfucker = 3,
	//obj/item/part/gun/frame/nord = 1,
	/obj/item/part/gun/frame/strelki = 2,
	/obj/item/part/gun/frame/ppsh = 1,
	//obj/item/part/gun/frame/dallas = 1,
	/obj/item/part/gun/frame/solmarine = 8,
	//obj/item/part/gun/frame/specop = 1,
	/obj/item/part/gun/frame/sts = 7,
	/obj/item/part/gun/frame/thompson = 5,
	//obj/item/part/gun/frame/vintorez = 1,
	//obj/item/part/gun/frame/heavysniper = 1,
	/obj/item/part/gun/frame/armstrong = 6,
	//obj/item/part/gun/frame/homemadebolt = 1,
	/obj/item/part/gun/frame/roe = 8,
	//obj/item/part/gun/frame/scout = 1,
	/obj/item/part/gun/frame/basilisk = 4,
	/obj/item/part/gun/frame/mk58= 8,
	/obj/item/part/gun/frame/makarov = 4,
	/obj/item/part/gun/frame/colt = 7,
	/obj/item/part/gun/frame/freedom = 2,
	/obj/item/part/gun/frame/giskard = 4,
	/obj/item/part/gun/frame/glock = 3,
	/obj/item/part/gun/frame/judiciary = 2,
	//obj/item/part/gun/frame/lamia = 1,
	/obj/item/part/gun/frame/olivaw = 5,
	//obj/item/part/gun/frame/deckard = 1,
	/obj/item/part/gun/frame/havelock = 6,
	//obj/item/part/gun/frame/revolver_handmade = 1,
	//obj/item/part/gun/frame/hornet = 1,
	/obj/item/part/gun/frame/minstral = 1,
	/obj/item/part/gun/frame/minotaur = 4,
	/obj/item/part/gun/frame/sixshot = 1,
	/obj/item/part/gun/frame/tacticool = 4,
	//obj/item/part/gun/frame/wayfarer = 1,
	//obj/item/part/gun/frame/bull = 1,
	/obj/item/part/gun/frame/regulator = 2,
	/obj/item/part/gun/frame/doublebarrel = 6,
	//obj/item/part/gun/frame/pug = 1,
	/obj/item/part/gun/frame/grizzly = 3,
	/obj/random/gun_parts/frames/better_spawns = 1))

/obj/random/gun_parts/frames/better_spawns
	name = "better random gun part"
	spawn_nothing_percentage = 30

/obj/random/gun_parts/frames/better_spawns/item_to_spawn()
	return pickweight(list(/obj/item/part/gun/frame/omni = 5,
	//obj/item/part/gun/frame/c20r/sci = 1,
	/obj/item/part/gun/frame/c20r = 3,
	/obj/item/part/gun/frame/dp27 = 2,
	/obj/item/part/gun/frame/pk = 2,
	/obj/item/part/gun/frame/tk = 2,
	/obj/item/part/gun/frame/mamba = 3,
	/obj/item/part/gun/frame/maxim = 1,
	//obj/item/part/gun/frame/motherfucker = 1,
	/obj/item/part/gun/frame/nord = 2,
	/obj/item/part/gun/frame/strelki = 1,
	/obj/item/part/gun/frame/ppsh = 6,
	/obj/item/part/gun/frame/dallas = 2,
	/obj/item/part/gun/frame/solmarine = 8,
	/obj/item/part/gun/frame/specop = 4,
	/obj/item/part/gun/frame/sts = 8,
	/obj/item/part/gun/frame/thompson = 7,
	/obj/item/part/gun/frame/vintorez = 1,
	/obj/item/part/gun/frame/heavysniper = 1,
	/obj/item/part/gun/frame/armstrong = 5,
	//obj/item/part/gun/frame/homemadebolt = 1,
	/obj/item/part/gun/frame/scout = 4,
	/obj/item/part/gun/frame/basilisk = 5,
	/obj/item/part/gun/frame/amnesty = 3,
	/obj/item/part/gun/frame/opshot = 2,
	/obj/item/part/gun/frame/makarov = 6,
	/obj/item/part/gun/frame/glock = 3,
	/obj/item/part/gun/frame/judiciary = 3,
	/obj/item/part/gun/frame/lamia = 2,
	/obj/item/part/gun/frame/deckard = 4,
	//obj/item/part/gun/frame/revolver_handmade = 1,
	/obj/item/part/gun/frame/hornet = 2,
	/obj/item/part/gun/frame/minstral = 4,
	/obj/item/part/gun/frame/minotaur = 6,
	/obj/item/part/gun/frame/tacticool = 8,
	/obj/item/part/gun/frame/mateba = 1,
	/obj/item/part/gun/frame/wayfarer = 1,
	/obj/item/part/gun/frame/bull = 5,
	/obj/item/part/gun/frame/pug = 7
	))

