/datum/trade_station/suit_up
	name_pool = list("LTB 'Suit Up!'" = "Lonestar Trade Beacon 'Suit Up!'. They're sending a message. \"Suits, voidsuits and more for you, colonists!\"")
	assortiment = list(
		"Voidsuits" = list(
			/obj/item/clothing/suit/space/void,
			/obj/item/clothing/suit/space/void/atmos = custom_good_amount_range(list(1, 5)),
			/obj/item/clothing/suit/space/void/mining = custom_good_amount_range(list(1, 5)),
			/obj/item/clothing/suit/space/void/engineering = custom_good_amount_range(list(-5, 3)),
			/obj/item/clothing/suit/space/void/medical = custom_good_amount_range(list(-5, 3)),
			/obj/item/clothing/suit/space/void/security = custom_good_amount_range(list(-5, 1)),
			/obj/item/clothing/suit/space/void/SCAF = custom_good_amount_range(list(-5, 1))
		),
		"Rig modules" = list(
			/obj/item/rig_module/device/healthscanner,
			/obj/item/rig_module/device/drill,
			/obj/item/rig_module/device/orescanner,
			/obj/item/rig_module/device/rcd,
			/obj/item/rig_module/chem_dispenser,
			/obj/item/rig_module/chem_dispenser/ninja,
			/obj/item/rig_module/chem_dispenser/combat,
			/obj/item/rig_module/chem_dispenser/injector,
			/obj/item/rig_module/maneuvering_jets,
			/obj/item/rig_module/device/flash,
			/obj/item/rig_module/grenade_launcher,
			/obj/item/rig_module/mounted,
			/obj/item/rig_module/mounted/egun,
			/obj/item/rig_module/mounted/taser,
			/obj/item/rig_module/held/energy_blade,
			/obj/item/rig_module/held/shield,
			/obj/item/rig_module/fabricator,
			/obj/item/rig_module/fabricator/energy_net,
			/obj/item/rig_module/stealth_field,
			/obj/item/rig_module/vision/meson,
			/obj/item/rig_module/vision/nvg,
			/obj/item/rig_module/vision/sechud,
			/obj/item/rig_module/vision/medhud,
			/obj/item/rig_module/vision/thermal,
			/obj/item/rig_module/storage
		),
	)

	offer_types = list(
		/obj/item/tool/tape_roll,
		/obj/item/tool/surgicaldrill,
		/obj/item/cell/large
	)