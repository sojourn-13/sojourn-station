//----------------------------------------------
//-----------------SECURITY---------------------
//----------------------------------------------

/datum/supply_pack/specialops
	name = "Special Ops Crate"
	contains = list(/obj/item/weapon/storage/box/emps,
					/obj/item/weapon/grenade/smokebomb,
					/obj/item/weapon/grenade/smokebomb,
					/obj/item/weapon/grenade/smokebomb,
					/obj/item/weapon/pen/reagent/paralysis,
					/obj/item/weapon/grenade/chem_grenade/incendiary)
	cost = 4000
	crate_name = "special ops crate"
	group = "Security"
	hidden = TRUE

/datum/supply_pack/fsenergy
	name = "FS Energy Weapons Crate"
	contains = list(/obj/item/weapon/gun/energy/plasma/cassad,
				/obj/item/weapon/gun/energy/gun,
				/obj/item/weapon/gun/energy/gun,
				/obj/item/weapon/gun/energy/gun/martin,
				/obj/item/weapon/gun/energy/gun/martin)
	cost = 9200
	containertype = /obj/structure/closet/crate/secure/weapon
	crate_name = "FS energy weapons crate"
	group = "Security"

/datum/supply_pack/fssmall
	name = "FS Sidearms Crate"
	contains = list(/obj/item/weapon/gun/projectile/colt,

			/obj/item/weapon/gun/projectile/clarissa,
			/obj/item/weapon/gun/projectile/olivaw)
	cost = 5200
	containertype = /obj/structure/closet/crate/secure/weapon
	crate_name = "FS sidearms crate"
	group = "Security"


/datum/supply_pack/fsrevolver
	name = "FS Revolvers Crate"
	contains = list(/obj/item/weapon/gun/projectile/revolver/detective,
					/obj/item/weapon/gun/projectile/revolver/detective,
					/obj/item/weapon/gun/projectile/revolver)
	cost = 6600
	containertype = /obj/structure/closet/crate/secure/weapon
	crate_name = "FS revolvers crate"
	group = "Security"

/datum/supply_pack/ntweapons
	name = "CA Energy Weapons Crate"
	contains = list(/obj/item/weapon/gun/energy/laser,
				/obj/item/weapon/gun/energy/laser,
				/obj/item/weapon/gun/energy/taser,
				/obj/item/weapon/gun/energy/taser)
	cost = 10000
	containertype = /obj/structure/closet/crate/secure/weapon
	crate_name = "CA energy weapons crate"
	group = "Security"

/datum/supply_pack/eweapons
	name = "Incendiary Weapons Crate"
	contains = list(/obj/item/weapon/flamethrower/full,
					/obj/item/weapon/tank/plasma,
					/obj/item/weapon/tank/plasma,
					/obj/item/weapon/tank/plasma,
					/obj/item/weapon/grenade/chem_grenade/incendiary,
					/obj/item/weapon/grenade/chem_grenade/incendiary,
					/obj/item/weapon/grenade/chem_grenade/incendiary)
	cost = 6000
	containertype = /obj/structure/closet/crate/secure/weapon
	crate_name = "incendiary weapons crate"
	group = "Security"

/datum/supply_pack/armor
	name = "Marshal Surplus Armor Crate"
	contains = list(/obj/item/clothing/suit/armor/vest,
					/obj/item/clothing/suit/armor/vest/security,
					/obj/item/clothing/suit/armor/vest/detective,
					/obj/item/clothing/suit/storage/vest,
					/obj/item/clothing/head/helmet,
					/obj/item/clothing/head/helmet)
	cost = 4000
	containertype = /obj/structure/closet/crate/secure
	crate_name = "Marshal surplus armor crate"
	group = "Security"

/datum/supply_pack/riot
	name = "Marshal Riot Gear Crate"
	contains = list(/obj/item/weapon/melee/baton,
					/obj/item/weapon/melee/baton,
					/obj/item/weapon/melee/baton,
					/obj/item/weapon/shield/riot,
					/obj/item/weapon/shield/riot,
					/obj/item/weapon/shield/riot,
					/obj/item/weapon/storage/box/flashbangs,
					/obj/item/weapon/storage/box/flashbangs,
					/obj/item/weapon/storage/box/flashbangs,
					/obj/item/weapon/handcuffs,
					/obj/item/weapon/handcuffs,
					/obj/item/weapon/handcuffs,
					/obj/item/clothing/head/helmet/riot,
					/obj/item/clothing/suit/armor/heavy/riot,
					/obj/item/clothing/head/helmet/riot,
					/obj/item/clothing/suit/armor/heavy/riot,
					/obj/item/clothing/head/helmet/riot,
					/obj/item/clothing/suit/armor/heavy/riot)
	cost = 10000
	containertype = /obj/structure/closet/crate/secure
	crate_name = "Marshal riot gear crate"
	group = "Security"

/datum/supply_pack/ballisticarmor
	name = "Marshal Ballistic Armor Crate"
	contains = list(/obj/item/clothing/suit/armor/bulletproof,
					/obj/item/clothing/suit/armor/bulletproof,
					/obj/item/clothing/head/helmet,
					/obj/item/clothing/head/helmet)
	cost = 6000
	containertype = /obj/structure/closet/crate/secure
	crate_name = "Marshal ballistic armor crate"
	group = "Security"

/datum/supply_pack/shotgunammo_beanbag
	name = "FS Beanbag Shells Crate"
	contains = list(/obj/item/weapon/storage/box/shotgunammo/beanbags,
					/obj/item/weapon/storage/box/shotgunammo/beanbags,
					/obj/item/weapon/storage/box/shotgunammo/beanbags,
					/obj/item/weapon/storage/box/shotgunammo/beanbags,
					/obj/item/weapon/storage/box/shotgunammo/beanbags)
	cost = 3000
	crate_name = "FS beanbag shells crate"
	group = "Security"

/datum/supply_pack/shotgunammo_slug
	name = "FS Slug Shells Crate"
	contains = list(/obj/item/weapon/storage/box/shotgunammo/slug,
					/obj/item/weapon/storage/box/shotgunammo/slug,
					/obj/item/weapon/storage/box/shotgunammo/slug,
					/obj/item/weapon/storage/box/shotgunammo/slug,
					/obj/item/weapon/storage/box/shotgunammo/slug)
	cost = 3000
	containertype = /obj/structure/closet/crate/secure
	crate_name = "FS slug shells crate"
	group = "Security"

/datum/supply_pack/shotgunammo_buckshot
	name = "FS Buckshot Shells Crate"
	contains = list(/obj/item/weapon/storage/box/shotgunammo/buckshot,
					/obj/item/weapon/storage/box/shotgunammo/buckshot,
					/obj/item/weapon/storage/box/shotgunammo/buckshot,
					/obj/item/weapon/storage/box/shotgunammo/buckshot,
					/obj/item/weapon/storage/box/shotgunammo/buckshot)
	cost = 3000
	containertype = /obj/structure/closet/crate/secure
	crate_name = "FS buckshot shells crate"
	group = "Security"


/datum/supply_pack/energyarmor
	name = "Marshal Ablative Armor Crate"
	contains = list(/obj/item/clothing/suit/armor/laserproof,
					/obj/item/clothing/suit/armor/laserproof,
					/obj/item/clothing/head/helmet,
					/obj/item/clothing/head/helmet)
	cost = 7000
	containertype = /obj/structure/closet/crate/secure
	crate_name = "Marshal ablative armor crate"
	group = "Security"

/datum/supply_pack/securitybarriers
	name = "IH Security Barrier Crate"
	contains = list(/obj/machinery/deployable/barrier,
					/obj/machinery/deployable/barrier,
					/obj/machinery/deployable/barrier,
					/obj/machinery/deployable/barrier)
	cost = 2000
	containertype = /obj/structure/closet/crate/secure/gear
	crate_name = "Marshal security barrier crate"
	group = "Security"

/datum/supply_pack/securitywallshield
	name = "Wall Shield Generators Crate"
	contains = list(/obj/machinery/shieldwallgen,
					/obj/machinery/shieldwallgen,
					/obj/machinery/shieldwallgen,
					/obj/machinery/shieldwallgen)
	cost = 2000
	containertype = /obj/structure/closet/crate/secure
	crate_name = "wall shield generators crate"
	group = "Security"