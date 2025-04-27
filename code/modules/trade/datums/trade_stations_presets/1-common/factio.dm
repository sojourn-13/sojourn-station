/datum/trade_station/station_factio
	name_pool = list(
		"PRT 'Factor'" = "Autoproduction Trader 'Factor': \"Production facility, this is the trade beacon 'Factor'. We will sell you disks and buy what they print."
	)
	uid = "factio_basic"
	tree_x = 0.66
	tree_y = 0.9
	start_discovered = TRUE
	spawn_always = TRUE
	markup = COMMON_GOODS
	offer_limit = 20
	base_income = 800
	wealth = 0
	hidden_inv_threshold = 1000
	recommendation_threshold = 1000
	stations_recommended = list("greyson")
	regain_stock = FALSE
	inventory = list(
		"Disk Designs" = list(
			/obj/item/pc_part/drive/disk/design/misc = custom_good_nameprice("Lonestar Miscellaneous Pack", list(800, 1000)),
			/obj/item/pc_part/drive/disk/design/robustcells = custom_good_nameprice("Lonestar Robustcells", list(800, 1000)),
			/obj/item/pc_part/drive/disk/design/janitor = custom_good_nameprice("Lonestar Janitor Pack", list(800, 1000)),
			/obj/item/pc_part/drive/disk/design/nonlethal_ammo = custom_good_nameprice("H&S Nonlethal Magazines Pack", list(800, 1000)),
			/obj/item/pc_part/drive/disk/design/lethal_ammo = custom_good_nameprice("H&S Lethal Magazines Pack", list(800, 1000)),
			/obj/item/pc_part/drive/disk/design/security = custom_good_nameprice("Security Miscellaneous Pack", list(800, 1000)),
			/obj/item/pc_part/drive/disk = custom_good_nameprice("Blank Disk", list(1, 10))
		),
		"Printed Goods" = list(
			/obj/item/cell/large = good_data("Large Power Cell", list(-9900, -9850), 60),
			/obj/item/cell/medium = good_data("Medium Power Cell", list(-9900, -9850), 50),
			/obj/item/cell/small = good_data("Small Power Cell", list(-9900, -9850), 40),
			/obj/item/solar_assembly = good_data("Solar Assembly", list(-9900, -9850), 30),
			/obj/item/circuitboard = good_data("Spare Ciruitboard", list(-9900, -9850), 10),
			/obj/item/tracker_electronics = good_data("Tracker Electronics", list(-9900, -9850), 150),
			/obj/item/stock_parts = good_data("Printed Stock Part", list(-9900, -9850), 150),
			/obj/item/device = good_data("Any Divice", list(-9900, -9850), 20),
			/obj/item/camera_assembly = good_data("Camera Assembly", list(-9900, -9850), 30),
			/obj/item/bodybag = good_data("Body Bag", list(-9900, -9850), 15),
			/obj/item/cane = good_data("Cane", list(-9900, -9850), 30),
			/obj/item/light = good_data("Light Tube/Bolb", list(-9900, -9850), 5),
			/obj/item/pc_part = good_data("Computer Hardware", list(-9900, -9850), 19),
			/obj/item/modular_computer = good_data("Computer Frame", list(-9900, -9850), 10),
			/obj/item/construct/conveyor = good_data("Conveyor Belt", list(-9900, -9850), 15),
			/obj/item/construct/conveyor_switch = good_data("Conveyor Switch Frame", list(-900, -850), 15),
			/obj/item/grenade = good_data("Grenage Case", list(-9900, -9850), 150),
			/obj/item/handcuffs = good_data("Hand Cuffs", list(-9900, -9850), 100),
			/obj/item/shield = good_data("Shield", list(-9900, -850), 250),
			/obj/item/gun_upgrade = good_data("Gun Upgrade", list(-9900, -9850), 350),
			/obj/item/tool/baton = good_data("Stun Baton", list(-9900, -9850), 550),
			/obj/item/extinguisher = good_data("Extinguisher", list(-9900, -9850), 30)
		),
		"Assembly Kits" = list(
			/obj/item/toy/consumer/kit/toaster = custom_good_amount_range(list(20, 50))
		)
	)

	hidden_inventory = list(
		"Disk II" = list(
			/obj/item/pc_part/drive/disk/design/components = custom_good_nameprice("Artificer's ARK-034 Components", list(800, 1000)),
			/obj/item/pc_part/drive/disk/design/adv_tools = custom_good_nameprice("Artificer's IJIRO-451 Advanced Tools", list(800, 1000)),
			/obj/item/pc_part/drive/disk/design/circuits = custom_good_nameprice("Artificer's ESPO-830 Circuits", list(800, 1000)),
			/obj/item/pc_part/drive/disk/design/logistics = custom_good_nameprice("Artificer's LAT-018 Logistics", list(800, 1000)),
			/obj/item/pc_part/drive/disk/design/guns/cheap_guns = good_data("H&S - .35 Economy Pack", list(800, 1000), 550),
			/obj/item/pc_part/drive/disk/design/exotic_ammo = good_data("Exotic Ammo Disk", list(800, 1000), 700)
		),
		"Printed II" = list(
			/obj/item/tool/crowbar = good_data("Crowbar", list(-100, -50), 60),
			/obj/item/tool/crowbar/pneumatic = good_data("Pneumatic Crowbar", list(-100, -50), 750),
			/obj/item/tool/multitool = good_data("Multitool", list(-100, -50), 60),
			/obj/item/tool/multitool/advanced = good_data("Advanced Multitool", list(-100, -50), 750),
			/obj/item/tool/weldingtool = good_data("Welding Tool", list(-100, -50), 60),
			/obj/item/tool/weldingtool/advanced = good_data("Advanced Welding Tool", list(-100, -50), 750),
			/obj/item/clothing/glasses/welding = good_data("Welding Goggles", list(-100, -50), 60),
			/obj/item/clothing/head/welding = good_data("Welding Mask", list(-100, -50), 65),
			/obj/item/tool/screwdriver = good_data("Screwdriver", list(-100, -50), 60),
			/obj/item/tool/screwdriver/electric = good_data("Electric Screwdriver", list(-100, -50), 750),
			/obj/item/tool/screwdriver/combi_driver = good_data("Combination Driver", list(-100, -50), 750),
			/obj/item/tool/wirecutters = good_data("Wirecutters", list(-100, -50), 60),
			/obj/item/tool/wirecutters/pliers = good_data("Pliers", list(-100, -50), 70),
			/obj/item/tool/wirecutters/armature = good_data("Armature Cutter", list(-100, -50), 750),
			/obj/item/tool/tape_roll = good_data("Duct Tape", list(-100, -50), 60),
			/obj/item/tool/tape_roll/fiber = good_data("Fiber Tape", list(-100, -50), 120),
			/obj/item/tool/tape_roll/glue = good_data("Glue Bucket", list(-100, -50), 150),
			/obj/item/tool/wrench = good_data("Wrench", list(-100, -50), 60),
			/obj/item/tool/wrench/big_wrench = good_data("Big Wrench", list(-100, -50), 750),
			/obj/item/tool/hammer = good_data("Hammer", list(-100, -50), 60),
			/obj/item/tool/hammer/deadblow = good_data("Deadblow Hammer", list(-100, -50), 250),
			/obj/item/tool/hammer/powered_hammer = good_data("Powered Sledgehammer", list(-100, -50), 750),
			/obj/item/tool/pickaxe = good_data("Pickaxe", list(-100, -50), 60),
			/obj/item/tool/pickaxe/excavation = good_data("Excavation Pickaxe", list(-100, -50), 50),
			/obj/item/tool/knife = good_data("Knife", list(-100, -50), 40),
			/obj/item/tool/knife/tacknife = good_data("Tactical Knife", list(-100, -50), 55),
			/obj/item/tool/hatchet = good_data("Hatchet", list(-100, -50), 50),
			/obj/item/tool/minihoe = good_data("Mini hoe", list(-100, -50), 30),
			/obj/item/tool/shovel = good_data("Shovel", list(-100, -50), 80),
			/obj/item/tool/shovel/combat = good_data("Combat Crovel", list(-100, -50), 950),
			/obj/item/tool/shovel/spade = good_data("Spade", list(-100, -50), 50),
			/obj/item/tool/shovel/power = good_data("Power Shovel 9000", list(-100, -50), 850),
			/obj/item/tool/saw = good_data("Hand Saw", list(-100, -50), 60),
			/obj/item/tool/saw/circular/advanced = good_data("Advanced Circular Saw", list(-100, -50), 850),
			/obj/item/tool/saw/chain = good_data("Chainsaw", list(-100, -50), 300),
			/obj/item/tool/saw/hyper = good_data("TM Hypersaw", list(-100, -50), 350),
			/obj/item/rcd = good_data("RCD", list(-100, -50), 700)
		)
	)

	offer_types = list(
		/obj/item/hatton_magazine = offer_data("Hatton Magazine", 800, 5),
		/obj/item/hatton = offer_data("Hatton", 1000, 1),
		/obj/item/plastique = offer_data("Plastic Explosive", 2000, 1)
	)
