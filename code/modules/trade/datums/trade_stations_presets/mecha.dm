/datum/trade_station/mechas
	name_pool = list("UCCSJ 'Junker'" = "Urianth Construction Company Construction Shuttle 'Junker'. Seems that they construct and sell exosuits. Sensors showing that they have a roving vessel, maybe they have one last batch for sale.\
		\"Hey, dudes, it seems you want some mechas? We currently got a surplus and spare parts.\"")
	offer_amout_devider_of_wanted_goods = 5 //50% less
	assortiment = list(
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
			/obj/item/mecha_parts/mecha_equipment/tool/extinguisher,
			/obj/item/mecha_parts/mecha_equipment/tool/sleeper,
			/obj/item/mecha_parts/mecha_equipment/ranged_weapon/energy/riggedlaser,
			/obj/item/mecha_parts/mecha_equipment/ranged_weapon/ballistic/scattershot/flak/loaded,
			/obj/item/mecha_parts/mecha_equipment/thruster
		),
	)

	offer_types = list(
		/obj/item/mech_ammo_box/scattershot,
		/obj/item/mech_ammo_box/lmg,
		/obj/item/tool_upgrade/productivity/motor,
		/obj/item/tool_upgrade/augment/hydraulic,
		/obj/item/tool_upgrade/augment/cell_mount,
		/obj/item/tool_upgrade/reinforcement/plating,
		/obj/item/gun_upgrade/mechanism/overdrive,
		/obj/item/cell/large/moebius/nuclear
	)
