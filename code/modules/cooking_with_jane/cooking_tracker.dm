//Datum held by objects that is the core component in a recipe.
//You use other items on an items with this datum to advance its recipe.
//Kept intentionally bare-bones because MANY of these objects are going to be made.
/datum/cooking_with_jane/recipe_tracker
	var/datum/weakref/holder_ref //The parent object holding the recipe tracker.
	var/step_flags //A collection of the classes of steps the recipe can take next.
	//This variable is a little complicated.
	//It specifically references recipe_pointer objects each pointing to a different point in a different recipe.
	var/list/active_recipe_pointers = null

	var/completion_lockout = FALSE //Freakin' cheaters...

/datum/cooking_with_jane/recipe_tracker/New(var/container)
	holder_ref = WEAKREF(container)
	src.generate_pointers()
	src.populate_step_flags()

//Generate recipe_pointer objects based on the global list
/datum/cooking_with_jane/recipe_tracker/proc/generate_pointers()
	var/obj/item/cooking_with_jane/cooking_container/container = holder_ref.resolve()
	//iterate through dictionary matching on holder type
	if(GLOB.cwj_recipe_dictionary[container.appliancetype])
		for (var/key in GLOB.cwj_recipe_dictionary[container.appliancetype])
			active_recipe_pointers += new /datum/cooking_with_jane/recipe_pointer/pointer(container.appliancetype, key, src)

//Generate next steps
/datum/cooking_with_jane/recipe_tracker/proc/get_step_options()
	var/list/options = list()
	for (var/datum/cooking_with_jane/recipe_pointer/pointer in active_recipe_pointers)
		options += pointer.get_possible_steps()
	return options


/datum/cooking_with_jane/recipe_tracker/proc/populate_step_flags()
	step_flags = 0
	for (var/datum/cooking_with_jane/recipe_pointer/pointer in active_recipe_pointers)
		step_flags |= pointer.get_step_flags()

//Check if a recipe tracker has recipes loaded.
/datum/cooking_with_jane/recipe_tracker/proc/has_recipes()
	return active_recipe_pointers.len

//Core function that checks if a object meets all the requirements for certain recipe actions.
/datum/cooking_with_jane/recipe_tracker/proc/process_item(var/obj/used_object)

	if(completion_lockout)
		return CWJ_LOCKOUT

	var/list/option_list = get_step_options()

	var/list/valid_steps = list()
	var/list/valid_unique_id_list = list()
	var/use_class
	for (var/datum/cooking_with_jane/recipe_step/step in option_list)
		if ((step_flags & CWJ_ADD_ITEM) && step.class == CWJ_ADD_ITEM)
			if (istype(used_object, /obj/item) && step.check_conditions_met(used_object))
				if(!valid_steps["Add Item"])
					valid_steps["Add Item"] = list()
				valid_steps["Add Item"]+= step

				if(!valid_unique_id_list["Add Item"])
					valid_unique_id_list["Add Item"] = list()
				valid_unique_id_list["Add Item"] += step.unique_id

				if(!use_class)
					use_class = "Add Item"

		if ((step_flags & CWJ_USE_ITEM) && step.class == CWJ_USE_ITEM)
			if (istype(used_object, /obj/item) && step.check_conditions_met(used_object))
				if(!valid_steps["Use Item"])
					valid_steps["Use Item"] = list()
				valid_steps["Use Item"]+= step

				if(!valid_unique_id_list["Use Item"])
					valid_unique_id_list["Use Item"] = list()
				valid_unique_id_list["Use Item"] += step.unique_id

				if(!use_class)
					use_class = "Use Item"

	//Other Check processes will go here!

	if(valid_steps.len == 0)
		return CWJ_NO_STEPS

	if(valid_steps.len > 1)
		completion_lockout = TRUE
		var/list/choice = input("There's two things you can do with this item!", "Choose One:") in valid_steps
		if(!choice)
			return CWJ_CHOICE_CANCEL
		use_class = choice

	valid_steps = valid_steps[use_class]
	valid_unique_id_list = valid_unique_id_list[use_class]

	//Call a proc that follows one of the steps in question, so we have all the nice to_chat calls.
	var/datum/cooking_with_jane/recipe_step/sample_step = valid_steps[1]
	sample_step.follow_step(src)


	//traverse and cull pointers
	var/list/completed_list = list()
	var/recipe_string = null
	for (var/datum/cooking_with_jane/recipe_pointer/pointer in active_recipe_pointers)
		var/used_id = null
		for (var/id in valid_unique_id_list)
			if (pointer.has_option_by_id(id))
				used_id = id
				break

		if (!used_id)
			active_recipe_pointers.Remove(pointer)
			qdel(pointer)
		else
			if(pointer.traverse(used_id))
				completed_list[pointer.current_recipe.name] += pointer
				if(!recipe_string)
					recipe_string = "\a [pointer.current_recipe.name]"
				else
					recipe_string += ", or \a [pointer.current_recipe.name]"

	//Choose to keep baking or finish now.
	if(completed_list && completed_list.len < active_recipe_pointers.len)
		if(alert("If you finish cooking now, you will create [recipe_string]. However, you feel there are possibilities beyond even this. Continue cooking anyways?",,"Yes","No") == "Yes")
			for (var/datum/cooking_with_jane/recipe_pointer/pointer in completed_list)
				active_recipe_pointers.Remove(pointer)
				completed_list[pointer.current_recipe.name]=null
				qdel(pointer)
			completed_list = list()

	//Check if we completed our recipe
	if(completed_list.len >= 1)
		if(completed_list.len > 1)
			completion_lockout = TRUE
			var/choice = input("There's two things you complete at this juncture!", "Choose One:") in completed_list
			if(choice)
				var/datum/cooking_with_jane/recipe_pointer/chosen_pointer = completed_list[choice]
				chosen_pointer.current_recipe.create_product(completed_list[choice])
			else
				var/datum/cooking_with_jane/recipe_pointer/chosen_pointer = completed_list[1]
				chosen_pointer.current_recipe.create_product(completed_list[1])
		else if(completed_list.len == 1)
			var/datum/cooking_with_jane/recipe_pointer/chosen_pointer = completed_list[1]
			chosen_pointer.current_recipe.create_product(completed_list[1])
		return CWJ_COMPLETE

	populate_step_flags()
	return CWJ_SUCCESS

//===================================================================================


//Points to a specific step in a recipe while considering the optional paths that recipe can take.
/datum/cooking_with_jane/recipe_pointer
	var/datum/cooking_with_jane/recipe/current_recipe //The recipe being followed here.
	var/datum/cooking_with_jane/recipe_step/current_step //The current step in the recipe we are following.

	var/datum/weakref/parent_ref

	var/tracked_quality = 0 //The current level of quality within that recipe.

	var/list/steps_taken = list() //built over the course of following a recipe, tracks what has been done to the object. Format is unique_id:result

//TODO:
/datum/cooking_with_jane/recipe_pointer/pointer/New(start_type, recipe_id, parent)
	parent_ref = WEAKREF(parent)
	var/datum/cooking_with_jane/recipe/our_recipe = GLOB.cwj_recipe_dictionary[start_type][recipe_id]
	current_step = our_recipe.first_step
	#ifdef CWJDEBUG
		steps_taken["[current_step.unique_id]"]="Started with a [start_type]"
	#endif

//A list returning the next possible steps in a given recipe
/datum/cooking_with_jane/recipe_pointer/proc/get_possible_steps()
	if(!current_step)
		log_debug("Recipe pointer in [current_recipe] has no current_step assigned?")

	if(!current_step.next_step)
		log_debug("Recipe pointer in [current_recipe] has no next step.")

	//Build a list of all possible steps while accounting for exclusive step relations.
	//Could be optimized, but keeps the amount of variables in the pointer low.
	var/list/return_list = list(current_step.next_step.unique_id)
	for(var/datum/cooking_with_jane/recipe_step/step in current_step.optional_step_list)

		if(steps_taken["[step.unique_id]"])
			//Traverse an option chain if one is present.
			if(step.flags & CWJ_IS_OPTION_CHAIN)
				var/datum/cooking_with_jane/recipe_step/option_chain_step = step.next_step
				while(option_chain_step.unique_id != current_step.unique_id)
					if(!steps_taken["[option_chain_step.unique_id]"])
						return_list += option_chain_step
						break
					option_chain_step = option_chain_step.next_step
			continue

		//Reference the global exclusion list to see if we can add this
		var/exclude_step = FALSE
		if(step.flags & CWJ_IS_EXCLUSIVE)
			for (var/id in GLOB.cwj_optional_step_exclusion_dictionary["[step.unique_id]"])
				//Reference the global exclusion list to see if any of the taken steps
				//Have the current step marked as exclusive.
				if(steps_taken["[id]"])
					exclude_step = TRUE
					break
		if(!exclude_step)
			return_list += step

	return return_list

//Get the classes of all applicable next-steps for a recipe in a bitmask.
/datum/cooking_with_jane/recipe_pointer/proc/get_step_flags()
	if(!current_step)
		log_debug("Recipe pointer in [current_recipe] has no current_step assigned?")

	if(!current_step.next_step)
		log_debug("Recipe pointer in [current_recipe] has no next step.")

	//Build a list of all possible steps while accounting for exclusive step relations.
	//Could be optimized, but keeps the amount of variables in the pointer low.
	var/return_flags = 0
	for(var/datum/cooking_with_jane/recipe_step/step in current_step.optional_step_list)

		if(steps_taken["[step.unique_id]"])
			//Traverse an option chain if one is present.
			if(step.flags & CWJ_IS_OPTION_CHAIN)
				var/datum/cooking_with_jane/recipe_step/option_chain_step = step.next_step
				while(option_chain_step.unique_id != current_step.unique_id)
					if(!steps_taken["[option_chain_step.unique_id]"])
						return_flags |= option_chain_step.class
						break
					option_chain_step = option_chain_step.next_step
			continue

		//Reference the global exclusion list to see if we can add this
		var/exclude_step = FALSE
		if(step.flags & CWJ_IS_EXCLUSIVE)
			for (var/id in GLOB.cwj_optional_step_exclusion_dictionary["[step.unique_id]"])
				//Reference the global exclusion list to see if any of the taken steps
				//Have the current step marked as exclusive.
				if(steps_taken["[id]"])
					exclude_step = TRUE
					break
		if(!exclude_step)
			return_flags |= step.class
	return return_flags

/datum/cooking_with_jane/recipe_pointer/proc/has_option_by_id(var/id)
	if(!GLOB.cwj_step_dictionary["[id]"])
		return FALSE
	var/datum/cooking_with_jane/recipe_step/active_step = GLOB.cwj_step_dictionary["[id]"]
	var/list/possible_steps = get_possible_steps()
	if(active_step in possible_steps)
		return TRUE
	return FALSE

/datum/cooking_with_jane/recipe_pointer/proc/traverse(var/id, var/obj/used_obj)
	if(!current_step.next_step)
		return TRUE

	if(!GLOB.cwj_step_dictionary["[id]"])
		return FALSE

	var/datum/cooking_with_jane/recipe_step/active_step = GLOB.cwj_step_dictionary["[id]"]

	if(!(active_step in get_possible_steps()))
		return FALSE

	steps_taken[id] = active_step.custom_result_desc
	if(active_step.flags & ~CWJ_IS_OPTIONAL)
		current_step = active_step

	tracked_quality += active_step.calculate_quality(used_obj)

	if(!current_step.next_step)
		return TRUE

	return FALSE

