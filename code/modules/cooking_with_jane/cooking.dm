

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

Ideally, if all optional steps are followed and all items are created

*/

//Datum held by objects that is the core component in a recipe. 
//You use other items on an items with this datum to advance its recipe.
//Kept intentionally bare-bones because MANY of these objects are going to be made.
/datum/cooking_with_jane/recipe_tracker
	var/obj/parent //The parent object holding the recipe tracker.	
	//This variable is a little complicated.
	//It specifically references recipe_pointer objects each pointing to a different point in a different recipe. 
	var/list/active_recipe_pointers = null


/datum/cooking_with_jane/recipe_tracker/New(var/food_item)
	parent = food_item
	recipe_quality = parent:food_quality

	//Generate pointers
	active_recipe_pointers = generate_pointers()

//Check if a recipe tracker has recipes loaded.
/datum/cooking_with_jane/recipe_tracker/proc/has_recipes()
	return active_recipe_pointers?TRUE:FALSE


//Points to a specific step in a recipe while considering the optional paths that recipe can take.
/datum/cooking_with_jane/recipe_pointer
	var/datum/cooking_with_jane/recipe/target_recipe //The recipe we are following
	
	var/tracked_quality //The current level of quality within that recipe.

	var/current_required_step //The next step in the given recipe.

	var/list/steps_taken //built over the course of following a recipe, tracks what has been done to the object.

//===================================================================================

/datum/cooking_with_jane/recipe
	var/name				//Name for the cooking guide. Auto-populates if not set.
	var/description			//Description for the cooking guide. Auto-populates if not set.
	var/recipe_icon			//Icon for the cooking guide. Auto-populates if not set.
	var/recipe_icon_state	//Icon state for the cooking guide. Auto-populates if not set.
	
	var/start_type //Type path for the first object in the recipe. An item of this type should have a recipe_tracker Datum.

	var/produce_type //Name path specifically for handling grown foods which have an obfuscated type path.

	var/product_type //Type path for the product created by the recipe. An item of this type should ALSO have a recipe_tracker Datum.

	var/quality_description //A decorator description tacked onto items when the recipe is completed. Used in future recipes. "The Bread looks Handmade."

	var/exclusive_option_mode = FALSE //triggers whether two steps in a process are exclusive- IE: you can do one or the other, but not both.

	var/option_chain_mode = FALSE //triggers whether two steps in a process are exclusive- IE: you can do one or the other, but not both.

	var/datum/cooking_with_jane/recipe_step/first_step //The first step in the linked list that will result in the final recipe

	var/datum/cooking_with_jane/recipe_step/last_required_step //Reference to the last required step in the cooking process.

	var/datum/cooking_with_jane/recipe_step/last_created_step //Reference to the last step made, regardless of if it was required or not.

/datum/cooking_with_jane/recipe/New()
	var/obj/product_info = new product_type()
	if(product_info)
		if(!name)
			name = product_info.name
		
		if(!description)
			description = product_info.description

		if(!(recipe_icon && recipe_icon_state))
			recipe_icon = product_info.icon
			recipe_icon_state = product_info.icon_state
	
	QDEL_NULL(product_info) //We don't need this anymore.
//-----------------------------------------------------------------------------------
//Add reagent step shortcut commands
/datum/cooking_with_jane/recipe/proc/create_step_add_reagent_optional( var/reagent_id, var/amount, var/base_quality_award)
	src.create_step_add_reagent(reagent_id, amount, base_quality_award, TRUE)

/datum/cooking_with_jane/recipe/proc/create_step_add_reagent_required( var/reagent_id, var/amount, var/base_quality_award)
	src.create_step_add_reagent(reagent_id, amount, base_quality_award, FALSE)

/datum/cooking_with_jane/recipe/proc/create_step_add_reagent( var/reagent_id, var/amount, var/base_quality_award, var/optional)
	var/datum/cooking_with_jane/recipe_step/add_reagent/step = new (base_quality_award, reagent_id, amount, src)
	src.add_step(step, optional)

//-----------------------------------------------------------------------------------
//Add item step shortcut commands
/datum/cooking_with_jane/recipe/proc/create_step_add_item_optional(var/item_type, var/base_quality_award)
	src.create_step_add_item(item_type, base_quality_award, TRUE)

/datum/cooking_with_jane/recipe/proc/create_step_add_item_required(var/item_type, var/base_quality_award)
	src.create_step_add_item(item_type, base_quality_award, FALSE)

/datum/cooking_with_jane/recipe/proc/create_step_add_item(var/item_type, var/base_quality_award, var/optional)
	var/datum/cooking_with_jane/recipe_step/add_item/step = new (base_quality_award, item_type, src)
	src.add_step(step, optional)
//-----------------------------------------------------------------------------------
//Use item step shortcut commands
/datum/cooking_with_jane/recipe/proc/create_step_use_item_optional(var/item_type, var/base_quality_award)
	src.create_step_use_item(item_type, base_quality_award, TRUE)

/datum/cooking_with_jane/recipe/proc/create_step_use_item_required(var/item_type, var/base_quality_award)
	src.create_step_use_item(item_type, base_quality_award, FALSE)

/datum/cooking_with_jane/recipe/proc/create_step_use_item(var/item_type, var/base_quality_award, var/optional)
	var/datum/cooking_with_jane/recipe_step/add_item/step = new (base_quality_award, item_type, src)
	src.add_step(step, optional)

//-----------------------------------------------------------------------------------
//Add a custom step to the cooking process not covered by the existing shortcuts.
//TODO
/datum/cooking_with_jane/recipe/proc/add_custom_step(var/step_type, var/base_quality_award, var/param_list, optional=FALSE)
	var/datum/cooking_with_jane/recipe_step/step = new step_type(base_quality_award, src)
	src.add_step(step, optional)

//-----------------------------------------------------------------------------------
//Setup for two options being exclusive to eachother.
//Performs a lot of internal checking to make sure that it doesn't break everything.
//If begin_exclusive_options is called, end_exclusive_options must eventually be called in order to close out and proceed to the next required step.
/datum/cooking_with_jane/recipe/proc/begin_exclusive_options()
	if(exclusive_option_mode)
		log_debug("/datum/cooking_with_jane/recipe/proc/end_exclusive_options: Exclusive option already active.")
		log_debug("Recipe name=[name].")
		return
	exclusive_option_mode = TRUE
	last_required_step.optional_step_list += list(list()) //Yes, we need to add a nested list here to get things going.

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

//-----------------------------------------------------------------------------------
//Setup for a chain of optional steps to be added that order themselves sequentially.
//Optional steps with branching paths is NOT supported.
//If begin_option_chain is called, end_option_chain must eventually be called in order to close out and proceed to the next required step.
/datum/cooking_with_jane/recipe/proc/begin_option_chain()
	if(option_chain_mode)
		log_debug("/datum/cooking_with_jane/recipe/proc/begin_option_chain: Option Chain already active.")
		log_debug("Recipe name=[name].")
		return
	option_chain_mode =TRUE

/datum/cooking_with_jane/recipe/proc/end_option_chain()
	if(!option_chain_mode)
		log_debug("/datum/cooking_with_jane/recipe/proc/begin_option_chain: Option Chain already inactive.")
		log_debug("Recipe name=[name].")
		return
	option_chain_mode =FALSE


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
			//Add the step to the list normally.
			if(!exclusive_option_mode)
				last_required_step.optional_step_list += step
			//Add the step to 'exclusive sublist' set up with exclusive options.
			else
				last_required_step.optional_step_list[last_required_step.optional_step_list.len] += step

			step.next_step = last_required_step
		else
			last_required_step.next_step = step
	step.previous_step = last_required_step
	if(!optional)
		last_required_step = step
	last_created_step = step

