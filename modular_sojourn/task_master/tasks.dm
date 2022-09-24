

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
