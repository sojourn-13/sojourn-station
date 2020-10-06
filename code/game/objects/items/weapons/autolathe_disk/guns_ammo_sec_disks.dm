// Disks formated as /designpath = pointcost , if no point cost is specified it defaults to 1.
// To make a design unprotect use -1
// Marshal
/obj/item/weapon/computer_hardware/hard_drive/portable/design/security
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
		/datum/design/autolathe/sec/beartrap,
		/datum/design/autolathe/sec/silencer,
		/datum/design/autolathe/sec/gun_case,
		/datum/design/research/item/light_replacer,
		/datum/design/autolathe/sec/hailer,
		/datum/design/research/item/medical/autopsy_scanner,
	)

/obj/item/weapon/computer_hardware/hard_drive/portable/design/security/hos
	disk_name = "Security Miscellaneous Factory"
	license = -1


//Blackshield
/obj/item/weapon/computer_hardware/hard_drive/portable/design/blackshield
	disk_name = "Blackshield 'Shall-not-be-Infringed' Pack"
	icon_state = "onestar"
	license = 20

	designs = list(
		/datum/design/autolathe/gun/ten_dark,
		/datum/design/autolathe/gun/ladon,
 		/datum/design/autolathe/gun/naga,
		/datum/design/autolathe/gun/omnirifle,//rifles
		/datum/design/autolathe/gun/standard_omnirifle,
		/datum/design/autolathe/gun/omnicarbine,
		/datum/design/autolathe/gun/sts40,
		/datum/design/autolathe/gun/rds_omnicarbine,
		)

/obj/item/weapon/computer_hardware/hard_drive/portable/design/blackshieldammo
	disk_name = "Blackshield Ammo Sovereignty Pack"
	icon_state = "onestar"
	license = 30

	designs = list(

		/datum/design/autolathe/ammo/pistol_practice = 0,
		/datum/design/autolathe/ammo/smg,
		/datum/design/autolathe/ammo/smg_rubber,
		/datum/design/autolathe/ammo/smg_practice = 0,
		/datum/design/autolathe/ammo/magnum,
		/datum/design/autolathe/ammo/magnum_rubber,
		/datum/design/autolathe/ammo/magnum_practice = 0,
		/datum/design/autolathe/ammo/magnum_lethal,
		/datum/design/autolathe/ammo/hrifle,
		/datum/design/autolathe/ammo/hrifle_rubber,
		/datum/design/autolathe/ammo/hrifle_practice,
		/datum/design/autolathe/ammo/hrifle_lethal,
		/datum/design/autolathe/ammo/lrifle,
		/datum/design/autolathe/ammo/lrifle_short_rubber,
		/datum/design/autolathe/ammo/lrifle_short_practice = 0,
		/datum/design/autolathe/ammo/pistol_ammobox,
		/datum/design/autolathe/ammo/pistol_ammobox_rubber,
		/datum/design/autolathe/ammo/magnum_ammobox,
		/datum/design/autolathe/ammo/magnum_ammobox_rubber,
		/datum/design/autolathe/ammo/magnum_ammobox_practice = 0,
		/datum/design/autolathe/ammo/lrifle_ammobox,
		/datum/design/autolathe/ammo/lrifle_ammobox_rubber,
		/datum/design/autolathe/ammo/hrifle_ammobox,
		/datum/design/autolathe/ammo/hrifle_ammobox_lethal,
		/datum/design/autolathe/ammo/hrifle_ammobox_rubber,
		/datum/design/autolathe/ammo/hrifle_ammobox_practice = 0,
		)


// Magazines and ammo

/obj/item/weapon/computer_hardware/hard_drive/portable/design/nonlethal_ammo //please, maintain general order (pistol>speedloaders>smg>other>shells)+(smaller/less damaging caliber>bigger/more damaging caliber)
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
		/datum/design/autolathe/ammo/shotgun_flash,
	)

/obj/item/weapon/computer_hardware/hard_drive/portable/design/lethal_ammo //please, maintain general order (pistol>speedloaders>smg>other>shells)+(smaller/less damaging caliber>bigger/more damaging caliber)
	disk_name = "SA Lethal Magazines Pack"
	icon_state = "black"

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
		/datum/design/autolathe/ammo/rifle,
		/datum/design/autolathe/ammo/lrifle_short,
		/datum/design/autolathe/ammo/rifle_short,
		/datum/design/autolathe/ammo/lrifle_ammobox_small_lethal,
		/datum/design/autolathe/ammo/lrifle_ammobox_small,
		/datum/design/autolathe/ammo/rifle_lethal,
		/datum/design/autolathe/ammo/lrifle_short_lethal,
		/datum/design/autolathe/ammo/rifle_short_lethal,
		//shells
		/datum/design/autolathe/ammo/shotgun_pellet,
		/datum/design/autolathe/ammo/shotgun,
	)

/obj/item/weapon/computer_hardware/hard_drive/portable/design/ammo_boxes_smallarms
	disk_name = "SA Handgun Ammunition"
	icon_state = "black"

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
	)

/obj/item/weapon/computer_hardware/hard_drive/portable/design/ammo_boxes_rifle
	disk_name = "SA Rifle Ammunition"
	icon_state = "black"

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
	)


/obj/item/weapon/computer_hardware/hard_drive/portable/design/exotic_ammo
	disk_name = "SA Exotic Ammunition Pack"
	icon_state = "black"
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
		/datum/design/autolathe/ammo/shotgun,
		/datum/design/autolathe/ammo/shotgun_pellet,
		/datum/design/autolathe/ammo/shotgun_beanbag,
		/datum/design/autolathe/ammo/box_10x24 = 5,
		/datum/design/autolathe/ammo/box_antim = 5,
		)

// G U N S (minus excelsior and research)
// Pack is used when there is more than one gun on the disk

// .35 PISTOLS + REVOLVERS

/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/cheap_guns
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
		)


/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/colt
	disk_name = "SA - .35 M1911"
	icon_state = "black"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/colt = 3,
		/datum/design/autolathe/ammo/pistol_practice = 0,
		/datum/design/autolathe/ammo/pistol_rubber,
		/datum/design/autolathe/ammo/pistol,
		/datum/design/autolathe/ammo/pistol_lethal = 2,
	)


/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/firefly
	disk_name = "H&S - .35 Firefly Pistol"
	icon_state = "frozenstar"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/firefly = 3,
		/datum/design/autolathe/ammo/hpistol_practice = 0,
		/datum/design/autolathe/ammo/hpistol_rubber,
		/datum/design/autolathe/ammo/hpistol,
		/datum/design/autolathe/ammo/hpistol_lethal = 2,
	)

// .40 REVOLVERS

/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/revolver
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


/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/revolver_mateba
	disk_name = "SA - .50 Kurtz Mateba Revolver"
	icon_state = "black"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/revolver/mateba = 3,
		/datum/design/autolathe/ammo/slkurtz_practice = 0,
		/datum/design/autolathe/ammo/slkurtz_rubber,
		/datum/design/autolathe/ammo/slkurtz,
		/datum/design/autolathe/ammo/slkurtz_lethal = 2,
		)

// .40 pistols

/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/ladon
	disk_name = "H&S - .40 Auto-Mag Ladon Handgun"
	icon_state = "frozenstar"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/ladon_hs = 3,
		/datum/design/autolathe/ammo/magnum_practice = 0,
		/datum/design/autolathe/ammo/magnum_rubber,
		/datum/design/autolathe/ammo/magnum,
		/datum/design/autolathe/ammo/magnum_lethal = 2,
		)

/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/ladon/sa
	disk_name = "SA - .40 Auto-Mag Ladon Handgun"
	icon_state = "black"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/ladon_sa = 3,
		/datum/design/autolathe/ammo/magnum_practice = 0,
		/datum/design/autolathe/ammo/magnum_rubber,
		/datum/design/autolathe/ammo/magnum,
		/datum/design/autolathe/ammo/magnum_lethal = 2,
		)

/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/ladon/dark
	disk_name = ".40 Auto-Mag Ladon Handgun"
	icon_state = "onestar"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/ladon = 3,
		/datum/design/autolathe/ammo/magnum_practice = 0,
		/datum/design/autolathe/ammo/magnum_rubber,
		/datum/design/autolathe/ammo/magnum,
		/datum/design/autolathe/ammo/magnum_lethal = 2,
		)

/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/colt/ten
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

/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/rafale
	disk_name = "SM - .40 Auto-Mag Rafale"
	icon_state = "frozenstar"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/rafale = 3,
		/datum/design/autolathe/ammo/magnum_practice = 0,
		/datum/design/autolathe/ammo/magnum_rubber,
		/datum/design/autolathe/ammo/magnum,
		/datum/design/autolathe/ammo/magnum_lethal = 2,
		)

// .50 PISTOLS

/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/lamia
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

/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/basilisk
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

/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/naga
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

/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/akurra
	disk_name = "SA - .50 Akurra Silenced Handgun"
	icon_state = "black"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/akurra = 3,
		/datum/design/autolathe/ammo/kurtz_practice = 0,
		/datum/design/autolathe/ammo/kurtz_rubber,
		/datum/design/autolathe/ammo/kurtz,
		/datum/design/autolathe/ammo/kurtz_lethal = 2,
		)

// SHOTGUNS

/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/doublebarrel
	disk_name = "SA - 20mm Double Barrel Shotgun"
	icon_state = "black"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/doublebarrel = 3,
		/datum/design/autolathe/ammo/shotgun_beanbag,
		/datum/design/autolathe/ammo/shotgun_blanks = 0,
		/datum/design/autolathe/ammo/shotgun_flash,
		)

/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/grizzly
	disk_name = "SA - 20mm Grizly Shotgun"
	icon_state = "black"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/pump_shotgun = 3,
		/datum/design/autolathe/ammo/shotgun_beanbag,
		/datum/design/autolathe/ammo/shotgun_blanks = 0,
		/datum/design/autolathe/ammo/shotgun_flash,
		)

/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/sbaw
	disk_name = "20mm SBAW disk"
	icon_state = "black"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/sbaw = 3,
		/datum/design/autolathe/ammo/sbaw_slug,
		/datum/design/autolathe/ammo/sbaw_pellet,
		/datum/design/autolathe/ammo/sbaw_beanbag,
		/datum/design/autolathe/ammo/sbaw_payload = 3,
		)

/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/gladstone
	disk_name = "H&S - 20mm Gladstone Shotgun"
	icon_state = "frozenstar"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/gladstone = 3,
		/datum/design/autolathe/ammo/shotgun_beanbag,
		/datum/design/autolathe/ammo/shotgun_blanks = 0,
		/datum/design/autolathe/ammo/shotgun_flash,
		)

/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/pug
	disk_name = "SA - 20mm Pug Auto Shotgun"
	icon_state = "black"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/pug = 3,
		/datum/design/autolathe/ammo/m12beanbag, // Never add tazershells, for love of god
		/datum/design/autolathe/ammo/m12pellet,
		/datum/design/autolathe/ammo/m12slug,
		)

// SMGs

/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/wirbelwind
	disk_name = "SM - .35 Wirbelwind SMG"
	icon_state = "frozenstar"

	license = 12
	designs = list(
		/datum/design/autolathe/gun/wirbelwind = 3,
		/datum/design/autolathe/ammo/smg_practice = 0,
		/datum/design/autolathe/ammo/smg_rubber,
		/datum/design/autolathe/ammo/smg,
		/datum/design/autolathe/ammo/smg_lethal = 0,
	)

/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/straylight
	disk_name = "H&S - .35 Straylight SMG"
	icon_state = "frozenstar"

	license = 12
	designs = list(
		/datum/design/autolathe/gun/straylight = 3,
		/datum/design/autolathe/ammo/smg_practice = 0,
		/datum/design/autolathe/ammo/smg_rubber,
		/datum/design/autolathe/ammo/smg,
		/datum/design/autolathe/ammo/smg_lethal = 0,
	)

/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/texan
	disk_name = "SA - .35 Texan SMG"
	icon_state = "black"

	license = 12
	designs = list(
		/datum/design/autolathe/gun/texan = 3,
		/datum/design/autolathe/ammo/smg_practice = 0,
		/datum/design/autolathe/ammo/smg_rubber,
		/datum/design/autolathe/ammo/smg,
		/datum/design/autolathe/ammo/smg_lethal = 0,
	)

/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/mac
	disk_name = "SA - .35 MAC SMG"
	icon_state = "frozenstar"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/mac = 3,
		/datum/design/autolathe/ammo/smg_practice = 0,
		/datum/design/autolathe/ammo/smg_rubber,
		/datum/design/autolathe/ammo/smg,
		/datum/design/autolathe/ammo/smg_lethal = 0,
	)

// .257 carbines

/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/pitbull
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

/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/ostwind
	disk_name = "SM - .257 Ostwind Carbine"
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


/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/bulldog
	disk_name = "H&S - .257 Bulldog Carbine"
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

/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/sa_kalashnikov
	disk_name = "SA - .257 Kalashnikov Rifle"
	icon_state = "black"

	license = 16
	designs = list(
		/datum/design/autolathe/gun/ak47_sa = 6,
		/datum/design/autolathe/ammo/lrifle_short_practice = 0,
		/datum/design/autolathe/ammo/lrifle_short_rubber,
		/datum/design/autolathe/ammo/lrifle_short,
		/datum/design/autolathe/ammo/lrifle_short_lethal = 2,
		/datum/design/autolathe/ammo/lrifle_practice = 1,
		/datum/design/autolathe/ammo/lrifle_rubber = 2,
		/datum/design/autolathe/ammo/lrifle = 2,
		/datum/design/autolathe/ammo/lrifle_lethal = 4,
	)

/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/saw
	disk_name = "SA - .257 Pegasus LMG"
	icon_state = "black"

	license = 8 //So we can print 2 and some ammo
	designs = list(
		/datum/design/autolathe/gun/saw = 3,
		/datum/design/autolathe/ammo/lrifle_ammobox = 2,
		/datum/design/autolathe/ammo/lrifle_belt, //This is its linked ammo
		/datum/design/autolathe/ammo/lrifle_ammobox_small_practice = 0,
		/datum/design/autolathe/ammo/lrifle_ammobox_rubber,
	)

/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/sika
	disk_name = "SA - .257 Sika Rifle"
	icon_state = "black"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/sika = 3,
		/datum/design/autolathe/ammo/lrifle_ammobox_small_practice = 0,
		/datum/design/autolathe/ammo/lrifle_ammobox_small_rubber,
		/datum/design/autolathe/ammo/lrifle_ammobox,
		/datum/design/autolathe/ammo/lrifle_ammobox_small_lethal = 2,
	)

/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/roe
	disk_name = "H&S - .257 Roe Rifle"
	icon_state = "frozenstar"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/roe =  3,
		/datum/design/autolathe/ammo/lrifle_ammobox_small_practice = 0,
		/datum/design/autolathe/ammo/lrifle_ammobox_small_rubber,
		/datum/design/autolathe/ammo/lrifle_ammobox,
		/datum/design/autolathe/ammo/lrifle_ammobox_small_lethal = 2,
	)


// 7.5 Rifles

/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/boltgun_sa
	disk_name = "SA - 7.5mm Novakovic Rifle"
	icon_state = "black"

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

/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/hustler
	disk_name = "SA - .408 Hustler Heavy Rifle"
	icon_state = "black"

	license = 12
	designs = list(
		/datum/design/autolathe/gun/omnirifle = 3,
		/datum/design/autolathe/ammo/hrifle_practice = 0,
		/datum/design/autolathe/ammo/hrifle_rubber,
		/datum/design/autolathe/ammo/hrifle,
		/datum/design/autolathe/ammo/hrifle_lethal = 2,
	)

/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/boar
	disk_name = "H&S - .408 Boar Heavy Carbine"
	icon_state = "frozenstar"

	license = 6
	designs = list(
		/datum/design/autolathe/gun/omnicarbine = 3,
		/datum/design/autolathe/ammo/hrifle_practice = 0,
		/datum/design/autolathe/ammo/hrifle_rubber,
		/datum/design/autolathe/ammo/hrifle,
		/datum/design/autolathe/ammo/hrifle_lethal = 2,,
	)

/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/sts40
	disk_name = "SA - .408 STS-40 Heavy Rifle"
	icon_state = "black"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/sts40 = 3,
		/datum/design/autolathe/ammo/hrifle_practice = 0,
		/datum/design/autolathe/ammo/hrifle_rubber,
		/datum/design/autolathe/ammo/hrifle,
		/datum/design/autolathe/ammo/hrifle_lethal = 2,
	)


/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/scout
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

/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/heavysniper
	disk_name = "SA - .60-06 Penetrator AMR"
	icon_state = "black"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/heavysniper = 3,
		/datum/design/autolathe/ammo/antim,
		/datum/design/autolathe/ammo/box_antim = 2,
	)


/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/sa_pk
	disk_name = "SA - 7.5mm Pulemyot Kalashnikova MG"
	icon_state = "black"

	license = 12
	designs = list(
		/datum/design/autolathe/gun/mg_pk = 3,
		/datum/design/autolathe/ammo/rifle_pk,
	)

// Grenade Launchers

/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/protector
	disk_name = "SA - Grenade Launcher"
	icon_state = "black"

	license = 3
	designs = list(
		/datum/design/autolathe/gun/grenade_launcher, // "NT GL \"Protector\""
	)

obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/lenar
	disk_name = "H&S - Lenar Grenade Launcher"
	icon_state = "frozenstar"

	license = 3
	designs = list(
		/datum/design/autolathe/gun/grenade_launcher_lenar, // "FS GL \"Lenar\""
	)

// ENERGY SMALL ARMS

/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/spiderrose
	disk_name = "H&S - Spider Rose PDW E"
	icon_state = "frozenstar"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/energygun = 3,
		/datum/design/autolathe/cell/medium/high,
	)

/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/martin
	disk_name = "H&S - Martin PDW E"
	icon_state = "frozenstar"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/energygun_martin = 2,
		/datum/design/autolathe/cell/small/high,
	)

// PLASMA ARMS

/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/cassad
	disk_name = "H&S - Cassad Plasma Rifle"
	icon_state = "frozenstar"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/pulse_cassad = 4,
		/datum/design/autolathe/cell/medium/high,
	)

//Pulse Rifle

/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/pulse_rifle
	disk_name = "PAR - 10mm Caseless Pulse Rifle"
	icon_state = "black"

	license = 10 //2 guns 2 mags and 1 box
	designs = list(
		/datum/design/autolathe/gun/pulse_rifle = 3,
		/datum/design/autolathe/ammo/c10x24,
		/datum/design/autolathe/ammo/box_10x24 = 2,
	)
