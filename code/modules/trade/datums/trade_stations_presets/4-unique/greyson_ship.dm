/datum/trade_station/greyson_ship
	uid = "greyson"
	start_discovered = FALSE
	spawn_always = TRUE
	markup = UNIQUE_GOODS
	recommendations_needed = 1
	secret_inv_threshold = 2000
	recommendation_threshold = 4000
	name_pool = list("Tuixiaoayuan" = "A heavily armored Greyson Positronic trade shuttle somehow still producing and supplying their own good, \
	likely never raided do to it only really producing clothing rather then anything of value.")
	assortiment = list(
		"Fuzhuang" = list(
			/obj/item/clothing/head/helmet/space/os,
			/obj/item/clothing/suit/space/os,
			/obj/item/clothing/suit/greatcoat/os,
			/obj/item/clothing/head/os_cap,
			/obj/item/clothing/under/os_jumpsuit
		)
	)
	secret_inventory = list(
		"Jiguang Kuijia" = list(
			/obj/item/clothing/under/iron_lock_security = custom_good_name("ILS Security Uniform"),
			/obj/item/clothing/head/soft/iron_lock_security = custom_good_name("ILS Security Cap"),
			/obj/item/clothing/gloves/thick/ablasive/iron_lock_security = custom_good_name("ILS Ablasive Gloves"),
			/obj/item/clothing/shoes/ablasive/iron_lock_security = custom_good_name("ILS Ablasive Shoes"),
			/obj/item/clothing/head/helmet/laserproof/iron_lock_security = custom_good_name("ILS Ablasive Helmet"),
			/obj/item/clothing/suit/armor/vest/iron_lock_security = custom_good_name("ILS Ablasive Vest")
		),
		"Chilun" = list(
			/obj/item/gun/energy/cog = custom_good_name("GP Cog")
		)
	)

	//Return policy I guess

	offer_types = list(
		/obj/item/computer_hardware/hard_drive/portable/design/onestar/stockparts = offer_data("GP Stockparts Disk", 2000, 1),
		/obj/item/computer_hardware/hard_drive/portable/design/onestar/armor = offer_data("GP Ablasive Armor Disk", 2000, 1),
		/obj/item/computer_hardware/hard_drive/portable/design/onestar/spring = offer_data("GP Spring Disk", 2000, 1),
		/obj/item/computer_hardware/hard_drive/portable/design/onestar/rivet = offer_data("GP Rivet Disk", 2000, 1),
		/obj/item/computer_hardware/hard_drive/portable/design/onestar/nail_gun = offer_data("GP Nail Gun Disk", 2000, 1),
		/obj/item/computer_hardware/hard_drive/portable/design/onestar/scaffold = offer_data("GP Scaffold Disk", 2000, 1),
		/obj/item/computer_hardware/hard_drive/portable/design/onestar/cog = offer_data("GP Cog Disk", 150, 1)
	)

