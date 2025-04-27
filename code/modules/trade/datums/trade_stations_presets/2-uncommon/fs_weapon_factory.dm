/datum/trade_station/fs_factory
	name_pool = list("XSMS 'Kaida'" = "Xanaroth Syndicate Manufacturing Station 'Kaida'. \"Well if it isn't our favorite trade partner, we got some side deals just for you!\"")
	spawn_always = TRUE
	markup = COMMON_GOODS		// dept-specific stuff should be more expensive for guild
	uid = "fs_guns"
	tree_x = 0.82
	tree_y = 0.7
	offer_limit = 20
	base_income = 0
	wealth = 0
//	secret_inv_threshold = 2000
	recommendation_threshold = 3000
	icon_states = list("htu_capital", "object")
	stations_recommended = list("illegal1")
	recommendations_needed = 1
	inventory = list(
		"Ballistic Weapons" = list(
			/obj/item/gun/projectile/automatic/c20r,
			/obj/item/gun/projectile/automatic/sts/rifle,
			/obj/item/gun/projectile/automatic/pitbull,
			/obj/item/gun/projectile/boltgun/lever,
			/obj/item/gun/projectile/boltgun/sa = good_data("Mosin boltaction rifle", list(1, 5), 500),
			/obj/item/gun/projectile/shotgun/pump/gladstone,
			/obj/item/gun/projectile/shotgun/pump/bull,
			/obj/item/gun/projectile/shotgun/pug,
			/obj/item/gun/projectile/shotgun/pump = good_data("Grizzly shotgun", list(1, 5), 700),
		),
		"Ammunition" = list(
			/obj/item/ammo_magazine/c10x24 = custom_good_amount_range(list(1, 10)),
			//obj/item/ammo_magazine/a75 = custom_good_amount_range(list(1, 10)),
			/obj/item/ammo_magazine/heavy_rifle_408_drum = custom_good_amount_range(list(1, 10)),
			/obj/item/ammo_magazine/m12/pellet = custom_good_amount_range(list(1, 10)),
			/obj/item/ammo_casing/antim/lethal/prespawned = custom_good_amount_range(list(1, 10)),
			/obj/item/ammo_casing/antim/incend/prespawned = custom_good_amount_range(list(1, 10)),

			/obj/item/ammo_magazine/ammobox/heavy_rifle_408_small,
			/obj/item/ammo_magazine/ammobox/rifle_75_small,
			/obj/item/ammo_magazine/ammobox/light_rifle_257_small,
			/obj/item/ammo_magazine/ammobox/shotgun,
			/obj/item/ammo_magazine/ammobox/kurz_50,
			/obj/item/ammo_magazine/ammobox/magnum_40,
			/obj/item/ammo_magazine/ammobox/pistol_35
		),
		"Energy Weapons" = list(
			/obj/item/gun/energy/gun,
			/obj/item/gun/energy/gun/martin
		),
		"Grenades" = list(
			/obj/item/gun/projectile/shotgun/pump/china,
			/obj/item/grenade/chem_grenade/incendiary,
			/obj/item/grenade/chem_grenade/teargas,
			/obj/item/grenade/empgrenade/low_yield,
			/obj/item/grenade/flashbang,
			/obj/item/grenade/frag/stinger,
			/obj/item/grenade/smokebomb
		)
	)
	hidden_inventory = list(
		"High-End Grenades" = list(
			/obj/item/grenade/empgrenade,
			/obj/item/grenade/frag,
			/obj/item/grenade/explosive,
			/obj/item/grenade/anti_photon,
			/obj/item/grenade/heatwave,
			/obj/item/plastique = good_data("plastic explosive", (list(2, 4)), 1500)
		),
		"Top Class Firearms" = list(
			/obj/item/gun/projectile/boltgun/scout,
			/obj/item/gun/projectile/basilisk,
			/obj/item/gun/projectile/revolver/hornet,
			/obj/item/gun/projectile/revolver/tacticool_revolver
		),
		"High End Laser Guns" = list(
			/obj/item/gun/energy/firestorm,
			/obj/item/gun/energy/xray,
			/obj/item/gun/energy/mindflayer,
			/obj/item/gun/energy/lasercore,
			/obj/item/gun/energy/pulse/cassad
		),
		"Surplus Gun Parts & Disk for Resale" = list(
			/obj/item/pc_part/drive/disk/design/gun_frames/resale/high = good_data("SA Gun Frame Disk", list(1, 1), 1450),
			/obj/item/part/gun/grip/serb,
			/obj/item/part/gun/mechanism/autorifle,
			/obj/item/part/gun/mechanism/smg,
			/obj/item/part/gun/barrel/lrifle,
		)
	)

	offer_types = list(
		/obj/item/gun/energy/laser/railgun/railrifle= offer_data("\"Reductor\" rail rifle", 3500, 1),
		/obj/item/gun_upgrade/mechanism/overshooter = offer_data("overshooter", 400, 2),
		/obj/item/gun_upgrade/mechanism/weintraub = offer_data("\"Hurricane\" full auto kit", 450, 3),
		/obj/item/gun_upgrade/trigger/dangerzone = offer_data("\"Dangerzone\" trigger", 250, 3),
		/obj/item/gun_upgrade/muzzle/silencer = offer_data("silencer", 150, 6),
		/obj/item/gun_upgrade/barrel/bore = offer_data("bored barrel", 750, 2),
		/obj/item/gun_upgrade/barrel/forged = offer_data("forged barrel", 750, 4),
		/obj/item/gun_upgrade/magwell/auto_eject = offer_data("H&S \"Dropper\" Magwell Braker", 450, 5),
		/obj/item/clothing/glasses/powered/night/guild  = offer_data("Optimized NV Goggles", 1000, 1)
	)
