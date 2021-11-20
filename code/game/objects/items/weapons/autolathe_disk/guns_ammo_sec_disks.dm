// Disks formated as /designpath = pointcost , if no point cost is specified it defaults to 1.
// To make a design unprotect use -1
// Marshal
/obj/item/computer_hardware/hard_drive/portable/design/security
	disk_name = "Security Miscellaneous Pack"
	icon_state = "ironhammer"
	license = 20
	designs = list(
		/datum/design/autolathe/sec/secflashlight,
		/datum/design/research/item/flash,
		/datum/design/autolathe/sec/handcuffs,
		/datum/design/autolathe/sec/zipties = 0,
		/datum/design/autolathe/sec/electropack,
		/datum/design/autolathe/misc/taperecorder,
		/datum/design/autolathe/tool/tacknife,
		/datum/design/autolathe/tool/combat_shovel,
		/datum/design/autolathe/sec/beartrap,
		/datum/design/autolathe/sec/silencer,
		/datum/design/autolathe/sec/gun_case,
		/datum/design/research/item/light_replacer,
		/datum/design/autolathe/sec/hailer,
		/datum/design/research/item/medical/autopsy_scanner,
		/datum/design/autolathe/gun/cop_mod = 0,
		/datum/design/autolathe/sec/stunbaton = 5, //balance, we can only make 4
		/datum/design/autolathe/sec/auto_eject_mod,
		/datum/design/autolathe/gun/dnalock_mod,
		/datum/design/autolathe/gun/flare_gun = 3,
		/datum/design/autolathe/sec/riot = 10,
		/datum/design/autolathe/sec/buckler = 5,
		/datum/design/autolathe/ammo/flare_shell,
		/datum/design/autolathe/ammo/flare_shell_g,
		/datum/design/autolathe/ammo/flare_shell_b,
		/datum/design/autolathe/container/ammocan_ih,
	)

/obj/item/computer_hardware/hard_drive/portable/design/security/hos
	disk_name = "Security Miscellaneous Factory"
	license = -1

/obj/item/computer_hardware/hard_drive/portable/design/security/marshal_guns
	disk_name = "Marshal \"Negotiator\" Pack"
	icon_state = "ironhammer"
	license = 20 //1:1 with blackshield guns
	designs = list(
		/datum/design/autolathe/gun/rex10,
		/datum/design/autolathe/gun/rev10,
		/datum/design/autolathe/gun/firefly,
		/datum/design/autolathe/gun/glock,
		//SMGs
		/datum/design/autolathe/gun/luger,
		/datum/design/autolathe/gun/wirbelwind = 2,
		/datum/design/autolathe/gun/straylight,
		//rifles
		/datum/design/autolathe/gun/basstet,
		/datum/design/autolathe/gun/strelki,
		/datum/design/autolathe/gun/ostwind = 3,
		/datum/design/autolathe/gun/bulldog = 3,
		/datum/design/autolathe/gun/bulldog_rds = 3,
		//shotguns
		/datum/design/autolathe/gun/riot_shotgun = 4,
		//machinegun
		/datum/design/autolathe/gun/dp = 2,
		/datum/design/autolathe/gun/bastard = 2,
		//ion
		/datum/design/autolathe/gun/ion_pistol = 5,
		//launcher
		/datum/design/autolathe/gun/grenade_launcher_lenar = 10,
		//sniper
		/datum/design/autolathe/gun/nordwind = 10,
		/datum/design/autolathe/device/landmine = 0,
		//flaregun
		/datum/design/autolathe/gun/flare_gun,
		//Misc
		/datum/design/autolathe/tool/ironhammer,
		/datum/design/autolathe/sec/riot,
		/datum/design/autolathe/sec/buckler = 0,
		/datum/design/autolathe/sec/bastion = 0,
		/datum/design/autolathe/container/ammocan_ih = 0,
		)

/obj/item/computer_hardware/hard_drive/portable/design/security/marshal_ammo
	disk_name = "Marshal \"Shoot-out\" Pack"
	icon_state = "ironhammer"
	license = 30 //1:1 with blackshield guns
	designs = list(
		/datum/design/autolathe/ammo/pistol = 0,
		/datum/design/autolathe/ammo/pistol_lethal,
		/datum/design/autolathe/ammo/pistol_rubber,
		/datum/design/autolathe/ammo/pistol_practice = 0,
		/datum/design/autolathe/ammo/hpistol = 0,
		/datum/design/autolathe/ammo/hpistol_lethal,
		/datum/design/autolathe/ammo/hpistol_rubber,
		/datum/design/autolathe/ammo/hpistol_practice = 0,
		/datum/design/autolathe/ammo/smg = 0,
		/datum/design/autolathe/ammo/smg_rubber,
		/datum/design/autolathe/ammo/smg_lethal,
		/datum/design/autolathe/ammo/smg_practice = 0,
		/datum/design/autolathe/ammo/pistol_35_drum,
		/datum/design/autolathe/ammo/pistol_35_drum/empty = 0,
		/datum/design/autolathe/ammo/pistol_35_drum/rubber,
		/datum/design/autolathe/ammo/pistol_35_drum/lethal,
		/datum/design/autolathe/ammo/magnum = 0,
		/datum/design/autolathe/ammo/magnum_rubber,
		/datum/design/autolathe/ammo/magnum_practice = 0,
		/datum/design/autolathe/ammo/magnum_lethal,
		/datum/design/autolathe/ammo/pistol_ammobox = 0,
		/datum/design/autolathe/ammo/pistol_ammobox_rubber,
		/datum/design/autolathe/ammo/magnum_ammobox = 0,
		/datum/design/autolathe/ammo/magnum_ammobox_rubber,
		/datum/design/autolathe/ammo/magnum_ammobox_practice = 0,
		/datum/design/autolathe/ammo/grenade,
		/datum/design/autolathe/ammo/grenade/flash,
		/datum/design/autolathe/ammo/flare_shell = 0,
		/datum/design/autolathe/ammo/flare_shell_g = 0,
		/datum/design/autolathe/ammo/flare_shell_b = 0,
		/datum/design/autolathe/container/ammocan_ih,
		)

//Blackshield
/obj/item/computer_hardware/hard_drive/portable/design/blackshield
	disk_name = "Blackshield 'Shall-not-be-Infringed' Pack"
	icon_state = "blackshield"
	license = 20

	designs = list(
		/datum/design/autolathe/gun/ten_dark,
		/datum/design/autolathe/gun/NM_colt,
		/datum/design/autolathe/gun/ladon = 2,
		/datum/design/autolathe/gun/naga = 2,
		//SMGs
		/datum/design/autolathe/gun/greasegun = 2,
		//rifles
		/datum/design/autolathe/gun/boltgun_sa = 0,
		/datum/design/autolathe/gun/zatvor,
		/datum/design/autolathe/gun/sol = 3,
		/datum/design/autolathe/gun/omnirifle = 2,
		/datum/design/autolathe/gun/standard_omnirifle,
		/datum/design/autolathe/gun/omnicarbine,
		/datum/design/autolathe/gun/rds_omnicarbine = 2,
		//machinegun
		/datum/design/autolathe/gun/saw = 4,
		/datum/design/autolathe/gun/ppv = 5,
		//grenade launcher
		/datum/design/autolathe/gun/grenade_launcher_china_lake = 2,
		//STS
		/datum/design/autolathe/gun/sts25,
		/datum/design/autolathe/gun/sts30 = 2,
		/datum/design/autolathe/gun/sts40 = 3,
		//Flaregun
		/datum/design/autolathe/gun/flare_gun,
		//Misc
		/datum/design/autolathe/device/landmine = 0,
		/datum/design/autolathe/sec/riot = 2,
		/datum/design/autolathe/sec/bastion = 0,
		/datum/design/autolathe/sec/buckler,
		/datum/design/autolathe/container/ammocan_ih = 0,
		)

/obj/item/computer_hardware/hard_drive/portable/design/blackshieldammo
	disk_name = "Blackshield Ammo Sovereignty Pack"
	icon_state = "blackshield"
	license = 30

	designs = list(

		/datum/design/autolathe/ammo/pistol_lethal,
		/datum/design/autolathe/ammo/pistol_rubber,
		/datum/design/autolathe/ammo/pistol_practice = 0,
		/datum/design/autolathe/ammo/pistol_35_drum,
		/datum/design/autolathe/ammo/pistol_35_drum/empty = 0,
		/datum/design/autolathe/ammo/pistol_35_drum/rubber,
		/datum/design/autolathe/ammo/pistol_35_drum/lethal,
		/datum/design/autolathe/ammo/smg,
		/datum/design/autolathe/ammo/smg_rubber,
		/datum/design/autolathe/ammo/smg_practice = 0,
		/datum/design/autolathe/ammo/magnum,
		/datum/design/autolathe/ammo/magnum_rubber,
		/datum/design/autolathe/ammo/magnum_practice = 0,
		/datum/design/autolathe/ammo/magnum_lethal,
		/datum/design/autolathe/ammo/hrifle,
		/datum/design/autolathe/ammo/hrifle_rubber,
		/datum/design/autolathe/ammo/hrifle_practice = 0,
		/datum/design/autolathe/ammo/hrifle_lethal,
		/datum/design/autolathe/ammo/lrifle,
		/datum/design/autolathe/ammo/lrifle_short_rubber,
		/datum/design/autolathe/ammo/lrifle_short_practice = 0,
		/datum/design/autolathe/ammo/rifle,
		/datum/design/autolathe/ammo/rifle_short,
		/datum/design/autolathe/ammo/rifle_lethal,
		/datum/design/autolathe/ammo/rifle_short_lethal,
		/datum/design/autolathe/ammo/pistol_ammobox,
		/datum/design/autolathe/ammo/pistol_ammobox_rubber,
		/datum/design/autolathe/ammo/magnum_ammobox,
		/datum/design/autolathe/ammo/magnum_ammobox_rubber,
		/datum/design/autolathe/ammo/magnum_ammobox_practice = 0,
		/datum/design/autolathe/ammo/kurtz_ammobox,
		/datum/design/autolathe/ammo/kurtz_ammobox_practice = 0,
		/datum/design/autolathe/ammo/rifle_ammobox,
		/datum/design/autolathe/ammo/lrifle_ammobox,
		/datum/design/autolathe/ammo/lrifle_ammobox_rubber,
		/datum/design/autolathe/ammo/hrifle_ammobox,
		/datum/design/autolathe/ammo/hrifle_ammobox_lethal,
		/datum/design/autolathe/ammo/hrifle_ammobox_rubber,
		/datum/design/autolathe/ammo/hrifle_ammobox_practice = 0,
		/datum/design/autolathe/ammo/grenade,
		/datum/design/autolathe/ammo/grenade/frag,
		/datum/design/autolathe/ammo/grenade/blast,
		/datum/design/autolathe/ammo/grenade/flash,
		/datum/design/autolathe/ammo/flare_shell = 0,
		/datum/design/autolathe/ammo/flare_shell_g = 0,
		/datum/design/autolathe/ammo/flare_shell_b = 0,
		/datum/design/autolathe/ammo/shotgun_box = 5, //Might want to up these, but really only a ten point difference from the other disk.
		/datum/design/autolathe/ammo/shotgun_pellet_box = 5,
		/datum/design/autolathe/container/ammocan_ih,
		)

/obj/item/computer_hardware/hard_drive/portable/design/blackshield/luger
	disk_name = "NM .35 \"Vintovka Lyugera\" carbine"
	icon_state = "blackshield"
	license = 15

	designs = list(
		/datum/design/autolathe/gun/luger = 6,
		/datum/design/autolathe/ammo/smg = 3,
		/datum/design/autolathe/ammo/smg_rubber = 3,
		/datum/design/autolathe/ammo/smg_practice = 0,
		/datum/design/autolathe/ammo/hpistol_practice = 0,
		/datum/design/autolathe/ammo/hpistol_rubber = 2,
		/datum/design/autolathe/ammo/hpistol = 2,
		/datum/design/autolathe/ammo/pistol_practice = 0,
		/datum/design/autolathe/ammo/pistol_rubber,
		/datum/design/autolathe/ammo/pistol,
		)

/obj/item/computer_hardware/hard_drive/portable/design/blackshield/alemao
	disk_name = "NM .35 \"O Alemao\" smg"
	icon_state = "blackshield"
	license = 8

	designs = list(
		/datum/design/autolathe/gun/alemao = 3,
		/datum/design/autolathe/ammo/pistol_practice = 0,
		/datum/design/autolathe/ammo/pistol_rubber,
		/datum/design/autolathe/ammo/pistol,
		/datum/design/autolathe/ammo/pistol_lethal = 2,
		/datum/design/autolathe/ammo/hpistol_practice = 1,
		/datum/design/autolathe/ammo/hpistol_rubber = 2,
		/datum/design/autolathe/ammo/hpistol = 2,
		/datum/design/autolathe/ammo/hpistol_lethal = 2,
		)

/obj/item/computer_hardware/hard_drive/portable/design/blackshield/NM_colt
	disk_name = "NM HG .35 \"Bronco\""
	icon_state = "blackshield"
	license = 8

	designs = list(
		/datum/design/autolathe/gun/NM_colt = 3,
		/datum/design/autolathe/ammo/pistol_practice = 0,
		/datum/design/autolathe/ammo/pistol_rubber,
		/datum/design/autolathe/ammo/pistol,
		/datum/design/autolathe/ammo/pistol_lethal = 2,
		/datum/design/autolathe/ammo/hpistol_practice = 1,
		/datum/design/autolathe/ammo/hpistol_rubber = 2,
		/datum/design/autolathe/ammo/hpistol = 2,
		/datum/design/autolathe/ammo/hpistol_lethal = 2,
		)

/obj/item/computer_hardware/hard_drive/portable/design/blackshield/strelki
	disk_name = "NM - 7.5mm \"Strelki\""
	icon_state = "ironhammer"
	license = 8

	designs = list(
		/datum/design/autolathe/gun/strelki = 3,
		/datum/design/autolathe/ammo/rifle,
		/datum/design/autolathe/ammo/rifle_rubber,
		/datum/design/autolathe/ammo/rifle_practice = 0,
		/datum/design/autolathe/ammo/rifle_lethal = 2,
		)

/obj/item/computer_hardware/hard_drive/portable/design/blackshield/zatvor
	disk_name = "NM 7.5 bolt \"Zatvor\" rifle"
	icon_state = "blackshield"
	license = 8

	designs = list(
		/datum/design/autolathe/gun/zatvor = 3,
		/datum/design/autolathe/ammo/rifle_ammobox_small = 2,
		/datum/design/autolathe/ammo/rifle_ammobox_small_practice = 0,
		/datum/design/autolathe/ammo/rifle_ammobox_small_rubber = 2,
		/datum/design/autolathe/ammo/rifle_ammobox_small_lethal = 3,
		/datum/design/autolathe/ammo/sl_rifle = 2,
		)

/obj/item/computer_hardware/hard_drive/portable/design/blackshield/semyonovich
	disk_name = "Blackshield .35 Auto \"Semyonovich\""
	icon_state = "blackshield"
	license = 8

	designs = list(
		/datum/design/autolathe/gun/ppv = 3,
		/datum/design/autolathe/ammo/pistol_35_drum,
		/datum/design/autolathe/ammo/pistol_35_drum/empty = 0,
		/datum/design/autolathe/ammo/pistol_35_drum/rubber,
		/datum/design/autolathe/ammo/pistol_35_drum/lethal = 2,
		)

/obj/item/computer_hardware/hard_drive/portable/design/blackshield/dp
	disk_name = "NM - \"Pulemyot Degtyaryova\" LMG"
	icon_state = "ironhammer"
	license = 8

	designs = list(
		/datum/design/autolathe/gun/dp = 3,
		/datum/design/autolathe/ammo/maxim = 1,
		)

/obj/item/computer_hardware/hard_drive/portable/design/blackshield/greasegun
	disk_name = "Blackshield - .35 Auto \"Grease Gun\""
	icon_state = "blackshield"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/greasegun = 3,
		/datum/design/autolathe/ammo/smg_practice = 0,
		/datum/design/autolathe/ammo/smg_rubber,
		/datum/design/autolathe/ammo/smg,
		/datum/design/autolathe/ammo/smg_lethal = 2,
	)

/obj/item/computer_hardware/hard_drive/portable/design/blackshield/basstet
	disk_name = "NM - .257 Basstet Rifle"
	icon_state = "blackshield"

	license = 16
	designs = list(
		/datum/design/autolathe/gun/basstet = 6,
		/datum/design/autolathe/ammo/lrifle_short_practice = 0,
		/datum/design/autolathe/ammo/lrifle_short_rubber,
		/datum/design/autolathe/ammo/lrifle_short,
		/datum/design/autolathe/ammo/lrifle_short_lethal = 2,
		/datum/design/autolathe/ammo/lrifle_practice = 1,
		/datum/design/autolathe/ammo/lrifle_rubber = 2,
		/datum/design/autolathe/ammo/lrifle = 2,
		/datum/design/autolathe/ammo/lrifle_lethal = 4,
	)

// Magazines and ammo

/obj/item/computer_hardware/hard_drive/portable/design/nonlethal_ammo //please, maintain general order (pistol>speedloaders>smg>other>shells)+(smaller/less damaging caliber>bigger/more damaging caliber)
	disk_name = "H&S Nonlethal Magazines Pack"
	icon_state = "frozenstar"

	license = 20
	designs = list(
		//pistol mags
		/datum/design/autolathe/ammo/pistol_rubber,
		/datum/design/autolathe/ammo/magnum_rubber,
		/datum/design/autolathe/ammo/kurtz_rubber,
		//speed loaders
		/datum/design/autolathe/ammo/slpistol_rubber,
		/datum/design/autolathe/ammo/slmagnum_rubber,
		/datum/design/autolathe/ammo/slkurtz_rubber,
		//smg mags
		/datum/design/autolathe/ammo/smg_rubber,
		// rifles
		/datum/design/autolathe/ammo/lrifle_short_rubber,
		/datum/design/autolathe/ammo/rifle_short_rubber,
		/datum/design/autolathe/ammo/hrifle_rubber,
		//shells
		/datum/design/autolathe/ammo/shotgun_blanks = 0,
		/datum/design/autolathe/ammo/shotgun_beanbag,
		/datum/design/autolathe/ammo/shotgun_illumination,
	)

/obj/item/computer_hardware/hard_drive/portable/design/lethal_ammo //please, maintain general order (pistol>speedloaders>smg>other>shells)+(smaller/less damaging caliber>bigger/more damaging caliber)
	disk_name = "SA Lethal Magazines Pack"
	icon_state = "sa"

	license = 20
	designs = list(
		//pistol mags
		/datum/design/autolathe/ammo/pistol,
		/datum/design/autolathe/ammo/pistol_lethal,
		/datum/design/autolathe/ammo/magnum,
		/datum/design/autolathe/ammo/magnum_lethal,
		/datum/design/autolathe/ammo/kurtz_lethal,
		//speed loaders
		/datum/design/autolathe/ammo/slpistol,
		/datum/design/autolathe/ammo/slpistol_lethal,
		/datum/design/autolathe/ammo/slmagnum,
		/datum/design/autolathe/ammo/slmagnum_lethal,
		/datum/design/autolathe/ammo/slkurtz,
		/datum/design/autolathe/ammo/slkurtz_lethal,
		//smg mags
		/datum/design/autolathe/ammo/smg,
		/datum/design/autolathe/ammo/smg_lethal,
		// rifles
		/datum/design/autolathe/ammo/lrifle,
		/datum/design/autolathe/ammo/lrifle_short,
		/datum/design/autolathe/ammo/lrifle_short_lethal,
		/datum/design/autolathe/ammo/rifle,
		/datum/design/autolathe/ammo/rifle_short,
		/datum/design/autolathe/ammo/rifle_lethal,
		/datum/design/autolathe/ammo/rifle_short_lethal,
		/datum/design/autolathe/ammo/hrifle,
		/datum/design/autolathe/ammo/hrifle_lethal,
		//shells
		/datum/design/autolathe/ammo/shotgun_pellet,
		/datum/design/autolathe/ammo/shotgun,
		/datum/design/autolathe/container/ammocan_serb,
	)

/obj/item/computer_hardware/hard_drive/portable/design/ammo_boxes_smallarms
	disk_name = "SA Handgun Ammunition"
	icon_state = "sa"

	license = 20
	designs = list(
		/datum/design/autolathe/ammo/pistol_ammobox,
		/datum/design/autolathe/ammo/pistol_ammobox_practice = 0,
		/datum/design/autolathe/ammo/pistol_ammobox_rubber,
		/datum/design/autolathe/ammo/pistol_ammobox_lethal,
		/datum/design/autolathe/ammo/magnum_ammobox,
		/datum/design/autolathe/ammo/magnum_ammobox_practice = 0,
		/datum/design/autolathe/ammo/magnum_ammobox_rubber,
		/datum/design/autolathe/ammo/magnum_ammobox_lethal,
		/datum/design/autolathe/ammo/kurtz_ammobox,
		/datum/design/autolathe/ammo/kurtz_ammobox_practice = 0,
		/datum/design/autolathe/ammo/kurtz_ammobox_rubber,
		/datum/design/autolathe/ammo/kurtz_ammobox_lethal,
		/datum/design/autolathe/container/ammocan_serb,
	)

/obj/item/computer_hardware/hard_drive/portable/design/ammo_boxes_rifle
	disk_name = "SA Rifle Ammunition"
	icon_state = "sa"

	license = 20
	designs = list(
		/datum/design/autolathe/ammo/rifle_ammobox_small,
		/datum/design/autolathe/ammo/rifle_ammobox_small_practice = 0,
		/datum/design/autolathe/ammo/rifle_ammobox_small_rubber,
		/datum/design/autolathe/ammo/rifle_ammobox_small_lethal,
		/datum/design/autolathe/ammo/rifle_ammobox,
		/datum/design/autolathe/ammo/lrifle_ammobox_small,
		/datum/design/autolathe/ammo/lrifle_ammobox_small_practice = 0,
		/datum/design/autolathe/ammo/lrifle_ammobox_small_rubber,
		/datum/design/autolathe/ammo/lrifle_ammobox_small_lethal,
		/datum/design/autolathe/ammo/lrifle_ammobox,
		/datum/design/autolathe/ammo/hrifle_ammobox_small,
		/datum/design/autolathe/ammo/hrifle_ammobox_small_practice = 0,
		/datum/design/autolathe/ammo/hrifle_ammobox_small_rubber,
		/datum/design/autolathe/ammo/hrifle_ammobox_small_lethal,
		/datum/design/autolathe/ammo/hrifle_ammobox,
		/datum/design/autolathe/ammo/shotgun_box = 5, //35 x 4 (140 shells well a full disk of 5 x 20 = 100)
		/datum/design/autolathe/ammo/shotgun_pellet_box = 5,
		/datum/design/autolathe/container/ammocan_serb,
	)


/obj/item/computer_hardware/hard_drive/portable/design/exotic_ammo
	disk_name = "SA Exotic Ammunition Pack"
	icon_state = "sa"
	license = 20

	designs = list(
		/datum/design/autolathe/ammo/m12empty = 0,
		/datum/design/autolathe/ammo/sbaw_empty = 0,
		/datum/design/autolathe/ammo/hrifle_drum_empty = 0,
		/datum/design/autolathe/ammo/rifle_pk_empty = 0,
		/datum/design/autolathe/ammo/lrifle_belt_empty = 0,
		/datum/design/autolathe/ammo/maxim_empty = 0,
		/datum/design/autolathe/ammo/c10x24 = 3,
		/datum/design/autolathe/ammo/lrifle_ammobox,
		/datum/design/autolathe/ammo/rifle_ammobox,
		/datum/design/autolathe/ammo/hrifle_ammobox,
		/datum/design/autolathe/ammo/shotgun_box = 3, //35 x 6 (210 shells well a full disk of 5 x 20 = 100)
		/datum/design/autolathe/ammo/shotgun_pellet_box = 3,
		/datum/design/autolathe/ammo/mag_10x24 = 1,
		/datum/design/autolathe/ammo/box_10x24 = 5,
		/datum/design/autolathe/ammo/box_antim = 5,
		/datum/design/autolathe/container/ammocan_serb = 0,
		)

// G U N S (minus excelsior and research)
// Pack is used when there is more than one gun on the disk

// .35 PISTOLS + REVOLVERS

/obj/item/computer_hardware/hard_drive/portable/design/guns/cheap_guns
	disk_name = "H&S - .35 Economy Pack"
	icon_state = "frozenstar"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/giskard = 2,
		/datum/design/autolathe/gun/olivaw = 2,
		/datum/design/autolathe/gun/clarissa = 2,
		/datum/design/autolathe/gun/detective,
		/datum/design/autolathe/ammo/pistol_practice = 0,
		/datum/design/autolathe/ammo/pistol_rubber,
		/datum/design/autolathe/ammo/slpistol_practice = 0,
		/datum/design/autolathe/ammo/slpistol_rubber,
		/datum/design/autolathe/ammo/hpistol_practice = 1,
		/datum/design/autolathe/ammo/hpistol_rubber = 2,
		/datum/design/autolathe/ammo/hpistol = 2,
		/datum/design/autolathe/ammo/hpistol_lethal = 2,
		/datum/design/autolathe/container/ammocan_serb,
		)


/obj/item/computer_hardware/hard_drive/portable/design/guns/colt
	disk_name = "H&S - .35 M1911"
	icon_state = "ironhammer"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/colt = 3,
		/datum/design/autolathe/ammo/pistol_practice = 0,
		/datum/design/autolathe/ammo/pistol_rubber,
		/datum/design/autolathe/ammo/pistol,
		/datum/design/autolathe/ammo/pistol_lethal = 2,
		/datum/design/autolathe/ammo/hpistol_practice = 1,
		/datum/design/autolathe/ammo/hpistol_rubber = 2,
		/datum/design/autolathe/ammo/hpistol = 2,
		/datum/design/autolathe/ammo/hpistol_lethal = 2,
	)


/obj/item/computer_hardware/hard_drive/portable/design/guns/firefly
	disk_name = "GmbH - .35 Firefly Pistol"
	icon_state = "frozenstar"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/firefly = 3,
		/datum/design/autolathe/ammo/hpistol_practice = 0,
		/datum/design/autolathe/ammo/hpistol_rubber,
		/datum/design/autolathe/ammo/hpistol,
		/datum/design/autolathe/ammo/hpistol_lethal = 2,
	)

/obj/item/computer_hardware/hard_drive/portable/design/guns/glock
	disk_name = "GmbH - .35 Sky Auto Pistol"
	icon_state = "frozenstar"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/glock = 3,
		/datum/design/autolathe/ammo/hpistol_practice = 0,
		/datum/design/autolathe/ammo/hpistol_rubber,
		/datum/design/autolathe/ammo/hpistol,
		/datum/design/autolathe/ammo/hpistol_lethal = 2,
	)


// .40 REVOLVERS

/obj/item/computer_hardware/hard_drive/portable/design/guns/revolver
	disk_name = "H&S - .40 Minotaur Revolver"
	icon_state = "frozenstar"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/revolver = 3,
		/datum/design/autolathe/ammo/slmagnum_practice = 0,
		/datum/design/autolathe/ammo/slmagnum_rubber,
		/datum/design/autolathe/ammo/slmagnum,
		/datum/design/autolathe/ammo/slmagnum_lethal = 2,
		)

/obj/item/computer_hardware/hard_drive/portable/design/guns/rev10
	disk_name = "H&S - .40 Frontier Revolver"
	icon_state = "ironhammer"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/rev10 = 3,
		/datum/design/autolathe/ammo/slmagnum_practice = 0,
		/datum/design/autolathe/ammo/slmagnum_rubber,
		/datum/design/autolathe/ammo/slmagnum,
		/datum/design/autolathe/ammo/slmagnum_lethal = 2,
		)

// .40 pistols

/obj/item/computer_hardware/hard_drive/portable/design/guns/ladon
	disk_name = "H&S - .40 Auto-Mag Porton Handgun"
	icon_state = "frozenstar"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/ladon_hs = 3,
		/datum/design/autolathe/ammo/magnum_practice = 0,
		/datum/design/autolathe/ammo/magnum_rubber,
		/datum/design/autolathe/ammo/magnum,
		/datum/design/autolathe/ammo/magnum_lethal = 2,
		)

/obj/item/computer_hardware/hard_drive/portable/design/guns/ladon/sa
	disk_name = "SA - .40 Auto-Mag Sigia Handgun"
	icon_state = "sa"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/ladon_sa = 3,
		/datum/design/autolathe/ammo/magnum_practice = 0,
		/datum/design/autolathe/ammo/magnum_rubber,
		/datum/design/autolathe/ammo/magnum,
		/datum/design/autolathe/ammo/magnum_lethal = 2,
		)

/obj/item/computer_hardware/hard_drive/portable/design/guns/ladon/dark
	disk_name = "GmbH - .40 Auto-Mag Ladon Handgun"
	icon_state = "onestar"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/ladon = 3,
		/datum/design/autolathe/ammo/magnum_practice = 0,
		/datum/design/autolathe/ammo/magnum_rubber,
		/datum/design/autolathe/ammo/magnum,
		/datum/design/autolathe/ammo/magnum_lethal = 2,
		)

/obj/item/computer_hardware/hard_drive/portable/design/guns/colt/ten
	disk_name = "H&S - .40 Auto-Mag Delta Elite"
	icon_state = "frozenstar"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/ten = 3,
		/datum/design/autolathe/ammo/magnum_practice = 0,
		/datum/design/autolathe/ammo/magnum_rubber,
		/datum/design/autolathe/ammo/magnum,
		/datum/design/autolathe/ammo/magnum_lethal = 2,
		)

/obj/item/computer_hardware/hard_drive/portable/design/guns/rafale
	disk_name = "GmbH - .40 Auto-Mag Rafale"
	icon_state = "frozenstar"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/rafale = 3,
		/datum/design/autolathe/ammo/magnum_practice = 0,
		/datum/design/autolathe/ammo/magnum_rubber,
		/datum/design/autolathe/ammo/magnum,
		/datum/design/autolathe/ammo/magnum_lethal = 2,
		)

/obj/item/computer_hardware/hard_drive/portable/design/guns/armstrong
	disk_name = "H&S - .40 lever action Armstrong"
	icon_state = "frozenstar"

	license = 16
	designs = list(
		/datum/design/autolathe/gun/lever = 6,
		/datum/design/autolathe/ammo/magnum_ammobox = 3,
		/datum/design/autolathe/ammo/magnum_ammobox_practice = 0,
		/datum/design/autolathe/ammo/magnum_ammobox_rubber = 3,
		/datum/design/autolathe/ammo/magnum_ammobox_lethal = 4,
		)

// .40 SMGS
/obj/item/computer_hardware/hard_drive/portable/design/guns/vector
	disk_name = "SA - .40 Trajectory SMG"
	icon_state = "sa"

	license = 16
	designs = list(
		/datum/design/autolathe/gun/vector = 0, //The gun is free as this is the only way to get it
		/datum/design/autolathe/ammo/smg_magnum_40 = 3,
		/datum/design/autolathe/ammo/smg_magnum_40_rubber = 2,
		//Free as well do to being the only way to get these mags
		/datum/design/autolathe/ammo/smg_magnum_40_empty = 0,
		/datum/design/autolathe/ammo/smg_magnum_40_practice = 0,
		/datum/design/autolathe/ammo/smg_magnum_40_lethal = 4
		)

// .50 PISTOLS

/obj/item/computer_hardware/hard_drive/portable/design/guns/lamia
	disk_name = "H&S - .50 Lamia Handgun"
	icon_state = "frozenstar"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/lamia = 3,
		/datum/design/autolathe/ammo/kurtz_practice = 0,
		/datum/design/autolathe/ammo/kurtz_rubber,
		/datum/design/autolathe/ammo/kurtz,
		/datum/design/autolathe/ammo/kurtz_lethal = 2,
		)

/obj/item/computer_hardware/hard_drive/portable/design/guns/basilisk
	disk_name = "H&S - .50 Basilisk Handgun"
	icon_state = "frozenstar"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/basilisk = 3,
		/datum/design/autolathe/ammo/kurtz_practice = 0,
		/datum/design/autolathe/ammo/kurtz_rubber,
		/datum/design/autolathe/ammo/kurtz,
		/datum/design/autolathe/ammo/kurtz_lethal = 2,
		)

/obj/item/computer_hardware/hard_drive/portable/design/guns/naga
	disk_name = "M6 .50 Naga Handgun"
	icon_state = "black"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/naga = 3,
		/datum/design/autolathe/ammo/kurtz_practice = 0,
		/datum/design/autolathe/ammo/kurtz_rubber,
		/datum/design/autolathe/ammo/kurtz,
		/datum/design/autolathe/ammo/kurtz_lethal = 2,,
		)

/obj/item/computer_hardware/hard_drive/portable/design/guns/akurra
	disk_name = "SA - .50 Akurra Silenced Handgun"
	icon_state = "sa"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/akurra = 3,
		/datum/design/autolathe/ammo/kurtz_practice = 0,
		/datum/design/autolathe/ammo/kurtz_rubber,
		/datum/design/autolathe/ammo/kurtz,
		/datum/design/autolathe/ammo/kurtz_lethal = 2,
		)

/obj/item/computer_hardware/hard_drive/portable/design/guns/revolver_mateba
	disk_name = "SA - .50 Kurtz Mateba Revolver"
	icon_state = "sa"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/revolver/mateba = 3,
		/datum/design/autolathe/ammo/slkurtz_practice = 0,
		/datum/design/autolathe/ammo/slkurtz_rubber,
		/datum/design/autolathe/ammo/slkurtz,
		/datum/design/autolathe/ammo/slkurtz_lethal = 2,
		)

// SHOTGUNS

/obj/item/computer_hardware/hard_drive/portable/design/guns/doublebarrel
	disk_name = "SA - 20mm Double Barrel Shotgun"
	icon_state = "sa"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/doublebarrel = 3,
		/datum/design/autolathe/ammo/shotgun_beanbag,
		/datum/design/autolathe/ammo/shotgun_blanks = 0,
		/datum/design/autolathe/ammo/shotgun_illumination,
		)

/obj/item/computer_hardware/hard_drive/portable/design/guns/grizzly
	disk_name = "SA - 20mm Grizzly Shotgun"
	icon_state = "sa"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/pump_shotgun = 3,
		/datum/design/autolathe/ammo/shotgun_beanbag,
		/datum/design/autolathe/ammo/shotgun_blanks = 0,
		/datum/design/autolathe/ammo/shotgun_illumination,
		)

/obj/item/computer_hardware/hard_drive/portable/design/guns/sbaw
	disk_name = "20mm SBAW disk"
	icon_state = "ironhammer"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/sbaw = 3,
		/datum/design/autolathe/ammo/sbaw_slug,
		/datum/design/autolathe/ammo/sbaw_pellet,
		/datum/design/autolathe/ammo/sbaw_beanbag,
		/datum/design/autolathe/ammo/sbaw_payload = 3,
		/datum/design/autolathe/ammo/sbaw_empty = 0, //So we can handload new mags
		)

/obj/item/computer_hardware/hard_drive/portable/design/guns/gladstone
	disk_name = "H&S - 20mm Gladstone Shotgun"
	icon_state = "frozenstar"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/gladstone = 3,
		/datum/design/autolathe/ammo/shotgun_beanbag,
		/datum/design/autolathe/ammo/shotgun_blanks = 0,
		/datum/design/autolathe/ammo/shotgun_illumination,
		)

/obj/item/computer_hardware/hard_drive/portable/design/guns/state
	disk_name = "GmbH - 20mm State Auto Shotgun"
	desc = "Known as the state, an odd shotgun, often redesigned every few years in a way few people are fully happy with."
	icon_state = "frozenstar"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/riot_shotgun = 3,
		/datum/design/autolathe/ammo/shotgun_beanbag,
		/datum/design/autolathe/ammo/shotgun_blanks = 0,
		/datum/design/autolathe/ammo/shotgun_illumination,
		)

/obj/item/computer_hardware/hard_drive/portable/design/guns/pug
	disk_name = "SA - 20mm Pug Auto Shotgun"
	icon_state = "sa"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/pug = 3,
		/datum/design/autolathe/ammo/m12beanbag, // Never add tazershells, for love of god
		/datum/design/autolathe/ammo/m12pellet,
		/datum/design/autolathe/ammo/m12slug,
		)

/obj/item/computer_hardware/hard_drive/portable/design/guns/sixshot
	disk_name = "SA - 20mm Revolving Shotgun"
	icon_state = "sa"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/sixshot = 3,
		/datum/design/autolathe/ammo/shotgun_beanbag,
		/datum/design/autolathe/ammo/shotgun_blanks = 0,
		/datum/design/autolathe/ammo/shotgun_illumination,
		)

// SMGs

/obj/item/computer_hardware/hard_drive/portable/design/guns/wirbelwind
	disk_name = "GmbH - .35 Wirbelwind SMG"
	icon_state = "frozenstar"

	license = 12
	designs = list(
		/datum/design/autolathe/gun/wirbelwind = 3,
		/datum/design/autolathe/ammo/smg_practice = 0,
		/datum/design/autolathe/ammo/smg_rubber,
		/datum/design/autolathe/ammo/smg,
		/datum/design/autolathe/ammo/smg_lethal = 2,
	)

/obj/item/computer_hardware/hard_drive/portable/design/guns/straylight
	disk_name = "H&S - .35 Straylight SMG"
	icon_state = "frozenstar"

	license = 12
	designs = list(
		/datum/design/autolathe/gun/straylight = 3,
		/datum/design/autolathe/ammo/smg_practice = 0,
		/datum/design/autolathe/ammo/smg_rubber,
		/datum/design/autolathe/ammo/smg,
		/datum/design/autolathe/ammo/smg_lethal = 2,
	)

/obj/item/computer_hardware/hard_drive/portable/design/guns/texan
	disk_name = "SA - .35 Texan SMG"
	icon_state = "sa"

	license = 12
	designs = list(
		/datum/design/autolathe/gun/texan = 3,
		/datum/design/autolathe/ammo/smg_practice = 0,
		/datum/design/autolathe/ammo/smg_rubber,
		/datum/design/autolathe/ammo/smg,
		/datum/design/autolathe/ammo/smg_lethal = 2,
	)

/obj/item/computer_hardware/hard_drive/portable/design/guns/mac
	disk_name = "SA - .35 MAC SMG"
	icon_state = "sa"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/mac = 3,
		/datum/design/autolathe/ammo/smg_practice = 0,
		/datum/design/autolathe/ammo/smg_rubber,
		/datum/design/autolathe/ammo/smg,
		/datum/design/autolathe/ammo/smg_lethal = 2,
	)

// .257 carbines

/obj/item/computer_hardware/hard_drive/portable/design/guns/bastard
	disk_name = "NM - .257 \"Bastard\" Compact Machine Gun"
	icon_state = "frozenstar"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/bastard = 3,
		/datum/design/autolathe/ammo/lrifle_ammobox_small_practice = 0,
		/datum/design/autolathe/ammo/lrifle_ammobox_small_rubber,
		/datum/design/autolathe/ammo/lrifle_ammobox_small,
		/datum/design/autolathe/ammo/lrifle_ammobox_small_lethal = 2,
	)

/obj/item/computer_hardware/hard_drive/portable/design/guns/sol
	disk_name = "H&S - .257 \"Solarian\" Carbine"
	icon_state = "ironhammer"

	license = 16
	designs = list(
		/datum/design/autolathe/gun/sol = 6,
		/datum/design/autolathe/ammo/lrifle_short_practice = 0,
		/datum/design/autolathe/ammo/lrifle_short_rubber,
		/datum/design/autolathe/ammo/lrifle_short,
		/datum/design/autolathe/ammo/lrifle_short_lethal = 2,
		/datum/design/autolathe/ammo/lrifle_practice = 1,
		/datum/design/autolathe/ammo/lrifle_rubber = 2,
		/datum/design/autolathe/ammo/lrifle = 2,
		/datum/design/autolathe/ammo/lrifle_lethal = 4,
		)

/obj/item/computer_hardware/hard_drive/portable/design/guns/pitbull
	disk_name = "H&S - .257 Pitbull Carbine"
	icon_state = "frozenstar"

	license = 16
	designs = list(
		/datum/design/autolathe/gun/pitbull = 6,
		/datum/design/autolathe/ammo/lrifle_short_practice = 0,
		/datum/design/autolathe/ammo/lrifle_short_rubber,
		/datum/design/autolathe/ammo/lrifle_short,
		/datum/design/autolathe/ammo/lrifle_short_lethal = 2,
		/datum/design/autolathe/ammo/lrifle_practice = 1,
		/datum/design/autolathe/ammo/lrifle_rubber = 2,
		/datum/design/autolathe/ammo/lrifle = 2,
		/datum/design/autolathe/ammo/lrifle_lethal = 4,
	)

/obj/item/computer_hardware/hard_drive/portable/design/guns/ostwind
	disk_name = "GmbH - .257 Ostwind Carbine"
	icon_state = "frozenstar"

	license = 16
	designs = list(
		/datum/design/autolathe/gun/ostwind = 6,
		/datum/design/autolathe/ammo/lrifle_short_practice = 0,
		/datum/design/autolathe/ammo/lrifle_short_rubber,
		/datum/design/autolathe/ammo/lrifle_short,
		/datum/design/autolathe/ammo/lrifle_short_lethal = 2,
		/datum/design/autolathe/ammo/lrifle_practice = 1,
		/datum/design/autolathe/ammo/lrifle_rubber = 2,
		/datum/design/autolathe/ammo/lrifle = 2,
		/datum/design/autolathe/ammo/lrifle_lethal = 4,
	)


/obj/item/computer_hardware/hard_drive/portable/design/guns/bulldog
	disk_name = "GmbH - .257 Bulldog Carbine"
	icon_state = "frozenstar"

	license = 16
	designs = list(
		/datum/design/autolathe/gun/bulldog = 6,
		/datum/design/autolathe/gun/bulldog_rds = 7,
		/datum/design/autolathe/ammo/lrifle_short_practice = 0,
		/datum/design/autolathe/ammo/lrifle_short_rubber,
		/datum/design/autolathe/ammo/lrifle_short,
		/datum/design/autolathe/ammo/lrifle_short_lethal = 2,
		/datum/design/autolathe/ammo/lrifle_practice = 1,
		/datum/design/autolathe/ammo/lrifle_rubber = 2,
		/datum/design/autolathe/ammo/lrifle = 2,
		/datum/design/autolathe/ammo/lrifle_lethal = 4,
	)

// .257

/obj/item/computer_hardware/hard_drive/portable/design/guns/saw
	disk_name = "SA - .257 Pegasus LMG"
	icon_state = "sa"

	license = 8 //So we can print 2 and some ammo
	designs = list(
		/datum/design/autolathe/gun/saw = 3,
		/datum/design/autolathe/ammo/lrifle_ammobox = 2,
		/datum/design/autolathe/ammo/lrifle_belt, //This is its linked ammo
		/datum/design/autolathe/ammo/lrifle_ammobox_small_practice = 0,
		/datum/design/autolathe/ammo/lrifle_ammobox_rubber,
	)

/obj/item/computer_hardware/hard_drive/portable/design/guns/sika
	disk_name = "Hunters Inc - .257 Sika Rifle"
	icon_state = "hunters"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/sika = 3,
		/datum/design/autolathe/ammo/lrifle_speed_loader,
		/datum/design/autolathe/ammo/lrifle_ammobox_small_practice = 0,
		/datum/design/autolathe/ammo/lrifle_ammobox_small_rubber,
		/datum/design/autolathe/ammo/lrifle_ammobox_small,
		/datum/design/autolathe/ammo/lrifle_ammobox_small_lethal = 2,
	)

/obj/item/computer_hardware/hard_drive/portable/design/guns/roe
	disk_name = "Hunters Inc - .257 Roe Rifle"
	icon_state = "hunters"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/roe =  3,
		/datum/design/autolathe/ammo/lrifle_speed_loader,
		/datum/design/autolathe/ammo/lrifle_ammobox_small_practice = 0,
		/datum/design/autolathe/ammo/lrifle_ammobox_small_rubber,
		/datum/design/autolathe/ammo/lrifle_ammobox_small,
		/datum/design/autolathe/ammo/lrifle_ammobox_small_lethal = 2,
	)


// 7.5 Rifles

/obj/item/computer_hardware/hard_drive/portable/design/guns/sa_kalashnikov
	disk_name = "SA - 7.5 Kalashnikov Rifle"
	icon_state = "sa"

	license = 16
	designs = list(
		/datum/design/autolathe/gun/ak47_sa = 6,
		/datum/design/autolathe/ammo/rifle_short_practice = 0,
		/datum/design/autolathe/ammo/rifle_short_rubber,
		/datum/design/autolathe/ammo/rifle_short,
		/datum/design/autolathe/ammo/rifle_short_lethal = 2,
		/datum/design/autolathe/ammo/rifle_practice = 1,
		/datum/design/autolathe/ammo/rifle_rubber = 2,
		/datum/design/autolathe/ammo/rifle = 2,
		/datum/design/autolathe/ammo/rifle_lethal = 4,
	)

/obj/item/computer_hardware/hard_drive/portable/design/guns/bren
	disk_name = "No-Publisher - .257 \"Kalashnabren\""
	icon_state = "black"

	license = 16
	designs = list(
		/datum/design/autolathe/gun/bren = 6,
		/datum/design/autolathe/ammo/rifle_short_practice = 0,
		/datum/design/autolathe/ammo/rifle_short_rubber,
		/datum/design/autolathe/ammo/rifle_short,
		/datum/design/autolathe/ammo/rifle_short_lethal = 2,
		/datum/design/autolathe/ammo/rifle_practice = 1,
		/datum/design/autolathe/ammo/rifle_rubber = 2,
		/datum/design/autolathe/ammo/rifle = 2,
		/datum/design/autolathe/ammo/rifle_lethal = 4,
	)

/obj/item/computer_hardware/hard_drive/portable/design/guns/boltgun_sa
	disk_name = "Hunters Inc - 7.5mm Novakovic Rifle"
	icon_state = "hunters"

	license = 12
	designs = list(
		/datum/design/autolathe/gun/boltgun_sa = 3,
		/datum/design/autolathe/ammo/rifle_ammobox_small_practice = 0,
		/datum/design/autolathe/ammo/rifle_ammobox_small_rubber,
		/datum/design/autolathe/ammo/rifle_ammobox,
		/datum/design/autolathe/ammo/rifle_ammobox_small_lethal = 2,
		/datum/design/autolathe/ammo/sl_rifle,
	)

//.408 rifles

/obj/item/computer_hardware/hard_drive/portable/design/guns/hustler
	disk_name = "H&S NM - .408 Hustler Heavy Rifle"
	icon_state = "ironhammer"

	license = 12
	designs = list(
		/datum/design/autolathe/gun/omnirifle = 3,
		/datum/design/autolathe/ammo/hrifle_practice = 0,
		/datum/design/autolathe/ammo/hrifle_rubber,
		/datum/design/autolathe/ammo/hrifle,
		/datum/design/autolathe/ammo/hrifle_lethal = 2,
	)

/obj/item/computer_hardware/hard_drive/portable/design/guns/boar
	disk_name = "H&S - .408 Boar Heavy Carbine"
	icon_state = "frozenstar"

	license = 6
	designs = list(
		/datum/design/autolathe/gun/omnicarbine = 3,
		/datum/design/autolathe/gun/rds_omnicarbine = 4,
		/datum/design/autolathe/ammo/hrifle_practice = 0,
		/datum/design/autolathe/ammo/hrifle_rubber,
		/datum/design/autolathe/ammo/hrifle,
		/datum/design/autolathe/ammo/hrifle_lethal = 2,
	)

/obj/item/computer_hardware/hard_drive/portable/design/guns/sts40
	disk_name = "SA - .408 STS-40 Heavy Rifle"
	icon_state = "sa"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/sts40 = 3,
		/datum/design/autolathe/ammo/hrifle_practice = 0,
		/datum/design/autolathe/ammo/hrifle_rubber,
		/datum/design/autolathe/ammo/hrifle,
		/datum/design/autolathe/ammo/hrifle_lethal = 2,
	)


/obj/item/computer_hardware/hard_drive/portable/design/guns/scout
	disk_name = "H&S - .408 Scout Sniper Rifle"
	icon_state = "frozenstar"

	license = 6
	designs = list(
		/datum/design/autolathe/gun/scout = 3,
		/datum/design/autolathe/ammo/hrifle_ammobox_small_practice = 0,
		/datum/design/autolathe/ammo/hrifle_ammobox_small_rubber,
		/datum/design/autolathe/ammo/hrifle_ammobox_small,
		/datum/design/autolathe/ammo/hrifle_ammobox_small_lethal = 2,
		/datum/design/autolathe/ammo/hrifle_ammobox_small_hv = 3,
	)


// Heavy

/obj/item/computer_hardware/hard_drive/portable/design/guns/heavysniper
	disk_name = "SA - .60-06 Penetrator AMR"
	icon_state = "sa"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/heavysniper = 3,
		/datum/design/autolathe/ammo/antim,
		/datum/design/autolathe/ammo/box_antim = 2,
	)


/obj/item/computer_hardware/hard_drive/portable/design/guns/sa_pk
	disk_name = "SA - 7.5mm Pulemyot Kalashnikova MG"
	icon_state = "sa"

	license = 12
	designs = list(
		/datum/design/autolathe/gun/mg_pk = 3,
		/datum/design/autolathe/ammo/rifle_pk,
	)

// Grenade Launchers

obj/item/computer_hardware/hard_drive/portable/design/guns/lenar
	disk_name = "GmbH - Lenar Grenade Launcher"
	icon_state = "frozenstar"

	license = 3
	designs = list(
		/datum/design/autolathe/gun/grenade_launcher_lenar, // "FS GL \"Lenar\""
	)

obj/item/computer_hardware/hard_drive/portable/design/guns/china
	disk_name = "SA GL \"China Lake\""
	icon_state = "ironhammer"

	license = 12
	designs = list(
		/datum/design/autolathe/gun/grenade_launcher_china_lake = 3,
		/datum/design/autolathe/ammo/grenade = 1,
		/datum/design/autolathe/ammo/grenade/frag = 2,
		/datum/design/autolathe/ammo/grenade/emp = 2,
		/datum/design/autolathe/ammo/grenade/blast = 3,
		/datum/design/autolathe/ammo/grenade/flash = 2
		)

// ENERGY ARMS

/obj/item/computer_hardware/hard_drive/portable/design/guns/lasercore
	disk_name = "H&S - Laser Core PDW E"
	icon_state = "frozenstar"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/lasercore = 2,
		/datum/design/autolathe/cell/medium/high,
	)

/obj/item/computer_hardware/hard_drive/portable/design/guns/spiderrose
	disk_name = "H&S - Spider Rose PDW E"
	icon_state = "frozenstar"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/energygun = 3,
		/datum/design/autolathe/cell/medium/high,
	)

/obj/item/computer_hardware/hard_drive/portable/design/guns/martin
	disk_name = "H&S - Martin PDW E"
	icon_state = "frozenstar"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/energygun_martin = 2,
		/datum/design/autolathe/cell/small/high,
	)

/obj/item/computer_hardware/hard_drive/portable/design/guns/firestorm
	disk_name = "H&S - Firestorm PDW E"
	icon_state = "frozenstar"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/firestorm = 2,
		/datum/design/autolathe/cell/small/high,
	)

/obj/item/computer_hardware/hard_drive/portable/design/guns/lasercannon
	disk_name = "H&S - \"Titanica\" Laser Cannon"
	icon_state = "frozenstar"

	license = 8 //2 gun 2 cell,
	designs = list(
		/datum/design/autolathe/gun/titanica = 3,
		/datum/design/autolathe/cell/small/high,
	)

/obj/item/computer_hardware/hard_drive/portable/design/guns/auretian
	disk_name = "SI - \"Auretian\" E Pistol"
	icon_state = "moebius"

	license = 4 //1 gun 1 cell, or 4 good cells that are bette then normal
	designs = list(
		/datum/design/research/item/weapon/auretian = 3,
		/datum/design/research/item/powercell/small/basic,
	)

/obj/item/computer_hardware/hard_drive/portable/design/guns/stun_revolver_sci
	disk_name = "SI - \"Hera\" Stun Revolver"
	icon_state = "moebius"

	license = 8 //2 gun 2 cell, or 8 good cells that are bette then normal
	designs = list(
		/datum/design/research/item/weapon/stunrevolver = 3,
		/datum/design/research/item/powercell/small/basic,
	)

/obj/item/computer_hardware/hard_drive/portable/design/guns/stun_revolver
	disk_name = "GmbH - \"Zeus\" Stun Revolver"
	icon_state = "frozenstar"

	license = 8//2 guns 2 cells
	designs = list(
		/datum/design/autolathe/gun/revolver_taser = 2,
		/datum/design/autolathe/cell/small/high,
	)

/obj/item/computer_hardware/hard_drive/portable/design/guns/lasercannon
	disk_name = "SI - \"Solaris\" Laser Cannon"
	icon_state = "moebius"

	license = 8 //1 gun 1 cell, or 4 good cells that are bette then normal
	designs = list(
		/datum/design/research/item/weapon/lasercannon = 6,
		/datum/design/research/item/powercell/medium/basic = 2,
	)

/obj/item/computer_hardware/hard_drive/portable/design/guns/centauri
	disk_name = "SI - \"Centauri\" PDW E"
	icon_state = "moebius"

	license = 8 //2 gun 1 cell, or 4 good cells that are bette then normal
	designs = list(
		/datum/design/research/item/weapon/centauri = 3,
		/datum/design/research/item/powercell/medium/basic = 2,
	)

/obj/item/computer_hardware/hard_drive/portable/design/guns/ion_pistol
	disk_name = "GmbH - \"Aedes\" Ion Pistol"
	icon_state = "frozenstar"

	license = 6//2 guns 2 cells
	designs = list(
		/datum/design/autolathe/gun/ion_pistol = 2,
		/datum/design/autolathe/cell/medium/high,
	)

// PLASMA ARMS

/obj/item/computer_hardware/hard_drive/portable/design/guns/cassad
	disk_name = "H&S - Cassad Plasma Rifle"
	icon_state = "frozenstar"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/pulse_cassad = 4,
		/datum/design/autolathe/cell/medium/high,
	)

/obj/item/computer_hardware/hard_drive/portable/design/guns/centurio
	disk_name = "SI - \"Centurio\" Plasma Pistol"
	icon_state = "moebius"

	license = 8 //1 gun 1 cell, or 4 good cells that are bette then normal
	designs = list(
		/datum/design/research/item/weapon/centurio = 6,
		/datum/design/research/item/powercell/medium/basic = 2,
	)


//10mm Guns

/obj/item/computer_hardware/hard_drive/portable/design/guns/pulse_rifle
	disk_name = "PAR - 10mm Caseless Pulse Rifle"
	icon_state = "black"

	license = 10 //2 guns 2 mags and 1 box
	designs = list(
		/datum/design/autolathe/gun/pulse_rifle = 3,
		/datum/design/autolathe/ammo/c10x24,
		/datum/design/autolathe/ammo/box_10x24 = 2,
	)

/obj/item/computer_hardware/hard_drive/portable/design/guns/survivalrifle
	disk_name = "Hunters Inc - 10mm Caseless /'Bond/' Rifle"
	icon_state = "hunters"

	license = 10 //2 guns 2 mags and 1 box
	designs = list(
		/datum/design/autolathe/gun/survivalrifle = 3,
		/datum/design/autolathe/ammo/mag_10x24,
		/datum/design/autolathe/ammo/box_10x24 = 2,
	)

/obj/item/computer_hardware/hard_drive/portable/design/guns/rex10
	disk_name = "H&S - Cowboy Revolver"
	icon_state = "ironhammer"

	license = 12
	designs = list(
		/datum/design/autolathe/gun/rex10 = 3,
		/datum/design/autolathe/ammo/slpistol_rubber = 2,
		/datum/design/autolathe/ammo/slpistol,
		/datum/design/autolathe/ammo/slpistol_lethal,
	)

//.223 Guns

/obj/item/computer_hardware/hard_drive/portable/design/guns/laser_ak
	disk_name = "SI - \"Legkiy-Kalashnikov\" laser carbine"
	icon_state = "moebius"

	license = 22 //This is a lot by the looks but understand that each bullet prints in 1s, so 1 gun 1 mag 20 bullets
	designs = list(
		/datum/design/research/item/weapon/laser_ak,
		/datum/design/research/item/ammo/laser_mag,
		/datum/design/research/item/ammo/laser,
		/datum/design/research/item/ammo/laser/ap,
		/datum/design/research/item/ammo/laser/lethal,
	)

/obj/item/computer_hardware/hard_drive/portable/design/guns/laser_sniper
	disk_name = "SI - \"Star Striker\" laser boltgun"
	icon_state = "moebius"

	license = 31 //This is a lot by the looks but understand that each bullet prints in 1s, so 1 gun and 30 bullets (3 reloads)
	designs = list(
		/datum/design/research/item/weapon/starstriker,
		/datum/design/research/item/ammo/laser,
		/datum/design/research/item/ammo/laser/ap,
		/datum/design/research/item/ammo/laser/lethal,
	)
