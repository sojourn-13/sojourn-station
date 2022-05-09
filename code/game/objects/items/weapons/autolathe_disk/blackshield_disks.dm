//Blackshield
/obj/item/computer_hardware/hard_drive/portable/design/blackshield
	disk_name = ""
	name = "Blackshield 'Shall-not-be-Infringed' Pack"
	icon_state = "blackshield"
	license = 20

	designs = list(
		/datum/design/autolathe/gun/ten_dark,
		/datum/design/autolathe/gun/NM_colt,
		/datum/design/autolathe/gun/ladon = 2,
		/datum/design/autolathe/gun/naga = 2,
		//SMGs
		/datum/design/autolathe/gun/greasegun = 2,
		/datum/design/autolathe/gun/buckler = 3,
		/datum/design/autolathe/gun/triage = 3,
		//rifles
		/datum/design/autolathe/gun/boltgun_sa = 0,
		/datum/design/autolathe/gun/zatvor,
		/datum/design/autolathe/gun/roe = 2,
		/datum/design/autolathe/gun/sol = 3,
		/datum/design/autolathe/gun/omnirifle = 2,
		/datum/design/autolathe/gun/standard_omnirifle,
		/datum/design/autolathe/gun/omnicarbine,
		/datum/design/autolathe/gun/rds_omnicarbine = 2,
		/datum/design/autolathe/gun/strelki = 2,
		/datum/design/autolathe/gun/watchtower = 3,
		/datum/design/autolathe/gun/rushing_bull = 4,
		/datum/design/autolathe/gun/duty = 3,
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
	name = ""
	disk_name = "Blackshield Ammo Sovereignty Pack"
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

/obj/item/computer_hardware/hard_drive/portable/design/blackshield/luger
	name = ""
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

/obj/item/computer_hardware/hard_drive/portable/design/blackshield/NM_colt
	name = ""
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

/obj/item/computer_hardware/hard_drive/portable/design/blackshield/semyonovich
	name = ""
	disk_name = "Blackshield .35 Auto \"Semyonovich\""
	icon_state = "blackshield"
	license = 8

	designs = list(
		/datum/design/autolathe/gun/ppv = 3,
		/datum/design/autolathe/ammo/pistol_35_drum,
		/datum/design/autolathe/ammo/pistol_35_drum/empty = 0,
		/datum/design/autolathe/ammo/pistol_35_drum/rubber,
		/datum/design/autolathe/ammo/pistol_35_drum/lethal = 2
		)


/obj/item/computer_hardware/hard_drive/portable/design/blackshield/greasegun
	name = ""
	disk_name = "Blackshield - .35 Auto \"Grease Gun\""
	icon_state = "blackshield"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/greasegun = 3,
		/datum/design/autolathe/ammo/smg_practice = 0,
		/datum/design/autolathe/ammo/smg_rubber,
		/datum/design/autolathe/ammo/smg,
		/datum/design/autolathe/ammo/smg_lethal = 2
	)

/obj/item/computer_hardware/hard_drive/portable/design/blackshield/buckler
	name = ""
	disk_name = "Blackshield - .35 Buckler SMG"
	icon_state = "blackshield"

	license = 12
	designs = list(
		/datum/design/autolathe/gun/buckler = 3,
		/datum/design/autolathe/ammo/smg_practice = 0,
		/datum/design/autolathe/ammo/smg_rubber,
		/datum/design/autolathe/ammo/smg,
		/datum/design/autolathe/ammo/smg_lethal = 2
	)

/obj/item/computer_hardware/hard_drive/portable/design/blackshield/triage
	name = ""
	disk_name = "Blackshield - .40 Triage SMG"
	icon_state = "blackshield"

	license = 12
	designs = list(
		/datum/design/autolathe/gun/triage = 4,
		/datum/design/autolathe/ammo/smg_magnum_40 = 2,
		/datum/design/autolathe/ammo/smg_magnum_40_rubber = 1,
		/datum/design/autolathe/ammo/smg_magnum_40_lethal = 3,
		/datum/design/autolathe/ammo/smg_magnum_40_practice = 0
		)

/obj/item/computer_hardware/hard_drive/portable/design/blackshield/strelki
	name = ""
	disk_name = "NM - 7.5mm \"Strelki\""
	icon_state = "blackshield"
	license = 8

	designs = list(
		/datum/design/autolathe/gun/strelki = 3,
		/datum/design/autolathe/ammo/rifle,
		/datum/design/autolathe/ammo/rifle_rubber,
		/datum/design/autolathe/ammo/rifle_practice = 0,
		/datum/design/autolathe/ammo/rifle_lethal = 2
		)

/obj/item/computer_hardware/hard_drive/portable/design/blackshield/watchtower
	name = ""
	disk_name = "NM - 7.5mm \"Watchtower\""
	icon_state = "blackshield"
	license = 8

	designs = list(
		/datum/design/autolathe/gun/watchtower = 3,
		/datum/design/autolathe/ammo/rifle,
		/datum/design/autolathe/ammo/rifle_rubber,
		/datum/design/autolathe/ammo/rifle_practice = 0,
		/datum/design/autolathe/ammo/rifle_lethal = 2
		)

/obj/item/computer_hardware/hard_drive/portable/design/blackshield/zatvor
	name = ""
	disk_name = "NM 7.5 bolt \"Zatvor\" rifle"
	icon_state = "blackshield"
	license = 8

	designs = list(
		/datum/design/autolathe/gun/zatvor = 3,
		/datum/design/autolathe/ammo/rifle_ammobox_small = 2,
		/datum/design/autolathe/ammo/rifle_ammobox_small_practice = 0,
		/datum/design/autolathe/ammo/rifle_ammobox_small_rubber = 2,
		/datum/design/autolathe/ammo/rifle_ammobox_small_lethal = 3,
		/datum/design/autolathe/ammo/sl_rifle = 2
		)

/obj/item/computer_hardware/hard_drive/portable/design/blackshield/dp
	name = ""
	disk_name = "NM - \"Pulemyot Degtyaryova\" LMG"
	icon_state = "blackshield"
	license = 8

	designs = list(
		/datum/design/autolathe/gun/dp = 3,
		/datum/design/autolathe/ammo/maxim = 1
		)

/obj/item/computer_hardware/hard_drive/portable/design/blackshield/duty
	name = ""
	disk_name = "NM - .257 Duty Rifle"
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

/obj/item/computer_hardware/hard_drive/portable/design/blackshield/blackguard
	name = ""
	disk_name = "NM - .408 Blackguard Omni Rifle"
	icon_state = "blackshield"

	license = 8 //RARE GUN REALLY RARE REALLY GOOD
	designs = list(
		/datum/design/autolathe/gun/blackguard = 6,
		/datum/design/autolathe/ammo/hrifle_practice = 0,
		/datum/design/autolathe/ammo/hrifle_rubber,
		/datum/design/autolathe/ammo/hrifle,
		/datum/design/autolathe/ammo/hrifle_lethal = 2
	)

/obj/item/computer_hardware/hard_drive/portable/design/blackshield/rushingbull
	name = ""
	disk_name = "NM - 20mm Rushingbull Shotgun"
	icon_state = "blackshield"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/rushing_bull = 3,
		/datum/design/autolathe/ammo/shotgun_beanbag,
		/datum/design/autolathe/ammo/shotgun_blanks = 0,
		/datum/design/autolathe/ammo/shotgun_illumination
		)
