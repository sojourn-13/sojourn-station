/datum/trade_station/asterstradecapital
	name_pool = list(
		"FTS 'Solnishko'" = "Free Trade Station 'Solnishko', they sending message \"Zdravstvuite, this is the Trade Station 'Solaris'. We have all of the best products on sale on the frontier! You couldn't get better prices!.\ Everything for sale here, don't be afraid to come aboard and check our wares!\"",
	)
	forced_overmap_zone = list(
		list(24, 26),
		list(30, 30)
	)
	start_discovered = TRUE
	spawn_always = TRUE
	markup = COMMON_GOODS
	base_income = 1600
	wealth = 0
	secret_inv_threshold = 16000
	assortiment = list(
		"Disk Designs" = list(
			/obj/item/computer_hardware/hard_drive/portable/design/misc = good_data("Lonestar Miscellaneous Pack", list(1, 10)),
			/obj/item/computer_hardware/hard_drive/portable/design/robustcells = good_data("Lonestar Robustcells", list(1, 10)),
			/obj/item/computer_hardware/hard_drive/portable/design/janitor = good_data("Lonestar Janitor Pack", list(1, 10)),
			/obj/item/computer_hardware/hard_drive/portable/design/nonlethal_ammo = good_data("H&S Nonlethal Magazines Pack", list(1, 10)),
			/obj/item/computer_hardware/hard_drive/portable/design/lethal_ammo = good_data("H&S Lethal Magazines Pack", list(1, 10)),
			/obj/item/computer_hardware/hard_drive/portable = good_data("Blank Disk", list(1, 10)),
//			/obj/item/storage/deferred/disks = custom_good_amount_range(list(1, 5))
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
			/obj/item/toy/figure/character/bobblehead/excelsior,
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
		"Holland and Sullivan Sidearms & Ammunition" = list(
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

	secret_inventory = list(
		"Robustcell-X" = list(
			/obj/item/cell/large/hyper,
			/obj/item/cell/medium/hyper,
			/obj/item/cell/small/hyper
		),
		"LSS Toolmods" = list(
			/obj/item/tool_upgrade/productivity/diamond_blade,
			/obj/item/tool_upgrade/refinement/laserguide
		),
		"Nicknacks & Bobbles" = list(
			/obj/item/oddity/ls/collector_coin = custom_good_amount_range(list(3, 6)),
			/obj/item/oddity/ls/pamphlet = custom_good_amount_range(list(3, 6)),
			/obj/item/oddity/ls/rod_figure = custom_good_amount_range(list(3, 6)),
			/obj/item/oddity/ls/chess_set = custom_good_amount_range(list(3, 6)),
			/obj/item/oddity/ls/starscope = custom_good_amount_range(list(3, 6)),
			/obj/item/oddity/ls/flashdrive = custom_good_amount_range(list(3, 6)),
			/obj/item/oddity/ls/mutant_tooth = custom_good_amount_range(list(1, 3)),
			/obj/item/oddity/ls/manual = custom_good_amount_range(list(3, 6)),
			/obj/item/oddity/ls/bouquet = custom_good_amount_range(list(3, 6)),
			/obj/item/oddity/ls/magazine = custom_good_amount_range(list(3, 6)),
			/obj/item/oddity/ls/puzzlebox = custom_good_amount_range(list(-1, 2)),
			/obj/item/oddity/ls/dogtags = custom_good_amount_range(list(3, 6)),
			/obj/item/oddity/ls/silk_cloak = custom_good_amount_range(list(3, 6)),
			/obj/item/oddity/ls/kriosan_sword = custom_good_amount_range(list(3, 6)),
			/obj/item/oddity/ls/newton_odd = custom_good_amount_range(list(3, 6)),
			/obj/item/oddity/ls/starprojector = custom_good_amount_range(list(3, 6)),
			/obj/item/oddity/ls/inertdetonator = custom_good_amount_range(list(3, 6))
		)
	)

/* - Why mech stuff, also this isnt compatable in SoJ
	secret_inventory = list(
		"Exosuits" = list(
			/mob/living/exosuit/premade/powerloader/firefighter,
			/mob/living/exosuit/premade/powerloader/flames_blue,
			/mob/living/exosuit/premade/powerloader/flames_red,
			/mob/living/exosuit/premade/light,
			/mob/living/exosuit/premade/heavy,
			/mob/living/exosuit/premade/combat/slayer,
		),
		"Mech Armor" = list(
			/obj/item/robot_parts/robot_component/armour/exosuit/plain,
			/obj/item/robot_parts/robot_component/armour/exosuit/radproof,
			/obj/item/robot_parts/robot_component/armour/exosuit/ablative,
			/obj/item/robot_parts/robot_component/armour/exosuit/combat,
		),
		"Parts" = list(
			/obj/item/mech_component/chassis,
			/obj/item/mech_component/manipulators,
			/obj/item/mech_component/sensors,
			/obj/item/mech_component/propulsion,
		),
		"Soft" = list(
			/obj/item/electronics/circuitboard/exosystem/engineering,
			/obj/item/electronics/circuitboard/exosystem/utility,
			/obj/item/electronics/circuitboard/exosystem/medical,
			/obj/item/electronics/circuitboard/exosystem/weapons,
		),
		"Equipment" = list(
			/obj/item/mech_equipment/mounted_system/taser,
			/obj/item/mech_equipment/mounted_system/taser/ion,
			/obj/item/mech_equipment/mounted_system/taser/plasma,
			/obj/item/mech_equipment/mounted_system/rcd,
			/obj/item/mech_equipment/clamp,
			/obj/item/mech_equipment/light,
			/obj/item/mech_equipment/drill,
			/obj/item/mech_equipment/mounted_system/extinguisher,
			/obj/item/mech_equipment/sleeper,
		),
	)

	offer_types = list(
		/obj/item/mech_component/ = offer_data("mech component", 150, 10),															// base price: 150
		/obj/item/mech_equipment/ = offer_data("mech equipment", 200, 10),															// base price: 200
		/obj/item/robot_parts/robot_component/armour/exosuit/plain = offer_data("exosuit armor plating", 300, 8),					// base price: 300
		/obj/item/robot_parts/robot_component/armour/exosuit/radproof = offer_data("rad-proof exosuit armor plating", 500, 8),		// base price: 500
		/obj/item/robot_parts/robot_component/armour/exosuit/ablative = offer_data("ablative exosuit armor plating", 550, 8),		// base price: 550
		/obj/item/robot_parts/robot_component/armour/exosuit/combat = offer_data("combat exosuit armor plating", 1000, 8),			// base price: 1000
		/obj/item/organ/external/robotic/one_star = offer_data("onestar external prosthetic", 1800, 4),								// base price: 900
		/obj/item/organ/external/robotic/serbian = offer_data("serbian external prosthetic", 600, 8),								// base price: 600; roundstart item, but you'd be giving up an arm and a leg for cash
	)*/

	offer_types = list(
		/obj/item/tool/knife = offer_data("spare knifes", 50, 30),
		/obj/item/reagent_containers/food/snacks/grown = offer_data("spare grown food", 10, 120), //10 credits a grown item basicl
		/datum/reagent/organic/nutriment/honey = offer_data("Honey bottle (60u)", 800, 1),
		/obj/item/organ/external/robotic/one_star = offer_data("grayson external prosthetic", 1800, 4),
	)