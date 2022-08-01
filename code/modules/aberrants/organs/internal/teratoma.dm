// Flavorful holder object for a organoids. Organoids should almost never spawn outside of these.
/obj/item/organ/internal/scaffold/aberrant/teratoma
	name = "teratoma"
	desc = "An abnormal growth of organ tissue."
	ruined_name = "ruined teratoma"
	ruined_desc = "An abnormal growth of organ tissue. Ruined by use."
	ruined_color = "#696969"
	icon_state = "teratoma"
	price_tag = 200

	max_upgrades = 1
	use_generated_name = FALSE
	req_num_inputs = null
	req_num_outputs = null

/obj/item/organ/internal/scaffold/aberrant/teratoma/New()
	if(input_mod_path)
		input_mod_path = pick(subtypesof(/obj/item/modification/organ/internal/input))
	else if(process_mod_path)
		process_mod_path = pick(subtypesof(/obj/item/modification/organ/internal/process))
	else if(output_mod_path)
		output_mod_path = pick(subtypesof(/obj/item/modification/organ/internal/output) - /obj/item/modification/organ/internal/output/damaging_insight_gain\
																						- /obj/item/modification/organ/internal/output/activate_organ_functions)	// use defines to whitelist/blacklist subtypes
	else if(special_mod_path)
		special_mod_path = pick(subtypesof(/obj/item/modification/organ/internal/special/on_pickup) +\
								subtypesof(/obj/item/modification/organ/internal/special/on_examine) +\
								subtypesof(/obj/item/modification/organ/internal/special/on_cooldown/chemical_effect) +\
								subtypesof(/obj/item/modification/organ/internal/special/on_cooldown/stat_boost))

	switch(input_mod_path)
		if(/obj/item/modification/organ/internal/input/damage)
			specific_input_type_pool += ALL_USABLE_DAMAGE_TYPES
			input_mode = NOT_USED
		if(/obj/item/modification/organ/internal/input/power_source)
			specific_input_type_pool += ALL_USABLE_POWER_SOURCES
			input_mode = NOT_USED
		if(/obj/item/modification/organ/internal/input/reagents)
			specific_input_type_pool += REAGENTS_DISPENSER + REAGENTS_TOXIN + REAGENTS_ROACH + REAGENTS_SPIDER
			input_mode = pick(CHEM_TOUCH, CHEM_INGEST, CHEM_BLOOD)
			if(input_mode == CHEM_INGEST)
				specific_input_type_pool += REAGENTS_EDIBLE + REAGENTS_ALCOHOL
			if(input_mode == CHEM_BLOOD)
				specific_input_type_pool += REAGENTS_MEDICINE_SIMPLE + REAGENTS_DRUGS + REAGENTS_STIMULANT_SIMPLE


	switch(process_mod_path)
		if(/obj/item/modification/organ/internal/process/shuffle)
			process_info = list(pick(1,2,4))

	switch(output_mod_path)
		if(/obj/item/modification/organ/internal/output/reagents_blood)
			output_pool += REAGENTS_MEDICINE_SIMPLE + REAGENTS_DRUGS + REAGENTS_ROACH + REAGENTS_SPIDER
			for(var/i in 1 to req_num_outputs)
				output_info += pick(VERY_LOW_OUTPUT, LOW_OUTPUT)
		if(/obj/item/modification/organ/internal/output/reagents_ingest)
			output_pool += REAGENTS_EDIBLE + REAGENTS_ALCOHOL + REAGENTS_ROACH + REAGENTS_SPIDER
			for(var/i in 1 to req_num_outputs)
				output_info += pick(VERY_LOW_OUTPUT, LOW_OUTPUT)
		if(/obj/item/modification/organ/internal/output/chemical_effects)
			var/list/chem_effects = ALL_USABLE_POSITIVE_CHEM_EFFECTS
			for(var/effect in chem_effects)
				output_pool.Add(effect)
			for(var/i in 1 to req_num_outputs)
				output_info += NOT_USED
		if(/obj/item/modification/organ/internal/output/stat_boost)
			output_pool += ALL_STATS
			for(var/i in 1 to req_num_outputs)
				output_info += MID_OUTPUT

	..()

/obj/item/organ/internal/scaffold/aberrant/teratoma/update_icon()
	icon_state = initial(icon_state) + "-[rand(1,6)]"

/obj/item/organ/internal/scaffold/aberrant/teratoma/ruin()
	..()
	use_generated_color = FALSE
	max_upgrades = 0
	price_tag = 50
	matter = list(MATERIAL_BIOMATTER = 5)
	STOP_PROCESSING(SSobj, src)

// input
/obj/item/organ/internal/scaffold/aberrant/teratoma/input
	name = "teratoma (input)"
	req_num_inputs = 1
	input_mod_path = /obj/item/modification/organ/internal/input

/obj/item/organ/internal/scaffold/aberrant/teratoma/input/uncommon
	name = "bulging teratoma (input)"
	req_num_inputs = 2

/obj/item/organ/internal/scaffold/aberrant/teratoma/input/rare
	name = "throbbing teratoma (input)"
	req_num_inputs = 4

// process
/obj/item/organ/internal/scaffold/aberrant/teratoma/process
	name = "teratoma (processing)"
	process_mod_path = /obj/item/modification/organ/internal/process

// output
/obj/item/organ/internal/scaffold/aberrant/teratoma/output
	name = "teratoma (output)"
	req_num_outputs = 1
	output_mod_path = /obj/item/modification/organ/internal/output

/obj/item/organ/internal/scaffold/aberrant/teratoma/output/uncommon
	name = "bulging teratoma (output)"
	req_num_outputs = 2

/obj/item/organ/internal/scaffold/aberrant/teratoma/output/rare
	name = "throbbing teratoma (output)"
	req_num_outputs = 4

// special
/obj/item/organ/internal/scaffold/aberrant/teratoma/special
	name = "teratoma (unknown)"
	special_mod_path = /obj/item/modification/organ/internal/special

// parasitic
/obj/item/organ/internal/scaffold/aberrant/teratoma/parasitic
	name = "teratoma (unknown)"

/obj/item/organ/internal/scaffold/aberrant/teratoma/parasitic/New()
	var/obj/item/modification/organ/internal/stromal/parasitic/P = new (src)
	SEND_SIGNAL(P, COMSIG_IATTACK, src)
	..()

// random
/obj/item/organ/internal/scaffold/aberrant/teratoma/random
	name = "teratoma (unknown)"

/obj/item/organ/internal/scaffold/aberrant/teratoma/random/New()
	var/path = pick(/obj/item/modification/organ/internal/input,\
		/obj/item/modification/organ/internal/process,\
		/obj/item/modification/organ/internal/output,\
		/obj/item/modification/organ/internal/special\
		)
	switch(path)
		if(/obj/item/modification/organ/internal/input)
			input_mod_path = /obj/item/modification/organ/internal/input
			req_num_inputs = 1
		if(/obj/item/modification/organ/internal/process)
			process_mod_path = /obj/item/modification/organ/internal/process
		if(/obj/item/modification/organ/internal/output)
			output_mod_path = /obj/item/modification/organ/internal/output
			req_num_outputs = 1
		if(/obj/item/modification/organ/internal/special)
			special_mod_path = /obj/item/modification/organ/internal/special
	..()
