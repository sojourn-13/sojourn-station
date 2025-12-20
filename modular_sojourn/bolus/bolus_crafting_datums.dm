
//////////////////////////////
//ORDER MATTERS FOR FEEDBACK//
//////////////////////////////

/*

PLACEMENT ORDER MATTERS!!
Where each datum starts and stops on each line number matters a *lot*
When adding new bolus ensure that they are same alinement
DO NOT MESS UP PLACEMENT ORDER OF ALINEMENTS!
Min and Max's should be fine to be weaved but alinements can not!

*/
/datum/bolus_crafting
	var/min = 42 //The MINIUM we need to craft
	var/max = 42 //The MAXIUM we before we cant be crafted
	var/item = /obj/item/reagent_containers/pill/adminordrazine
	var/alinement = "Will" //What the Bolus maker must be

	//Only is given when found is FALSE
	var/awarding_points = 175000 //How many RnD points we give. The first node is special; We give a lot of points!

	//Silly hint system vars
	var/found = FALSE
	var/level_descovered = 0
	var/highest_level_descovered = 0
	var/lowest_level_descovered = 0

var/global/datum/bolus_manager/BOLUS = new
//More Tracking and hint stuff
/datum/bolus_manager
    var/list/recipes = list()

/datum/bolus_manager/New()
	for(var/path in typesof(/datum/bolus_crafting))
		var/datum/bolus_crafting/recipe = new path
		recipes[path] += recipe


//////////////////////////////
//ORDER MATTERS FOR FEEDBACK//
//////////////////////////////

//Immortality

/datum/bolus_crafting/revival
	min = 70
	max = 90
	item = /obj/item/bolus/revival
	alinement = "Immortality"
	awarding_points = 1250

/datum/bolus_crafting/revival_mkii
	min = 110
	max = 120
	item = /obj/item/bolus/revival_mkii
	alinement = "Immortality"
	awarding_points = 2500

//Still

/datum/bolus_crafting/cqc
	min = 30
	max = 70
	item = /obj/item/bolus/cqc
	alinement = "Still"
	awarding_points = 1000

/datum/bolus_crafting/armor
	min = 90
	max = 120
	item = /obj/item/bolus/armor
	alinement = "Still"
	awarding_points = 1200

/datum/bolus_crafting/agro
	min = 150
	max = 300
	item = /obj/item/bolus/agro
	alinement = "Still"
	awarding_points = 1500

//Moving

/datum/bolus_crafting/slowdown_reduction
	min = 30
	max = 60
	item = /obj/item/bolus/slowdown_reduction
	alinement = "Moving"
	awarding_points = 2500

/datum/bolus_crafting/slowdown_reduction_mkii
	min = 90
	max = 120
	item = /obj/item/bolus/slowdown_reduction_mkii
	alinement = "Moving"
	awarding_points = 2500

//Weaving

/datum/bolus_crafting/healing
	min = 10
	max = 50
	item = /obj/item/bolus/healing
	alinement = "Weaving"
	awarding_points = 1250

/datum/bolus_crafting/healing_mkii
	min = 50
	max = 80
	item = /obj/item/bolus/healing_mkii
	alinement = "Weaving"
	awarding_points = 2500

/datum/bolus_crafting/healing_mkiii
	min = 80
	max = 90
	item = /obj/item/bolus/healing_mkiii
	alinement = "Weaving"
	awarding_points = 3750

//Calm

/datum/bolus_crafting/core_implants
	min = 30
	max = 50
	item = /obj/item/bolus/core_implants
	alinement = "Calm"
	awarding_points = 500

/datum/bolus_crafting/core_implants_mkiii
	min = 51
	max = 59
	item = /obj/item/bolus/core_implants/mkiii
	alinement = "Calm"
	awarding_points = 3500

/datum/bolus_crafting/core_implants_mkii
	min = 60
	max = 90
	item = /obj/item/bolus/core_implants/mkii
	alinement = "Calm"
	awarding_points = 1000

//////////////////////////////
//ORDER MATTERS FOR FEEDBACK//
//////////////////////////////
