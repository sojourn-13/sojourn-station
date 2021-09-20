/obj/item/storage/box/bs_kit
	name = "\improper Blackshield Kit"
	desc = "A standard kit."
	icon_state = "box"

// All-in-one kit
/obj/item/storage/box/bs_kit/default
	name = "\improper Default Blackshield Kit"
	desc = "The standard Blackshield equipment kit."

	populate_contents()
		new /obj/item/gun/projectile/boltgun(src)
		new /obj/item/ammo_magazine/speed_loader_rifle_75(src)
		new /obj/item/ammo_magazine/speed_loader_rifle_75(src)
		new /obj/item/ammo_magazine/speed_loader_rifle_75(src)
		new /obj/item/ammo_magazine/speed_loader_rifle_75(src)
		new /obj/item/ammo_magazine/speed_loader_rifle_75(src)
		new /obj/item/gun/projectile/colt/ten/dark(src)
		new /obj/item/ammo_magazine/magnum_40(src)
		new /obj/item/ammo_magazine/magnum_40(src)
		new /obj/item/clothing/accessory/holster/leg(src)
		new /obj/item/clothing/suit/armor/platecarrier/militia(src)
		new /obj/item/clothing/head/helmet/ballistic/militia(src)
		new /obj/item/storage/pouch/ammo(src)

// Primary Weapon Kits
/obj/item/storage/box/bs_kit/mosin
	name = "\improper Mosin Primary Kit"
	desc = "The standard Blackshield equipment kit."

	populate_contents()
		new /obj/item/gun/projectile/boltgun(src)
		new /obj/item/ammo_magazine/speed_loader_rifle_75(src)
		new /obj/item/ammo_magazine/speed_loader_rifle_75(src)
		new /obj/item/ammo_magazine/speed_loader_rifle_75(src)
		new /obj/item/ammo_magazine/speed_loader_rifle_75(src)
		new /obj/item/ammo_magazine/speed_loader_rifle_75(src)
		new /obj/item/storage/pouch/ammo(src)

/obj/item/storage/box/bs_kit/sts
	name = "\improper STS Primary Kit"
	desc = "The standard Blackshield equipment kit."

	populate_contents()
		new /obj/item/gun/projectile/automatic/sts/rifle/blackshield(src)
		new /obj/item/ammo_magazine/rifle_75_short(src)
		new /obj/item/ammo_magazine/rifle_75_short(src)
		new /obj/item/ammo_magazine/rifle_75_short(src)
		new /obj/item/ammo_magazine/rifle_75_short(src)
		new /obj/item/ammo_magazine/rifle_75_short(src)
		new /obj/item/storage/pouch/ammo(src)

/obj/item/storage/box/bs_kit/cog
	name = "\improper Cog Primary Kit"
	desc = "A kit designed for energy-based weaponry."

	populate_contents()
		new /obj/item/gun/energy/retro(src)
		new /obj/item/cell/medium(src)
		new /obj/item/cell/medium(src)
		new /obj/item/cell/medium(src)
		new /obj/item/cell/medium(src)
		new /obj/item/cell/medium(src)
		new /obj/item/storage/pouch/ammo(src)

/obj/item/storage/box/bs_kit/greasegun
	name = "\improper Grease Gun Primary Kit"
	desc = "The standard Blackshield equipment kit."

	populate_contents()
		new /obj/item/gun/projectile/automatic/greasegun(src)
		new /obj/item/ammo_magazine/smg_35(src)
		new /obj/item/ammo_magazine/smg_35(src)
		new /obj/item/ammo_magazine/smg_35(src)
		new /obj/item/ammo_magazine/smg_35(src)
		new /obj/item/ammo_magazine/smg_35(src)
		new /obj/item/storage/pouch/ammo(src)

/obj/item/storage/box/bs_kit/grizzly
	name = "\improper Grizzly Primary Kit"
	desc = "The standard Blackshield equipment kit."

	populate_contents()
		new /obj/item/gun/projectile/shotgun/pump(src)
		new /obj/item/ammo_casing/shotgun/prespawned(src)
		new /obj/item/ammo_casing/shotgun/prespawned(src)
		new /obj/item/ammo_casing/shotgun/prespawned(src)
		new /obj/item/ammo_casing/shotgun/prespawned(src)
		new /obj/item/ammo_casing/shotgun/prespawned(src)
		new /obj/item/storage/pouch/ammo(src)

// Side-arms Kits
/obj/item/storage/box/bs_kit/stallion
	name = "\improper Stallion Secondary Kit"
	desc = "The standard Blackshield equipment kit."

	populate_contents()
		new /obj/item/gun/projectile/colt/ten/dark(src)
		new /obj/item/ammo_magazine/magnum_40(src)
		new /obj/item/ammo_magazine/magnum_40(src)
		new /obj/item/clothing/accessory/holster/leg(src)

/obj/item/storage/box/bs_kit/lamia
	name = "\improper Lamia Secondary Kit"
	desc = "The standard Blackshield equipment kit."

	populate_contents()
		new /obj/item/gun/projectile/lamia/dark(src)
		new /obj/item/ammo_magazine/kurtz_50/lethal(src)
		new /obj/item/ammo_magazine/kurtz_50/lethal(src)
		new /obj/item/clothing/accessory/holster/leg(src)

/obj/item/storage/box/bs_kit/colt
	name = "\improper Colt Secondary Kit"
	desc = "The standard Blackshield equipment kit."

	populate_contents()
		new /obj/item/gun/projectile/colt(src)
		new /obj/item/ammo_magazine/pistol_35(src)
		new /obj/item/ammo_magazine/pistol_35(src)
		new /obj/item/clothing/accessory/holster/leg(src)

/obj/item/storage/box/bs_kit/martin
	name = "\improper Martin Secondary Kit"
	desc = "A kit designed for energy-based weaponry."

	populate_contents()
		new /obj/item/gun/energy/gun/martin(src)
		new /obj/item/cell/small/high(src)
		new /obj/item/cell/small/high(src)
		new /obj/item/clothing/accessory/holster/leg(src)

// Armor Kits
/obj/item/storage/box/bs_kit/standard_armor
	name = "\improper Standard Armor Kit"
	desc = "An armor kit."

	populate_contents()
		new /obj/item/clothing/suit/armor/platecarrier/militia(src)
		new /obj/item/clothing/head/helmet/ballistic/militia(src)

/obj/item/storage/box/bs_kit/flak_armor
	name = "\improper Flak Armor Kit"
	desc = "An armor kit."

	populate_contents()
		new /obj/item/clothing/suit/armor/flackvest/militia(src)
		new /obj/item/clothing/head/helmet/ballistic/militia(src)

/obj/item/storage/box/bs_kit/laser_armor
	name = "\improper Ablative Armor Kit"
	desc = "An armor kit."

	populate_contents()
		new /obj/item/clothing/suit/armor/laserproof(src)
		new /obj/item/clothing/head/helmet/laserproof(src)
		new /obj/item/clothing/gloves/thick/ablasive(src)
		new /obj/item/clothing/shoes/ablasive(src)
