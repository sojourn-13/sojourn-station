/////////////////////////////////////////////////PIZZA////////////////////////////////////////

/obj/item/reagent_containers/food/snacks/sliceable/pizza
	slices_num = 6
	filling_color = "#BAA14C"
	matter = list(MATERIAL_BIOMATTER = 25)

/obj/item/reagent_containers/food/snacks/sliceable/pizza/margherita
	name = "margherita"
	desc = "The golden standard of pizzas."
	icon_state = "pizzamargherita"
	taste_tag = list(FLOURY_FOOD, UMAMI_FOOD, CHEESE_FOOD)
	slice_path = /obj/item/reagent_containers/food/snacks/margheritaslice
	slices_num = 6
	bitesize = 2
	center_of_mass = list("x"=16, "y"=11)
	nutriment_desc = list("pizza crust" = 10, "tomato" = 10, "cheese" = 15)
	nutriment_amt = 35
	preloaded_reagents = list("protein" = 5, "tomatojuice" = 6)

/obj/item/reagent_containers/food/snacks/margheritaslice
	name = "margherita slice"
	desc = "A slice of classic margherita pizza."
	icon_state = "pizzamargheritaslice"
	taste_tag = list(FLOURY_FOOD, UMAMI_FOOD, CHEESE_FOOD)
	filling_color = "#BAA14C"
	bitesize = 2
	center_of_mass = list("x"=18, "y"=13)
	preloaded_reagents = list("nutriment" = 5, "protein" = 1, "tomatojuice" = 1)
	cooked = TRUE
	matter = list(MATERIAL_BIOMATTER = 5)

/obj/item/reagent_containers/food/snacks/sliceable/pizza/meatpizza
	name = "meat pizza"
	desc = "A pizza with meat toppings."
	icon_state = "meatpizza"
	taste_tag = list(FLOURY_FOOD, MEAT_FOOD, CHEESE_FOOD)
	slice_path = /obj/item/reagent_containers/food/snacks/meatpizzaslice
	slices_num = 6
	center_of_mass = list("x"=16, "y"=11)
	nutriment_desc = list("pizza crust" = 10, "tomato" = 10, "cheese" = 15)
	nutriment_amt = 10
	bitesize = 2
	preloaded_reagents = list("protein" = 34, "tomatojuice" = 6)

/obj/item/reagent_containers/food/snacks/meatpizzaslice
	name = "meat pizza slice"
	desc = "A slice of meaty pizza."
	icon_state = "meatpizzaslice"
	taste_tag = list(FLOURY_FOOD, MEAT_FOOD, CHEESE_FOOD)
	filling_color = "#BAA14C"
	bitesize = 2
	center_of_mass = list("x"=18, "y"=13)
	preloaded_reagents = list("protein" = 7, "tomatojuice" = 1)
	cooked = TRUE
	matter = list(MATERIAL_BIOMATTER = 5)

/obj/item/reagent_containers/food/snacks/sliceable/pizza/mushroompizza
	name = "mushroom pizza"
	desc = "Pizza with a hefty topping of mushrooms."
	icon_state = "mushroompizza"
	taste_tag = list(FLOURY_FOOD, UMAMI_FOOD, CHEESE_FOOD)
	slice_path = /obj/item/reagent_containers/food/snacks/mushroompizzaslice
	slices_num = 6
	center_of_mass = list("x"=16, "y"=11)
	nutriment_desc = list("pizza crust" = 10, "tomato" = 10, "cheese" = 5, "mushroom" = 10)
	nutriment_amt = 35
	bitesize = 2
	preloaded_reagents = list("protein" = 5)

/obj/item/reagent_containers/food/snacks/mushroompizzaslice
	name = "mushroom pizza slice"
	desc = "A slice of mushroom topped pizza."
	icon_state = "mushroompizzaslice"
	taste_tag = list(FLOURY_FOOD, UMAMI_FOOD, CHEESE_FOOD)
	filling_color = "#BAA14C"
	bitesize = 2
	center_of_mass = list("x"=18, "y"=13)
	preloaded_reagents = list("nutriment" = 5, "protein" = 1)
	cooked = TRUE
	matter = list(MATERIAL_BIOMATTER = 5)

/obj/item/reagent_containers/food/snacks/sliceable/pizza/vegetablepizza
	name = "vegetable pizza"
	desc = "No Tomato Sapiens were harmed during the baking of this pizza."
	icon_state = "vegetablepizza"
	taste_tag = list(FLOURY_FOOD, VEGETARIAN_FOOD, CHEESE_FOOD)
	slice_path = /obj/item/reagent_containers/food/snacks/vegetablepizzaslice
	slices_num = 6
	center_of_mass = list("x"=16, "y"=11)
	nutriment_desc = list("pizza crust" = 10, "tomato" = 10, "cheese" = 5, "eggplant" = 5, "carrot" = 5, "corn" = 5)
	nutriment_amt = 25
	bitesize = 2
	preloaded_reagents = list("protein" = 5, "tomatojuice" = 6, "imidazoline" = 12)

/obj/item/reagent_containers/food/snacks/vegetablepizzaslice
	name = "vegetable pizza slice"
	desc = "A slice of the most green pizza of all pizzas not containing green ingredients."
	icon_state = "vegetablepizzaslice"
	taste_tag = list(FLOURY_FOOD, VEGETARIAN_FOOD, CHEESE_FOOD)
	filling_color = "#BAA14C"
	bitesize = 2
	center_of_mass = list("x"=18, "y"=13)
	preloaded_reagents = list("nutriment" = 4, "protein" = 1, "tomatojuice" = 1, "imidazoline" = 2)
	cooked = TRUE
	matter = list(MATERIAL_BIOMATTER = 5)

/obj/item/reagent_containers/food/snacks/sliceable/pizza/hawaiianpizza
	name = "hawaiian pizza pizza"
	desc = "A pizza with added cooked pineapple slices, some swear by it, others hate it."
	icon_state = "hawaiianpizza"
	taste_tag = list(FLOURY_FOOD, VEGETARIAN_FOOD, CHEESE_FOOD)
	slice_path = /obj/item/reagent_containers/food/snacks/hawaiianpizzaslice
	slices_num = 6
	center_of_mass = list("x"=16, "y"=11)
	nutriment_desc = list("pizza crust" = 10, "tomato" = 10, "cheese" = 5, "pineapple" = 5)
	nutriment_amt = 25
	bitesize = 2
	preloaded_reagents = list("protein" = 5, "tomatojuice" = 6)

/obj/item/reagent_containers/food/snacks/hawaiianpizzaslice
	name = "hawaiian pizza slice"
	desc = "A slice of hawaiian pizza with bits of cooked pineapple atop it."
	icon_state = "hawaiianpizzaslice"
	taste_tag = list(FLOURY_FOOD, VEGETARIAN_FOOD, CHEESE_FOOD)
	filling_color = "#BAA14C"
	bitesize = 2
	center_of_mass = list("x"=18, "y"=13)
	preloaded_reagents = list("nutriment" = 4, "protein" = 1, "tomatojuice" = 1)
	cooked = TRUE
	matter = list(MATERIAL_BIOMATTER = 5)

/obj/item/pizzabox
	name = "pizza box"
	desc = "A box suited for pizzas."
	icon = 'icons/obj/food.dmi'
	icon_state = "pizzabox1"

	var/open = 0 // Is the box open?
	var/ismessy = 0 // Fancy mess on the lid
	var/obj/item/reagent_containers/food/snacks/sliceable/pizza/pizza // Content pizza
	var/list/boxes = list() // If the boxes are stacked, they come here
	var/boxtag = ""

/obj/item/pizzabox/update_icon()

	cut_overlays()

	// Set appropriate description
	if( open && pizza )
		desc = "A box suited for pizzas. It appears to have a [pizza.name] inside."
	else if( boxes.len > 0 )
		desc = "A pile of boxes suited for pizzas. There appears to be [boxes.len + 1] boxes in the pile."

		var/obj/item/pizzabox/topbox = boxes[boxes.len]
		var/toptag = topbox.boxtag
		if( toptag != "" )
			desc = "[desc] The box on top has a tag, it reads: '[toptag]'."
	else
		desc = "A box suited for pizzas."

		if( boxtag != "" )
			desc = "[desc] The box has a tag, it reads: '[boxtag]'."

	// Icon states and over-lays
	if( open )
		if( ismessy )
			icon_state = "pizzabox_messy"
		else
			icon_state = "pizzabox_open"

		if( pizza )
			var/image/pizzaimg = image("food.dmi", icon_state = pizza.icon_state)
			pizzaimg.pixel_y = -3
			add_overlay(pizzaimg)

		return
	else
		// Stupid code because byondcode sucks
		var/doimgtag = 0
		if( boxes.len > 0 )
			var/obj/item/pizzabox/topbox = boxes[boxes.len]
			if( topbox.boxtag != "" )
				doimgtag = 1
		else
			if( boxtag != "" )
				doimgtag = 1

		if( doimgtag )
			var/image/tagimg = image("food.dmi", icon_state = "pizzabox_tag")
			tagimg.pixel_y = boxes.len * 3
			add_overlay(tagimg)

	icon_state = "pizzabox[boxes.len+1]"

/obj/item/pizzabox/attack_hand( mob/user as mob )

	if( open && pizza )
		user.put_in_hands( pizza )

		to_chat(user, SPAN_WARNING("You take \the [src.pizza] out of \the [src]."))
		src.pizza = null
		update_icon()
		return

	if( boxes.len > 0 )
		if( user.get_inactive_hand() != src )
			..()
			return

		var/obj/item/pizzabox/box = boxes[boxes.len]
		boxes -= box

		user.put_in_hands( box )
		to_chat(user, SPAN_WARNING("You remove the topmost [src] from your hand."))
		box.update_icon()
		update_icon()
		return
	..()

/obj/item/pizzabox/attack_self( mob/user as mob )

	if( boxes.len > 0 )
		return

	open = !open

	if( open && pizza )
		ismessy = 1

	update_icon()

/obj/item/pizzabox/attackby( obj/item/I as obj, mob/user as mob )
	if( istype(I, /obj/item/pizzabox/) )
		var/obj/item/pizzabox/box = I

		if( !box.open && !src.open )
			// Make a list of all boxes to be added
			var/list/boxestoadd = list()
			boxestoadd += box
			for(var/obj/item/pizzabox/i in box.boxes)
				boxestoadd += i

			if( (boxes.len+1) + boxestoadd.len <= 5 )
				user.drop_from_inventory(box, src)
				box.boxes = list() // Clear the box boxes so we don't have boxes inside boxes. - Xzibit
				src.boxes.Add( boxestoadd )

				box.update_icon()
				update_icon()

				to_chat(user, SPAN_WARNING("You put \the [box] ontop of \the [src]!"))
			else
				to_chat(user, SPAN_WARNING("The stack is too high!"))
		else
			to_chat(user, SPAN_WARNING("Close \the [box] first!"))

		return

	if( istype(I, /obj/item/reagent_containers/food/snacks/sliceable/pizza/) ) // Long ass fucking object name

		if( src.open )
			user.drop_from_inventory(I, src)
			src.pizza = I

			update_icon()

			to_chat(user, SPAN_WARNING("You put \the [I] in \the [src]!"))
		else
			to_chat(user, SPAN_WARNING("You try to push \the [I] through the lid but it doesn't work!"))
		return

	if( istype(I, /obj/item/pen/) )

		if( src.open )
			return

		var/t = sanitize(input("Enter what you want to add to the tag:", "Write", null, null) as text, 30)

		var/obj/item/pizzabox/boxtotagto = src
		if( boxes.len > 0 )
			boxtotagto = boxes[boxes.len]

		boxtotagto.boxtag = copytext("[boxtotagto.boxtag][t]", 1, 30)

		update_icon()
		return
	..()

/obj/item/pizzabox/margherita/Initialize(mapload)
	. = ..()
	pizza = new /obj/item/reagent_containers/food/snacks/sliceable/pizza/margherita(src)
	boxtag = "Margherita Deluxe"

/obj/item/pizzabox/vegetable/Initialize(mapload)
	. = ..()
	pizza = new /obj/item/reagent_containers/food/snacks/sliceable/pizza/vegetablepizza(src)
	boxtag = "Gourmet Vegetable"

/obj/item/pizzabox/mushroom/Initialize(mapload)
	. = ..()
	pizza = new /obj/item/reagent_containers/food/snacks/sliceable/pizza/mushroompizza(src)
	boxtag = "Mushroom Special"

/obj/item/pizzabox/meat/Initialize(mapload)
	. = ..()
	pizza = new /obj/item/reagent_containers/food/snacks/sliceable/pizza/meatpizza(src)
	boxtag = "Meatlover's Supreme"

/obj/item/pizzabox/hawaiianpizza/Initialize(mapload)
	. = ..()
	pizza = new /obj/item/reagent_containers/food/snacks/sliceable/pizza/hawaiianpizza(src)
	boxtag = "Controversial Pizza"
