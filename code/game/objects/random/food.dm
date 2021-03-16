/obj/random/rations
	name = "random preserved rations"
	icon_state = "food-green"

/obj/random/rations/item_to_spawn()
	return pickweight(list(/obj/item/weapon/reagent_containers/food/snacks/chips = 2,\
				/obj/item/weapon/reagent_containers/food/snacks/candy = 2,\
				/obj/item/weapon/reagent_containers/food/snacks/tastybread = 2,\
				/obj/item/weapon/reagent_containers/food/snacks/no_raisin = 2,\
				/obj/item/weapon/reagent_containers/food/snacks/liquidfood = 4,
				/obj/item/weapon/reagent_containers/food/snacks/donkpocket/sinpocket = 1,\
				/obj/item/weapon/storage/fancy/crayons = 0.1))

/obj/random/rations/low_chance
	name = "low chance preserved rations"
	icon_state = "food-green-low"
	spawn_nothing_percentage = 60

/obj/random/junkfood
	name = "random junkfood"
	icon_state = "food-red"

/obj/random/junkfood/item_to_spawn()
	return pickweight(list(/obj/item/weapon/reagent_containers/food/snacks/chips = 3,
				/obj/item/weapon/reagent_containers/food/snacks/candy = 3,
				/obj/item/weapon/reagent_containers/food/snacks/cheesiehonkers = 3,
				/obj/item/weapon/reagent_containers/food/snacks/tastybread = 3,
				/obj/item/weapon/reagent_containers/food/snacks/no_raisin = 3,
				/obj/item/weapon/reagent_containers/food/snacks/spacetwinkie = 3,
				/obj/item/weapon/reagent_containers/food/drinks/dry_ramen = 2,
				/obj/item/weapon/reagent_containers/food/snacks/hotdog = 1,
				/obj/item/weapon/reagent_containers/food/snacks/liquidfood = 2,
				/obj/item/weapon/reagent_containers/food/snacks/pie = 1,
				/obj/item/weapon/reagent_containers/food/snacks/sandwich = 1))

/obj/random/junkfood/low_chance
	name = "low chance junkfood"
	icon_state = "food-red-low"
	spawn_nothing_percentage = 60

/obj/random/junkfood/onlypizza
	name = "random pizza"

/obj/random/junkfood/onlypizza/item_to_spawn()
	return pick(/obj/item/pizzabox/margherita,\
				/obj/item/pizzabox/mushroom,\
				/obj/item/pizzabox/meat,\
				/obj/item/pizzabox/vegetable)

/obj/random/junkfood/onlyburger
	name = "random burger"

/obj/random/junkfood/onlyburger/item_to_spawn()
	return pick(/obj/item/weapon/reagent_containers/food/snacks/bigbiteburger,\
				/obj/item/weapon/reagent_containers/food/snacks/cheeseburger,\
				/obj/item/weapon/reagent_containers/food/snacks/jellyburger,\
				/obj/item/weapon/reagent_containers/food/snacks/tofuburger)

/obj/random/junkfood/onlycake
	name = "random cake"

/obj/random/junkfood/onlycake/item_to_spawn()
	return pick(/obj/item/weapon/reagent_containers/food/snacks/sliceable/applecake,\
			/obj/item/weapon/reagent_containers/food/snacks/sliceable/birthdaycake,\
			/obj/item/weapon/reagent_containers/food/snacks/sliceable/carrotcake,\
			/obj/item/weapon/reagent_containers/food/snacks/sliceable/cheesecake,\
			/obj/item/weapon/reagent_containers/food/snacks/sliceable/chocolatecake,\
			/obj/item/weapon/reagent_containers/food/snacks/sliceable/lemoncake,\
			/obj/item/weapon/reagent_containers/food/snacks/sliceable/limecake,\
			/obj/item/weapon/reagent_containers/food/snacks/sliceable/orangecake,\
			/obj/item/weapon/reagent_containers/food/snacks/sliceable/plaincake)

/obj/random/junkfood/rotten
	name = "random spoiled food"
	icon_state = "food-red"
	has_postspawn = TRUE

/obj/random/junkfood/rotten/low_chance
	name = "low chance spoiled food"
	icon_state = "food-red-low"
	spawn_nothing_percentage = 60

/obj/random/junkfood/rotten/post_spawn(list/spawns)
	for(var/obj/item/weapon/reagent_containers/food in spawns)
		if(!food.reagents)
			return
		if(prob(80))
			food.reagents.add_reagent("toxin", 25)
		if(prob(30)) // So sometimes the rot is visible.
			food.make_old()
	return spawns


/obj/random/rations/crayon
	name = "random crayon rations"
	icon_state = "food-green"

/obj/random/rations/item_to_spawn()
	return pickweight(list(/obj/item/weapon/pen/crayon/red = 2,\
				/obj/item/weapon/pen/crayon/orange = 2,\
				/obj/item/weapon/pen/crayon/yellow = 2,\
				/obj/item/weapon/pen/crayon/green = 2,\
				/obj/item/weapon/pen/crayon/blue = 2,\
				/obj/item/weapon/pen/crayon/purple = 2,\
				/obj/item/weapon/pen/crayon/mime = 0.2,\
				/obj/item/weapon/pen/crayon/rainbow = 0.2,\
				/obj/item/weapon/storage/fancy/crayons = 1))
