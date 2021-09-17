/*
=================The Belvoix scanner=================
This is a bugtesting item, please forgive the memes.
*/
/obj/item/device/scanner/belvoix_scanner
	name = "Belvoix Scanner"
	desc = "A worryingly small device for extracting, analyzing and modifying genetic information. Never saw production in Soteria, as it was deemed too humane and convenient for regular use."
	icon_state = "spectrometer"
	item_state = "analyzer"
	origin_tech = list(TECH_BLUESPACE = 5, TECH_BIO = 10, TECH_ILLEGAL = 10)
	charge_per_use = 0
	var/datum/genetics/genetics_holder/held_mutations

/obj/item/device/scanner/belvoix_scanner/is_valid_scan_target(atom/target)
	if(!istype(target, /mob/living))
		to_chat(usr, SPAN_WARNING("A red dot blips, the scan target [target] is invalid."))
		return FALSE
	return TRUE


/obj/item/device/scanner/belvoix_scanner/scan(mob/living/target, mob/user)
	log_debug("Injected a bastard named [target] with the belvoix scanner")
	if(user.a_intent == I_HELP)
		if(target != src)
			to_chat(user, SPAN_NOTICE("\The [src] takes a sample out of \the [target]"))
		held_mutations = new /datum/genetics/genetics_holder(target, src)
		scan_title = "Belvoix Scanner - [target]"
		scan_data = belvoix_scan(held_mutations)
		user.show_message(scan_data)
	else if(user.a_intent == I_HURT)
		to_chat(user, SPAN_NOTICE("\The [src] injects a sample into \the [target]"))
		inject_mutations(target, held_mutations.mutation_pool)


/proc/belvoix_scan(var/datum/genetics/genetics_holder/held_mutations)
	if(held_mutations.mutation_pool.len == 0)
		return SPAN_WARNING("No genetic info found.</span>")
	else
		var/list/dat = list("Genetic info loaded. Mutations Detected: ")
		for(var/datum/genetics/mutation/mutagen in held_mutations.mutation_pool)
			dat += "[mutagen.name]([mutagen.active == TRUE ? "Active" : "Inactive"]): [mutagen.desc]"
		return jointext(dat, "<br>")