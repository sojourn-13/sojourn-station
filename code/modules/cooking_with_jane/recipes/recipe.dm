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
			The product inherits the item's quality and reagents if able.
			<REQUIRED_ARGS>:
				type_path - the type path of the item being added.
			Example: list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/breadslice)

		CWJ_ADD_REAGENT
			Add a reagent to the recipe. The resulting reagent is stored in the container's reagent datum.
			The product inherits the reagents added if able. It's possible to sneak poison into food this way.
			<REQUIRED_ARGS>:
				reagent_id - the id of the reagent being added
				amount - The amount of units the ingredient requires
			Example: list(CWJ_ADD_REAGENT, "salt", 5)

		CWJ_ADD_PRODUCE
			Add a grown item to the recipe. The item is inserted in the container.
			The product inherits reagents if able, and its quality scales with the plant's potency.
			<REQUIRED_ARGS>:
				plantname - the NAME of the SEED DATUM of the plant being added.
			Example: list(CWJ_ADD_PRODUCE, "banana")

		CWJ_USE_TOOL
			Uses a tool on the item. Going far and beyond the quality of the tool increases the quality of the product.
			<REQUIRED_ARGS>:
				tool_quality - the id of the reagent being added
				difficulty - The minimum tool quality of the reagent
			Example: list(CWJ_USE_TOOL, QUALITY_CUTTING, 5)

		CWJ_USE_ITEM
			Uses an item on the recipe. The object is not consumed.
			<REQUIRED_ARGS>:
				type_path - the type path of the item being added.
			Example: list(CWJ_USE_ITEM, /obj/item/material/kitchen/rollingpin) #Use a rolling pin on the container

		CWJ_USE_STOVE
			Cook the cooking container on a stove. Keep it on too long, it burns.
			<REQUIRED_ARGS>:
				temperature - the required temperature to cook the food at.
					(Temperatures are macro'd by: J_LO, J_MED, J_HI)
				time - the amount of time, in seconds, to keep the food on the stove.
			Example: list(CWJ_USE_STOVE, J_LO, 40) #Cook on a stove set to "Low" for 40 seconds.

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
			CWJ_ADD_ITEM or CWJ_USE_ITEM ONLY:
			Determines if the steps require an exact type path, or if a child will satisfy the requirements.
			of the type path is also preferable.
			Example: exact=TRUE

		qmod
			CWJ_ADD_ITEM, CWJ_USE_TOOL ONLY:
			modifier to adjust the inherited_quality_modifier on an add_item recipe step.
			Example: qmod=0.5 //only 50% of the added item's quality will be inherited.

		remain_percent
			CWJ_ADD_REAGENT ONLY:
			Determines the percentage of a reagent that remains in the cooking of an item.
			IE- if you cook a steak with wine, you can make it so the wine doesn't wind up in the resulting food.
			Example: remain_percent=0.1 //Only 10% of the units expected to be added will apply to the resulting food injection.

		reagent_skip
			CWJ_ADD_ITEM, CWJ_ADD_PRODUCE ONLY:
			Outright excludes all reagents from the added item/produce from showing up in the product.
			Example: reagent_skip=TRUE

		exclude_reagents
			CWJ_ADD_ITEM, CWJ_ADD_PRODUCE ONLY:
			Excludes the presence of a reagent in an item from the resulting meal.
			Example: exclude_reagents=list("carpotoxin", "blattedin") //Removes the presence of Carpotoxin or blattedin from the item.

=========================================================
*/
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
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/cutlet, qmod=0.5, desc="It has meat in it.", result_desc="There is meat between the bread."),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/breadslice, qmod=0.5)
	)

/datum/cooking_with_jane/recipe/sandwich_basic_bowl
	cooking_container = BOWL
	product_type = /obj/item/reagent_containers/food/snacks/sandwich
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/breadslice, qmod=0.5),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/cutlet, qmod=0.5, desc="It has meat in it.", result_desc="There is meat between the bread."),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/breadslice, qmod=0.5)
	)

/datum/cooking_with_jane/recipe/sandwich_deep_fryer
	cooking_container = DF_BASKET
	product_type = /obj/item/reagent_containers/food/snacks/sandwich
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/breadslice, qmod=0.5),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/cutlet, qmod=0.5, desc="It has meat in it.", result_desc="There is meat between the bread."),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/breadslice, qmod=0.5)
	)

/datum/cooking_with_jane/recipe/sandwich_air_fryer
	cooking_container = AF_BASKET
	product_type = /obj/item/reagent_containers/food/snacks/sandwich
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/breadslice, qmod=0.5),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/cutlet, qmod=0.5, desc="It has meat in it.", result_desc="There is meat between the bread."),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/breadslice, qmod=0.5)
	)

/datum/cooking_with_jane/recipe/sandwich_pot
	cooking_container = POT
	product_type = /obj/item/reagent_containers/food/snacks/sandwich
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/breadslice, qmod=0.5),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/cutlet, qmod=0.5, desc="It has meat in it.", result_desc="There is meat between the bread."),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/breadslice, qmod=0.5)
	)

/datum/cooking_with_jane/recipe/sandwich_oven
	cooking_container = OVEN
	product_type = /obj/item/reagent_containers/food/snacks/sandwich
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/breadslice, qmod=0.5),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/cutlet, qmod=0.5, desc="It has meat in it.", result_desc="There is meat between the bread."),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/breadslice, qmod=0.5)
	)


/datum/cooking_with_jane/recipe/sandwich_bad_with_tomato
	cooking_container = CUTTING_BOARD
	product_type = /obj/item/reagent_containers/food/snacks/sandwich
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/breadslice, qmod=0.5),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/cutlet, desc="It has meat in it.", result_desc="There is meat between the bread."),
		list(CWJ_ADD_PRODUCE, "tomato", result_desc="There is a whole tomato stuffed in the sandwich."),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/breadslice)
	)

/datum/cooking_with_jane/recipe/sandwich_tofu_bad
	cooking_container = CUTTING_BOARD
	product_type = /obj/item/reagent_containers/food/snacks/sandwich
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/breadslice, qmod=0.5),
		CWJ_BEGIN_EXCLUSIVE_OPTIONS,
		list(CWJ_ADD_ITEM_OPTIONAL, /obj/item/reagent_containers/food/snacks/tofu, desc="It has tofu in it.", result_desc="There is tofu between the bread."),
		list(CWJ_USE_ITEM_OPTIONAL, /obj/item/reagent_containers/food/snacks/tofu, desc="Tofu has been used on it.", result_desc="It has been in contact with tofu."),
		CWJ_END_EXCLUSIVE_OPTIONS,
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/breadslice)
	)

/datum/cooking_with_jane/recipe/sandwich_bad_stacked
	cooking_container = CUTTING_BOARD
	product_type = /obj/item/reagent_containers/food/snacks/sandwich
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/breadslice, qmod=0.5),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/cutlet, desc="It has meat in it.", result_desc="There is meat between the bread."),
		list(CWJ_ADD_ITEM_OPTIONAL, /obj/item/reagent_containers/food/snacks/cutlet, desc="It has additional meat in it.", result_desc="There is additional meat between the bread."),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/breadslice)
	)




/datum/cooking_with_jane/recipe/sandwich_salted
	cooking_container = CUTTING_BOARD
	product_type = /obj/item/reagent_containers/food/snacks/sandwich
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/breadslice, qmod=0.5),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/cutlet, desc="It has meat in it.", result_desc="There is meat between the bread."),
		list(CWJ_ADD_REAGENT, "sodiumchloride", 5),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/breadslice)
	)

/datum/cooking_with_jane/recipe/sandwich_split
	cooking_container = PAN
	product_type = /obj/item/reagent_containers/food/snacks/sandwich
	product_count = 2
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/sandwich, qmod=0.5),
		list(CWJ_USE_TOOL, QUALITY_SAWING, 10)
	)


/datum/cooking_with_jane/recipe/sandwich_toasted
	cooking_container = GRILL
	product_type = /obj/item/reagent_containers/food/snacks/sandwich
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/sandwich),
		list(CWJ_USE_GRILL, J_LO, 30 SECONDS, result_desc="It has been toasted.")
	)


/datum/cooking_with_jane/recipe/icing
	cooking_container = POT
	reagent_id = "glaze"
	reagent_amount = 30
	step_builder = list(
		list(CWJ_ADD_REAGENT, "sugar", 30),
		list(CWJ_ADD_REAGENT, "water", 30),
		list(CWJ_USE_STOVE, J_LO, 30 SECONDS)
	)

/*
//Example of the same recipe, but for the grill, just to show off how compact everything is.
/datum/cooking_with_jane/recipe/grill_stove
	cooking_container = SKILLET
	product_type = /obj/item/reagent_containers/food/snacks/meatsteak
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/meat, qmod=0.5, remain_percent=0),
		list(CWJ_USE_TOOL_OPTIONAL, QUALITY_HAMMERING, 15)
		list(CWJ_ADD_REAGENT_OPTIONAL, 'salt', 3, base=3),
		list(CWJ_ADD_REAGENT_OPTIONAL, 'pepper', 3, base=3),
		list(CWJ_ADD_REAGENT_OPTIONAL, 'capsaicin', 5, base=6, prod_desc="The steak was Spiced with chili powder."),
		list(CWJ_USE_GRILL, J_MED, 30)
	)



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
