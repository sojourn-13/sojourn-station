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
					/obj/item/weapon/material/knife,
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

/datum/supply_pack/cateringparty
	name = "Party Catering Crate"
	contains = list(/obj/item/weapon/storage/box/drinkingglasses,
					/obj/item/weapon/reagent_containers/food/drinks/shaker,
					/obj/item/weapon/reagent_containers/food/drinks/flask/barflask,
					/obj/item/weapon/reagent_containers/food/drinks/bottle/patron,
					/obj/item/weapon/reagent_containers/food/drinks/bottle/goldschlager,
					/obj/item/weapon/storage/fancy/cigarettes/dromedaryco,
					/obj/item/weapon/lipstick/jade,
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

/datum/supply_pack/randomised
	name = "Pizza Surprise Crate (x5)"
	var/num_contained = 5
	contains = list(/obj/item/pizzabox/margherita,
					/obj/item/pizzabox/mushroom,
					/obj/item/pizzabox/meat,
					/obj/item/pizzabox/vegetable)
	cost = 1000
	containertype = /obj/structure/closet/crate/freezer
	crate_name = "pizza crate"
	group = "Hospitality"

//----------------------------------------------
//--------------MISCELLANEOUS-------------------
//----------------------------------------------

/datum/supply_pack/formal_wear
	contains = list(/obj/item/clothing/head/bowler/,
					/obj/item/clothing/head/tophat,
					/obj/item/clothing/under/suit_jacket,
					/obj/item/clothing/under/suit_jacket/red,
					/obj/item/clothing/shoes/color/black,
					/obj/item/clothing/shoes/color/black,
					/obj/item/clothing/shoes/leather,
					/obj/item/clothing/accessory/wcoat/black)
	name = "Formalwear closet"
	cost = 1500
	containertype = /obj/structure/closet
	crate_name = "Formalwear for the best occasions."
	group = "Miscellaneous"

/datum/supply_pack/eftpos
	contains = list(/obj/item/device/eftpos)
	name = "EFTPOS scanner"
	cost = 700
	crate_name = "EFTPOS crate"
	group = "Miscellaneous"