
/obj/item/reagent_containers/snacks/brainburger
	name = "brainburger"
	desc = "A strange looking burger. It looks almost sentient."
	icon_state = "brainburger"
	taste_tag = list(MEAT_FOOD)
	filling_color = "#F2B6EA"
	center_of_mass = list("x"=15, "y"=11)
	preloaded_reagents = list("protein" = 6, "alkysine" = 6)
	bitesize = 2
	matter = list(MATERIAL_BIOMATTER = 30)

/obj/item/reagent_containers/snacks/human
	var/hname = ""
	var/job = null
	filling_color = "#D63C3C"

/obj/item/reagent_containers/snacks/human/burger
	name = "-burger"
	desc = "A bloody burger."
	icon_state = "hburger"
	taste_tag = list()
	bitesize = 2
	center_of_mass = list("x"=16, "y"=11)
	preloaded_reagents = list("protein" = 6)
	matter = list(MATERIAL_BIOMATTER = 16)
	item_attacking = /obj/item/reagent_containers/snacks/cheesewedge
	item_attacker_delete = TRUE
	delete_self = TRUE
	item_given = /obj/item/reagent_containers/snacks/cheeseburger
	item_attacking_message = "You make a cheeseburger."

/obj/item/reagent_containers/snacks/cheeseburger
	name = "cheeseburger"
	desc = "A normal burger apart from the addition of a yellow square of cheese."
	icon_state = "cheeseburger"
	taste_tag = list(MEAT_FOOD, CHEESE_FOOD)
	center_of_mass = list("x"=16, "y"=11)
	nutriment_desc = list("cheese" = 2, "bun" = 2)
	nutriment_amt = 2
	preloaded_reagents = list("protein" = 2)
	matter = list(MATERIAL_BIOMATTER = 12)
	cooked = TRUE

/obj/item/reagent_containers/snacks/monkeyburger
	name = "burger"
	desc = "A burger made with a simple meat patty." // Pax hamburgana.
	icon_state = "hburger"
	taste_tag = list(MEAT_FOOD)
	filling_color = "#D63C3C"
	bitesize = 2
	center_of_mass = list("x"=16, "y"=11)
	nutriment_desc = list("bun" = 2)
	nutriment_amt = 3
	preloaded_reagents = list("protein" = 3)
	matter = list(MATERIAL_BIOMATTER = 13)
	cooked = TRUE
	item_attacking = /obj/item/reagent_containers/snacks/cheesewedge
	item_attacker_delete = TRUE
	delete_self = TRUE
	item_given = /obj/item/reagent_containers/snacks/cheeseburger
	item_attacking_message = "You make a cheeseburger."

/obj/item/reagent_containers/snacks/fishburger
	name = "fillet-o-carp sandwich"
	desc = "A fried and bunned slab of carp fillet."
	icon_state = "fishburger"
	taste_tag = list(MEAT_FOOD)
	filling_color = "#FFDEFE"
	bitesize = 3
	center_of_mass = list("x"=16, "y"=10)
	preloaded_reagents = list("protein" = 6)
	matter = list(MATERIAL_BIOMATTER = 14)
	cooked = TRUE

/obj/item/reagent_containers/snacks/baconburger
	name = "bacon burger"
	desc = "A normal burger apart from some strips of bacon added."
	icon_state = "baconburger"
	taste_tag = list(MEAT_FOOD, SALTY_FOOD)
	bitesize = 3
	preloaded_reagents = list("protein" = 6)
	nutriment_desc = list("meaty perfection" = 10, "bun" = 2)
	matter = list(MATERIAL_BIOMATTER = 14)
	cooked = TRUE

/obj/item/reagent_containers/snacks/chickenburger
	name = "poultry fried steak sandwich"
	desc = "A burger consisting of crispy fried poultry instead of a patty, a classic alternative."
	icon_state = "chickenburger"
	taste_tag = list(MEAT_FOOD)
	bitesize = 3
	preloaded_reagents = list("protein" = 6)
	nutriment_desc = list("crispy fried poultry" = 10, "bun" = 2)
	matter = list(MATERIAL_BIOMATTER = 14)
	cooked = TRUE

/obj/item/reagent_containers/snacks/tofuburger
	name = "tofu burger"
	desc = "A burger that was made with tofu over a meat patty."
	icon_state = "tofuburger"
	taste_tag = list(BLAND_FOOD)
	filling_color = "#FFFEE0"
	bitesize = 2
	center_of_mass = list("x"=16, "y"=10)
	nutriment_desc = list("bun" = 2, "pseudo-soy meat" = 3)
	nutriment_amt = 6
	matter = list(MATERIAL_BIOMATTER = 12)
	cooked = TRUE

/obj/item/reagent_containers/snacks/roburger
	name = "roburger"
	desc = "The lettuce is the only organic component. Beep."
	icon_state = "roburger"
	taste_tag = list(BLAND_FOOD) //like licking a battery
	filling_color = "#CCCCCC"
	bitesize = 2
	center_of_mass = list("x"=16, "y"=11)
	nutriment_desc = list("bun" = 2, "metal" = 3)
	nutriment_amt = 2
	matter = list(MATERIAL_BIOMATTER = 6)

/obj/item/reagent_containers/snacks/roburger/Initialize(mapload)
	. = ..()
	if(prob(5))
		reagents.add_reagent("nanites", 2)

/obj/item/reagent_containers/snacks/roburgerbig
	name = "roburger"
	desc = "This massive patty looks like poison. Beep."
	icon_state = "roburger"
	taste_tag = list(BLAND_FOOD)
	filling_color = "#CCCCCC"
	bitesize = 0.1
	volume = 100
	center_of_mass = list("x"=16, "y"=11)
	matter = list(MATERIAL_BIOMATTER = 2)

/obj/item/reagent_containers/snacks/roburgerbig/Initialize(mapload)
	. = ..()
	reagents.add_reagent("nanites", 100)
	bitesize = 0.1

/obj/item/reagent_containers/snacks/xenoburger
	name = "xenoburger"
	desc = "A burger set apart from others by its use of xenomorph meat."
	taste_tag = list(MEAT_FOOD)
	icon_state = "xburger"
	filling_color = "#43DE18"
	center_of_mass = list("x"=16, "y"=11)
	matter = list(MATERIAL_BIOMATTER = 13)

/obj/item/reagent_containers/snacks/xenoburger/Initialize(mapload)
	. = ..()
	reagents.add_reagent("protein", 8)
	bitesize = 2

/obj/item/reagent_containers/snacks/clownburger
	name = "clown burger"
	desc = "This tastes funny..."
	taste_tag = list(SPICY_FOOD)
	icon_state = "clownburger"
	filling_color = "#FF00FF"
	bitesize = 2
	center_of_mass = list("x"=17, "y"=12)
	nutriment_desc = list("bun" = 2, "clown shoe" = 3)
	nutriment_amt = 6
	matter = list(MATERIAL_BIOMATTER = 10)

/obj/item/reagent_containers/snacks/mimeburger
	name = "mime burger"
	desc = "Its taste defies language."
	icon_state = "mimeburger"
	taste_tag = list(BLAND_FOOD)
	filling_color = "#FFFFFF"
	bitesize = 2
	center_of_mass = list("x"=16, "y"=11)
	nutriment_desc = list("bun" = 2, "mime paint" = 3)
	nutriment_amt = 6
	matter = list(MATERIAL_BIOMATTER = 10)

/obj/item/reagent_containers/snacks/spellburger
	name = "spell burger"
	desc = "This is absolutely Ei Nath."
	icon_state = "spellburger"
	taste_tag = list(SPICY_FOOD) //zap
	filling_color = "#D505FF"
	bitesize = 2
	nutriment_desc = list("magic" = 3, "buns" = 3)
	nutriment_amt = 6
	matter = list(MATERIAL_BIOMATTER = 13)

/obj/item/reagent_containers/snacks/jellyburger
	name = "jelly burger"
	desc = "A burger made with jelly as the patty."
	taste_tag = list(SWEET_FOOD)
	icon_state = "jellyburger"
	filling_color = "#B572AB"
	bitesize = 2
	center_of_mass = list("x"=16, "y"=11)
	nutriment_desc = list("buns" = 5)
	nutriment_amt = 5
	matter = list(MATERIAL_BIOMATTER = 8)

/obj/item/reagent_containers/snacks/jellyburger/slime
	preloaded_reagents = list("slimejelly" = 5)

/obj/item/reagent_containers/snacks/jellyburger/cherry
	preloaded_reagents = list("cherryjelly" = 5)

/obj/item/reagent_containers/snacks/bigbiteburger
	name = "big bite burger"
	desc = "A large stack of patties and toppings."
	icon_state = "bigbiteburger"
	taste_tag = list(MEAT_FOOD)
	filling_color = "#E3D681"
	bitesize = 3
	center_of_mass = list("x"=16, "y"=11)
	nutriment_desc = list("buns" = 4)
	nutriment_amt = 4
	preloaded_reagents = list("protein" = 10)
	cooked = TRUE
	matter = list(MATERIAL_BIOMATTER = 60)

/obj/item/reagent_containers/snacks/bigbiteburger/cargo
	desc = "A large stack of patties and toppings. It has big \"R\" stamped on it's bun."

/obj/item/reagent_containers/snacks/superbiteburger
	name = "super bite burger"
	desc = "A towering burger with all kinds of toppings and seasonings."
	icon_state = "superbiteburger"
	taste_tag = list(MEAT_FOOD)
	filling_color = "#CCA26A"
	bitesize = 10
	center_of_mass = list("x"=16, "y"=3)
	nutriment_desc = list("buns" = 25)
	nutriment_amt = 25
	preloaded_reagents = list("protein" = 40) // CALORIES GALORE! Changing to reflect the materials used and complexity of the recipe - Seb
	cooked = TRUE
	matter = list(MATERIAL_BIOMATTER = 40)

//Roach burgers

/obj/item/reagent_containers/snacks/kampferburger
	name = "kampfer burger"
	desc = "A burger made out of a kampfer roach."
	icon_state = "kampferburger"
	taste_tag = list(MEAT_FOOD)
	bitesize = 1
	center_of_mass = list("x"=16, "y"=11)
	nutriment_desc = list("bun" = 2)
	nutriment_amt = 2
	preloaded_reagents = list("protein" = 4)
	matter = list(MATERIAL_BIOMATTER = 15)
	cooked = TRUE

/obj/item/reagent_containers/snacks/panzerburger
	name = "panzer burger"
	desc = "A burger made out of a panzer roach."
	icon_state = "panzerburger"
	taste_tag = list(MEAT_FOOD)
	bitesize = 3
	center_of_mass = list("x"=16, "y"=11)
	nutriment_desc = list("bun" = 2)
	nutriment_amt = 1
	preloaded_reagents = list("protein" = 8)
	matter = list(MATERIAL_BIOMATTER = 17)
	cooked = TRUE

/obj/item/reagent_containers/snacks/jagerburger
	name = "jager burger"
	desc = "A burger made out of a jager roach."
	icon_state = "jagerburger"
	taste_tag = list(MEAT_FOOD)
	bitesize = 2
	center_of_mass = list("x"=16, "y"=11)
	nutriment_desc = list("bun" = 2)
	nutriment_amt = 3
	preloaded_reagents = list("protein" = 6)
	matter = list(MATERIAL_BIOMATTER = 16)
	cooked = TRUE

/obj/item/reagent_containers/snacks/seucheburger
	name = "seuche burger"
	desc = "A burger made out of a seuche roach."
	icon_state = "seucheburger"
	taste_tag = list(MEAT_FOOD)
	bitesize = 2
	center_of_mass = list("x"=16, "y"=11)
	nutriment_desc = list("bun" = 2)
	nutriment_amt = 2
	preloaded_reagents = list("protein" = 4)
	matter = list(MATERIAL_BIOMATTER = 16)
	cooked = TRUE

/obj/item/reagent_containers/snacks/bigroachburger
	name = "big roach burger"
	desc = "A burger made out of many different roaches. A gourmet meal."
	icon_state = "bigroachburger"
	taste_tag = list(MEAT_FOOD)
	bitesize = 3
	center_of_mass = list("x"=16, "y"=11)
	nutriment_desc = list("bun" = 2)
	nutriment_amt = 3
	preloaded_reagents = list("protein" = 8)
	matter = list(MATERIAL_BIOMATTER = 35)
	cooked = TRUE

/obj/item/reagent_containers/snacks/fuhrerburger
	name = "fuhrer burger"
	desc = "A burger made out of a fuhrer roach."
	icon_state = "fuhrerburger"
	taste_tag = list(MEAT_FOOD)
	bitesize = 3
	center_of_mass = list("x"=16, "y"=11)
	nutriment_desc = list("bun" = 2)
	nutriment_amt = 3
	preloaded_reagents = list("protein" = 8) // Fuhrole
	matter = list(MATERIAL_BIOMATTER = 20)
	cooked = TRUE

/obj/item/reagent_containers/snacks/kaiserburger
	name = "kaiser burger"
	desc = "A burger made out of a kaiser roach."
	icon_state = "kaiserburger"
	taste_tag = list(MEAT_FOOD)
	bitesize = 3
	center_of_mass = list("x"=16, "y"=11)
	nutriment_desc = list("bun" = 2)
	nutriment_amt = 3
	preloaded_reagents = list("protein" = 10)
	matter = list(MATERIAL_BIOMATTER = 50)
	cooked = TRUE
