//A step in a recipe, whether optional or required
/datum/cooking_with_jane/recipe_step
	var/unique_id //Special ID for a given recipe, allows for referencing later by food objects to save on memory.

	var/class = CWJ_USE_OTHER //The classificaiton of the step involved.

	var/group_identifier = "None" //Different for every type of recipe.

	var/parent_recipe //The parent recipe of this particular step. Created on initialization with New()

	var/desc		//A description of the step

	var/custom_result_desc //A custom description of the resulting quality on a successful completion.

	var/list/optional_step_list = list() //List of optional steps that can be followed from this point forward.

	var/max_quality_award = 0 //The maximum quality awarded by following a given step to the letter.

	var/base_quality_award = 0

	var/flags = 0

	var/is_optional = FALSE

	//The next required step for the parent recipe
	var/datum/cooking_with_jane/recipe_step/next_step

	//The previous required step for the current recipe
	var/datum/cooking_with_jane/recipe_step/previous_step

/datum/cooking_with_jane/recipe_step/New(var/datum/cooking_with_jane/recipe/our_recipe)
	parent_recipe = our_recipe
	unique_id = sequential_id("recipe_step")

	//Add the recipe to our dictionary for future reference.
	if(!GLOB.cwj_step_dictionary_ordered[class])
		GLOB.cwj_step_dictionary_ordered[class] = list()
	if(!GLOB.cwj_step_dictionary_ordered[class][group_identifier])
		GLOB.cwj_step_dictionary_ordered[class][group_identifier] = list()
	GLOB.cwj_step_dictionary_ordered[class][group_identifier]["[unique_id]"] = src
	GLOB.cwj_step_dictionary["[unique_id]"] = src

//Calculate how well the recipe step was followed to the letter.
/datum/cooking_with_jane/recipe_step/proc/calculate_quality()
	return 0

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
/datum/cooking_with_jane/recipe_step/proc/clamp_quality(var/raw_quality)
	if((flags & CWJ_BASE_QUALITY_ENABLED) && (flags & CWJ_MAX_QUALITY_ENABLED))
		return CLAMP(raw_quality, base_quality_award, max_quality_award)
	if(flags & CWJ_BASE_QUALITY_ENABLED)
		return max(raw_quality, base_quality_award)
	if(flags & CWJ_MAX_QUALITY_ENABLED)
		return min(raw_quality, max_quality_award)
	return raw_quality

/datum/cooking_with_jane/recipe_step/proc/follow_step()
	return

//-----------------------------------------------------------------------------------
//The default starting step.
//Doesn't do anything, just holds the item.

/datum/cooking_with_jane/recipe_step/start
	class = CWJ_START
	var/required_container

/datum/cooking_with_jane/recipe_step/start/New(var/container)
	required_container = container




//-----------------------------------------------------------------------------------
//A cooking step that involves adding an item to the food. Is based on Item Type.
//This basically deletes the food used on it.

//ENSURE THE INCOMING ITEM HAS var/quality DEFINED!
/datum/cooking_with_jane/recipe_step/add_item
	class = CWJ_ADD_ITEM

	var/required_item_type //Item required for the recipe step

	var/inherited_quality_modifier = 1 //The modifier we apply multiplicatively to balance quality scaling across recipes.

	var/exact_path = FALSE //Tests if the item has to be the EXACT ITEM PATH, or just a child of the item path.

//item_type: The type path of the object we are looking for.
//our_recipe: The parent recipe object,
/datum/cooking_with_jane/recipe_step/add_item/New(var/item_type, var/datum/cooking_with_jane/recipe/our_recipe)

	if(!ispath(item_type))
		log_debug("/datum/cooking_with_jane/recipe_step/add_item/New(): item [item_type] is not a valid path")

	var/example_item = new item_type()
	if(example_item)
		desc = "Add \a [example_item] into the recipe."

		required_item_type = item_type
		group_identifier = item_type

		QDEL_NULL(example_item)
	else
		log_debug("/datum/cooking_with_jane/recipe_step/add_item/New(): item [item_type] couldn't be created.")

	..(our_recipe)


/datum/cooking_with_jane/recipe_step/add_item/check_conditions_met(var/obj/added_item)
	if(exact_path)
		if(added_item.type == required_item_type)
			return TRUE
	else
		if(istype(added_item,required_item_type))
			return TRUE
	return FALSE

//The quality of add_item is special, in that it inherits the quality level of its parent and
//passes it along.
//May need "Balancing" with var/inherited_quality_modifier
/datum/cooking_with_jane/recipe_step/add_item/calculate_quality(var/obj/added_item)
	var/raw_quality = added_item?:food_quality * inherited_quality_modifier
	return clamp_quality(raw_quality)

//-----------------------------------------------------------------------------------
//A cooking step that involves using an item on the food.
/datum/cooking_with_jane/recipe_step/use_item
	class=CWJ_USE_ITEM
	var/required_item_type
	var/exact_path = FALSE //Tests if the item has to be the EXACT ITEM PATH, or just a child of the item path.

//item_type: The type path of the object we are looking for.
//base_quality_award: The quality awarded by following this step.
//our_recipe: The parent recipe object
/datum/cooking_with_jane/recipe_step/use_item/New(var/item_type, var/datum/cooking_with_jane/recipe/our_recipe)

	if(!ispath(item_type))
		log_debug("/datum/cooking_with_jane/recipe_step/add_item/New(): item [item_type] is not a valid path")

	var/example_item = new item_type()
	if(example_item)
		desc = "Apply \a [example_item]."

		required_item_type = item_type
		group_identifier = item_type

		QDEL_NULL(example_item)
	else
		log_debug("/datum/cooking_with_jane/recipe_step/add_item/New(): item [item_type] couldn't be created.")

	..(our_recipe)


/datum/cooking_with_jane/recipe_step/use_item/check_conditions_met(var/obj/added_item)
	if(src.exact_path)
		if(added_item.type == required_item_type)
			return TRUE
	else
		if(istype(added_item,required_item_type))
			return TRUE
	return FALSE

//Think about a way to make this more intuitive?
/datum/cooking_with_jane/recipe_step/use_item/calculate_quality(var/obj/added_item)
	return clamp_quality(0)

/datum/cooking_with_jane/recipe_step/add_item/follow_step(var/obj/added_item, var/obj/item/cooking_with_jane/cooking_container/container)
	added_item.forceMove(container)
	container.foodstuff += added_item
	return TRUE

//-----------------------------------------------------------------------------------
//A cooking step that involves adding a reagent to the food.
/datum/cooking_with_jane/recipe_step/add_reagent
	class=CWJ_ADD_REAGENT
	var/required_reagent_id
	var/required_reagent_amount

//reagent_id: The id of the required reagent to be added, E.G. 'salt'.
//amount: The amount of the required reagent that needs to be added.
//base_quality_award: The quality awarded by following this step.
//our_recipe: The parent recipe object,
/datum/cooking_with_jane/recipe_step/add_reagent/New(var/reagent_id,  var/amount, var/datum/cooking_with_jane/recipe/our_recipe)

	var/datum/reagent/global_reagent = GLOB.chemical_reagents_list[reagent_id]
	if(global_reagent)
		desc = "Add [amount] unit(s) of [global_reagent.name]"

		required_reagent_id = reagent_id
		group_identifier = reagent_id

		required_reagent_amount = amount
	else
		CRASH("/datum/cooking_with_jane/recipe_step/add/reagent/New(): Reagent [reagent_id] not found. Recipe: [our_recipe]")

	..(our_recipe)


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
//A cooking step that involves using SPECIFICALLY Grown foods
/datum/cooking_with_jane/recipe_step/add_produce
	class=CWJ_ADD_PRODUCE
	var/required_produce_type

/datum/cooking_with_jane/recipe_step/add_produce/New(var/produce, var/datum/cooking_with_jane/recipe/our_recipe)
	required_produce_type = produce
	group_identifier = produce
	desc = "Add \a [produce] into the recipe."
	..(base_quality_award, our_recipe)