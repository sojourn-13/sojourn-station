/datum/trade_station/McRonalds
	name_pool = list(
		"McTB 'Dionis'" = "'McRonalds' Trade Beacon 'Dionis'. You hope they still have Happy Meals with a toy."
	)
	uid = "mcronalds"
	tree_x = 0.5
	tree_y = 0.6
	spawn_always = TRUE
	markup = COMMON_GOODS
	base_income = 1600
	wealth = 0
	hidden_inv_threshold = 2000
	recommendation_threshold = 3000
	stations_recommended = list("trapper")
	recommendations_needed = 1
	offer_limit = 30
	inventory = list(
		"Burgers" = list(
			/obj/item/reagent_containers/snacks/bigbiteburger/cargo = good_data("Double RBurger", list(1, 3), 150),
			/obj/item/reagent_containers/snacks/jellyburger/cherry = good_data("Cherry jelly RBurger", list(1, 3), 100),
			/obj/item/reagent_containers/snacks/tofuburger = good_data("Tofu RBurger", list(1, 3), 120)
		),
		"Pizza" = list(
			/obj/item/pizzabox/meat = good_data("Supreme Meatlover: Pizza Alliance", list(1, 3), 400),
			/obj/item/pizzabox/mushroom = good_data("Mushrooms' Impact 3rd", list(1, 3), 450),
			/obj/item/pizzabox/vegetable = good_data("Pizza Fantasy 7: Vegeterian Deluxe Edition", list(1, 3), 450),
			/obj/item/pizzabox/margherita = good_data("PizzeR: autoTomato", list(1, 3), 400)
		),
		"Cakes" = list(
			/obj/item/reagent_containers/snacks/plaincake = good_data("Vanilla cake", list(1, 3), 500),
			/obj/item/reagent_containers/snacks/chocolatecake = good_data("Chocolate cake", list(1, 3), 550),
			/obj/item/reagent_containers/snacks/carrotcake = good_data("Carrot Cake", list(1, 3), 500),
			/obj/item/reagent_containers/snacks/cheesecake = good_data("Cheese Cake", list(1, 3), 500),
			/obj/item/reagent_containers/snacks/orangecake = good_data("Orange Cake", list(1, 3), 500),
			/obj/item/reagent_containers/snacks/limecake = good_data("Lime Cake", list(1, 3), 500),
			/obj/item/reagent_containers/snacks/lemoncake = good_data("Lemon Cake", list(1, 3), 500)
		),
		"Misc" = list(
			/obj/item/reagent_containers/snacks/fishandchips = good_data("Carp and Chips", list(1, 3), 150),
			/obj/item/reagent_containers/condiment/pack/ketchup = good_data("Ketchup Packet", list(1, 3), 5),
			/obj/item/reagent_containers/condiment/pack/hotsauce = good_data("Hotsauce Packet", list(1, 3), 5),
			/obj/item/reagent_containers/condiment/pack/salt = good_data("Salt Packet", list(1, 3), 5),
			/obj/item/reagent_containers/condiment/pack/pepper = good_data("Pepper Packet", list(1, 3), 5)
		)
	)
	hidden_inventory = list(
		"Secret Menu" = list(
			/obj/item/storage/box/monkeycubes = good_data("Monkey Cubes", list(1, 5), 700),
			/obj/item/reagent_containers/snacks/clownburger = good_data("Funny RBurger", list(5, 10), 200),
			/obj/item/reagent_containers/snacks/mimeburger = good_data("Silent RBurger", list(5, 10), 200),
			/obj/item/reagent_containers/snacks/superbiteburger = good_data("Challenge RBurger", list(5, 10), 650),
			/obj/item/reagent_containers/snacks/chickenburger = good_data("Fried Chicken Burger {No relation}", list(5, 10), 200)
			// Needs funny and useful things
		)
	)
	offer_types = list(
		/obj/item/reagent_containers/snacks/meat = offer_data("meat", 100, 10),
		/obj/item/reagent_containers/snacks/meat/corgi = offer_data("corgi meat", 1000, 2),
		/obj/item/reagent_containers/snacks/meat/roachmeat = offer_data("roach meat", 200, 15),
		/obj/item/reagent_containers/snacks/meat/roachmeat/seuche = offer_data("seuche roach meat", 250, 10),
		/obj/item/reagent_containers/snacks/meat/roachmeat/kraftwerk = offer_data("kraftwerk roach meat", 450, 10),
		/obj/item/reagent_containers/snacks/meat/roachmeat/jager = offer_data("jager roach meat", 250, 10),
		/obj/item/reagent_containers/snacks/meat/roachmeat/fuhrer = offer_data("fuhrer roach meat", 350, 5), //Caps it
		/obj/item/reagent_containers/snacks/meat/roachmeat/kaiser = offer_data("kaiser roach meat", 2000, 2)
	)

