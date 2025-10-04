/datum/trade_station/si_weaponry
	name_pool = list("SI 'Xianhao'" = "Soteria Experimental Weaponry")
	spawn_always = TRUE
	markup = COMMON_GOODS
	icon_states = list("moe_capital", "station")
	uid = "si_weaponry"
	tree_x = 0.5
	tree_y = 0.5
	offer_limit = 12
	base_income = 0
	wealth = 0
	recommendation_threshold = 2000
	stations_recommended = list("illegal1")
	recommendations_needed = 1
	hidden_inv_threshold = 2500
	inventory = list(

		// Visible goods for sale
		"Weapons & Gear" = list(
			/obj/item/gun/energy/sst = good_data("Soteria SST \"Abnegate\" Handgun", list(1,2), 1500),
			/obj/item/gun/energy/sst/formatbound = good_data("Soteria SST \"Format Bound\" Handgun", list(1,2), 1750),
			/obj/item/gun/energy/sst/humility = good_data("Soteria SST \"Humility\" Shotgun", list(1,1), 2500),
			/obj/item/gun/energy/cog/sprocket = good_data("Soteria \"Sprocket\" Laser Carbine", list(1,2), 1000),
			/obj/item/gun/launcher/syringe = good_data("Syringe Gun", list(1,2), 600),
			/obj/item/pc_part/drive/disk/design/medical = good_data("Soteria Medical Designs Disk", list(1,2), 900),
		)
	)
	hidden_inventory = list(
		"Deimos Pattern Weapons" = list(
			/obj/item/gun/projectile/deimos/keris = good_data("Deimos \"Keris\" Caseless Pistol", list(1, 2), 1000),
			/obj/item/gun/projectile/deimos/celurit = good_data("Deimos \"Celurit\" Caseless Carbine", list(1, 2), 1500),
			/obj/item/gun/projectile/deimos/tombak = good_data("Deimos \"Tombak\" Caseless Advanced Rifle", list(1, 1), 2500),
			/obj/item/gun/projectile/deimos/palu = good_data("Deimos \"Palu\" Close Assault Weapon", list(1, 1), 1600),
			/obj/item/gun/projectile/shotgun/pump/deimos/golok = good_data("Deimos \"Golok\" Utility Launcher", list(1, 1), 800),
		),
		"Deimos Pattern Disks" = list(
			/obj/item/pc_part/drive/disk/design/deimos/caseless = good_data("Deimos Caseless Pack", list(1, 2), 1200),
			/obj/item/pc_part/drive/disk/design/deimos/shotguns = good_data("Deimos Shotguns Pack", list(1, 2), 1500),
			/obj/item/pc_part/drive/disk/design/deimos/launchers = good_data("Deimos Launchers Pack", list(1, 2), 2500),
			/obj/item/pc_part/drive/disk/design/deimos/rockets = good_data("Deimos Rockets Pack", list(1, 2), 5000),
		)
	)

	offer_types = list(
		/obj/item/pc_part/drive/disk/design/deimos/caseless = offer_data("Deimos Caseless Disk", 1200, 1),
		/obj/item/pc_part/drive/disk/design/deimos/launchers = offer_data("Deimos Launcher Disk", 800, 1),
		/obj/item/pc_part/drive/disk/design/deimos/shotguns = offer_data("Deimos Shotgun Disk", 700, 1),
		/obj/item/ammo_casing/grenade = offer_data("Grenades", 300, 3),
		/obj/item/pc_part/drive/disk/design/medical = offer_data("Soteria Medical Disk", 800, 1),
		/obj/item/gun/launcher/syringe= offer_data("Syringe Gun", 400, 2),
		/obj/item/gun/energy/sst = offer_data("Soteria SST Abnegate Handgun", 1700, 1),
		/obj/item/gun/energy/sst/humility = offer_data("Soteria SST Humility Shotgun", 2500, 1),
		/obj/item/gun/energy/sst/systemcost = offer_data("Soteria SST System Cost LMG", 3200, 1),
		/obj/item/gun/energy/cog/sprocket = offer_data("Soteria Sprocket Carbine", 1000, 1),
	)

