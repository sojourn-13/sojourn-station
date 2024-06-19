
//Power creep but for random tasks and unsorted things to help push players into doing activities for miner gains
//Code is HEAVILLY reused and stolen from Hex's Genetics with miner tweaks

/datum/task_master/task/proc/gain_value(value_to_gain)
	value += value_to_gain
	if(value >= level_threshholds)
		level += 1
		if(!alt_scaling_number)
			level_threshholds += (level_threshholds * min(1, level))
		else
			level_threshholds += (level_threshholds * alt_scaling_number)
		if(!unlocked)
			unlocked = TRUE
		else
			activate_affect()

/datum/task_master/task/proc/activate_affect()
	return


/datum/task_master/task/New(mob/living/holding_mob)
	forwards_refence = holding_mob
	if(unlocked)
		level += 1 //Unlocked tasks start at level 1 rather then 0
	if(forwards_refence)
		if(gain_text)
			to_chat(forwards_refence, SPAN_NOTICE("[gain_text]"))
	..()
