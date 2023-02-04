#define MENU_MAIN 1
#define MENU_MERGE 2
#define MENU_COMBINE 3
#define MENU_PROCESSING 4
#define MENU_ANALYZE 5
#define MENU_COMBINE_RESULT 6
#define MENU_IRRADIATE_RESULT 7
#define MENU_ANALYZE_RESULT 8
/*
=========================================================================================================================================
Belvoix Genetic Analyzer

This is the workhorse of the department. Every other machine in the department is built to eventually allow genetic sample plates to be
loaded into this device for analysis. Without this machine, players are left in the dark about which mutations are being produced, and
cannot isolate or combine desired genes.
=========================================================================================================================================

*/
/obj/machinery/genetics/gene_analyzer
	name = "Belvoix Genetic Analyzer"
	desc = "An extremely complex device made to analyze the patterns in DNA and apply them to other creatures."
	density = TRUE
	anchored = TRUE
	//TODO:
	icon = 'icons/obj/genetics/dna_machine_samples.dmi'
	icon_state = "dna_machine"

	layer = BELOW_OBJ_LAYER
	circuit = /obj/item/circuitboard/genetics/gene_analyzer

	//List of genetics sample plates loaded into the device
	var/list/sample_plates = list()

	//Maximum amount of plates allowed in the analyzer, subject to upgrading based on parts
	var/max_plates = 5

	//Maximum amount of mutations identified every time a sample plate is consumed for analysis.
	//Subject to upgrading based on parts.
	var/max_analyzed_per_destruction = 2

	//mark count
	var/mark_count = 0

	//The presently selected holder
	var/obj/item/genetics/sample/active_sample = null

	//Made specifically for displaying Newly identified mutations
	var/list/new_discovered_mutations = list()

	//The presently selected mutagen (within the genetics holder)
	var/datum/genetics/mutation/active_mutation = null

	//A list of virtual mutation keys that the Analyzer recognizes as real
	var/list/known_mutations = list()
	var/obj/machinery/computer/rdconsole/console

	var/datum/genetics/genetics_holder/mutations_to_combine = new /datum/genetics/genetics_holder()
	var/mutations_combining_count = 0
	var/menu_state = MENU_MAIN //1 is basic menu, 2 is merge Menu


	var/debug_ui_data = null

//upgrading parts
/obj/machinery/genetics/gene_analyzer/RefreshParts()
	..()
	var/scanner_rating = 0
	var/bin_rating = 0

	for(var/obj/item/stock_parts/part in component_parts)
		if(istype(part, /obj/item/stock_parts/matter_bin))
			bin_rating += part.rating
		if(istype(part, /obj/item/stock_parts/scanning_module))
			scanner_rating += part.rating

	max_analyzed_per_destruction = round(scanner_rating/4 + 1)
	max_plates = (bin_rating+1)

/obj/machinery/genetics/gene_analyzer/attackby(obj/item/I, mob/user)
	if(!user.stats?.getPerk(PERK_SI_SCI) && !usr.stat_check(STAT_COG, 80) &&!user.stats?.getPerk(PERK_NERD) && !usr.stat_check(STAT_BIO, 60))
		to_chat(usr, SPAN_WARNING("The console pityingly suggests: \"Sorry hun, maybe you should get help from a scientist~?\""))
		return
	if(default_deconstruction(I, user))
		return
	if(default_part_replacement(I, user))
		return

	//Inserting a sample
	if(istype(I, /obj/item/genetics/sample))
		var/obj/item/genetics/sample/incoming_sample = I

		if(sample_plates.len >= max_plates)
			to_chat(user, SPAN_WARNING("The Analyzer is full."))
			return

		if(user.unEquip(I, src))
			sample_plates += incoming_sample
			to_chat(user, SPAN_WARNING("You load a Sample plate into the Analyzer."))
			//update_icon()
			return
	else
		. = ..()

/obj/machinery/genetics/gene_analyzer/attack_hand(mob/user)
	if(!user.stats?.getPerk(PERK_SI_SCI) && !usr.stat_check(STAT_COG, 80) &&!user.stats?.getPerk(PERK_NERD) && !usr.stat_check(STAT_BIO, 60))
		to_chat(usr, SPAN_WARNING("The console pityingly suggests: \"Sorry hun, maybe you should get help from a scientist~?\""))
		return
	if(..())
		return TRUE
	nano_ui_interact(user)

/obj/machinery/genetics/gene_analyzer/proc/eject(var/obj/item/genetics/sample/outbound_sample)
	log_debug("Called sample plate eject function")
	if(outbound_sample)
		outbound_sample.forceMove(loc)
		outbound_sample.genetics_holder.unmark_all_mutations()
		sample_plates -= outbound_sample

		if(active_sample && active_sample.unique_id == outbound_sample.unique_id)
			active_sample = null
/*
/obj/machinery/genetics/gene_analyzer/update_icon()
	if(sample_plates.len >= max_plates)
		icon_state = "implant_container1"
	else
		icon_state = "implant_container0"
*/
/obj/machinery/genetics/gene_analyzer/nano_ui_interact(mob/user, ui_key = "main", datum/nanoui/ui = null, force_open = NANOUI_FOCUS)
	// this is the data which will be sent to the ui
	var/list/data = form_data()
	ui = SSnano.try_update_ui(user, src, ui_key, ui, data, force_open)
	if(!ui)
		ui = new(user, src, ui_key, "genetic_analyzer.tmpl", "GeneAnalyzer", 1000, 800)
		ui.set_initial_data(data)
		ui.open()
		ui.set_auto_update(TRUE)
		ui.set_auto_update_layout(TRUE)

//Filling this with unique id's instead of objects for the most part, so it doesn't slow down nanoUI
//Gotta make this interface slick it sees a lot of use.
/obj/machinery/genetics/gene_analyzer/proc/form_data()
	var/list/data = list()

	data["menu_state"] = menu_state

	var/sample_plate_data
	for(var/obj/item/genetics/sample/selected_sample in sample_plates)
		if(menu_state == MENU_MERGE && active_sample && active_sample.unique_id == selected_sample.unique_id)
			continue
		else
			sample_plate_data += list(selected_sample.sample_data(known_mutations))
	data["sample_plates"] = sample_plate_data

	var/active_sample_data
	if(active_sample)
		active_sample_data = active_sample.sample_data(known_mutations)
	data["active_sample"] = active_sample_data

	var/active_mutation_data
	if(active_mutation)
		active_mutation_data = active_mutation.nano_ui_data(known_mutations)
	data["active_mutation"] = active_mutation_data

	var/mutations_to_combine_data
	if(mutations_to_combine)
		mutations_to_combine_data = mutations_to_combine.nano_ui_data(known_mutations)
	data["mutations_to_combine"] = mutations_to_combine_data

	var/can_combine = FALSE
	if(mutations_combining_count >= 2)
		can_combine = TRUE
	data["can_combine"] = can_combine

	var/can_analyze = FALSE
	if(mark_count > 0)
		can_analyze = TRUE
	data["can_analyze"] = can_analyze

	var/analysis_full = FALSE
	if(mark_count >= max_analyzed_per_destruction)
		analysis_full = TRUE
	data["analysis_full"] = analysis_full

	var/analyzed_mutation_data
	if(new_discovered_mutations)
		analyzed_mutation_data = list()
		for(var/datum/genetics/mutation/target_mutation in new_discovered_mutations)
			analyzed_mutation_data += list(target_mutation.nano_ui_data(known_mutations))
	data["analyzed_mutations"] = analyzed_mutation_data

	debug_ui_data = data
	return data

/obj/machinery/genetics/gene_analyzer/Topic(href, href_list)
	if(..())
		return FALSE

	if(href_list["back"])
		//Basically one big 'reset' button for the entire client.
		//Tries to reset everything for a new operation to be ran.
		if(menu_state == MENU_COMBINE)
			for(var/datum/genetics/mutation/target_mutation in mutations_to_combine.mutation_pool)
				var/datum/genetics/mutation/new_mutation = target_mutation.copy()
				active_sample.genetics_holder.addMutation(new_mutation)
		active_mutation = null
		if(active_sample && active_sample.genetics_holder)
			active_sample.genetics_holder.unmark_all_mutations()
		active_sample = null
		menu_state = MENU_MAIN
		mutations_combining_count = 0
		mark_count = 0
		new_discovered_mutations = list()
		if(mutations_to_combine)
			mutations_to_combine.removeAllMutations()
		return TRUE

	if(menu_state == MENU_MAIN)
		if(href_list["sync"])
			if(!console)
				for(var/obj/machinery/computer/rdconsole/RD in GLOB.computer_list) // Check every RnD computer in existance
					if(RD.id == 1) // only core gets the science
						console = RD

			if(console)
				var/awarding_points = 0
				for(var/mut_key in known_mutations)
					if(!console.known_mutations[mut_key])
						console.known_mutations[mut_key] = known_mutations[mut_key]
						awarding_points += known_mutations[mut_key]

				if(awarding_points > 0)
					console.files.adjust_research_points(awarding_points) // Give the points
					var/obj/item/device/radio/radio
					radio = new /obj/item/device/radio{channels=list("Science")}(src) // Create a new radio
					radio.autosay("Genetics Research Uploaded, granting [awarding_points] research points~!", "Genetics Announcement System", "Science") // Make the radio say a message.
					qdel(radio)

				//Update known mutations from the master console JIC
				for(var/mut_key in console.known_mutations)
					if(!known_mutations[mut_key])
						known_mutations[mut_key] = console.known_mutations[mut_key]

			menu_state = MENU_PROCESSING
			SSnano.update_uis(src)
			sleep(50)
			menu_state = MENU_MAIN
			return TRUE

		if(href_list["eject"])
			var/eject_id = text2num(href_list["eject"])
			for(var/obj/item/genetics/sample/selected_sample in sample_plates)
				var/unique_test_id = selected_sample.unique_id
				if (unique_test_id == eject_id)
					src.eject(selected_sample)
					return TRUE

		if(href_list["merge"])
			var/merge_id = text2num(href_list["merge"])
			for(var/obj/item/genetics/sample/selected_sample in sample_plates)
				if (selected_sample.unique_id == merge_id)
					active_sample = selected_sample
					menu_state = MENU_MERGE
					return TRUE

		if(href_list["toggle_active"])
			var/unique_id = text2num(href_list["unique_id"])
			for(var/obj/item/genetics/sample/selected_sample in sample_plates)
				if (selected_sample.unique_id == unique_id)
					for(var/datum/genetics/mutation/target_mutation in selected_sample.genetics_holder.mutation_pool)
						if(target_mutation.key == href_list["toggle_active"])
							if(target_mutation.active)
								target_mutation.deactivate()
							else
								target_mutation.activate(1)
							return TRUE
			log_debug("Genetics_analyzer.topic(): toggle_active ended way too late.")

			return TRUE
		if(href_list["irradiate"])
			var/unique_id = text2num(href_list["unique_id"])
			for(var/obj/item/genetics/sample/selected_sample in sample_plates)
				if (selected_sample.unique_id == unique_id)
					active_mutation = selected_sample.genetics_holder.irradiate(selected_sample.genetics_holder.getMutation(href_list["irradiate"]))
					menu_state = MENU_PROCESSING
					SSnano.update_uis(src)
					sleep(50)
					menu_state = MENU_IRRADIATE_RESULT
					return TRUE
			log_debug("Genetics_analyzer.topic(): irradiate ended way too late.")

			return TRUE
		if(href_list["combine"])
			var/unique_id = text2num(href_list["unique_id"])
			for(var/obj/item/genetics/sample/selected_sample in sample_plates)
				if (selected_sample.unique_id == unique_id)
					active_sample = selected_sample
					var/datum/genetics/mutation/target_mutation = selected_sample.genetics_holder.getMutation(href_list["combine"])
					if(target_mutation)
						mutations_to_combine.addMutation(selected_sample.genetics_holder.removeMutation(target_mutation.key), TRUE)
					mutations_combining_count++
					menu_state = MENU_COMBINE
					return TRUE
			log_debug("Genetics_analyzer.topic(): irradiate ended way too late.")

			return TRUE
		if(href_list["purge"])
			var/unique_id = text2num(href_list["unique_id"])
			for(var/obj/item/genetics/sample/selected_sample in sample_plates)
				if (selected_sample.unique_id == unique_id)
					selected_sample.genetics_holder.removeMutation(href_list["purge"])
					return TRUE
		if(href_list["analyze"])
			var/unique_id = text2num(href_list["analyze"])
			for(var/obj/item/genetics/sample/selected_sample in sample_plates)
				if (selected_sample.unique_id == unique_id)
					active_sample = selected_sample
			active_sample.genetics_holder.unmark_all_mutations()
			menu_state = MENU_ANALYZE
			return TRUE
	if(menu_state == MENU_MERGE)
		if(href_list["merge"])
			var/merge_id = text2num(href_list["merge"])
			for(var/obj/item/genetics/sample/selected_sample in sample_plates)
				if (selected_sample.unique_id == merge_id)
					for(var/datum/genetics/mutation/target_mutation in selected_sample.genetics_holder.mutation_pool)
						var/datum/genetics/mutation/new_mutation = target_mutation.copy()
						active_sample.genetics_holder.addMutation(new_mutation)
					selected_sample.genetics_holder.removeAllMutations()
					sample_plates -= selected_sample
					qdel(selected_sample)
					menu_state = MENU_PROCESSING
					SSnano.update_uis(src)
					sleep(50)
					menu_state = MENU_MAIN
					return TRUE
	if(menu_state == MENU_COMBINE)
		if(href_list["add"])
			mutations_to_combine.addMutation(active_sample.genetics_holder.removeMutation(href_list["add"]), TRUE)
			mutations_combining_count++
			return TRUE

		if(href_list["remove"])
			active_sample.genetics_holder.addMutation(mutations_to_combine.removeMutation(href_list["remove"]), TRUE)
			mutations_combining_count--
			return TRUE

		if(href_list["combine"])
			var/list/mutation_amount_pair = list()
			for(var/datum/genetics/mutation/target_mutation in mutations_to_combine.mutation_pool)
				mutation_amount_pair += list(list(target_mutation, target_mutation.count))
			menu_state = MENU_PROCESSING
			mutations_combining_count = 0
			SSnano.update_uis(src)
			sleep(50)
			active_mutation = mutations_to_combine.combine(mutation_amount_pair)

			var/datum/genetics/mutation/new_mutation = active_mutation.copy()
			active_sample.genetics_holder.addMutation(new_mutation)
			menu_state = MENU_COMBINE_RESULT
	if(menu_state == MENU_ANALYZE)
		if(href_list["mark"])
			var/datum/genetics/mutation/target_mutation = active_sample.genetics_holder.getMutation(href_list["mark"])
			target_mutation.marked = TRUE
			mark_count++
			return TRUE
		if(href_list["unmark"])
			var/datum/genetics/mutation/target_mutation = active_sample.genetics_holder.getMutation(href_list["unmark"])
			target_mutation.marked = FALSE
			mark_count--
			return TRUE
		if(href_list["analyze"])
			for(var/datum/genetics/mutation/target_mutation in active_sample.genetics_holder.mutation_pool)
				if(target_mutation.marked)
					if(!known_mutations[target_mutation.key])
						new_discovered_mutations += target_mutation.copy()
						known_mutations[target_mutation.key] = target_mutation.gene_research_value
			sample_plates -= active_sample
			qdel(active_sample)
			menu_state = MENU_PROCESSING
			SSnano.update_uis(src)
			sleep(50)
			menu_state = MENU_ANALYZE_RESULT
			return TRUE

	return FALSE

/*
TODO Topics:

-Main menu-
	List of the genetics plates. Each plate has the following
	eject: eject a sample plate from the analyzer
	modify: go to a modify menu
	merge: go to the merge menu
	analyze: go to the analysis menu


*/
#undef MENU_MAIN
#undef MENU_MERGE
#undef MENU_COMBINE
#undef MENU_PROCESSING
#undef MENU_ANALYZE
#undef MENU_COMBINE_RESULT
#undef MENU_IRRADIATE_RESULT
#undef MENU_ANALYZE_RESULT