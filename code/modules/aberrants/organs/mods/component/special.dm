/datum/component/modification/organ/on_examine
	exclusive_type = /obj/item/modification/organ/internal/special/on_examine
	trigger_signal = COMSIG_EXAMINE

/datum/component/modification/organ/on_examine/brainloss
	var/damage = 1

/datum/component/modification/organ/on_examine/brainloss/get_function_info()
	var/description = "<span style='color:purple'>Functional information (secondary):</span> causes brain damage when examined"
	return description

/datum/component/modification/organ/on_examine/brainloss/moderate
	damage = 5

/datum/component/modification/organ/on_examine/brainloss/trigger(obj/item/holder, mob/owner)
	if(!holder || !owner)
		return
	if(isliving(owner))
		var/mob/living/L = owner	// NOTE: In this case, owner means the mob that examined the holder, not the mob the holder is attached to
		L.adjustBrainLoss(damage)
		L.apply_damage(PSY, damage)


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

/datum/component/modification/organ/on_pickup/shock/trigger(obj/item/holder, mob/owner)
	if(!holder || !owner)
		return

	if(isliving(owner))
		var/mob/living/L = owner
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

/datum/component/modification/organ/on_cooldown/chemical_effect/trigger(obj/item/holder, mob/owner)
	if(!holder || !owner)
		return
	if(!istype(holder, /obj/item/organ/internal/scaffold))
		return

	var/obj/item/organ/internal/scaffold/S = holder
	var/effect_multiplier = (S.max_damage - S.damage) / S.max_damage

	if(ishuman(owner))
		var/mob/living/carbon/human/H = owner
		H.add_chemical_effect(effect, magnitude * effect_multiplier)

/datum/component/modification/organ/on_cooldown/stat_boost
	var/stat
	var/boost

/datum/component/modification/organ/on_cooldown/stat_boost/get_function_info()
	var/description = "<span style='color:purple'>Functional information (secondary):</span> augments physical/mental affinity"
	description += "\n<span style='color:purple'>Affinity:</span> [stat] ([boost])"

	return description

/datum/component/modification/organ/on_cooldown/stat_boost/trigger(obj/item/holder, mob/owner)
	if(!holder || !owner)
		return
	if(!istype(holder, /obj/item/organ/internal/scaffold))
		return

	var/obj/item/organ/internal/scaffold/S = holder
	var/effect_multiplier = (S.max_damage - S.damage) / S.max_damage
	var/delay = S.aberrant_cooldown_time + 2 SECONDS

	if(ishuman(owner))
		var/mob/living/carbon/human/H = owner
		H.stats.addTempStat(stat, boost * effect_multiplier, delay, holder)
