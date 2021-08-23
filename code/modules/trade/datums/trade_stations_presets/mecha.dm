/datum/trade_station/mechas
	name_pool = list("UCCSJ 'Junker'" = "Urianth Construction Company Construction Shuttle 'Junker'. Seems that they construct and sell exosuits. Sensors showing that they have a roving vessel, maybe they have one last batch for sale.\
		\"Hey, dudes, it seems you want some mechas? We currently got a surplus and spare parts.\"")
	offer_amout_devider_of_wanted_goods = 5 //50% less
	assortiment = list(
		"Exosuits" = list(
			/obj/mecha/working/ripley/firefighter,
			/obj/mecha/working/ripley/deathripley,
			/obj/mecha/working/ripley/mining,
			/obj/mecha/working/hoverpod,
			/obj/mecha/medical/odysseus,
			/obj/mecha/combat/gygax/dark,
			/obj/mecha/combat/durand
		),
		"Mech Armor" = list(
			/obj/item/mecha_parts/mecha_equipment/armor_booster/anticcw_armor_booster,
			/obj/item/mecha_parts/mecha_equipment/armor_booster/antiproj_armor_booster,
			/obj/item/mecha_parts/mecha_equipment/combat_shield,
			/obj/item/mecha_parts/mecha_equipment/repair_droid
		),
		"Equipment" = list(
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
