/*
=========================================================
CWJ STEP_BUILDER COMMANDS:

All steps in the step builder have the following format:
list(<CWJ_STEP_CLASS><_OPTIONAL>, <REQUIRED_ARGS>, <CUSTOM_ARGS>=value)

<CWJ_STEP_CLASS>
	The name any one of the recipe step types, custom or otherwise.
	Valid options are:
		CWJ_ADD_ITEM
			Add an item to the recipe. The object is inserted in the container.
			<REQUIRED_ARGS>:
				type_path - the type path of the item being added.
			Example: list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/breadslice)

		CWJ_ADD_ITEM
			Uses an item on the recipe. The object is not consumed.
			<REQUIRED_ARGS>:
				type_path - the type path of the item being added.
			Example: list(CWJ_USE_ITEM, /obj/item/material/kitchen/rollingpin)

<_OPTIONAL>
	The tag _OPTIONAL can be tacked onto any command to make it an optional step not required to finish the recipe.
	Example: list(CWJ_ADD_ITEM_OPTIONAL, /obj/item/reagent_containers/food/snacks/breadslice)

<REQUIRED_ARGS>
	The required arguments for a specific class of step to function. They are not labeled and must be in order.
	See above for which classes of step have which required arguments.

<CUSTOM_ARGS>
	All custom arguments are declared in the format key=value. They are used to quickly modify a given step in a recipe.

	Example: list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/breadslice, desc="a custom description")

	Valid options are:
		desc
			Adds a custom description to the recipe step, when read from a cooking book.
			Example: desc="a custom description"

		base
			Defines the base quality for a recipe step. This will become the LOWEST quality following a step can award.
			For some step classes, this will simply be the default awarded.
			If not defined, there is no minimum quality a step can add.
			Example: base=4

		max
			Defines the maximum quality for a recipe step. This will become the HIGHEST quality following a step can award.
			If not defined, there is no maximum quality a step can add.
			Example: max=10

		result_desc
			Adds a custom description to the result of the recipe step. This will be read off on the item product.
			Example: result_desc="A Slice of Bread is in the sandwich."

		exact
			Determines if the type path of a CWJ_ADD_ITEM step or a CWJ_USE_ITEM require an exact type path, or if a child
			of the type path is also preferable.

=========================================================
*/
//Example Recipes


/datum/cooking_with_jane/recipe/sandwich_bad
	cooking_container = PLATE
	product_type = /obj/item/reagent_containers/food/snacks/sandwich
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/breadslice, qmod=0.5),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/cutlet, desc="It has meat in it.", result_desc="There is meat between the bread."),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/breadslice)
	)

/datum/cooking_with_jane/recipe/sandwich_tofu_bad
	cooking_container = PLATE
	product_type = /obj/item/reagent_containers/food/snacks/sandwich
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/breadslice, qmod=0.5),
		CWJ_BEGIN_EXCLUSIVE_OPTIONS,
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/tofu, desc="It has tofu in it.", result_desc="There is tofu between the bread."),
		list(CWJ_USE_ITEM, /obj/item/reagent_containers/food/snacks/tofu, desc="Tofu has been used on it.", result_desc="It has been in contact with tofu."),
		CWJ_END_EXCLUSIVE_OPTIONS,
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/breadslice)
	)

/datum/cooking_with_jane/recipe/sandwich_bad_stacked
	cooking_container = PLATE
	product_type = /obj/item/reagent_containers/food/snacks/sandwich
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/breadslice, qmod=0.5),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/cutlet, desc="It has meat in it.", result_desc="There is meat between the bread."),
		list(CWJ_ADD_ITEM_OPTIONAL, /obj/item/reagent_containers/food/snacks/cutlet, desc="It has additional meat in it.", result_desc="There is additional meat between the bread."),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/breadslice)
	)




/*
/datum/cooking_with_jane/recipe/sandwich
	cooking_container = PLATE
	product_type = /obj/item/reagent_containers/food/snacks/sandwich
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/breadslice),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/cutlet, desc="It has meat in it."),
		list(CWJ_ADD_REAGENT_OPTIONAL, 'salt', 5, desc="The Meat is salted."),
		CWJ_BEGIN_EXCLUSIVE_OPTIONS,
		list(CWJ_ADD_REAGENT_OPTIONAL, 'ketchup', 5, base=2),
		list(CWJ_ADD_REAGENT_OPTIONAL, 'mustard', 5, base=3),
		CWJ_END_EXCLUSIVE_OPTIONS,
		list(CWJ_ADD_PRODUCE_OPTIONAL, 'tomato', base=1),
		list(CWJ_ADD_PRODUCE_OPTIONAL, 'lettuce', base=1),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/breadslice, base=3)
	)

/datum/cooking_with_jane/recipe/steak
	start_type_list = list(/obj/item/reagent_containers/food/snacks/meat)
	product_type = /obj/item/reagent_containers/food/snacks/meatsteak
	step_builder = list(
		CWJ_BEGIN_EXCLUSIVE_OPTIONS
		CWJ_BEGIN_OPTION_CHAIN
		list(CWJ_ADD_REAGENT_OPTIONAL, 'salt', 3, base=3)
		list(CWJ_ADD_REAGENT_OPTIONAL, 'pepper', 3, base=3)
		CWJ_END_OPTION_CHAIN
		list(CWJ_ADD_REAGENT_OPTIONAL, 'sp_sauce', 5, base=6)
		list(CWJ_ADD_REAGENT_OPTIONAL, 'wine', 5, base=6, prod_desc="The steak was sauteed in wine")
		CWJ_END_EXCLUSIVE_OPTIONS
		list(CWJ_ADD_REAGENT_OPTIONAL, 'capsaicin', 5, base=6, prod_desc="The steak was Spiced with chili powder.")
		list(CWJ_ADD_PRODUCE_OPTIONAL, 'parsley', base=1),
		list(CWJ_ADD_APPLIANCE, 'grill', temp=300, time = 1 MINUTE, max=4)
	)
*/
