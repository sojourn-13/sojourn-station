/datum/trade_station/mat_refinery
	start_discovered = TRUE
	spawn_always = TRUE
	name_pool = list(
		"RS 'Recoll'" = "Refinery Ship 'Recoll': \"Hey! We are a small refinery looking for customers. We accept all types of ores and we sell refined materials at cheap prices as well!\""
	)
	uid = "materials"
	markup = RARE_GOODS
	base_income = 0		// Needs ore to refine
	wealth = 0
	offer_limit = 30
	secret_inv_threshold = 2000
	recommendation_threshold = 4000
	stations_recommended = list("trash")
	assortiment = list(
		"Flares"  = list(
			/obj/item/device/lighting/glowstick/flare,
			/obj/item/ammo_magazine/ammobox/shotgun/flash,
			/obj/item/gun/projectile/boltgun/flare_gun,
			/obj/item/ammo_casing/flare/blue/prespawn,
			/obj/item/ammo_casing/flare/green/prespawn,
			/obj/item/ammo_casing/flare/prespawn
			),
		"Refined Materials" = list(
			/obj/item/stack/material/plastic/full = good_data("plastic sheets (x120)", list(4, 5)),
			/obj/item/stack/material/cardboard/full = good_data("cardboard sheets (x120)", list(2, 5)),
			/obj/item/stack/material/steel/full = good_data("steel sheets (x120)", list(3, 5)),
			/obj/item/stack/material/plasteel/full = good_data("plasteel sheets (x120)", list(2, 3)),
			/obj/item/stack/material/wood/full = good_data("wood planks (x120)", list(2, 5)),
			/obj/item/stack/material/glass/full = good_data("glass sheets (x120)", list(2, 5)),
			/obj/item/stack/material/plasma/full = good_data("plasma sheets (x120)", list(1, 2))
		)
	)

	secret_inventory = list(
		"Refined Material Stacks" = list(
			/obj/item/stack/material/iron/full = good_data("iron ingots (x120)", list(1, 2)),
			/obj/item/stack/material/silver/full = good_data("silver ingots (x120)", list(1, 2)),
			/obj/item/stack/material/gold/full = good_data("gold ingots (x120)", list(1, 2)),
			/obj/item/stack/material/diamond/full = good_data("diamond sheets (x120)", list(1, 2)),
			/obj/item/stack/material/platinum/full = good_data("platinum sheets (x120)", list(1, 2)),
			/obj/item/stack/material/osmium/full = good_data("osmium ingots (x120)", list(1, 21)),
			/obj/item/stack/material/mhydrogen/full = good_data("metallic hydrogen sheets (x120)", list(1, 2)),
			/obj/item/stack/material/tritium/full = good_data("tritium ingots (x120)", list(1, 2)),
			/obj/item/stack/material/uranium/full = good_data("uranium sheets (x120)", list(1, 2))
		)
	)

	offer_types = list(
		// Trash mats are priced based on expected value of sheets. Ores are priced based on smelting results and are priced slightly better than if the processed sheets were being sold directly.
		/obj/item/trash/material/metal = offer_data("scrap metal", 120, 20),
		/obj/item/trash/material/circuit = offer_data("burnt circuit", 90, 20),
		/obj/item/trash/material/device = offer_data("broken device", 205, 20),
		/obj/item/ore/iron = offer_data("hematite", 20, 0),
		/obj/item/ore/coal = offer_data("raw carbon", 20, 0),
		/obj/item/ore/glass = offer_data("sand", 5, 0),
		/obj/item/ore/silver = offer_data("native silver ore", 125, 0),
		/obj/item/ore/gold = offer_data("native gold ore", 160, 0),
		/obj/item/ore/diamond = offer_data("diamonds", 225, 0),
		/obj/item/ore/osmium = offer_data("raw platinum", 160, 0),
		/obj/item/ore/hydrogen = offer_data("raw hydrogen", 125, 0),
		/obj/item/ore/uranium = offer_data("pitchblende", 225, 0),
		/obj/item/ore/plasma = offer_data("plasma crystals", 80, 0)
	)