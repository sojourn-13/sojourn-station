

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
/datum/cooking_with_jane/recipe_tracker
	var/obj/parent //The parent object holding the recipe tracker.
	
	//This variable is a little complicated.
	//It specifically references recipe_pointer objects each pointing to a different point in a different recipe. 
	var/list/active_recipe_pointers = null

	var/recipe_quality

/datum/cooking_with_jane/recipe_tracker/New(var/food_item)
	parent = food_item
	recipe_quality = parent:food_quality

	//Generate pointers
	active_recipe_pointers = generate_pointers()

//Check if a recipe tracker has recipes loaded.
/datum/cooking_with_jane/recipe_tracker/proc/has_recipes()
	return active_recipe_pointers?TRUE:FALSE


//Points to a specific step in a recipe while considering the optional paths that recipe can take.
/datum/cooking_with_jane/recipe_tracker




/datum/cooking_with_jane/recipe
	var/name				//Name for the cooking guide. Auto-populates if not set.
	var/description			//Description for the cooking guide. Auto-populates if not set.
	var/recipe_icon			//Icon for the cooking guide. Auto-populates if not set.
	var/recipe_icon_state	//Icon state for the cooking guide. Auto-populates if not set.
	
	var/start_type //Type path for the first object in the recipe. An item of this type should have a recipe_tracker Datum.

	var/product_type //Type path for the product created by the recipe. An item of this type should ALSO have a recipe_tracker Datum.

	var/quality_description //A decorator description tacked onto items when the recipe is completed. Used in future recipes. "The Bread looks Handmade."

	var/datum/cooking_with_jane/recipe_step/first_step //The first step in the linked list that will result in the final recipe

	var/datum/cooking_with_jane/recipe_step/last_required_step //Reference to the last step made that was required

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

/datum/cooking_with_jane/recipe/proc/add_step(var/datum/cooking_with_jane/recipe_step/step, var/optional)
	if(!first_step)
		if(optional)
			log_debug("/datum/cooking_with_jane/recipe/proc/add_step_reagent: optional step added before required step. Skipping.")
			return
		first_step = step
	else
		if(optional)
			last_required_step.optional_step_list += step
			step.next_step = last_required_step
		else
			last_required_step.next_step = step
	step.previous_step = last_required_step
	if(!optional)
		last_required_step = step
	last_created_step = step

//A step in a recipe, whether optional or required
/datum/cooking_with_jane/recipe_step
	var/class //The classificaiton of the step involved.

	var/parent_recipe //The parent recipe of this particular step. Created on initialization with New()

	var/description	//A description of the step
	
	var/recipe_position	//The location of the step in a given recipe. Links up directly to step_list
	
	var/is_last_step = TRUE //Marker to determine if a given step is the last step of the recipe process.
	
	var/list/optional_step_list = null //List of optional steps that can be followed from this point forward.

	var/max_quality_awarded = 0 //The maximum quality awarded by following a given step to the letter.

	//The next required step for the parent recipe
	var/datum/cooking_with_jane/recipe_step/next_step

	//The previous required step for the current recipe
	var/datum/cooking_with_jane/recipe_step/previous_step

/datum/cooking_with_jane/recipe_step/New(var/base_quality_award, var/quality_description, var/datum/cooking_with_jane/recipe/our_recipe)
	parent_recipe = our_recipe
	base_quality_award = base_quality_award

//Calculate how well the recipe step was followed to the letter.
/datum/cooking_with_jane/recipe_step/proc/calculate_quality()
	return max_quality_awarded

//Check if the conditions of a recipe step was followed correctly.
/datum/cooking_with_jane/recipe_step/proc/check_conditions_met()
	return TRUE



