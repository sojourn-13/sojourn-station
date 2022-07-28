/obj/item/organ/internal/scaffold
	name = "organ scaffold"
	icon = 'icons/obj/aberrant_organs.dmi'
	icon_state = "organ_scaffold"
	desc = "A collagen-based biostructure with no discernable function."
	price_tag = 100
	organ_efficiency = list()
	specific_organ_size = 0.5
	spawn_tags = SPAWN_TAG_ABERRANT_ORGAN

	var/use_generated_name = TRUE
	var/use_generated_icon = TRUE
	var/use_generated_color = TRUE

	// Internal
	var/aberrant_cooldown_time = STANDARD_ABERRANT_COOLDOWN
	var/on_cooldown = FALSE
	var/ruined = FALSE
	var/ruined_name = "organ scaffold"
	var/ruined_desc = "A collagen-based biostructure with no discernable function."
	var/ruined_color = null

/obj/item/organ/internal/scaffold/New()
	..()
	RegisterSignal(src, COMSIG_ABERRANT_COOLDOWN, .proc/start_cooldown)

/obj/item/organ/internal/scaffold/Destroy()
	..()
	UnregisterSignal(src, COMSIG_ABERRANT_COOLDOWN)

/obj/item/organ/internal/scaffold/Process()
	. = ..()
	if(owner && !on_cooldown)
		SEND_SIGNAL(src, COMSIG_ABERRANT_INPUT, src, owner)

/obj/item/organ/internal/scaffold/examine(mob/user)
	. = ..()
	if(item_upgrades.len)
		to_chat(user, SPAN_NOTICE("Organoid grafts present ([item_upgrades.len]/[max_upgrades]). Use a laser cutting tool to remove."))
	if(aberrant_cooldown_time > 0)
		to_chat(user, SPAN_NOTICE("Average organ process duration: [aberrant_cooldown_time / (1 SECOND)] seconds"))
	if(user.stats?.getStat(STAT_BIO) >= STAT_LEVEL_PROF)
		var/organs = ""
		for(var/organ in organ_efficiency)
			organs += organ + " ([organ_efficiency[organ]]), "
		organs = copytext(organs, 1, length(organs) - 1)
		to_chat(user, SPAN_NOTICE("Organ tissues present (efficiency): [organs ? organs : "none"]"))
	if(user.stats?.getStat(STAT_BIO) >= STAT_LEVEL_GODLIKE)
		var/function_info
		var/input_info
		var/process_info
		var/output_info
		var/secondary_info

		for(var/mod in contents)
			var/obj/item/modification/organ/internal/holder = mod
			var/datum/component/modification/organ/organ_mod = holder.GetComponent(/datum/component/modification/organ)
			if(istype(mod, /obj/item/modification/organ/internal/input))
				input_info += organ_mod.get_function_info() + "\n"
			if(istype(mod, /obj/item/modification/organ/internal/process))
				process_info += organ_mod.get_function_info() + "\n"
			if(istype(mod, /obj/item/modification/organ/internal/output))
				output_info += organ_mod.get_function_info() + "\n"
			if(istype(mod, /obj/item/modification/organ/internal/special))
				secondary_info += organ_mod.get_function_info() + "\n"

		function_info = input_info + process_info + output_info + secondary_info

		if(function_info)
			to_chat(user, SPAN_NOTICE(function_info))

/obj/item/organ/internal/scaffold/refresh_upgrades()
	name = initial(name)
	color = initial(color)
	max_upgrades = initial(max_upgrades)
	min_bruised_damage = initial(min_bruised_damage)
	min_broken_damage = initial(min_broken_damage)
	max_damage = initial(max_damage)
	owner_verbs = initial(owner_verbs)
	organ_efficiency = initial_organ_efficiency.Copy()
	scanner_hidden = initial(scanner_hidden)
	unique_tag = initial(unique_tag)
	specific_organ_size = initial(specific_organ_size)
	max_blood_storage = initial(max_blood_storage)
	current_blood = initial(current_blood)
	blood_req = initial(blood_req)
	nutriment_req = initial(nutriment_req)
	oxygen_req = initial(oxygen_req)

	if(use_generated_name)
		name = generate_name_from_eff()
	else
		name = ruined ? ruined_name : initial(name)

	if(use_generated_color)
		color = generate_color_from_mods()
	else
		color = ruined ? ruined_color : color

	SEND_SIGNAL(src, COMSIG_APPVAL, src)

/obj/item/organ/internal/scaffold/update_icon()
	if(use_generated_icon)
		icon_state = initial(icon_state) + "-[rand(1,8)]"
	else
		icon_state = initial(icon_state)

/obj/item/organ/internal/scaffold/proc/generate_name_from_eff()
	if(!organ_efficiency.len)
		return ruined ? ruined_name : initial(name)

	var/beginning
	var/list/middle = list()
	var/end
	var/list/name_chunk
	var/new_name
	var/prefix
	var/total_eff

	for(var/organ in organ_efficiency)
		switch(organ)
			if(OP_EYES)
				name_chunk = list("e", "y", "es")
			if(OP_HEART)
				name_chunk = list("he", "ar", "t")
			if(OP_LUNGS)
				name_chunk = list("l", "un", "gs")
			if(OP_LIVER)
				name_chunk = list("l", "iv", "er")
			if(OP_KIDNEYS)
				name_chunk = list("k", "idn", "ey")
			if(OP_APPENDIX)
				name_chunk = list("app", "end", "ix")
			if(OP_STOMACH)
				name_chunk = list("st", "om", "ach")
			if(OP_BONE)
				name_chunk = list("b", "on", "e")
			if(OP_MUSCLE)
				name_chunk = list("m", "us", "cle")
			if(OP_NERVE)
				name_chunk = list("n", "er", "ve")
			if(OP_BLOOD_VESSEL)
				name_chunk = list("blood v", "ess", "el")
			else
				name_chunk = list()

		if(!beginning)
			beginning = name_chunk[1]
		middle += name_chunk[2]
		end = name_chunk[3]

		total_eff += organ_efficiency[organ]

	if(total_eff < 0)
		prefix = pick("languid", "ailing", "infirm") + " "
	else if(middle.len == 1)
		prefix = pick("little", "small", "pygmy", "tiny") + " "

	if(middle.len > 2)
		middle.Cut(middle.len)
		middle.Cut(1,2)

	if(beginning)
		new_name = prefix + beginning
		if(middle.len)
			for(var/chunk in middle)
				new_name += chunk
		new_name += end
		return new_name

/obj/item/organ/internal/scaffold/proc/generate_color_from_mods()
	if(!item_upgrades.len)
		return ruined ? ruined_color : initial(color)

	var/new_color = pick("#c92b2e", "#fc697d", "#fdab8d", "#672F1D", "#e793bc", "#a7e75f", "#9e6a93")

	return new_color

/obj/item/organ/internal/scaffold/proc/try_ruin()
	if(!ruined)
		ruin()

/obj/item/organ/internal/scaffold/proc/ruin()
	ruined = TRUE
	name = ruined_name ? ruined_name : initial(name)
	desc = ruined_desc ? ruined_desc : initial(desc)
	color = ruined_color ? ruined_color : initial(color)
	price_tag = 100

/obj/item/organ/internal/scaffold/proc/start_cooldown()
	on_cooldown = TRUE
	addtimer(CALLBACK(src, .proc/end_cooldown), aberrant_cooldown_time, TIMER_STOPPABLE)

/obj/item/organ/internal/scaffold/proc/end_cooldown()
	on_cooldown = FALSE

/obj/item/organ/internal/scaffold/rare
	name = "efficient organ scaffold"
	desc = "A collagen-based biostructure with no discernable function. This one has room for an extra organoid."
	max_upgrades = 4

/obj/item/organ/internal/scaffold/aberrant
	name = "aberrant organ"

	var/input_mod_path
	var/process_mod_path
	var/output_mod_path
	var/special_mod_path

	var/req_num_inputs = 1
	var/req_num_outputs = 1

	var/base_input_type = null
	var/list/specific_input_type_pool = list()
	var/input_threshold = null
	var/input_mode = null
	var/list/process_info = list()
	var/should_process_have_organ_stats = TRUE
	var/list/output_pool = list()
	var/list/output_info = list()
	var/list/special_info = list()

/obj/item/organ/internal/scaffold/aberrant/New()
	..()
	if(!input_mod_path && !process_mod_path && !output_mod_path && !special_mod_path)
		return
	if(input_mod_path)
		if(!input_mode || (!base_input_type && !specific_input_type_pool.len) || !input_threshold)
			return
	if(output_mod_path)
		if(!output_pool.len || !output_info.len)
			return
	if(input_mod_path && output_mod_path)
		if((specific_input_type_pool.len < req_num_inputs && !base_input_type) || output_pool.len < req_num_outputs || output_info.len < req_num_outputs)
			return

	var/list/input_info = list()
	var/list/output_types = list()
	
	if(req_num_inputs)
		for(var/i in 1 to req_num_inputs)
			if(specific_input_type_pool.len)
				input_info += list(pick_n_take(specific_input_type_pool) = input_threshold)
			else if(base_input_type)
				var/list/reagents_sans_blacklist = subtypesof(base_input_type) - REAGENT_BLACKLIST
				input_info = list(pick_n_take(reagents_sans_blacklist) = input_threshold)

	if(req_num_outputs)
		for(var/i in 1 to req_num_outputs)		
			output_types += list(pick_n_take(output_pool) = output_info[i])

	var/obj/item/modification/organ/internal/input/I
	if(ispath(input_mod_path, /obj/item/modification/organ/internal/input))
		I = new input_mod_path(src, FALSE, null, input_info, input_mode)

	var/obj/item/modification/organ/internal/process/P
	if(ispath(process_mod_path, /obj/item/modification/organ/internal/process))
		P = new process_mod_path(src, should_process_have_organ_stats, null, process_info)

	var/obj/item/modification/organ/internal/output/O
	if(ispath(output_mod_path, /obj/item/modification/organ/internal/output))
		O = new output_mod_path(src, FALSE, null, output_types)

	var/obj/item/modification/organ/internal/special/S
	if(ispath(special_mod_path, /obj/item/modification/organ/internal/special))
		S = new special_mod_path(src, FALSE, null, special_info)

	if(I)
		SEND_SIGNAL(I, COMSIG_IATTACK, src)

	if(P)
		SEND_SIGNAL(P, COMSIG_IATTACK, src)

	if(O)
		SEND_SIGNAL(O, COMSIG_IATTACK, src)

	if(S)
		SEND_SIGNAL(S, COMSIG_IATTACK, src)
