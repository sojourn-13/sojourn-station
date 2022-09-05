Things to keep in mind when porting to eris:

Cooking has to be initialized with initialize_cooking_recipes() in /datum/global_init/New().
It has to be ran AFTER initialize_chemical_reagents() and initialize_chemical_reactions()!

The CtrlShiftClickOn, CtrlShiftClick, CtrlClickOn and CtrlClick procs need to be updated to 
recieve the params value from the ClickOn function. This is needed for the stove and grill 
to function.

Food, snacks, and any atom used as an ingredient in cooking needs a food_quality value. This
is needed for the add_item recipe step type.

Modify slicable food to inherit the food quality of their parent.
