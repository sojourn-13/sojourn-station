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
	if(!istype(target, /mob/living) && !istype(target, /obj/item/reagent_containers/food/snacks/meat))
		to_chat(usr, SPAN_WARNING("A red dot blips, the scan target [target] is invalid."))
		return FALSE
	return TRUE


/obj/item/device/scanner/belvoix_scanner/scan(atom/target, mob/user)
	if(user.a_intent == I_HELP)
		if(target != src)
			to_chat(user, SPAN_NOTICE("\The [src] takes a sample out of \the [target]"))
		held_mutations = new /datum/genetics/genetics_holder()

		if(istype(target, /mob/living))
			var/mob/living/living_target = target
			held_mutations.initializeFromMob(living_target)
		else if (istype(target, /obj/item/reagent_containers/food/snacks/meat))
			var/obj/item/reagent_containers/food/snacks/meat/meat_target = target
			held_mutations.initializeFromMeat(meat_target)
		scan_title = "Belvoix Scanner - [target]"
		scan_data = belvoix_scan(held_mutations)
		user.show_message(scan_data)
	else if(user.a_intent == I_HURT)
		to_chat(user, SPAN_NOTICE("\The [src] injects a sample into \the [target]"))
		held_mutations.inject_mutations(target)

/proc/belvoix_scan(var/datum/genetics/genetics_holder/held_mutations)
	if(held_mutations.mutation_pool.len == 0)
		return SPAN_WARNING("No genetic info found.</span>")
	else
		var/list/dat = list("Genetic info loaded. Mutations Detected: ")
		for(var/datum/genetics/mutation/mutagen in held_mutations.mutation_pool)
			dat += "[mutagen.name]([mutagen.active == TRUE ? "Active" : "Inactive"]): [mutagen.desc]"
		return jointext(dat, "<br>")

/obj/item/device/scanner/belvoix_scanner/verb/scramble()
	set category = "Object"
	set name = "Scramble Activated Genes"
	set src in view(1)

	if(isghost(usr))
		to_chat(usr, "You ghost!")
		return

	if(!Adjacent(usr))
		return

	usr.visible_message(SPAN_NOTICE("[usr] scrambled the dna in the [src]!"),SPAN_NOTICE("You scrambled the dna in the [src]!"))

	held_mutations.randomizeActivations()

	scan_data = belvoix_scan(held_mutations)
	usr.show_message(scan_data)

/obj/item/device/scanner/belvoix_scanner/verb/makeSlide()
	set category = "Object"
	set name = "Print Sample Plate"
	set src in view(1)
	var/obj/item/genetics/sample/new_sample = new /obj/item/genetics/sample(held_mutations)
	usr.put_in_hands(new_sample)

/obj/item/device/scanner/belvoix_scanner/verb/irradiateMutation()
	set category = "Object"
	set name = "Irradiate Gene"
	set src in view(1)
	var/list/option_list = list()
	for (var/datum/genetics/mutation/mutagen in held_mutations.mutation_pool)
		option_list[mutagen.name] += mutagen
	var/choice = input("Select a gene to irradiate", "Current Mutations:") in option_list
	if (choice != null)
		to_chat(usr, SPAN_NOTICE("\The [usr] irradiates a \the \"[choice]\" mutation!"))
		held_mutations.irradiate(option_list[choice])
	to_chat(usr, SPAN_NOTICE("\The [src] did not have a mutation to work with. Aborting."))

/obj/item/device/scanner/belvoix_scanner/verb/combineMutation()
	set category = "Object"
	set name = "Combine Genes"
	set src in view(1)

	//Generate the list
	var/list/option_list = list()
	var/list/count_list = list() 	//yes I needed 2 lists to make this damn thing work, it's a debug item don't @ me
	for (var/datum/genetics/mutation/mutagen in held_mutations.mutation_pool)
		option_list[mutagen.name] = mutagen
		count_list[mutagen.name] = mutagen.count
	option_list["End Selection"] = 1
	count_list["End Selection"] = 1

	var/list/combined_mutations = list()
	for(var/iterations = 0; iterations < 9; iterations++)

		log_debug("combineMutation(): Began an iteration of this thing")
		var/list/updated_option_list = list()
		for(var/option in option_list)
			if(count_list[option] > 0)
				updated_option_list["[option]"] = option_list[option]

		var/choice = input("Select a gene to combine", "Current Mutations:") in updated_option_list

		if(!choice || choice=="End Selection")
			break
		else
			//Find a spot for this mutation in the combined_mutations list as we transfer it over.
			var/datum/genetics/mutation/selected_mutation = option_list[choice]
			var/mutation_not_in_list = TRUE
			for (var/list/mutation_amount_pair in combined_mutations)
				var/datum/genetics/mutation/combined_mutation = mutation_amount_pair[1]
				if (combined_mutation == selected_mutation)
					log_debug("combineMutation():Gene already exists, incrementing.")
					mutation_amount_pair[2] += 1
					mutation_not_in_list = FALSE
			if(mutation_not_in_list)
				log_debug("combineMutation():Gene [selected_mutation] not detected!")
				combined_mutations = combined_mutations + list(list(selected_mutation, 1))

			//Go back and decrement the original options list
			count_list[selected_mutation.name] -= 1

	to_chat(usr, SPAN_NOTICE("\The [usr] combines some mutations!"))
	held_mutations.combine(combined_mutations, MUT_TYPE_COMBINATION)






/*
=================Mutagenic Purger=================
Implant that clears ALL mutations from people when injected.

It also resets instability to 0 so bad things don't happen.
*/

/obj/item/genetics/purger
	name = "Blue-Ink Mutagenic Purger"
	desc = "An economic gene-fixer specifically made to purge mutations from the body. It takes a very long time to print."
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

	if(used)
		to_chat(user, SPAN_WARNING("The purger has been used!"))
		return

	user.setClickCooldown(DEFAULT_QUICK_COOLDOWN)
	user.do_attack_animation(target)

	if(do_mob(user, target, 50) && !used)
		icon_state = "cimplanter0"
		used = TRUE
		to_chat(target, SPAN_NOTICE("You feel your body begin to stabilize, and your anomalous mutations leave you."))
		target.unnatural_mutations.removeAllMutations()



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
	var/unique_id
	w_class = ITEM_SIZE_SMALL
	matter = list(MATERIAL_GLASS = 1)
	origin_tech = list(TECH_MATERIAL = 1, TECH_BIO = 1)
	var/datum/genetics/genetics_holder/genetics_holder = null

/obj/item/genetics/sample/New(var/datum/genetics/genetics_holder/incoming_holder)
	if(incoming_holder)
		name = "Mutagenic Sample Plate"
		icon_state = "slideblood"
		genetics_holder = incoming_holder.Copy()
	unique_id = sequential_id(type)

/obj/item/genetics/sample/proc/unload_genetics()
	var/datum/genetics/genetics_holder/outbound_genetics_holder = genetics_holder.Copy()
	name = "Empty Mutagenic Sample Plate"
	genetics_holder = null
	icon_state = "slide"
	return outbound_genetics_holder

/obj/item/genetics/sample/proc/sample_data(var/list/known_mutations)
	var/list/data = list()
	data["name"] = name
	data["unique_id"] = unique_id
	data += genetics_holder.ui_data(known_mutations)
	return data
/*
=================Mutagenic Implanter=================
Essentially a holder item for mutagenic samples. Installed on various machines and used for cloning, modifying, and so on.

Can also be loaded into a (Syringe probably) and injected into people. But that is a later item.
*/
/obj/item/genetics/mut_injector
	name = "Mutagenic Injector"
	desc = "A specialized syringe for injecting Mutagens into a host's system."
	icon = 'icons/obj/items.dmi'
	icon_state = "dnainjector0"
	item_state = "syringe_0"
	throw_speed = 1
	throw_range = 5
	var/obj/item/genetics/sample/loaded_sample

	w_class = ITEM_SIZE_SMALL
	matter = list(MATERIAL_GLASS = 1, MATERIAL_PLASTIC = 1, MATERIAL_STEEL = 1)

/obj/item/genetics/mut_injector/attack(mob/living/target, mob/living/user)
	if(!istype(target))
		return

	if(target.body_part_covered(user.targeted_organ))
		to_chat(user, SPAN_WARNING("The needle can't pierce through clothes."))
		return

	if(!loaded_sample)
		to_chat(user, SPAN_WARNING("The injector is empty!"))
		return

	if(!loaded_sample.genetics_holder)
		to_chat(user, SPAN_WARNING("The loaded sample plate is empty!"))
		return

	user.setClickCooldown(DEFAULT_QUICK_COOLDOWN)
	user.do_attack_animation(target)

	if(do_mob(user, target, 50) && src && loaded_sample)
		icon_state = "dnainjector0"
		var/datum/genetics/genetics_holder/injection = loaded_sample.unload_genetics()
		to_chat(user, SPAN_NOTICE("\The [user] injects a sample into \the [target]"))
		injection.inject_mutations(target)

/obj/item/genetics/mut_injector/attackby(obj/item/I as obj, mob/user as mob)
	..()
	if (istype(I, /obj/item/genetics/sample))
		var/obj/item/genetics/sample/incoming_sample = I

		if(loaded_sample)
			to_chat(user, SPAN_NOTICE("The mutagenic injector is already loaded!"))

		if(!loaded_sample && user.unEquip(incoming_sample, src))
			to_chat(user, SPAN_NOTICE("You load the mutagenic injector with a sample plate."))
			loaded_sample = incoming_sample
			icon_state = "dnainjector"

/obj/item/genetics/mut_injector/attack_self(var/mob/user)
	if(!loaded_sample)
		return ..()
	user.put_in_hands(loaded_sample)
	to_chat(user, SPAN_NOTICE("You remove the sample plate from \the [src]."))
	loaded_sample = null
	icon_state = "dnainjector0"
	return

/*
=================Embryo=================
A general purpose fetus for creation when genetics ends at a bad time, for whatever reason
icon = 'icons/obj/surgery.dmi'
icon_state='innards'
*/

/obj/item/genetics/reject
	name = "Genetic Reject"
	desc = "A product of hasty genetics work. Whatever this mound of flesh could have been, it will never see the light of day."
	icon = 'icons/obj/surgery.dmi'
	icon_state = "innards"

/obj/item/genetics/reject/New(var/parent_name)
	if(parent_name)
		name = "Genetic Reject of [parent_name]"
/*
=================Genetics Circuits=================
Circuit boards for different Genetics Machines.
*/

/obj/item/circuitboard/genetics/cloner
	build_name = "Belvoix Xenofauna Cloning Vat"
	build_path = /obj/machinery/genetics/cloner
	board_type = "machine"
	origin_tech = list(TECH_BIO = 6)
	req_components = list(
		/obj/item/stock_parts/manipulator = 2, //Affects the cloning speed
		/obj/item/stock_parts/scanning_module = 1, //Affects Breakout threshhold
		/obj/item/stock_parts/matter_bin = 1, //Affects Protein Consumption
	)
/obj/item/circuitboard/genetics/clone_console
	build_name = "Vat Control Console"
	build_path = /obj/machinery/computer/genetics/clone_console
	origin_tech = list(TECH_DATA = 3, TECH_BIO = 5)

/obj/item/circuitboard/genetics/pulper
	build_name = "Xenofauna Genetics Pulper"
	build_path = /obj/machinery/genetics/pulper
	board_type = "machine"
	origin_tech = list(TECH_DATA = 2, TECH_BIO = 3)

/obj/item/computer_hardware/hard_drive/portable/design/genetics_kit
	disk_name = "Genetics Studio Design Kit"
	icon_state = "moebius"
	license = 1
	designs = list(
		/datum/design/autolathe/genetics/pulper = 0,
		/datum/design/autolathe/genetics/cloner = 0,
		/datum/design/autolathe/genetics/clone_console = 0,
		/datum/design/autolathe/genetics/purger = 0
	)




/*
/obj/item/circuitboard/genetics_server
	build_name = "Genetics Server"
	build_path = /obj/machinery/computer/genetics_server
	board_type = "machine"
	origin_tech = list(TECH_DATA = 3)
	req_components = list(
		/obj/item/stack/cable_coil = 2,
		/obj/item/stock_parts/scanning_module = 1
	)
*/