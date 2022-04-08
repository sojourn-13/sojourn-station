//A step in a recipe, whether optional or required
/datum/cooking_with_jane/recipe_step
	var/unique_id //Special ID for a given recipe, allows for referencing later by food objects to save on memory.

	var/class = CWJ_CLASS_OTHER //The classificaiton of the step involved.

	var/group_identifier = "None" //Different for every type of recipe.

	var/parent_recipe //The parent recipe of this particular step. Created on initialization with New()

	var/desc	//A description of the step
	
	var/list/optional_step_list = list() //List of optional steps that can be followed from this point forward.

	var/max_quality_awarded = -1 //The maximum quality awarded by following a given step to the letter.

	var/base_quality_award = 0

	var/flags = 0

	//The next required step for the parent recipe
	var/datum/cooking_with_jane/recipe_step/next_step

	//The previous required step for the current recipe
	var/datum/cooking_with_jane/recipe_step/previous_step

/datum/cooking_with_jane/recipe_step/New(var/base_quality_award, var/quality_description, var/datum/cooking_with_jane/recipe/our_recipe)
	parent_recipe = our_recipe
	base_quality_award = base_quality_award
	unique_id = sequential_id(type)

	//Add the recipe to our dictionary for future reference.
	if(!GLOB.cwj_step_dictionary[class])
		GLOB.cwj_step_dictionary[class] = list()
	if(!GLOB.cwj_step_dictionary[class][group_identifier])
		GLOB.cwj_step_dictionary[class][group_identifier] = list()
	GLOB.cwj_step_dictionary[class][group_identifier]["[unique_id]"] = src

//Calculate how well the recipe step was followed to the letter.
/datum/cooking_with_jane/recipe_step/proc/calculate_quality()
	return max_quality_awarded

//Check if the conditions of a recipe step was followed correctly.
/datum/cooking_with_jane/recipe_step/proc/check_conditions_met()
	return TRUE

//Check if a given step is in the same option chain as another step.
/datum/cooking_with_jane/recipe_step/proc/in_option_chain(var/datum/cooking_with_jane/recipe_step/step)
	if(!step)
		return FALSE
	if((flags & ~CWJ_IS_OPTION_CHAIN) || (step.flags & ~CWJ_IS_OPTION_CHAIN))
		return FALSE
	
	var/datum/cooking_with_jane/recipe_step/target_step = src.previous_step
	//traverse backwards on the chain.
	while(target_step && (target_step & ~CWJ_IS_OPTION_CHAIN))
		if(step.unique_id == target_step.unique_id)
			return TRUE
		target_step = target_step.previous_step
	
	//Traverse forwards on the chain.
	target_step = src.next_step
	while(target_step && (target_step & ~CWJ_IS_OPTION_CHAIN))
		if(step.unique_id == target_step.unique_id)
			return TRUE
		target_step = src.next_step
	
	//We didn't find anything. Return False.
	return FALSE

//-----------------------------------------------------------------------------------
//A cooking step that involves adding a reagent to the food.
/datum/cooking_with_jane/recipe_step/add_reagent
	class = CWJ_CLASS_ADD_REAGENT
	var/required_reagent_id
	var/required_reagent_amount
	
//reagent_id: The id of the required reagent to be added, E.G. 'salt'.
//amount: The amount of the required reagent that needs to be added.
//base_quality_award: The quality awarded by following this step.
//our_recipe: The parent recipe object,
/datum/cooking_with_jane/recipe_step/add_reagent/New(var/base_quality_award, var/reagent_id,  var/amount, var/datum/cooking_with_jane/recipe/our_recipe)
	
	var/datum/reagent/global_reagent = GLOB.chemical_reagents_list[reagent_id]
	if(global_reagent)
		description = "Add [amount] unit(s) of [global_reagent.name]"

		required_reagent_id = reagent_id
		group_identifier = reagent_id

		required_reagent_amount = amount
	else
		CRASH("/datum/cooking_with_jane/recipe_step/add/reagent/New(): Reagent [reagent_id] not found. Recipe: [our_recipe]")

	..(base_quality_award, our_recipe)


/datum/cooking_with_jane/recipe_step/add_reagent/check_conditions_met(var/reagent_id)
	if(reagent_id == required_reagent_id)
		return TRUE

/datum/cooking_with_jane/recipe_step/add_reagent/calculate_quality(var/amount)
	#ifdef JANEDEBUG
	var/quality = (base_quality_award - abs(amount - required_reagent_amount))
	log_debug("/datum/cooking_with_jane/recipe_step/calculate_quality(var/amount) returned quality of [quality]")
	#endif
	return min((base_quality_award - abs(amount - required_reagent_amount)), 0)
//-----------------------------------------------------------------------------------
//A cooking step that involves adding an item to the food. Is based on Item Type.
//This basically deletes the food used on it.
/datum/cooking_with_jane/recipe_step/add_item
	class = CWJ_CLASS_ADD_ITEM
	var/required_item_type

//item_type: The type path of the object we are looking for.
//base_quality_award: The quality awarded by following this step.
//our_recipe: The parent recipe object,
/datum/cooking_with_jane/recipe_step/add_item/New(var/item_type, var/base_quality_award, var/datum/cooking_with_jane/recipe/our_recipe)
	
	if(!ispath(item_type))
		log_debug("/datum/cooking_with_jane/recipe_step/add_item/New(): item [item_type] is not a valid path")
	
	var/example_item = new item_type()
	if(example_item)
		description = "Add \a [example_item] into the recipe."

		required_item_type = item_type
		group_identifier = item_type

		QDEL_NULL(example_item)
	else
		log_debug("/datum/cooking_with_jane/recipe_step/add_item/New(): item [item_type] couldn't be created.")
	
	..(base_quality_award, our_recipe)

//-----------------------------------------------------------------------------------
//A cooking step that involves using an item on the food.
/datum/cooking_with_jane/recipe_step/use_item
	class = CWJ_CLASS_USE_ITEM
	var/required_item_type

//item_type: The type path of the object we are looking for.
//base_quality_award: The quality awarded by following this step.
//our_recipe: The parent recipe object
/datum/cooking_with_jane/recipe_step/use_item/New(var/item_type, var/base_quality_award, var/datum/cooking_with_jane/recipe/our_recipe)
	
	if(!ispath(item_type))
		log_debug("/datum/cooking_with_jane/recipe_step/add_item/New(): item [item_type] is not a valid path")
	
	var/example_item = new item_type()
	if(example_item)
		description = "Apply \a [example_item]."

		required_item_type = item_type
		group_identifier = item_type

		QDEL_NULL(example_item)
	else
		log_debug("/datum/cooking_with_jane/recipe_step/add_item/New(): item [item_type] couldn't be created.")
	
	..(base_quality_award, our_recipe)