/datum/trade_station/mechas
	name_pool = list("UCCSJ 'Junker'" = "Urianth Construction Company Construction Shuttle 'Junker'. Seems that they construct and sell are exosuit parts. Sensors showing that they have a roving vessel, maybe they have one last batch for sale.\
		\"Hey, dudes, it seems you want some mechas? We currently got a surplus and spare parts.\"")
	base_income = 1600
	wealth = 0
	markup = UNCOMMON_GOODS
	hidden_inv_threshold = 32000
	start_discovered = TRUE
	spawn_always = TRUE
	uid = "mecha"
	recommendations_needed = 2
	inventory = list(
		"Exosuit Parts" = list(
			/obj/item/mech_component/manipulators/light,
			/obj/item/mech_component/propulsion/light,
			/obj/item/mech_component/sensors/light,
			/obj/item/mech_component/chassis/light,
			/obj/item/mech_component/propulsion/tracks,
			/obj/item/mech_component/chassis/pod,
			/obj/item/mech_component/propulsion/quad,
			/obj/item/mech_component/manipulators/powerloader,
			/obj/item/mech_component/propulsion/powerloader,
			/obj/item/mech_component/sensors/powerloader,
			/obj/item/mech_component/chassis/powerloader,
		),
		"Exosuit Auxillery Parts" = list(
			/obj/item/mech_equipment/clamp,
			/obj/item/mech_equipment/light,
			/obj/item/mech_equipment/drill,
			/obj/item/mech_equipment/mounted_system/extinguisher,
			/obj/item/mech_equipment/sleeper,
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
			/obj/item/mecha_parts/mecha_equipment/ranged_weapon/energy/riggedlaser,
			/obj/item/mecha_parts/mecha_equipment/ranged_weapon/ballistic/scattershot/flak/loaded,
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
		/obj/item/mech_ammo_box/scattershot = offer_data("LBX AC 10 ammunition box", 350, 5),
		/obj/item/mech_ammo_box/lmg = offer_data("Ultra AC 2 ammunition box", 350, 5),
		/obj/item/tool_upgrade/reinforcement/plating = offer_data("reinforced plating", 120, 2),
		/obj/item/gun_upgrade/mechanism/overdrive = offer_data("overdrive chip", 175, 2),
		/obj/item/cell/large/moebius/nuclear = offer_data("Soteria \"Atomcell 14000L\"", 575, 3)
	)

/obj/mecha/working/hoverpod/cargo_imported
	price_tag = 3000

/obj/mecha/working/ripley/cargo_imported
	price_tag = 5500

/obj/mecha/working/ivan/cargo_imported
	price_tag = 4000
