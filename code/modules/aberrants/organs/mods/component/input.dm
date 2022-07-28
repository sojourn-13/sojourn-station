/datum/component/modification/organ/input
	exclusive_type = /obj/item/modification/organ/internal/input
	trigger_signal = COMSIG_ABERRANT_INPUT

	var/check_mode
	//var/consumption_factor
	var/list/accepted_inputs = list()	// Format: input = unit threshold (/datum/reagent = 20)


/datum/component/modification/organ/input/reagents
/datum/component/modification/organ/input/reagents/get_function_info()
	var/source
	switch(check_mode)
		if(CHEM_TOUCH)
			source = "skin"
		if(CHEM_INGEST)
			source = "stomach"
		if(CHEM_BLOOD)
			source = "bloodstream"
		else
			source = "none"

	var/inputs
	for(var/input in accepted_inputs)
		var/datum/reagent/R = input
		inputs += initial(R.name) + " ([accepted_inputs[input]]u), "

	inputs = copytext(inputs, 1, length(inputs) - 1)

	var/description = "<span style='color:green'>Functional information (input):</span> metabolizes reagents"
	description += "\n<span style='color:green'>Source:</span> [source]"
	description += "\n<span style='color:green'>Reagents metabolized (threshold):</span> [inputs]"

	return description

/datum/component/modification/organ/input/reagents/trigger(atom/movable/holder, mob/living/carbon/owner)
	if(!holder || !owner)
		return

	var/list/input = list()

	var/datum/reagents/metabolism/RM = owner.get_metabolism_handler(check_mode)
	for(var/datum/reagent/R in RM.reagent_list)
		for(var/reagent_path in accepted_inputs)
			var/threshold_met = FALSE
			if(istype(R, reagent_path))
				if(R.volume > accepted_inputs[reagent_path])
					threshold_met = TRUE
					R.remove_self(R.metabolism)
			input += reagent_path
			input[reagent_path] = threshold_met

	SEND_SIGNAL(holder, COMSIG_ABERRANT_PROCESS, holder, owner, input)


/datum/component/modification/organ/input/consume_reagents
/datum/component/modification/organ/input/consume_reagents/get_function_info()
	var/source
	switch(check_mode)
		if(CHEM_TOUCH)
			source = "skin"
		if(CHEM_INGEST)
			source = "stomach"
		if(CHEM_BLOOD)
			source = "bloodstream"
		else
			source = "none"

	var/inputs
	for(var/input in accepted_inputs)
		var/datum/reagent/R = input
		inputs += initial(R.name) + " ([accepted_inputs[input]]u), "

	inputs = copytext(inputs, 1, length(inputs) - 1)

	var/description = "<span style='color:green'>Functional information (input):</span> consumes reagents"
	description += "\n<span style='color:green'>Source:</span> [source]"
	description += "\n<span style='color:green'>Reagents metabolized (threshold):</span> [inputs]"

	return description

/datum/component/modification/organ/input/consume_reagents/trigger(atom/movable/holder, mob/living/carbon/owner)
	if(!holder || !owner)
		return

	var/list/input = list()

	var/datum/reagents/metabolism/RM = owner.get_metabolism_handler(check_mode)
	for(var/reagent_path in accepted_inputs)
		var/threshold_met = FALSE
		for(var/datum/reagent/R in RM.reagent_list)
			if(istype(R, reagent_path))
				var/volume_threshold = accepted_inputs[reagent_path]
				if(R.volume > volume_threshold)
					threshold_met = TRUE
					R.remove_self(volume_threshold)
		input += reagent_path
		input[reagent_path] = threshold_met

	SEND_SIGNAL(holder, COMSIG_ABERRANT_PROCESS, holder, owner, input)


/datum/component/modification/organ/input/damage
/datum/component/modification/organ/input/damage/get_function_info()
	var/inputs
	for(var/input in accepted_inputs)
		inputs += input + " ([accepted_inputs[input]]), "

	inputs = copytext(inputs, 1, length(inputs) - 1)

	var/description = "<span style='color:green'>Functional information (input):</span> injury response"
	description += "\n<span style='color:green'>Damage types (minimum):</span> [inputs]"

	return description

/datum/component/modification/organ/input/damage/trigger(atom/movable/holder, mob/living/carbon/owner)
	if(!holder || !owner)
		return

	var/list/input = list()

	for(var/desired_damage_type in accepted_inputs)
		var/current_damage = 0
		var/desired_damage_amount = accepted_inputs[desired_damage_type]
		var/threshold_met = FALSE
		switch(desired_damage_type)
			if(BRUTE)
				current_damage = owner.getBruteLoss()
			if(BURN)
				current_damage = owner.getFireLoss()
			if(TOX)
				current_damage = owner.getToxLoss()
			if(OXY)
				current_damage = owner.getOxyLoss()
			if(CLONE)
				current_damage = owner.getCloneLoss()
			if(HALLOSS)
				current_damage = owner.getHalLoss()
					
		if(current_damage >= desired_damage_amount)
			threshold_met = TRUE

		input += desired_damage_type
		input[desired_damage_type] = threshold_met

	SEND_SIGNAL(holder, COMSIG_ABERRANT_PROCESS, holder, owner, input)


/datum/component/modification/organ/input/power_source
/datum/component/modification/organ/input/power_source/get_function_info()
	var/inputs
	for(var/input in accepted_inputs)
		var/atom/movable/AM = input
		switch(input)
			if(/obj/item/cell/small)
				inputs += "small power cell, "
			if(/obj/item/cell/medium)
				inputs += "medium power cell, "
			if(/obj/item/cell/large)
				inputs += "large power cell, "
			else
				inputs += initial(AM.name) + ", "

	inputs = copytext(inputs, 1, length(inputs) - 1)

	var/description = "<span style='color:green'>Functional information (input):</span> drains held power sources"
	description += "\n<span style='color:green'>Sources accepted (minimum):</span> [inputs]"

	return description

/datum/component/modification/organ/input/power_source/trigger(atom/movable/holder, mob/living/carbon/owner)
	if(!holder || !owner)
		return
	if(owner.body_part_covered(ARM_LEFT) && owner.body_part_covered(ARM_RIGHT))
		return

	var/list/input = list()
	var/active_hand_held = owner.get_active_hand()
	var/inactive_hand_held = owner.get_inactive_hand()

	for(var/power_source in accepted_inputs)
		var/atom/movable/AM
		if(istype(active_hand_held, power_source))
			AM = active_hand_held
		if(istype(inactive_hand_held, power_source))
			AM = inactive_hand_held

		var/power_supplied = 0

		// 1 u = 500J
		if(istype(AM, /obj/item/cell))
			var/obj/item/cell/C = AM
			if(C.charge)
				power_supplied = C.use(C.charge) / CELLRATE		// Using a rigged cell will make it explode instead, which is funny

		// 1 plasma sheet = 192 kJ, 1 uranium sheet = 1152 kJ, 1 tritium sheet = 1440 kJ
		if(istype(AM, /obj/item/stack/material))
			var/obj/item/stack/material/M = AM
			if(M.amount)
				switch(M.default_type)
					if(MATERIAL_PLASMA)
						M.amount--
						power_supplied = 192000
					if(MATERIAL_URANIUM)
						M.amount--
						power_supplied = 1152000
					if(MATERIAL_TRITIUM)
						M.amount--
						power_supplied = 1440000
		
		if(power_supplied)
			var/magnitude = 0

			if(power_supplied > 4999999)
				magnitude = 5
			if(power_supplied > 999999)
				magnitude = 3
			if(power_supplied > 99999)
				magnitude = 2
				
			if(magnitude && ishuman(owner))
				if(prob(2))
					to_chat(owner, SPAN_NOTICE("A pleasant chill runs up your spine. You feel more focused."))
				var/mob/living/carbon/human/H = owner
				H.stats.addTempStat(STAT_COG, magnitude * 2, STANDARD_ABERRANT_STIM_TIME, "[parent]")
				H.sanity.changeLevel(magnitude - 2)

		input += power_source
		input[power_source] = power_supplied ? TRUE : FALSE

	SEND_SIGNAL(holder, COMSIG_ABERRANT_PROCESS, holder, owner, input)
