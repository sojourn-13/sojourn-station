// Flavorful holder object for organoids. Organoids should almost never spawn outside of these.
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
	use_generated_color = FALSE
	req_num_inputs = null
	req_num_outputs = null

/obj/item/organ/internal/scaffold/aberrant/teratoma/New()
	if(input_mod_path)
		if(!ispath(input_mod_path))
			input_mod_path = pick(subtypesof(/obj/item/modification/organ/internal/input))
	else if(process_mod_path)
		if(!ispath(process_mod_path))
			process_mod_path = pick(subtypesof(/obj/item/modification/organ/internal/process) - /obj/item/modification/organ/internal/process/shuffle)
		else
			process_mod_path = pick(subtypesof(process_mod_path))		// Janky, but there aren't enough processing effects to matter yet
	else if(output_mod_path)
		if(!ispath(output_mod_path))
			output_mod_path = pick(subtypesof(/obj/item/modification/organ/internal/output) - /obj/item/modification/organ/internal/output/damaging_insight_gain\
																							- /obj/item/modification/organ/internal/output/activate_organ_functions)
	else if(special_mod_path)
		if(!ispath(special_mod_path))
			special_mod_path = pick(subtypesof(/obj/item/modification/organ/internal/special/on_pickup) +\
									subtypesof(/obj/item/modification/organ/internal/special/on_item_examine) +\
									subtypesof(/obj/item/modification/organ/internal/special/on_cooldown/chemical_effect) +\
									subtypesof(/obj/item/modification/organ/internal/special/on_cooldown/stat_boost))
		else
			special_mod_path = pick(subtypesof(special_mod_path))	// Janky, but there aren't enough secondary effects to matter yet

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
				specific_input_type_pool += REAGENTS_MEDICINE_BASIC + REAGENTS_DRUGS + REAGENTS_STIMULANT_SIMPLE

	switch(process_mod_path)
		if(/obj/item/modification/organ/internal/process/shuffle)
			process_info = list(pick(1,2,4))

	switch(output_mod_path)
		if(/obj/item/modification/organ/internal/output/reagents_blood)
			output_pool += REAGENTS_MEDICINE_BASIC + REAGENTS_DRUGS + REAGENTS_ROACH + REAGENTS_SPIDER
			if(req_num_outputs > 1)	// > 1 means uncommon or rare
				output_pool += REAGENTS_MEDICINE_SIMPLE
			for(var/i in 1 to req_num_outputs)
				output_info += pick(VERY_LOW_OUTPUT, LOW_OUTPUT)

		if(/obj/item/modification/organ/internal/output/reagents_ingest)
			output_pool += REAGENTS_EDIBLE + REAGENTS_ALCOHOL + REAGENTS_ROACH + REAGENTS_SPIDER
			if(req_num_outputs > 1)	// > 1 means uncommon or rare
				output_pool += REAGENTS_MEDICINE_SIMPLE
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

/obj/item/organ/internal/scaffold/aberrant/teratoma/ruin()
	..()
	use_generated_name = FALSE
	max_upgrades = 0
	price_tag = 50
	matter = list(MATERIAL_BIOMATTER = 5)
	STOP_PROCESSING(SSobj, src)

// input
/obj/item/organ/internal/scaffold/aberrant/teratoma/input
	name = "teratoma (input)"
	req_num_inputs = 1
	input_mod_path = TRUE

/obj/item/organ/internal/scaffold/aberrant/teratoma/input/uncommon
	name = "bulging teratoma (input)"
	req_num_inputs = 2

/obj/item/organ/internal/scaffold/aberrant/teratoma/input/rare
	name = "throbbing teratoma (input)"
	req_num_inputs = 4

/obj/item/organ/internal/scaffold/aberrant/teratoma/input/reagents
	name = "metabolic teratoma"
	input_mod_path = /obj/item/modification/organ/internal/input/reagents

/obj/item/organ/internal/scaffold/aberrant/teratoma/input/damage
	name = "nociceptive teratoma"
	input_mod_path = /obj/item/modification/organ/internal/input/damage

/obj/item/organ/internal/scaffold/aberrant/teratoma/input/power_source
	name = "bioelectric teratoma"
	input_mod_path = /obj/item/modification/organ/internal/input/power_source


/obj/item/organ/internal/scaffold/aberrant/teratoma/input/reagents/uncommon
	name = "bulging metabolic teratoma"
	req_num_inputs = 2

/obj/item/organ/internal/scaffold/aberrant/teratoma/input/damage/uncommon
	name = "bulging nociceptive teratoma"
	req_num_inputs = 2

/obj/item/organ/internal/scaffold/aberrant/teratoma/input/power_source/uncommon
	name = "bulging bioelectric teratoma"
	req_num_inputs = 2


/obj/item/organ/internal/scaffold/aberrant/teratoma/input/reagents/rare
	name = "throbbing metabolic teratoma"
	req_num_inputs = 4

/obj/item/organ/internal/scaffold/aberrant/teratoma/input/damage/rare
	name = "throbbing nociceptive teratoma"
	req_num_inputs = 4

/obj/item/organ/internal/scaffold/aberrant/teratoma/input/power_source/rare
	name = "throbbing bioelectric teratoma"
	req_num_inputs = 4

// process
/obj/item/organ/internal/scaffold/aberrant/teratoma/process
	name = "teratoma (processing)"
	process_mod_path = TRUE

/obj/item/organ/internal/scaffold/aberrant/teratoma/process/uncommon
	name = "bulging teratoma (processing)"
	process_mod_path = /obj/item/modification/organ/internal/process

// output
/obj/item/organ/internal/scaffold/aberrant/teratoma/output
	name = "teratoma (output)"
	req_num_outputs = 1
	output_mod_path = TRUE

/obj/item/organ/internal/scaffold/aberrant/teratoma/output/uncommon
	name = "bulging teratoma (output)"
	req_num_outputs = 2

/obj/item/organ/internal/scaffold/aberrant/teratoma/output/rare
	name = "throbbing teratoma (output)"
	req_num_outputs = 4

/obj/item/organ/internal/scaffold/aberrant/teratoma/output/reagents_blood
	name = "hepatic teratoma"
	req_num_outputs = 1
	output_mod_path = /obj/item/modification/organ/internal/output/reagents_blood

/obj/item/organ/internal/scaffold/aberrant/teratoma/output/reagents_ingest
	name = "gastric teratoma"
	req_num_outputs = 1
	output_mod_path = /obj/item/modification/organ/internal/output/reagents_ingest

/obj/item/organ/internal/scaffold/aberrant/teratoma/output/chemical_effects
	name = "endocrinal teratoma"
	req_num_outputs = 1
	output_mod_path = /obj/item/modification/organ/internal/output/chemical_effects

/obj/item/organ/internal/scaffold/aberrant/teratoma/output/stat_boost
	name = "intracrinal teratoma"
	req_num_outputs = 1
	output_mod_path = /obj/item/modification/organ/internal/output/stat_boost


/obj/item/organ/internal/scaffold/aberrant/teratoma/output/reagents_blood/uncommon
	name = "bulging hepatic teratoma"
	req_num_outputs = 2

/obj/item/organ/internal/scaffold/aberrant/teratoma/output/reagents_ingest/uncommon
	name = "bulging gastric teratoma"
	req_num_outputs = 2

/obj/item/organ/internal/scaffold/aberrant/teratoma/output/chemical_effects/uncommon
	name = "bulging endocrinal teratoma"
	req_num_outputs = 2

/obj/item/organ/internal/scaffold/aberrant/teratoma/output/stat_boost/uncommon
	name = "bulging intracrinal teratoma"
	req_num_outputs = 2


/obj/item/organ/internal/scaffold/aberrant/teratoma/output/reagents_blood/rare
	name = "throbbing hepatic teratoma"
	req_num_outputs = 4

/obj/item/organ/internal/scaffold/aberrant/teratoma/output/reagents_ingest/rare
	name = "throbbing gastric teratoma"
	req_num_outputs = 4

/obj/item/organ/internal/scaffold/aberrant/teratoma/output/chemical_effects/rare
	name = "throbbing endocrinal teratoma"
	req_num_outputs = 4

/obj/item/organ/internal/scaffold/aberrant/teratoma/output/stat_boost/rare
	name = "throbbing intracrinal teratoma"
	req_num_outputs = 4


// special
/obj/item/organ/internal/scaffold/aberrant/teratoma/special
	name = "teratoma (unknown)"
	special_mod_path = TRUE

/obj/item/organ/internal/scaffold/aberrant/teratoma/special/chemical_effect
	name = "small endocrinal teratoma"
	special_mod_path = /obj/item/modification/organ/internal/special/on_cooldown/chemical_effect

/obj/item/organ/internal/scaffold/aberrant/teratoma/special/stat_boost
	name = "small intracrinal teratoma"
	special_mod_path = /obj/item/modification/organ/internal/special/on_cooldown/stat_boost

// parasitic
/obj/item/organ/internal/scaffold/aberrant/teratoma/parasitic
	name = "teratoma (unknown)"

/obj/item/organ/internal/scaffold/aberrant/teratoma/parasitic/New()
	var/obj/item/modification/organ/internal/stromal/parasitic/P = new (src)
	LEGACY_SEND_SIGNAL(P, COMSIG_IATTACK, src)
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
