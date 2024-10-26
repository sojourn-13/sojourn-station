/datum/trade_station/mechas
	name_pool = list("UCCSJ 'Junker'" = "Urianth Construction Company Construction Shuttle 'Junker'. Seems that they construct and sell are exosuit parts. Sensors showing that they have a roving vessel, maybe they have one last batch for sale.\
		\"Hey, dudes, it seems you want some mechas? We currently got a surplus and spare parts.\"")
	icon_states = list("htu_frigate", "ship")
	tree_x = 0.78
	tree_y = 0.8
	base_income = 1600
	wealth = 0
	markup = COMMON_GOODS
	hidden_inv_threshold = 32000
	start_discovered = TRUE
	spawn_always = TRUE
	uid = "mecha"
	//recommendations_needed = 2
	inventory = list(
		"Exosuit Parts" = list(
			/obj/item/mecha_parts/chassis/ripley,
			/obj/item/mecha_parts/part/ripley_torso,
			/obj/item/mecha_parts/part/ripley_left_arm,
			/obj/item/mecha_parts/part/ripley_right_arm,
			/obj/item/mecha_parts/part/ripley_left_leg,
			/obj/item/mecha_parts/part/ripley_right_leg,
			/obj/item/mecha_parts/chassis/odysseus,
			/obj/item/mecha_parts/part/odysseus_torso,
			/obj/item/mecha_parts/part/odysseus_head,
			/obj/item/mecha_parts/part/odysseus_left_arm,
			/obj/item/mecha_parts/part/odysseus_right_arm,
			/obj/item/mecha_parts/part/odysseus_left_leg,
			/obj/item/mecha_parts/part/odysseus_right_leg,
			/obj/item/mecha_parts/chassis/ivan,
			/obj/item/mecha_parts/part/ivan_torso,
			/obj/item/mecha_parts/part/ivan_left_arm,
			/obj/item/mecha_parts/part/ivan_right_arm,
			/obj/item/mecha_parts/part/ivan_left_leg,
			/obj/item/mecha_parts/part/ivan_right_leg,
			/obj/item/circuitboard/mecha/main,
			/obj/item/circuitboard/mecha/peripherals
		),
		"Exosuit Auxillery Parts" = list(
			/obj/item/rig_module/vision/medhud,
			/obj/item/tool_upgrade/reinforcement/heatsink,
			/obj/item/tool_upgrade/augment/cell_mount,
			/obj/item/tool_upgrade/augment/hydraulic,
			/obj/item/tool_upgrade/productivity/motor,
			/obj/item/robot_parts/robot_component/diagnosis_unit,
			/obj/item/robot_parts/robot_component/actuator,
			/obj/item/robot_parts/robot_component/camera,
			/obj/item/robot_parts/robot_component/radio,
			/obj/item/robot_parts/robot_component/armour/mkii
		),
		"Exosuit Armor" = list(
			/obj/item/mecha_parts/mecha_equipment/armor_booster/anticcw_armor_booster,
			/obj/item/mecha_parts/mecha_equipment/armor_booster/antiproj_armor_booster,
			/obj/item/mecha_parts/mecha_equipment/repair_droid
		),
		"Exosuit Equipment" = list(
			/obj/item/mecha_parts/mecha_equipment/tesla_energy_relay,
			/obj/item/mecha_parts/mecha_equipment/ranged_weapon/energy/laser,
			/obj/item/mecha_parts/mecha_equipment/ranged_weapon/energy/ion,
			/obj/item/mecha_parts/mecha_equipment/tool/rcd,
			/obj/item/mecha_parts/mecha_equipment/tool/hydraulic_clamp,
			/obj/item/mecha_parts/mecha_equipment/tool/drill,
			/obj/item/mecha_parts/mecha_equipment/tool/drill/diamonddrill,
			/obj/item/mecha_parts/mecha_equipment/tool/extinguisher,
			/obj/item/mecha_parts/mecha_equipment/tool/sleeper,
			/obj/item/mecha_parts/mecha_equipment/ranged_weapon/ballistic/flak/loaded,
			/obj/item/mecha_parts/mecha_equipment/thruster
		)
	)
	hidden_inventory = list(
		"Pre-Made Mechs" = list(
			/obj/mecha/working/hoverpod/cargo_imported = custom_good_amount_range(list(1, 2)),
			/obj/mecha/working/ripley/cargo_imported = custom_good_amount_range(list(-2, 3)),
			/obj/mecha/working/ivan/cargo_imported = custom_good_amount_range(list(-1,2))
		)
	)

	offer_types = list(
		/obj/item/mech_ammo_box/scattershot = offer_data("50mm HEAD ammunition box", 350, 5),
		/obj/item/mech_ammo_box/ultracannon = offer_data("30mm HEAD ammunition box", 350, 5),
		/obj/item/tool_upgrade/reinforcement/plating = offer_data("reinforced plating", 120, 2),
		/obj/item/gun_upgrade/mechanism/overdrive = offer_data("overdrive chip", 175, 2),
		/obj/item/cell/large/moebius/nuclear = offer_data("Soteria \"Atomcell 14000L\"", 700, 3),
		/obj/item/cell/large/greyson = offer_data("GP_SI \"Posi-cell 16000L\"", 1250, 2)
	)

/obj/mecha/working/hoverpod/cargo_imported
	price_tag = 3000

/obj/mecha/working/ripley/cargo_imported
	price_tag = 5500

/obj/mecha/working/ivan/cargo_imported
	price_tag = 4000
