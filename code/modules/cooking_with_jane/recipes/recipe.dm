
//Example Recipes
/datum/cooking_with_jane/recipe/steak_stove

	//Name of the recipe. If not defined, it will just use the name of the product_type
	name="Stove-Top cooked Steak"

	//The recipe will be cooked on a pan
	cooking_container = PAN

	//The product of the recipe will be a steak.
	product_type = /obj/item/reagent_containers/snacks/meatsteak

	//The product will have it's initial reagents wiped, prior to the recipe adding in reagents of its own.
	replace_reagents = TRUE

	step_builder = list(

		//Butter your pan by adding a slice of butter, and then melting it. Adding the butter unlocks the option to melt it on the stove.
		CWJ_BEGIN_OPTION_CHAIN,
		//base - the lowest amount of quality following this step can award.
		//reagent_skip - Exclude the added item's reagents from being included the product
		list(CWJ_ADD_ITEM_OPTIONAL, /obj/item/reagent_containers/snacks/butterslice, base=10, reagent_skip=TRUE, add_price = 3),

		//Melt the butter into the pan by cooking it on a stove set to Low for 10 seconds
		list(CWJ_USE_STOVE_OPTIONAL, J_LO, 10 SECONDS),
		CWJ_END_OPTION_CHAIN,

		//A steak is needed to start the meal.
		//qmod- Half of the food quality of the parent will be considered.
		//exclude_reagents- Blattedin and Carpotoxin will be filtered out of the steak.
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/meat, qmod=0.5, exclude_reagents=list("carpotoxin", "blattedin")),
		list(CWJ_ADD_REAGENT, "sodiumchloride", 1),
		list(CWJ_ADD_REAGENT, "blackpepper", 1),
		//Add some mushrooms to give it some zest. Only one kind is allowed!
		CWJ_BEGIN_EXCLUSIVE_OPTIONS,
		list(CWJ_ADD_PRODUCE_OPTIONAL, "chanterelle", qmod=0.2, reagent_skip=TRUE, add_price = 2),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "reishi", qmod=0.4, reagent_skip=TRUE, add_price = 3),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "amanita", qmod=0.4, reagent_skip=TRUE, add_price = 3),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "plumphelmet", qmod=0.4, reagent_skip=TRUE, add_price = 3),
		CWJ_END_EXCLUSIVE_OPTIONS,

		//Beat that meat to increase its quality
		list(CWJ_USE_TOOL_OPTIONAL, QUALITY_HAMMERING, 15, add_price = 1),

		//You can add up to 3 units of honey to increase the quality. Any more will negatively impact it.
		//base- for CWJ_ADD_REAGENT, the amount that this step will award if followed perfectly.
		list(CWJ_ADD_REAGENT_OPTIONAL, "honey", 3, base=3, add_price = 3),

		//You can add capaicin or wine, but not both
		//prod_desc- A description appended to the resulting product.
		CWJ_BEGIN_EXCLUSIVE_OPTIONS,
		list(CWJ_ADD_REAGENT_OPTIONAL, "capsaicin", 5, base=6, prod_desc="The steak was Spiced with chili powder.", add_price = 2),
		list(CWJ_ADD_REAGENT_OPTIONAL, "wine", 5, remain_percent=0.1 ,base=6, prod_desc="The steak was sauteed in wine", add_price = 3),
		CWJ_END_EXCLUSIVE_OPTIONS,

		//Cook on a stove, at medium temperature, for 30 seconds
		list(CWJ_USE_STOVE, J_MED, 30 SECONDS)
	)
/datum/cooking_with_jane/recipe/tortilla
	cooking_container = OVEN
	product_type = /obj/item/reagent_containers/snacks/tortilla
	product_count = 3
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/flatdoughslice),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/flatdoughslice),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/flatdoughslice),
		list(CWJ_USE_OVEN, J_HI, 10 SECONDS)
	)

/datum/cooking_with_jane/recipe/taco
	cooking_container = PAN
	product_type = /obj/item/reagent_containers/snacks/taco
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/tortilla),
		list(CWJ_ADD_REAGENT, "sodiumchloride", 1),
		list(CWJ_ADD_REAGENT, "cornoil", 1),
		list(CWJ_ADD_PRODUCE, "corn"),
		list(CWJ_ADD_PRODUCE, "cabbage"),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/cutlet),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/cheesewedge),
		list(CWJ_USE_STOVE, J_MED, 20 SECONDS)
	)

/datum/cooking_with_jane/recipe/sausage
	cooking_container = GRILL
	product_type = /obj/item/reagent_containers/snacks/sausage
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/rawmeatball),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/rawbacon),
		list(CWJ_ADD_REAGENT_OPTIONAL, "cornoil", 1, base=1, add_price = 2),
		list(CWJ_ADD_REAGENT_OPTIONAL, "sodiumchloride", 1, base=1, add_price = 1),
		list(CWJ_ADD_REAGENT_OPTIONAL, "blackpepper", 1, base=1, add_price = 1),
		list(CWJ_USE_GRILL, J_MED, 10 SECONDS)
	)

/datum/cooking_with_jane/recipe/frenchtoast
	cooking_container = PAN
	product_type = /obj/item/reagent_containers/snacks/frenchtoast
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/breadslice),
		list(CWJ_ADD_REAGENT, "milk", 5),
		list(CWJ_ADD_REAGENT, "egg", 3),
		list(CWJ_ADD_REAGENT_OPTIONAL, "cinnamonpowder", 1, add_price = 1.5),
		list(CWJ_ADD_REAGENT_OPTIONAL, "sugar", 1, add_price = 0.5),
		list(CWJ_USE_STOVE, J_HI, 10 SECONDS)
	)

/datum/cooking_with_jane/recipe/fries
	cooking_container = PAN
	product_type = /obj/item/reagent_containers/snacks/fries
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/rawsticks),
		list(CWJ_ADD_REAGENT, "cornoil", 1),
		list(CWJ_ADD_REAGENT_OPTIONAL, "sodiumchloride", 1, add_price = 1),
		list(CWJ_USE_STOVE, J_HI, 10 SECONDS)
	)

/datum/cooking_with_jane/recipe/cheesyfries
	cooking_container = PAN
	product_type = /obj/item/reagent_containers/snacks/cheesyfries
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/fries),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/cheesewedge),
		list(CWJ_USE_STOVE, J_LO, 10 SECONDS)
	)

/datum/cooking_with_jane/recipe/chickensteak
	cooking_container = OVEN
	product_type = /obj/item/reagent_containers/snacks/chickensteak

	replace_reagents = TRUE

	step_builder = list(
		CWJ_BEGIN_OPTION_CHAIN,
		list(CWJ_ADD_ITEM_OPTIONAL, /obj/item/reagent_containers/snacks/butterslice, base=10, reagent_skip=TRUE, add_price = 3),
		list(CWJ_USE_STOVE_OPTIONAL, J_LO, 10 SECONDS, add_price = 2),
		CWJ_END_OPTION_CHAIN,
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/chickenbreast, qmod=0.5, exclude_reagents=list("carpotoxin", "blattedin")),
		list(CWJ_ADD_REAGENT, "sodiumchloride", 1),
		list(CWJ_ADD_REAGENT, "blackpepper", 1),
		CWJ_BEGIN_EXCLUSIVE_OPTIONS,
		list(CWJ_ADD_PRODUCE_OPTIONAL, "chanterelle", qmod=0.2, reagent_skip=TRUE, add_price = 2),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "reishi", qmod=0.4, reagent_skip=TRUE, add_price = 3),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "amanita", qmod=0.4, reagent_skip=TRUE, add_price = 3),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "plumphelmet", qmod=0.4, reagent_skip=TRUE, add_price = 3),
		CWJ_END_EXCLUSIVE_OPTIONS,
		list(CWJ_ADD_REAGENT_OPTIONAL, "honey", 3, base=3, add_price = 3),
		CWJ_BEGIN_EXCLUSIVE_OPTIONS,
		list(CWJ_ADD_REAGENT_OPTIONAL, "capsaicin", 5, base=6, prod_desc="The chicken was Spiced with chili powder.", add_price = 3),
		list(CWJ_ADD_REAGENT_OPTIONAL, "lemonjuice", 5, remain_percent=0.1 ,base=3, prod_desc="The chicken was sauteed in lemon juice", add_price = 2),
		CWJ_END_EXCLUSIVE_OPTIONS,
		list(CWJ_USE_STOVE, J_MED, 30 SECONDS)
	)

/datum/cooking_with_jane/recipe/beefcurry
	cooking_container = POT
	product_type = /obj/item/reagent_containers/snacks/beefcurry

	replace_reagents = TRUE

	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/butterslice, base=10),
		list(CWJ_USE_STOVE, J_LO, 10 SECONDS),
		list(CWJ_ADD_REAGENT, "flour", 5),
		list(CWJ_ADD_REAGENT, "soysauce", 5),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/boiledrice, qmod=0.5),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/meat, qmod=0.5),
		list(CWJ_ADD_PRODUCE, "chili"),
		list(CWJ_ADD_PRODUCE, "carrot"),
		list(CWJ_ADD_PRODUCE, "tomato"),
		list(CWJ_USE_STOVE, J_MED, 40 SECONDS)
	)

/datum/cooking_with_jane/recipe/chickencurry
	cooking_container = POT
	product_type = /obj/item/reagent_containers/snacks/chickencurry

	replace_reagents = TRUE

	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/butterslice, base=10),
		list(CWJ_USE_STOVE, J_LO, 10 SECONDS),
		list(CWJ_ADD_REAGENT, "flour", 5),
		list(CWJ_ADD_REAGENT, "soysauce", 5),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/boiledrice, qmod=0.5),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/chickenbreast, qmod=0.5),
		list(CWJ_ADD_PRODUCE, "chili"),
		list(CWJ_ADD_PRODUCE, "carrot"),
		list(CWJ_ADD_PRODUCE, "tomato"),
		list(CWJ_USE_STOVE, J_MED, 40 SECONDS)
	)

/datum/cooking_with_jane/recipe/friedchikin
	cooking_container = PAN
	product_type = /obj/item/reagent_containers/snacks/friedchikin

	replace_reagents = TRUE

	step_builder = list(
		list(CWJ_ADD_REAGENT, "cornoil", 3),
		list(CWJ_USE_STOVE, J_LO, 10 SECONDS),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/chickenbreast, qmod=0.5),
		list(CWJ_ADD_REAGENT, "flour", 5),
		list(CWJ_ADD_REAGENT, "sodiumchloride", 1),
		list(CWJ_USE_STOVE, J_HI, 10 SECONDS),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "chili", add_price = 2),
		list(CWJ_ADD_REAGENT, "blackpepper", 1)
	)

/datum/cooking_with_jane/recipe/mashpotato
	cooking_container = BOWL
	product_type = /obj/item/reagent_containers/snacks/mashpotatoes

	replace_reagents = TRUE

	step_builder = list(
		list(CWJ_ADD_PRODUCE, "potato", 2),
		list(CWJ_ADD_REAGENT, "milk", 2),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/butterslice, base=10),
		list(CWJ_ADD_REAGENT_OPTIONAL, "sodiumchloride", 1, add_price = 1),
		list(CWJ_USE_TOOL, QUALITY_HAMMERING, 15)
	)

/datum/cooking_with_jane/recipe/loadedbakedpotato
	cooking_container = OVEN
	product_type = /obj/item/reagent_containers/snacks/loadedbakedpotato

	replace_reagents = TRUE

	step_builder = list(
		list(CWJ_ADD_PRODUCE, "potato", 1),
		list(CWJ_ADD_ITEM_OPTIONAL, /obj/item/reagent_containers/snacks/butterslice, base=10, add_price = 5),
		list(CWJ_ADD_REAGENT_OPTIONAL, "sodiumchloride", 1, add_price = 1),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/cheesewedge, qmod=0.5),
		list(CWJ_USE_OVEN, J_MED, 30 SECONDS)
	)

/datum/cooking_with_jane/recipe/bread_meat
	cooking_container = OVEN
	product_type = /obj/item/reagent_containers/snacks/meatbread
	recipe_guide = "Put dough in an oven, bake for 30 seconds on medium."
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/dough),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/dough),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/meat),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/meat),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/cheesewedge),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/cheesewedge),
		list(CWJ_USE_OVEN, J_MED, 30 SECONDS)
	)

/datum/cooking_with_jane/recipe/bananabread
	cooking_container = OVEN
	product_type = /obj/item/reagent_containers/snacks/bananabread

	replace_reagents = TRUE

	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/dough, qmod=0.5),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/dough, qmod=0.5),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/dough, qmod=0.5),
		list(CWJ_ADD_REAGENT, "milk", 2),
		list(CWJ_ADD_REAGENT, "sugar", 15),
		list(CWJ_ADD_PRODUCE, "banana", 1),
		list(CWJ_USE_OVEN, J_MED, 40 SECONDS)
	)

/datum/cooking_with_jane/recipe/xenomeatbread
	cooking_container = OVEN
	product_type = /obj/item/reagent_containers/snacks/xenomeatbread

	replace_reagents = TRUE

	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/dough, qmod=0.5),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/dough, qmod=0.5),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/dough, qmod=0.5),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/meat/xenomeat, qmod=0.5),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/meat/xenomeat, qmod=0.5),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/meat/xenomeat, qmod=0.5),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/cheesewedge, qmod=0.5),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/cheesewedge, qmod=0.5),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/cheesewedge, qmod=0.5),
		list(CWJ_USE_OVEN, J_MED, 40 SECONDS)
	)

/datum/cooking_with_jane/recipe/tofubread
	cooking_container = OVEN
	product_type = /obj/item/reagent_containers/snacks/tofubread

	replace_reagents = TRUE

	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/dough, qmod=0.5),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/dough, qmod=0.5),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/dough, qmod=0.5),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/tofu, qmod=0.5),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/tofu, qmod=0.5),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/tofu, qmod=0.5),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/cheesewedge, qmod=0.5),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/cheesewedge, qmod=0.5),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/cheesewedge, qmod=0.5),
		list(CWJ_USE_OVEN, J_MED, 40 SECONDS)
	)

/datum/cooking_with_jane/recipe/creamcheesebread
	cooking_container = OVEN
	product_type = /obj/item/reagent_containers/snacks/creamcheesebread

	replace_reagents = TRUE

	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/dough, qmod=0.5),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/dough, qmod=0.5),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/cheesewedge, qmod=0.5),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/cheesewedge, qmod=0.5),
		list(CWJ_USE_OVEN, J_MED, 40 SECONDS)
	)

/datum/cooking_with_jane/recipe/porkchops
	cooking_container = GRILL
	product_type = /obj/item/reagent_containers/snacks/porkchops

	replace_reagents = TRUE

	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/meat/pork, qmod=0.5, exclude_reagents=list("carpotoxin", "blattedin")),
		list(CWJ_ADD_REAGENT, "sodiumchloride", 1),
		list(CWJ_ADD_REAGENT, "blackpepper", 1),
		CWJ_BEGIN_EXCLUSIVE_OPTIONS,
		list(CWJ_ADD_PRODUCE_OPTIONAL, "chanterelle", qmod=0.2, reagent_skip=TRUE, add_price = 2),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "reishi", qmod=0.4, reagent_skip=TRUE, add_price = 3),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "amanita", qmod=0.4, reagent_skip=TRUE, add_price = 3),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "plumphelmet", qmod=0.4, reagent_skip=TRUE, add_price = 3),
		CWJ_END_EXCLUSIVE_OPTIONS,
		CWJ_BEGIN_EXCLUSIVE_OPTIONS,
		list(CWJ_ADD_REAGENT_OPTIONAL, "capsaicin", 5, base=6, prod_desc="The pork was Spiced with chili powder.", add_price = 3),
		list(CWJ_ADD_REAGENT_OPTIONAL, "pineapplejuice", 5, remain_percent=0.1, base=5, prod_desc="The pork was rosted in pineapple juice.", add_price = 2),
		list(CWJ_ADD_REAGENT_OPTIONAL, "honey", 5, remain_percent=0.1 ,base=3, prod_desc="The pork was glazed with honey", add_price = 5),
		list(CWJ_ADD_REAGENT_OPTIONAL, "bbqsauce", 3, remain_percent=0.5 ,base=8, prod_desc="The pork was layered with BBQ sauce", add_price = 8),
		CWJ_END_EXCLUSIVE_OPTIONS,
		list(CWJ_USE_GRILL, J_MED, 30 SECONDS)
	)

/datum/cooking_with_jane/recipe/tonkatsu
	cooking_container = PAN
	product_type = /obj/item/reagent_containers/snacks/tonkatsu

	replace_reagents = TRUE

	step_builder = list(
		list(CWJ_ADD_REAGENT, "cornoil", 2),
		list(CWJ_ADD_REAGENT, "egg", 3),
		list(CWJ_ADD_REAGENT, "sodiumchloride", 1),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/meat/pork, qmod=0.5),
		list(CWJ_ADD_REAGENT, "flour", 5),
		list(CWJ_USE_STOVE, J_MED, 40 SECONDS)
	)

/datum/cooking_with_jane/recipe/katsudon
	cooking_container = CUTTING_BOARD
	product_type = /obj/item/reagent_containers/snacks/katsudon

	replace_reagents = TRUE

	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/boiledrice, qmod=0.5),
		list(CWJ_ADD_REAGENT, "soysauce", 5),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/tonkatsu, qmod=0.5),
		list(CWJ_ADD_REAGENT, "egg", 3),
		list(CWJ_USE_TOOL, QUALITY_CUTTING, 1)
	)

/datum/cooking_with_jane/recipe/roastchicken
	cooking_container = OVEN
	product_type = /obj/item/reagent_containers/snacks/roastchicken
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/meat/chicken, qmod=0.5),
		list(CWJ_ADD_REAGENT, "sodiumchloride", 1),
		list(CWJ_ADD_REAGENT, "blackpepper", 1),
		list(CWJ_USE_OVEN, J_MED, 30 SECONDS)
	)

/datum/cooking_with_jane/recipe/friedegg_basic
	cooking_container = PAN
	product_type = /obj/item/reagent_containers/snacks/friedegg
	step_builder = list(
		CWJ_BEGIN_OPTION_CHAIN,
		list(CWJ_ADD_ITEM_OPTIONAL, /obj/item/reagent_containers/snacks/butterslice, base=10, reagent_skip=TRUE, add_price = 8),
		list(CWJ_USE_STOVE_OPTIONAL, J_LO, 10 SECONDS, add_price = 1),
		CWJ_END_OPTION_CHAIN,
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/egg, qmod=0.5, exclude_reagents=list("blattedin")),
		list(CWJ_ADD_REAGENT, "sodiumchloride", 1),
		list(CWJ_ADD_REAGENT, "blackpepper", 1),
		list(CWJ_ADD_REAGENT_OPTIONAL, "cornoil", 1, base=1, add_price = 2),
		list(CWJ_USE_STOVE, J_LO, 10 SECONDS)
	)

/datum/cooking_with_jane/recipe/popcorn
	cooking_container = PAN
	product_type = /obj/item/reagent_containers/snacks/popcorn
	step_builder = list(
		list(CWJ_ADD_PRODUCE, "corn", reagent_skip=TRUE),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/butterslice, qmod=0.5),
		list(CWJ_ADD_REAGENT, "cornoil", 2),
		list(CWJ_ADD_REAGENT_OPTIONAL, "sodiumchloride", 1, base=1, add_price = 1),
		list(CWJ_USE_STOVE, J_LO, 10 SECONDS)
	)

/datum/cooking_with_jane/recipe/cookie
	cooking_container = OVEN
	product_type = /obj/item/reagent_containers/snacks/cookie
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/butterslice, qmod=0.5),
		list(CWJ_ADD_REAGENT_OPTIONAL, "cornoil", 2, add_price = 1),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/doughslice, qmod=0.5),
		list(CWJ_ADD_REAGENT, "milk", 5),
		list(CWJ_ADD_REAGENT, "sugar", 5),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/chocolatebar, qmod=0.5),
		list(CWJ_USE_STOVE, J_LO, 10 SECONDS)
	)

/datum/cooking_with_jane/recipe/muffin
	cooking_container = OVEN
	product_type = /obj/item/reagent_containers/snacks/muffin
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/doughslice, qmod=0.5),
		list(CWJ_ADD_REAGENT, "milk", 5),
		list(CWJ_ADD_REAGENT, "sugar", 5),
		list(CWJ_ADD_ITEM_OPTIONAL, /obj/item/reagent_containers/snacks/chocolatebar, add_price = 10, qmod=0.5),
		list(CWJ_USE_STOVE, J_LO, 10 SECONDS)
	)

/datum/cooking_with_jane/recipe/eggplantparm
	cooking_container = OVEN
	product_type = /obj/item/reagent_containers/snacks/eggplantparm
	step_builder = list(
		list(CWJ_ADD_PRODUCE, "eggplant", reagent_skip=TRUE),
		list(CWJ_ADD_ITEM_OPTIONAL, /obj/item/reagent_containers/snacks/butterslice, base=3, reagent_skip=TRUE, add_price = 4),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/cheesewedge, qmod=0.5),
		CWJ_BEGIN_EXCLUSIVE_OPTIONS,
		list(CWJ_ADD_PRODUCE_OPTIONAL, "chanterelle", qmod=0.2, reagent_skip=TRUE, add_price = 1),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "reishi", qmod=0.4, reagent_skip=TRUE, add_price = 2),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "amanita", qmod=0.4, reagent_skip=TRUE, add_price = 2),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "plumphelmet", qmod=0.4, reagent_skip=TRUE, add_price = 2),
		CWJ_END_EXCLUSIVE_OPTIONS,
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/cheesewedge, qmod=0.5),
		list(CWJ_USE_STOVE, J_HI, 30 SECONDS)
	)

/datum/cooking_with_jane/recipe/boiled_egg
	cooking_container = POT
	product_type = /obj/item/reagent_containers/snacks/boiledegg
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/egg, qmod=0.5, exclude_reagents=list("blattedin")),
		list(CWJ_ADD_REAGENT, "water", 5),
		list(CWJ_ADD_REAGENT_OPTIONAL, "sodiumchloride", 1, base=1, add_price = 1),
		list(CWJ_USE_STOVE, J_MED, 20 SECONDS)
	)

/datum/cooking_with_jane/recipe/wingfangchu
	cooking_container = CUTTING_BOARD
	product_type = /obj/item/reagent_containers/snacks/wingfangchu
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/meat/xenomeat, qmod=0.5),
		list(CWJ_ADD_REAGENT, "soysauce", 5),
		list(CWJ_USE_TOOL, QUALITY_CUTTING, 1)
	)

/datum/cooking_with_jane/recipe/sashimi
	cooking_container = CUTTING_BOARD
	product_type = /obj/item/reagent_containers/snacks/sashimi
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/meat/carp, qmod=0.5),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/meat/carp, qmod=0.5),
		list(CWJ_ADD_REAGENT, "soysauce", 5),
		list(CWJ_USE_TOOL, QUALITY_CUTTING, 1)
	)

/datum/cooking_with_jane/recipe/sandwich_basic
	cooking_container = CUTTING_BOARD
	product_type = /obj/item/reagent_containers/snacks/sandwich
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/breadslice, qmod=0.5),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/cheesewedge, qmod=0.5),
		list(CWJ_ADD_PRODUCE, "cabbage", reagent_skip=TRUE),
		list(CWJ_ADD_PRODUCE, "tomato", reagent_skip=TRUE),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/cutlet, qmod=0.5, desc="Add any kind of cooked cutlet."),
		list(CWJ_ADD_REAGENT_OPTIONAL, "sodiumchloride", 1, add_price = 0.75),
		list(CWJ_ADD_REAGENT_OPTIONAL, "blackpepper", 1, add_price = 0.25),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/breadslice, qmod=0.5)
	)

/datum/cooking_with_jane/recipe/blt
	cooking_container = CUTTING_BOARD
	product_type = /obj/item/reagent_containers/snacks/blt
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/breadslice, qmod=0.5),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/bacon, qmod=0.5),
		list(CWJ_ADD_PRODUCE, "cabbage", reagent_skip=TRUE),
		list(CWJ_ADD_PRODUCE, "tomato", reagent_skip=TRUE),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/cutlet, qmod=0.5, desc="Add any kind of cooked cutlet."),
		list(CWJ_ADD_REAGENT_OPTIONAL, "sodiumchloride", 1, add_price = 0.75),
		list(CWJ_ADD_REAGENT_OPTIONAL, "blackpepper", 1, add_price = 0.25),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/breadslice, qmod=0.5)
	)

/datum/cooking_with_jane/recipe/twobread
	cooking_container = CUTTING_BOARD
	product_type = /obj/item/reagent_containers/snacks/twobread
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/breadslice, qmod=0.5),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/breadslice, qmod=0.5),
		list(CWJ_ADD_REAGENT, "wine", 5)
	)

/datum/cooking_with_jane/recipe/slimesandwich
	cooking_container = CUTTING_BOARD
	product_type = /obj/item/reagent_containers/snacks/jellysandwich/slime
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/breadslice, qmod=0.5),
		list(CWJ_ADD_REAGENT, "slimejelly", 5),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/breadslice, qmod=0.5)
	)

/datum/cooking_with_jane/recipe/cherrysandwich
	cooking_container = CUTTING_BOARD
	product_type = /obj/item/reagent_containers/snacks/jellysandwich/cherry
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/breadslice, qmod=0.5),
		list(CWJ_ADD_REAGENT, "cherryjelly", 5),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/breadslice, qmod=0.5)
	)

/datum/cooking_with_jane/recipe/cherrysandwich
	cooking_container = CUTTING_BOARD
	product_type = /obj/item/reagent_containers/snacks/jellysandwich/cherry
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/breadslice, qmod=0.5),
		list(CWJ_ADD_REAGENT, "cherryjelly", 5),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/breadslice, qmod=0.5)
	)

/datum/cooking_with_jane/recipe/jelliedtoast
	cooking_container = CUTTING_BOARD
	product_type = /obj/item/reagent_containers/snacks/jelliedtoast/cherry
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/breadslice, qmod=0.5),
		list(CWJ_ADD_REAGENT, "cherryjelly", 5),
		list(CWJ_USE_TOOL, QUALITY_CUTTING, 1)
	)

/datum/cooking_with_jane/recipe/slimetoast
	cooking_container = CUTTING_BOARD
	product_type = /obj/item/reagent_containers/snacks/jelliedtoast/slime
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/breadslice, qmod=0.5),
		list(CWJ_ADD_REAGENT, "slimejelly", 5),
		list(CWJ_USE_TOOL, QUALITY_CUTTING, 1)
	)

/datum/cooking_with_jane/recipe/grilledcheese
	cooking_container = GRILL
	product_type = /obj/item/reagent_containers/snacks/grilledcheese
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/breadslice, qmod=0.5),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/butterslice, qmod=0.5),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/cheesewedge, qmod=0.5),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/breadslice, qmod=0.5),
		list(CWJ_USE_GRILL, J_LO, 10 SECONDS)
	)

/datum/cooking_with_jane/recipe/toastedsandwich
	cooking_container = GRILL
	product_type = /obj/item/reagent_containers/snacks/toastedsandwich
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/sandwich, qmod=0.5),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/butterslice, qmod=0.5),
		list(CWJ_USE_GRILL, J_LO, 10 SECONDS)
	)

/datum/cooking_with_jane/recipe/icing
	cooking_container = POT
	reagent_id = "glaze"
	reagent_amount = 30
	description = "A dollop of basic icing!"
	recipe_guide = "Icing will need to be poured into a container after cooking."
	step_builder = list(
		list(CWJ_ADD_REAGENT, "sugar", 30),
		list(CWJ_ADD_REAGENT, "water", 30),
		list(CWJ_USE_STOVE, J_LO, 30 SECONDS)
	)

/datum/cooking_with_jane/recipe/stewedsoymeat
	cooking_container = POT
	product_type = /obj/item/reagent_containers/snacks/stewedsoymeat
	step_builder = list(
		list(CWJ_ADD_REAGENT, "water", 10),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/soydope, qmod=0.5),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/soydope, qmod=0.5),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "carrot", reagent_skip=TRUE, add_price = 2),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "tomato", reagent_skip=TRUE, add_price = 2),
		list(CWJ_ADD_REAGENT_OPTIONAL, "sodiumchloride", 1, base=1, add_price = 1),
		list(CWJ_USE_STOVE, J_HI, 20 SECONDS)
	)

/datum/cooking_with_jane/recipe/boiledrice
	cooking_container = POT
	product_type = /obj/item/reagent_containers/snacks/boiledrice
	step_builder = list(
		list(CWJ_ADD_REAGENT, "water", 10),
		list(CWJ_ADD_REAGENT, "rice", 10),
		list(CWJ_ADD_REAGENT_OPTIONAL, "sodiumchloride", 1, base=1, add_price = 1),
		list(CWJ_USE_STOVE, J_HI, 20 SECONDS)
	)

/datum/cooking_with_jane/recipe/boiledslimeextract
	cooking_container = POT
	product_type = /obj/item/reagent_containers/snacks/boiledslimecore
	step_builder = list(
		list(CWJ_ADD_REAGENT, "water", 10),
		list(CWJ_ADD_REAGENT_OPTIONAL, "sodiumchloride", 1, base=1, add_price = 1),
		list(CWJ_ADD_ITEM, /obj/item/slime_extract, qmod=0.5),
		list(CWJ_USE_STOVE, J_HI, 20 SECONDS)
	)

/datum/cooking_with_jane/recipe/ricepudding
	cooking_container = BOWL
	product_type = /obj/item/reagent_containers/snacks/ricepudding
	step_builder = list(
		list(CWJ_ADD_REAGENT, "milk", 5),
		list(CWJ_ADD_REAGENT_OPTIONAL, "cream", 10, add_price = 2),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/boiledrice, qmod=0.5)
	)

/datum/cooking_with_jane/recipe/bread
	cooking_container = OVEN
	product_type = /obj/item/reagent_containers/snacks/bread
	recipe_guide = "Put dough in an oven, bake for 30 seconds on medium."
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/dough, qmod=1),
		list(CWJ_ADD_ITEM_OPTIONAL, /obj/item/reagent_containers/snacks/butterslice, qmod=0.5, min=5, add_price = 5),
		list(CWJ_ADD_REAGENT_OPTIONAL, "woodpulp", 5, add_price = 5),
		list(CWJ_USE_OVEN, J_MED, 30 SECONDS)
	)

/datum/cooking_with_jane/recipe/baguette
	cooking_container = OVEN
	product_type = /obj/item/reagent_containers/snacks/baguette
	step_builder = list(
		list(CWJ_ADD_REAGENT, "blackpepper", 1),
		list(CWJ_ADD_REAGENT, "sodiumchloride", 1),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/dough, qmod=0.6),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/dough, qmod=0.6),
		list(CWJ_ADD_ITEM_OPTIONAL, /obj/item/reagent_containers/snacks/butterslice, qmod=0.5, min=5, add_price = 5),
		list(CWJ_USE_OVEN, J_MED, 30 SECONDS)
	)

/datum/cooking_with_jane/recipe/cracker
	cooking_container = OVEN
	product_type = /obj/item/reagent_containers/snacks/cracker
	step_builder = list(
		list(CWJ_ADD_REAGENT, "sodiumchloride", 1),
		list(CWJ_ADD_REAGENT_OPTIONAL, "woodpulp", 1, add_price = 3),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/doughslice, qmod=0.5),
		list(CWJ_USE_OVEN, J_LO, 20 SECONDS)
	)

/datum/cooking_with_jane/recipe/bun
	cooking_container = OVEN
	product_type = /obj/item/reagent_containers/snacks/bun
	product_count = 3
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/doughslice, qmod=0.5),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/doughslice, qmod=0.5),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/doughslice, qmod=0.5),
		list(CWJ_USE_OVEN, J_HI, 10 SECONDS)
	)

/datum/cooking_with_jane/recipe/flatbread
	cooking_container = OVEN
	product_type = /obj/item/reagent_containers/snacks/flatbread
	product_count = 3
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/flatdough, qmod=0.5),
		list(CWJ_USE_OVEN, J_HI, 10 SECONDS)
	)

/datum/cooking_with_jane/recipe/bacon
	cooking_container = PAN
	product_type = /obj/item/reagent_containers/snacks/bacon
	step_builder = list(
		list(CWJ_ADD_REAGENT, "sodiumchloride", 1),
		list(CWJ_ADD_REAGENT, "cornoil", 1),
		list(CWJ_ADD_REAGENT_OPTIONAL, "blackpepper", 1, base=1, add_price = 1),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/rawbacon, qmod=0.5),
		list(CWJ_ADD_REAGENT_OPTIONAL, "honey", 1, base=1, add_price = 3),
		list(CWJ_USE_STOVE, J_LO, 20 SECONDS)
	)

/datum/cooking_with_jane/recipe/baconegg
	cooking_container = PAN
	product_type = /obj/item/reagent_containers/snacks/baconeggs
	step_builder = list(
		list(CWJ_ADD_REAGENT, "sodiumchloride", 1),
		list(CWJ_ADD_REAGENT, "cornoil", 1),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/bacon, qmod=0.5),
		list(CWJ_ADD_REAGENT_OPTIONAL, "honey", 1, base=1, add_price = 3),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/friedegg, qmod=0.5),
		list(CWJ_ADD_REAGENT_OPTIONAL, "blackpepper", 1, base=1, add_price = 1),
		list(CWJ_USE_STOVE, J_LO, 10 SECONDS)
	)

/datum/cooking_with_jane/recipe/benedict
	cooking_container = PAN
	product_type = /obj/item/reagent_containers/snacks/benedict
	step_builder = list(
		list(CWJ_ADD_REAGENT, "sodiumchloride", 1),
		list(CWJ_ADD_REAGENT, "cornoil", 1),
		list(CWJ_ADD_REAGENT, "egg", 3),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/butterslice, qmod=0.5),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/breadslice, qmod=0.5),
		list(CWJ_ADD_REAGENT_OPTIONAL, "honey", 3, base=3, add_price = 6),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/bacon, qmod=0.5),
		list(CWJ_ADD_REAGENT_OPTIONAL, "blackpepper", 1, base=1, add_price = 2),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/boiledegg, qmod=0.5),
		list(CWJ_USE_STOVE, J_LO, 10 SECONDS)
	)

/datum/cooking_with_jane/recipe/omelette
	cooking_container = PAN
	product_type = /obj/item/reagent_containers/snacks/omelette
	step_builder = list(
		list(CWJ_ADD_REAGENT, "cornoil", 2),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/egg, qmod=0.5),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/egg, qmod=0.5),
		list(CWJ_ADD_REAGENT_OPTIONAL, "sodiumchloride", 1, base=1, add_price = 1),
		list(CWJ_ADD_REAGENT_OPTIONAL, "honey", 3, base=3, add_price = 9),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/cheesewedge, qmod=0.5),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/cheesewedge, qmod=0.5),
		list(CWJ_ADD_REAGENT_OPTIONAL, "blackpepper", 1, base=1, add_price = 1),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/butterslice, qmod=0.5),
		list(CWJ_USE_STOVE, J_LO, 10 SECONDS)
	)

/datum/cooking_with_jane/recipe/pancakes
	cooking_container = PAN
	product_type = /obj/item/reagent_containers/snacks/pancakes
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/butterslice, qmod=0.5),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/doughslice, qmod=0.5),
		list(CWJ_ADD_REAGENT, "sugar", 10),
		list(CWJ_ADD_REAGENT_OPTIONAL, "sodiumchloride", 1, base=1, add_price = 1),
		list(CWJ_ADD_REAGENT_OPTIONAL, "honey", 3, base=3, add_price = 9),
		list(CWJ_ADD_REAGENT, "milk", 5),
		list(CWJ_ADD_REAGENT, "flour", 5),
		list(CWJ_USE_STOVE, J_LO, 20 SECONDS)
	)

/datum/cooking_with_jane/recipe/waffles
	cooking_container = OVEN
	product_type = /obj/item/reagent_containers/snacks/waffles
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/butterslice, qmod=0.5),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/doughslice, qmod=0.5),
		list(CWJ_ADD_REAGENT, "sugar", 10),
		list(CWJ_ADD_REAGENT_OPTIONAL, "sodiumchloride", 1, base=1, add_price = 1),
		list(CWJ_ADD_REAGENT_OPTIONAL, "honey", 3, base=3, add_price = 9),
		list(CWJ_ADD_REAGENT, "milk", 5),
		list(CWJ_ADD_REAGENT, "flour", 5),
		list(CWJ_USE_TOOL, QUALITY_CUTTING, 1),
		list(CWJ_USE_OVEN, J_LO, 10 SECONDS)
	)

/datum/cooking_with_jane/recipe/rofflewaffles
	cooking_container = OVEN
	product_type = /obj/item/reagent_containers/snacks/rofflewaffles
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/waffles, qmod=0.5),
		list(CWJ_ADD_REAGENT, "psilocybin", 5),
		CWJ_BEGIN_EXCLUSIVE_OPTIONS,
		list(CWJ_ADD_REAGENT_OPTIONAL, "pwine", 5, base=6, remain_percent=0.1, prod_desc="The fancy wine soaks up into the fluffy waffles.", add_price = 30),
		list(CWJ_ADD_REAGENT_OPTIONAL, "space_drugs", 5, base=6, remain_percent=0.5, prod_desc="The space drugs soak into the waffles.", add_price = 5),
		list(CWJ_ADD_REAGENT_OPTIONAL, "lean", 5, base=6, remain_percent=0.5, prod_desc="Normally not for breakfast.", add_price = 90),
		list(CWJ_ADD_REAGENT_OPTIONAL, "mindbreaker", 5, base=6, remain_percent=0.1, prod_desc="Not for waking up to.", add_price = 45),
		list(CWJ_ADD_REAGENT_OPTIONAL, "psi_juice", 5, base=6, prod_desc="For when you wake up feeling droggy still.", add_price = 150),
		CWJ_END_EXCLUSIVE_OPTIONS,
		list(CWJ_ADD_REAGENT, "sugar", 5),
		list(CWJ_USE_OVEN, J_LO, 10 SECONDS)
	)

/datum/cooking_with_jane/recipe/soylenviridians
	cooking_container = OVEN
	product_type = /obj/item/reagent_containers/snacks/soylenviridians
	step_builder = list(
		list(CWJ_ADD_ITEM_OPTIONAL, /obj/item/reagent_containers/snacks/butterslice, qmod=0.5, add_price = 3),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/meat/human, qmod=0.5),
		list(CWJ_USE_TOOL, QUALITY_CUTTING, 1, add_price = 1),
		list(CWJ_ADD_PRODUCE, "soybeans", qmod=0.4, reagent_skip=TRUE),
		list(CWJ_USE_TOOL, QUALITY_CUTTING, 1, add_price = 1),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/meat/human, qmod=0.5),
		list(CWJ_ADD_REAGENT_OPTIONAL, "sodiumchloride", 1, base=1, add_price = 1),
		list(CWJ_ADD_REAGENT_OPTIONAL, "honey", 3, base=3, add_price = 9),
		list(CWJ_ADD_REAGENT, "flour", 10),
		list(CWJ_USE_TOOL, QUALITY_CUTTING, 1),
		list(CWJ_USE_OVEN, J_LO, 10 SECONDS)
	)

/datum/cooking_with_jane/recipe/soylentgreen
	cooking_container = OVEN
	product_type = /obj/item/reagent_containers/snacks/soylentgreen
	step_builder = list(
		list(CWJ_ADD_ITEM_OPTIONAL, /obj/item/reagent_containers/snacks/butterslice, qmod=0.5, add_price = 3),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/doughslice, qmod=0.5),
		list(CWJ_ADD_PRODUCE, "soybeans", qmod=0.4, reagent_skip=TRUE),
		list(CWJ_ADD_REAGENT_OPTIONAL, "sodiumchloride", 1, base=1, add_price = 1),
		list(CWJ_ADD_REAGENT_OPTIONAL, "honey", 3, base=3, add_price = 9),
		list(CWJ_ADD_REAGENT, "flour", 10),
		list(CWJ_USE_TOOL, QUALITY_CUTTING, 1),
		list(CWJ_USE_OVEN, J_LO, 10 SECONDS)
	)

/datum/cooking_with_jane/recipe/waffles
	cooking_container = OVEN
	product_type = /obj/item/reagent_containers/snacks/waffles
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/butterslice, qmod=0.5),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/doughslice, qmod=0.5),
		list(CWJ_ADD_REAGENT, "sugar", 10),
		list(CWJ_ADD_REAGENT_OPTIONAL, "sodiumchloride", 1, base=1, add_price = 1),
		list(CWJ_ADD_REAGENT_OPTIONAL, "honey", 3, base=3, add_price = 9),
		list(CWJ_ADD_REAGENT, "milk", 5),
		list(CWJ_ADD_REAGENT, "flour", 5),
		list(CWJ_USE_TOOL, QUALITY_CUTTING, 1),
		list(CWJ_USE_OVEN, J_LO, 10 SECONDS)
	)

//I think this is meant to be raw?
/datum/cooking_with_jane/recipe/cubancarp
	cooking_container = CUTTING_BOARD
	product_type = /obj/item/reagent_containers/snacks/cubancarp
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/doughslice, qmod=0.5),
		list(CWJ_ADD_PRODUCE, "chili", qmod=0.4, reagent_skip=TRUE),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/meat/carp, qmod=0.5),
		list(CWJ_ADD_REAGENT_OPTIONAL, "sodiumchloride", 1, base=1, add_price = 1),
		list(CWJ_ADD_REAGENT_OPTIONAL, "flour", 1, base=1, add_price = 1),
		list(CWJ_USE_TOOL, QUALITY_CUTTING, 1)
	)


//pasta

/datum/cooking_with_jane/recipe/raw_speggie
	cooking_container = CUTTING_BOARD
	product_type = /obj/item/reagent_containers/snacks/spagetti
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/doughslice, qmod=0.5),
		list(CWJ_ADD_REAGENT_OPTIONAL, "flour", 1, base=1, add_price = 1),
		list(CWJ_USE_TOOL, QUALITY_CUTTING, 1)
	)

/datum/cooking_with_jane/recipe/boiledspagetti
	cooking_container = POT
	product_type = /obj/item/reagent_containers/snacks/boiledspagetti
	step_builder = list(
		list(CWJ_ADD_REAGENT, "water", 10),
		list(CWJ_ADD_REAGENT_OPTIONAL, "sodiumchloride", 1, base=1, add_price = 1),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/spagetti, qmod=0.5),
		list(CWJ_USE_STOVE, J_MED, 30 SECONDS)
	)

/datum/cooking_with_jane/recipe/pastatomato
	cooking_container = PAN
	product_type = /obj/item/reagent_containers/snacks/pastatomato
	step_builder = list(
		list(CWJ_ADD_REAGENT, "water", 10),
		list(CWJ_ADD_REAGENT_OPTIONAL, "sodiumchloride", 1, base=1, add_price = 1),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/boiledspagetti, qmod=0.5),
		list(CWJ_ADD_PRODUCE, "tomato", qmod=0.4, reagent_skip=TRUE),
		list(CWJ_ADD_PRODUCE, "tomato", qmod=0.4, reagent_skip=TRUE),
		list(CWJ_USE_STOVE, J_LO, 10 SECONDS)
	)

/datum/cooking_with_jane/recipe/meatballspagetti
	cooking_container = PAN
	product_type = /obj/item/reagent_containers/snacks/meatballspagetti
	step_builder = list(
		list(CWJ_ADD_REAGENT, "water", 10),
		list(CWJ_ADD_REAGENT_OPTIONAL, "sodiumchloride", 1, base=1, add_price = 1),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/boiledspagetti, qmod=0.5),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/meatball, qmod=0.5, exclude_reagents=list("blattedin")),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/meatball, qmod=0.5, exclude_reagents=list("blattedin")),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "tomato", qmod=0.4, reagent_skip=TRUE, add_price = 2),
		list(CWJ_USE_STOVE, J_LO, 10 SECONDS)
	)

/datum/cooking_with_jane/recipe/spesslaw
	cooking_container = PAN
	product_type = /obj/item/reagent_containers/snacks/spesslaw
	step_builder = list(
		list(CWJ_ADD_REAGENT, "water", 10),
		list(CWJ_ADD_REAGENT_OPTIONAL, "sodiumchloride", 1, base=1, add_price = 1),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/boiledspagetti, qmod=0.5),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/meatball, qmod=0.5, exclude_reagents=list("blattedin")),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/meatball, qmod=0.5, exclude_reagents=list("blattedin")),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/meatball, qmod=0.5, exclude_reagents=list("blattedin")),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/meatball, qmod=0.5, exclude_reagents=list("blattedin")),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "tomato", qmod=0.4, reagent_skip=TRUE, add_price = 2),
		list(CWJ_USE_STOVE, J_LO, 10 SECONDS)
	)

// Soups

/datum/cooking_with_jane/recipe/tomatosoup
	cooking_container = POT
	product_type = /obj/item/reagent_containers/snacks/tomatosoup
	step_builder = list(
		list(CWJ_ADD_REAGENT, "water", 10),
		list(CWJ_ADD_REAGENT_OPTIONAL, "sodiumchloride", 1, base=1, add_price = 1),
		list(CWJ_ADD_PRODUCE, "tomato", reagent_skip=TRUE),
		list(CWJ_ADD_PRODUCE, "tomato", reagent_skip=TRUE),
		CWJ_BEGIN_EXCLUSIVE_OPTIONS,
		list(CWJ_ADD_REAGENT_OPTIONAL, "cream", 5, base=3, prod_desc="The soup turns a lighter red and thickens with the cream.", add_price = 5),
		list(CWJ_ADD_REAGENT_OPTIONAL, "honey", 5 ,base=5, prod_desc="The thickens as the honey mixes in.", add_price = 20),
		CWJ_END_EXCLUSIVE_OPTIONS,
		list(CWJ_USE_STOVE, J_LO, 30 SECONDS)
	)

/datum/cooking_with_jane/recipe/meatballsoup
	cooking_container = POT
	product_type = /obj/item/reagent_containers/snacks/meatballsoup
	step_builder = list(
		list(CWJ_ADD_REAGENT, "water", 10),
		list(CWJ_ADD_REAGENT_OPTIONAL, "sodiumchloride", 1, base=1, add_price = 1),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/meatball, qmod=0.5),
		list(CWJ_ADD_PRODUCE, "carrot", reagent_skip=TRUE),
		list(CWJ_ADD_PRODUCE, "potato", reagent_skip=TRUE),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "tomato", reagent_skip=TRUE, add_price = 3),
		list(CWJ_USE_STOVE, J_LO, 30 SECONDS)
	)

/datum/cooking_with_jane/recipe/vegetablesoup
	cooking_container = POT
	product_type = /obj/item/reagent_containers/snacks/vegetablesoup
	step_builder = list(
		list(CWJ_ADD_REAGENT, "water", 10),
		list(CWJ_ADD_REAGENT_OPTIONAL, "sodiumchloride", 1, base=1, add_price = 1),
		list(CWJ_ADD_PRODUCE, "carrot", reagent_skip=TRUE),
		list(CWJ_ADD_PRODUCE, "potato", reagent_skip=TRUE),
		list(CWJ_ADD_PRODUCE, "eggplant", reagent_skip=TRUE),
		list(CWJ_ADD_PRODUCE, "cabbage", reagent_skip=TRUE),
		list(CWJ_USE_STOVE, J_LO, 30 SECONDS)
	)

/datum/cooking_with_jane/recipe/nettlesoup
	cooking_container = POT
	product_type = /obj/item/reagent_containers/snacks/nettlesoup
	step_builder = list(
		list(CWJ_ADD_REAGENT, "water", 10),
		list(CWJ_ADD_REAGENT_OPTIONAL, "sodiumchloride", 1, base=1, add_price = 1),
		list(CWJ_ADD_PRODUCE, "potato", reagent_skip=TRUE),
		list(CWJ_ADD_PRODUCE, "nettle", reagent_skip=TRUE),
		list(CWJ_USE_STOVE, J_LO, 30 SECONDS)
	)

/datum/cooking_with_jane/recipe/wishsoup
	cooking_container = POT
	product_type = /obj/item/reagent_containers/snacks/wishsoup
	step_builder = list(
		list(CWJ_ADD_REAGENT, "water", 40),
		list(CWJ_ADD_REAGENT_OPTIONAL, "sodiumchloride", 1, base=1, add_price = 1),
		list(CWJ_USE_STOVE, J_LO, 10 SECONDS)
	)

/datum/cooking_with_jane/recipe/hotchili
	cooking_container = POT
	product_type = /obj/item/reagent_containers/snacks/hotchili
	step_builder = list(
		list(CWJ_ADD_REAGENT, "water", 10),
		list(CWJ_ADD_REAGENT_OPTIONAL, "sodiumchloride", 1, base=1, add_price = 1),
		list(CWJ_ADD_PRODUCE, "chili", reagent_skip=TRUE),
		list(CWJ_ADD_PRODUCE, "tomato", reagent_skip=TRUE),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/meat, qmod=0.5, exclude_reagents=list("carpotoxin", "blattedin")),
		list(CWJ_USE_STOVE, J_LO, 30 SECONDS)
	)

/datum/cooking_with_jane/recipe/hotchili
	cooking_container = POT
	product_type = /obj/item/reagent_containers/snacks/coldchili
	step_builder = list(
		list(CWJ_ADD_REAGENT, "water", 10),
		list(CWJ_ADD_REAGENT_OPTIONAL, "sodiumchloride", 1, base=1, add_price = 1),
		list(CWJ_ADD_PRODUCE, "icechili", reagent_skip=TRUE),
		list(CWJ_ADD_PRODUCE, "tomato", reagent_skip=TRUE),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/meat, qmod=0.5, exclude_reagents=list("carpotoxin", "blattedin")),
		list(CWJ_USE_STOVE, J_LO, 30 SECONDS)
	)

/datum/cooking_with_jane/recipe/bearchili
	cooking_container = POT
	product_type = /obj/item/reagent_containers/snacks/bearchili
	step_builder = list(
		list(CWJ_ADD_REAGENT, "water", 10),
		list(CWJ_ADD_REAGENT_OPTIONAL, "sodiumchloride", 1, base=1, add_price = 1),
		list(CWJ_ADD_PRODUCE, "chili", reagent_skip=TRUE),
		list(CWJ_ADD_PRODUCE, "tomato", reagent_skip=TRUE),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/meat/bearmeat, qmod=0.5, exclude_reagents=list("carpotoxin", "blattedin")),
		list(CWJ_USE_STOVE, J_LO, 30 SECONDS)
	)

/datum/cooking_with_jane/recipe/stew
	cooking_container = POT
	product_type = /obj/item/reagent_containers/snacks/stew
	step_builder = list(
		list(CWJ_ADD_REAGENT, "water", 10),
		list(CWJ_ADD_REAGENT_OPTIONAL, "sodiumchloride", 1, base=1, add_price = 1),
		list(CWJ_ADD_PRODUCE, "carrot", reagent_skip=TRUE),
		list(CWJ_ADD_PRODUCE, "potato", reagent_skip=TRUE),
		list(CWJ_ADD_PRODUCE, "chanterelle", reagent_skip=TRUE),
		list(CWJ_ADD_PRODUCE, "tomato", reagent_skip=TRUE),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/meat, qmod=0.5, exclude_reagents=list("carpotoxin", "blattedin")),
		list(CWJ_USE_STOVE, J_MED, 20 SECONDS)
	)

/datum/cooking_with_jane/recipe/milosoup
	cooking_container = POT
	product_type = /obj/item/reagent_containers/snacks/milosoup
	step_builder = list(
		list(CWJ_ADD_REAGENT, "water", 10),
		list(CWJ_ADD_REAGENT_OPTIONAL, "sodiumchloride", 1, base=1, add_price = 1),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/soydope, qmod=0.5, exclude_reagents=list("carpotoxin", "blattedin")),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/soydope, qmod=0.5, exclude_reagents=list("carpotoxin", "blattedin")),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/tofu, qmod=0.5, exclude_reagents=list("carpotoxin", "blattedin")),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/tofu, qmod=0.5, exclude_reagents=list("carpotoxin", "blattedin")),
		list(CWJ_USE_STOVE, J_MED, 20 SECONDS)
	)

/datum/cooking_with_jane/recipe/beetsoup
	cooking_container = POT
	product_type = /obj/item/reagent_containers/snacks/beetsoup
	step_builder = list(
		list(CWJ_ADD_REAGENT, "water", 10),
		list(CWJ_ADD_REAGENT_OPTIONAL, "sodiumchloride", 1, base=1, add_price = 1),
		list(CWJ_ADD_PRODUCE, "whitebeet", reagent_skip=TRUE),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "potato", reagent_skip=TRUE, add_price = 3),
		list(CWJ_ADD_PRODUCE, "cabbage", reagent_skip=TRUE),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "tomato", reagent_skip=TRUE, add_price = 2),
		list(CWJ_ADD_REAGENT_OPTIONAL, "cream", 5, base=1, add_price = 3),
		list(CWJ_ADD_REAGENT_OPTIONAL, "blackpepper", 1, base=1, add_price = 2),
		list(CWJ_USE_STOVE, J_MED, 20 SECONDS)
	)

/datum/cooking_with_jane/recipe/mushroomsoup
	cooking_container = POT
	product_type = /obj/item/reagent_containers/snacks/mushroomsoup
	step_builder = list(
		list(CWJ_ADD_REAGENT, "water", 10),
		list(CWJ_ADD_REAGENT_OPTIONAL, "sodiumchloride", 1, base=1, add_price = 1),
		list(CWJ_ADD_REAGENT, "cream", 5),
		list(CWJ_ADD_REAGENT, "milk", 5),
		list(CWJ_ADD_REAGENT, "sodiumchloride", 1),
		list(CWJ_ADD_REAGENT, "blackpepper", 1),
		list(CWJ_ADD_PRODUCE, "chanterelle", qmod=0.2, reagent_skip=TRUE),
		list(CWJ_USE_STOVE, J_LO, 10 SECONDS),
		CWJ_BEGIN_EXCLUSIVE_OPTIONS,
		list(CWJ_ADD_PRODUCE_OPTIONAL, "reishi", qmod=0.4, reagent_skip=TRUE, add_price = 2),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "amanita", qmod=0.4, reagent_skip=TRUE, add_price = 3),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "plumphelmet", qmod=0.4, reagent_skip=TRUE, add_price = 4),
		CWJ_END_EXCLUSIVE_OPTIONS,
		list(CWJ_USE_STOVE, J_MED, 20 SECONDS)
	)

/datum/cooking_with_jane/recipe/mysterysoup
	cooking_container = POT
	product_type = /obj/item/reagent_containers/snacks/mysterysoup
	step_builder = list(
		list(CWJ_ADD_REAGENT, "water", 10),
		list(CWJ_ADD_REAGENT_OPTIONAL, "sodiumchloride", 1, base=1, add_price = 1),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/badrecipe, qmod=0.5),
		list(CWJ_USE_STOVE, J_LO, 10 SECONDS),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/tofu, qmod=0.5),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/egg, qmod=0.5),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/cheesewedge, qmod=0.5),
		list(CWJ_USE_STOVE, J_MED, 20 SECONDS)
	)

/datum/cooking_with_jane/recipe/bloodsoup
	cooking_container = POT
	product_type = /obj/item/reagent_containers/snacks/bloodsoup
	step_builder = list(
		list(CWJ_ADD_REAGENT, "blood", 30),
		list(CWJ_ADD_REAGENT_OPTIONAL, "sodiumchloride", 1, base=1, add_price = 1),
		list(CWJ_USE_STOVE, J_MED, 20 SECONDS)
	)

/datum/cooking_with_jane/recipe/slimesoup
	cooking_container = POT
	product_type = /obj/item/reagent_containers/snacks/slimesoup
	step_builder = list(
		list(CWJ_ADD_REAGENT, "water", 10),
		list(CWJ_ADD_REAGENT, "slimejelly", 5),
		list(CWJ_ADD_REAGENT_OPTIONAL, "sodiumchloride", 1, base=1, add_price = 1),
		list(CWJ_USE_STOVE, J_MED, 20 SECONDS)
	)

/datum/cooking_with_jane/recipe/spacylibertyduff
	cooking_container = POT
	product_type = /obj/item/reagent_containers/snacks/spacylibertyduff
	step_builder = list(
		list(CWJ_ADD_REAGENT, "water", 10),
		list(CWJ_ADD_REAGENT, "vodka", 5),
		list(CWJ_ADD_REAGENT, "psilocybin", 5),
		list(CWJ_ADD_REAGENT_OPTIONAL, "honey", 1, base=1, add_price = 5),
		list(CWJ_USE_STOVE, J_MED, 20 SECONDS)
	)

/datum/cooking_with_jane/recipe/amanitajelly
	cooking_container = POT
	product_type = /obj/item/reagent_containers/snacks/amanitajelly
	step_builder = list(
		list(CWJ_ADD_REAGENT, "water", 10),
		list(CWJ_ADD_REAGENT, "vodka", 5),
		list(CWJ_ADD_REAGENT, "amatoxin", 5),
		list(CWJ_ADD_REAGENT_OPTIONAL, "honey", 1, base=1, add_price = 5),
		list(CWJ_USE_STOVE, J_MED, 20 SECONDS)
	)

/datum/cooking_with_jane/recipe/chocolateegg
	cooking_container = POT
	product_type = /obj/item/reagent_containers/snacks/chocolateegg
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/egg, qmod=0.5),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/chocolatebar, qmod=0.5),
		list(CWJ_ADD_REAGENT_OPTIONAL, "sugar", 5, add_price = 3),
		list(CWJ_USE_STOVE, J_LO, 20 SECONDS)
	)

/datum/cooking_with_jane/recipe/candiedapple
	cooking_container = PAN
	product_type = /obj/item/reagent_containers/snacks/candiedapple
	step_builder = list(
		list(CWJ_ADD_PRODUCE, "apple", qmod=0.2, reagent_skip=TRUE),
		list(CWJ_ADD_REAGENT, "water", 5),
		list(CWJ_ADD_REAGENT, "sugar", 5),
		list(CWJ_ADD_REAGENT_OPTIONAL, "cornoil", 1, base=1, add_price = 3),
		list(CWJ_USE_STOVE, J_LO, 10 SECONDS)
	)

//Ingreds

/datum/cooking_with_jane/recipe/chocolatebar
	cooking_container = POT
	product_type = /obj/item/reagent_containers/snacks/chocolatebar
	step_builder = list(
		list(CWJ_ADD_REAGENT, "water", 5),
		list(CWJ_ADD_REAGENT, "milk", 5),
		list(CWJ_ADD_REAGENT, "sugar", 15),
		list(CWJ_ADD_REAGENT, "coco", 10),
		list(CWJ_ADD_REAGENT, "sodiumchloride", 1),
		list(CWJ_USE_STOVE, J_LO, 30 SECONDS)
	)

/datum/cooking_with_jane/recipe/cooked_cutlet
	cooking_container = GRILL
	product_type = /obj/item/reagent_containers/snacks/cutlet
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/rawcutlet, qmod=0.5),
		list(CWJ_ADD_REAGENT_OPTIONAL, "cornoil", 1, base=1, add_price = 5),
		list(CWJ_ADD_REAGENT_OPTIONAL, "sodiumchloride", 1, base=1, add_price = 2),
		list(CWJ_USE_GRILL, J_LO, 20 SECONDS)
	)

/datum/cooking_with_jane/recipe/raw_meatball
	cooking_container = BOWL
	product_type = /obj/item/reagent_containers/snacks/rawmeatball
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/rawcutlet),
		list(CWJ_ADD_REAGENT_OPTIONAL, "sodiumchloride", 1, base=1, add_price = 1),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/breadslice),
	)

/datum/cooking_with_jane/recipe/cooked_meatball
	cooking_container = PAN
	product_type = /obj/item/reagent_containers/snacks/meatball
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/rawmeatball, qmod=0.5),
		list(CWJ_ADD_REAGENT, "cornoil", 1),
		list(CWJ_ADD_REAGENT_OPTIONAL, "sodiumchloride", 1, base=1, add_price = 1),
		list(CWJ_USE_STOVE, J_LO, 20 SECONDS)
	)

/datum/cooking_with_jane/recipe/cooked_patty
	cooking_container = GRILL
	product_type = /obj/item/reagent_containers/snacks/patty
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/patty_raw, qmod=0.5),
		list(CWJ_ADD_REAGENT_OPTIONAL, "cornoil", 1, base=1, add_price = 2),
		list(CWJ_ADD_REAGENT_OPTIONAL, "sodiumchloride", 1, base=1, add_price = 2),
		list(CWJ_USE_GRILL, J_LO, 10 SECONDS)
	)

// Cakes.

/datum/cooking_with_jane/recipe/plaincake
	cooking_container = OVEN
	product_type = /obj/item/reagent_containers/snacks/plaincake
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/butterstick),
		list(CWJ_ADD_REAGENT, "sugar", 15),
		list(CWJ_ADD_REAGENT, "flour", 15),
		list(CWJ_ADD_REAGENT, "milk", 5),
		list(CWJ_ADD_REAGENT, "egg", 9),
		list(CWJ_USE_OVEN, J_MED, 30 SECONDS)
	)

/datum/cooking_with_jane/recipe/carrotcake
	cooking_container = OVEN
	product_type = /obj/item/reagent_containers/snacks/carrotcake
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/butterstick),
		list(CWJ_ADD_REAGENT, "sugar", 15),
		list(CWJ_ADD_REAGENT, "flour", 15),
		list(CWJ_ADD_REAGENT, "milk", 5),
		list(CWJ_ADD_REAGENT, "egg", 9),
		list(CWJ_ADD_PRODUCE, "carrot"),
		list(CWJ_USE_OVEN, J_MED, 30 SECONDS)
	)

/datum/cooking_with_jane/recipe/cheesecake
	cooking_container = OVEN
	product_type = /obj/item/reagent_containers/snacks/cheesecake
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/butterstick),
		list(CWJ_ADD_REAGENT, "sugar", 15),
		list(CWJ_ADD_REAGENT, "flour", 15),
		list(CWJ_ADD_REAGENT, "milk", 5),
		list(CWJ_ADD_REAGENT, "egg", 9),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/cheesewedge, reagent_skip=TRUE),
		list(CWJ_USE_OVEN, J_MED, 30 SECONDS)
	)

/datum/cooking_with_jane/recipe/orangecake
	cooking_container = OVEN
	product_type = /obj/item/reagent_containers/snacks/orangecake
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/butterstick),
		list(CWJ_ADD_REAGENT, "sugar", 15),
		list(CWJ_ADD_REAGENT, "flour", 15),
		list(CWJ_ADD_REAGENT, "milk", 5),
		list(CWJ_ADD_REAGENT, "egg", 9),
		list(CWJ_ADD_PRODUCE, "orange", reagent_skip=TRUE),
		list(CWJ_USE_OVEN, J_MED, 30 SECONDS)
	)

/datum/cooking_with_jane/recipe/limecake
	cooking_container = OVEN
	product_type = /obj/item/reagent_containers/snacks/limecake
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/butterstick),
		list(CWJ_ADD_REAGENT, "sugar", 15),
		list(CWJ_ADD_REAGENT, "flour", 15),
		list(CWJ_ADD_REAGENT, "milk", 5),
		list(CWJ_ADD_REAGENT, "egg", 9),
		list(CWJ_ADD_PRODUCE, "lime", reagent_skip=TRUE),
		list(CWJ_USE_OVEN, J_MED, 30 SECONDS)
	)

/datum/cooking_with_jane/recipe/lemoncake
	cooking_container = OVEN
	product_type = /obj/item/reagent_containers/snacks/lemoncake
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/butterstick),
		list(CWJ_ADD_REAGENT, "sugar", 15),
		list(CWJ_ADD_REAGENT, "flour", 15),
		list(CWJ_ADD_REAGENT, "milk", 5),
		list(CWJ_ADD_REAGENT, "egg", 9),
		list(CWJ_ADD_PRODUCE, "lemon"),
		list(CWJ_USE_OVEN, J_MED, 30 SECONDS)
	)

/datum/cooking_with_jane/recipe/chocolatecake
	cooking_container = OVEN
	product_type = /obj/item/reagent_containers/snacks/chocolatecake
	step_builder = list(
		list(CWJ_ADD_REAGENT, "sugar", 15),
		list(CWJ_ADD_REAGENT, "flour", 15),
		list(CWJ_ADD_REAGENT, "milk", 5),
		list(CWJ_ADD_REAGENT, "egg", 9),
		list(CWJ_ADD_REAGENT, "coco", 5),
		list(CWJ_USE_OVEN, J_MED, 30 SECONDS)
	)

/datum/cooking_with_jane/recipe/applecake
	cooking_container = OVEN
	product_type = /obj/item/reagent_containers/snacks/applecake
	step_builder = list(
		list(CWJ_ADD_REAGENT, "sugar", 15),
		list(CWJ_ADD_REAGENT, "flour", 15),
		list(CWJ_ADD_REAGENT, "milk", 5),
		list(CWJ_ADD_REAGENT, "egg", 9),
		list(CWJ_ADD_PRODUCE, "apple"),
		list(CWJ_USE_OVEN, J_MED, 30 SECONDS)
	)

/datum/cooking_with_jane/recipe/brownies
	cooking_container = OVEN
	product_type = /obj/item/reagent_containers/snacks/brownie
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/butterstick),
		list(CWJ_ADD_REAGENT, "sugar", 15),
		list(CWJ_ADD_REAGENT, "coco", 10),
		list(CWJ_ADD_REAGENT, "milk", 5),
		list(CWJ_ADD_REAGENT, "egg", 9),
		list(CWJ_ADD_REAGENT, "cornoil", 3),
		list(CWJ_USE_OVEN, J_MED, 30 SECONDS)
	)

/datum/cooking_with_jane/recipe/birthdaycake
	cooking_container = OVEN
	product_type = /obj/item/reagent_containers/snacks/birthdaycake
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/plaincake),
		list(CWJ_ADD_ITEM, /obj/item/clothing/head/costume/misc/cake),
		list(CWJ_USE_OVEN, J_MED, 30 SECONDS)
	)

/datum/cooking_with_jane/recipe/braincake
	cooking_container = OVEN
	product_type = /obj/item/reagent_containers/snacks/braincake
	step_builder = list(
		list(CWJ_ADD_REAGENT, "sugar", 15),
		list(CWJ_ADD_REAGENT, "flour", 15),
		list(CWJ_ADD_REAGENT, "milk", 5),
		list(CWJ_ADD_REAGENT, "egg", 9),
		list(CWJ_ADD_ITEM, /obj/item/organ/internal/vital/brain),
		list(CWJ_USE_OVEN, J_MED, 30 SECONDS)
	)

//salad

/datum/cooking_with_jane/recipe/tossedsalad
	cooking_container = BOWL
	product_type = /obj/item/reagent_containers/snacks/tossedsalad
	step_builder = list(
		list(CWJ_ADD_PRODUCE, "cabbage", qmod=0.2, reagent_skip=TRUE),
		list(CWJ_ADD_PRODUCE, "cabbage", qmod=0.2, reagent_skip=TRUE),
		list(CWJ_ADD_PRODUCE, "carrot", qmod=0.2, reagent_skip=TRUE),
		list(CWJ_ADD_PRODUCE, "apple", qmod=0.2, reagent_skip=TRUE),
		list(CWJ_ADD_REAGENT_OPTIONAL, "sodiumchloride", 1, base=1, add_price = 1),
		list(CWJ_ADD_REAGENT_OPTIONAL, "cornoil", 1, base=1, add_price = 1),
		list(CWJ_ADD_REAGENT_OPTIONAL, "blackpepper", 1, add_price = 1),
		list(CWJ_ADD_ITEM_OPTIONAL, /obj/item/reagent_containers/snacks/stuffing, base=10, reagent_skip=TRUE, add_price = 5),
		list(CWJ_ADD_PRODUCE, "tomato", qmod=0.2, reagent_skip=TRUE)
	)

/datum/cooking_with_jane/recipe/aesirsalad
	cooking_container = BOWL
	product_type = /obj/item/reagent_containers/snacks/aesirsalad
	step_builder = list(
		list(CWJ_ADD_PRODUCE, "ambrosiadeus", qmod=0.2, reagent_skip=TRUE),
		list(CWJ_ADD_REAGENT_OPTIONAL, "sodiumchloride", 1, base=1, add_price = 1),
		list(CWJ_ADD_REAGENT_OPTIONAL, "cornoil", 1, base=1, add_price = 1),
		list(CWJ_ADD_REAGENT_OPTIONAL, "blackpepper", 1, add_price = 1),
		list(CWJ_ADD_ITEM_OPTIONAL, /obj/item/reagent_containers/snacks/stuffing, base=10, reagent_skip=TRUE, add_price = 5),
		list(CWJ_ADD_PRODUCE, "goldapple", qmod=0.2, reagent_skip=TRUE)
	)

/datum/cooking_with_jane/recipe/validsalad
	cooking_container = BOWL
	product_type = /obj/item/reagent_containers/snacks/validsalad
	step_builder = list(
		list(CWJ_ADD_PRODUCE, "ambrosia", qmod=0.2, reagent_skip=TRUE),
		list(CWJ_ADD_PRODUCE, "ambrosia", qmod=0.2, reagent_skip=TRUE),
		list(CWJ_ADD_PRODUCE, "ambrosia", qmod=0.2, reagent_skip=TRUE),
		list(CWJ_ADD_REAGENT_OPTIONAL, "sodiumchloride", 1, base=1, add_price = 1),
		list(CWJ_ADD_REAGENT_OPTIONAL, "cornoil", 1, base=1, add_price = 1),
		list(CWJ_ADD_REAGENT_OPTIONAL, "blackpepper", 1, add_price = 1),
		list(CWJ_ADD_ITEM_OPTIONAL, /obj/item/reagent_containers/snacks/stuffing, base=5, reagent_skip=TRUE, add_price = 51),
		list(CWJ_ADD_PRODUCE, "potato", qmod=0.2, reagent_skip=TRUE),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/meatball, qmod=0.5)
	)

// not salad misc idk were to put this stuff

/datum/cooking_with_jane/recipe/stuffing
	cooking_container = BOWL
	product_type = /obj/item/reagent_containers/snacks/stuffing
	product_count = 3
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/bread, qmod=0.5),
		list(CWJ_ADD_REAGENT, "sodiumchloride", 1),
		list(CWJ_ADD_REAGENT_OPTIONAL, "cornoil", 1, base=1, add_price = 2),
		list(CWJ_ADD_REAGENT, "blackpepper", 1),
		list(CWJ_ADD_REAGENT, "water", 5)
	)

/datum/cooking_with_jane/recipe/monkeysdelight
	cooking_container = CUTTING_BOARD
	product_type = /obj/item/reagent_containers/snacks/monkeysdelight
	product_count = 1
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/monkeycube),
		list(CWJ_ADD_REAGENT, "sodiumchloride", 1),
		list(CWJ_ADD_REAGENT_OPTIONAL, "cornoil", 1, base=1, add_price = 2),
		list(CWJ_ADD_REAGENT, "blackpepper", 1),
		list(CWJ_ADD_REAGENT, "flour", 10),
		list(CWJ_ADD_PRODUCE, "banana", qmod=0.2, reagent_skip=TRUE)
	)

/datum/cooking_with_jane/recipe/fishandchips
	cooking_container = CUTTING_BOARD
	product_type = /obj/item/reagent_containers/snacks/fishandchips
	product_count = 1
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/fries),
		CWJ_BEGIN_EXCLUSIVE_OPTIONS,
		list(CWJ_ADD_REAGENT_OPTIONAL, "sodiumchloride", 1, base=1, add_price = 1),
		list(CWJ_ADD_REAGENT_OPTIONAL, "cornoil", 1, base=1, add_price = 2),
		list(CWJ_ADD_REAGENT_OPTIONAL, "blackpepper", 1, base=1, add_price = 1),
		list(CWJ_ADD_REAGENT_OPTIONAL, "vinegar", 1, base=1, add_price = 4),
		list(CWJ_ADD_REAGENT_OPTIONAL, "ketchup", 1, base=1, add_price = 6),
		CWJ_END_EXCLUSIVE_OPTIONS,
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/fishfingers)
	)

/datum/cooking_with_jane/recipe/dumplings
	cooking_container = PAN
	product_type = /obj/item/reagent_containers/snacks/dumplings
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/doughslice),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/rawbacon),
		list(CWJ_ADD_PRODUCE, "cabbage"),
		list(CWJ_ADD_REAGENT, "blackpepper", 1),
		list(CWJ_ADD_REAGENT, "sodiumchloride", 1),
		list(CWJ_ADD_REAGENT, "cornoil", 1),
		list(CWJ_ADD_REAGENT, "soysauce", 5),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/rawbacon),
		list(CWJ_USE_OVEN, J_LO, 30 SECONDS)
	)

/datum/cooking_with_jane/recipe/fishfingers
	cooking_container = PAN
	product_type = /obj/item/reagent_containers/snacks/fishfingers
	step_builder = list(
		list(CWJ_ADD_REAGENT, "cornoil", 2),
		list(CWJ_ADD_REAGENT, "egg", 3),
		list(CWJ_ADD_REAGENT, "flour", 5),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/meat/carp),
		list(CWJ_USE_OVEN, J_LO, 30 SECONDS)
	)

/datum/cooking_with_jane/recipe/sausage
	cooking_container = CUTTING_BOARD
	product_type = /obj/item/reagent_containers/snacks/sausage
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/rawmeatball),
		list(CWJ_ADD_REAGENT, "sodiumchloride", 1),
		list(CWJ_ADD_REAGENT, "blackpepper", 1),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/rawbacon)
	)

/datum/cooking_with_jane/recipe/tofurkey
	cooking_container = CUTTING_BOARD
	product_type = /obj/item/reagent_containers/snacks/tofurkey
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/tofu),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/tofu),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/stuffing)
	)

/datum/cooking_with_jane/recipe/donkpocket
	cooking_container = CUTTING_BOARD
	product_type = /obj/item/reagent_containers/snacks/donkpocket
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/dough),
		list(CWJ_ADD_ITEM_OPTIONAL, /obj/item/reagent_containers/snacks/butterslice, qmod=0.5, min=5, add_price = 5),
		list(CWJ_ADD_ITEM_OPTIONAL, /obj/item/reagent_containers/snacks/cheesewedge, qmod=0.5, min=5, add_price = 5),
		list(CWJ_ADD_REAGENT_OPTIONAL, "sodiumchloride", 1, add_price = 1),
		list(CWJ_ADD_REAGENT_OPTIONAL, "blackpepper", 1, add_price = 1),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/meatball),
	)

/datum/cooking_with_jane/recipe/honeybuns
	cooking_container = OVEN
	product_type = /obj/item/reagent_containers/snacks/honeybuns
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/dough),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/butterslice),
		list(CWJ_ADD_REAGENT_OPTIONAL, "woodpulp", 1, base=1, add_price = 1),
		list(CWJ_ADD_REAGENT, "sugar", 3),
		list(CWJ_ADD_REAGENT, "honey", 5),
		list(CWJ_ADD_REAGENT, "cream", 5),
		list(CWJ_USE_OVEN, J_LO, 50 SECONDS)
	)

/datum/cooking_with_jane/recipe/honeypudding
	cooking_container = BOWL
	product_type = /obj/item/reagent_containers/snacks/honeypudding
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/chocolatebar),
		list(CWJ_ADD_REAGENT, "sugar", 3),
		list(CWJ_ADD_REAGENT, "honey", 5),
		list(CWJ_ADD_REAGENT, "cream", 5)
	)

/datum/cooking_with_jane/recipe/enchiladas
	cooking_container = CUTTING_BOARD
	product_type = /obj/item/reagent_containers/snacks/enchiladas
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/cutlet),
		list(CWJ_ADD_PRODUCE, "corn"),
		list(CWJ_ADD_PRODUCE, "chili"),
		list(CWJ_ADD_PRODUCE, "chili")
	)

/datum/cooking_with_jane/recipe/monkeykabob
	cooking_container = GRILL
	product_type = /obj/item/reagent_containers/snacks/monkeykabob
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/stack/rods),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/meat),
		list(CWJ_ADD_REAGENT_OPTIONAL, "sodiumchloride", 1, base=1, add_price = 5),
		list(CWJ_ADD_REAGENT_OPTIONAL, "blackpepper", 1, base=1, add_price = 5),
		CWJ_BEGIN_EXCLUSIVE_OPTIONS,
		list(CWJ_ADD_REAGENT_OPTIONAL, "ketchup", 1, add_price = 4),
		list(CWJ_ADD_REAGENT_OPTIONAL, "bbqsauce", 1, add_price = 5),
		list(CWJ_ADD_REAGENT_OPTIONAL, "honey", 1, add_price = 2),
		CWJ_END_EXCLUSIVE_OPTIONS,
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/meat),
		list(CWJ_USE_GRILL, J_LO, 10 SECONDS)
	)

/datum/cooking_with_jane/recipe/tofukabob
	cooking_container = GRILL
	product_type = /obj/item/reagent_containers/snacks/tofukabob
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/stack/rods),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/tofu),
		list(CWJ_ADD_REAGENT_OPTIONAL, "sodiumchloride", 1, base=1, add_price = 5),
		list(CWJ_ADD_REAGENT_OPTIONAL, "blackpepper", 1, base=1, add_price = 5),
		CWJ_BEGIN_EXCLUSIVE_OPTIONS,
		list(CWJ_ADD_REAGENT_OPTIONAL, "ketchup", 1, add_price = 4),
		list(CWJ_ADD_REAGENT_OPTIONAL, "honey", 1, add_price = 2),
		CWJ_END_EXCLUSIVE_OPTIONS,
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/tofu),
		list(CWJ_USE_GRILL, J_LO, 10 SECONDS)
	)

/datum/cooking_with_jane/recipe/human_kabob
	cooking_container = GRILL
	product_type = /obj/item/reagent_containers/snacks/human/kabob
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/stack/rods),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/meat/human),
		list(CWJ_ADD_REAGENT_OPTIONAL, "sodiumchloride", 1, base=1, add_price = 5),
		list(CWJ_ADD_REAGENT_OPTIONAL, "blackpepper", 1, base=1, add_price = 5),
		CWJ_BEGIN_EXCLUSIVE_OPTIONS,
		list(CWJ_ADD_REAGENT_OPTIONAL, "ketchup", 1, add_price = 4),
		list(CWJ_ADD_REAGENT_OPTIONAL, "honey", 1, add_price = 2),
		CWJ_END_EXCLUSIVE_OPTIONS,
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/meat/human),
		list(CWJ_USE_GRILL, J_LO, 10 SECONDS)
	)

//Pies

/datum/cooking_with_jane/recipe/meatpie
	cooking_container = OVEN
	product_type = /obj/item/reagent_containers/snacks/meatpie
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/flatdough, qmod=0.5),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/meat, qmod=0.5, exclude_reagents=list("carpotoxin", "blattedin")),
		list(CWJ_ADD_REAGENT_OPTIONAL, "woodpulp", 1, base=1, add_price = 5),
		list(CWJ_USE_OVEN, J_MED, 30 SECONDS)
	)

/datum/cooking_with_jane/recipe/tofupie
	cooking_container = OVEN
	product_type = /obj/item/reagent_containers/snacks/tofupie
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/flatdough, qmod=0.5),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/tofu, qmod=0.5, exclude_reagents=list("carpotoxin", "blattedin")),
		list(CWJ_ADD_REAGENT_OPTIONAL, "woodpulp", 1, base=1, add_price = 5),
		list(CWJ_USE_OVEN, J_MED, 30 SECONDS)
	)

/datum/cooking_with_jane/recipe/xemeatpie
	cooking_container = OVEN
	product_type = /obj/item/reagent_containers/snacks/xemeatpie
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/flatdough, qmod=0.5),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/meat/xenomeat, qmod=0.5, exclude_reagents=list("carpotoxin", "blattedin")),
		list(CWJ_ADD_REAGENT_OPTIONAL, "woodpulp", 1, base=1, add_price = 5),
		list(CWJ_USE_OVEN, J_MED, 30 SECONDS)
	)

/datum/cooking_with_jane/recipe/pie
	cooking_container = OVEN
	product_type = /obj/item/reagent_containers/snacks/pie
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/flatdough, qmod=0.5),
		list(CWJ_ADD_PRODUCE, "banana", qmod=0.2, reagent_skip=TRUE),
		list(CWJ_ADD_REAGENT, "sugar", 5, base=1),
		list(CWJ_ADD_REAGENT_OPTIONAL, "woodpulp", 1, base=1, add_price = 5),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/butterslice, qmod=0.5),
		list(CWJ_USE_OVEN, J_MED, 30 SECONDS)
	)

/datum/cooking_with_jane/recipe/cherrypie
	cooking_container = OVEN
	product_type = /obj/item/reagent_containers/snacks/cherrypie
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/flatdough, qmod=0.5),
		list(CWJ_ADD_PRODUCE, "cherry", qmod=0.2, reagent_skip=TRUE),
		list(CWJ_ADD_REAGENT, "sugar", 10),
		list(CWJ_ADD_REAGENT_OPTIONAL, "woodpulp", 1, base=1, add_price = 5),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/butterslice, qmod=0.5),
		list(CWJ_USE_OVEN, J_MED, 30 SECONDS)
	)

/datum/cooking_with_jane/recipe/berryclafoutis
	cooking_container = OVEN
	product_type = /obj/item/reagent_containers/snacks/berryclafoutis
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/flatdough, qmod=0.5),
		list(CWJ_ADD_PRODUCE, "berries", qmod=0.2, reagent_skip=TRUE),
		list(CWJ_ADD_REAGENT, "sugar", 10),
		list(CWJ_ADD_REAGENT_OPTIONAL, "woodpulp", 1, base=1, add_price = 5),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/butterslice, qmod=0.5),
		list(CWJ_USE_OVEN, J_MED, 30 SECONDS)
	)

/datum/cooking_with_jane/recipe/amanita_pie
	cooking_container = OVEN
	product_type = /obj/item/reagent_containers/snacks/amanita_pie
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/flatdough, qmod=0.5),
		list(CWJ_ADD_REAGENT, "amatoxin", 5),
		list(CWJ_ADD_REAGENT_OPTIONAL, "woodpulp", 1, base=1, add_price = 5),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/butterslice, qmod=0.5),
		list(CWJ_USE_OVEN, J_MED, 30 SECONDS)
	)

/datum/cooking_with_jane/recipe/plump_pie
	cooking_container = OVEN
	product_type = /obj/item/reagent_containers/snacks/plump_pie
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/flatdough, qmod=0.5),
		list(CWJ_ADD_PRODUCE, "plumphelmet", qmod=0.2, reagent_skip=TRUE),
		list(CWJ_ADD_REAGENT_OPTIONAL, "woodpulp", 1, base=1, add_price = 5),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/butterslice, qmod=0.5),
		list(CWJ_USE_OVEN, J_MED, 30 SECONDS)
	)

/datum/cooking_with_jane/recipe/pumpkinpie
	cooking_container = OVEN
	product_type = /obj/item/reagent_containers/snacks/pumpkinpie
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/flatdough, qmod=0.5),
		list(CWJ_ADD_PRODUCE, "pumpkin", qmod=0.2, reagent_skip=TRUE),
		list(CWJ_ADD_REAGENT_OPTIONAL, "woodpulp", 1, base=1, add_price = 5),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/butterslice, qmod=0.5),
		list(CWJ_USE_OVEN, J_MED, 30 SECONDS)
	)

/datum/cooking_with_jane/recipe/applepie
	cooking_container = OVEN
	product_type = /obj/item/reagent_containers/snacks/applepie
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/flatdough, qmod=0.5),
		list(CWJ_ADD_PRODUCE, "apple", qmod=0.2, reagent_skip=TRUE),
		list(CWJ_ADD_REAGENT_OPTIONAL, "woodpulp", 1, base=1, add_price = 5),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/butterslice, qmod=0.5),
		list(CWJ_USE_OVEN, J_MED, 30 SECONDS)
	)

/datum/cooking_with_jane/recipe/appletart
	cooking_container = OVEN
	product_type = /obj/item/reagent_containers/snacks/appletart
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/flatdough, qmod=0.5),
		list(CWJ_ADD_PRODUCE, "goldapple", qmod=0.2, reagent_skip=TRUE),
		list(CWJ_ADD_REAGENT, "sugar", 5),
		list(CWJ_ADD_REAGENT, "milk", 5),
		list(CWJ_ADD_REAGENT, "flour", 10),
		list(CWJ_ADD_REAGENT, "egg", 3),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/butterslice, qmod=0.5),
		list(CWJ_USE_OVEN, J_LO, 10 SECONDS)
	)

/datum/cooking_with_jane/recipe/plumphelmetbiscuit
	cooking_container = OVEN
	product_type = /obj/item/reagent_containers/snacks/plumphelmetbiscuit
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/doughslice, qmod=0.5),
		list(CWJ_ADD_PRODUCE, "plumphelmet", qmod=0.2, reagent_skip=TRUE),
		list(CWJ_ADD_REAGENT, "water", 5),
		list(CWJ_ADD_REAGENT, "flour", 5),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/butterslice, qmod=0.5),
		list(CWJ_USE_OVEN, J_LO, 20 SECONDS)
	)

/datum/cooking_with_jane/recipe/chawanmushi
	cooking_container = OVEN
	product_type = /obj/item/reagent_containers/snacks/chawanmushi
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/egg, qmod=0.5),
		list(CWJ_ADD_PRODUCE, "chanterelle", qmod=0.2, reagent_skip=TRUE),
		list(CWJ_ADD_REAGENT, "water", 5),
		list(CWJ_ADD_REAGENT, "soysauce", 5),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/egg, qmod=0.5),
		list(CWJ_USE_OVEN, J_LO, 20 SECONDS)
	)


//PIZZA!!!


/datum/cooking_with_jane/recipe/pizzamargherita
	cooking_container = OVEN
	product_type = /obj/item/reagent_containers/snacks/pizza/margherita
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/flatdough, qmod=0.5),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/cheesewedge, qmod=0.5),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/cheesewedge, qmod=0.5),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/cheesewedge, qmod=0.5),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/cheesewedge, qmod=0.5),
		list(CWJ_ADD_REAGENT_OPTIONAL, "water", 5, add_price = 2),
		list(CWJ_ADD_REAGENT_OPTIONAL, "flour", 5, add_price = 3),
		list(CWJ_ADD_PRODUCE, "tomato", qmod=0.2, reagent_skip=TRUE),
		list(CWJ_USE_OVEN, J_MED, 40 SECONDS)
	)

/datum/cooking_with_jane/recipe/meatpizza
	cooking_container = OVEN
	product_type = /obj/item/reagent_containers/snacks/pizza/meatpizza
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/flatdough, qmod=0.5),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/meat, qmod=0.5, exclude_reagents=list("carpotoxin", "blattedin")),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/meat, qmod=0.5, exclude_reagents=list("carpotoxin", "blattedin")),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/meat, qmod=0.5, exclude_reagents=list("carpotoxin", "blattedin")),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/cheesewedge, qmod=0.5),
		list(CWJ_ADD_REAGENT_OPTIONAL, "water", 5, add_price = 2),
		list(CWJ_ADD_REAGENT_OPTIONAL, "flour", 5, add_price = 3),
		list(CWJ_ADD_PRODUCE, "tomato", qmod=0.2, reagent_skip=TRUE),
		list(CWJ_USE_OVEN, J_MED, 40 SECONDS)
	)

/datum/cooking_with_jane/recipe/mushroompizza
	cooking_container = OVEN
	product_type = /obj/item/reagent_containers/snacks/pizza/mushroompizza
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/flatdough, qmod=0.5),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/cheesewedge, qmod=0.5),
		list(CWJ_ADD_REAGENT_OPTIONAL, "water", 5, add_price = 2),
		list(CWJ_ADD_REAGENT_OPTIONAL, "flour", 5, add_price = 3),
		list(CWJ_ADD_PRODUCE, "tomato", qmod=0.2, reagent_skip=TRUE),
		//Mushroom pizza is uniquic in that it takes any mushroom rather then a required type
		list(CWJ_ADD_PRODUCE, "plumphelmet", qmod=0.2, reagent_skip=TRUE),
		list(CWJ_ADD_PRODUCE, "plumphelmet", qmod=0.2, reagent_skip=TRUE),
		list(CWJ_ADD_PRODUCE, "plumphelmet", qmod=0.2, reagent_skip=TRUE),
		list(CWJ_ADD_PRODUCE, "plumphelmet", qmod=0.2, reagent_skip=TRUE),
		list(CWJ_ADD_PRODUCE, "plumphelmet", qmod=0.2, reagent_skip=TRUE),
		list(CWJ_USE_OVEN, J_MED, 40 SECONDS)
	)

/datum/cooking_with_jane/recipe/vegetablepizza
	cooking_container = OVEN
	product_type = /obj/item/reagent_containers/snacks/pizza/vegetablepizza
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/flatdough, qmod=0.5),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/cheesewedge, qmod=0.5),
		list(CWJ_ADD_REAGENT_OPTIONAL, "water", 5, add_price = 2),
		list(CWJ_ADD_REAGENT_OPTIONAL, "flour", 5, add_price = 3),
		list(CWJ_ADD_PRODUCE, "tomato", qmod=0.2, reagent_skip=TRUE),
		list(CWJ_ADD_PRODUCE, "eggplant", qmod=0.2, reagent_skip=TRUE),
		list(CWJ_ADD_PRODUCE, "cabbage", qmod=0.2, reagent_skip=TRUE),
		list(CWJ_ADD_PRODUCE, "carrot", qmod=0.2, reagent_skip=TRUE),
		list(CWJ_ADD_PRODUCE, "chanterelle", qmod=0.2, reagent_skip=TRUE),
		list(CWJ_USE_OVEN, J_MED, 40 SECONDS)
	)

/datum/cooking_with_jane/recipe/hawaiianpizza
	cooking_container = OVEN
	product_type = /obj/item/reagent_containers/snacks/pizza/hawaiianpizza
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/flatdough, qmod=0.5),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/cheesewedge, qmod=0.5),
		list(CWJ_ADD_REAGENT_OPTIONAL, "water", 5, add_price = 2),
		list(CWJ_ADD_REAGENT_OPTIONAL, "flour", 5, add_price = 3),
		list(CWJ_ADD_PRODUCE, "tomato", qmod=0.2, reagent_skip=TRUE),
		list(CWJ_ADD_PRODUCE, "pineapple", qmod=0.2, reagent_skip=TRUE),
		list(CWJ_USE_OVEN, J_MED, 40 SECONDS)
	)

//stinky herbal tea

/datum/cooking_with_jane/recipe/poppy_tisane
	cooking_container = POT
	product_type = /obj/item/reagent_containers/snacks/poppy_tisane
	step_builder = list(
		list(CWJ_ADD_REAGENT, "water", 10),
		list(CWJ_ADD_PRODUCE, "poppy", qmod=0.2, reagent_skip=TRUE),
		list(CWJ_ADD_PRODUCE, "poppy", qmod=0.2, reagent_skip=TRUE),
		list(CWJ_ADD_PRODUCE, "poppy", qmod=0.2, reagent_skip=TRUE),
		list(CWJ_ADD_PRODUCE, "cinnamon", qmod=0.2, reagent_skip=TRUE),
		list(CWJ_USE_STOVE, J_LO, 60 SECONDS) //A bit long, this is a bottleneck to mass producing better medicine but has its own advantages.
	)

/datum/cooking_with_jane/recipe/tear_tisane
	cooking_container = POT
	product_type = /obj/item/reagent_containers/snacks/tear_tisane
	step_builder = list(
		list(CWJ_ADD_REAGENT, "water", 10),
		list(CWJ_ADD_PRODUCE, "sun tear", qmod=0.2, reagent_skip=TRUE),
		list(CWJ_ADD_PRODUCE, "sun tear", qmod=0.2, reagent_skip=TRUE),
		list(CWJ_ADD_PRODUCE, "sun tear", qmod=0.2, reagent_skip=TRUE),
		list(CWJ_ADD_PRODUCE, "cinnamon", qmod=0.2, reagent_skip=TRUE),
		list(CWJ_USE_STOVE, J_LO, 60 SECONDS)
	)

/datum/cooking_with_jane/recipe/mercy_tisane
	cooking_container = POT
	product_type = /obj/item/reagent_containers/snacks/mercy_tisane
	step_builder = list(
		list(CWJ_ADD_REAGENT, "water", 10),
		list(CWJ_ADD_PRODUCE, "mercy's hand", qmod=0.2, reagent_skip=TRUE),
		list(CWJ_ADD_PRODUCE, "mercy's hand", qmod=0.2, reagent_skip=TRUE),
		list(CWJ_ADD_PRODUCE, "mercy's hand", qmod=0.2, reagent_skip=TRUE),
		list(CWJ_ADD_PRODUCE, "cinnamon", qmod=0.2, reagent_skip=TRUE),
		list(CWJ_USE_STOVE, J_LO, 60 SECONDS)
	)

/datum/cooking_with_jane/recipe/vale_tisane
	cooking_container = POT
	product_type = /obj/item/reagent_containers/snacks/vale_tisane
	step_builder = list(
		list(CWJ_ADD_REAGENT, "water", 10),
		list(CWJ_ADD_PRODUCE, "vale bush", qmod=0.2, reagent_skip=TRUE),
		list(CWJ_ADD_PRODUCE, "vale bush", qmod=0.2, reagent_skip=TRUE),
		list(CWJ_ADD_PRODUCE, "vale bush", qmod=0.2, reagent_skip=TRUE),
		list(CWJ_ADD_PRODUCE, "cinnamon", qmod=0.2, reagent_skip=TRUE),
		list(CWJ_USE_STOVE, J_LO, 60 SECONDS)
	)

/datum/cooking_with_jane/recipe/helmet_tisane
	cooking_container = POT
	product_type = /obj/item/reagent_containers/snacks/helmet_tisane
	step_builder = list(
		list(CWJ_ADD_REAGENT, "water", 10),
		list(CWJ_ADD_PRODUCE, "plumphelmet", qmod=0.2, reagent_skip=TRUE),
		list(CWJ_ADD_PRODUCE, "plumphelmet", qmod=0.2, reagent_skip=TRUE),
		list(CWJ_ADD_PRODUCE, "plumphelmet", qmod=0.2, reagent_skip=TRUE),
		list(CWJ_ADD_PRODUCE, "cinnamon", qmod=0.2, reagent_skip=TRUE),
		list(CWJ_USE_STOVE, J_LO, 60 SECONDS)
	)

//Candy
/datum/cooking_with_jane/recipe/candy_corn
	cooking_container = OVEN
	product_type = /obj/item/reagent_containers/snacks/candy_corn
	step_builder = list(
		list(CWJ_ADD_REAGENT, "water", 10),
		list(CWJ_ADD_REAGENT, "sugar", 5),
		list(CWJ_ADD_REAGENT, "cornoil", 5),
		list(CWJ_ADD_REAGENT_OPTIONAL, "honey", 3, base=3, add_price = 9),
		list(CWJ_USE_STOVE, J_LO, 60 SECONDS)
	)

/datum/cooking_with_jane/recipe/mint
	cooking_container = OVEN
	product_type = /obj/item/reagent_containers/snacks/mint
	step_builder = list(
		list(CWJ_ADD_REAGENT, "water", 10),
		list(CWJ_ADD_REAGENT, "sugar", 5),
		list(CWJ_ADD_REAGENT, "frostoil", 5),
		list(CWJ_ADD_REAGENT_OPTIONAL, "honey", 3, base=3, add_price = 9),
		list(CWJ_USE_STOVE, J_LO, 60 SECONDS)
	)

/datum/cooking_with_jane/recipe/fortunecookie
	cooking_container = OVEN
	product_type = /obj/item/reagent_containers/snacks/fortunecookie
	recipe_guide = "Fortune is added after baking. Use basic paper found in paper bins."
	step_builder = list(
		list(CWJ_ADD_REAGENT, "water", 5),
		list(CWJ_ADD_REAGENT, "sugar", 5),
		list(CWJ_ADD_REAGENT, "flour", 5),
		list(CWJ_ADD_REAGENT_OPTIONAL, "honey", 3, base=3, add_price = 9),
		list(CWJ_USE_STOVE, J_LO, 60 SECONDS)
	)