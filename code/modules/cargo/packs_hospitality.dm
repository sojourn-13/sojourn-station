//----------------------------------------------
//-----------------HOSPITALITY------------------
//----------------------------------------------
/*
/datum/supply_pack/vending_bar
	name = "Bartending supply crate"
	contains = list(/obj/item/weapon/vending_refill/boozeomat)
	cost = 1000
	containertype = /obj/structure/closet/crate/freezer
	crate_name = "bartending supply crate"
	group = "Hospitality"

/datum/supply_pack/vending_coffee
	name = "Hotdrinks supply crate"
	contains = list(/obj/item/weapon/vending_refill/coffee,
					/obj/item/weapon/vending_refill/coffee,
					/obj/item/weapon/vending_refill/coffee)
	cost = 1000
	containertype = /obj/structure/closet/crate/freezer
	crate_name = "hotdrinks supply crate"
	group = "Hospitality"

/datum/supply_pack/vending_snack
	name = "Snack supply crate"
	contains = list(/obj/item/weapon/vending_refill/snack,
					/obj/item/weapon/vending_refill/snack,
					/obj/item/weapon/vending_refill/snack)
	cost = 1000
	containertype = /obj/structure/closet/crate/freezer
	crate_name = "snack supply crate"
	group = "Hospitality"

/datum/supply_pack/vending_cola
	name = "Softdrinks supply crate"
	contains = list(/obj/item/weapon/vending_refill/cola,
					/obj/item/weapon/vending_refill/cola,
					/obj/item/weapon/vending_refill/cola)
	cost = 1000
	containertype = /obj/structure/closet/crate/freezer
	crate_name = "softdrinks supply crate"
	group = "Hospitality"

/datum/supply_pack/vending_cigarette
	name = "Cigarette supply crate"
	contains = list(/obj/item/weapon/vending_refill/cigarette,
					/obj/item/weapon/vending_refill/cigarette,
					/obj/item/weapon/vending_refill/cigarette)
	cost = 1000
	containertype = /obj/structure/closet/crate/freezer
	crate_name = "cigarette supply crate"
	group = "Hospitality"
*/

/datum/supply_pack/cateringbirthday
	name = "Birthday Catering Crate"
	contains = list(/obj/item/weapon/storage/box/drinkingglasses,
					/obj/item/weapon/reagent_containers/food/drinks/shaker,
					/obj/item/weapon/reagent_containers/food/drinks/flask/barflask,
					/obj/item/weapon/reagent_containers/food/drinks/bottle/orangejuice,
					/obj/item/weapon/reagent_containers/food/drinks/bottle/space_up,
					/obj/item/weapon/reagent_containers/food/drinks/bottle/cola,
					/obj/item/weapon/reagent_containers/food/snacks/sliceable/birthdaycake,
					/obj/item/weapon/tool/knife,
					/obj/item/weapon/storage/fancy/heartbox,
					/obj/item/weapon/storage/fancy/heartbox,
					/obj/item/weapon/storage/fancy/heartbox,
					/obj/item/weapon/paper/card/smile,
					/obj/item/weapon/paper/card/smile,
					/obj/item/weapon/paper/card/heart,
					/obj/item/weapon/paper/card/heart,
					/obj/item/weapon/paper/card/cat,
					/obj/item/weapon/paper/card/cat,
					/obj/item/weapon/paper/card/flower,
					/obj/item/weapon/paper/card/flower,
					/obj/item/clothing/head/costume/misc/cake)
	cost = 1400
	containertype = /obj/structure/closet/crate
	crate_name = "birthday catering crate"
	group = "Hospitality"

/datum/supply_pack/burgersurprise
	name = "Burger Surprise Crate (x5)"
	contains = list(/obj/random/junkfood/onlyburger,
					/obj/random/junkfood/onlyburger,
					/obj/random/junkfood/onlyburger,
					/obj/random/junkfood/onlyburger,
					/obj/random/junkfood/onlyburger)
	cost = 1000
	containertype = /obj/structure/closet/crate/freezer
	crate_name = "burger crate"
	group = "Hospitality"

/datum/supply_pack/cakesurprise
	name = "Cake Surprise Crate (x2)"
	contains = list(/obj/random/junkfood/onlycake,
					/obj/random/junkfood/onlycake)
	cost = 1000
	containertype = /obj/structure/closet/crate/freezer
	crate_name = "cake crate"
	group = "Hospitality"

/datum/supply_pack/cateringcorporate
	name = "Corporate Catering Crate"
	contains = list(/obj/item/weapon/reagent_containers/food/drinks/mug,
					/obj/item/weapon/reagent_containers/food/drinks/mug,
					/obj/item/weapon/reagent_containers/food/drinks/mug,
					/obj/item/weapon/reagent_containers/food/drinks/mug,
					/obj/item/weapon/reagent_containers/food/drinks/mug,
					/obj/item/weapon/reagent_containers/food/drinks/mug,
					/obj/item/weapon/reagent_containers/food/drinks/teapot,
					/obj/item/weapon/reagent_containers/food/drinks/bottle/pwine,
					/obj/item/weapon/reagent_containers/food/drinks/bottle/cognac,
					/obj/item/weapon/reagent_containers/food/snacks/mint,
					/obj/item/weapon/reagent_containers/food/snacks/mint,
					/obj/item/weapon/reagent_containers/food/snacks/mint,
					/obj/item/weapon/reagent_containers/food/snacks/mint,
					/obj/item/weapon/reagent_containers/food/snacks/mint,
					/obj/item/weapon/reagent_containers/food/snacks/mint)
	cost = 1200
	containertype = /obj/structure/closet/crate
	crate_name = "corporate catering crate"
	group = "Hospitality"

/datum/supply_pack/kitchensupply
	name = "Kitchen Supply Crate"
	contains = list(/obj/item/weapon/reagent_containers/food/condiment/flour,
					/obj/item/weapon/reagent_containers/food/condiment/flour,
					/obj/item/weapon/reagent_containers/food/condiment/flour,
					/obj/item/weapon/reagent_containers/food/condiment/flour,
					/obj/item/weapon/reagent_containers/food/drinks/milk,
					/obj/item/weapon/reagent_containers/food/drinks/milk,
					/obj/item/weapon/storage/fancy/egg_box,
					/obj/item/weapon/reagent_containers/food/snacks/tofu,
					/obj/item/weapon/reagent_containers/food/snacks/tofu,
					/obj/item/weapon/reagent_containers/food/snacks/meat,
					/obj/item/weapon/reagent_containers/food/snacks/meat)

	cost = 900
	containertype = /obj/structure/closet/crate/freezer
	crate_name = "kitchen supply crate"
	group = "Hospitality"

/datum/supply_pack/lunchboxes
	name = "Lunchbox Crate"
	contains = list(/obj/item/weapon/storage/lunchbox/cat,
					/obj/item/weapon/storage/lunchbox/cat,
					/obj/item/weapon/storage/lunchbox/cat,
					/obj/item/weapon/storage/lunchbox/cat,
					/obj/item/weapon/storage/lunchbox,
					/obj/item/weapon/storage/lunchbox,
					/obj/item/weapon/storage/lunchbox,
					/obj/item/weapon/storage/lunchbox,
					/obj/item/weapon/storage/lunchbox/rainbow,
					/obj/item/weapon/storage/lunchbox/rainbow,
					/obj/item/weapon/storage/lunchbox/rainbow,
					/obj/item/weapon/storage/lunchbox/rainbow)
	cost = 400
	containertype = /obj/structure/closet/crate
	crate_name  = "lunchbox crate"
	group = "Hospitality"

/datum/supply_pack/cateringparty
	name = "Party Catering Crate"
	contains = list(/obj/item/weapon/storage/box/drinkingglasses,
					/obj/item/weapon/reagent_containers/food/drinks/shaker,
					/obj/item/weapon/reagent_containers/food/drinks/flask/barflask,
					/obj/item/weapon/reagent_containers/food/drinks/bottle/patron,
					/obj/item/weapon/reagent_containers/food/drinks/bottle/goldschlager,
					/obj/item/weapon/storage/fancy/cigarettes/fortress,
//					/obj/item/weapon/lipstick/jade,
					/obj/item/weapon/reagent_containers/food/drinks/bottle/small/ale,
					/obj/item/weapon/reagent_containers/food/drinks/bottle/small/ale,
					/obj/item/weapon/reagent_containers/food/drinks/bottle/small/beer,
					/obj/item/weapon/reagent_containers/food/drinks/bottle/small/beer,
					/obj/item/weapon/reagent_containers/food/drinks/bottle/small/beer,
					/obj/item/weapon/reagent_containers/food/drinks/bottle/small/beer)
	cost = 1200
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
	cost = 1000
	containertype = /obj/structure/closet/crate/freezer
	crate_name = "pizza crate"
	group = "Hospitality"