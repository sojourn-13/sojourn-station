/obj/random/rations
	name = "random preserved rations"
	icon_state = "food-green"

/obj/random/rations/item_to_spawn()
	return pickweight(list(/obj/item/reagent_containers/snacks/openable/chips = 2,\
				/obj/item/reagent_containers/snacks/candy = 2,\
				/obj/item/reagent_containers/snacks/openable/tastybread = 2,\
				/obj/item/reagent_containers/snacks/openable/no_raisin = 2,\
				/obj/item/reagent_containers/snacks/openable/liquidfood = 4,
				/obj/item/reagent_containers/snacks/donkpocket/sinpocket = 1,\
				/obj/item/storage/fancy/crayons = 0.1))

/obj/random/rations/low_chance
	name = "low chance preserved rations"
	icon_state = "food-green-low"
	spawn_nothing_percentage = 60

/obj/random/junkfood
	name = "random junkfood"
	icon_state = "food-red"

/obj/random/junkfood/item_to_spawn()
	return pickweight(list(/obj/item/reagent_containers/snacks/openable/chips = 3,
				/obj/item/reagent_containers/snacks/candy = 3,
				/obj/item/reagent_containers/snacks/cheesiehonkers = 3,
				/obj/item/reagent_containers/snacks/openable/tastybread = 3,
				/obj/item/reagent_containers/snacks/openable/no_raisin = 3,
				/obj/item/reagent_containers/snacks/openable/spacetwinkie = 3,
				/obj/item/reagent_containers/drinks/dry_ramen = 2,
				/obj/item/reagent_containers/snacks/hotdog = 1,
				/obj/item/reagent_containers/snacks/pie = 1,
				/obj/item/reagent_containers/snacks/sandwich = 1,
				/obj/random/rations/crayon = 0.1))

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
				/obj/item/pizzabox/vegetable,\
				/obj/item/pizzabox/hawaiianpizza)

/obj/random/junkfood/onlyburger
	name = "random burger"

/obj/random/junkfood/onlyburger/item_to_spawn()
	return pick(/obj/item/reagent_containers/snacks/bigbiteburger,\
				/obj/item/reagent_containers/snacks/cheeseburger,\
				/obj/item/reagent_containers/snacks/jellyburger,\
				/obj/item/reagent_containers/snacks/tofuburger)

/obj/random/junkfood/onlycake
	name = "random cake"

/obj/random/junkfood/onlycake/item_to_spawn()
	return pick(/obj/item/reagent_containers/snacks/applecake,\
			/obj/item/reagent_containers/snacks/birthdaycake,\
			/obj/item/reagent_containers/snacks/carrotcake,\
			/obj/item/reagent_containers/snacks/cheesecake,\
			/obj/item/reagent_containers/snacks/chocolatecake,\
			/obj/item/reagent_containers/snacks/lemoncake,\
			/obj/item/reagent_containers/snacks/limecake,\
			/obj/item/reagent_containers/snacks/orangecake,\
			/obj/item/reagent_containers/snacks/plaincake)

/obj/random/junkfood/rotten
	name = "random spoiled food"
	icon_state = "food-red"
	has_postspawn = TRUE

/obj/random/junkfood/rotten/low_chance
	name = "low chance spoiled food"
	icon_state = "food-red-low"
	spawn_nothing_percentage = 60

/obj/random/junkfood/rotten/post_spawn(list/spawns)
	for(var/obj/item/reagent_containers/food in spawns)
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

/obj/random/rations/crayon/item_to_spawn()
	return pickweight(list(/obj/item/pen/crayon/red = 2,\
				/obj/item/pen/crayon/orange = 2,\
				/obj/item/pen/crayon/yellow = 2,\
				/obj/item/pen/crayon/green = 2,\
				/obj/item/pen/crayon/blue = 2,\
				/obj/item/pen/crayon/purple = 2,\
				/obj/item/pen/crayon/mime = 0.2,\
				/obj/item/pen/crayon/rainbow = 0.2,\
				/obj/item/storage/fancy/crayons = 1))

/obj/random/rations/roachcube
	name = "random roachcube rations"
	icon_state = "food-green"

/obj/random/rations/roachcube/item_to_spawn()
	return pickweight(list(/obj/item/reagent_containers/snacks/cube/roach = 4,\
						/obj/item/reagent_containers/snacks/cube/roach/fuhrer = 1,\
						/obj/item/reagent_containers/snacks/cube/roach/jager = 3,\
						/obj/item/reagent_containers/snacks/cube/roach/kraftwerk = 2,\
						/obj/item/reagent_containers/snacks/cube/roach/roachling = 5,\
						/obj/item/reagent_containers/snacks/cube/roach/seuche = 2,\
						/obj/item/reagent_containers/snacks/cube/roach/panzer = 4,\
						/obj/item/reagent_containers/snacks/cube/roach/elektromagnetisch = 1,\
						/obj/item/reagent_containers/snacks/cube/roach/glowing = 2,\
						/obj/item/reagent_containers/snacks/cube/roach/grestrahlte = 2))



