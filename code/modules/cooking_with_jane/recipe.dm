
//Example Recipes
/datum/cooking_with_jane/recipe/sandwich
	start_type_list = list(/obj/item/reagent_containers/food/snacks/breadslice)
	product_type = /obj/item/reagent_containers/food/snacks/sandwich
	step_builder = list(
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

/*
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