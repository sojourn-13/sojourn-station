/obj/item/reagent_containers/food/snacks/meatballsoup
	name = "meatball soup"
	desc = "You've got balls kid, BALLS!"
	icon_state = "meatballsoup"
	taste_tag = list(MEAT_FOOD)
	trash = /obj/item/trash/snack_bowl
	filling_color = "#785210"
	bitesize = 5
	center_of_mass = list("x"=16, "y"=8)
	preloaded_reagents = list("protein" = 8, "water" = 5)
	cooked = TRUE
	matter = list(MATERIAL_BIOMATTER = 13)

/obj/item/reagent_containers/food/snacks/slimesoup
	name = "slime soup"
	desc = "If no water is available, you may substitute tears."
	icon_state = "rorosoup" //nonexistant?
	taste_tag = list(BLAND_FOOD)
	filling_color = "#C4DBA0"
	bitesize = 5
	preloaded_reagents = list("slimejelly" = 5, "water" = 10)
	matter = list(MATERIAL_BIOMATTER = 9)

/obj/item/reagent_containers/food/snacks/bloodsoup
	name = "tomato soup"
	desc = "Smells like copper."
	taste_tag = list(UMAMI_FOOD)
	icon_state = "tomatosoup"
	filling_color = "#FF0000"
	bitesize = 5
	center_of_mass = list("x"=16, "y"=7)
	preloaded_reagents = list("protein" = 2, "blood" = 10, "water" = 5)
	matter = list(MATERIAL_BIOMATTER = 8)

/obj/item/reagent_containers/food/snacks/clownstears
	name = "clown's tears"
	desc = "Not very funny."
	icon_state = "clownstears"
	taste_tag = list(SWEET_FOOD, BLAND_FOOD)
	filling_color = "#C4FBFF"
	center_of_mass = list("x"=16, "y"=7)
	nutriment_desc = list("salt" = 1, "the worst joke" = 3)
	nutriment_amt = 4
	bitesize = 5
	preloaded_reagents = list("banana" = 5, "water" = 10)
	matter = list(MATERIAL_BIOMATTER = 13)

/obj/item/reagent_containers/food/snacks/vegetablesoup
	name = "vegetable soup"
	desc = "A true vegan meal" //TODO
	icon_state = "vegetablesoup"
	taste_tag = list(VEGAN_FOOD)
	trash = /obj/item/trash/snack_bowl
	filling_color = "#AFC4B5"
	center_of_mass = list("x"=16, "y"=8)
	nutriment_desc = list("carot" = 2, "corn" = 2, "eggplant" = 2, "potato" = 2)
	nutriment_amt = 8
	bitesize = 5
	preloaded_reagents = list("water" = 5)
	cooked = TRUE
	matter = list(MATERIAL_BIOMATTER = 13)

/obj/item/reagent_containers/food/snacks/nettlesoup
	name = "nettle soup"
	desc = "To think, the gardener would've beat you to death with one of these."
	icon_state = "nettlesoup"
	taste_tag = list(UMAMI_FOOD)
	trash = /obj/item/trash/snack_bowl
	filling_color = "#AFC4B5"
	center_of_mass = list("x"=16, "y"=7)
	nutriment_desc = list("salad" = 4, "egg" = 2, "potato" = 2)
	nutriment_amt = 8
	bitesize = 5
	preloaded_reagents = list("water" = 5, "tricordrazine" = 5)
	cooked = TRUE
	matter = list(MATERIAL_BIOMATTER = 18)

/obj/item/reagent_containers/food/snacks/mysterysoup
	name = "mystery soup"
	desc = "The mystery is, why aren't you eating it?"
	icon_state = "mysterysoup"
	taste_tag = list(BLAND_FOOD)
	trash = /obj/item/trash/snack_bowl
	filling_color = "#F082FF"
	center_of_mass = list("x"=16, "y"=6)
	nutriment_desc = list("backwash" = 1)
	nutriment_amt = 1
	bitesize = 5
/obj/item/reagent_containers/food/snacks/mysterysoup/Initialize(mapload)
	. = ..()
	var/mysteryselect = pick(1,2,3,4,5,6,7,8,9,10)
	switch(mysteryselect)
		if(1)
			reagents.add_reagent("nutriment", 6)
			reagents.add_reagent("capsaicin", 3)
			reagents.add_reagent("tomatojuice", 2)
			matter = list(MATERIAL_BIOMATTER = 17)
		if(2)
			reagents.add_reagent("nutriment", 6)
			reagents.add_reagent("frostoil", 3)
			reagents.add_reagent("tomatojuice", 2)
			matter = list(MATERIAL_BIOMATTER = 19)
		if(3)
			reagents.add_reagent("nutriment", 5)
			reagents.add_reagent("water", 5)
			reagents.add_reagent("tricordrazine", 5)
			matter = list(MATERIAL_BIOMATTER = 13)
		if(4)
			reagents.add_reagent("nutriment", 5)
			reagents.add_reagent("water", 10)
			matter = list(MATERIAL_BIOMATTER = 3)
		if(5)
			reagents.add_reagent("nutriment", 2)
			reagents.add_reagent("banana", 10)
			matter = list(MATERIAL_BIOMATTER = 19)
		if(6)
			reagents.add_reagent("nutriment", 6)
			reagents.add_reagent("blood", 10)
			matter = list(MATERIAL_BIOMATTER = 23)
		if(7)
			reagents.add_reagent("slimejelly", 10)
			reagents.add_reagent("water", 10)
			matter = list(MATERIAL_BIOMATTER = 18)
		if(8)
			reagents.add_reagent("carbon", 10)
			reagents.add_reagent("toxin", 10)
			matter = list(MATERIAL_BIOMATTER = 3)
		if(9)
			reagents.add_reagent("nutriment", 5)
			reagents.add_reagent("tomatojuice", 10)
			matter = list(MATERIAL_BIOMATTER = 20)
		if(10)
			reagents.add_reagent("nutriment", 6)
			reagents.add_reagent("tomatojuice", 5)
			reagents.add_reagent("imidazoline", 5)
			matter = list(MATERIAL_BIOMATTER = 13)

/obj/item/reagent_containers/food/snacks/wishsoup
	name = "wish soup"
	desc = "I wish this was soup."
	icon_state = "wishsoup"
	taste_tag = list(BLAND_FOOD)
	trash = /obj/item/trash/snack_bowl
	filling_color = "#D1F4FF"
	center_of_mass = list("x"=16, "y"=11)
	bitesize = 5
	preloaded_reagents = list("water" = 10)
	matter = list(MATERIAL_BIOMATTER = 1) //The bowl

/obj/item/reagent_containers/food/snacks/wishsoup/Initialize(mapload)
	. = ..()
	if(prob(25))
		sleep(10)
		desc = "A wish come true!"
		reagents.add_reagent("nutriment", 8)
		nutriment_desc = list("something good" = 8)

/obj/item/reagent_containers/food/snacks/hotchili
	name = "hot chili"
	desc = "A five alarm Texan Chili!"
	icon_state = "hotchili"
	taste_tag = list(MEAT_FOOD, SPICY_FOOD)
	trash = /obj/item/trash/snack_bowl
	filling_color = "#FF3C00"
	center_of_mass = list("x"=15, "y"=9)
	nutriment_desc = list("chilli peppers" = 3)
	nutriment_amt = 3
	bitesize = 5
	preloaded_reagents = list("protein" = 3, "capsaicin" = 3, "tomatojuice" = 2)
	cooked = TRUE
	matter = list(MATERIAL_BIOMATTER = 13)

/obj/item/reagent_containers/food/snacks/coldchili
	name = "cold chili"
	desc = "This slush is barely a liquid!"
	icon_state = "coldchili"
	taste_tag = list(SPICY_FOOD, MEAT_FOOD)
	filling_color = "#2B00FF"
	center_of_mass = list("x"=15, "y"=9)
	nutriment_desc = list("ice peppers" = 3)
	nutriment_amt = 3
	trash = /obj/item/trash/snack_bowl
	bitesize = 5
	preloaded_reagents = list("protein" = 3, "frostoil" = 3, "tomatojuice" = 2)
	cooked = TRUE
	matter = list(MATERIAL_BIOMATTER = 15)

/obj/item/reagent_containers/food/snacks/bearchili
	name = "bear meat chili"
	desc = "A chili so manly you'll end up growing hair on your chest and wrestling Renders with your bare hands."
	icon_state = "bearchili"
	taste_tag = list(MEAT_FOOD, SPICY_FOOD)
	nutriment_desc = list("manliest meat" = 10, "hot chili peppers" = 3)
	nutriment_amt = 3
	trash = /obj/item/trash/snack_bowl
	bitesize = 5
	preloaded_reagents = list("protein" = 12, "capsaicin" = 3, "hyperzine" = 5) // Inherits from bear meat

/obj/item/reagent_containers/food/snacks/tomatosoup
	name = "tomato soup"
	desc = "Drinking this feels like being a vampire! A tomato vampire..."
	icon_state = "tomatosoup"
	taste_tag = list(UMAMI_FOOD)
	trash = /obj/item/trash/snack_bowl
	filling_color = "#D92929"
	bitesize = 3
	center_of_mass = list("x"=16, "y"=7)
	nutriment_desc = list("soup" = 5)
	nutriment_amt = 5
	preloaded_reagents = list("tomatojuice" = 10)
	cooked = TRUE
	matter = list(MATERIAL_BIOMATTER = 6)

/obj/item/reagent_containers/food/snacks/stew
	name = "stew"
	desc = "A nice and warm stew. Healthy and strong."
	icon_state = "stew"
	taste_tag = list(MEAT_FOOD, UMAMI_FOOD)
	filling_color = "#9E673A"
	bitesize = 10
	center_of_mass = list("x"=16, "y"=5)
	nutriment_desc = list("tomato" = 2, "potato" = 2, "carrot" = 2, "mushroom" = 2) // I said no eggplant!!!
	nutriment_amt = 6
	preloaded_reagents = list("protein" = 4, "tomatojuice" = 5, "imidazoline" = 5, "water" = 5)
	cooked = TRUE
	matter = list(MATERIAL_BIOMATTER = 17)

/obj/item/reagent_containers/food/snacks/milosoup
	name = "milo soup"
	desc = "The universes best soup! Yum!!!"
	icon_state = "milosoup"
	taste_tag = list(UMAMI_FOOD)
	trash = /obj/item/trash/snack_bowl
	bitesize = 4
	center_of_mass = list("x"=16, "y"=7)
	nutriment_desc = list("soy" = 8)
	nutriment_amt = 8
	preloaded_reagents = list("water" = 5)
	cooked = TRUE
	matter = list(MATERIAL_BIOMATTER = 8)

/obj/item/reagent_containers/food/snacks/mushroomsoup
	name = "chantrelle soup"
	desc = "A delicious and hearty mushroom soup."
	icon_state = "mushroomsoup"
	taste_tag = list(UMAMI_FOOD)
	trash = /obj/item/trash/snack_bowl
	filling_color = "#E386BF"
	bitesize = 3
	center_of_mass = list("x"=17, "y"=10)
	nutriment_desc = list("mushroom" = 8, "milk" = 2)
	nutriment_amt = 8
	cooked = TRUE
	matter = list(MATERIAL_BIOMATTER = 9)

/obj/item/reagent_containers/food/snacks/beetsoup
	name = "beet soup"
	desc = "Wait, how do you spell it again..?"
	icon_state = "beetsoup"
	taste_tag = list(UMAMI_FOOD)
	trash = /obj/item/trash/snack_bowl
	filling_color = "#FAC9FF"
	bitesize = 2
	center_of_mass = list("x"=15, "y"=8)
	nutriment_desc = list("tomato" = 4, "beet" = 4)
	nutriment_amt = 8
	matter = list(MATERIAL_BIOMATTER = 11)
	cooked = TRUE
/obj/item/reagent_containers/food/snacks/beetsoup/Initialize(mapload)
	. = ..()
	name = pick(list("borsch","bortsch","borstch","borsh","borshch","borscht"))

