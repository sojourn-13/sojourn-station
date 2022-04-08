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
	parent = food_item
	
	
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
	var/datum/cooking_with_jane/recipe/target_recipe //The recipe we are following
	
	var/datum/cooking_with_jane/recipe_tracker/parent

	var/tracked_quality //The current level of quality within that recipe.

	var/list/possible_steps //A list detailing the next possible steps in a given recipe

	var/list/steps_taken //built over the course of following a recipe, tracks what has been done to the object.
