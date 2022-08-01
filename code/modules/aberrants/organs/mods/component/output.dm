/datum/component/modification/organ/output
	exclusive_type = /obj/item/modification/organ/internal/output
	trigger_signal = COMSIG_ABERRANT_OUTPUT

	var/list/possible_outputs = list()


/datum/component/modification/organ/output/reagents_blood
/datum/component/modification/organ/output/reagents_blood/get_function_info()
	var/outputs
	for(var/output in possible_outputs)
		var/datum/reagent/R = output
		outputs += initial(R.name) + " ([possible_outputs[output]]), "

	outputs = copytext(outputs, 1, length(outputs) - 1)

	var/description = "<span style='color:blue'>Functional information (output):</span> produces reagents in bloodstream"
	description += "\n<span style='color:blue'>Reagents produced:</span> [outputs]"

	return description

/datum/component/modification/organ/output/reagents_blood/trigger(atom/movable/holder, mob/living/carbon/owner, list/input)
	if(!holder || !owner || !input)
		return
	if(!istype(holder, /obj/item/organ/internal/scaffold))
		return

	var/obj/item/organ/internal/scaffold/S = holder
	var/effect_multiplier = (S.max_damage - S.damage) / S.max_damage

	if(input.len && input.len <= possible_outputs.len)
		for(var/i in input)
			var/index = input.Find(i)
			var/is_input_valid = input[i]
			if(is_input_valid)
				var/datum/reagent/output = possible_outputs[index]
				var/amount_to_add = possible_outputs[output] * effect_multiplier
				owner.bloodstr.add_reagent(initial(output.id), amount_to_add)
	
		SEND_SIGNAL(holder, COMSIG_ABERRANT_COOLDOWN, TRUE)

/datum/component/modification/organ/output/reagents_ingest
/datum/component/modification/organ/output/reagents_ingest/get_function_info()
	var/outputs
	for(var/output in possible_outputs)
		var/datum/reagent/R = output
		outputs += initial(R.name) + " ([possible_outputs[output]]), "

	outputs = copytext(outputs, 1, length(outputs) - 1)

	var/description = "<span style='color:blue'>Functional information (output):</span> produces reagents in stomach"
	description += "\n<span style='color:blue'>Reagents produced:</span> [outputs]"

	return description

/datum/component/modification/organ/output/reagents_ingest/trigger(atom/movable/holder, mob/living/carbon/owner, list/input)
	if(!holder || !owner || !input)
		return
	if(!istype(holder, /obj/item/organ/internal/scaffold))
		return

	var/obj/item/organ/internal/scaffold/S = holder
	var/effect_multiplier = (S.max_damage - S.damage) / S.max_damage

	if(input.len)
		for(var/i in input)
			var/index = input.Find(i)
			var/is_input_valid = input[i]
			if(is_input_valid && index <= possible_outputs.len)
				var/datum/reagent/output = possible_outputs[index]
				var/amount_to_add = possible_outputs[output] * effect_multiplier
				owner.ingested.add_reagent(initial(output.id), amount_to_add)
	
		SEND_SIGNAL(holder, COMSIG_ABERRANT_COOLDOWN, TRUE)

/datum/component/modification/organ/output/chemical_effects	// More organ-like than producing reagents
/datum/component/modification/organ/output/chemical_effects/get_function_info()
	var/outputs
	for(var/output in possible_outputs)
		var/effect
		switch(output)
			if(CE_BLOODRESTORE)
				effect = "blood restoration"
			if(CE_BLOODCLOT)
				effect = "blood clotting"
			if(CE_PAINKILLER)
				effect = "painkiller"
			if(CE_ANTITOX)
				effect = "anti-toxin"
			if(CE_TOXIN)
				effect = "toxin"
			if(CE_SPEEDBOOST)
				effect = "augmented agility"
			else
				effect = "none"
		outputs += effect + " ([possible_outputs[output]]), "

	outputs = copytext(outputs, 1, length(outputs) - 1)

	var/description = "<span style='color:blue'>Functional information (output):</span> produces chemical effects in the body"
	description += "\n<span style='color:blue'>Effects produced:</span> [outputs]"

	return description

/datum/component/modification/organ/output/chemical_effects/trigger(atom/movable/holder, mob/living/carbon/owner, list/input)
	if(!holder || !owner || !input)
		return
	if(!istype(holder, /obj/item/organ/internal/scaffold))
		return

	var/obj/item/organ/internal/scaffold/S = holder
	var/effect_multiplier = (S.max_damage - S.damage) / S.max_damage

	if(input.len)
		for(var/i in input)
			var/index = input.Find(i)
			var/is_input_valid = input[i]
			if(is_input_valid && index <= possible_outputs.len)
				var/effect = possible_outputs[index]
				var/magnitude = input[i] ? possible_outputs[effect] * effect_multiplier : 0
				owner.add_chemical_effect(effect, magnitude)
	
		SEND_SIGNAL(holder, COMSIG_ABERRANT_COOLDOWN, TRUE)


/datum/component/modification/organ/output/stat_boost
/datum/component/modification/organ/output/stat_boost/get_function_info()
	var/outputs
	for(var/stat in possible_outputs)
		outputs += stat + " ([possible_outputs[stat]]), "

	outputs = copytext(outputs, 1, length(outputs) - 1)

	var/description = "<span style='color:blue'>Functional information (output):</span> augments physical/mental affinity"
	description += "\n<span style='color:blue'>Affinities:</span> [outputs]"

	return description

/datum/component/modification/organ/output/stat_boost/trigger(atom/movable/holder, mob/living/carbon/owner, list/input)
	if(!holder || !owner || !input)
		return
	if(!istype(holder, /obj/item/organ/internal/scaffold))
		return

	var/obj/item/organ/internal/scaffold/S = holder
	var/effect_multiplier = (S.max_damage - S.damage) / S.max_damage
	var/delay = S.aberrant_cooldown_time + 1 SECOND

	if(input.len && iscarbon(owner))
		for(var/i in input)
			var/index = input.Find(i)
			var/is_input_valid = input[i]
			if(is_input_valid && index <= possible_outputs.len)
				var/stat = possible_outputs[index]
				var/magnitude = possible_outputs[stat] * effect_multiplier
				owner.stats.addTempStat(stat, magnitude, delay, "[holder]")
	
		SEND_SIGNAL(holder, COMSIG_ABERRANT_COOLDOWN, TRUE)


/datum/component/modification/organ/output/damaging_insight_gain
/datum/component/modification/organ/output/damaging_insight_gain/get_function_info()
	var/description = "<span style='color:blue'>Functional information (output):</span> unknown"
	return description

/datum/component/modification/organ/output/damaging_insight_gain/trigger(atom/movable/holder, mob/living/carbon/owner, list/input)
	if(!holder || !owner || !input)
		return
	if(!istype(holder, /obj/item/organ/internal/scaffold))
		return

	var/obj/item/organ/internal/scaffold/S = holder
	var/effect_multiplier = (S.max_damage - S.damage) / S.max_damage

	if(input.len && ishuman(owner))
		for(var/i in input)
			var/index = input.Find(i)
			var/is_input_valid = input[i]
			if(is_input_valid)
				var/mob/living/carbon/human/H = owner
				var/damage_type = possible_outputs[index]
				var/damage_amount = possible_outputs[damage_type] * effect_multiplier
				H.apply_damage(damage_amount, damage_type)
				H.adjustBrainLoss(damage_amount)		// Added brainloss because we're gaining insight and most damage is trivial anyway
				H.sanity.give_insight(damage_amount)
				SEND_SIGNAL(holder, COMSIG_ABERRANT_COOLDOWN, TRUE)
				return TRUE

/datum/component/modification/organ/output/activate_organ_functions
	var/list/active_organ_efficiency_mod = list()
	var/active_blood_req_mod = 0
	var/active_nutriment_req_mod = 0
	var/active_oxygen_req_mod = 0
	var/list/active_owner_verb_adds = list()

	// Internal
	// Keeps track of original values since we can't use initial() (vars aren't defined by default)
	var/are_values_stored = FALSE
	var/list/old_organ_efficiency_mod = list()
	var/old_blood_req_mod = 0
	var/old_nutriment_req_mod = 0
	var/old_oxygen_req_mod = 0
	var/list/old_owner_verb_adds = list()

/datum/component/modification/organ/output/activate_organ_functions/get_function_info()
	var/description = "<span style='color:blue'>Functional information (output):</span> conditional organ functions"
	description += "\n<span style='color:blue'>Organ tissues:</span> "
	for(var/organ in active_organ_efficiency_mod)
		description += "<span style='color:pink'>[organ] ([active_organ_efficiency_mod[organ]])</span>/"
	description += "<span style='color:red'>[active_blood_req_mod]</span>/"
	description += "<span style='color:blue'>[active_oxygen_req_mod]</span>/"
	description += "<span style='color:orange'>[active_nutriment_req_mod]</span>"
	return description

/datum/component/modification/organ/output/activate_organ_functions/trigger(obj/item/holder, mob/living/carbon/owner, list/input)
	if(!holder || !owner || !input)
		return
	if(!ishuman(owner))
		return
	if(!istype(holder, /obj/item/organ/internal/scaffold))
		return

	var/obj/item/organ/internal/scaffold/S = holder
	var/effect_multiplier = (S.max_damage - S.damage) / S.max_damage

	var/mob/living/carbon/human/H = owner

	if(!are_values_stored)
		old_organ_efficiency_mod = organ_efficiency_mod
		old_blood_req_mod = blood_req_mod
		old_nutriment_req_mod = nutriment_req_mod
		old_oxygen_req_mod = oxygen_req_mod
		old_owner_verb_adds = owner_verb_adds
		active_organ_efficiency_mod |= old_organ_efficiency_mod
		active_blood_req_mod += old_blood_req_mod
		active_nutriment_req_mod += old_nutriment_req_mod
		active_oxygen_req_mod += old_oxygen_req_mod
		active_owner_verb_adds |= old_owner_verb_adds
		are_values_stored = TRUE

	if(input.len)
		for(var/i in input)
			var/is_input_valid = input[i]
			if(is_input_valid)
				organ_efficiency_mod = active_organ_efficiency_mod * effect_multiplier
				blood_req_mod = active_blood_req_mod * effect_multiplier
				nutriment_req_mod = active_nutriment_req_mod * effect_multiplier
				oxygen_req_mod = active_oxygen_req_mod * effect_multiplier
				owner_verb_adds = active_owner_verb_adds * effect_multiplier

				if(active_organ_efficiency_mod.len)
					for(var/process in active_organ_efficiency_mod)
						if(!islist(H.internal_organs_by_efficiency[process]))
							H.internal_organs_by_efficiency[process] = list()
						H.internal_organs_by_efficiency[process] |= holder

				holder.refresh_upgrades()
				SEND_SIGNAL(holder, COMSIG_ABERRANT_COOLDOWN, TRUE)
				return TRUE
	
	organ_efficiency_mod = old_organ_efficiency_mod
	blood_req_mod = old_blood_req_mod
	nutriment_req_mod = old_nutriment_req_mod
	oxygen_req_mod = old_oxygen_req_mod
	owner_verb_adds = old_owner_verb_adds

	if(active_organ_efficiency_mod.len && !organ_efficiency_mod.len)
		for(var/process in active_organ_efficiency_mod)
			if(!islist(H.internal_organs_by_efficiency[process]))
				H.internal_organs_by_efficiency[process] = list()
			H.internal_organs_by_efficiency[process] -= holder

	holder.refresh_upgrades()
