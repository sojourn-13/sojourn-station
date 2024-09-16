//----------------------------------------------
//-----------------HOSPITALITY------------------
//----------------------------------------------
/*
/datum/supply_pack/vending_bar
	name = "Bartending supply crate"
	contains = list(/obj/item/vending_refill/boozeomat)
	cost = 1000
	containertype = /obj/structure/closet/crate/freezer
	crate_name = "bartending supply crate"
	group = "Hospitality"

/datum/supply_pack/vending_coffee
	name = "Hotdrinks supply crate"
	contains = list(/obj/item/vending_refill/coffee,
					/obj/item/vending_refill/coffee,
					/obj/item/vending_refill/coffee)
	cost = 1000
	containertype = /obj/structure/closet/crate/freezer
	crate_name = "hotdrinks supply crate"
	group = "Hospitality"

/datum/supply_pack/vending_snack
	name = "Snack supply crate"
	contains = list(/obj/item/vending_refill/snack,
					/obj/item/vending_refill/snack,
					/obj/item/vending_refill/snack)
	cost = 1000
	containertype = /obj/structure/closet/crate/freezer
	crate_name = "snack supply crate"
	group = "Hospitality"

/datum/supply_pack/vending_cola
	name = "Softdrinks supply crate"
	contains = list(/obj/item/vending_refill/cola,
					/obj/item/vending_refill/cola,
					/obj/item/vending_refill/cola)
	cost = 1000
	containertype = /obj/structure/closet/crate/freezer
	crate_name = "softdrinks supply crate"
	group = "Hospitality"

/datum/supply_pack/vending_cigarette
	name = "Cigarette supply crate"
	contains = list(/obj/item/vending_refill/cigarette,
					/obj/item/vending_refill/cigarette,
					/obj/item/vending_refill/cigarette)
	cost = 1000
	containertype = /obj/structure/closet/crate/freezer
	crate_name = "cigarette supply crate"
	group = "Hospitality"
*/

/datum/supply_pack/cateringbirthday
	name = "Birthday Catering Crate"
	contains = list(/obj/item/storage/box/drinkingglasses,
					/obj/item/reagent_containers/food/drinks/shaker,
					/obj/item/reagent_containers/food/drinks/flask/barflask,
					/obj/item/reagent_containers/food/drinks/bottle/orangejuice,
					/obj/item/reagent_containers/food/drinks/bottle/space_up,
					/obj/item/reagent_containers/food/drinks/bottle/cola,
					/obj/item/reagent_containers/food/snacks/sliceable/birthdaycake,
					/obj/item/tool/knife,
					/obj/item/storage/fancy/heartbox,
					/obj/item/storage/fancy/heartbox,
					/obj/item/storage/fancy/heartbox,
					/obj/item/paper/card/smile,
					/obj/item/paper/card/smile,
					/obj/item/paper/card/heart,
					/obj/item/paper/card/heart,
					/obj/item/paper/card/cat,
					/obj/item/paper/card/cat,
					/obj/item/paper/card/flower,
					/obj/item/paper/card/flower,
					/obj/item/clothing/head/costume/misc/cake)
	cost = 200
	containertype = /obj/structure/closet/crate
	crate_name = "birthday catering crate"
	group = "Hospitality"

/datum/supply_pack/bardrinks
	name = "Bartending resupply crate"
	contains = list(/obj/item/reagent_containers/food/drinks/bottle/gin = 2,/obj/item/reagent_containers/food/drinks/bottle/whiskey = 2,
					/obj/item/reagent_containers/food/drinks/bottle/tequilla = 2,/obj/item/reagent_containers/food/drinks/bottle/vodka = 2,
					/obj/item/reagent_containers/food/drinks/bottle/vermouth = 2,/obj/item/reagent_containers/food/drinks/bottle/rum = 2,
					/obj/item/reagent_containers/food/drinks/bottle/wine = 3,/obj/item/reagent_containers/food/drinks/bottle/cognac = 2,
					/obj/item/reagent_containers/food/drinks/bottle/kahlua = 3,/obj/item/reagent_containers/food/drinks/bottle/small/beer = 6,
					/obj/item/reagent_containers/food/drinks/bottle/small/ale = 6,/obj/item/reagent_containers/food/drinks/bottle/orangejuice = 2,
					/obj/item/reagent_containers/food/drinks/bottle/tomatojuice = 2,/obj/item/reagent_containers/food/drinks/bottle/limejuice = 2,
					/obj/item/reagent_containers/food/drinks/bottle/cream = 2,/obj/item/reagent_containers/food/drinks/cans/tonic = 6,
					/obj/item/reagent_containers/food/drinks/bottle/cola = 5,/obj/item/reagent_containers/food/drinks/bottle/space_up = 5,
					/obj/item/reagent_containers/food/drinks/bottle/space_mountain_wind = 5,/obj/item/reagent_containers/food/drinks/cans/sodawater = 15,
					/obj/item/reagent_containers/food/drinks/flask/barflask = 2,/obj/item/reagent_containers/food/drinks/bottle/bluecuracao = 2,
					/obj/item/reagent_containers/food/drinks/drinkingglass = 30,/obj/item/reagent_containers/food/drinks/bottle/grenadine = 5,
					/obj/item/reagent_containers/food/drinks/bottle/melonliquor = 2,/obj/item/reagent_containers/food/drinks/bottle/absinthe = 1)
	cost = 300
	containertype = /obj/structure/closet/crate/freezer
	crate_name = "bartending resupply crate"
	group = "Hospitality"

/datum/supply_pack/cakes
	name = "Party Cakes"
	contains = list(/obj/item/reagent_containers/food/snacks/sliceable/carrotcake,
					/obj/item/reagent_containers/food/snacks/sliceable/cheesecake,
					/obj/item/reagent_containers/food/snacks/sliceable/plaincake,
					/obj/item/reagent_containers/food/snacks/sliceable/orangecake,
					/obj/item/reagent_containers/food/snacks/sliceable/limecake,
					/obj/item/reagent_containers/food/snacks/sliceable/lemoncake,
					/obj/item/reagent_containers/food/snacks/sliceable/chocolatecake,)
	cost = 400
	containertype = /obj/structure/closet/crate
	crate_name = "Party Cake Box"
	group = "Hospitality"

/datum/supply_pack/burgersurprise
	name = "Burger Surprise Crate (x5)"
	contains = list(/obj/random/junkfood/onlyburger,
					/obj/random/junkfood/onlyburger,
					/obj/random/junkfood/onlyburger,
					/obj/random/junkfood/onlyburger,
					/obj/random/junkfood/onlyburger)
	cost = 400
	containertype = /obj/structure/closet/crate/freezer
	crate_name = "burger crate"
	group = "Hospitality"

/datum/supply_pack/cakesurprise
	name = "Cake Surprise Crate (x2)"
	contains = list(/obj/random/junkfood/onlycake,
					/obj/random/junkfood/onlycake)
	cost = 150
	containertype = /obj/structure/closet/crate/freezer
	crate_name = "cake crate"
	group = "Hospitality"

/datum/supply_pack/cateringcorporate
	name = "Corporate Catering Crate"
	contains = list(/obj/item/reagent_containers/food/drinks/mug,
					/obj/item/reagent_containers/food/drinks/mug,
					/obj/item/reagent_containers/food/drinks/mug,
					/obj/item/reagent_containers/food/drinks/mug,
					/obj/item/reagent_containers/food/drinks/mug,
					/obj/item/reagent_containers/food/drinks/mug,
					/obj/item/reagent_containers/food/drinks/teapot,
					/obj/item/reagent_containers/food/drinks/bottle/pwine,
					/obj/item/reagent_containers/food/drinks/bottle/cognac,
					/obj/item/reagent_containers/food/snacks/mint,
					/obj/item/reagent_containers/food/snacks/mint,
					/obj/item/reagent_containers/food/snacks/mint,
					/obj/item/reagent_containers/food/snacks/mint,
					/obj/item/reagent_containers/food/snacks/mint,
					/obj/item/reagent_containers/food/snacks/mint)
	cost = 150
	containertype = /obj/structure/closet/crate
	crate_name = "corporate catering crate"
	group = "Hospitality"

/datum/supply_pack/kitchensupply
	name = "Kitchen Supply Crate"
	contains = list(/obj/item/reagent_containers/food/condiment/flour,
					/obj/item/reagent_containers/food/condiment/flour,
					/obj/item/reagent_containers/food/condiment/flour,
					/obj/item/reagent_containers/food/condiment/flour,
					/obj/item/reagent_containers/food/condiment/enzyme,
					/obj/item/reagent_containers/food/condiment/sugar,
					/obj/item/reagent_containers/food/drinks/milk,
					/obj/item/reagent_containers/food/drinks/milk,
					/obj/item/storage/fancy/egg_box,
					/obj/item/reagent_containers/food/snacks/tofu,
					/obj/item/reagent_containers/food/snacks/tofu,
					/obj/item/reagent_containers/food/snacks/meat,
					/obj/item/reagent_containers/food/snacks/meat)

	cost = 100
	containertype = /obj/structure/closet/crate/freezer
	crate_name = "kitchen supply crate"
	group = "Hospitality"

/datum/supply_pack/lunchboxes
	name = "Lunchbox Crate"
	contains = list(/obj/item/storage/lunchbox/cat,
					/obj/item/storage/lunchbox/cat,
					/obj/item/storage/lunchbox/cat,
					/obj/item/storage/lunchbox/cat,
					/obj/item/storage/lunchbox,
					/obj/item/storage/lunchbox,
					/obj/item/storage/lunchbox,
					/obj/item/storage/lunchbox,
					/obj/item/storage/lunchbox/rainbow,
					/obj/item/storage/lunchbox/rainbow,
					/obj/item/storage/lunchbox/rainbow,
					/obj/item/storage/lunchbox/rainbow)
	cost = 120
	containertype = /obj/structure/closet/crate
	crate_name  = "lunchbox crate"
	group = "Hospitality"

/datum/supply_pack/cateringparty
	name = "Party Catering Crate"
	contains = list(/obj/item/storage/box/drinkingglasses,
					/obj/item/reagent_containers/food/drinks/shaker,
					/obj/item/reagent_containers/food/drinks/flask/barflask,
					/obj/item/reagent_containers/food/drinks/bottle/patron,
					/obj/item/reagent_containers/food/drinks/bottle/goldschlager,
					/obj/item/storage/fancy/cigarettes/fortress,
//					/obj/item/lipstick/jade,
					/obj/item/reagent_containers/food/drinks/bottle/small/ale,
					/obj/item/reagent_containers/food/drinks/bottle/small/ale,
					/obj/item/reagent_containers/food/drinks/bottle/small/beer,
					/obj/item/reagent_containers/food/drinks/bottle/small/beer,
					/obj/item/reagent_containers/food/drinks/bottle/small/beer,
					/obj/item/reagent_containers/food/drinks/bottle/small/beer)
	cost = 175
	containertype = /obj/structure/closet/crate
	crate_name = "party catering crate"
	group = "Hospitality"

/datum/supply_pack/pizzasurprise
	name = "Pizza Surprise Crate (x5)"
	contains = list(/obj/random/junkfood/onlypizza,
					/obj/random/junkfood/onlypizza,
					/obj/random/junkfood/onlypizza,
					/obj/random/junkfood/onlypizza,
					/obj/random/junkfood/onlypizza)
	cost = 300
	containertype = /obj/structure/closet/crate/freezer
	crate_name = "pizza crate"
	group = "Hospitality"

/datum/supply_pack/hospitality_dispenser
	name = "Hospitality Dispenser (Booze/Soda/Coffie Dispensers Boards)"
	contains = list(/obj/item/circuitboard/chemical_dispenser/coffee_master,
					/obj/item/circuitboard/chemical_dispenser/beer,
					/obj/item/circuitboard/chemical_dispenser/soda,
					/obj/item/storage/box/drinkingglasses,
					/obj/item/storage/box/drinkingglasses)
	cost = 500
	containertype = /obj/structure/closet/crate
	crate_name = "hospitality dispenser"
	group = "Hospitality"

/datum/supply_pack/piano
	name = "Paino Cate"
	cost = 750
	containertype = /obj/structure/largecrate/animal/piano
	crate_name  = "paino crate"
	group = "Hospitality"

/datum/supply_pack/band
	name = "Music Cate"
	cost = 550
	contains = list(/obj/item/device/synthesized_instrument/guitar,
					/obj/item/device/synthesized_instrument/guitar/multi,
					/obj/item/device/synthesized_instrument/synthesizer,
					/obj/item/device/synthesized_instrument/trumpet,
					/obj/item/device/synthesized_instrument/violin)
	containertype = /obj/structure/closet/crate
	crate_name  = "musical band crate"
	group = "Hospitality"

/datum/supply_pack/checkers
	name = "Checker Cate"
	cost = 150
	contains = list(/obj/item/board,
					/obj/item/storage/pill_bottle/chechker)
	containertype = /obj/structure/closet/crate
	crate_name  = "king crate"
	group = "Hospitality"

/datum/supply_pack/boombox
	contains = list(/obj/item/media/boombox)
	name = "Boombox delivery"
	cost = 650 //bit more costly then music devices itself
	crate_name = "Nanotrasen boombox crate"
	containertype = /obj/structure/closet/crate
	group = "Miscellaneous"