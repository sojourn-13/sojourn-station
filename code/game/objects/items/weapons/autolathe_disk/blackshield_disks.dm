//Blackshield
/obj/item/pc_part/drive/disk/design/blackshield
	disk_name = ""
	name = "Blackshield 'Shall-not-be-Infringed' Pack"
	icon_state = "blackshield"
	license = 20

	designs = list(
		/datum/design/autolathe/gun/ladon,
		//SMGs
		/datum/design/autolathe/gun/ppv = 3,
		/datum/design/autolathe/gun/triage = 3,
		//rifles
		/datum/design/autolathe/gun/watchtower = 3,
		/datum/design/autolathe/gun/sol = 3,
		/datum/design/autolathe/gun/omnirifle = 4,
		/datum/design/autolathe/gun/rds_omnicarbine = 5,
		//shotguns
		/datum/design/autolathe/gun/bounty_lever = 3,
		/datum/design/autolathe/gun/hustler = 5,
		//machinegun
		/datum/design/autolathe/gun/heroic = 6,
		//grenade launcher
		/datum/design/autolathe/gun/grenade_launcher_china_lake = 4,
		//Frames
		/datum/design/autolathe/gun_frame/discountnordwind,
		/datum/design/autolathe/gun_frame/omni = 2,
		/datum/design/autolathe/gun_frame/dp = 4,
		//Misc
		/datum/design/autolathe/device/landmine = 0,
		/datum/design/autolathe/container/ammocan_ih = 0,
		)

/obj/item/pc_part/drive/disk/design/blackshieldammo
	name = "Blackshield Ammo Sovereignty Pack"
	disk_name = ""
	icon_state = "blackshield"
	license = 30

	designs = list(
		//Magazines
		/datum/design/autolathe/ammo/pistol,
		/datum/design/autolathe/ammo/pistol_lethal,
		/datum/design/autolathe/ammo/pistol_rubber,
		/datum/design/autolathe/ammo/pistol_practice = 0,
		/datum/design/autolathe/ammo/pistol_35_drum,
		/datum/design/autolathe/ammo/pistol_35_drum/lethal,
		/datum/design/autolathe/ammo/pistol_35_drum/rubber,
		/datum/design/autolathe/ammo/pistol_35_drum/empty = 0,
		/datum/design/autolathe/ammo/smg,
		/datum/design/autolathe/ammo/smg_rubber,
		/datum/design/autolathe/ammo/smg_practice = 0,
		/datum/design/autolathe/ammo/magnum,
		/datum/design/autolathe/ammo/magnum_lethal,
		/datum/design/autolathe/ammo/magnum_rubber,
		/datum/design/autolathe/ammo/magnum_practice = 0,
		/datum/design/autolathe/ammo/kurtz,
		/datum/design/autolathe/ammo/kurtz_lethal,
		/datum/design/autolathe/ammo/kurtz_rubber,
		/datum/design/autolathe/ammo/kurtz_practice = 0,
		/datum/design/autolathe/ammo/sbaw_empty = 0,
		/datum/design/autolathe/ammo/sbaw_beanbag,
		/datum/design/autolathe/ammo/sbaw_pellet,
		/datum/design/autolathe/ammo/sbaw_slug,
		/datum/design/autolathe/ammo/m12empty = 1,
		/datum/design/autolathe/ammo/m12beanbag = 2,
		/datum/design/autolathe/ammo/m12pellet = 2,
		/datum/design/autolathe/ammo/m12slug = 2,
		/datum/design/autolathe/ammo/shotgun_box = 3, //Might want to up these, but really only a ten point difference from the other disk.
		/datum/design/autolathe/ammo/shotgun_pellet_box = 3,
		/datum/design/autolathe/ammo/lrifle,
		/datum/design/autolathe/ammo/lrifle_rubber,
		/datum/design/autolathe/ammo/lrifle_practice = 0,
		/datum/design/autolathe/ammo/sl_rifle,
		/datum/design/autolathe/ammo/rifle_short,
		/datum/design/autolathe/ammo/rifle_short_lethal,
		/datum/design/autolathe/ammo/rifle,
		/datum/design/autolathe/ammo/rifle_lethal,
		/datum/design/autolathe/ammo/rifle_practice = 0,
		/datum/design/autolathe/ammo/hrifle,
		/datum/design/autolathe/ammo/hrifle_lethal,
		/datum/design/autolathe/ammo/hrifle_rubber,
		/datum/design/autolathe/ammo/hrifle_practice = 0,
		/datum/design/autolathe/ammo/hrifle_drum = 2,
		/datum/design/autolathe/ammo/hrifle_drum_empty = 1,
		//Boxes
		/datum/design/autolathe/ammo/pistol_ammobox,
		/datum/design/autolathe/ammo/pistol_ammobox_rubber,
		/datum/design/autolathe/ammo/pistol_ammobox/large,
		/datum/design/autolathe/ammo/magnum_ammobox,
		/datum/design/autolathe/ammo/magnum_ammobox_rubber,
		/datum/design/autolathe/ammo/magnum_ammobox/large,
		/datum/design/autolathe/ammo/magnum_ammobox_practice = 0,
		/datum/design/autolathe/ammo/kurtz_ammobox,
		/datum/design/autolathe/ammo/kurtz_ammobox_lethal,
		/datum/design/autolathe/ammo/kurtz_ammobox_practice = 0,
		/datum/design/autolathe/ammo/rifle_ammobox,
		/datum/design/autolathe/ammo/rifle_ammobox_lethal,
		/datum/design/autolathe/ammo/rifle_pk,
		/datum/design/autolathe/ammo/rifle_pk_empty = 0,
		/datum/design/autolathe/ammo/lrifle_belt,
		/datum/design/autolathe/ammo/lrifle_belt_empty = 0,
		/datum/design/autolathe/ammo/lrifle_ammobox,
		/datum/design/autolathe/ammo/lrifle_ammobox_rubber,
		/datum/design/autolathe/ammo/rifle_ammobox,
		/datum/design/autolathe/ammo/rifle_ammobox_lethal,
		/datum/design/autolathe/ammo/hrifle_ammobox,
		/datum/design/autolathe/ammo/hrifle_ammobox_lethal,
		/datum/design/autolathe/ammo/hrifle_ammobox_rubber,
		/datum/design/autolathe/ammo/hrifle_ammobox_practice = 0,
		/datum/design/autolathe/ammo/hrifle_ammobox_linked,
		/datum/design/autolathe/ammo/hrifle_ammobox_linked_rubber,
		/datum/design/autolathe/ammo/hrifle_ammobox_linked_lethal,
		/datum/design/autolathe/ammo/hrifle_ammobox_linked_empty = 0,
		/datum/design/autolathe/ammo/grenade,
		/datum/design/autolathe/ammo/grenade/frag,
		/datum/design/autolathe/ammo/grenade/blast,
		/datum/design/autolathe/ammo/grenade/flash,
		//Utility
		/datum/design/autolathe/ammo/flare_shell = 0,
		/datum/design/autolathe/ammo/flare_shell_g = 0,
		/datum/design/autolathe/ammo/flare_shell_b = 0,
		/datum/design/autolathe/container/ammocan_ih,
		)

/obj/item/pc_part/drive/disk/design/blackshield/luger
	name = "No-Publisher 9mm \"Vintovka Lyugera\" carbine"
	disk_name = ""
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

/obj/item/pc_part/drive/disk/design/blackshield/semyonovich
	name = "NM - 9mm PPV \"Semyonovich\""
	disk_name = ""
	icon_state = "blackshield"
	license = 8

	designs = list(
		/datum/design/autolathe/gun/ppv = 3,
		/datum/design/autolathe/ammo/pistol_35_drum,
		/datum/design/autolathe/ammo/pistol_35_drum/empty = 0,
		/datum/design/autolathe/ammo/pistol_35_drum/rubber,
		/datum/design/autolathe/ammo/pistol_35_drum/lethal = 2
		)

/obj/item/pc_part/drive/disk/design/blackshield/triage
	name = "NM - 10mm Triage SMG"
	disk_name = ""
	icon_state = "blackshield"

	license = 12
	designs = list(
		/datum/design/autolathe/gun/triage = 4,
		/datum/design/autolathe/ammo/smg_magnum_40 = 2,
		/datum/design/autolathe/ammo/smg_magnum_40_rubber = 1,
		/datum/design/autolathe/ammo/smg_magnum_40_lethal = 3,
		/datum/design/autolathe/ammo/smg_magnum_40_practice = 0
		)

/obj/item/pc_part/drive/disk/design/blackshield/watchtower
	name = "NM - 7.62mm \"Watchtower\""
	disk_name = ""
	icon_state = "blackshield"
	license = 8

	designs = list(
		/datum/design/autolathe/gun/watchtower = 3,
		/datum/design/autolathe/ammo/rifle,
		/datum/design/autolathe/ammo/rifle_rubber,
		/datum/design/autolathe/ammo/rifle_practice = 0,
		/datum/design/autolathe/ammo/rifle_lethal = 2
		)

/obj/item/pc_part/drive/disk/design/blackshield/dp
	name = "NM - \"Pulemyot Degtyaryova\" LMG"
	disk_name = ""
	icon_state = "blackshield"
	license = 8

	designs = list(
		/datum/design/autolathe/gun/dp = 3,
		/datum/design/autolathe/ammo/maxim = 1
		)

/obj/item/pc_part/drive/disk/design/blackshield/duty
	name = "NM - 6.5mm Duty Carbine"
	disk_name = ""
	icon_state = "blackshield"

	license = 16
	designs = list(
		/datum/design/autolathe/gun/duty = 6,
		/datum/design/autolathe/ammo/lrifle_short_practice = 0,
		/datum/design/autolathe/ammo/lrifle_short_rubber,
		/datum/design/autolathe/ammo/lrifle_short,
		/datum/design/autolathe/ammo/lrifle_short_lethal = 2,
		/datum/design/autolathe/ammo/lrifle_practice = 1,
		/datum/design/autolathe/ammo/lrifle_rubber = 2,
		/datum/design/autolathe/ammo/lrifle = 2,
		/datum/design/autolathe/ammo/lrifle_lethal = 4,
		/datum/design/autolathe/ammo/lrifle_speed_loader
	)

/obj/item/pc_part/drive/disk/design/blackshield/bounty_lever
	name = "NM - 20mm Bounty Lever Shotgun"
	disk_name = ""
	icon_state = "blackshield"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/bounty_lever = 3,
		/datum/design/autolathe/ammo/shotgun_beanbag,
		/datum/design/autolathe/ammo/shotgun_blanks = 0,
		/datum/design/autolathe/ammo/shotgun_illumination
		)

/obj/item/pc_part/drive/disk/design/blackshield/heroic
	name = "NM - 7.62 Heroic LMG"
	disk_name = ""
	icon_state = "blackshield"

	license = 8
	designs = list(
		/obj/item/gun/projectile/automatic/lmg/heroic = 3,
		/datum/design/autolathe/ammo/rifle_pk,
		/datum/design/autolathe/ammo/rifle_pk_empty = 0,
	)
