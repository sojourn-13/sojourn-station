/datum/trade_station/asterstradecapital
	name_pool = list("FTS 'Solnishko'" = "Free Trade Station 'Solnishko', they sending message \"Zdravstvuite, this is the Trade Station 'Solaris'. We have all of the best products on sale on the frontier! You couldn't get better prices!.\ Everything for sale here, don't be afraid to come aboard and check our wares!\"")
	start_discovered = TRUE
	spawn_always = TRUE
	forced_overmap_zone = list(
		list(24, 26),
		list(30, 30)
	)
	assortiment = list(
		"Disk Designs" = list(
			/obj/item/computer_hardware/hard_drive/portable/design/misc = good_data("Lonestar Miscellaneous Pack", list(1, 10)),
			/obj/item/computer_hardware/hard_drive/portable/design/robustcells = good_data("Lonestar Robustcells", list(1, 10)),
			/obj/item/computer_hardware/hard_drive/portable/design/janitor = good_data("Lonestar Janitor Pack", list(1, 10)),
			/obj/item/computer_hardware/hard_drive/portable/design/nonlethal_ammo = good_data("H&S Nonlethal Magazines Pack", list(1, 10)),
			/obj/item/computer_hardware/hard_drive/portable/design/lethal_ammo = good_data("H&S Lethal Magazines Pack", list(1, 10)),
			/obj/item/computer_hardware/hard_drive/portable = custom_good_name("Blank Data Disk")
		),
		"Tools and Equipment" = list(
			/obj/item/clothing/suit/storage/hazardvest,
			/obj/item/storage/pouch/small_generic,
			/obj/item/storage/pouch/ammo,
			/obj/item/storage/belt/utility,
			/obj/item/device/lighting/toggleable/flashlight,
			/obj/item/device/lighting/toggleable/flashlight/heavy,
			/obj/item/tool/omnitool = good_data("Lonestar \"Munchkin 5000\"", list(1, 3)),
			/obj/item/tool/crowbar,
			/obj/item/tool/screwdriver,
			/obj/item/tool/shovel,
			/obj/item/tool/wirecutters,
			/obj/item/tool/wrench,
			/obj/item/tool/weldingtool,
			/obj/item/tool/tape_roll
		),
		"Lonestar Cells" = list(
			/obj/item/cell/small,
			/obj/item/cell/small/high,
			/obj/item/cell/small/super,
			/obj/item/cell/medium,
			/obj/item/cell/medium/high,
			/obj/item/cell/medium/super,
			/obj/item/cell/large,
			/obj/item/cell/large/high,
			/obj/item/cell/large/super
		),
		"Toys" = list(
			/obj/item/toy/junk/balloon = good_data("Water Balloon", list(1, 50)),
			/obj/item/toy/junk/blink,
			/obj/item/toy/junk/inflatable_duck,
			/obj/item/toy/junk/eight_ball,
			/obj/item/toy/weapon/sword,
			/obj/item/toy/weapon/katana,
			/obj/item/toy/junk/snappop,
			/obj/item/toy/junk/bosunwhistle,
			/obj/item/toy/figure/character/bobblehead/serbian,
			/obj/item/toy/figure/character/bobblehead/acolyte,
			/obj/item/toy/figure/character/bobblehead/carrion,
			/obj/item/toy/figure/character/bobblehead/roach,
			/obj/item/toy/figure/character/bobblehead/vagabond,
			/obj/item/toy/figure/character/bobblehead/rooster,
			/obj/item/toy/figure/character/bobblehead/barking_dog,
			/obj/item/toy/figure/character/bobblehead/red_soldier,
			/obj/item/toy/figure/character/bobblehead/metacat,
			/obj/item/toy/figure/character/bobblehead/shitcurity,
			/obj/item/toy/figure/character/bobblehead/metro_patrolman
		),
		"Holland and Sullivan Sidearms & Ammunitions" = list(
			/obj/item/clothing/accessory/holster,
			/obj/item/clothing/accessory/holster/armpit,
			/obj/item/clothing/accessory/holster/waist,
			/obj/item/clothing/accessory/holster/hip,
			/obj/item/gun/projectile/revolver/detective,
			/obj/item/gun/projectile/olivaw,
			/obj/item/gun/projectile/giskard,
			/obj/item/gun/energy/gun/martin,
			/obj/item/gun/energy/gun,
			/obj/item/ammo_magazine/pistol_35,
			/obj/item/ammo_magazine/pistol_35/rubber,
			/obj/item/ammo_magazine/magnum_40 = custom_good_amount_range(list(-1, 3)),
			/obj/item/ammo_magazine/magnum_40/rubber = custom_good_amount_range(list(-1, 5)),
			/obj/item/ammo_magazine/ammobox/pistol_35,
			/obj/item/ammo_magazine/ammobox/pistol_35/rubber
		),
		"Miscellanous" = list(
			/obj/item/device/camera,
			/obj/item/device/camera_film,
			/obj/item/device/toner,
			/obj/item/storage/photo_album,
			/obj/item/wrapping_paper,
			/obj/item/packageWrap,
			/obj/item/reagent_containers/glass/paint/red = good_data("Red Paint", list(1, 10)),
			/obj/item/reagent_containers/glass/paint/green = good_data("Green Paint", list(1, 10)),
			/obj/item/reagent_containers/glass/paint/blue = good_data("Blue Paint", list(1, 10)),
			/obj/item/reagent_containers/glass/paint/yellow = good_data("Yellow Paint", list(1, 10)),
			/obj/item/reagent_containers/glass/paint/purple = good_data("Purple Paint", list(1, 10)),
			/obj/item/reagent_containers/glass/paint/black = good_data("Black Paint", list(1, 10)),
			/obj/item/reagent_containers/glass/paint/white = good_data("White Paint", list(1, 10)),
			/obj/item/storage/lunchbox = good_data("Lunchbox", list(1, 10)),
			/obj/item/storage/lunchbox/rainbow = good_data("Rainbow Lunchbox", list(1, 10)),
			/obj/item/storage/lunchbox/cat = good_data("Cat Lunchbox", list(1, 10)),
			/obj/item/mop,
			/obj/item/caution,
			/obj/item/storage/bag/trash,
			/obj/item/reagent_containers/spray/cleaner,
			/obj/item/reagent_containers/glass/rag,
			/obj/item/organ_module/active/simple/armshield
		),
	)