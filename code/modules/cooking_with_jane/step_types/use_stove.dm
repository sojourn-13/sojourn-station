//A cooking step that involves adding a reagent to the food.
/datum/cooking_with_jane/recipe_step/use_stove
	class=CWJ_USE_STOVE
	auto_complete_enabled = TRUE
	var/time
	var/heat

//reagent_id: The id of the required reagent to be added, E.G. 'salt'.
//amount: The amount of the required reagent that needs to be added.
//base_quality_award: The quality awarded by following this step.
//our_recipe: The parent recipe object,
/datum/cooking_with_jane/recipe_step/add_reagent/New(var/set_time,  var/set_heat, var/datum/cooking_with_jane/recipe/our_recipe)

	desc = "Cook on a stove set to [heat] for [ticks_to_text(time)]."

	time = set_time
	heat = set_heat

	..(our_recipe)


/datum/cooking_with_jane/recipe_step/add_reagent/check_conditions_met(var/obj/used_item, var/datum/cooking_with_jane/recipe_tracker/tracker)
	
	if(!istype(used_item, /obj/machinery/cooking_with_jane/stove))
		return CWJ_CHECK_INVALID

	return CWJ_CHECK_VALID

//Reagents are calculated prior to object creation
/datum/cooking_with_jane/recipe_step/add_reagent/calculate_quality(var/obj/used_item, var/datum/cooking_with_jane/recipe_tracker/tracker)
	return 0


/datum/cooking_with_jane/recipe_step/add_reagent/follow_step(var/obj/used_item, var/datum/cooking_with_jane/recipe_tracker/tracker)
	var/obj/machinery/cooking_with_jane/stove/our_stove = used_item
	var/obj/item/container = tracker.holder_ref.resolve()
	container.cook_data[our_stove.temperature[our_stove.active_input]] += our_stove.reference_time

	return CWJ_SUCCESS

/datum/cooking_with_jane/recipe_step/add_reagent/is_complete(var/obj/used_item, var/datum/cooking_with_jane/recipe_tracker/tracker)

	var/obj/item/container = tracker.holder_ref.resolve()

	if(container.cook_data[heat] >= time)
		return TRUE

	return FALSE

