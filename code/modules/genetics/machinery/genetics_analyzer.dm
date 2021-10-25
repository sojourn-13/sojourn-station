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
	icon = 'icons/obj/salvageable.dmi'
	icon_state = "implant_container0"
	
    //List of genetics sample plates loaded into the device
    var/list/sample_plates = list()

    //Maximum amount of plates allowed in the analyzer, subject to upgrading based on parts
    var/max_plates = 5
    
    //Maximum amount of mutations identified every time a sample plate is consumed for analysis.
    //Subject to upgrading based on parts.
    var/max_analyzed_per_destruction = 2

    //The presently selected holder
    var/obj/item/genetics/sample/active_sample = null

    //The presently selected mutagen (within the genetics holder)
    var/datum/genetics/mutation/active_mutation = null

    //A list of virtual mutation keys that the Analyzer recognizes as real
    var/list/known_mutations = null



/obj/machinery/genetics/gene_analyzer/attackby(obj/item/I, mob/user)
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

        sample_plates += incoming_sample
		to_chat(user, SPAN_WARNING("You load a Sample plate into the Analyzer."))
        update_icon()
		return
	else
		. = ..()

/obj/machinery/genetics/gene_analyzer/eject(var/obj/item/genetics/sample/outbound_sample)
    if(outbound_sample)
        outbound_sample.forceMove(loc)
        outbound_sample.genetics_holder.unmark_all_mutations()
        sample_plates -= outbound_sample
        update_icon()

/obj/machinery/genetics/gene_analyzer/update_icon()
    if(sample_plates.len >= max_plates)
        icon_state = "implant_container0"
    else
        icon_state = "implant_container1"

/obj/machinery/computer/genetics/clone_console/ui_interact(mob/user, ui_key = "main", datum/nanoui/ui = null, force_open = NANOUI_FOCUS)
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
/obj/machinery/computer/genetics/clone_console/proc/form_data()
	var/list/data = list()
    
    var/sample_plate_data
    for(var/obj/item/genetics/sample/selected_sample in sample_plates)
        sample_plate_data += list(selected_sample.ui_data())
    data["sample_plates"] = sample_plate_data

    data["active_sample"] = active_sample.ui_data()

    data["active_mutation"] = active_mutation.ui_data()

	return data

/obj/machinery/genetics/gene_analyzer/Topic(href, href_list)
	if(..())
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