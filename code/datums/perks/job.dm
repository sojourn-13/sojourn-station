/datum/perk/inspiration
	name = "Exotic Inspiration"
	desc = "The best ideas come from a mind not entirely sober, any alcohol will give you that much needed boost."
	active = FALSE

/datum/perk/inspiration/activate()
	. = ..()
	if(!.)
		return
	holder.addTempStat(STAT_COG, 5, INFINITY, "Exotic Inspiration")
	holder.addTempStat(STAT_MEC, 10, INFINITY, "Exotic Inspiration")

/datum/perk/inspiration/deactivate()
	. = ..()
	if(!.)
		return
	holder.removeTempStat(STAT_COG, "Exotic Inspiration")
	holder.removeTempStat(STAT_MEC, "Exotic Inspiration")

/datum/perk/timeismoney
	name = "Time is Money"
	desc = "Sometimes you just need to run away from a bad deal, so fast you forget how to use your hands as you sprint."
	var/cooldown_time = 0
	active = FALSE
	toggleable = TRUE

/datum/perk/timeismoney/activate()
	if(world.time < cooldown_time)
		to_chat(usr, SPAN_NOTICE("You feel tired, you will need to rest for a bit before using this ability again."))
		return FALSE
	cooldown_time = world.time + 7 MINUTES
	addtimer(CALLBACK(src, .proc/deactivate), 1 MINUTES)
	return ..()
