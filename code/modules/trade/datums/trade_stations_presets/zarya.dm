/datum/trade_station/station_zarya
	name_pool = list(
		"FTB 'Zarya'" = "Free Trade Beacon 'Zarya':\n\"Privet, this is the trade beacon 'Zarya'. We sell electronics, construction, and anything related to engineering! If you are looking for a more general shop, you should contact our main station: FTS 'Solnishko'"
	)
	start_discovered = TRUE
	spawn_always = TRUE
	markup = COMMON_GOODS
	offer_limit = 20
	base_income = 1600
	wealth = 0
	secret_inv_threshold = 16000
	assortiment = list(
		"Vozduh" = list(
			/obj/machinery/portable_atmospherics/canister/sleeping_agent,
			/obj/machinery/portable_atmospherics/canister/nitrogen,
			/obj/machinery/portable_atmospherics/canister/oxygen,
			/obj/item/tank/plasma,
			/obj/machinery/pipedispenser/orderable,
			/obj/machinery/pipedispenser/disposal/orderable
		),
		"Energiya" = list(
			/obj/item/cell/large,
			/obj/item/cell/large/high,
			/obj/item/cell/medium,
			/obj/item/cell/medium/high,
			/obj/item/cell/small,
			/obj/item/cell/small/high,
			/obj/item/solar_assembly,
			/obj/item/circuitboard/solar_control,
			/obj/item/tracker_electronics,
			/obj/machinery/power/emitter,
			/obj/machinery/power/rad_collector,
			/obj/machinery/power/supermatter,
			/obj/machinery/power/generator,
			/obj/machinery/atmospherics/binary/circulator,
			/obj/item/clothing/gloves/insulated
		),
		"Vsyakoe" = list(
			/obj/structure/reagent_dispensers/watertank,
			/obj/item/storage/briefcase/inflatable/empty,
			/obj/item/inflatable/door,
			/obj/item/inflatable/wall,
			/obj/item/stack/material/steel/full,
			/obj/item/storage/belt/utility/full,
			/obj/item/clothing/head/welding,
			/obj/item/tool/omnitool,
			/obj/structure/reagent_dispensers/fueltank,
			/obj/machinery/floodlight
		)
	)

	offer_types = list(
		/obj/item/tool_upgrade = offer_data("tool upgrade", 175, 0),
		/obj/item/rig_module = offer_data("rig module", 400, 10),
		/obj/item/rig/eva = offer_data("EVA suit control module", 600, 4),
		/obj/item/rig/hazard = offer_data("hazard hardsuit control module", 600, 4),
		/obj/item/rig/industrial = offer_data("industrial suit control module", 800, 4),
		/obj/item/rig/hazmat = offer_data("AMI control module", 800, 4),
		/obj/item/rig/combat = offer_data("combat hardsuit control module", 1000, 4),
	)
