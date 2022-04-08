

/*
COOKING WITH JANE - A comprehensive cooking rework.

The recipe datum outlines a list of steps from getting a piece of food from point A to point B.
Recipes have steps that are held in a modular linked list, holding required steps, and optional ones to increase the total quality of the food.
Following a recipe incorrectly (IE, adding too much of an item, having the burner too hot, etc.) Will decrease the quality of the food.area

Recipes have clear start and end points. They start with a particular item and end with a particular item. 

That said, a start item can follow multiple recipes until they eventually diverge as different steps are followed.

In the case two recipes have identical steps, the user should be prompted on what their intended result should be. (Donuts vs Bagels)

Recipes are loaded at startup. Food items reference it by the recipe_tracker datum

By following the steps correctly, good food can be made.

Food quality is calculated based on a mix between the incoming reagent and the quality of the steps taken.

*/

/datum/cooking_with_jane/recipe
	var/unique_id
	var/name				//Name for the cooking guide. Auto-populates if not set.
	var/description			//Description for the cooking guide. Auto-populates if not set.
	var/recipe_icon			//Icon for the cooking guide. Auto-populates if not set.
	var/recipe_icon_state	//Icon state for the cooking guide. Auto-populates if not set.
	
	//String/Type path for potential starting object types in the recipe.
	//If a child of a type is also applicable, it MUST BE ADDED HERE.
	var/start_type_list = list() 

	var/product_type //Type path for the product created by the recipe. An item of this type should ALSO have a recipe_tracker Datum.

	var/quality_description //A decorator description tacked onto items when the recipe is completed. Used in future recipes. "The Bread looks Handmade."

	var/exclusive_option_mode = FALSE //triggers whether two steps in a process are exclusive- IE: you can do one or the other, but not both.

	var/active_exclusive_option_list = NULL //Only needed during the creation process for tracking a given exclusive option dictionary.

	var/option_chain_mode = 0 //triggers whether two steps in a process are exclusive- IE: you can do one or the other, but not both.

	var/active_exclusive_option_chain //Only needed during the creation process for tracking items in an option chain.

	var/datum/cooking_with_jane/recipe_step/first_step //The first step in the linked list that will result in the final recipe

	var/datum/cooking_with_jane/recipe_step/last_required_step //Reference to the last required step in the cooking process.

	var/datum/cooking_with_jane/recipe_step/last_created_step //Reference to the last step made, regardless of if it was required or not.

/datum/cooking_with_jane/recipe/New()

	if(exclusive_option_mode)
		CRASH("/datum/cooking_with_jane/recipe/New: Exclusive option active at end of recipe creation process. Recipe name=[name].")
	
	if(option_chain_mode)
		CRASH("/datum/cooking_with_jane/recipe/New: Option Chain active at end of recipe creation process. Recipe name=[name].")
		
	var/obj/product_info = new product_type()
	if(product_info)
		if(!name)
			name = product_info.name
		
		if(!description)
			description = product_info.description

		if(!(recipe_icon && recipe_icon_state))
			recipe_icon = product_info.icon
			recipe_icon_state = product_info.icon_state
	
	unique_id = sequential_id(type)
	
	QDEL_NULL(product_info) //We don't need this anymore.
//-----------------------------------------------------------------------------------
//Commands for interacting with the recipe tracker


//-----------------------------------------------------------------------------------
//Add reagent step shortcut commands
/datum/cooking_with_jane/recipe/proc/create_step_add_reagent_optional( var/reagent_id, var/amount, var/base_quality_award)
	return src.create_step_add_reagent(reagent_id, amount, base_quality_award, TRUE)

/datum/cooking_with_jane/recipe/proc/create_step_add_reagent_required( var/reagent_id, var/amount, var/base_quality_award)
	return src.create_step_add_reagent(reagent_id, amount, base_quality_award, FALSE)

/datum/cooking_with_jane/recipe/proc/create_step_add_reagent( var/reagent_id, var/amount, var/base_quality_award, var/optional)
	var/datum/cooking_with_jane/recipe_step/add_reagent/step = new (base_quality_award, reagent_id, amount, src)
	return src.add_step(step, optional)

//-----------------------------------------------------------------------------------
//Add item step shortcut commands
/datum/cooking_with_jane/recipe/proc/create_step_add_item_optional(var/item_type, var/base_quality_award)
	return src.create_step_add_item(item_type, base_quality_award, TRUE)

/datum/cooking_with_jane/recipe/proc/create_step_add_item_required(var/item_type, var/base_quality_award)
	return src.create_step_add_item(item_type, base_quality_award, FALSE)

/datum/cooking_with_jane/recipe/proc/create_step_add_item(var/item_type, var/base_quality_award, var/optional)
	var/datum/cooking_with_jane/recipe_step/add_item/step = new (base_quality_award, item_type, src)
	return src.add_step(step, optional)
//-----------------------------------------------------------------------------------
//Use item step shortcut commands
/datum/cooking_with_jane/recipe/proc/create_step_use_item_optional(var/item_type, var/base_quality_award)
	return src.create_step_use_item(item_type, base_quality_award, TRUE)

/datum/cooking_with_jane/recipe/proc/create_step_use_item_required(var/item_type, var/base_quality_award)
	return src.create_step_use_item(item_type, base_quality_award, FALSE)

/datum/cooking_with_jane/recipe/proc/create_step_use_item(var/item_type, var/base_quality_award, var/optional)
	var/datum/cooking_with_jane/recipe_step/add_item/step = new (base_quality_award, item_type, src)
	return src.add_step(step, optional)

//-----------------------------------------------------------------------------------
//Customize the last step created
/datum/cooking_with_jane/recipe/proc/set_step_desc(var/new_description)
	last_created_step.desc = new_description

/datum/cooking_with_jane/recipe/proc/set_step_max_quality(var/quality)
	last_created_step.max_quality_awarded = quality

/datum/cooking_with_jane/recipe/proc/set_step_base_quality(var/quality)
	last_created_step.base_quality_awarded = quality
//-----------------------------------------------------------------------------------
//Add a custom step to the cooking process not covered by the existing shortcuts.
//TODO
/datum/cooking_with_jane/recipe/proc/add_custom_step()
	//var/step_type, var/base_quality_award, var/param_list, optional=FALSE
	var/datum/cooking_with_jane/recipe_step/step = new step_type(base_quality_award, src)
	return src.add_step(step, optional)

//-----------------------------------------------------------------------------------
//Setup for two options being exclusive to eachother.
//Performs a lot of internal checking to make sure that it doesn't break everything.
//If begin_exclusive_options is called, end_exclusive_options must eventually be called in order to close out and proceed to the next required step.

/datum/cooking_with_jane/recipe/proc/begin_exclusive_options()
	if(exclusive_option_mode)
		log_debug("/datum/cooking_with_jane/recipe/proc/begin_exclusive_options: Exclusive option already active.")
		log_debug("Recipe name=[name].")
		return
	else if(!first_step)
		CRASH("/datum/cooking_with_jane/recipe/proc/begin_exclusive_options: Exclusive list cannot be active before the first required step is defined. Recipe name=[name].")
		return
	exclusive_option_mode = TRUE
	active_exclusive_option_list = list()

/datum/cooking_with_jane/recipe/proc/end_exclusive_options()
	if(!exclusive_option_mode)
		log_debug("/datum/cooking_with_jane/recipe/proc/end_exclusive_options: Exclusive option already inactive.")
		log_debug("Recipe name=[name].")
		return
	else if(last_required_step.optional_step_list[last_required_step.optional_step_list.len]?:len == 0)
		CRASH("/datum/cooking_with_jane/recipe/proc/end_exclusive_options: Exclusive option list ended with no values added. Recipe name=[name].")
		return
	else if(option_chain_mode)
		CRASH("/datum/cooking_with_jane/recipe/proc/end_exclusive_options: Exclusive option cannot end while option chain is active. Recipe name=[name].")
	
	exclusive_option_mode = FALSE

	//Flatten exclusive options into the global list for easy referencing later.
	for (var/datum/cooking_with_jane/recipe_step/exclusive_option in exclusive_option_list)
		if(!GLOB.cwj_optional_step_exclusion_dictionary[exclusive_option.unique_id])
			GLOB.cwj_optional_step_exclusion_dictionary[exclusive_option.unique_id] = list()
		for(var/datum/cooking_with_jane/recipe_step/excluder in exclusive_option_list[exclusive_option])
			GLOB.cwj_optional_step_exclusion_dictionary[exclusive_option.unique_id] += excluder.unique_id


	active_exclusive_option_list = NULL

//-----------------------------------------------------------------------------------
//Setup for a chain of optional steps to be added that order themselves sequentially.
//Optional steps with branching paths is NOT supported.
//If begin_option_chain is called, end_option_chain must eventually be called in order to close out and proceed to the next required step.
/datum/cooking_with_jane/recipe/proc/begin_option_chain()
	if(option_chain_mode)
		log_debug("/datum/cooking_with_jane/recipe/proc/begin_option_chain: Option Chain already active.")
		log_debug("Recipe name=[name].")
		return
	if(!first_step)
		CRASH("/datum/cooking_with_jane/recipe/proc/begin_option_chain: Option Chain cannot be active before first required step is defined. Recipe name=[name].")
	option_chain_mode =1

/datum/cooking_with_jane/recipe/proc/end_option_chain()
	if(!option_chain_mode)
		log_debug("/datum/cooking_with_jane/recipe/proc/end_option_chain: Option Chain already inactive.")
		log_debug("Recipe name=[name].")
		return
	option_chain_mode = 0


//-----------------------------------------------------------------------------------
//Function that dynamically adds a step into a given recipe matrix.
/datum/cooking_with_jane/recipe/proc/add_step(var/datum/cooking_with_jane/recipe_step/step, var/optional)
	
	//Required steps can't have exclusive options. 
	//If a given recipe needs to split into two branching required steps, it should be split into two different recipes.
	if(!optional && exclusive_option_mode)
		CRASH("/datum/cooking_with_jane/recipe/proc/add_step: Required step added while exclusive option mode is on. Recipe name=[name].")
	
	if(!optional && option_chain_mode)
		CRASH("/datum/cooking_with_jane/recipe/proc/add_step: Required step added while option chain mode is on. Recipe name=[name].")

	if(!first_step)
		if(optional)
			log_debug("/datum/cooking_with_jane/recipe/proc/add_step_reagent: The first step in a recipe cannot be optional. Skipping.")
			log_debug("Recipe name=[name].")
			return
		first_step = step
	else
		if(optional)
			switch(option_chain_mode)
				//When the chain needs to be initialized
				if(1)
					last_required_step.optional_step_list += step
					option_chain_mode = 2
					step.is_option_chain = TRUE
				//When the chain has already started.
				if(2)
					last_created_step.next_step = step
					step.is_option_chain = TRUE
				//Add the step to the optional_step_list list normally.
				else
					last_required_step.optional_step_list += step
			//Set the next step to loop back to the step it branched from.
			step.next_step = last_required_step
		else
			last_required_step.next_step = step

		
	
	//populate the previous step for optional backwards pathing.
	if(option_chain_mode)
		step.previous_step = last_created_step
	else
		step.previous_step = last_required_step

	//Update flags
	if(!optional)
		last_required_step.flags &= ~CWJ_IS_LAST_STEP
		step.flags |= CWJ_IS_LAST_STEP
	else
		step.flags |= CWJ_IS_OPTIONAL
		if(exclusive_option_mode)
			step.flags |= CWJ_IS_EXCLUSIVE
		if(option_chain_mode)
			step.flags |= CWJ_IS_OPTION_CHAIN

	if(!optional)		
		last_required_step = step
		
	last_created_step = step

	//Handle exclusive options
	if(exclusive_option_mode)
		active_exclusive_option_list[step] = list()
		for (var/datum/cooking_with_jane/recipe_step/ex_step in active_exclusive_option_list)
			if(ex_step == step.unique_id || step.in_option_chain(ex_step))
				continue			
			active_exclusive_option_list[ex_step] += step
	return step
//-----------------------------------------------------------------------------------
//placeholder function for creating a product
/datum/cooking_with_jane/recipe/proc/create_product(var/datum/cooking_with_jane/recipe_pointer)
	return new product_type(recipe_pointer.parent.holder.get_turf())