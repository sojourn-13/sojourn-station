//-----------------------------------------------------------------------------------
//A cooking step that involves adding a reagent to the food.
/datum/cooking_with_jane/recipe_step/add_reagent
	var/required_reagent_id
	var/required_reagent_amount
	
//reagent_id: The id of the required reagent to be added, E.G. 'salt'.
//amount: The amount of the required reagent that needs to be added.
//base_quality_award: The quality awarded by following this step.
//our_recipe: The parent recipe object,
/datum/cooking_with_jane/recipe_step/add_reagent/New(var/base_quality_award, var/reagent_id,  var/amount, var/datum/cooking_with_jane/recipe/our_recipe)
	..(base_quality_award, our_recipe)
	var/datum/reagent/global_reagent = GLOB.chemical_reagents_list[reagent_id]
	if(global_reagent)
		description = "Add [amount] unit(s) of [global_reagent.name]"
		required_reagent_id = reagent_id
		required_reagent_amount = amount
	else
		log_debug("/datum/cooking_with_jane/recipe_step/add/reagent/New(): Reagent [reagent_id] not found.")


/datum/cooking_with_jane/recipe_step/add_reagent/check_conditions_met(var/reagent_id)
	if(reagent_id == required_reagent_id)
		return TRUE

/datum/cooking_with_jane/recipe_step/add_reagent/calculate_quality(var/amount)
	#ifdef JANEDEBUG
	var/quality = (base_quality_award - abs(amount - required_reagent_amount))
	log_debug("/datum/cooking_with_jane/recipe_step/calculate_quality(var/amount) returned quality of [quality])
	#endif
	return min((base_quality_award - abs(amount - required_reagent_amount)), 0)
//-----------------------------------------------------------------------------------
//A cooking step that involves adding an item to the food.
/datum/cooking_with_jane/recipe_step/add_item
	var/required_item_type

//item_type: The type path of the object we are looking for.
//base_quality_award: The quality awarded by following this step.
//our_recipe: The parent recipe object,
/datum/cooking_with_jane/recipe_step/add_item/New(var/item_type, var/base_quality_award, var/datum/cooking_with_jane/recipe/our_recipe)
	..(base_quality_award, our_recipe)
	if(!ispath(item_type))
		log_debug("/datum/cooking_with_jane/recipe_step/add_item/New(): item [item_type] is not a valid path")
	
	var/example_item = new item_type()
	if(example_item)
		description = "Add \a [example_item] into the recipe."
		required_item_type = item_type
		QDEL_NULL(example_item)
	else
		log_debug("/datum/cooking_with_jane/recipe_step/add_item/New(): item [item_type] couldn't be created.")
//-----------------------------------------------------------------------------------