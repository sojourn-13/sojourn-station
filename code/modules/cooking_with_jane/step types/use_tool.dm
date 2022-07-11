//A cooking step that involves using an item on the food.
/datum/cooking_with_jane/recipe_step/use_tool
	class=CWJ_USE_ITEM
	var/tool_type
	var/tool_quality

//item_type: The type path of the object we are looking for.
//base_quality_award: The quality awarded by following this step.
//our_recipe: The parent recipe object
/datum/cooking_with_jane/recipe_step/use_tool/New(var/type, var/quality, var/datum/cooking_with_jane/recipe/our_recipe)

	desc = "Use \a [type] tool of quality [quality] or higher."

	tool_type = type
	tool_quality = quality

	..(our_recipe)


/datum/cooking_with_jane/recipe_step/use_tool/check_conditions_met(var/obj/added_item, var/datum/cooking_with_jane/recipe_tracker/tracker)
	return CWJ_CHECK_INVALID

//Think about a way to make this more intuitive?
/datum/cooking_with_jane/recipe_step/use_item/calculate_quality(var/obj/added_item)
	return clamp_quality(0)
