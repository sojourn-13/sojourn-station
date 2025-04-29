//Trash mods, for putting on old guns

/obj/item/gun_upgrade/trigger/faulty
	name = "Faulty Trigger"
	desc = "Oddly sticky and grimy, none of your fingers seem to fit. Reduces rate of fire and increases recoil since you have to fiddle around to use it."
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
	desc = "Extreme heat has warped this barrel beyond a usable point. It is almost impossible to hit something properly with this and the reduced velocity of the bullet decreases it's impact force. Good luck with that."
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
	desc = "Whoever got inspired by cheesy action movies fashioned an old can into a silencer. Just like real silencers, this doesnt have the supposed effect. It actually reduces the impact bullets will have on the target."
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
	desc = "It's really not clear what this modification actually does. It appears to affect the recoil of the weapon it is attached to, but if it actually helps or hinders the weapon is unclear."
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
	desc = "This weapon has been improperly used as a melee weapon, misaligning the sights. Aiming with this is untenable."
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
	name = "Jammed loading-mechanism"
	desc = "The loading spring is worn down or rusted so heavily that it doesnt feed bullets properly and jams the gun."
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
	desc = "This trigger heats up during sustained firing. Who installed this?"
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
	name = "Rubber Coiled Barrel"
	desc = "Why would someone fit the inside of a barrel with rubber cable? It reduces output power!"
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
	name = "Rusted Copper Muzzle"
	desc = "This copper muzzle is rusted from water exposure. This causes the weapon it is attached to to suffer weaker armor penetration and increased power drain."
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
	desc = "An outdated copper based charge port that massively increases power drain."
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
	name = "Corroded Brackets"
	desc = "Cell Acid leaked and corroded the coils for stabilizing energy projectiles. Has a tendency to discharge the gun in the wrong direction and damage the user."
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
