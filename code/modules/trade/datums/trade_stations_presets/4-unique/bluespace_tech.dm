/datum/trade_station/bluespace_technical
	uid = "bluespace"
	tree_x = 0.26
	tree_y = 0.4
	start_discovered = FALSE
	spawn_always = TRUE
	markup = UNIQUE_GOODS
	recommendations_needed = 1
	name_pool = list("B-42-Alpha" = "Unknown signature, bluespace traces interfere with sensors. Unable to triangulate object.")
	icon_states = list("ring_active", "ring")


	inventory = list(
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
	hidden_inventory = list(
		"25$$5325@$25@$5325323" = list(
			/obj/item/oddity/broken_necklace = custom_good_amount_range(list(-5,1)),
			/obj/item/implanter/compressed,
			/obj/item/tool_upgrade/augment/randomizer
		)
	)
	offer_types = list(
		/obj/item/bluespace_crystal = offer_data("bluespace crystal", 2000, 10),
		/obj/item/oddity/si_bluespace_scanner = offer_data("Bluespace Tuning Device", 2400, 3),	// Significantly higher material cost per piece, longer production time per piece, more diverse mat req hence increase in sale price
		/obj/item/reagent_containers/snacks/toastedsandwich = offer_data("toasted sandwich", 400, 1),
		/obj/item/gun/energy/plasma/stranger = offer_data("unknown plasma gun", 5000, 1)
	)
