
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
		list(CWJ_ADD_PRODUCE_OPTIONAL, "tomato", base=1),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "lettuce", base=1),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/breadslice, base=3)
	)

/datum/cooking_with_jane/recipe/sandwich
	start_type_list = list(/obj/item/reagent_containers/food/snacks/meat)