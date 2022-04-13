//Datum held by objects that is the core component in a recipe. 
//You use other items on an items with this datum to advance its recipe.
//Kept intentionally bare-bones because MANY of these objects are going to be made.
/datum/cooking_with_jane/recipe_tracker
	var/obj/holder //The parent object holding the recipe tracker.
	var/flags = 0
	//This variable is a little complicated.
	//It specifically references recipe_pointer objects each pointing to a different point in a different recipe. 
	var/list/active_recipe_pointers = null

/datum/cooking_with_jane/recipe_tracker/New(var/food_item)
	if(istype(food_item, /obj/item/reagent_containers/food/snacks/grown))
		flags |= CWJ_IS_PRODUCE
	holder = food_item
	src.generate_pointers()

//Generate recipe_pointer objects based on the global list
/datum/cooking_with_jane/recipe_tracker/proc/generate_pointers()
	//iterate through dictionary matching on holder type
	if(GLOB.cwj_recipe_dictionary[holder.type])
		for (key in GLOB.cwj_recipe_dictionary[holder.type])
			active_recipe_pointers += new /datum/cooking_with_jane/recipe_pointer/pointer(holder.type, key)
	
	//iterate through dictionary matching on plantnames.
	if(flags & CWJ_IS_PRODUCE && holder?:plantname && GLOB.cwj_recipe_dictionary[holder?:plantname])
		for (key in GLOB.cwj_recipe_dictionary[holder?:plantname])
			active_recipe_pointers += new /datum/cooking_with_jane/recipe_pointer/pointer(holder?:plantname, key)

//Check if a recipe tracker has recipes loaded.
/datum/cooking_with_jane/recipe_tracker/proc/has_recipes()
	return active_recipe_pointers.len

//===================================================================================


//Points to a specific step in a recipe while considering the optional paths that recipe can take.
/datum/cooking_with_jane/recipe_pointer
	var/datum/cooking_with_jane/recipe_step/current_step //The current step in the recipe we are following.
	
	var/datum/cooking_with_jane/recipe_tracker/parent

	var/tracked_quality //The current level of quality within that recipe.

	var/list/steps_taken //built over the course of following a recipe, tracks what has been done to the object. Format is unique_id:result

//A list returning the next possible steps in a given recipe
/datum/cooking_with_jane/recipe_pointer/get_possible_steps()
	if(steps_taken["[current_step.unique_id]"])
		#ifdef JANEDEBUG
		log_debug("/datum/cooking_with_jane/recipe_pointer/get_possible_steps(): tracked step already taken.")
		log_debug("Recipe name= [current_step.parent_recipe]")
		log_debug("Source Item= [parent.holder]")
		#endif
		return null
	if(!current_step)
		return null

	var/list/return_list = list(current_step)
	for(var/datum/cooking_with_jane/recipe_step/step in optional_step_list)
		if(!steps_taken["[step.unique_id]"])
			return_list += step
	
	return return_list

//TODO:
/datum/cooking_with_jane/recipe_pointer/pointer/New(start_type, recipe_id)