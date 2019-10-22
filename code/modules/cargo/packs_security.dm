//----------------------------------------------
//-----------------SECURITY---------------------
//----------------------------------------------

/datum/supply_pack/specialops
	name = "Special Ops supplies"
	contains = list(/obj/item/weapon/storage/box/emps,
					/obj/item/weapon/grenade/smokebomb,
					/obj/item/weapon/grenade/smokebomb,
					/obj/item/weapon/grenade/smokebomb,
					/obj/item/weapon/pen/reagent/paralysis,
					/obj/item/weapon/grenade/chem_grenade/incendiary)
	cost = 1700
	crate_name = "Special Ops crate"
	group = "Security"
	hidden = TRUE

/datum/supply_pack/fsenergy
	name = "FS Energy Weapons"
	contains = list(/obj/item/weapon/gun/energy/pulse/cassad,
				/obj/item/weapon/gun/energy/gun,
				/obj/item/weapon/gun/energy/gun,
				/obj/item/weapon/gun/energy/gun/martin,
				/obj/item/weapon/gun/energy/gun/martin)
	cost = 6000
	containertype = /obj/structure/closet/crate/secure/weapon
	crate_name = "FS Energy Weapons"
	group = "Security"

/datum/supply_pack/fssmall
	name = "FS Handgun Pack"
	contains = list(/obj/item/weapon/gun/projectile/colt,
			/obj/item/weapon/gun/projectile/IH_sidearm,
			/obj/item/weapon/gun/projectile/clarissa,
			/obj/item/weapon/gun/projectile/olivaw)
	cost = 3000
	containertype = /obj/structure/closet/crate/secure/weapon
	crate_name = "FS Handgun Pack"
	group = "Security"

/datum/supply_pack/fsassault
	name = "FS Assault Pack"
	contains = list(/obj/item/weapon/gun/projectile/automatic/ak47/fs,
			/obj/item/weapon/gun/projectile/automatic/idaho,
			/obj/item/weapon/gun/projectile/automatic/idaho)
	cost = 6000
	containertype = /obj/structure/closet/crate/secure/weapon
	crate_name = "FS Assault Pack"
	group = "Security"

/datum/supply_pack/ntweapons
	name = "NT Energy Weapons"
	contains = list(/obj/item/weapon/gun/energy/laser,
				/obj/item/weapon/gun/energy/laser,
				/obj/item/weapon/gun/energy/taser,
				/obj/item/weapon/gun/energy/taser)
	cost = 5000
	containertype = /obj/structure/closet/crate/secure/weapon
	crate_name = "FS Energy Weapons"
	group = "Security"

/datum/supply_pack/eweapons
	name = "Experimental weapons crate"
	contains = list(/obj/item/weapon/flamethrower/full,
					/obj/item/weapon/tank/plasma,
					/obj/item/weapon/tank/plasma,
					/obj/item/weapon/tank/plasma,
					/obj/item/weapon/grenade/chem_grenade/incendiary,
					/obj/item/weapon/grenade/chem_grenade/incendiary,
					/obj/item/weapon/grenade/chem_grenade/incendiary)
	cost = 2500
	containertype = /obj/structure/closet/crate/secure/weapon
	crate_name = "Experimental weapons crate"
	group = "Security"

/datum/supply_pack/armor
	name = "IH Surplus Armor"
	contains = list(/obj/item/clothing/suit/armor/vest,
					/obj/item/clothing/suit/armor/vest/security,
					/obj/item/clothing/suit/armor/vest/detective,
					/obj/item/clothing/suit/storage/vest,
					/obj/item/clothing/head/helmet,
					/obj/item/clothing/head/helmet)
	cost = 1500
	containertype = /obj/structure/closet/crate/secure
	crate_name = "IH Surplus Amor"
	group = "Security"

/datum/supply_pack/riot
	name = "IH Riot gear crate"
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
	crate_name = "IH Riot gear crate"
	group = "Security"
/*
/datum/supply_pack/loyalty
	name = "Moebius Loyalty implant crate"
	contains = list (/obj/item/weapon/storage/lockbox/loyalty)
	cost = 6000
	containertype = /obj/structure/closet/crate/secure
	crate_name = "Moebius Loyalty implant crate"
	group = "Security"
*/
/datum/supply_pack/ballisticarmor
	name = "IH Ballistic Armor"
	contains = list(/obj/item/clothing/suit/armor/bulletproof,
					/obj/item/clothing/suit/armor/bulletproof,
					/obj/item/clothing/head/helmet,
					/obj/item/clothing/head/helmet)
	cost = 3000
	containertype = /obj/structure/closet/crate/secure
	crate_name = "FS Close Quarters Pack"
	group = "Security"

/datum/supply_pack/shotgunammo_beanbag
	name = "FS Shotgun shells (Beanbag)"
	contains = list(/obj/item/weapon/storage/box/shotgunammo/beanbags,
					/obj/item/weapon/storage/box/shotgunammo/beanbags,
					/obj/item/weapon/storage/box/shotgunammo/beanbags,
					/obj/item/weapon/storage/box/shotgunammo/beanbags,
					/obj/item/weapon/storage/box/shotgunammo/beanbags)
	cost = 1000
	crate_name = "FS Shotgun shells (Beanbag)"
	group = "Security"

/datum/supply_pack/shotgunammo_slug
	name = "FS Shotgun shells (slug)"
	contains = list(/obj/item/weapon/storage/box/shotgunammo/slug,
					/obj/item/weapon/storage/box/shotgunammo/slug,
					/obj/item/weapon/storage/box/shotgunammo/slug,
					/obj/item/weapon/storage/box/shotgunammo/slug,
					/obj/item/weapon/storage/box/shotgunammo/slug)
	cost = 1500
	containertype = /obj/structure/closet/crate/secure
	crate_name = "FS Shotgun shells (slug)"
	group = "Security"

/datum/supply_pack/shotgunammo_buckshot
	name = "FS Shotgun shells (buckshot)"
	contains = list(/obj/item/weapon/storage/box/shotgunammo/buckshot,
					/obj/item/weapon/storage/box/shotgunammo/buckshot,
					/obj/item/weapon/storage/box/shotgunammo/buckshot,
					/obj/item/weapon/storage/box/shotgunammo/buckshot,
					/obj/item/weapon/storage/box/shotgunammo/buckshot)
	cost = 1500
	containertype = /obj/structure/closet/crate/secure
	crate_name = "FS Shotgun shells (buckshot)"
	group = "Security"


/datum/supply_pack/energyarmor
	name = "IH Ablative Armor"
	contains = list(/obj/item/clothing/suit/armor/laserproof,
					/obj/item/clothing/suit/armor/laserproof,
					/obj/item/clothing/head/helmet,
					/obj/item/clothing/head/helmet)
	cost = 3500
	containertype = /obj/structure/closet/crate/secure
	crate_name = "IH Ablative Armor crate"
	group = "Security"

/datum/supply_pack/securitybarriers
	name = "IH Security Barrier crate"
	contains = list(/obj/machinery/deployable/barrier,
					/obj/machinery/deployable/barrier,
					/obj/machinery/deployable/barrier,
					/obj/machinery/deployable/barrier)
	cost = 2000
	containertype = /obj/structure/closet/crate/secure/gear
	crate_name = "IH Security Barrier crate"
	group = "Security"

/datum/supply_pack/securitywallshield
	name = "Wall shield Generators"
	contains = list(/obj/machinery/shieldwallgen,
					/obj/machinery/shieldwallgen,
					/obj/machinery/shieldwallgen,
					/obj/machinery/shieldwallgen)
	cost = 2000
	containertype = /obj/structure/closet/crate/secure
	crate_name = "wall shield generators crate"
	group = "Security"