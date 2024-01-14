/* Unlike Eris we are using our ollld sanity syatem for drinks, food, and sancks. The reason why is - we have too much fucking food and drinks to sort through.    //CBD said they'll do it manually
Plus it would require me to get taste_tags working. So, for now until someone can be fucked to put the work in to our shit-codebase, it is staying like this. */  //No we aren't. -v
/*
GLOBAL_LIST_EMPTY(sanity_drinks)
GLOBAL_LIST_EMPTY(sanity_non_alcoholic_drinks)
GLOBAL_LIST_EMPTY(sanity_foods)


//for drinks
/proc/init_sanity_drinks()
	var/list/drink_types = subtypesof(/datum/reagent/ethanol)
	for(var/candidate in drink_types)
		var/list/subtypes_candidate = subtypesof(candidate)
		if(!subtypes_candidate.len)
			GLOB.sanity_drinks += candidate
	return GLOB.sanity_drinks.Copy()

/proc/init_sanity_sanity_non_alcoholic_drinks()
	var/list/non_a_drink_types = subtypesof(/datum/reagent/drink)
	for(var/candidate in non_a_drink_types)
		var/list/subtypes_candidate = subtypesof(candidate)
		if(!subtypes_candidate.len)
			GLOB.sanity_non_alcoholic_drinks += candidate
	return GLOB.sanity_non_alcoholic_drinks.Copy()

//for food
/proc/init_sanity_foods()
	var/list/food_types = subtypesof(/obj/item/reagent_containers/food/snacks)
	for(var/candidate in food_types)
		var/obj/item/reagent_containers/food/snacks/food = candidate
		if(initial(food.cooked))
			GLOB.sanity_foods += candidate
	return GLOB.sanity_foods.Copy()
*/
//We currently don't use style, but might as well leave it defined since it doesn't conflict. Bad system imo - but possibly reworkable.
//for style
#define MAX_HUMAN_STYLE 10
#define MIN_HUMAN_STYLE -10
#define STYLE_MODIFIER 0.20


// Everything below is Eris' taste-tag defines. Keeping it here for reference incase of future code changes that impliment it.

//for desires
#define TASTE_SOUR "sour drink"
#define TASTE_BITTER "bitter drink"
#define TASTE_SWEET "sweet drink"
#define TASTE_STRONG "strong drink"
#define TASTE_LIGHT	"light drink"
#define TASTE_BUBBLY "bubbly drink"
#define TASTE_SPICY "spicy drink"
#define TASTE_SALTY "salty drink"
#define TASTE_SLIMEY "creamy drink"
#define TASTE_REFRESHING "refreshing drink"
#define TASTE_DRY "dry drink"
#define TASTE_PLAIN "bland drink"
#define TASTE_UMAMI "savoury drink"
var/global/list/all_taste_drinks = list(TASTE_SOUR,
								 TASTE_BITTER,
								 TASTE_SWEET,
								 TASTE_STRONG,
								 TASTE_LIGHT,
								 TASTE_BUBBLY,
								 TASTE_SPICY,
								 TASTE_SALTY,
								 TASTE_SLIMEY, //for dense,creamy, solid stuff
								 TASTE_REFRESHING,
								 TASTE_UMAMI, //for any variety of savory drinks like bloody mary, etc.
								 TASTE_DRY) //for stuff like martinis

#define SWEET_FOOD "sweet food"
#define MEAT_FOOD "meat food"
#define COCO_FOOD "chocolate"
#define	VEGAN_FOOD "vegan food"
#define	VEGETARIAN_FOOD "vegetarian food"
#define	CHEESE_FOOD "cheese"
#define	INSECTS_FOOD "insects"
#define	BLAND_FOOD "bland food"
#define SALTY_FOOD "salty food"
#define SPICY_FOOD "spicy food"
#define FLOURY_FOOD "baked good"
#define UMAMI_FOOD "umami food"

var/global/list/all_types_food = list(SWEET_FOOD,
									MEAT_FOOD,
									COCO_FOOD,
									VEGAN_FOOD,
									VEGETARIAN_FOOD,
									CHEESE_FOOD,
									SALTY_FOOD,
									SPICY_FOOD, // more about well spiced not necessarely HOT spicy
									FLOURY_FOOD, //baked goods
									UMAMI_FOOD, //Mushrooms, tomatos, and other savory things that aren't meat.
									BLAND_FOOD)

