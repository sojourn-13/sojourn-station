
/*
* =================================================================================================
* Recipe Initialization
* =================================================================================================
* This function initializes all mutation recipes to be held in the global list "mutation_recipe_list",
* which is used for discovering if a given set of mutations can be used to create a new mutation.area
*
* Values in the list have a format of:
* mutation_recipe_list.[compare_string] = list(/datum/genetics/mutation_recipe/recipe_path)
*
* recipe_path- The type path of a given recipe.
* compare_string- 
* 	A concatinated list of mutation keys (created through list2params if there are multiple).
*	If the recipe is an Irradiation type, the compare_string is prepended with an 'I~'
*	If the recipe is an Combination type, the compare_string is prepended with an 'C~'
*/
/proc/initialize_mutation_recipes()
	//All combination path datums, save for the default recipes we don't want.
	var/list/recipe_paths = typesof(/datum/genetics/mutation_recipe)
	recipe_paths -= /datum/genetics/mutation_recipe
	recipe_paths -= /datum/genetics/mutation_recipe/combination
	recipe_paths -= /datum/genetics/mutation_recipe/irradiation
	for (var/path in recipe_paths)
		var/datum/genetics/mutation_recipe/example_recipe = new path()
		var/compare_string //string used to ask if a given recipe is valid.

		if(example_recipe.recipe_type == MUT_TYPE_COMBINATION)
			compare_string = "C~"
		else if(example_recipe.recipe_type == MUT_TYPE_IRRADIATON)
			compare_string = "I~"
		else if(!example_recipe.recipe_type)
			error("initialize_mutation_recipes(): Mutation recipe [example_recipe.type] created incorrectly- recipe type undefined.")
		else
			error("initialize_mutation_recipes(): Mutation recipe [example_recipe.type] created incorrectly- unexpected recipe type.")

		var/ingredient_mutations = example_recipe.required_mutations
		
		//We sort the list so that the compare string will be uniform for any given set of ingredients.
		if (example_recipe.required_mutations)
			if(istype(ingredient_mutations, /list))
				var/list/ingredient_mutations_sorted = ingredient_mutations
				sortList(ingredient_mutations_sorted)
				for (var/key in ingredient_mutations_sorted)
					compare_string = compare_string + "G~" + "[key]"
			else
				compare_string = compare_string + "G~" + ingredient_mutations
		
		//Add an 'M~' as a count for each clone mutation recipe required, so we don't have to compare carelessly.
		if(example_recipe.required_on_clone_types)
			var/ingredient_mobs = example_recipe.required_on_clone_types
			if(istype(ingredient_mobs, /list))
				var/list/ingredient_mobs_list = ingredient_mobs
				for (var/ingredient_mob in ingredient_mobs_list)
					compare_string = compare_string + "M~"
			else
				compare_string = compare_string + "M~"
		log_debug("initialize_mutation_recipes(): Loaded recipe [example_recipe] with string [compare_string]")
		if(!GLOB.mutation_recipe_list[compare_string])
			GLOB.mutation_recipe_list[compare_string] = list()
		GLOB.mutation_recipe_list[compare_string] += example_recipe

/*
* =================================================================================================
* Mutation Recipe Defines
* =================================================================================================
* Below are all the basic interactions and helper functions for mutation recipes, which control how
* mutations react when purposefully tampered with by scientists.
*/
/datum/genetics/mutation_recipe
	var/result_path = null //type path of the resulting Mutation
	
	var/required_mutations //String -or- list of KEYS for a given mutation. "Copy Mob" mutations should NOT be included in this list, and use required_copy_mob_types
	
	var/list/required_on_clone_types = null //Path -or- list of paths for comparing with incoming clone type mutations.
	
	var/recipe_type //Type of a given recipe, so we can differentiate between irradiation and clone type mutations.

	var/priority = 1 //Let's face it, we can make overlap by mistake. If two mutation recipes exist for a compare string, the valid recipe with the highest priority will win out.

//Default datums for combination type recipes
/datum/genetics/mutation_recipe/combination
	recipe_type = MUT_TYPE_COMBINATION

//Default datums for irradiation type recipes
/datum/genetics/mutation_recipe/irradiation
	recipe_type = MUT_TYPE_IRRADIATON

//A configurable path return, in case we want variation in result for children of the main recipe definition.
/datum/genetics/mutation_recipe/proc/get_result()
	if(ispath(result_path, /datum/genetics/mutation))
		var/datum/genetics/mutation/new_mutation = new result_path()
		return new_mutation
	log_debug("Mutation_Recipe.get_result(): Didn't find a mutation where we were looking; returned NOTHING instead")
	return null
