

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

	//The Cooking container the recipe is performed in.
	var/cooking_container = null

	var/product_type //Type path for the product created by the recipe. An item of this type should ALSO have a recipe_tracker Datum.

	var/product_count = 1 //how much of a thing is made per case of the recipe being followed.

	var/quality_description //A decorator description tacked onto items when the recipe is completed. Used in future recipes. "The Bread looks Handmade."

	var/exclusive_option_mode = FALSE //triggers whether two steps in a process are exclusive- IE: you can do one or the other, but not both.

	var/active_exclusive_option_list = null //Only needed during the creation process for tracking a given exclusive option dictionary.

	var/option_chain_mode = 0 //triggers whether two steps in a process are exclusive- IE: you can do one or the other, but not both.

	var/active_exclusive_option_chain //Only needed during the creation process for tracking items in an option chain.

	/*
		The Step Builder is iterated through to create new steps in the recipe dynamically.
		_OPTIONAL steps are linked to the previously made REQUIRED step
		CWJ_BEGIN steps must eventually terminate in a matching CWJ_END step
	*/
	var/list/step_builder = null

	var/datum/cooking_with_jane/recipe_step/first_step //The first step in the linked list that will result in the final recipe

	var/datum/cooking_with_jane/recipe_step/last_required_step //Reference to the last required step in the cooking process.

	var/datum/cooking_with_jane/recipe_step/last_created_step //Reference to the last step made, regardless of if it was required or not.

/datum/cooking_with_jane/recipe/New()
	build_steps()
	if(ispath(product_type))
		var/obj/item/product_info = new product_type()
		if(!name)
			name = product_info.name

		if(!description)
			description = product_info.desc

		if(!(recipe_icon && recipe_icon_state))
			recipe_icon = product_info.icon
			recipe_icon_state = product_info.icon_state
		QDEL_NULL(product_info) //We don't need this anymore.
	unique_id = sequential_id("recipe")

//Build out the recipe steps for a recipe, based on the step_builder list
/datum/cooking_with_jane/recipe/proc/build_steps()
	if(!step_builder)
		CRASH("/datum/cooking_with_jane/recipe/New: Recipe has no step builder defined! Recipe path=[src.type].")

	if(!cooking_container)
		CRASH("/datum/cooking_with_jane/recipe/New: Recipe has no cooking container defined! Recipe path=[src.type].")

	//Create a base step
	create_step_base()

	for (var/list/step in step_builder)
		if(islist(step) && step.len >= 1)
			var/reason = ""
			switch(step[1])
				if(CWJ_ADD_ITEM)
					if(step.len < 2)
						reason="Bad argument Length for CWJ_ADD_ITEM"
					else if(!ispath(step[2]))
						reason="Bad argument type for CWJ_ADD_ITEM at arg 2"
					else
						create_step_add_item(step[2], FALSE)
				if(CWJ_ADD_ITEM_OPTIONAL)
					if(step.len < 2)
						reason="Bad argument Length for CWJ_ADD_ITEM_OPTIONAL"
					else if(!ispath(step[2]))
						reason="Bad argument type for CWJ_ADD_ITEM_OPTIONAL at arg 2"
					else
						create_step_add_item(step[2], TRUE)
				if(CWJ_ADD_REAGENT)
					if(step.len < 3)
						reason="Bad argument Length for CWJ_ADD_REAGENT"
					else if(!is_reagent_with_id_exist(step[2]))
						reason="Bad reagent type for CWJ_ADD_REAGENT at arg 2"
					else
						create_step_add_item(step[2], step[3], FALSE)
				if(CWJ_ADD_REAGENT_OPTIONAL)
					if(step.len < 3)
						reason="Bad argument Length for CWJ_ADD_REAGENT_OPTIONAL"
					else if(!is_reagent_with_id_exist(step[2]))
						reason="Bad reagent type for CWJ_ADD_REAGENT_OPTIONAL at arg 2"
					else
						create_step_add_item(step[2], step[3], TRUE)
				if(CWJ_USE_ITEM)
					if(step.len < 2)
						reason="Bad argument Length for CWJ_USE_ITEM"
					else if(!ispath(step[2]))
						reason="Bad argument type for CWJ_USE_ITEM at arg 2"
					else
						create_step_use_item(step[2], FALSE)
				if(CWJ_USE_ITEM_OPTIONAL)
					if(step.len < 2)
						reason="Bad argument Length for CWJ_USE_ITEM_OPTIONAL"
					else if(!ispath(step[2]))
						reason="Bad argument type for CWJ_USE_ITEM_OPTIONAL at arg 2"
					else
						create_step_use_item(step[2], TRUE)
				if(CWJ_ADD_PRODUCE)
					if(step.len < 2)
						reason="Bad argument Length for CWJ_ADD_PRODUCE"
					else
						create_step_add_produce(step[2], FALSE)
				if(CWJ_ADD_PRODUCE_OPTIONAL)
					if(step.len < 2)
						reason="Bad argument Length for CWJ_ADD_PRODUCE_OPTIONAL"
					else
						create_step_add_produce(step[2], TRUE)

			//Named Arguments modify the recipe in fixed ways
			if("desc" in step)
				set_step_desc(step["desc"])

			if("base" in step)
				set_step_base_quality(step["base"])

			if("max" in step)
				set_step_max_quality(step["max"])

			if("result_desc" in step)
				set_step_custom_result_desc(step["result_desc"])

			if("qmod" in step)
				if(!set_inherited_quality_modifier(step["qmod"]))
					reason="qmod / inherited_quality_modifier declared on non add-item recipe step."

			if("exact" in step)
				if(!set_exact_type_required(step["exact"]))
					reason="exact / exact type match declared on non add-item / use-item recipe step."

			if(reason)
				CRASH("[src.type]/New: Step Builder failed. Reason: [reason]")
		else
			switch(step)
				if(CWJ_BEGIN_EXCLUSIVE_OPTIONS)
					begin_exclusive_options()
				if(CWJ_END_EXCLUSIVE_OPTIONS)
					end_exclusive_options()
				if(CWJ_BEGIN_OPTION_CHAIN)
					begin_option_chain()
				if(CWJ_END_OPTION_CHAIN)
					end_option_chain()

	if(exclusive_option_mode)
		CRASH("/datum/cooking_with_jane/recipe/New: Exclusive option active at end of recipe creation process. Recipe name=[name].")

	if(option_chain_mode)
		CRASH("/datum/cooking_with_jane/recipe/New: Option Chain active at end of recipe creation process. Recipe name=[name].")

	if(last_created_step.flags & CWJ_IS_OPTIONAL)
		CRASH("/datum/cooking_with_jane/recipe/New: Last option in builder is optional. It must be a required step! Recipe name=[name].")

//-----------------------------------------------------------------------------------
//Commands for interacting with the recipe tracker
//-----------------------------------------------------------------------------------
//Add base step command. All other steps stem from this. Don't call twice!
/datum/cooking_with_jane/recipe/proc/create_step_base()
	var/datum/cooking_with_jane/recipe_step/start/step = new /datum/cooking_with_jane/recipe_step(cooking_container)
	last_required_step = step
	last_created_step = step
	first_step = step

//-----------------------------------------------------------------------------------
//Add reagent step shortcut commands
/datum/cooking_with_jane/recipe/proc/create_step_add_reagent(var/reagent_id, var/amount, var/optional)
	var/datum/cooking_with_jane/recipe_step/add_reagent/step = new (reagent_id, amount, src)
	return src.add_step(step, optional)

//-----------------------------------------------------------------------------------
//Add item step shortcut commands
/datum/cooking_with_jane/recipe/proc/create_step_add_item(var/item_type, var/optional)
	var/datum/cooking_with_jane/recipe_step/add_item/step = new (item_type, src)
	return src.add_step(step, optional)
//-----------------------------------------------------------------------------------
//Use item step shortcut commands
/datum/cooking_with_jane/recipe/proc/create_step_use_item(var/item_type, var/optional)
	var/datum/cooking_with_jane/recipe_step/use_item/step = new (item_type, src)
	return src.add_step(step, optional)

//-----------------------------------------------------------------------------------
//Use item step shortcut commands
/datum/cooking_with_jane/recipe/proc/create_step_add_produce(var/produce, var/optional)
	log_debug("Creating Produce: [produce]")
	var/datum/cooking_with_jane/recipe_step/add_produce/step = new /datum/cooking_with_jane/recipe_step/add_produce(produce, src)
	return src.add_step(step, optional)

//-----------------------------------------------------------------------------------
//Customize the last step created
/datum/cooking_with_jane/recipe/proc/set_step_desc(var/new_description)
	last_created_step.desc = new_description

/datum/cooking_with_jane/recipe/proc/set_step_max_quality(var/quality)
	last_created_step.flags |= CWJ_BASE_QUALITY_ENABLED
	last_created_step.max_quality_award = quality

/datum/cooking_with_jane/recipe/proc/set_step_base_quality(var/quality)
	last_created_step.flags |= CWJ_MAX_QUALITY_ENABLED
	last_created_step.base_quality_award = quality

/datum/cooking_with_jane/recipe/proc/set_step_custom_result_desc(var/new_description)
	last_created_step.custom_result_desc = new_description


/datum/cooking_with_jane/recipe/proc/set_exact_type_required(var/boolean)
	if((last_created_step.class & CWJ_ADD_ITEM) || (last_created_step.class & CWJ_USE_ITEM))
		last_created_step?:exact_path = boolean
		return TRUE
	else
		return FALSE

/datum/cooking_with_jane/recipe/proc/set_inherited_quality_modifier(var/modifier)
	if(last_created_step.class & CWJ_ADD_ITEM)
		last_created_step?:inherited_quality_modifier = modifier
		return TRUE
	else
		return FALSE
//-----------------------------------------------------------------------------------
//Add a custom step to the cooking process not covered by the existing shortcuts.
//TODO
/*
/datum/cooking_with_jane/recipe/proc/add_custom_step(var/step_type, paramlist)
	//var/step_type, var/base_quality_award, var/param_list, optional=FALSE
	var/datum/cooking_with_jane/recipe_step/step = new step_type(src)
	return src.add_step(step, optional)
*/
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
	exclusive_option_mode = TRUE
	active_exclusive_option_list = list()

/datum/cooking_with_jane/recipe/proc/end_exclusive_options()
	if(!exclusive_option_mode)
		log_debug("/datum/cooking_with_jane/recipe/proc/end_exclusive_options: Exclusive option already inactive.")
		log_debug("Recipe name=[name].")
		return
	else if(last_required_step.optional_step_list[last_required_step.optional_step_list.len]?:len == 0)
		CRASH("/datum/cooking_with_jane/recipe/proc/end_exclusive_options: Exclusive option list ended with no values added. Recipe name=[name].")
	else if(option_chain_mode)
		CRASH("/datum/cooking_with_jane/recipe/proc/end_exclusive_options: Exclusive option cannot end while option chain is active. Recipe name=[name].")

	exclusive_option_mode = FALSE

	//Flatten exclusive options into the global list for easy referencing later.
	//initiate the exclusive option list
	for (var/datum/cooking_with_jane/recipe_step/exclusive_option in active_exclusive_option_list)
		if (!GLOB.cwj_optional_step_exclusion_dictionary["[exclusive_option.unique_id]"])
			GLOB.cwj_optional_step_exclusion_dictionary["[exclusive_option.unique_id]"] = list()
	//populate the exclusive option list
	for (var/datum/cooking_with_jane/recipe_step/exclusive_option in active_exclusive_option_list)
		for (var/datum/cooking_with_jane/recipe_step/excluder in active_exclusive_option_list["[exclusive_option]"])
			if (exclusive_option.unique_id != excluder.unique_id)
				GLOB.cwj_optional_step_exclusion_dictionary["[exclusive_option.unique_id]"] = excluder.unique_id

	active_exclusive_option_list = null

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


	if(optional)
		switch(option_chain_mode)
			//When the chain needs to be initialized
			if(1)
				last_required_step.optional_step_list += step
				option_chain_mode = 2
				step.flags |= CWJ_IS_OPTION_CHAIN
			//When the chain has already started.
			if(2)
				last_created_step.next_step = step
				step.flags |= CWJ_IS_OPTION_CHAIN
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
//default function for creating a product
/datum/cooking_with_jane/recipe/proc/create_product(var/datum/cooking_with_jane/recipe_pointer/pointer)
	var/datum/cooking_with_jane/recipe_tracker/parent = pointer.parent_ref.resolve()
	var/obj/item/container = parent.holder_ref.resolve()
	if(container)
		//Purge the contents of the container we no longer need it
		QDEL_NULL_LIST(container.contents)
		container.contents = list()

		//TODO: Purge reagents in the container.

		for(var/i = 0; i < product_count; i++)
			new product_type(container)

//-----------------------------------------------------------------------------------
/datum/cooking_with_jane/proc/get_class_string(var/code)
	switch(code)
		if(CWJ_ADD_ITEM)
			return "Add Item"
		if(CWJ_USE_ITEM)
			return "Use Item"
		if(CWJ_ADD_REAGENT)
			return "Add Reagent"
		if(CWJ_ADD_PRODUCE)
			return "Add Produce"
		if(CWJ_USE_APPLIANCE)
			return "Use Appliance"
		if(CWJ_USE_OTHER)
			return "Custom Action"
		if(CWJ_START)
			return "Placeholder Action"