/datum/trade_station/lancer
	name_pool = list("IRS 'Lancer'" = "IRS Trash Railgun 'Lancer'. They're sending a message. \"Hoho, you want some Trash?\"")
	assortiment = list(
		"Trash" = list(/obj/random/scrap/dense_even = custom_good_amount_range(list(6, 80))),
		"Scrap Lump" = list(/obj/item/scrap_lump = custom_good_amount_range(list(80, 100))),
		"Refined Scrap" = list(/obj/item/stack/sheet/refined_scrap = custom_good_amount_range(list(50, 75))),
		"Broken Computers" = list(/obj/structure/salvageable/computer = custom_good_amount_range(list(6, 12))),
		"Broken Server Box" = list(/obj/structure/salvageable/server = custom_good_amount_range(list(0, 8))),
		"Broken Data Black Box" = list(/obj/structure/salvageable/data = custom_good_amount_range(list(6, 10))),
		"Broken Personal Computers" = list(/obj/structure/salvageable/personal = custom_good_amount_range(list(3, 5))),
		"Broken Cold Storage Container" = list(/obj/structure/salvageable/implant_container = custom_good_amount_range(list(0, 3))),
		"Broken Autolathe" = list(/obj/structure/salvageable/autolathe = custom_good_amount_range(list(0, 2)))
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