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
	if(user.a_intent == I_HELP)
		if(target != src)
			to_chat(user, SPAN_NOTICE("\The [src] takes a sample out of \the [target]"))
		held_mutations = new /datum/genetics/genetics_holder()
		held_mutations.initializeFromMob(target)
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

/*
=================Mutagenic Purger=================
Implant that clears ALL mutations from people when injected. 

It also resets instability to 0 so bad things don't happen.

TODO: Make sure the machine that makes this takes long enough to produce it, that bad things can happen from high instability.
*/

/obj/item/genetics/purger
	name = "Blue-Ink Mutagenic Purger"
	desc = "The saving grace of genetics, this wonderous concoction can purge mutations from the body before anything terrible happens."
	icon = 'icons/obj/items.dmi'
	icon_state = "cimplanter2"
	item_state = "syringe_0"
	throw_speed = 1
	throw_range = 5
	w_class = ITEM_SIZE_SMALL
	matter = list(MATERIAL_PLASTIC = 2, MATERIAL_STEEL = 1, MATERIAL_URANIUM = 1)
	origin_tech = list(TECH_MATERIAL = 2, TECH_MAGNET = 4, TECH_BIO = 6)
	var/used = FALSE

/obj/item/genetics/purger/attack(mob/living/target, mob/living/user)
	if(!istype(target))
		return
	
	if(target.body_part_covered(user.targeted_organ))
		to_chat(user, SPAN_WARNING("The needle can't pierce through clothes."))
		return

	if(!user.stats?.getPerk(PERK_SI_SCI))
		to_chat(user, SPAN_WARNING("You have no idea how to configure this damn thing. Maybe a scientist can get it working?"))
		return

	if(used)
		to_chat(user, SPAN_WARNING("The purger has been used!"))
		return

	user.setClickCooldown(DEFAULT_QUICK_COOLDOWN)
	user.do_attack_animation(target)

	if(do_mob(user, target, 50) && src && !used)
		icon_state = "cimplanter0"
		used = TRUE
		to_chat(target, SPAN_NOTICE("You feel your body begin to stabilize, and your anomalous mutations leave you."))
		target.unnatural_mutations.remove_all_mutations()

/*
=================Mutagenic Sample Plate=================
Essentially a holder item for mutagenic samples. Installed on various machines and used for cloning, modifying, and so on.

Can also be loaded into a (Syringe probably) and injected into people. But that is a later item.
*/
/obj/item/genetics/sample
	name = "Empty Mutagenic Sample Plate"
	desc = "A container for holding, analyzing and transferring mutagens."
	icon = 'icons/obj/forensics.dmi'
	icon_state = "slide"
	w_class = ITEM_SIZE_SMALL
	matter = list(MATERIAL_GLASS = 2)
	origin_tech = list(TECH_MATERIAL = 1, TECH_BIO = 1)
	var/list/mutations/mutation_pool
	
/obj/item/genetics/sample/New(var/list/mutation_list)
	for (var/datum/genetics/mutation/source_mutation in mutation_list)
		var/datum/genetics/mutation/new_mutation = source_mutation.copy()
	name = "Mutagenic Sample Plate"
	icon_state = "slideblood"

/*
=================Genetics Circuits=================
Circuit boards for different Genetics Machines.
*/

/obj/item/circuitboard/autolathe
	build_name = "Cloaning Vat Board"
	build_path = /obj/machinery/genetics/autolathe
	board_type = "machine"
	origin_tech = list(TECH_ENGINEERING = 2, TECH_DATA = 2, TECH_BIO = 7)
	req_components = list(
		/obj/item/stock_parts/matter_bin = 3,
		/obj/item/stock_parts/manipulator = 1,
		/obj/item/stock_parts/console_screen = 1
	)

/obj/item/circuitboard/genetics_server
	build_name = "Genetics Server"
	build_path = /obj/machinery/computer/genetics_server
	board_type = "machine"
	origin_tech = list(TECH_DATA = 3)
	req_components = list(
		/obj/item/stack/cable_coil = 2,
		/obj/item/stock_parts/scanning_module = 1
	)
