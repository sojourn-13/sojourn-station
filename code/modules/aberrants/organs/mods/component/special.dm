/datum/component/modification/organ/on_examine
	exclusive_type = /obj/item/modification/organ/internal/special/on_examine
	trigger_signal = COMSIG_EXAMINE

// needs function info

/datum/component/modification/organ/on_examine/brainloss
	var/damage = 1

/datum/component/modification/organ/on_examine/brainloss/get_function_info()
	var/description = "<span style='color:purple'>Functional information (secondary):</span> causes brain damage when examined"
	return description

/datum/component/modification/organ/on_examine/brainloss/moderate
	damage = 5

/datum/component/modification/organ/on_examine/brainloss/trigger(mob/user, distance)
	if(!user)
		return
	if(isliving(user))
		var/mob/living/L = user
		L.adjustBrainLoss(damage)


/datum/component/modification/organ/on_pickup
	exclusive_type = /obj/item/modification/organ/internal/special/on_pickup
	trigger_signal = COMSIG_ITEM_PICKED


/datum/component/modification/organ/on_pickup/shock
	var/damage = 5

/datum/component/modification/organ/on_pickup/shock/get_function_info()
	var/description = "<span style='color:purple'>Functional information (secondary):</span> electrocutes when touched"
	return description

/datum/component/modification/organ/on_pickup/shock/powerful
	damage = 25

/datum/component/modification/organ/on_pickup/shock/trigger(obj/item/parent, mob/user)
	if(!user || !parent)
		return

	if(isliving(user))
		var/mob/living/L = user
		L.electrocute_act(damage, parent)


/datum/component/modification/organ/on_cooldown
	exclusive_type = /obj/item/modification/organ/internal/special/on_cooldown
	trigger_signal = COMSIG_ABERRANT_COOLDOWN

/datum/component/modification/organ/on_cooldown/chemical_effect
	var/effect
	var/magnitude

/datum/component/modification/organ/on_cooldown/chemical_effect/get_function_info()
	var/effect_name
	switch(effect)
		if(CE_BLOODRESTORE)
			effect_name = "blood restoration"
		if(CE_BLOODCLOT)
			effect_name = "blood clotting"
		if(CE_PAINKILLER)
			effect_name = "painkiller"
		if(CE_ANTITOX)
			effect_name = "anti-toxin"
		if(CE_TOXIN)
			effect_name = "toxin"
		if(CE_SPEEDBOOST)
			effect_name = "augmented agility"
		else
			effect_name = "none"

	var/description = "<span style='color:purple'>Functional information (secondary):</span> produces a chemical effect in the body"
	description += "\n<span style='color:purple'>Effect produced:</span> [effect_name] ([magnitude])"

	return description

/datum/component/modification/organ/on_cooldown/chemical_effect/trigger(obj/item/parent, mob/user)
	if(!user || !parent)
		return

	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		H.add_chemical_effect(effect, magnitude)

/datum/component/modification/organ/on_cooldown/stat_boost
	var/stat
	var/boost
	var/delay

/datum/component/modification/organ/on_cooldown/stat_boost/get_function_info()
	var/description = "<span style='color:purple'>Functional information (secondary):</span> augments physical/mental affinity"
	description += "\n<span style='color:purple'>Affinity:</span> [stat] ([boost])"

	return description

/datum/component/modification/organ/on_cooldown/stat_boost/trigger(obj/item/parent, mob/user)
	if(!user || !parent)
		return

	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		H.stats.addTempStat(stat, boost, delay, parent)
