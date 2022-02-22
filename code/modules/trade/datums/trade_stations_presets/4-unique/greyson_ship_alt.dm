/datum/trade_station/greyson_printer_ship
	uid = "greyson_printer"
	start_discovered = FALSE
	spawn_always = TRUE
	markup = UNIQUE_GOODS
	recommendations_needed = 1
	secret_inv_threshold = 2000
	recommendation_threshold = 4000
	name_pool = list("Dayinji" = "A still functioning, heavily armed greyson ship that still produces and offers wares, likely entirely unaware of Greyson Positronics collapse given its \
	automated. It's a wonder it hasn't been raided, but then again its protected by a massive army of still functioning combat drones. This one specializes in a wide variety of interesting goods.")
	assortiment = list(
		"Sheji pan" = list(
			/obj/item/computer_hardware/hard_drive/portable/design/onestar/stockparts = good_data("GP Stockpart Disk", list(0, 1)),
			/obj/item/computer_hardware/hard_drive/portable/design/onestar = good_data("GP Tool Disk", list(-2, 1))
		),
		"Gongju" = list(
			/obj/item/tool/crowbar/onestar = good_data("GP Crowbar", list(-10, -5)),
			/obj/item/tool/onestar_multitool = good_data("GP Multitool", list(-10, -5)),
			/obj/item/tool/weldingtool/onestar = good_data("GP Welding Tool", list(-10, -5)),
			/obj/item/tool/screwdriver/combi_driver/onestar = good_data("GP Combination Drill", list(-10, -5)),
			/obj/item/tool/hammer/powered_hammer/onestar_hammer = good_data("GP Sledgehammer", list(-10, -5)),
			/obj/item/tool/pickaxe/jackhammer/onestar = good_data("GP Jackhammer", list(-10, -5)),
			/obj/item/tool/pickaxe/drill/onestar = good_data("GP Mining Drill", list(-10, -5)),
			/obj/item/tool/pickaxe/onestar = good_data("GP Pickaxe", list(-10, -5)),
			/obj/item/tool/shovel/onestar_shovel = good_data("GP Shovel", list(-10, -5)),
			/obj/item/tool/saw/onestar_saw = good_data("GP Handsaw", list(-10, -5)),
			/obj/item/tool/medmultitool = good_data("GP Medical Multitool", list(-10, -5)),
			/obj/item/tool/wirecutters/onestar_pliers = good_data("GP Pliers", list(-10, -5))
		),
		"Beijian" = list(
			/obj/item/stock_parts/micro_laser/one_star = good_data("GP Micro Laser", list(-10, -5)),
			/obj/item/stock_parts/matter_bin/one_star = good_data("GP Matter Bin", list(-10, -5)),
			/obj/item/stock_parts/scanning_module/one_star = good_data("GP Scanning Module", list(-10, -5)),
			/obj/item/stock_parts/capacitor/one_star = good_data("GP Capacitor", list(-10, -5)),
			/obj/item/stock_parts/manipulator/one_star = good_data("GP Manipulator", list(-10, -5))
		)
	)
	secret_inventory = list(
		"Wuqi pan" = list(
			/obj/item/computer_hardware/hard_drive/portable/design/onestar/cog = good_data("GP Cog Disk", list(1, 1)),
			/obj/item/computer_hardware/hard_drive/portable/design/onestar/armor = good_data("GP Ablative Disk", list(1, 2))
		),
		"Wuqi yinshua" = list(
			/obj/item/gun/energy/cog = good_data("GP Cog", list(-1, 0))
		),
		"Yinhua kuijia" = list(
			/obj/item/clothing/under/iron_lock_security = good_data("ILS Security Uniform", list(-10, -5)),
			/obj/item/clothing/head/soft/iron_lock_security = good_data("ILS Security Cap", list(-10, -5)),
			/obj/item/clothing/gloves/thick/ablasive/iron_lock_security = good_data("ILS Ablasive Gloves", list(-10, -5)),
			/obj/item/clothing/shoes/ablasive/iron_lock_security = good_data("ILS Ablasive Shoes", list(-10, -5)),
			/obj/item/clothing/head/helmet/laserproof/iron_lock_security = good_data("ILS Ablasive Helmet", list(-10, -5)),
			/obj/item/clothing/suit/armor/vest/iron_lock_security = good_data("ILS Ablasive Vest", list(-10, -5))
		),
		"Gongju mo zu" = list(
			/obj/item/tool_upgrade/augment/holding_tank = good_data("GP Welder Fule Holding Tank", list(-10, -5)),
			/obj/item/tool_upgrade/augment/repair_nano = good_data("GP Nano Repair", list(-10, -5)),
			/obj/item/tool_upgrade/augment/ai_tool = good_data("GP Nano AI", list(-10, -5)),
			//Guns are tools too
			/obj/item/gun_upgrade/mechanism/glass_widow = good_data("GP Glass Widow", list(-10, -5)),
			/obj/item/gun_upgrade/mechanism/greyson_master_catalyst = good_data("GP \"Master Unmaker\" infuser", list(-10, -5))
		)
	)

	//The projectile guns, no selling the disk as they are op guns

	offer_types = list(
		/obj/item/gun/projectile/spring = offer_data("GP Spring", 2500, 1),
		/obj/item/gun/projectile/rivet = offer_data("GP Rivet", 3000, 1),
		/obj/item/gun/projectile/automatic/nail_gun = offer_data("GP Nail", 6000, 1),
		/obj/item/gun/projectile/automatic/scaffold = offer_data("GP Scaffold", 7500, 1)
	)
