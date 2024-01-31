/obj/item/reagent_containers/food/snacks/sliceable/bread
	name = "bread"
	icon_state = "Some plain old Earthen bread."
	icon_state = "bread"
	slice_path = /obj/item/reagent_containers/food/snacks/breadslice
	slices_num = 5
	taste_tag = list(FLOURY_FOOD)
	filling_color = "#FFE396"
	bitesize = 2
	center_of_mass = list("x"=16, "y"=9)
	nutriment_desc = list("bread" = 6)
	nutriment_amt = 6
	matter = list(MATERIAL_BIOMATTER = 5)

/obj/item/reagent_containers/food/snacks/breadslice
	name = "bread slice"
	desc = "A slice of home."
	icon_state = "breadslice"
	taste_tag = list(FLOURY_FOOD)
	trash = /obj/item/trash/plate
	filling_color = "#D27332"
	nutriment_amt = 1
	bitesize = 2
	center_of_mass = list("x"=16, "y"=4)

/obj/item/reagent_containers/food/snacks/butterbread
	name = "buttered toast"
	desc = "A freshly toasted slice of bread with melting butter on top, the humblest of meals for the simple man."
	icon_state = "buttertoast"
	taste_tag = list(FLOURY_FOOD)
	bitesize = 3
	nutriment_amt = 3
	nutriment_desc = list("bread" = 6, "butter" = 3)

/obj/item/reagent_containers/food/snacks/sliceable/creamcheesebread
	name = "cream cheese bread"
	desc = "Yum yum yum!"
	icon_state = "creamcheesebread"
	taste_tag = list(CHEESE_FOOD, FLOURY_FOOD)
	slice_path = /obj/item/reagent_containers/food/snacks/creamcheesebreadslice
	slices_num = 5
	filling_color = "#FFF896"
	center_of_mass = list("x"=16, "y"=9)
	nutriment_desc = list("bread" = 6, "cream" = 3, "cheese" = 3)
	nutriment_amt = 5
	bitesize = 2
	preloaded_reagents = list("protein" = 15)
	matter = list(MATERIAL_BIOMATTER = 10)

/obj/item/reagent_containers/food/snacks/creamcheesebreadslice
	name = "cream cheese bread slice"
	desc = "A slice of yum!"
	taste_tag = list(SWEET_FOOD, FLOURY_FOOD)
	icon_state = "creamcheesebreadslice"
	trash = /obj/item/trash/plate
	filling_color = "#FFF896"
	bitesize = 2
	center_of_mass = list("x"=16, "y"=13)
	preloaded_reagents = list("protein" = 3)
	cooked = TRUE
	matter = list(MATERIAL_BIOMATTER = 2)

/obj/item/reagent_containers/food/snacks/sliceable/meatbread
	name = "meatbread loaf"
	desc = "The culinary base of every self-respecting eloquen/tg/entleman."
	icon_state = "meatbread"
	taste_tag = list(MEAT_FOOD, FLOURY_FOOD)
	slice_path = /obj/item/reagent_containers/food/snacks/meatbreadslice
	slices_num = 5
	filling_color = "#FF7575"
	bitesize = 2
	center_of_mass = list("x"=16, "y"=9)
	nutriment_desc = list("bread" = 10)
	nutriment_amt = 10
	preloaded_reagents = list("protein" = 20)
	matter = list(MATERIAL_BIOMATTER = 20)

/obj/item/reagent_containers/food/snacks/meatbreadslice
	name = "meatbread slice"
	desc = "A slice of delicious meatbread."
	icon_state = "meatbreadslice"
	taste_tag = list(MEAT_FOOD, FLOURY_FOOD)
	trash = /obj/item/trash/plate
	filling_color = "#FF7575"
	bitesize = 2
	center_of_mass = list("x"=16, "y"=13)
	preloaded_reagents = list("protein" = 4, "nutriment" = 2)
	cooked = TRUE
	matter = list(MATERIAL_BIOMATTER = 4)

/obj/item/reagent_containers/food/snacks/sliceable/xenomeatbread
	name = "xenomeatbread loaf"
	desc = "The culinary base of every self-respecting eloquent gentleman. Extra Heretical."
	icon_state = "xenomeatbread"
	taste_tag = list(MEAT_FOOD, FLOURY_FOOD)
	slice_path = /obj/item/reagent_containers/food/snacks/xenomeatbreadslice
	slices_num = 5
	filling_color = "#8AFF75"
	bitesize = 2
	center_of_mass = list("x"=16, "y"=9)
	nutriment_desc = list("bread" = 10)
	nutriment_amt = 10
	preloaded_reagents = list("protein" = 20)
	matter = list(MATERIAL_BIOMATTER = 20)

/obj/item/reagent_containers/food/snacks/xenomeatbreadslice
	name = "xenomeatbread slice"
	desc = "A slice of delicious meatbread. Extra Heretical."
	icon_state = "xenobreadslice"
	taste_tag = list(MEAT_FOOD, FLOURY_FOOD)
	trash = /obj/item/trash/plate
	filling_color = "#8AFF75"
	bitesize = 2
	center_of_mass = list("x"=16, "y"=13)
	nutriment_amt = 2
	nutriment_desc = list("bread" = 2)
	preloaded_reagents = list("protein" = 4)
	matter = list(MATERIAL_BIOMATTER = 4)

/obj/item/reagent_containers/food/snacks/sliceable/bananabread
	name = "banana-nut bread"
	desc = "A heavenly and filling treat."
	icon_state = "bananabread"
	taste_tag = list(SWEET_FOOD, FLOURY_FOOD)
	slice_path = /obj/item/reagent_containers/food/snacks/bananabreadslice
	slices_num = 5
	filling_color = "#EDE5AD"
	bitesize = 2
	center_of_mass = list("x"=16, "y"=9)
	nutriment_desc = list("bread" = 10)
	nutriment_amt = 10
	preloaded_reagents = list("banana" = 20)
	matter = list(MATERIAL_BIOMATTER = 10)

/obj/item/reagent_containers/food/snacks/bananabreadslice
	name = "banana-nut bread slice"
	desc = "A slice of delicious banana bread."
	icon_state = "bananabreadslice"
	taste_tag = list(SWEET_FOOD, FLOURY_FOOD)
	trash = /obj/item/trash/plate
	filling_color = "#EDE5AD"
	bitesize = 2
	center_of_mass = list("x"=16, "y"=8)
	preloaded_reagents = list("banana" = 4, "nutriment" = 4)
	cooked = TRUE
	matter = list(MATERIAL_BIOMATTER = 2)
