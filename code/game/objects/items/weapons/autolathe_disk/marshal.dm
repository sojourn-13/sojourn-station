// Disks formated as /designpath = pointcost , if no point cost is specified it defaults to 1.
// To make a design unprotect use -1

// Marshal
/obj/item/pc_part/drive/disk/design/security
	disk_name = "Security Miscellaneous Pack"
	icon_state = "ironhammer"
	license = 20
	designs = list(
		/datum/design/research/item/flash,
		/datum/design/autolathe/sec/secflashlight,
		/datum/design/research/item/light_replacer,
		/datum/design/autolathe/sec/handcuffs,
		/datum/design/autolathe/sec/handcuffs_adv = 5,
		/datum/design/autolathe/sec/zipties = 0,
		/datum/design/autolathe/sec/electropack,
		/datum/design/autolathe/tool/tacknife,
		/datum/design/autolathe/tool/combat_shovel,
		/datum/design/autolathe/tool/militia_tomahawk,
		/datum/design/autolathe/sec/beartrap,
		/datum/design/autolathe/sec/hailer,
		/datum/design/research/item/medical/autopsy_scanner,
		/datum/design/autolathe/misc/taperecorder,
		/datum/design/autolathe/sec/silencer,
		/datum/design/autolathe/sec/acog,
		/datum/design/autolathe/gun/cop_mod = 0,
		/datum/design/autolathe/sec/auto_eject_mod,
		/datum/design/research/item/weapon/weapon_upgrade/dnalock_mod,
		/datum/design/research/item/omnitranslator_handheld,
		/datum/design/autolathe/gun/bipod_mod = 2,
		/datum/design/autolathe/gun/flare_gun = 3,
		/datum/design/autolathe/ammo/flare_shell,
		/datum/design/autolathe/ammo/flare_shell_g,
		/datum/design/autolathe/ammo/flare_shell_b,
		/datum/design/autolathe/ammo/shotgun_illumination,
		/datum/design/autolathe/sec/stunbaton = 5, //balance, we can only make 4
		/datum/design/autolathe/sec/buckler = 5,
		/datum/design/autolathe/sec/riot = 10,
		/datum/design/autolathe/sec/gun_case,
		/datum/design/autolathe/container/ammocan_ih,
		/datum/design/autolathe/container/ammocan_serb, //Moved from actual ammo disks
		/datum/design/autolathe/clothing/bmask = 10,
	)

/obj/item/pc_part/drive/disk/design/security/hos
	disk_name = "Security Miscellaneous Factory"
	license = -1

/obj/item/pc_part/drive/disk/design/security/marshal_guns
	disk_name = "Marshal \"Negotiator\" Pack"
	icon_state = "marshal"
	license = 20 //1:1 with blackshield guns
	designs = list(
		//pistol
		/datum/design/autolathe/gun/glock = 1,
		//ion
		/datum/design/autolathe/gun/ion_pistol = 5,
		//launcher
		/datum/design/autolathe/gun/grenade_launcher_lenar = 7,
		//sniper - Left here for now till Python can be made off a Mamba frame.
		/datum/design/autolathe/gun/python = 5,
		//flaregun
		/datum/design/autolathe/gun/flare_gun,
		//laser
		/datum/design/autolathe/gun/sunrise =3,
		/datum/design/autolathe/gun/peacekeeper =3,
		/datum/design/autolathe/gun/zwang =2,
		//Misc
		/datum/design/autolathe/tool/ironhammer,
		/datum/design/autolathe/sec/stunbaton/maul,
		/datum/design/autolathe/sec/buckler = 0,
		/datum/design/autolathe/sec/bastion = 0,
		/datum/design/autolathe/sec/riot,
		/datum/design/autolathe/device/landmine = 0,
		/datum/design/autolathe/container/ammocan_ih = 0,
		/datum/design/autolathe/device/smartlink = 3,
		)

/obj/item/pc_part/drive/disk/design/security/marshal_ammo
	disk_name = "Marshal \"Shoot-out\" Pack"
	icon_state = "marshal"
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
		/datum/design/autolathe/ammo/magnum_pepperball,
		/datum/design/autolathe/ammo/magnum_practice = 0,
		/datum/design/autolathe/ammo/magnum_lethal,
		/datum/design/autolathe/ammo/pistol_ammobox = 0,
		/datum/design/autolathe/ammo/pistol_ammobox_rubber,
		/datum/design/autolathe/ammo/pistol_ammobox/large,
		/datum/design/autolathe/ammo/magnum_ammobox = 0,
		/datum/design/autolathe/ammo/magnum_ammobox_rubber,
		/datum/design/autolathe/ammo/magnum_ammobox_pepperball,
		/datum/design/autolathe/ammo/magnum_ammobox_practice = 0,
		/datum/design/autolathe/ammo/magnum_ammobox/large,
		/datum/design/autolathe/ammo/kurtz_ammobox_rubber = 0,
		/datum/design/autolathe/ammo/kurtz_ammobox = 0,
		/datum/design/autolathe/ammo/kurtz_ammobox_practice = 0,
		/datum/design/autolathe/ammo/mag_10x24 = 0,
		/datum/design/autolathe/ammo/box_10x24 = 3, // Two entire mags of a Pulse Rifle, thus costs 10% of license cost. It's also armory access exclusive.
		/datum/design/autolathe/ammo/lrifle_ammobox = 1,
		/datum/design/autolathe/ammo/lrifle_ammobox_lethal = 1,
		/datum/design/autolathe/ammo/lrifle_ammobox_rubber = 0,
		/datum/design/autolathe/ammo/lrifle_ammobox_small_practice = 0,
		/datum/design/autolathe/ammo/rifle_ammobox = 1,
		/datum/design/autolathe/ammo/rifle_ammobox_lethal = 1,
		/datum/design/autolathe/ammo/rifle_pk_empty = 0,
		/datum/design/autolathe/ammo/rifle_pk,
		/datum/design/autolathe/ammo/lrifle_belt,
		/datum/design/autolathe/ammo/lrifle_belt_empty = 0,
		/datum/design/autolathe/ammo/hrifle_ammobox_linked,
		/datum/design/autolathe/ammo/hrifle_ammobox_linked_rubber,
		/datum/design/autolathe/ammo/hrifle_ammobox_linked_empty = 0,
		/datum/design/autolathe/ammo/grenade,
		/datum/design/autolathe/ammo/grenade/flash,
		/datum/design/autolathe/ammo/grenade/stinger,
		/datum/design/autolathe/ammo/flare_shell = 0,
		/datum/design/autolathe/ammo/flare_shell_g = 0,
		/datum/design/autolathe/ammo/flare_shell_b = 0,
		/datum/design/autolathe/container/ammocan_ih,
		)

// 10mm Magnum

/obj/item/pc_part/drive/disk/design/guns/judiciary
	disk_name = "NM - 9mm Judiciary"
	icon_state = "marshal"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/judiciary = 3,
		/datum/design/autolathe/ammo/pistol_practice = 0,
		/datum/design/autolathe/ammo/pistol_rubber,
		/datum/design/autolathe/ammo/pistol,
		/datum/design/autolathe/ammo/pistol_lethal =2,
	)

/obj/item/pc_part/drive/disk/design/guns/liberty
	disk_name = "NM - 10mm Liberty"
	icon_state = "marshal"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/liberty = 3,
		/datum/design/autolathe/ammo/magnum_practice = 0,
		/datum/design/autolathe/ammo/magnum_rubber,
		/datum/design/autolathe/ammo/magnum,
		/datum/design/autolathe/ammo/magnum_lethal = 2,
		)

/obj/item/pc_part/drive/disk/design/guns/freedom
	disk_name = "NM - 10mm Freedom SMG"
	icon_state = "marshal"

	license = 12
	designs = list(
		/datum/design/autolathe/gun/freedom = 4,
		/datum/design/autolathe/ammo/smg_magnum_40 = 2,
		/datum/design/autolathe/ammo/smg_magnum_40_rubber = 1,
		/datum/design/autolathe/ammo/smg_magnum_40_lethal = 3,
		/datum/design/autolathe/ammo/smg_magnum_40_practice = 0
		)

// 12mm Heavy Pistol

/obj/item/pc_part/drive/disk/design/guns/amnesty
	disk_name = "NM - 12mm Amnesty Handgun"
	icon_state = "marshal"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/amnesty = 3,
		/datum/design/autolathe/ammo/kurtz_practice = 0,
		/datum/design/autolathe/ammo/kurtz_rubber,
		/datum/design/autolathe/ammo/kurtz,
		/datum/design/autolathe/ammo/kurtz_lethal = 2,
		)

// SHOTGUNS

/obj/item/pc_part/drive/disk/design/guns/operator
	disk_name = "NM - 20mm Operator Combat Shotgun"
	icon_state = "marshal"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/opshot = 3,
		/datum/design/autolathe/ammo/shotgun_beanbag,
		/datum/design/autolathe/ammo/shotgun_blanks = 0,
		/datum/design/autolathe/ammo/shotgun_illumination,
		)

// 6.5mm carbines

/obj/item/pc_part/drive/disk/design/guns/bastard
	disk_name = "NM - 6.5mm \"Bastard\" Compact Machine Gun"
	icon_state = "marshal"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/bastard = 3,
		/datum/design/autolathe/ammo/lrifle_belt,
		/datum/design/autolathe/ammo/lrifle_belt_empty = 0,
	)

/obj/item/pc_part/drive/disk/design/guns/mamba
	disk_name = "NM - 6.5mm Mamba Carbine"
	icon_state = "marshal"

	license = 16
	designs = list(
		/datum/design/autolathe/gun/mamba = 6,
		/datum/design/autolathe/ammo/lrifle_short_practice = 0,
		/datum/design/autolathe/ammo/lrifle_short_rubber,
		/datum/design/autolathe/ammo/lrifle_short,
		/datum/design/autolathe/ammo/lrifle_short_lethal = 2,
		/datum/design/autolathe/ammo/lrifle_practice = 1,
		/datum/design/autolathe/ammo/lrifle_rubber = 2,
		/datum/design/autolathe/ammo/lrifle = 2,
		/datum/design/autolathe/ammo/lrifle_lethal = 4,
	)

// 7.62mm Rifles

/obj/item/pc_part/drive/disk/design/guns/copperhead
	disk_name = "NM - 7.62mm Copperhead Rifle"
	icon_state = "marshal"

	license = 16
	designs = list(
		/datum/design/autolathe/gun/copperhead = 6,
		/datum/design/autolathe/ammo/rifle_short_practice = 0,
		/datum/design/autolathe/ammo/rifle_short_rubber,
		/datum/design/autolathe/ammo/rifle_short,
		/datum/design/autolathe/ammo/rifle_short_lethal = 2,
		/datum/design/autolathe/ammo/rifle_practice = 1,
		/datum/design/autolathe/ammo/rifle_rubber = 2,
		/datum/design/autolathe/ammo/rifle = 2,
		/datum/design/autolathe/ammo/rifle_lethal = 4,
	)

/obj/item/pc_part/drive/disk/design/guns/viper
	disk_name = "NM - 7.62mm Viper DMR"
	icon_state = "marshal"

	license = 16
	designs = list(
		/datum/design/autolathe/gun/viper = 6,
		/datum/design/autolathe/ammo/rifle_short_practice = 0,
		/datum/design/autolathe/ammo/rifle_short_rubber,
		/datum/design/autolathe/ammo/rifle_short,
		/datum/design/autolathe/ammo/rifle_short_lethal = 2,
		/datum/design/autolathe/ammo/rifle_practice = 1,
		/datum/design/autolathe/ammo/rifle_rubber = 2,
		/datum/design/autolathe/ammo/rifle = 2,
		/datum/design/autolathe/ammo/rifle_lethal = 4,
	)

// 8.6 Rifles
/obj/item/pc_part/drive/disk/design/guns/python
	disk_name = "NM - 7.62mm Python Heavy Rifle"
	icon_state = "marshal"

	license = 16
	designs = list(
		/datum/design/autolathe/gun/python = 6,
		/datum/design/autolathe/ammo/rifle_short_practice = 0,
		/datum/design/autolathe/ammo/rifle_short_rubber,
		/datum/design/autolathe/ammo/rifle_short,
		/datum/design/autolathe/ammo/rifle_short_lethal = 2,
		/datum/design/autolathe/ammo/rifle_practice = 1,
		/datum/design/autolathe/ammo/rifle_rubber = 2,
		/datum/design/autolathe/ammo/rifle = 2,
		/datum/design/autolathe/ammo/rifle_lethal = 4,
	)

//10mm Guns

/obj/item/pc_part/drive/disk/design/guns/specop
	disk_name = "NM - 10x24mm Caseless /'Spec-Op/' SMG"
	icon_state = "marshal"

	license = 10 //2 guns 2 mags and 1 box
	designs = list(
		/datum/design/autolathe/gun/specop = 3,
		/datum/design/autolathe/ammo/mag_10x24,
		/datum/design/autolathe/ammo/box_10x24_small = 1,
	)

// Laser

/obj/item/pc_part/drive/disk/design/guns/sunrise
	disk_name = "NM - \"Sunrise\" Laser SMG"
	icon_state = "marshal"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/sunrise = 3,
		/datum/design/autolathe/cell/medium/high,
	)
