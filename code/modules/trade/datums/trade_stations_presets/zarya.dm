/datum/trade_station/station_zarya
	name_pool = list("FTS 'Zarya'" = "Free Trade Station 'Zarya', they're sending a message \"Privet, this is free station 'Zarya'. We have everything for sale here, don't be afraid to scan our cargo and check our wares!\".")
	start_discovered = TRUE
	spawn_always = TRUE
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

	offer_types = list()