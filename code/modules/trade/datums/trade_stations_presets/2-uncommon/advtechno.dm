/datum/trade_station/nauka
	name_pool = list(
		"FTB 'Nauka'" = "Free Trade Beacon 'Nauka': \"Privet, this is the trade beacon 'Nauka'.\""
	)
	uid = "techno_adv"
	tree_x = 0.18
	tree_y = 0.7
	spawn_always = TRUE
	markup = COMMON_GOODS
	offer_limit = 20
	base_income = 1600
	wealth = 0
	hidden_inv_threshold = 2000
	recommendation_threshold = 3000
	stations_recommended = list()
	recommendations_needed = 1
	inventory = list(
		"Reinforcement Mods" = list(
			/obj/item/tool_upgrade/reinforcement/stick = custom_good_amount_range(list(1, 5)),
			/obj/item/tool_upgrade/reinforcement/heatsink = custom_good_amount_range(list(1, 5)),
			/obj/item/tool_upgrade/reinforcement/plating = custom_good_amount_range(list(1, 5)),
			/obj/item/tool_upgrade/reinforcement/guard = custom_good_amount_range(list(1, 5)),
			//obj/item/tool_upgrade/reinforcement/plasmablock = custom_good_amount_range(list(1, 5)),
			//obj/item/tool_upgrade/reinforcement/rubbermesh = custom_good_amount_range(list(1, 5))
		),
		"Producticity Mods" = list(
			/obj/item/tool_upgrade/productivity/ergonomic_grip = custom_good_amount_range(list(1, 5)),
			/obj/item/tool_upgrade/productivity/ratchet = custom_good_amount_range(list(1, 5)),
			/obj/item/tool_upgrade/productivity/red_paint = custom_good_amount_range(list(1, 5)),
			/obj/item/tool_upgrade/productivity/whetstone = custom_good_amount_range(list(1, 2)),
			/obj/item/tool_upgrade/productivity/oxyjet = custom_good_amount_range(list(1, 5)),
			/obj/item/tool_upgrade/productivity/motor = custom_good_amount_range(list(1, 5)),
			//obj/item/tool_upgrade/productivity/antistaining = custom_good_amount_range(list(1, 5)),
			//obj/item/tool_upgrade/productivity/booster = custom_good_amount_range(list(1, 2)),
			//obj/item/tool_upgrade/productivity/injector = custom_good_amount_range(list(1, 5)),
			//obj/item/tool_upgrade/productivity/diamond_blade = custom_good_amount_range(list(1, 2))
		),
		"Refinement Mods" = list(
			/obj/item/tool_upgrade/refinement/stabilized_grip = custom_good_amount_range(list(1, 5)),
			/obj/item/tool_upgrade/refinement/magbit = custom_good_amount_range(list(1, 5)),
			/obj/item/tool_upgrade/refinement/ported_barrel = custom_good_amount_range(list(1, 5)),
			/obj/item/tool_upgrade/refinement/compensatedbarrel = custom_good_amount_range(list(1, 2)),
			//obj/item/tool_upgrade/refinement/laserguide = custom_good_amount_range(list(1, 2))
		),
		"Augment Mods" = list(
			/obj/item/tool_upgrade/augment/cell_mount = custom_good_amount_range(list(1, 5)),
			/obj/item/tool_upgrade/augment/fuel_tank = custom_good_amount_range(list(1, 5)),
			/obj/item/tool_upgrade/augment/expansion = custom_good_amount_range(list(1, 5)),
			/obj/item/tool_upgrade/augment/spikes = custom_good_amount_range(list(1, 5)),
			//obj/item/tool_upgrade/augment/hammer_addon = custom_good_amount_range(list(1, 5)),
			/obj/item/tool_upgrade/augment/hydraulic = custom_good_amount_range(list(1, 5))
		)
	)
	hidden_inventory = list(
		"Silent Mods" = list(
			/obj/item/tool_upgrade/augment/dampener = custom_good_amount_range(list(1, 3)),
			/obj/item/tool_upgrade/refinement/vibcompensator = custom_good_amount_range(list(1, 2))
		)
	)
	offer_types = list(
		/obj/item/oddity/techno = offer_data("unknown technological part", 1600, 2),
		/obj/item/tool/crowbar/onestar = offer_data("greyson crowbar", 1500, 3),
		/obj/item/tool/pickaxe/onestar = offer_data("greyson pickaxe", 2500, 3),  // Takes diamond to print
		/obj/item/tool/pickaxe/jackhammer/onestar = offer_data("greyson jackhammer", 1500, 3),
		/obj/item/tool/screwdriver/combi_driver/onestar = offer_data("greyson combi driver", 2000, 3),
		/obj/item/tool/weldingtool/onestar  = offer_data("greyson welding tool", 2000, 3),
		/obj/item/tool_upgrade/augment/repair_nano = offer_data("repair nano", 1500, 1),
		/obj/item/organ/external/robotic/one_star = offer_data("greyson external prosthetic", 2700, 4)			// base price: 900
	)
