/datum/trade_station/mat_refinery
	start_discovered = TRUE
	spawn_always = TRUE
	name_pool = list(
		"RS 'Recoll'" = "Refinery Ship 'Recoll': \"Hey! We are a small refinery looking for customers. We accept all types of ores and we sell refined materials at cheap prices as well!\""
	)
	icon_states = list("htu_frigate", "ship")
	uid = "materials"
	tree_x = 0.1
	tree_y = 0.9
	markup = COMMON_GOODS
	base_income = 0		// Needs ore to refine
	wealth = 0
	offer_limit = 30
	hidden_inv_threshold = 7000
	recommendation_threshold = 2000
	stations_recommended = list("trash")
	inventory = list(
		"Flares"  = list(
			/obj/item/device/lighting/glowstick/flare = good_data("Red Hand Flare", list(1, 5), 10),
			/obj/item/ammo_magazine/ammobox/shotgun/flash,
			/obj/item/gun/projectile/boltgun/flare_gun,
			/obj/item/ammo_casing/flare/blue/prespawn,
			/obj/item/ammo_casing/flare/green/prespawn,
			/obj/item/ammo_casing/flare/prespawn
			),
		"Ore Gathering"  = list(
			/obj/machinery/mining/drill,
			/obj/machinery/mining/brace,
			/obj/structure/ore_box,
			/obj/item/tool/pickaxe/jackhammer,
			/obj/item/tool/pickaxe/drill,
			/obj/item/tool/pickaxe/diamonddrill,
			/obj/item/device/lighting/toggleable/flashlight/heavy,
			/obj/machinery/floodlight
			),
		"Refined Materials" = list(
			/obj/item/stack/material/plastic/full = good_data("plastic sheets (x120)", list(4, 5), 500),
			/obj/item/stack/material/cardboard/full = good_data("cardboard sheets (x120)", list(2, 5), 750),
			/obj/item/stack/material/steel/full = good_data("steel sheets (x120)", list(3, 5), 500),
			/obj/item/stack/material/plasteel/full = good_data("plasteel sheets (x120)", list(2, 3), 2000),
			/obj/item/stack/material/wood/full = good_data("wood planks (x120)", list(2, 5), 360),
			/obj/item/stack/material/glass/full = good_data("glass sheets (x120)", list(2, 5), 500),
			/obj/item/stack/material/plasma/full = good_data("plasma sheets (x120)", list(1, 2), 2000),
			/obj/item/stack/material/glass/plasmaglass/full = good_data("borosilicate glass sheets (x120)", list(3, 5), 1800)
		)
	)

	hidden_inventory = list(
		"Refined Material Stacks" = list(
			/obj/item/stack/material/iron/full = good_data("iron ingots (x120)", list(1, 2), 360),
			/obj/item/stack/material/silver/full = good_data("silver ingots (x120)", list(1, 2), 1500),
			/obj/item/stack/material/gold/full = good_data("gold ingots (x120)", list(1, 2), 2500),
			/obj/item/stack/material/diamond/full = good_data("diamond sheets (x120)", list(1, 2), 7000),
			/obj/item/stack/material/platinum/full = good_data("platinum sheets (x120)", list(1, 2), 5500),
			/obj/item/stack/material/osmium/full = good_data("osmium ingots (x120)", list(1, 21), 3000),
			/obj/item/stack/material/mhydrogen/full = good_data("metallic hydrogen sheets (x120)", list(1, 2), 3000),
			/obj/item/stack/material/tritium/full = good_data("tritium ingots (x120)", list(1, 2), 3000),
			/obj/item/stack/material/uranium/full = good_data("uranium sheets (x120)", list(1, 2), 2500)
		)
	)

	offer_types = list(
		// Trash mats are priced based on expected value of sheets. Ores are priced based on smelting results and are priced slightly better than if the processed sheets were being sold directly.
		/obj/item/tool/pickaxe = offer_data_mods("modified pickaxe (3 upgrades)", 1400, 2, OFFER_MODDED_TOOL, 3),
		/obj/item/tool/shovel = offer_data_mods("modified shovel (3 upgrades)", 1400, 2, OFFER_MODDED_TOOL, 3),
		/obj/item/trash/material/metal = offer_data("scrap metal", 120, 20),
		/obj/item/trash/material/circuit = offer_data("burnt circuit", 90, 20),
		/obj/item/trash/material/device = offer_data("broken device", 205, 20),
		/obj/item/stack/ore/iron = offer_data("full stack of hematite", 300, 2),
		/obj/item/stack/ore/coal = offer_data("full stack of raw carbon", 300, 2),
		/obj/item/stack/ore/glass = offer_data("full stack of sand", 300, 4),
		/obj/item/stack/ore/silver = offer_data("full stack of native silver ore", 900, 1),
		/obj/item/stack/ore/gold = offer_data("full stack of native gold ore", 1800, 1),
		/obj/item/stack/ore/diamond = offer_data("full stack of diamonds", 4500, 1),
		/obj/item/stack/ore/osmium = offer_data("full stack of raw platinum", 3600, 1),
		/obj/item/stack/ore/hydrogen = offer_data("full stack of raw hydrogen", 5040, 1),
		/obj/item/stack/ore/uranium = offer_data("full stack of pitchblende", 3600, 1),
		/obj/item/stack/ore/plasma = offer_data("full stack of plasma crystals", 1800, 1)
	)
