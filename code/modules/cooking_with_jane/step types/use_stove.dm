#define T_HI "High"
#define T_MED "Medium"
#define T_LOW "Low"
//A cooking step that involves adding a reagent to the food.
/datum/cooking_with_jane/recipe_step/use_stove
	class=CWJ_ADD_REAGENT
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
	return TRUE

/datum/cooking_with_jane/recipe_step/add_reagent/is_complete(var/obj/used_item, var/datum/cooking_with_jane/recipe_tracker/tracker)
	var/obj/item/reagent_containers/our_item = used_item
	var/obj/item/container = tracker.holder_ref.resolve()
	var/part = our_item.reagents.get_reagent_amount(required_reagent_id) / our_item.reagents.total_volume

	var/incoming_amount = max(0, min(our_item.amount_per_transfer_from_this, our_item.reagents.total_volume, container.reagents.get_free_space()))

	var/incoming_valid_amount = incoming_amount * part

	var/resulting_total = container.reagents.get_reagent_amount(required_reagent_id) + incoming_valid_amount
	if(resulting_total >= required_reagent_amount)
		return TRUE
	return FALSE

#undef T_HI
#undef T_MED
#undef T_LOW