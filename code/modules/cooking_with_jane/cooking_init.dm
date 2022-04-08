/proc/initialize_cooking_recipes()
	//All combination path datums, save for the default recipes we don't want.
	var/list/recipe_paths = typesof(/datum/genetics/mutation_recipe)
	recipe_paths -= /datum/cooking_with_jane/recipe
	for (var/path in recipe_paths)
		var/datum/cooking_with_jane/recipe/example_recipe = new path()

		for(var/start_type in example_recipe.start_type_list)
			if(!GLOB.cwj_recipe_dictionary[start_type])
				GLOB.cwj_recipe_dictionary[start_type] = list()
			GLOB.cwj_recipe_dictionary[start_type]["[example_recipe.unique_id]"] = example_recipe
