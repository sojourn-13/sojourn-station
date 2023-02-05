
//Example Recipes
/datum/cooking_with_jane/recipe/steak_stove

	//Name of the recipe. If not defined, it will just use the name of the product_type
	name="Stove-Top cooked Steak"

	//The recipe will be cooked on a pan
	cooking_container = PAN

	//The product of the recipe will be a steak.
	product_type = /obj/item/reagent_containers/food/snacks/meatsteak

	//The product will have it's initial reagents wiped, prior to the recipe adding in reagents of its own.
	replace_reagents = TRUE

	step_builder = list(

		//Butter your pan by adding a slice of butter, and then melting it. Adding the butter unlocks the option to melt it on the stove.
		CWJ_BEGIN_OPTION_CHAIN,
		//base - the lowest amount of quality following this step can award.
		//reagent_skip - Exclude the added item's reagents from being included the product
		list(CWJ_ADD_ITEM_OPTIONAL, /obj/item/reagent_containers/food/snacks/butterslice, base=10, reagent_skip=TRUE),

		//Melt the butter into the pan by cooking it on a stove set to Low for 10 seconds
		list(CWJ_USE_STOVE_OPTIONAL, J_LO, 10 SECONDS),
		CWJ_END_OPTION_CHAIN,

		//A steak is needed to start the meal.
		//qmod- Half of the food quality of the parent will be considered.
		//exclude_reagents- Blattedin and Carpotoxin will be filtered out of the steak.
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/meat, qmod=0.5, exclude_reagents=list("carpotoxin", "blattedin")),
		list(CWJ_ADD_REAGENT, "sodiumchloride", 1),
		list(CWJ_ADD_REAGENT, "blackpepper", 1),
		//Add some mushrooms to give it some zest. Only one kind is allowed!
		CWJ_BEGIN_EXCLUSIVE_OPTIONS,
		list(CWJ_ADD_PRODUCE_OPTIONAL, "mushrooms", qmod=0.2, reagent_skip=TRUE),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "reishi", qmod=0.4, reagent_skip=TRUE),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "amanita", qmod=0.4, reagent_skip=TRUE),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "plumphelmet", qmod=0.4, reagent_skip=TRUE),
		CWJ_END_EXCLUSIVE_OPTIONS,

		//Beat that meat to increase its quality
		list(CWJ_USE_TOOL_OPTIONAL, QUALITY_HAMMERING, 15),

		//You can add up to 3 units of honey to increase the quality. Any more will negatively impact it.
		//base- for CWJ_ADD_REAGENT, the amount that this step will award if followed perfectly.
		list(CWJ_ADD_REAGENT_OPTIONAL, "honey", 3, base=3),

		//You can add capaicin or wine, but not both
		//prod_desc- A description appended to the resulting product.
		CWJ_BEGIN_EXCLUSIVE_OPTIONS,
		list(CWJ_ADD_REAGENT_OPTIONAL, "capsaicin", 5, base=6, prod_desc="The steak was Spiced with chili powder."),
		list(CWJ_ADD_REAGENT_OPTIONAL, "wine", 5, remain_percent=0.1 ,base=6, prod_desc="The steak was sauteed in wine"),
		CWJ_END_EXCLUSIVE_OPTIONS,

		//Cook on a stove, at medium temperature, for 30 seconds
		list(CWJ_USE_STOVE, J_MED, 30 SECONDS)
	)


/datum/cooking_with_jane/recipe/chickensteak
	cooking_container = PAN
	product_type = /obj/item/reagent_containers/food/snacks/chickensteak

	replace_reagents = TRUE

	step_builder = list(
		CWJ_BEGIN_OPTION_CHAIN,
		list(CWJ_ADD_ITEM_OPTIONAL, /obj/item/reagent_containers/food/snacks/butterslice, base=10, reagent_skip=TRUE),
		list(CWJ_USE_STOVE_OPTIONAL, J_LO, 10 SECONDS),
		CWJ_END_OPTION_CHAIN,
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/chickenbreast, qmod=0.5, exclude_reagents=list("carpotoxin", "blattedin")),
		list(CWJ_ADD_REAGENT, "sodiumchloride", 1),
		list(CWJ_ADD_REAGENT, "blackpepper", 1),
		CWJ_BEGIN_EXCLUSIVE_OPTIONS,
		list(CWJ_ADD_PRODUCE_OPTIONAL, "mushrooms", qmod=0.2, reagent_skip=TRUE),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "reishi", qmod=0.4, reagent_skip=TRUE),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "amanita", qmod=0.4, reagent_skip=TRUE),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "plumphelmet", qmod=0.4, reagent_skip=TRUE),
		CWJ_END_EXCLUSIVE_OPTIONS,
		list(CWJ_ADD_REAGENT_OPTIONAL, "honey", 3, base=3),
		CWJ_BEGIN_EXCLUSIVE_OPTIONS,
		list(CWJ_ADD_REAGENT_OPTIONAL, "capsaicin", 5, base=6, prod_desc="The chicken was Spiced with chili powder."),
		list(CWJ_ADD_REAGENT_OPTIONAL, "lemonjuice", 5, remain_percent=0.1 ,base=3, prod_desc="The chicken was sauteed in lemon juice"),
		CWJ_END_EXCLUSIVE_OPTIONS,
		list(CWJ_USE_STOVE, J_MED, 30 SECONDS)
	)


/datum/cooking_with_jane/recipe/porkchops
	cooking_container = PAN
	product_type = /obj/item/reagent_containers/food/snacks/porkchops

	replace_reagents = TRUE

	step_builder = list(
		CWJ_BEGIN_OPTION_CHAIN,
		list(CWJ_ADD_ITEM_OPTIONAL, /obj/item/reagent_containers/food/snacks/butterslice, base=10, reagent_skip=TRUE),
		list(CWJ_USE_STOVE_OPTIONAL, J_LO, 10 SECONDS),
		CWJ_END_OPTION_CHAIN,
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/meat/pork, qmod=0.5, exclude_reagents=list("carpotoxin", "blattedin")),
		list(CWJ_ADD_REAGENT, "sodiumchloride", 1),
		list(CWJ_ADD_REAGENT, "blackpepper", 1),
		CWJ_BEGIN_EXCLUSIVE_OPTIONS,
		list(CWJ_ADD_PRODUCE_OPTIONAL, "mushrooms", qmod=0.2, reagent_skip=TRUE),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "reishi", qmod=0.4, reagent_skip=TRUE),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "amanita", qmod=0.4, reagent_skip=TRUE),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "plumphelmet", qmod=0.4, reagent_skip=TRUE),
		CWJ_END_EXCLUSIVE_OPTIONS,
		CWJ_BEGIN_EXCLUSIVE_OPTIONS,
		list(CWJ_ADD_REAGENT_OPTIONAL, "capsaicin", 5, base=6, prod_desc="The prok was Spiced with chili powder."),
		list(CWJ_ADD_REAGENT_OPTIONAL, "pineapplejuice", 5, remain_percent=0.1, base=5, prod_desc="The prok was rosted in pineapple juice."),
		list(CWJ_ADD_REAGENT_OPTIONAL, "honey", 5, remain_percent=0.1 ,base=3, prod_desc="The prok was glazed with honey"),
		list(CWJ_ADD_REAGENT_OPTIONAL, "bbqsauce", 3, remain_percent=0.5 ,base=8, prod_desc="The prok was layered with BBQ sauce"),
		CWJ_END_EXCLUSIVE_OPTIONS,
		list(CWJ_USE_STOVE, J_MED, 30 SECONDS)
	)

/datum/cooking_with_jane/recipe/roastchicken
	cooking_container = OVEN
	product_type = /obj/item/reagent_containers/food/snacks/roastchicken
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/meat/chicken, qmod=0.5),
		list(CWJ_ADD_REAGENT, "sodiumchloride", 1),
		list(CWJ_ADD_REAGENT, "blackpepper", 1),
		list(CWJ_USE_OVEN, J_MED, 30 SECONDS)
	)

/datum/cooking_with_jane/recipe/friedegg_basic
	cooking_container = PAN
	product_type = /obj/item/reagent_containers/food/snacks/friedegg
	step_builder = list(

		CWJ_BEGIN_OPTION_CHAIN,
		list(CWJ_ADD_ITEM_OPTIONAL, /obj/item/reagent_containers/food/snacks/butterslice, base=10, reagent_skip=TRUE),
		list(CWJ_USE_STOVE_OPTIONAL, J_LO, 10 SECONDS),
		CWJ_END_OPTION_CHAIN,

		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/egg, qmod=0.5, exclude_reagents=list("blattedin")),
		list(CWJ_ADD_REAGENT, "sodiumchloride", 1),
		list(CWJ_ADD_REAGENT, "blackpepper", 1),
		list(CWJ_ADD_REAGENT_OPTIONAL, "cornoil", 1, base=1),

		list(CWJ_USE_STOVE, J_LO, 15 SECONDS)
	)

/datum/cooking_with_jane/recipe/boiled_egg
	cooking_container = POT
	product_type = /obj/item/reagent_containers/food/snacks/boiledegg
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/egg, qmod=0.5, exclude_reagents=list("blattedin")),
		list(CWJ_ADD_REAGENT, "water", 5),
		list(CWJ_ADD_REAGENT_OPTIONAL, "sodiumchloride", 1, base=1),
		list(CWJ_USE_STOVE, J_MED, 15 SECONDS)
	)

/datum/cooking_with_jane/recipe/sandwich_basic
	cooking_container = CUTTING_BOARD
	product_type = /obj/item/reagent_containers/food/snacks/sandwich
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/breadslice, qmod=0.5),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/cutlet, qmod=0.5, desc="Add any kind of cutlet.", result_desc="There is meat between the bread."),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/breadslice, qmod=0.5)
	)

/datum/cooking_with_jane/recipe/icing
	cooking_container = POT
	reagent_id = "glaze"
	reagent_amount = 30
	description = "A dollop of basic icing!"
	recipe_guide = "Add 30 units of sugar. Add 30 units of water. Cook on a stove set to 'Low' for 30 seconds."
	step_builder = list(
		list(CWJ_ADD_REAGENT, "sugar", 30),
		list(CWJ_ADD_REAGENT, "water", 30),
		list(CWJ_USE_STOVE, J_LO, 30 SECONDS)
	)

/datum/cooking_with_jane/recipe/raw_speggie
	cooking_container = CUTTING_BOARD
	product_type = /obj/item/reagent_containers/food/snacks/doughslice
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/dough, qmod=0.5),
		list(CWJ_ADD_REAGENT_OPTIONAL, "flour", 1, base=1),
		list(CWJ_USE_TOOL, QUALITY_CUTTING, 1),
	)

/datum/cooking_with_jane/recipe/bread
	cooking_container = OVEN
	product_type = /obj/item/reagent_containers/food/snacks/sliceable/bread
	recipe_guide = "Put dough in an oven, bake for 30 seconds on medium."
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/dough, qmod=0.5),
		list(CWJ_USE_OVEN, J_MED, 30 SECONDS)
	)

// Soups

/datum/cooking_with_jane/recipe/meatballsoup
	cooking_container = POT
	product_type = /obj/item/reagent_containers/food/snacks/meatballsoup
	step_builder = list(
		list(CWJ_ADD_REAGENT, "water", 10),
		list(CWJ_ADD_REAGENT_OPTIONAL, "sodiumchloride", 1, base=1),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/meatball, qmod=0.5),
		list(CWJ_ADD_PRODUCE, "carrot", reagent_skip=TRUE),
		list(CWJ_ADD_PRODUCE, "potato", reagent_skip=TRUE),
		list(CWJ_USE_STOVE, J_LO, 30 SECONDS)
	)

/datum/cooking_with_jane/recipe/vegetablesoup
	cooking_container = POT
	product_type = /obj/item/reagent_containers/food/snacks/vegetablesoup
	step_builder = list(
		list(CWJ_ADD_REAGENT, "water", 10),
		list(CWJ_ADD_REAGENT_OPTIONAL, "sodiumchloride", 1, base=1),
		list(CWJ_ADD_PRODUCE, "carrot", reagent_skip=TRUE),
		list(CWJ_ADD_PRODUCE, "potato", reagent_skip=TRUE),
		list(CWJ_ADD_PRODUCE, "eggplant", reagent_skip=TRUE),
		list(CWJ_ADD_PRODUCE, "cabbage", reagent_skip=TRUE),
		list(CWJ_USE_STOVE, J_LO, 30 SECONDS)
	)

/datum/cooking_with_jane/recipe/nettlesoup
	cooking_container = POT
	product_type = /obj/item/reagent_containers/food/snacks/nettlesoup
	step_builder = list(
		list(CWJ_ADD_REAGENT, "water", 10),
		list(CWJ_ADD_REAGENT_OPTIONAL, "sodiumchloride", 1, base=1),
		list(CWJ_ADD_PRODUCE, "potato", reagent_skip=TRUE),
		list(CWJ_ADD_PRODUCE, "nettle", reagent_skip=TRUE),
		list(CWJ_USE_STOVE, J_LO, 30 SECONDS)
	)

/datum/cooking_with_jane/recipe/wishsoup
	cooking_container = POT
	product_type = /obj/item/reagent_containers/food/snacks/wishsoup
	step_builder = list(
		list(CWJ_ADD_REAGENT, "water", 20),
		list(CWJ_ADD_REAGENT_OPTIONAL, "sodiumchloride", 1, base=1),
		list(CWJ_USE_STOVE, J_LO, 5 SECONDS)
	)

/datum/cooking_with_jane/recipe/hotchili
	cooking_container = POT
	product_type = /obj/item/reagent_containers/food/snacks/hotchili
	step_builder = list(
		list(CWJ_ADD_REAGENT, "water", 10),
		list(CWJ_ADD_REAGENT_OPTIONAL, "sodiumchloride", 1, base=1),
		list(CWJ_ADD_PRODUCE, "chili", reagent_skip=TRUE),
		list(CWJ_ADD_PRODUCE, "tomato", reagent_skip=TRUE),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/meat, qmod=0.5, exclude_reagents=list("carpotoxin", "blattedin")),
		list(CWJ_USE_STOVE, J_LO, 30 SECONDS)
	)

/datum/cooking_with_jane/recipe/hotchili
	cooking_container = POT
	product_type = /obj/item/reagent_containers/food/snacks/coldchili
	step_builder = list(
		list(CWJ_ADD_REAGENT, "water", 10),
		list(CWJ_ADD_REAGENT_OPTIONAL, "sodiumchloride", 1, base=1),
		list(CWJ_ADD_PRODUCE, "icechili", reagent_skip=TRUE),
		list(CWJ_ADD_PRODUCE, "tomato", reagent_skip=TRUE),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/meat, qmod=0.5, exclude_reagents=list("carpotoxin", "blattedin")),
		list(CWJ_USE_STOVE, J_LO, 30 SECONDS)
	)

/datum/cooking_with_jane/recipe/bearchili
	cooking_container = POT
	product_type = /obj/item/reagent_containers/food/snacks/bearchili
	step_builder = list(
		list(CWJ_ADD_REAGENT, "water", 10),
		list(CWJ_ADD_REAGENT_OPTIONAL, "sodiumchloride", 1, base=1),
		list(CWJ_ADD_PRODUCE, "chili", reagent_skip=TRUE),
		list(CWJ_ADD_PRODUCE, "tomato", reagent_skip=TRUE),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/meat/bearmeat, qmod=0.5, exclude_reagents=list("carpotoxin", "blattedin")),
		list(CWJ_USE_STOVE, J_LO, 30 SECONDS)
	)

/datum/cooking_with_jane/recipe/stew
	cooking_container = POT
	product_type = /obj/item/reagent_containers/food/snacks/stew
	step_builder = list(
		list(CWJ_ADD_REAGENT, "water", 10),
		list(CWJ_ADD_REAGENT_OPTIONAL, "sodiumchloride", 1, base=1),
		list(CWJ_ADD_PRODUCE, "carrot", reagent_skip=TRUE),
		list(CWJ_ADD_PRODUCE, "potato", reagent_skip=TRUE),
		list(CWJ_ADD_PRODUCE, "mushroom", reagent_skip=TRUE),
		list(CWJ_ADD_PRODUCE, "tomato", reagent_skip=TRUE),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/meat, qmod=0.5, exclude_reagents=list("carpotoxin", "blattedin")),
		list(CWJ_USE_STOVE, J_MED, 15 SECONDS)
	)

/datum/cooking_with_jane/recipe/milosoup
	cooking_container = POT
	product_type = /obj/item/reagent_containers/food/snacks/milosoup
	step_builder = list(
		list(CWJ_ADD_REAGENT, "water", 10),
		list(CWJ_ADD_REAGENT_OPTIONAL, "sodiumchloride", 1, base=1),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/soydope, qmod=0.5, exclude_reagents=list("carpotoxin", "blattedin")),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/soydope, qmod=0.5, exclude_reagents=list("carpotoxin", "blattedin")),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/tofu, qmod=0.5, exclude_reagents=list("carpotoxin", "blattedin")),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/tofu, qmod=0.5, exclude_reagents=list("carpotoxin", "blattedin")),
		list(CWJ_USE_STOVE, J_MED, 15 SECONDS)
	)
