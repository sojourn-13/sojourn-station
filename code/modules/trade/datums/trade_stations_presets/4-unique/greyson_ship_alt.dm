/datum/trade_station/greyson_printer_ship
	uid = "greyson_printer"
	start_discovered = FALSE
	spawn_always = TRUE
	markup = UNIQUE_GOODS
	base_income = 800
	wealth = 0
	recommendations_needed = 1
	hidden_inv_threshold = 2000
	recommendation_threshold = 4000
	name_pool = list("Dayinji" = "A still functioning, heavily armed greyson ship that still produces and offers wares, likely entirely unaware of Greyson Positronics collapse given its \
	automated. It's a wonder it hasn't been raided, but then again its protected by a massive army of still functioning combat drones. This one specializes in a wide variety of interesting goods.")
	inventory = list(
		"Sheji pan" = list(
			/obj/item/computer_hardware/hard_drive/portable/design/onestar/stockparts = good_data("GP Stockpart Disk", list(0, 1), 900),
			/obj/item/computer_hardware/hard_drive/portable/design/onestar = good_data("GP Tool Disk", list(-2, 1), 1200)
		),
		"Gongju" = list(
			/obj/item/tool/crowbar/onestar = good_data("GP Crowbar", list(-100, -50), 500),
			/obj/item/tool/onestar_multitool = good_data("GP Multitool", list(-100, -50), 600),
			/obj/item/tool/weldingtool/onestar = good_data("GP Welding Tool", list(-100, -50), 500),
			/obj/item/tool/screwdriver/combi_driver/onestar = good_data("GP Combination Drill", list(-100, -50), 700),
			/obj/item/tool/hammer/powered_hammer/onestar_hammer = good_data("GP Sledgehammer", list(-100, -50), 800),
			/obj/item/tool/pickaxe/jackhammer/onestar = good_data("GP Jackhammer", list(-100, -50), 600),
			/obj/item/tool/pickaxe/drill/onestar = good_data("GP Mining Drill", list(-100, -50), 600),
			/obj/item/tool/pickaxe/onestar = good_data("GP Pickaxe", list(-100, -50), 500),
			/obj/item/tool/shovel/onestar_shovel = good_data("GP Shovel", list(-100, -50), 450),
			/obj/item/tool/saw/onestar_saw = good_data("GP Handsaw", list(-100, -50), 700),
			/obj/item/tool/medmultitool = good_data("GP Medical Multitool", list(-100, -50), 800),
			/obj/item/tool/wirecutters/onestar_pliers = good_data("GP Pliers", list(-100, -50), 700)
		),
		"Beijian" = list(
			/obj/item/stock_parts/micro_laser/one_star = good_data("GP Micro Laser", list(-100, -50), 575),
			/obj/item/stock_parts/matter_bin/one_star = good_data("GP Matter Bin", list(-100, -50), 575),
			/obj/item/stock_parts/scanning_module/one_star = good_data("GP Scanning Module", list(-100, -50), 575),
			/obj/item/stock_parts/capacitor/one_star = good_data("GP Capacitor", list(-100, -50), 575),
			/obj/item/stock_parts/manipulator/one_star = good_data("GP Manipulator", list(-100, -50), 575)
		)
	)
	hidden_inventory = list(
		"Wuqi pan" = list(
			/obj/item/computer_hardware/hard_drive/portable/design/onestar/cog = good_data("GP Cog Disk", list(1, 1), 875),
			/obj/item/computer_hardware/hard_drive/portable/design/onestar/armor = good_data("GP Ablative Disk", list(1, 2), 775)
		),
		"Wuqi yinshua" = list(
			/obj/item/gun/energy/cog = good_data("GP Cog", list(-1, 0), 475)
		),
		"Yinhua kuijia" = list(
			/obj/item/clothing/under/iron_lock_security = good_data("ILS Security Uniform", list(-100, -50), 175),
			/obj/item/clothing/head/soft/iron_lock_security = good_data("ILS Security Cap", list(-100, -50), 175),
			/obj/item/clothing/gloves/thick/ablasive/iron_lock_security = good_data("ILS Ablasive Gloves", list(-100, -50), 475),
			/obj/item/clothing/shoes/ablasive/iron_lock_security = good_data("ILS Ablasive Shoes", list(-100, -50), 475),
			/obj/item/clothing/head/helmet/laserproof/iron_lock_security = good_data("ILS Ablasive Helmet", list(-100, -50), 475),
			/obj/item/clothing/suit/armor/vest/iron_lock_security = good_data("ILS Ablasive Vest", list(-100, -50), 475)
		),
		"Gongju mo zu" = list(
			/obj/item/tool_upgrade/augment/holding_tank = good_data("GP Welder Fule Holding Tank", list(-100, -50), 1000),
			/obj/item/tool_upgrade/augment/repair_nano = good_data("GP Nano Repair", list(-100, -50), 1275),
			/obj/item/tool_upgrade/augment/ai_tool = good_data("GP Nano AI", list(-100, -50), 1375),
			//Guns are tools too
			/obj/item/gun_upgrade/mechanism/glass_widow = good_data("GP Glass Widow", list(-100, -50), 1200),
			/obj/item/gun_upgrade/mechanism/greyson_master_catalyst = good_data("GP \"Master Unmaker\" infuser", list(-100, -50), 15000)
		)
	)

	//The projectile guns, no selling the disk as they are op guns

	offer_types = list(
		/obj/item/gun/projectile/spring = offer_data("GP Spring", 2500, 1),
		/obj/item/gun/projectile/rivet = offer_data("GP Rivet", 3000, 1),
		/obj/item/gun/projectile/automatic/nail_gun = offer_data("GP Nail", 6000, 1),
		/obj/item/gun/projectile/automatic/scaffold = offer_data("GP Scaffold", 7500, 1)
	)
