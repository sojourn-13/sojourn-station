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
		/obj/item/tool_upgrade = offer_data("tool upgrade", 200, 0),				// base price: 200
		/obj/item/tool/crowbar/onestar = offer_data("greyson crowbar", 1000, 3),
		/obj/item/tool/pickaxe/onestar = offer_data("greyson pickaxe", 1000, 3),
		/obj/item/tool/pickaxe/jackhammer/onestar = offer_data("greyson jackhammer", 1000, 3),
		/obj/item/tool/screwdriver/combi_driver/onestar = offer_data("greyson combi driver", 1000, 3),
		/obj/item/tool/weldingtool/onestar  = offer_data("greyson welding tool", 1000, 3),
		/obj/item/tool_upgrade/augment/repair_nano = offer_data("repair nano", 5000, 1),
	)
