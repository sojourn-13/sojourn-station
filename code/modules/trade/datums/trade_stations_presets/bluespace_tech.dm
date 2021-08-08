/datum/trade_station/bluespace_technical
	spawn_probability = 10
	name_pool = list("B-42-Alpha" = "Unknown signature, bluespace traces interfere with sensors. Unable to triangulate object.")
	assortiment = list(
		"#$285@$532#$@" = list(
			/obj/item/circuitboard/teleporter,
			/obj/item/hand_tele,
			/obj/item/tele_spear,
			/obj/item/seeds/bluespacetomatoseed,
			/obj/item/reagent_containers/glass/beaker/bluespace,
			/obj/item/circuitboard/bssilk_hub,
			/obj/item/circuitboard/bssilk_cons,
			/obj/item/clothing/accessory/bs_silk,
			/obj/item/rig_module/teleporter
		)
	)

	offer_types = list(
		/obj/item/bluespace_crystal = 0.25,
		/obj/item/device/mmi/digital/posibrain,
		/obj/item/reagent_containers/food/snacks/csandwich = 4
	)