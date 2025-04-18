/datum/stat_holder
	var/tmp/mob/living/holder
	var/list/stat_list = list()
	var/list/datum/perk/perks = list()
	var/initialized = FALSE //Whether or not the stats have had time to be properly filled. Not always used. For players, it is set in human/Stat(), used for Stat-dependant organs

/datum/stat_holder/New(mob/living/L)
	holder = L
	for(var/sttype in subtypesof(/datum/stat))
		var/datum/stat/S = new sttype
		stat_list[S.name] = S

/datum/stat_holder/Destroy()
	if(holder)
		holder.stats = null
		holder = null

	QDEL_LIST(perks) // Definitely needed to clean up properly

	stat_list.Cut()
	return ..()

/datum/stat_holder/proc/check_for_shared_perk(ability_bitflag)
	for(var/datum/perk/target_perk in perks)
		if(target_perk.check_shared_ability(ability_bitflag))
			return TRUE
	return FALSE

/* Uncomment when we have more than 1 bitflag for shared abilities
/datum/stat_holder/proc/check_for_shared_perks(list/ability_bitflags)
	for(var/datum/perk/target_perk in perks)
		if(target_perk.check_shared_abilities(ability_bitflags))
			return TRUE
	return FALSE
*/

/datum/stat_holder/proc/addTempStat(statName, Value, timeDelay, id = null)
	var/datum/stat/S = stat_list[statName]
	S.addModif(timeDelay, Value, id)
	LEGACY_SEND_SIGNAL(holder, COMSIG_STAT, S.name, S.getValue(), S.getValue(TRUE))

/datum/stat_holder/proc/removeTempStat(statName, id)
	if(!id)
		CRASH("no id passed to removeTempStat(")
	var/datum/stat/S = stat_list[statName]
	S.remove_modifier(id)

/datum/stat_holder/proc/getTempStat(statName, id)
	if(!id)
		CRASH("no id passed to getTempStat(")
	var/datum/stat/S = stat_list[statName]
	return S.get_modifier(id)

/datum/stat_holder/proc/changeStat(statName, Value)
	var/datum/stat/S = stat_list[statName]
	S.changeValue(Value)
	LEGACY_SEND_SIGNAL(holder, COMSIG_STAT, S.name, S.getValue(), S.getValue(TRUE))

/datum/stat_holder/proc/changeStat_withcap(statName, Value)
	var/datum/stat/S = stat_list[statName]
	S.changeValue_withcap(Value)
	LEGACY_SEND_SIGNAL(holder, COMSIG_STAT, S.name, S.getValue(), S.getValue(TRUE))


/datum/stat_holder/proc/setStat(statName, Value)
	var/datum/stat/S = stat_list[statName]
	S.setValue(Value)

/datum/stat_holder/proc/add_Stat_cap(statName, amount)
	var/datum/stat/S = stat_list[statName]
	S.add_stat_cap(amount)

/datum/stat_holder/proc/set_Stat_cap(statName, amount)
	var/datum/stat/S = stat_list[statName]
	S.set_stat_cap(amount)

/datum/stat_holder/proc/grab_Stat_cap(statName)
	var/datum/stat/S = stat_list[statName]
	var/number = S.grabbed_stat_cap()
	return number

/datum/stat_holder/proc/getStat(statName, pure = FALSE, require_direct_value = TRUE)
	if (!islist(statName))
		var/datum/stat/S = stat_list[statName]
		LEGACY_SEND_SIGNAL(holder, COMSIG_STAT, S?.name, S.getValue(), S.getValue(TRUE))
		var/stat_value =  S ? S.getValue(pure) : 0
		if(holder?.stats.getPerk(PERK_NO_OBFUSCATION) || require_direct_value)
			return stat_value
		else
			return statPointsToLevel(stat_value)
	else
		log_debug("passed list to getStat(), statName without a list: [statName]")

//	Those are accept list of stats
//	Compound stat checks.
//	Lowest value among the stats passed in
/datum/stat_holder/proc/getMinStat(var/list/namesList, pure = FALSE)
	if(!islist(namesList))
		log_debug("passed non-list to getMinStat()")
		return 0
	var/lowest = INFINITY
	for (var/name in namesList)
		if(getStat(name, pure) < lowest)
			lowest = getStat(name, pure)
	return lowest

//	Get the highest value among the stats passed in
/datum/stat_holder/proc/getMaxStat(var/list/namesList, pure = FALSE)
	if(!islist(namesList))
		log_debug("passed non-list to getMaxStat()")
		return 0
	var/highest = -INFINITY
	for (var/name in namesList)
		if(getStat(name, pure) > highest)
			highest = getStat(name, pure)
	return highest

//	Sum total of the stats
/datum/stat_holder/proc/getSumOfStat(var/list/namesList, pure = FALSE)
	if(!islist(namesList))
		log_debug("passed non-list to getSumStat()")
		return 0
	var/sum = 0
	for (var/name in namesList)
		sum += getStat(name, pure)
	return sum

//	Get the average (mean) value of the stats
/datum/stat_holder/proc/getAvgStat(var/list/namesList, pure = FALSE)
	if(!islist(namesList))
		log_debug("passed non-list to getAvgStat()")
		return 0
	var/avg = getSumOfStat(namesList, pure)
	return avg / namesList.len

// return value from 0 to 1 based on value of stat, more stat value less return value
// use this proc to get multiplier for decreasing delay time (exaple: "50 * getMult(STAT_ROB, STAT_LEVEL_ADEPT)"  this will result in 5 seconds if stat STAT_ROB = 0 and result will be 0 if STAT_ROB = STAT_LEVEL_ADEPT)
/datum/stat_holder/proc/getMult(statName, statCap = STAT_LEVEL_MAX, pure = FALSE)
	if(!statName)
		return
	return 1 - max(0,min(1,getStat(statName, pure)/statCap))

/datum/stat_holder/proc/getPerk(perkType)
	RETURN_TYPE(/datum/perk)
	var/datum/perk/path = ispath(perkType) ? perkType : text2path(perkType) // Adds support for textual argument so that it can be called through VV easily
	if(path)
		return locate(path) in perks

/// The main, public proc to add a perk to a mob. Accepts a path or a stringified path.
/datum/stat_holder/proc/addPerk(perkType)
	. = FALSE
	if(!getPerk(perkType))
		var/datum/perk/P = new perkType
		perks += P
		P.assign(holder)
		. = TRUE


/// The main, public proc to remove a perk from a mob. Accepts a path or a stringified path.
/datum/stat_holder/proc/removePerk(perkType)
	var/datum/perk/P = getPerk(perkType)
	if(P)
		perks -= P
		P.remove()

/datum/stat_holder/proc/removeAllPerks()
	for(var/datum/perk/P in perks)
		removePerk(P)


/datum/stat_mod
	var/time = 0
	var/value = 0
	var/id

/datum/stat_mod/New(_delay, _affect, _id)
	if(_delay == INFINITY)
		time = -1
	else
		time = world.time + _delay
	value = _affect
	id = _id



/datum/stat
	var/name = "Character stat"
	var/desc = "Basic characteristic, you are not supposed to see this. Report to admins."
	var/value = STAT_VALUE_DEFAULT
	var/list/mods = list()
	var/stat_cap = STAT_VALUE_DEFAULT_MAXIMUM

/datum/stat/proc/addModif(delay, affect, id)
	for(var/elem in mods)
		var/datum/stat_mod/SM = elem
		if(SM.id == id)
			if(delay == INFINITY)
				SM.time = -1
			else
				SM.time = world.time + delay
			SM.value = affect
			return
	mods += new /datum/stat_mod(delay, affect, id)

/datum/stat/proc/remove_modifier(id)
	for(var/elem in mods)
		var/datum/stat_mod/SM = elem
		if(SM.id == id)
			mods.Remove(SM)
			return

/datum/stat/proc/get_modifier(id)
	for(var/elem in mods)
		var/datum/stat_mod/SM = elem
		if(SM.id == id)
			return SM

/datum/stat/proc/changeValue(affect)
	value = value + affect

/datum/stat/proc/changeValue_withcap(affect)
	if(value > stat_cap)
		return

	if(value + affect > stat_cap)
		value = stat_cap
	else
		value = value + affect


/datum/stat/proc/getValue(pure = FALSE)
	if(pure)
		return value
	else
		. = value
		for(var/elem in mods)
			var/datum/stat_mod/SM = elem
			if(SM.time != -1 && SM.time < world.time)
				mods -= SM
				qdel(SM)
				continue
			. += SM.value

/datum/stat/proc/setValue(value)
	src.value = value

//Unused but might be good for later additions
/datum/stat/proc/setValue_withcap(value)
	if(value > stat_cap)
		src.value = stat_cap
	else
		src.value = value

/datum/stat/proc/add_stat_cap(amount)
	stat_cap += amount

/datum/stat/proc/set_stat_cap(amount)
	stat_cap = amount

/datum/stat/proc/grabbed_stat_cap()
	return stat_cap

/datum/stat/productivity
	name = STAT_MEC
	desc = "The world hadn't ever had so many moving parts or so few labels. Character's ability in building and using various tools."

/datum/stat/cognition
	name = STAT_COG
	desc = "Too many dots, not enough lines. Knowledge and ability to create new items."

/datum/stat/biology
	name = STAT_BIO
	desc = "What's the difference between being dead, and just not knowing you're alive? Competence in physiology and chemistry."

/datum/stat/robustness
	name = STAT_ROB
	desc = "Violence is what people do when they run out of good ideas. Increases your damage in unarmed combat, and your proficiency at it."

/datum/stat/toughness
	name = STAT_TGH
	desc = "You're a tough guy, but I'm a nightmare wrapped in the apocalypse. Enhances your resistance to gases and poisons, and helps you stand your ground when they try to knock you down."

/datum/stat/aiming
	name = STAT_VIG
	desc = "Be pure! Be vigilant! But never behave. Having sharp eyes and nerves of steel improves your proficiency with guns and overcoming fear from creatures' roars, among other feats."

/datum/stat/vivification
	name = STAT_VIV
	desc = "The body can take only so much stimulation under normal circumstances. It takes a lot to train the body to handle drugs, be they helpful or harmful."

/datum/stat/anatomy
	name = STAT_ANA
	desc = "The body itself; the more you know about how far you can push it, the easier it becomes to edge closer towards death's door."


// Use to perform stat checks
/mob/proc/stat_check(stat_path, needed)
	var/points = src.stats.getStat(stat_path)
	return points >= needed

/proc/statPointsToLevel(var/points)
	switch(points)
		if (-1000 to -100)
			return "Hopeless"
		if (-100 to -50)
			return "Blundering"
		if (-50 to -20)
			return "Incompetent"
		if (-20 to -15)
			return "Inept"
		if (-15 to -1)
			return "Misinformed"
		if (STAT_LEVEL_NONE to STAT_LEVEL_BASIC)
			return "Untrained"
		if (STAT_LEVEL_BASIC to STAT_LEVEL_ADEPT)
			return "Basic"
		if (STAT_LEVEL_ADEPT to STAT_LEVEL_EXPERT)
			return "Adept"
		if (STAT_LEVEL_EXPERT to STAT_LEVEL_PROF)
			return "Expert"
		if (STAT_LEVEL_PROF to STAT_LEVEL_MASTER)
			return "Proficient"
		if (STAT_LEVEL_MASTER to STAT_LEVEL_HIGHER)
			return "Mastery"
		if (STAT_LEVEL_HIGHER to STAT_LEVEL_COSMIC)
			return "Skill Mastery"
		if (STAT_LEVEL_COSMIC to STAT_LEVEL_UNIVERSAL)
			return "Grand Mastery"
		if (STAT_LEVEL_UNIVERSAL to STAT_LEVEL_BYOND)
			return "Theoretical Understanding"
		if (STAT_LEVEL_BYOND to INFINITY)
			return "Higher Understanding"
