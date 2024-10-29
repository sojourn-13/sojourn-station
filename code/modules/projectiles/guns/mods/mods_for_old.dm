//Trash mods, for putting on old guns

/obj/item/gun_upgrade/trigger/faulty
	name = "Faulty Trigger"
	desc = "Weirdly sticky, and none of your fingers seem to fit to it comfortably. This causes more recoil and increases delay between shots as you try to compensate for it."
	icon_state = "Cop_Block"
	price_tag = 0

/obj/item/gun_upgrade/trigger/faulty/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.weapon_upgrades = list(
		GUN_UPGRADE_RECOIL = rand(12,30)/10,
		GUN_UPGRADE_FIRE_DELAY_MULT = rand(11,18)/10,
		UPGRADE_COLOR = pick("#AA7744", "#774411", "#777777")
	)
	I.destroy_on_removal = TRUE
	I.removal_time *= rand(10, 14)/10
	I.removal_difficulty *= rand(5, 15)/10
	I.gun_loc_tag = GUN_TRIGGER
	I.prefix = "feather trigger"

/obj/item/gun_upgrade/barrel/faulty
	name = "Warped Barrel"
	desc = "Extreme heat has warped this barrel off-target. This decreases the impact force of bullets fired through it and makes it more difficult to correctly aim the weapon it's attached to."
	icon_state = "Forged_barrel"
	price_tag = 0

/obj/item/gun_upgrade/barrel/faulty/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.weapon_upgrades = list(
		GUN_UPGRADE_OFFSET = rand(5,15),
		GUN_UPGRADE_PEN_MULT = rand(2,4)/10,
		GUN_UPGRADE_DAMAGE_MULT = rand(4,9)/10,
		UPGRADE_COLOR = pick("#AA7744", "#774411", "#777777")
	)
	I.destroy_on_removal = TRUE
	I.removal_time *= rand(10, 14)/10
	I.removal_difficulty *= rand(5, 15)/10
	I.gun_loc_tag = GUN_BARREL
	I.prefix = "fluted barrel" // In line with forged barrel

/obj/item/gun_upgrade/muzzle/faulty
	name = "Failed Makeshift Silencer"
	desc = "Inspired by cheesy action movies, somebody has left trash on the end of this weapon. This causes the attached weapon to suffer from weaker armor penetration."
	icon_state = "silencer"
	price_tag = 0

/obj/item/gun_upgrade/muzzle/faulty/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.weapon_upgrades = list(
		GUN_UPGRADE_PEN_MULT = rand(2,4)/10,
		GUN_UPGRADE_STEPDELAY_MULT = rand(12,18)/10,
		UPGRADE_COLOR = pick("#AA7744", "#774411", "#777777")
	)
	I.destroy_on_removal = TRUE
	I.removal_time *= rand(10, 14)/10
	I.removal_difficulty *= rand(5, 15)/10
	I.gun_loc_tag = GUN_MUZZLE
	I.prefix = "silenced"

/obj/item/gun_upgrade/mechanism/faulty
	name = "Unknown Clockwork Mechanism"
	desc = "It's really not clear what this modification actually does. It appears to effect the attached weapon's recoil, but if it actually helps or hinders the weapon is unclear."
	icon_state = "Clockblock"
	price_tag = 0

/obj/item/gun_upgrade/mechanism/faulty/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.weapon_upgrades = list(
		GUN_UPGRADE_RECOIL = rand(5, 50)/10,
		UPGRADE_COLOR = pick("#AA7744", "#774411", "#777777")
	)
	I.destroy_on_removal = TRUE
	I.removal_time *= rand(10, 14)/10
	I.removal_difficulty *= rand(5, 15)/10
	I.gun_loc_tag = GUN_MECHANISM
	I.prefix = "ticking"

/obj/item/gun_upgrade/scope/faulty
	name = "Misaligned sights"
	desc = "Some bad knocks have changed the angling on the sights of this weapon. This causes the attached weapon to suffer from decreased accuracy."
	icon_state = "Watchman"
	price_tag = 0

/obj/item/gun_upgrade/scope/faulty/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.weapon_upgrades = list(
		GUN_UPGRADE_OFFSET = rand(3,6),
		UPGRADE_COLOR = pick("#AA7744", "#774411", "#777777")
	)
	I.destroy_on_removal = TRUE
	I.removal_time *= rand(10, 14)/10
	I.removal_difficulty *= rand(5, 15)/10
	I.gun_loc_tag = GUN_SCOPE
	I.prefix = "scoped"

/obj/item/gun_upgrade/mechanism/faulty_trapped
	name = "Jammed loader"
	desc = "The mechanism that loads bullets into the chamber has jammed, one would be lucky the gun didn't explode if this was shot."
	icon_state = "Reverse_loader"

/obj/item/gun_upgrade/mechanism/faulty_trapped/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.weapon_upgrades = list(
		GUN_UPGRADE_RIGGED = TRUE,
		UPGRADE_COLOR = pick("#AA7744", "#774411", "#777777")
	)
	I.destroy_on_removal = TRUE
	I.removal_time *= rand(10, 14)/10
	I.removal_difficulty *= rand(5, 15)/10
	I.gun_loc_tag = GUN_MECHANISM
	I.prefix = "trigger feathered"

#define TRASH_GUNMODS list(/obj/item/gun_upgrade/trigger/faulty, /obj/item/gun_upgrade/barrel/faulty, \
		/obj/item/gun_upgrade/muzzle/faulty, /obj/item/gun_upgrade/mechanism/faulty, \
		/obj/item/gun_upgrade/scope/faulty, /obj/item/gun_upgrade/mechanism/faulty_trapped)

/obj/item/gun_upgrade/trigger/conductive_trigger
	name = "Conductive Trigger"
	desc = "When shooting a lot the trigger warms up form a charge back, luckly its non-harmful."
	icon_state = "Cop_Block"
	price_tag = 0

/obj/item/gun_upgrade/trigger/conductive_trigger/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.weapon_upgrades = list(
		GUN_UPGRADE_OVERCHARGE_MAX = -rand(3,4),
		GUN_UPGRADE_OVERCHARGE_RATE = -rand(3,4)/10,
		UPGRADE_COLOR = pick("#AA7744", "#774411", "#777777")
	)
	I.destroy_on_removal = TRUE
	I.removal_time *= rand(10, 14)/10
	I.removal_difficulty *= rand(5, 15)/10
	I.gun_loc_tag = GUN_TRIGGER
	I.prefix = "feather trigger"

//Same as warped barrel
/obj/item/gun_upgrade/barrel/rubber_coiled_barrel
	name = "Rubber Coil"
	desc = "Someone wrapped cable coil all around the inside. Really messes with output power"
	icon_state = "Forged_barrel"
	price_tag = 0

/obj/item/gun_upgrade/barrel/rubber_coiled_barrel/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.weapon_upgrades = list(
		GUN_UPGRADE_OFFSET = rand(5,15),
		GUN_UPGRADE_PEN_MULT = rand(2,4)/10,
		GUN_UPGRADE_DAMAGE_MULT = rand(4,9)/10,
		UPGRADE_COLOR = pick("#AA7744", "#774411", "#777777")
	)
	I.destroy_on_removal = TRUE
	I.removal_time *= rand(10, 14)/10
	I.removal_difficulty *= rand(5, 15)/10
	I.gun_loc_tag = GUN_BARREL
	I.prefix = "fluted barrel" // In line with forged barrel

//More power + less pen
/obj/item/gun_upgrade/muzzle/rusted
	name = "Rusted Copper Muzzel"
	desc = "A copper muzzel that has been water damaged. This causes the attached weapon to suffer from weaker armor penetration and increases power draw."
	icon_state = "silencer"
	price_tag = 0

/obj/item/gun_upgrade/muzzle/rusted/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.weapon_upgrades = list(
		GUN_UPGRADE_PEN_MULT = rand(2,4)/10,
		GUN_UPGRADE_CHARGECOST = rand(2,4)/10,
		UPGRADE_COLOR = pick("#AA7744", "#774411", "#777777")
	)
	I.destroy_on_removal = TRUE
	I.removal_time *= rand(10, 14)/10
	I.removal_difficulty *= rand(5, 15)/10
	I.gun_loc_tag = GUN_MUZZLE
	I.prefix = "heatsunk"

//Massively increases charge costs
/obj/item/gun_upgrade/mechanism/outdated
	name = "Outdated Charge Port Mechanism"
	desc = "An outdated old copper based charge port that makes any almost hold half as much charge."
	icon_state = "Clockblock"
	price_tag = 0

/obj/item/gun_upgrade/mechanism/outdated/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.weapon_upgrades = list(
		GUN_UPGRADE_CHARGECOST = rand(4, 5)/10,
		UPGRADE_COLOR = pick("#AA7744", "#774411", "#777777")
	)
	I.destroy_on_removal = TRUE
	I.removal_time *= rand(10, 14)/10
	I.removal_difficulty *= rand(5, 15)/10
	I.gun_loc_tag = GUN_MECHANISM
	I.prefix = "ticking"

//Egun verson of the rigged loader
/obj/item/gun_upgrade/mechanism/bad_brackets
	name = "Acid Corroided Brackets"
	desc = "Everything that makes sure the laser goes the right way was damaged by cell acid making it likely to discharge backwards at a luckly reduced rate."
	icon_state = "Reverse_loader"

/obj/item/gun_upgrade/mechanism/bad_brackets/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.weapon_upgrades = list(
		GUN_UPGRADE_RIGGED = TRUE,
		GUN_UPGRADE_DAMAGE_MULT = rand(8,9)/10,
		UPGRADE_COLOR = pick("#AA7744", "#774411", "#777777")
	)
	I.destroy_on_removal = TRUE
	I.removal_time *= rand(10, 14)/10
	I.removal_difficulty *= rand(5, 15)/10
	I.gun_loc_tag = GUN_MECHANISM
	I.prefix = "trigger feathered"

#define TRASH_GUNMODS_ENERGY list(/obj/item/gun_upgrade/trigger/conductive_trigger, /obj/item/gun_upgrade/barrel/rubber_coiled_barrel, \
		/obj/item/gun_upgrade/muzzle/rusted, /obj/item/gun_upgrade/mechanism/outdated, \
		/obj/item/gun_upgrade/scope/faulty, /obj/item/gun_upgrade/mechanism/bad_brackets)
