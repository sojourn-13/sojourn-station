
//Step classifications, for easy reference later. 
//If something falls outside these classifications, why would it?
#define CWJ_CLASS_OTHER 0
#define CWJ_CLASS_ADD_ITEM 1		//Adding an item to a recipe (Ex- adding a slice of bread)
#define CWJ_CLASS_ADD_REAGENT 2	//Adding a reagent to a recipe (Ex- Adding salt)
#define CWJ_CLASS_USE_ITEM 3 		//Using an item in a recipe (Ex- cutting bread with a knife)
#define CWJ_CLASS_USE_APPLIANCE 4 //Using a kitchen appliance in a recipe (Ex- cooking a burger on a grill)


//Recipe state flags
#define CWJ_IS_LAST_STEP 1		//If the step in the recipe is marked as the last step
#define CWJ_IS_OPTIONAL 2		//If the step in the recipe is marked as 'Optional'
#define CWJ_IS_OPTION_CHAIN 4	//If the step in the recipe is marked to be part of an option chain.
#define CWJ_IS_EXCLUSIVE 8		//If the step in the recipe is marked to exclude other options when followed.

//Recipe tracker flags
#define CWJ_IS_PRODUCE 1


//A dictionary of unique step ids that point to other step IDs that should be EXCLUDED if it is present in a recipe_pointer's list of possible steps.
GLOBAL_LIST_EMPTY(cwj_optional_step_exclusion_dictionary)

//A dictionary of all recipes by the basic ingredient
//Format: {base_ingedient_type:{unique_id:recipe}}
GLOBAL_LIST_EMPTY(cwj_recipe_dictionary)

//A dictionary of all recipes by the results. Used later for assembling the HTML list.
//Format: {base_ingedient_type:{unique_id:recipe}}
GLOBAL_LIST_EMPTY(cwj_recipe_dictionary_result)

//A dictionary of all steps held within all recipes
//Format: {unique_id:step}
GLOBAL_LIST_EMPTY(cwj_step_dictionary)

//An organized heap of recipes by class and grouping.
//Format: {class_of_step:{step_group_identifier:{unique_id:step}}}
GLOBAL_LIST_EMPTY(cwj_step_dictionary_ordered)
