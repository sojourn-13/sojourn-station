
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

		//Add some mushrooms to give it some zest. Only one kind is allowed!
		CWJ_BEGIN_EXCLUSIVE_OPTIONS,
		list(CWJ_ADD_PRODUCE_OPTIONAL, "mushrooms", qmod=0.2, reagent_skip=TRUE),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "reishi", qmod=0.4, reagent_skip=TRUE),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "amanita", qmod=0.4, reagent_skip=TRUE),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "plumphelmet", qmod=0.4, reagent_skip=TRUE),
		CWJ_END_EXCLUSIVE_OPTIONS,

		//Beat that meat to increase its quality
		list(CWJ_USE_TOOL_OPTIONAL, QUALITY_HAMMERING, 15),

		//You can add up to 3 units of salt to increase the quality. Any more will negatively impact it.
		//base- for CWJ_ADD_REAGENT, the amount that this step will award if followed perfectly.
		list(CWJ_ADD_REAGENT_OPTIONAL, "sodiumchloride", 3, base=3),

		//You can add capaicin or wine, but not both
		//prod_desc- A description appended to the resulting product.
		CWJ_BEGIN_EXCLUSIVE_OPTIONS,
		list(CWJ_ADD_REAGENT_OPTIONAL, "capsaicin", 5, base=6, prod_desc="The steak was Spiced with chili powder."),
		list(CWJ_ADD_REAGENT_OPTIONAL, "wine", 5, remain_percent=0.1 ,base=6, prod_desc="The steak was sauteed in wine"),
		CWJ_END_EXCLUSIVE_OPTIONS,

		//Cook on a stove, at medium temperature, for 30 seconds
		list(CWJ_USE_STOVE, J_MED, 30 SECONDS)
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


/datum/cooking_with_jane/recipe/bread
	cooking_container = OVEN
	product_type = /obj/item/reagent_containers/food/snacks/sliceable/bread
	recipe_guide = "Put dough in an oven, bake for 30 seconds on medium."
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/dough, qmod=0.5),
		list(CWJ_USE_OVEN, J_MED, 30 SECONDS)
	)

