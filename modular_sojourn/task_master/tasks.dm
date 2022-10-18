

//Heavily inspired by Proto23 created by Croc
//Power creep but for random tasks and unsorted things to help push players into doing activities for miner gains
//Code is HEAVILLY reused and stolen from Hex's Genetics with miner tweaks

/datum/task_master/task

	//Reference to the containing labourer
	var/datum/task_master/labourer/worker

	//Pulled up from worker for easyer refencing and debugging
	var/mob/living/carbon/human/forwards_refence


	//Name of the Task
	var/name = "Unknown Task"

	var/desc = "A task unable to be known"

	//The key of the object, used to search for it easily. Often matches the Macro text.
	var/key = "DEFAULT"


	//Used for some tasks to gain levels for said task
	var/value = 0

	//Unused
	var/unlocked = FALSE

	//Current level has has to do with value
	var/level = 0

	//For weather we level up this task or not
	var/level_threshholds = 10

	//The text displayed to a player when they gain a learnt task.
	var/gain_text


/datum/task_master/task/self_value
	name = "Self Motivation"
	key = "MASTER_QUEST_COMPLETER"
	desc = "Completing your own set goals inspirers you to continue your self improvements."
	gain_text = "Setting your own missions is rewarding."
	level_threshholds = 5 //Rewarding people that do their personal objectives with some reason to do this

/datum/task_master/task/self_value/activate_affect()
	//log_debug("[forwards_refence] Has gained additonal insight.")
	forwards_refence.sanity.give_insight(level + 3)
	forwards_refence.sanity.give_insight_rest(level + 3)

/datum/task_master/task/clay_thumb
	name = "Potted Plant Maintainer"
	key = "CLAY_THUMB_CONISOUR"
	desc = "Do to maintaining small potted plants your knowings on biodiversity grows!"
	gain_text = "Keeping potted plants alive sure is rewarding labour!"
	level_threshholds = 10 //What looks like a low value is rather high, as this only gains bio on the second+ level up i.e first 10 points are wasted

/datum/task_master/task/clay_thumb/activate_affect()
	forwards_refence.stats.changeStat(STAT_BIO, 2) //so its accully vauleable

/datum/task_master/task/vender_e_shopper
	name = "Vender Point Shopper"
	key = "VENDER_E_SHOPPER"
	desc = "Paper bills, coins they all suck! The Card with your bank account attached to it is clearly the best way to shop!"
	gain_text = "Shopping with an Ecard sure is the way to go."
	level_threshholds = 10 //So people dont game this as easy

/datum/task_master/task/vender_e_shopper/activate_affect()
	forwards_refence.stats.changeStat(STAT_COG, 2) //so its accully vauleable