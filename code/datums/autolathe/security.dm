/datum/design/autolathe/sec/secflashlight
	name = "security flashlight"
	build_path = /obj/item/device/lighting/toggleable/flashlight/seclite

/datum/design/autolathe/sec/handcuffs
	name = "handcuffs"
	build_path = /obj/item/handcuffs

/datum/design/autolathe/sec/zipties
	name = "zip ties"
	build_path = /obj/item/handcuffs/zipties

/datum/design/autolathe/sec/electropack
	name = "electropack"
	build_path = /obj/item/device/radio/electropack

/datum/design/autolathe/sec/binoculars
	name = "binoculars"
	build_path = /obj/item/device/binoculars

/datum/design/autolathe/sec/shield_riot
	name = "riot shield"
	build_path = /obj/item/shield/riot

/datum/design/autolathe/sec/beartrap
	name = "bear trap"
	build_path = /obj/item/beartrap

/datum/design/autolathe/sec/silencer
	name = "silencer"
	build_path = /obj/item/gun_upgrade/muzzle/silencer

/datum/design/autolathe/sec/acog
	name = "AGOG scope"
	build_path = /obj/item/gun_upgrade/scope/acog
	materials = list(MATERIAL_GLASS = 4, MATERIAL_STEEL = 2) // Double materials, prevents obtaining more than used.

/datum/design/autolathe/sec/gun_case
	name = "gun case"
	build_path = /obj/item/storage/backpack/guncase
	materials = list(MATERIAL_PLASTIC = 7, MATERIAL_STEEL = 2)

/datum/design/autolathe/sec/hailer
	name = "hailer"
	build_path = /obj/item/device/hailer

/datum/design/autolathe/sec/stunbaton
	name = "stun baton"
	build_path = /obj/item/tool/baton

/datum/design/autolathe/sec/stunbaton/maul
	name = "shock maul"
	build_path = /obj/item/tool/baton/maul

/datum/design/autolathe/sec/stunbaton_small
	name = "mini stun baton"
	build_path = /obj/item/tool/baton/mini

/datum/design/autolathe/sec/auto_eject_mod
	name = "H&S \"Dropper\" Magwell Breaker"
	build_path = /obj/item/gun_upgrade/magwell/auto_eject

//Shields
/datum/design/autolathe/sec/riot
	name = "ballistic shield"
	build_path = /obj/item/shield/riot

/datum/design/autolathe/sec/buckler
	name = "tactical shield"
	build_path = /obj/item/shield/buckler

/datum/design/autolathe/sec/excelsior_shield
	name = "excelsior buckler"
	build_path = /obj/item/shield/buckler/excelsior

/datum/design/autolathe/sec/bastion
	name = "bastion shield"
	build_path = /obj/item/shield/riot/bastion
	materials = list(MATERIAL_PLASMAGLASS = 3, MATERIAL_OSMIUM = 1) //So making it at the guild is objectively always better
