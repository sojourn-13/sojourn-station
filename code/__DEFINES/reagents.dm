//Used to replenish biomass in clonners, bioprinters etc
#define BIOMASS_TYPES list(/obj/item/reagent_containers/food/snacks/meat = 50 ,/obj/item/reagent_containers/food/snacks/meat/roachmeat= 40 ,/obj/item/reagent_containers/food/snacks/meat/xenomeat = 20)
//Basis of certain affect_blood calculations for stimulants.
#define STIM_TIME 3 SECONDS
#define ADV_STIM_TIME 6 SECONDS

//list of available bottle sprites, holding 60u bottles that hold just about any chem
#define BOTTLE_SPRITES list("bottle", "potion", "tincture")

//Pill bottles themselfs
#define PILL_BOTTLE_MODELS list("pill_canister", "pill_lred", "pill_dred", \
"pill_red", "pill_pink", "pill_orange", "pill_yellow", "pill_green", "pill_blue", \
"pill_white", "pill_black", "pill_rainbow")

//Syretties, the samll 5u refillable injectors
#define SYRETTE_SPRITES list("syrette", "syrette_red", "syrette_orange", \
"syrette_yellow", "syrette_green", "syrette_cyan", "syrette_blue", "syrette_magenta", \
"syrette_spacealine", "syrette_hyperzine", "syrette_fun", "syrette_fun1", "syrette_antitox", \
"syrette_inopravoline", "syrette_dexalinplus", "syrette_tricord", "syrette_quickclot") //list of available syrette sprites

#define MAX_PILL_SPRITE 20 //max icon state of the pill sprites
