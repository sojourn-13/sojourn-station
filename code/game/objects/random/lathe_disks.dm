/obj/random/lathe_disk
	name = "random lathe disk"
	icon_state = "tech-green"

/obj/random/lathe_disk/item_to_spawn() // pickweight is calculated from advanced list = / 2 - 1. If lower than 1 - delete from the list;
	return pickweight(list(
				/obj/item/weapon/computer_hardware/hard_drive/portable/design/misc = 20,
				/obj/item/weapon/computer_hardware/hard_drive/portable/design/components = 10,
				/obj/item/weapon/computer_hardware/hard_drive/portable/design/adv_tools = 4,
				/obj/item/weapon/computer_hardware/hard_drive/portable/design/logistics = 10,
				/obj/item/weapon/computer_hardware/hard_drive/portable/design/circuits = 6,
				/obj/item/weapon/computer_hardware/hard_drive/portable/design/medical = 8,
				/obj/item/weapon/computer_hardware/hard_drive/portable/design/medical/advanced = 1,
				/obj/item/weapon/computer_hardware/hard_drive/portable/design/computer = 8,
				/obj/item/weapon/computer_hardware/hard_drive/portable/design/security = 6,
				/obj/item/weapon/computer_hardware/hard_drive/portable/design/surgery = 1,

				/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/cheap_guns = 3,
				/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/mk58 = 3,
				/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/rex10 = 3.5,
				/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/lemant = 3,
				/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/colt = 3,
				/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/glock = 2.5,
				/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/rafale = 2,

				/obj/item/weapon/computer_hardware/hard_drive/portable/design/blackshield/alemao = 6,
				/obj/item/weapon/computer_hardware/hard_drive/portable/design/blackshield/NM_colt = 2.5,
				/obj/item/weapon/computer_hardware/hard_drive/portable/design/blackshield/strelki = 2,
				/obj/item/weapon/computer_hardware/hard_drive/portable/design/blackshield/zatvor = 4,
				/obj/item/weapon/computer_hardware/hard_drive/portable/design/blackshield/luger = 1,
				/obj/item/weapon/computer_hardware/hard_drive/portable/design/blackshield/basstet = 2,


				/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/armstrong = 3,

				/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/revolver = 2,
				/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/sixshot = 1,

				/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/doublebarrel = 2,
				/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/grizzly = 3,
				/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/regulator = 2,
				/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/gladstone = 2,
				/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/sbaw = 1,
				/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/roe = 2,
				/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/sika = 2,
				/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/nt_counselor = 3,
				/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/stun_revolver = 1,

				/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/firefly = 1,
				/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/straylight = 1,
				/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/wirbelwind = 1,
				/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/texan = 1,
				/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/mac = 1,

				/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/bulldog = 1,
				/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/pitbull = 1,
				/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/boltgun_sa = 4,
				/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/sa_kalashnikov = 1,
				/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/saw = 1,

				/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/counselor = 2,
				/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/spiderrose = 1,
				/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/martin = 3,
				/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/firestorm = 1,
				/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/lasercore = 1,

				/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/themis = 1,
				/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/lightfall = 1,
				/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/halicon = 2,
				/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/ion_pistol = 2,

				/obj/item/weapon/computer_hardware/hard_drive/portable/design/nonlethal_ammo = 6,
				/obj/item/weapon/computer_hardware/hard_drive/portable/design/exotic_ammo = 3,
				/obj/item/weapon/computer_hardware/hard_drive/portable/design/lethal_ammo = 4,
				/obj/item/weapon/computer_hardware/hard_drive/portable/design/ammo_boxes_smallarms = 4,
				/obj/item/weapon/computer_hardware/hard_drive/portable/design/ammo_boxes_rifle = 4,))

/obj/random/lathe_disk/low_chance
	name = "low chance random lathe disk"
	icon_state = "tech-green-low"
	spawn_nothing_percentage = 80




/obj/random/lathe_disk/advanced
	name = "random advanced lathe disk"
	icon_state = "tech-green"

/obj/random/lathe_disk/advanced/item_to_spawn()
	return pickweight(list(
				/obj/item/weapon/computer_hardware/hard_drive/portable/design/adv_tools = 4,
				/obj/item/weapon/computer_hardware/hard_drive/portable/design/medical/advanced = 2,
				/obj/item/weapon/computer_hardware/hard_drive/portable/design/security = 6,

				/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/cheap_guns = 8,
				/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/lemant = 8,
				/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/mk58 = 8,
				/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/colt = 8,
				/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/rafale = 6,
				/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/rex10 = 8,

				/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/revolver = 5,
				/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/revolver_mateba = 2,
				/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/lamia = 1,
				/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/basilisk = 2,
				/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/rev10 = 3,

				/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/doublebarrel = 5,
				/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/grizzly = 8,
				/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/regulator = 6,
				/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/gladstone = 6,
				/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/pug = 3,
				/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/sbaw = 1,

				/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/firefly = 4,
				/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/straylight = 4,
				/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/wirbelwind = 4,
				/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/texan = 4,
				/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/mac = 4,
				/obj/item/weapon/computer_hardware/hard_drive/portable/design/blackshield/greasegun = 2,
				/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/ex_drozd = 2,
				/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/ex_ppsh = 1,

				/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/bulldog = 4,
				/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/sol = 4,
				/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/ostwind = 1,
				/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/pitbull = 4,
				/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/pulse_rifle = 1,
				/obj/item/weapon/computer_hardware/hard_drive/portable/design/blackshield/semyonovich = 2,
				/obj/item/weapon/computer_hardware/hard_drive/portable/design/blackshield/basstet = 3,
				/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/sa_kalashnikov = 4,
				/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/bren = 1,
				/obj/item/weapon/computer_hardware/hard_drive/portable/design/blackshield/dp = 1,
				/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/bastard = 1,

				/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/heavysniper = 1,
				/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/sa_pk = 1,
				/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/protector = 1,
				/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/lenar = 1,
				/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/china = 1.2,

				/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/counselor = 6,
				/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/spiderrose = 4,
				/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/martin = 8,
				/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/firestorm = 3,
				/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/lasercore = 2,
				/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/lasercannon = 2,
				/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/centauri = 1,

				/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/nemesis = 2,
				/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/themis = 4,
				/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/lightfall = 4,
				/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/valkirye = 2,
				/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/halicon = 6,
				/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/ion_pistol = 4,

				/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/dominion = 2,
				/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/purger = 2,
				/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/cassad = 1,

				/obj/item/weapon/computer_hardware/hard_drive/portable/design/nonlethal_ammo = 10,
				/obj/item/weapon/computer_hardware/hard_drive/portable/design/lethal_ammo = 8,
				/obj/item/weapon/computer_hardware/hard_drive/portable/design/ammo_boxes_smallarms = 8,
				/obj/item/weapon/computer_hardware/hard_drive/portable/design/ammo_boxes_rifle = 8,))

/obj/random/lathe_disk/advanced/low_chance
	name = "low chance advanced lathe disk"
	icon_state = "tech-green-low"
	spawn_nothing_percentage = 80

/obj/random/lathe_disk/advanced/onestar
	name = "random onestar lathe disk"
	icon_state = "tech-green"

/obj/random/lathe_disk/advanced/onestar/item_to_spawn()
	return pickweight(list(/obj/item/weapon/computer_hardware/hard_drive/portable/design/onestar/stockparts = 3,
						/obj/item/weapon/computer_hardware/hard_drive/portable/design/onestar/cog = 1,
						/obj/item/weapon/computer_hardware/hard_drive/portable/design/onestar = 1,
						/obj/item/weapon/computer_hardware/hard_drive/portable/design/onestar/armor = 1))

/obj/random/lathe_disk/advanced/excelsior
	name = "random any excelsior lathe disk"
	icon_state = "tech-green"

/obj/random/lathe_disk/advanced/excelsior/item_to_spawn()
	return pickweight(list(/obj/item/weapon/computer_hardware/hard_drive/portable/design/excelsior = 1,
						/obj/item/weapon/computer_hardware/hard_drive/portable/design/excelsior_weapons = 1,
						/obj/item/weapon/computer_hardware/hard_drive/portable/design/ex_parts = 1,
						/obj/item/weapon/computer_hardware/hard_drive/portable/design/ex_cells = 1,
						/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/ex_drozd = 1,
						/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/ex_makarov = 1,
						/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/ex_vintorez = 1,
						/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/ex_boltgun = 1,
						/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/ex_ak = 1,
						/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/ex_ppsh = 1,
						/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/ex_reclaimer = 1
						))


/obj/random/lathe_disk/advanced/excelsior/safe
	name = "random excelsior safe lathe disk"
	icon_state = "tech-green"

/obj/random/lathe_disk/advanced/excelsior/safe/item_to_spawn()
	return pickweight(list(
						/obj/item/weapon/computer_hardware/hard_drive/portable/design/ex_parts = 1,
						/obj/item/weapon/computer_hardware/hard_drive/portable/design/ex_cells = 1,
						/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/ex_drozd = 1,
						/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/ex_makarov = 1,
						/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/ex_vintorez = 1,
						/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/ex_boltgun = 1,
						/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/ex_ak = 1,
						/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/ex_ppsh = 1,
						/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/ex_reclaimer = 1
						))
