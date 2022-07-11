
//Step classifications, for easy reference later. 
//If something falls outside these classifications, why would it?
#define CWJ_START 					1		//Default step to construct the list.
#define CWJ_ADD_ITEM 				2		//Adding an item to a recipe (Ex- adding a slice of bread)
#define CWJ_ADD_REAGENT 			3		//Adding a reagent to a recipe (Ex- Adding salt)
#define CWJ_USE_ITEM 				4 		//Using an item in a recipe (Ex- cutting bread with a knife)
#define CWJ_USE_TOOL				5
#define CWJ_ADD_PRODUCE				6		//Adding Produce to a recipe
#define CWJ_USE_APPLIANCE 			7 		//Using a kitchen appliances in a recipe (Ex- cooking a burger on a grill)
#define CWJ_USE_OTHER 				8 		//Custom Command flag, will take in argument lists.


											
//Optional flags
#define CWJ_ADD_ITEM_OPTIONAL		200
#define CWJ_ADD_REAGENT_OPTIONAL	300
#define CWJ_USE_ITEM_OPTIONAL		400
#define CWJ_USE_TOOL_OPTIONAL		500
#define CWJ_ADD_PRODUCE_OPTIONAL	600
#define CWJ_USE_APPLIANCE_OPTIONAL	700
#define CWJ_OTHER_OPTIONAL 			800


#define CWJ_BEGIN_EXCLUSIVE_OPTIONS 1000	//Beginning an exclusive option list
#define CWJ_END_EXCLUSIVE_OPTIONS 	2000	//Ending an exclusive option list
#define CWJ_BEGIN_OPTION_CHAIN 		3000	//Beginning an option chain
#define CWJ_END_OPTION_CHAIN 		4000	//Ending an option chain

//Recipe state flags
#define CWJ_IS_LAST_STEP 			1		//If the step in the recipe is marked as the last step
#define CWJ_IS_OPTIONAL 			2		//If the step in the recipe is marked as 'Optional'
#define CWJ_IS_OPTION_CHAIN 		4		//If the step in the recipe is marked to be part of an option chain.
#define CWJ_IS_EXCLUSIVE 			8		//If the step in the recipe is marked to exclude other options when followed.
#define CWJ_BASE_QUALITY_ENABLED 	16
#define CWJ_MAX_QUALITY_ENABLED 	32

//Check item use flags
#define CWJ_NO_STEPS  	  	1 //The used object has no valid recipe uses
#define CWJ_CHOICE_CANCEL 	2 //The user opted to cancel when given a choice
#define CWJ_SUCCESS 		3 //The user decided to use the item for a given purpose.
#define CWJ_COMPLETE		4 //The meal has been completed!
#define CWJ_LOCKOUT			5 //Someone tried starting the function while a prompt was running. Jerk.
#define CWJ_PARTIAL			6 //The recipe step was followed but not marked as completed.

#define CWJ_CHECK_INVALID	0
#define CWJ_CHECK_VALID		1
#define CWJ_CHECK_FULL		2 //For reagents, nothing can be added to 

//Cooking container types
#define PLATE 		"plate"
#define PAN			"pan"
#define POT			"pot"
#define BOWL		"bowl"
#define SKILLET		"skillet"
#define BASKET		"basket"
#define OVEN		"oven"
#define GRILL		"grill"

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
