/datum/trade_station/boozefood
	name_pool = list(
		"LTB 'Vermouth'" = "Lonestar's Trade Beacon 'Vermouth' \"Best Drinks! Best Beverages! Ingredients for your cooks! Anything that is needed for your private bars and more!"
	)
	uid = "commissary"
	tree_x = 0.42
	tree_y = 0.9
	start_discovered = TRUE
	spawn_always = TRUE
	base_income = 1600
	markup = COMMON_GOODS
	wealth = 0
	hidden_inv_threshold = 2000
	recommendation_threshold = 1000
	stations_recommended = list("mcronalds", "serbian")
	inventory = list(
		"Basic Ingredients" = list(
			/obj/item/reagent_containers/food/condiment/flour = good_data("flour sack", list(1, 2), 250),
			/obj/item/reagent_containers/food/drinks/milk = good_data("milk carton", list(1, 2), 100),
			/obj/item/storage/fancy/egg_box = good_data("egg box", list(1, 2), 300),
			/obj/item/reagent_containers/food/snacks/tofu = good_data("tofu", list(1, 2), 20),
			/obj/item/reagent_containers/food/snacks/meat = good_data("meat", list(1, 2), 25),
			/obj/item/reagent_containers/food/condiment/enzyme,
			/obj/item/reagent_containers/food/condiment/cookingoil = good_data("cooking oil bottle", list(1, 2), 200)
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
			/obj/item/reagent_containers/food/drinks/bottle/bluecuracao,
			/obj/item/reagent_containers/food/drinks/bottle/grenadine,
			/obj/item/reagent_containers/food/drinks/bottle/melonliquor,
			/obj/item/reagent_containers/food/drinks/bottle/absinthe,
			/obj/item/reagent_containers/food/drinks/cans/thirteenloko
		),
		"Soft-Drinks" = list(
			/obj/item/reagent_containers/food/drinks/bottle/orangejuice,
			/obj/item/reagent_containers/food/drinks/bottle/tomatojuice,
			/obj/item/reagent_containers/food/drinks/bottle/limejuice,
			/obj/item/reagent_containers/food/drinks/bottle/pineapplejuice,
			/obj/item/reagent_containers/food/drinks/bottle/cream,
			/obj/item/reagent_containers/food/drinks/bottle/cola,
			/obj/item/reagent_containers/food/drinks/bottle/space_up,
			/obj/item/reagent_containers/food/drinks/bottle/space_mountain_wind,
			/obj/item/reagent_containers/food/drinks/cans/starkist,
			/obj/item/reagent_containers/food/drinks/cans/space_up,
			/obj/item/reagent_containers/food/drinks/cans/lemon_lime,
			/obj/item/reagent_containers/food/drinks/cans/iced_tea,
			/obj/item/reagent_containers/food/drinks/cans/grape_juice,
			/obj/item/reagent_containers/food/drinks/cans/waterbottle,
			/obj/item/reagent_containers/food/drinks/cans/melonsoda,
			/obj/item/reagent_containers/food/drinks/cans/dr_gibb,
			/obj/item/reagent_containers/food/drinks/cans/sodawater,
			/obj/item/reagent_containers/food/drinks/cans/tonic
		),
		"Commissary Supplies" = list(
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
			/obj/item/reagent_containers/food/drinks/flask/vacuumflask,
			/obj/item/storage/deferred/kitchen
		)
	)

	hidden_inventory = list(
		"Drinks II" = list(
			/obj/item/reagent_containers/food/drinks/bottle/goldschlager,
			/obj/item/reagent_containers/food/drinks/bottle/pwine,
			/obj/item/reagent_containers/food/drinks/bottle/bottleofnothing,
			/obj/item/reagent_containers/food/drinks/bottle/neulandschnapps,
			/obj/item/reagent_containers/food/drinks/bottle/fernet,
			/obj/item/reagent_containers/food/drinks/bottle/nanatsunoumi,
			/obj/item/reagent_containers/food/drinks/bottle/redcandywine,
			/obj/item/reagent_containers/food/drinks/bottle/small/kvass

		),
		"Kegs" = list(
			/obj/structure/reagent_dispensers/beerkeg/cargo,
			/obj/structure/reagent_dispensers/meadkeg/cargo,
			/obj/structure/reagent_dispensers/premiumwhiskey/cargo
		)
	)

	offer_types = list(
		/obj/item/tool/knife = offer_data("spare knifes", 40, 20),
		/obj/item/reagent_containers/food/snacks/grown = offer_data("spare grown food", 10, 120), //10 credits a grown item basicl
		/obj/item/reagent_containers/food/snacks/kampferburger = offer_data("kampfer burger", 400, 3),
		/obj/item/reagent_containers/food/snacks/panzerburger = offer_data("panzer burger", 500, 2),
		/obj/item/reagent_containers/food/snacks/jagerburger = offer_data("jager burger", 500, 2),
		/obj/item/reagent_containers/food/snacks/seucheburger = offer_data("seuche burger", 500, 2)
	)

/obj/structure/reagent_dispensers/beerkeg/cargo
	price_tag = 1000

/obj/structure/reagent_dispensers/beerkeg/cargo/New()
	..()
	price_tag = 100

/obj/structure/reagent_dispensers/meadkeg/cargo
	price_tag = 3800

/obj/structure/reagent_dispensers/meadkeg/cargo/New()
	..()
	price_tag = 900

/obj/structure/reagent_dispensers/premiumwhiskey/cargo
	price_tag = 5000

/obj/structure/reagent_dispensers/premiumwhiskey/cargo/New()
	..()
	price_tag = 500


