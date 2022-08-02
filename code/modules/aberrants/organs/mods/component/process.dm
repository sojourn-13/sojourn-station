/datum/component/modification/organ/process
	exclusive_type = /obj/item/modification/organ/internal/process
	trigger_signal = COMSIG_ABERRANT_PROCESS

/datum/component/modification/organ/process/boost
	var/multiplier

/datum/component/modification/organ/process/boost/get_function_info()
	var/description = "\n<span style='color:orange'>Functional information (processing):</span> amplifies outputs"
	description += "\n<span style='color:orange'>Output increase:</span> [multiplier * 100]%"

	return description

/datum/component/modification/organ/process/boost/trigger(atom/movable/holder, mob/living/carbon/owner, list/input)
	if(!holder || !owner || !input)
		return

	if(input?.len)
		for(var/element in input)
			input[element] += multiplier

		SEND_SIGNAL(holder, COMSIG_ABERRANT_OUTPUT, holder, owner, input)

/datum/component/modification/organ/process/shuffle
	var/list/new_packet_order = list()
	var/num_outputs

/datum/component/modification/organ/process/shuffle/get_function_info()
	var/description = "<span style='color:orange'>Functional information (processing):</span> rearranges input/output connections"
	description += "\n<span style='color:orange'>New input order:</span> [new_packet_order.len ? new_packet_order : "unknown, must be grafted to an organ and used once"]"
	description += "\n<span style='color:orange'>Number of possible outputs:</span> [num_outputs ? num_outputs : "unknown, must be grafted to an organ and used once"]"

	return description

/datum/component/modification/organ/process/shuffle/trigger(atom/movable/holder, mob/living/carbon/owner, list/input)
	if(!holder || !owner || !input)
		return

	var/list/copied_input = input.Copy()
	var/list/shuffled_input = list()

	if(input.len)
		if(!new_packet_order.len)
			for(var/i in 1 to input.len)
				new_packet_order += "[i]"
				new_packet_order["[i]"] = i
				shuffle(new_packet_order)
			if(!num_outputs)
				num_outputs = input.len

		if(input.len >= num_outputs)
			for(var/i in 1 to num_outputs)
				var/key = copied_input[text2num(new_packet_order[i])]
				var/value = copied_input[key]
				shuffled_input.Add(key)
				shuffled_input[key] = value

	SEND_SIGNAL(holder, COMSIG_ABERRANT_OUTPUT, holder, owner, shuffled_input)

/datum/component/modification/organ/process/shuffle/uninstall()
	new_packet_order = list()
	num_outputs = null
	..()

/datum/component/modification/organ/process/condense
/datum/component/modification/organ/process/condense/get_function_info()
	var/description = "<span style='color:orange'>Functional information (processing):</span> condenses inputs into a single output"

	return description

/datum/component/modification/organ/process/condense/trigger(atom/movable/holder, mob/living/carbon/owner, list/input)
	if(!holder || !owner || !input)
		return

	var/list/condensed_input = list("condensed input" = 0)

	if(input.len)
		for(var/element in input)
			condensed_input["condensed input"] += input[element]

	SEND_SIGNAL(holder, COMSIG_ABERRANT_OUTPUT, holder, owner, condensed_input)
