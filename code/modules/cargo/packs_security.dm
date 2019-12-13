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
	cost = 1700
	crate_name = "special ops crate"
	group = "Security"
	hidden = TRUE

/datum/supply_pack/fsenergy
	name = "FS Energy Weapons Crate"
	contains = list(/obj/item/weapon/gun/energy/pulse/cassad,
				/obj/item/weapon/gun/energy/gun,
				/obj/item/weapon/gun/energy/gun,
				/obj/item/weapon/gun/energy/gun/martin,
				/obj/item/weapon/gun/energy/gun/martin)
	cost = 6000
	containertype = /obj/structure/closet/crate/secure/weapon
	crate_name = "FS energy weapons crate"
	group = "Security"

/datum/supply_pack/fssmall
	name = "FS Sidearms Crate"
	contains = list(/obj/item/weapon/gun/projectile/colt,
			/obj/item/weapon/gun/projectile/IH_sidearm,
			/obj/item/weapon/gun/projectile/clarissa,
			/obj/item/weapon/gun/projectile/olivaw)
	cost = 3000
	containertype = /obj/structure/closet/crate/secure/weapon
	crate_name = "FS sidearms crate"
	group = "Security"

/datum/supply_pack/fsassault
	name = "FS Assault Weapons Crate"
	contains = list(/obj/item/weapon/gun/projectile/automatic/ak47/fs,
			/obj/item/weapon/gun/projectile/automatic/idaho,
			/obj/item/weapon/gun/projectile/automatic/idaho)
	cost = 6000
	containertype = /obj/structure/closet/crate/secure/weapon
	crate_name = "FS assault weapons crate"
	group = "Security"

/datum/supply_pack/fsrevolver
	name = "FS Revolvers Crate"
	contains = list(/obj/item/weapon/gun/projectile/revolver/detective,
					/obj/item/weapon/gun/projectile/revolver/detective,
					/obj/item/weapon/gun/projectile/revolver/consul)
	cost = 3300
	containertype = /obj/structure/closet/crate/secure/weapon
	crate_name = "FS revolvers crate"
	group = "Security"

/datum/supply_pack/ntweapons
	name = "NT Energy Weapons Crate"
	contains = list(/obj/item/weapon/gun/energy/laser,
				/obj/item/weapon/gun/energy/laser,
				/obj/item/weapon/gun/energy/taser,
				/obj/item/weapon/gun/energy/taser)
	cost = 5000
	containertype = /obj/structure/closet/crate/secure/weapon
	crate_name = "NT energy weapons crate"
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
	cost = 2500
	containertype = /obj/structure/closet/crate/secure/weapon
	crate_name = "incendiary weapons crate"
	group = "Security"

/datum/supply_pack/armor
	name = "IH Surplus Armor Crate"
	contains = list(/obj/item/clothing/suit/armor/vest,
					/obj/item/clothing/suit/armor/vest/security,
					/obj/item/clothing/suit/armor/vest/detective,
					/obj/item/clothing/suit/storage/vest,
					/obj/item/clothing/head/helmet,
					/obj/item/clothing/head/helmet)
	cost = 1500
	containertype = /obj/structure/closet/crate/secure
	crate_name = "IH surplus armor crate"
	group = "Security"

/datum/supply_pack/riot
	name = "IH Riot Gear Crate"
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
					/obj/item/clothing/suit/armor/riot,
					/obj/item/clothing/head/helmet/riot,
					/obj/item/clothing/suit/armor/riot,
					/obj/item/clothing/head/helmet/riot,
					/obj/item/clothing/suit/armor/riot)
	cost = 6100
	containertype = /obj/structure/closet/crate/secure
	crate_name = "IH riot gear crate"
	group = "Security"

/datum/supply_pack/ballisticarmor
	name = "IH Ballistic Armor Crate"
	contains = list(/obj/item/clothing/suit/armor/bulletproof,
					/obj/item/clothing/suit/armor/bulletproof,
					/obj/item/clothing/head/helmet,
					/obj/item/clothing/head/helmet)
	cost = 3000
	containertype = /obj/structure/closet/crate/secure
	crate_name = "IH ballistic armor crate"
	group = "Security"

/datum/supply_pack/shotgunammo_beanbag
	name = "FS Beanbag Shells Crate"
	contains = list(/obj/item/weapon/storage/box/shotgunammo/beanbags,
					/obj/item/weapon/storage/box/shotgunammo/beanbags,
					/obj/item/weapon/storage/box/shotgunammo/beanbags,
					/obj/item/weapon/storage/box/shotgunammo/beanbags,
					/obj/item/weapon/storage/box/shotgunammo/beanbags)
	cost = 1000
	crate_name = "FS beanbag shells crate"
	group = "Security"

/datum/supply_pack/shotgunammo_slug
	name = "FS Slug Shells Crate"
	contains = list(/obj/item/weapon/storage/box/shotgunammo/slug,
					/obj/item/weapon/storage/box/shotgunammo/slug,
					/obj/item/weapon/storage/box/shotgunammo/slug,
					/obj/item/weapon/storage/box/shotgunammo/slug,
					/obj/item/weapon/storage/box/shotgunammo/slug)
	cost = 1500
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
	cost = 1500
	containertype = /obj/structure/closet/crate/secure
	crate_name = "FS buckshot shells crate"
	group = "Security"


/datum/supply_pack/energyarmor
	name = "IH Ablative Armor Crate"
	contains = list(/obj/item/clothing/suit/armor/laserproof,
					/obj/item/clothing/suit/armor/laserproof,
					/obj/item/clothing/head/helmet,
					/obj/item/clothing/head/helmet)
	cost = 3500
	containertype = /obj/structure/closet/crate/secure
	crate_name = "IH ablative armor crate"
	group = "Security"

/datum/supply_pack/securitybarriers
	name = "IH Security Barrier Crate"
	contains = list(/obj/machinery/deployable/barrier,
					/obj/machinery/deployable/barrier,
					/obj/machinery/deployable/barrier,
					/obj/machinery/deployable/barrier)
	cost = 2000
	containertype = /obj/structure/closet/crate/secure/gear
	crate_name = "IH security barrier crate"
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