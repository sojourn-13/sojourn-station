/obj/item/reagent_containers/snacks/bread
	name = "bread"
	icon_state = "Some plain old bread."
	icon_state = "bread"
	slice_path = /obj/item/reagent_containers/snacks/breadslice
	slices_num = 5
	taste_tag = list(FLOURY_FOOD)
	filling_color = "#FFE396"
	bitesize = 2
	center_of_mass = list("x"=16, "y"=9)
	nutriment_desc = list("bread" = 6)
	nutriment_amt = 6
	matter = list(MATERIAL_BIOMATTER = 5)
	w_class = ITEM_SIZE_NORMAL

/obj/item/reagent_containers/snacks/breadslice
	name = "bread slice"
	desc = "A slice of generic bread."
	icon_state = "breadslice"
	taste_tag = list(FLOURY_FOOD)
	trash = /obj/item/trash/plate
	filling_color = "#D27332"
	nutriment_amt = 1
	bitesize = 2
	center_of_mass = list("x"=16, "y"=4)

/obj/item/reagent_containers/snacks/butterbread
	name = "buttered toast"
	desc = "A freshly toasted slice of bread with melting butter on top, a humble start to any breakfast."
	icon_state = "buttertoast"
	taste_tag = list(FLOURY_FOOD)
	bitesize = 3
	nutriment_amt = 3
	nutriment_desc = list("bread" = 6, "butter" = 3)

/obj/item/reagent_containers/snacks/creamcheesebread
	name = "cream cheese bread"
	desc = "A pillowy loaf of bread and cream cheese."
	icon_state = "creamcheesebread"
	taste_tag = list(CHEESE_FOOD, FLOURY_FOOD)
	slice_path = /obj/item/reagent_containers/snacks/creamcheesebreadslice
	slices_num = 5
	filling_color = "#FFF896"
	center_of_mass = list("x"=16, "y"=9)
	nutriment_desc = list("bread" = 6, "cream" = 3, "cheese" = 3)
	nutriment_amt = 5
	bitesize = 2
	preloaded_reagents = list("protein" = 15)
	matter = list(MATERIAL_BIOMATTER = 10)
	w_class = ITEM_SIZE_NORMAL

/obj/item/reagent_containers/snacks/creamcheesebreadslice
	name = "cream cheese bread slice"
	desc = "A slice of bread mixed with cream cheese."
	taste_tag = list(SWEET_FOOD, FLOURY_FOOD)
	icon_state = "creamcheesebreadslice"
	trash = /obj/item/trash/plate
	filling_color = "#FFF896"
	bitesize = 2
	center_of_mass = list("x"=16, "y"=13)
	preloaded_reagents = list("protein" = 3)
	cooked = TRUE
	matter = list(MATERIAL_BIOMATTER = 2)

/obj/item/reagent_containers/snacks/meatbread
	name = "meatbread loaf"
	desc = "A hearty, savory bread packed with tender chunks of seasoned meats and cheese."
	icon_state = "meatbread"
	taste_tag = list(MEAT_FOOD, FLOURY_FOOD)
	slice_path = /obj/item/reagent_containers/snacks/meatbreadslice
	slices_num = 5
	filling_color = "#FF7575"
	bitesize = 2
	center_of_mass = list("x"=16, "y"=9)
	nutriment_desc = list("bread" = 10)
	nutriment_amt = 10
	preloaded_reagents = list("protein" = 20)
	matter = list(MATERIAL_BIOMATTER = 20)
	w_class = ITEM_SIZE_NORMAL

/obj/item/reagent_containers/snacks/meatbreadslice
	name = "meatbread slice"
	desc = "A slice of meatbread."
	icon_state = "meatbreadslice"
	taste_tag = list(MEAT_FOOD, FLOURY_FOOD)
	trash = /obj/item/trash/plate
	filling_color = "#FF7575"
	bitesize = 2
	center_of_mass = list("x"=16, "y"=13)
	preloaded_reagents = list("protein" = 4, "nutriment" = 2)
	cooked = TRUE
	matter = list(MATERIAL_BIOMATTER = 4)

/obj/item/reagent_containers/snacks/xenomeatbread
	name = "xenomeatbread loaf"
	desc = "An acid packed loaf with rubbery chunks of seasoned meats."
	icon_state = "xenomeatbread"
	taste_tag = list(MEAT_FOOD, FLOURY_FOOD)
	slice_path = /obj/item/reagent_containers/snacks/xenomeatbreadslice
	slices_num = 5
	filling_color = "#8AFF75"
	bitesize = 2
	center_of_mass = list("x"=16, "y"=9)
	nutriment_desc = list("bread" = 10)
	nutriment_amt = 10
	preloaded_reagents = list("protein" = 20)
	matter = list(MATERIAL_BIOMATTER = 20)
	w_class = ITEM_SIZE_NORMAL

/obj/item/reagent_containers/snacks/xenomeatbreadslice
	name = "xenomeatbread slice"
	desc = "A slice of acidy meatbread."
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

/obj/item/reagent_containers/snacks/bananabread
	name = "banana-nut bread"
	desc = "A heavy and filling treat."
	icon_state = "bananabread"
	taste_tag = list(SWEET_FOOD, FLOURY_FOOD)
	slice_path = /obj/item/reagent_containers/snacks/bananabreadslice
	slices_num = 5
	filling_color = "#EDE5AD"
	bitesize = 2
	center_of_mass = list("x"=16, "y"=9)
	nutriment_desc = list("bread" = 10)
	nutriment_amt = 10
	preloaded_reagents = list("banana" = 20)
	matter = list(MATERIAL_BIOMATTER = 10)
	w_class = ITEM_SIZE_NORMAL

/obj/item/reagent_containers/snacks/bananabreadslice
	name = "banana-nut bread slice"
	desc = "A slice of banana bread."
	icon_state = "bananabreadslice"
	taste_tag = list(SWEET_FOOD, FLOURY_FOOD)
	trash = /obj/item/trash/plate
	filling_color = "#EDE5AD"
	bitesize = 2
	center_of_mass = list("x"=16, "y"=8)
	preloaded_reagents = list("banana" = 4, "nutriment" = 4)
	cooked = TRUE
	matter = list(MATERIAL_BIOMATTER = 2)

/obj/item/reagent_containers/snacks/tofubread
	name = "tofubread"
	icon_state = "A bread meatbread made from tofu rather than meat."
	icon_state = "tofubread"
	taste_tag = list(BLAND_FOOD, FLOURY_FOOD)
	slice_path = /obj/item/reagent_containers/snacks/tofubreadslice
	slices_num = 5
	filling_color = "#F7FFE0"
	bitesize = 2
	center_of_mass = list("x"=16, "y"=9)
	nutriment_desc = list("tofu" = 10)
	nutriment_amt = 30
	matter = list(MATERIAL_BIOMATTER = 10)
	w_class = ITEM_SIZE_NORMAL

/obj/item/reagent_containers/snacks/tofubreadslice
	name = "tofubread slice"
	desc = "A slice of tofubread."
	icon_state = "tofubreadslice"
	taste_tag = list(BLAND_FOOD, FLOURY_FOOD)
	trash = /obj/item/trash/plate
	filling_color = "#F7FFE0"
	bitesize = 2
	center_of_mass = list("x"=16, "y"=13)
	nutriment_amt = 6
	nutriment_desc = list("tofu" = 2)
	cooked = TRUE