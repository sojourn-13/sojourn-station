/datum/trade_station/boozefood
	name_pool = list(
		"LTB 'Vermouth'" = "Lonestar's Trade Beacon 'Vermouth' \nBest Drinks! Best Beverages! Ingredients for your cooks! Anything that is needed for your private bars and more!"
	)
	start_discovered = TRUE
	spawn_always = TRUE
	base_income = 1600
	markup = COMMON_GOODS
	wealth = 0
	secret_inv_threshold = 16000
	assortiment = list(
		"Basic Ingredients" = list(
			/obj/item/reagent_containers/food/condiment/flour,
			/obj/item/reagent_containers/food/drinks/milk,
			/obj/item/storage/fancy/egg_box,
			/obj/item/reagent_containers/food/snacks/tofu,
			/obj/item/reagent_containers/food/snacks/meat,
			/obj/item/reagent_containers/food/condiment/enzyme,
			/obj/item/reagent_containers/food/condiment/cookingoil
		),
		"Drinks" = list(
			/obj/item/reagent_containers/food/drinks/bottle/gin,
			/obj/item/reagent_containers/food/drinks/bottle/whiskey,
			/obj/item/reagent_containers/food/drinks/bottle/tequilla,
			/obj/item/reagent_containers/food/drinks/bottle/vodka,
			/obj/item/reagent_containers/food/drinks/bottle/vermouth,
			/obj/item/reagent_containers/food/drinks/bottle/rum,
			/obj/item/reagent_containers/food/drinks/bottle/wine,
			/obj/item/reagent_containers/food/drinks/bottle/cognac,
			/obj/item/reagent_containers/food/drinks/bottle/kahlua,
			/obj/item/reagent_containers/food/drinks/bottle/small/beer,
			/obj/item/reagent_containers/food/drinks/bottle/small/ale,
			/obj/item/reagent_containers/food/drinks/bottle/orangejuice,
			/obj/item/reagent_containers/food/drinks/bottle/tomatojuice,
			/obj/item/reagent_containers/food/drinks/bottle/limejuice,
			/obj/item/reagent_containers/food/drinks/bottle/cream,
			/obj/item/reagent_containers/food/drinks/bottle/cola,
			/obj/item/reagent_containers/food/drinks/bottle/space_up,
			/obj/item/reagent_containers/food/drinks/bottle/space_mountain_wind,
			/obj/item/reagent_containers/food/drinks/bottle/bluecuracao,
			/obj/item/reagent_containers/food/drinks/bottle/grenadine,
			/obj/item/reagent_containers/food/drinks/bottle/melonliquor,
			/obj/item/reagent_containers/food/drinks/bottle/absinthe,
			/obj/item/reagent_containers/food/drinks/cans/dr_gibb,
			/obj/item/reagent_containers/food/drinks/cans/sodawater,
			/obj/item/reagent_containers/food/drinks/cans/tonic
		),
		"Flasks, Glasses" = list(
			/obj/item/reagent_containers/food/drinks/drinkingglass,
			/obj/item/reagent_containers/food/drinks/drinkingglass/shot,
			/obj/item/reagent_containers/food/drinks/drinkingglass/mug,
			/obj/item/reagent_containers/food/drinks/drinkingglass/pint,
			/obj/item/reagent_containers/food/drinks/drinkingglass/wineglass,
			/obj/item/reagent_containers/food/drinks/drinkingglass/doble,
			/obj/item/reagent_containers/food/drinks/teapot,
			/obj/item/reagent_containers/food/drinks/pitcher,
			/obj/item/reagent_containers/food/drinks/carafe,
			/obj/item/reagent_containers/food/drinks/flask/barflask,
			/obj/item/reagent_containers/food/drinks/flask/vacuumflask
		),
	)

	secret_inventory = list(
		"Drinks II" = list(
			/obj/item/reagent_containers/food/drinks/bottle/goldschlager,
			/obj/item/reagent_containers/food/drinks/bottle/pwine,
			/obj/item/reagent_containers/food/drinks/bottle/bottleofnothing
		)
	)

	offer_types = list(
		/obj/item/tool/knife = offer_data("spare knifes", 50, 0),
		/obj/item/reagent_containers/food/snacks/grown = offer_data("spare grown food", 10, 120), //10 credits a grown item basicl
		/datum/reagent/ethanol/changelingsting = offer_data("Changeling Sting bottle (60u)", 1500, 1),
		/datum/reagent/ethanol/longislandicedtea = offer_data("Long Island Iced Tea bottle (60u)", 1500, 1),
		/datum/reagent/ethanol/neurotoxin = offer_data("Neurotoxin bottle (60u)", 1500, 1),
		/datum/reagent/ethanol/hippies_delight = offer_data("Hippie's Delight bottle (60u)", 1000, 1),
		/datum/reagent/ethanol/silencer = offer_data("Silencer bottle (60u)", 1000, 1)
	)