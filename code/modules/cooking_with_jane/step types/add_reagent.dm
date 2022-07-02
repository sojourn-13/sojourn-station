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
	return clamp_quality(0)
