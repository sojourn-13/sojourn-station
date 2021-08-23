/datum/trade_station/lancer
	name_pool = list("IRS 'Lancer'" = "IRS Trash Railgun 'Lancer'. They're sending a message. \"Hoho, you want some Trash?\"")
	offer_amout_devider_of_wanted_goods = 6 //less items do to cubes being really hard to stack and rather long to make food items
	assortiment = list(
		"Trash" = list(/obj/random/scrap/dense_even = custom_good_amount_range(list(6, 80))),
		"Scrap Lump" = list(/obj/item/scrap_lump = custom_good_amount_range(list(80, 100))),
		"Salvageable Machines" = list(
			/obj/structure/salvageable/computer = custom_good_amount_range(list(50, 75)),
			/obj/structure/salvageable/personal = custom_good_amount_range(list(0, 8)),
			/obj/structure/salvageable/server = custom_good_amount_range(list(6, 12)),
			/obj/structure/salvageable/data = custom_good_amount_range(list(6, 10)),
			/obj/structure/salvageable/implant_container = custom_good_amount_range(list(3, 5)),
			/obj/structure/salvageable/autolathe = custom_good_amount_range(list(0, 2)),
		),
		"Refined Scrap" = list(/obj/item/stack/sheet/refined_scrap = custom_good_amount_range(list(50, 75))),
	)

	offer_types = list(
		/obj/structure/scrap_cube,
		/obj/item/reagent_containers/food/snacks/baconburger,
		/obj/item/reagent_containers/food/snacks/blt
	)
//imo way better place of doing the whole list to be in same file as the ship - Trilby
/obj/random/scrap
	price_tag = 50

/obj/structure/scrap_cube
	price_tag = 60 //Just compressed random scrap so lets not make it to proffitable to buy and send up after clamping - Trilby

/obj/structure/salvageable/computer
	price_tag = 120

/obj/structure/salvageable/personal
	price_tag = 520 //Really good stuff can be found in it

/obj/structure/salvageable/server
	price_tag = 250

/obj/structure/salvageable/data
	price_tag = 225

/obj/structure/salvageable/implant_container
	price_tag = 350

/obj/structure/salvageable/autolathe
	price_tag = 625

/obj/item/scrap_lump
	price_tag = 3

/obj/item/stack/sheet/refined_scrap
	price_tag = 5 //Proffit!