/datum/trade_station/greyson_printer_ship
	icon_states = list("greyson_frigate", "ship")
	uid = "greyson_printer"
	tree_x = 0.66
	tree_y = 0.6
	start_discovered = FALSE
	spawn_always = TRUE
	markup = RARE_GOODS
	base_income = 800
	wealth = 0
	recommendations_needed = 1
	hidden_inv_threshold = 2000
	recommendation_threshold = 3500
	regain_stock = FALSE
	name_pool = list("Dayinji" = "A still functioning, heavily armed greyson ship that still produces and offers wares, likely entirely unaware of Greyson Positronics collapse given its \
	automated. It's a wonder it hasn't been raided, but then again its protected by a massive army of still functioning combat drones. This one specializes in a wide variety of interesting goods.")
	inventory = list(
		"Sheji pan" = list(
			/obj/item/clothing/suit/space/void/greyson = good_data("GP 'Zhengdou' hardsuit", list(5, 5), 25000),
			/obj/item/tank/onestar_regenerator = good_data("OS Type - 13 'Tiantipenquan'", list(5,10), 2000)
		),
		"Gongju" = list(
			/obj/item/tool/crowbar/onestar = custom_good_nameprice("GP Crowbar", list(-100, -50)),
			/obj/item/tool/multitool/advanced/onestar = custom_good_nameprice("GP Multitool", list(-100, -50)),
			/obj/item/tool/weldingtool/onestar = custom_good_nameprice("GP Welding Tool", list(-100, -50)),
			/obj/item/tool/screwdriver/combi_driver/onestar = custom_good_nameprice("GP Combination Drill", list(-100, -50)),
			/obj/item/tool/hammer/powered_hammer/onestar_hammer = custom_good_nameprice("GP Sledgehammer", list(-100, -50)),
			/obj/item/tool/pickaxe/jackhammer/onestar = custom_good_nameprice("GP Jackhammer", list(-100, -50)),
			/obj/item/tool/pickaxe/drill/onestar = custom_good_nameprice("GP Mining Drill", list(-100, -50)),
			/obj/item/tool/pickaxe/onestar = custom_good_nameprice("GP Pickaxe", list(-100, -500)),
			/obj/item/tool/shovel/onestar_shovel = custom_good_nameprice("GP Shovel", list(-100, -50)),
			/obj/item/tool/saw/onestar_saw = custom_good_nameprice("GP Handsaw", list(-100, -50)),
			/obj/item/tool/medmultitool = custom_good_nameprice("GP Medical Multitool", list(-100, -50)),
			/obj/item/tool/wirecutters/onestar_pliers = custom_good_nameprice("GP Pliers", list(-100, -50))
		),
		"Beijian" = list(
			/obj/item/stock_parts/micro_laser/one_star = custom_good_nameprice("GP Micro Laser", list(-100, -50)),
			/obj/item/stock_parts/matter_bin/one_star = custom_good_nameprice("GP Matter Bin", list(-100, -50)),
			/obj/item/stock_parts/scanning_module/one_star = custom_good_nameprice("GP Scanning Module", list(-100, -50)),
			/obj/item/stock_parts/capacitor/one_star = custom_good_nameprice("GP Capacitor", list(-100, -50)),
			/obj/item/stock_parts/manipulator/one_star = custom_good_nameprice("GP Manipulator", list(-100, -50))
		)
	)
	hidden_inventory = list(
		"Wuqi pan" = list(
			/obj/item/pc_part/drive/disk/design/onestar/cog = custom_good_nameprice("GP Cog Disk", list(50, 150)),
			/obj/item/pc_part/drive/disk/design/onestar/armor = custom_good_nameprice("GP Ablative Disk", list(20, 30))
		),
		"Wuqi yinshua" = list(
			/obj/item/gun/energy/cog = good_data("GP Cog", list(-1, 0), 475)
		),
		"Yinhua kuijia" = list(
			/obj/item/clothing/under/iron_lock_security = good_data("ILS Security Uniform", list(-100, -50), 175),
			/obj/item/clothing/head/soft/iron_lock_security = good_data("ILS Security Cap", list(-100, -50), 175),
			/obj/item/clothing/gloves/thick/ablative/iron_lock_security = good_data("ILS Ablative Gloves", list(-100, -50), 475),
			/obj/item/clothing/shoes/ablative/iron_lock_security = good_data("ILS Ablative Shoes", list(-100, -50), 475),
			/obj/item/clothing/head/helmet/laserproof/iron_lock_security = good_data("ILS Ablative Helmet", list(-100, -50), 475),
			/obj/item/clothing/suit/armor/vest/iron_lock_security = good_data("ILS Ablative Vest", list(-100, -50), 475)
		),
		"Gongju mo zu" = list(
			/obj/item/tool_upgrade/augment/holding_tank = custom_good_nameprice("GP Welder Fule Holding Tank", list(-100, -50)),
			/obj/item/tool_upgrade/augment/repair_nano = custom_good_nameprice("GP Nano Repair", list(-100, -50)),
			/obj/item/tool_upgrade/augment/ai_tool = custom_good_nameprice("GP Nano AI", list(-100, -50)),
			//Guns are tools too
			/obj/item/gun_upgrade/mechanism/glass_widow = custom_good_nameprice("GP Glass Widow", list(-100, -50)),
			/obj/item/gun_upgrade/mechanism/greyson_master_catalyst = custom_good_nameprice("GP \"Master Unmaker\" infuser", list(-100, -50))
		)
	)

	//The projectile guns, no selling the disk as they are op guns

	offer_types = list(
		/obj/item/gun/projectile/spring = offer_data("GP Spring", 2500, 1),
		/obj/item/gun/projectile/rivet = offer_data("GP Rivet", 3000, 1),
		/obj/item/gun/projectile/rebar = offer_data("GP Rebar", 4000, 1),
		/obj/item/gun/projectile/automatic/nail_gun = offer_data("GP Nail", 6000, 1),
		/obj/item/gun/projectile/trouble_shooter = offer_data("GP Trouble Shooter", 18000, 1),
		/obj/item/gun/projectile/automatic/scaffold = offer_data("GP Scaffold", 7500, 1)
	)
