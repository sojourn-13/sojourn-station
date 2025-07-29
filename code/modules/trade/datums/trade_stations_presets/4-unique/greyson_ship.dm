/datum/trade_station/greyson_ship
	icon_states = list("greyson_frigate", "ship")
	uid = "greyson"
	tree_x = 0.66
	tree_y = 0.7
	start_discovered = FALSE
	spawn_always = TRUE
	markup = RARE_GOODS
	recommendations_needed = 2
	hidden_inv_threshold = 2000
	recommendation_threshold = 3500
	stations_recommended = list("greyson_printer", "marqua")
	name_pool = list("Tuixiaoayuan" = "A still functioning, heavily armed greyson ship that still produces and offers wares, likely entirely unaware of Greyson Positronics collapse given its \
	automated. It's a wonder it hasn't been raided, but then again it has guns that could level a planet on it. Plus, it hardly offers things of real value...")
	inventory = list(
		"Fuzhuang" = list(
			/obj/item/clothing/suit/space/void/os,
			/obj/item/clothing/suit/greatcoat/os,
			/obj/item/clothing/head/os_cap,
			/obj/item/clothing/under/os_jumpsuit
		)
	)
	hidden_inventory = list(
		"Jiguang Kuijia" = list(
			/obj/item/clothing/under/iron_lock_security = custom_good_name("ILS Security Uniform"),
			/obj/item/clothing/head/soft/iron_lock_security = custom_good_name("ILS Security Cap"),
			/obj/item/clothing/gloves/thick/ablative/iron_lock_security = custom_good_name("ILS Ablative Gloves"),
			/obj/item/clothing/shoes/ablative/iron_lock_security = custom_good_name("ILS Ablative Shoes"),
			/obj/item/clothing/head/helmet/laserproof/iron_lock_security = custom_good_name("ILS Ablative Helmet"),
			/obj/item/clothing/suit/armor/vest/iron_lock_security = custom_good_name("ILS Ablative Vest")
		),
		"Chilun" = list(
			/obj/item/gun/energy/cog = custom_good_name("GP Cog")
		)
	)

	//Return policy I guess

	offer_types = list(
		/obj/item/pc_part/drive/disk/design/onestar/stockparts = offer_data("GP Stockparts Disk", 500, 1),
		/obj/item/pc_part/drive/disk/design/onestar/armor = offer_data("GP Ablative Armor Disk", 500, 1),
		/obj/item/pc_part/drive/disk/design/onestar/spring = offer_data("GP Spring Disk", 2000, 1),
		/obj/item/pc_part/drive/disk/design/onestar/rivet = offer_data("GP Rivet Disk", 2000, 1),
		/obj/item/pc_part/drive/disk/design/onestar/rebar = offer_data("GP Rebar Disk", 2000, 1),
		/obj/item/pc_part/drive/disk/design/onestar/nail_gun = offer_data("GP Nail Gun Disk", 2000, 1),
		/obj/item/pc_part/drive/disk/design/onestar/scaffold = offer_data("GP Scaffold Disk", 2000, 1),
		/obj/item/pc_part/drive/disk/design/onestar/cog = offer_data("GP Cog Disk", 150, 1),
		/obj/item/pc_part/drive/disk/design/onestar = offer_data("GP Tools Disk", 100, 1)
	)

