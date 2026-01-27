//Basically this is one of the marqua that retro fitted the non-bluespace drives and now goes around selling other planets new uniquic goods

//Mainly used for introducing new stuff that are from different planets before being added to the loot pool
/datum/trade_station/marqua_ship
	uid = "marqua"
	tree_x = 0.1
	tree_y = 0.4
	start_discovered = TRUE
	spawn_always = TRUE
	markup = UNIQUE_GOODS
	recommendations_needed = 0
	hidden_inv_threshold  = 1
	recommendation_threshold = 0

	icon_states = list("marqua_dyson", "planet")


	//Currently only has seen Sun Branch,
	name_pool = list("Kar Thil Kor" = "Quite a uniquic planet. Many uniquic devolments have been made here, grand. I can trade newest disks from far and wide.")
	inventory = list(
		"Disks" = list(
			/obj/item/pc_part/drive/disk/design/sun_branch = good_data("Sun Branch Disk", list(4, 6), 1200),
			/obj/item/pc_part/drive/disk/design/stamped_branch = good_data("Stamp Branch Disk", list(80, 90), 600),
			//Dont buy this disk, its incompleted basically
			/obj/item/pc_part/drive/disk/design/saint_branch = good_data("Saint of Wax Branch Disk (Incompleted)", list(-100, -90), 7200)
		)
	)
	hidden_inventory = list(
		"Sun Branch Pre-Printed" = list(
			/obj/item/tool/sword/midday = good_data("\"Sunup\" sword", list(4, 6), 1000),
			/obj/item/tool/sword/dawn = good_data("\"Crack of Dawn\" blade", list(4, 6), 1500),
			/obj/item/tool/sword/sun_set = good_data("\"Sunset\" sword", list(4, 6), 800),
			/obj/item/clothing/glasses/firefly_glasses = good_data("\"Firefly\" glasses", list(4, 6), 500)
		),
		"Stamp Branch Pre-Printed" = list(
			/obj/item/gun/projectile/stamper = good_data("\"Stamper\" caseless auto-pistol", list(1, 3), 500),
			/obj/item/gun/projectile/stamp = good_data("\"Stamp\" caseless pistol", list(2, 4), 250),
			/obj/item/clothing/suit/stamped_suit = good_data("\"Wired\" Executive Suit", list(4, 6), 800),
			/obj/item/clothing/glasses/stamped_lens = good_data("\"Stamped\" lens", list(6, 8), 500),
			/obj/item/ammo_magazine/stamp_10x24 = good_data("\"Spring-Lock\" Stamp Mag", list(6, 8), 500),
		),
		"Saint of Wax Branch Pre-Printed" = list(
			//Im really bad at sprites so untill I can get someone to design one ill just be making the sword
			/obj/item/device/lighting/toggleable/lantern/fae = good_data("\"Fae\" Lantern", list(4, 6), 2000), //Fae accually just shouldnt be printable
			/obj/item/gun/matter/seal = good_data("\"Seal\" waxworks rapier", list(4, 6), 3500),
			//obj/item/clothing = good_data("\"Candelabra\" xxxx", list(4, 6), 1000),
			//obj/item/clothing = good_data("\"Waxy Gaze\" xxxx", list(4, 6), 2500),
			//obj/item/clothing = good_data("\"Saint Wix's Grand Design\" xxxx", list(1, 1), 7500)
		)
	)
	offer_types = list(
		/obj/item/organ/internal/psionic_tumor = offer_data("Psionic Tumor", 24000, 1),
		//Melee
		/obj/item/tool/sword/cult/deepmaints = offer_data("deepblue blade", 300, 1),
		/obj/item/tool/hammer/homewrecker/cult/deepmaints = offer_data("mindcrusher", 300, 1),
		/obj/item/tool/saw/chain/cult/deepmaints = offer_data("mindripper", 300, 1),
		/obj/item/tool/sword/machete/cult/deepmaints = offer_data("scorching machete", 300, 1),
		/obj/item/tool/sword/cleaver/cult/deepmaints = offer_data("solar eclipse", 300, 1),
		/obj/item/tool/power_fist/cult/deepmaints = offer_data("mind repeater", 300, 1),
		//Guns and Lasers
		/obj/item/gun/projectile/automatic/sts/rifle/cult/deepmaints = offer_data("\"Aster\" psi-rifle", 300, 1),
		/obj/item/gun/energy/laser/cult/deepmaints = offer_data("\"Moonset\" psi-laser rifle", 300, 1),
		/obj/item/gun/energy/plasma/cassad/cult/deepmaints = offer_data("\"Blue Moon\" psi-plasma rifle", 300, 1),
		/obj/item/gun/energy/plasma/auretian/cult/deepmaints = offer_data("\"Tektite\" psi-energy pistol", 300, 1),
		/obj/item/gun/projectile/automatic/greasegun/cult/deepmaints = offer_data("\"Star Pepper\" psi-submachine gun", 300, 1),
		//Tools
		/obj/item/tool/multitool/advanced/cult/deepmaints = offer_data("multi-mind", 300, 1),
		/obj/item/tool/shovel/power/cult/deepmaints = offer_data("hollow labour", 300, 1),
		/obj/item/tool/screwdriver/combi_driver/cult/deepmaints = offer_data("mind-driver", 300, 1),
		/obj/item/tool/weldingtool/advanced/cult/deepmaints = offer_data("mind candle", 300, 1),
		/obj/item/tool/shovel/combat/cult/deepmaints = offer_data("mental digger", 300, 1),
		/obj/item/tool/wrench/big_wrench/cult/deepmaints = offer_data("thought spanner", 300, 1)
	)
