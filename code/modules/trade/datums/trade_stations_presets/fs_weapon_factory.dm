/datum/trade_station/fs_factory
	name_pool = list("XSMS 'Kaida'" = "Xanaroth Syndicate Manufacturing Station 'Kaida'. \"Well if it isn't our favorite trade partner, we got some side deals just for you!\"")
	markup = 0.2
	assortiment = list(
		"Projectiles" = list(
			/obj/item/gun/projectile/automatic/mac,
			/obj/item/gun/projectile/automatic/c20r,
			/obj/item/gun/projectile/automatic/sts/lrifle,
			/obj/item/gun/projectile/automatic/sts/rifle,
			/obj/item/gun/projectile/automatic/sts/hrifle,
			/obj/item/gun/projectile/automatic/greasegun,
			/obj/item/gun/projectile/automatic/pitbull,
			/obj/item/gun/projectile/boltgun/scout,
			/obj/item/gun/projectile/boltgun/lever,
			/obj/item/gun/projectile/boltgun/sa,
			/obj/item/gun/projectile/shotgun/pump/gladstone,
			/obj/item/gun/projectile/shotgun/bull,
			/obj/item/gun/projectile/shotgun/pug,
			/obj/item/gun/projectile/shotgun/pump
		),
		"Ammunition" = list(
			/obj/item/ammo_magazine/c10x24 = custom_good_amount_range(list(1, 10)),
			/obj/item/ammo_magazine/a75 = custom_good_amount_range(list(1, 10)),
			/obj/item/ammo_magazine/heavy_rifle_408_drum = custom_good_amount_range(list(1, 10)),
			/obj/item/ammo_magazine/m12/pellet = custom_good_amount_range(list(1, 10)),
			/obj/item/ammo_casing/antim/lethal/prespawned = custom_good_amount_range(list(1, 10)),

			/obj/item/ammo_magazine/ammobox/heavy_rifle_408,
			/obj/item/ammo_magazine/ammobox/rifle_75,
			/obj/item/ammo_magazine/ammobox/light_rifle_257,
			/obj/item/ammo_magazine/ammobox/shotgun,
			/obj/item/ammo_magazine/ammobox/kurtz_50,
			/obj/item/ammo_magazine/ammobox/magnum_40,
			/obj/item/ammo_magazine/ammobox/pistol_35
		),
		"Energy" = list(
			/obj/item/gun/energy/gun,
			/obj/item/gun/energy/gun/martin,
			/obj/item/gun/energy/pulse/cassad
		),
		"Grenades" = list(
			/obj/item/gun/projectile/shotgun/pump/china,
			/obj/item/grenade/chem_grenade/incendiary,
			/obj/item/grenade/chem_grenade/teargas,
			/obj/item/grenade/empgrenade,
			/obj/item/grenade/empgrenade/low_yield,
			/obj/item/grenade/flashbang,
			/obj/item/grenade/smokebomb
		)
	)