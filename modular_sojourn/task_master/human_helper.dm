//Power creep but for random tasks and unsorted things to help push players into doing activities for miner gains
//Code is HEAVILLY reused and stolen from Hex's Genetics with miner tweaks

/datum/task_master/labourer
	var/mob/living/holder //Who is holding the knowings of the task. Null, if contained within a device.

	var/list/learnt_tasks = null //Each task learnt held by the creature.


//Build a holder from scratch
/datum/task_master/labourer/New(mob/living/holding_mob)
	if(holding_mob)
		holder = holding_mob
	..()


/datum/task_master/labourer/learnt_tasks

//Search function for a specific task living in a labourer holder.
//Key- relates to a stored identifying string in the task datum, can be different for datums of the same object
//Function must return a task datum from the task pool on a success, and a null value that evaluates to FALSE on a fail.
/datum/task_master/labourer/proc/get_task_mastery(key)
	RETURN_TYPE(/datum/task_master/task)
	for(var/datum/task_master/task/source_task in learnt_tasks)
//		log_debug("What are we? source_task.key [source_task.key] key [key]")
		if(source_task.key == key)
			return source_task

//	log_debug("I failed? key [key]")
	return null

//Gets the level as a number
/datum/task_master/labourer/proc/get_task_mastery_level(key, simple = TRUE)
	RETURN_TYPE(/datum/task_master/task)
//	log_debug("key == [key].")

	for(var/datum/task_master/task/source_task in learnt_tasks)
//	log_debug("source_task == [source_task], source_task_key == [source_task.key], key == [key].")
		if(source_task.key == key)
			if(simple && source_task.level == 0)
				return TRUE
			return source_task.level

	if(simple)
		return FALSE
	return "no level"

/datum/task_master/labourer/proc/get_task_mastery_and_proc(key)
	RETURN_TYPE(/datum/task_master/task)
	for(var/datum/task_master/task/source_task in learnt_tasks)
		if(source_task.key == key)
			source_task.activate_affect(holder)

//Generate a new task and force it in if one hasn't been created yet.
//Also, Check to make sure there are no duplicates.
/datum/task_master/labourer/proc/attempt_add_task_mastery(datum/task_master/task/incoming_task, task_key, skill_gained, learner)
	//log_debug("incoming_task ==[incoming_task] task_key == [task_key] skill_gained == [skill_gained] learner == [learner].")
	if(!get_task_mastery(task_key, FALSE))
		//log_debug("I failed?")
		var/datum/task_master/task/new_mastery = new incoming_task(learner)
		add_task_mastery(new_mastery)
		return TRUE
	//log_debug("I passed?")
	if(get_task_mastery(task_key))
		var/datum/task_master/task/pushforwards = get_task_mastery(task_key)
		//log_debug("incoming_task ==[incoming_task] task_key == [task_key] skill_gained == [skill_gained] learner == [learner].")
		pushforwards.gain_value(value_to_gain = skill_gained)
	return FALSE

//Proc for easily adding task to a labourer holder, so it can be called quickly.
/datum/task_master/labourer/proc/add_task_mastery(datum/task_master/task/incoming_master)
	var/datum/task_master/task/existing_mastery = get_task_mastery(incoming_master.key)
	if(existing_mastery)
		return

	incoming_master.worker = src
	LAZYADD(learnt_tasks, incoming_master)