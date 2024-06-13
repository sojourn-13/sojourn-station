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
================="Petite" Mutagenic Scanner=================
A more player-friendly version of the Belvoix scanner, reports basic information that can tell someone what tf is up with a person's genes.

*/
/obj/item/device/scanner/petite_scanner
	name = "Small Mutagenic Scanner"
	desc = "A compact device for monitoring the basics of a creature's genetic makeup."
	icon = 'icons/obj/genetics/dna_scanner.dmi'
	icon_state = "dna_scanner"
	item_state = "analyzer"
	origin_tech = list(TECH_BIO = 10, TECH_PLASMA = 5)
	matter = list(MATERIAL_PLASTIC = 2, MATERIAL_STEEL = 1, MATERIAL_GLASS = 1, MATERIAL_PLASMA = 1)
	charge_per_use = 0
	var/datum/genetics/genetics_holder/held_mutations

/obj/item/device/scanner/petite_scanner/is_valid_scan_target(atom/target)
	if(!istype(target, /mob/living) && !istype(target, /obj/item/reagent_containers/food/snacks/meat))
		to_chat(usr, SPAN_WARNING("A red dot blips, the scan target [target] is invalid."))
		return FALSE
	return TRUE

/obj/item/device/scanner/petite_scanner/afterattack(atom/A, mob/user, proximity)
	if(!proximity)
		return
	if(!can_use(user))
		return

	//Play the animation
	flick("scanning", src)

	if(is_valid_scan_target(A) && A.simulated)
		if(!is_virtual)
			user.visible_message(SPAN_NOTICE("[user] runs \the [src] over \the [A]."), range = 2)
			if(scan_sound)
				playsound(src, scan_sound, 30)
		else
			user.visible_message(SPAN_NOTICE("[user] focuses on \the [A] for a moment."), range = 2)
		if(use_delay && !do_after(user, use_delay, A))
			if(!is_virtual)
				to_chat(user, "You stop scanning \the [A] with \the [src].")
			else
				to_chat(user, "You stop focusing on \the [A].")
			return
		scan(A, user)
		if(!scan_title)
			scan_title = "[capitalize(name)] scan - [A]"

/obj/item/device/scanner/petite_scanner/scan(atom/target, mob/user)
	held_mutations = new /datum/genetics/genetics_holder()

	if(istype(target, /mob/living))
		var/mob/living/living_target = target
		held_mutations = living_target.unnatural_mutations.Copy()
	else if (istype(target, /obj/item/reagent_containers/food/snacks/meat))
		var/obj/item/reagent_containers/food/snacks/meat/meat_target = target
		held_mutations.initializeFromMeat(meat_target)
	scan_title = "Mutagenic Data - [target]"
	scan_data = petite_scan()
	show_results(user)

/obj/item/device/scanner/petite_scanner/proc/petite_scan()
	if(held_mutations.mutation_pool.len == 0 && held_mutations.total_instability == 0)
		return SPAN_WARNING("No genetic info found.")
	else
		var/list/dat = list("===[scan_title]===")
		var/total_mutation_count = 0
		var/unique_mutation_count = 0
		for(var/datum/genetics/mutation/mutagen in held_mutations.mutation_pool)
			unique_mutation_count++
			total_mutation_count += mutagen.count
		dat += "Total number of mutagenic strains: [total_mutation_count]"
		dat += "Total number of unique mutagenic strains: [unique_mutation_count]"
		if(held_mutations.total_instability < 90)
			dat += "Total level of instability: [held_mutations.total_instability]%"
		else
			dat += "<span class = 'danger'>Total level of instability: [held_mutations.total_instability]%</span>"

		return jointext(dat, "<br>")




/*
=================Mutagenic Purger=================
Implant that clears ALL mutations from people when injected.

It also resets instability to 0 so bad things don't happen.
*/

/obj/item/genetics/purger
	name = "Blue-Ink Mutagenic Purger"
	desc = "An economic gene-fixer specifically made to purge mutations from the body. It takes a very long time to print."
	icon = 'icons/obj/genetics/dna_syringes.dmi'
	icon_state = "dna_purger_b"
	item_state = "syringe_0"
	throw_speed = 1
	throw_range = 5
	w_class = ITEM_SIZE_SMALL
	matter = list(MATERIAL_PLASTIC = 2, MATERIAL_STEEL = 1, MATERIAL_URANIUM = 1)
	origin_tech = list(TECH_MATERIAL = 2, TECH_MAGNET = 4, TECH_BIO = 6)
	var/used = FALSE
	var/datum/genetics/genetics_holder/held_mutations

/obj/item/genetics/purger/attack(mob/living/target, mob/living/user)
	if(!istype(target))
		return

	if(target.body_part_covered(user.targeted_organ))
		to_chat(user, SPAN_WARNING("The needle can't pierce through clothes."))
		return

	if(issynthetic(target))
		to_chat(user, SPAN_WARNING("The needle can't pierce synthetic casing- and anything held inside probably wouldn't work on a robot."))
		return

	if(istype(target, /mob/living/carbon/human))
		var/mob/living/carbon/human/H = target
		if(H && H.species && H.species.reagent_tag == IS_SYNTHETIC)
			to_chat(user, SPAN_WARNING("The needle can't pierce synthetic casing- and anything held inside probably wouldn't work on a robot."))
			return

	if(used)
		to_chat(user, SPAN_WARNING("The purger has been used!"))
		return

	user.setClickCooldown(DEFAULT_QUICK_COOLDOWN)
	user.do_attack_animation(target)

	if(do_mob(user, target, 50) && !used)
		icon_state = "dna_purger_empty"
		used = TRUE
		to_chat(target, SPAN_NOTICE("You feel your body begin to stabilize, and your anomalous mutations leave you."))
		target.unnatural_mutations.removeAllMutations()
		target.unnatural_mutations.total_instability = 0 // Now it does reset instability to zero



/*
=================Mutagenic Sample Plate=================
Essentially a holder item for mutagenic samples. Installed on various machines and used for cloning, modifying, and so on.

Can also be loaded into a (Syringe probably) and injected into people. But that is a later item.
*/
/obj/item/genetics/sample
	name = "Empty Mutagenic Sample Plate"
	desc = "A container for holding, analyzing and transferring mutagens."
	icon = 'icons/obj/genetics/dna_machine_samples.dmi'
	icon_state = "sample_0c"
	var/unique_id
	w_class = ITEM_SIZE_SMALL
	matter = list(MATERIAL_GLASS = 1)
	origin_tech = list(TECH_MATERIAL = 1, TECH_BIO = 1)
	var/datum/genetics/genetics_holder/genetics_holder = null

/obj/item/genetics/sample/New(var/datum/genetics/genetics_holder/incoming_holder)
	if(incoming_holder)
		name = "Mutagenic Sample Plate"
		icon_state = "sample_1c"
		genetics_holder = incoming_holder.Copy()
	unique_id = sequential_id(type)

/obj/item/genetics/sample/proc/unload_genetics()
	var/datum/genetics/genetics_holder/outbound_genetics_holder = genetics_holder.Copy()
	name = "Empty Mutagenic Sample Plate"
	genetics_holder.removeAllMutations()
	icon_state = "sample_0c"
	return outbound_genetics_holder

/obj/item/genetics/sample/proc/sample_data(var/list/known_mutations)
	var/list/data = list()
	data["name"] = name
	data["unique_id"] = unique_id
	data += genetics_holder.nano_ui_data(known_mutations)
	return data
/*
=================Mutagenic Implanter=================
Essentially a holder item for mutagenic samples. Installed on various machines and used for cloning, modifying, and so on.

Can also be loaded into a (Syringe probably) and injected into people. But that is a later item.
*/
/obj/item/genetics/mut_injector
	name = "Mutagenic Injector"
	desc = "A specialized syringe for injecting Mutagens into a host's system."
	icon = 'icons/obj/genetics/dna_syringes.dmi'
	icon_state = "dna_injector_0"
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

	if(issynthetic(target))
		to_chat(user, SPAN_WARNING("The needle can't pierce synthetic casing- and anything held inside probably wouldn't work on a robot."))
		return

	if(istype(target, /mob/living/carbon/human))
		var/mob/living/carbon/human/H = target
		if(H && H.species && H.species.reagent_tag == IS_SYNTHETIC)
			to_chat(user, SPAN_WARNING("The needle can't pierce synthetic casing- and anything held inside probably wouldn't work on a robot."))
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
		icon_state = "dna_injector_0"
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
			icon_state = "dna_injector_1"

/obj/item/genetics/mut_injector/attack_self(var/mob/user)
	if(!loaded_sample)
		return ..()
	user.put_in_hands(loaded_sample)
	to_chat(user, SPAN_NOTICE("You remove the sample plate from \the [src]."))
	loaded_sample = null
	icon_state = "dna_injector_0"
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
=================Flesh Sac=================
A holder for items we make with Genetics. Helps add a visceral element to object creation through this process.
*/
/obj/item/genetics/flesh_sac
	name = "Flesh Sac"
	desc = "An undilating facsimile of life, carrying with it unknown contents."
	icon = 'icons/obj/genetics/flesh_sac.dmi'
	icon_state = "flesh_sac"
	w_class = ITEM_SIZE_GARGANTUAN
	density = TRUE
	var/list/loot = list()
	var/max_loot_size = 10
	var/loot_size = 0

/obj/item/genetics/flesh_sac/attackby(obj/item/I as obj, mob/user as mob)
	..()
	if(loot_size > max_loot_size)
		playsound(src.loc, 'sound/effects/splat.ogg', 50, 1)
		new /obj/effect/decal/cleanable/blood/splatter(get_turf(src))
		user.visible_message(SPAN_NOTICE("The [src] bursts into a mass of unidentifiable meat the moment \the [user] touches it! Must have been too full..."))
		qdel(src)

	if(QUALITY_CUTTING in I.tool_qualities)
		if(I.use_tool(user, src, WORKTIME_NORMAL, QUALITY_CUTTING, FAILCHANCE_EASY, required_stat = STAT_BIO))
			playsound(src.loc, 'sound/effects/splat.ogg', 50, 1)
			new /obj/effect/decal/cleanable/blood/splatter(get_turf(src))
			user.visible_message(SPAN_NOTICE("[user] rips open the [src] in a shower of gore!"))
			for(var/loot_item in loot)
				if(ispath(loot_item, /obj))
					var/obj/instanced_item = new loot_item()
					instanced_item.loc = get_turf(src)
			qdel(src)
		else
			playsound(src.loc, 'sound/effects/splat.ogg', 50, 1)
			new /obj/effect/decal/cleanable/blood/splatter(get_turf(src))
			user.visible_message(SPAN_NOTICE("[user] destroys the contents of the [src]."))
			qdel(src)

/obj/item/genetics/flesh_sac/greater
	name = "Flesh Sac"
	desc = "An undilating facsimile of life, carrying with it unknown contents. Seems capable of holding much more than usual."
	max_loot_size = 40

/obj/item/genetics/flesh_sac/greater/superior
	name = "The Great Ball"
	desc = "An undilating facsimile of life, carrying with it unknown contents. It looks like it is about to burst."
	loot = list(
		/obj/item/organ/internal/nerve/sensitive_nerve,
		/obj/item/organ/internal/nerve/sensitive_nerve,
		/obj/item/organ/internal/nerve/sensitive_nerve,
		/obj/item/organ/internal/nerve/sensitive_nerve,
		/obj/item/organ/internal/nerve/sensitive_nerve,
		/obj/item/organ/internal/nerve/sensitive_nerve,
		/obj/item/organ/internal/nerve/sensitive_nerve,
		/obj/item/organ/internal/muscle/super_muscle,
		/obj/item/organ/internal/muscle/super_muscle,
		/obj/item/organ/internal/muscle/super_muscle,
		/obj/item/organ/internal/muscle/super_muscle,
		/obj/item/organ/internal/blood_vessel/extensive,
		/obj/item/organ/internal/blood_vessel/extensive,
		/obj/item/organ/internal/blood_vessel/extensive,
		/obj/item/organ/internal/blood_vessel/extensive,
		/obj/item/organ/internal/blood_vessel/extensive,
		/obj/item/organ/internal/blood_vessel/extensive,
		/obj/item/organ/internal/blood_vessel/extensive,
		/obj/item/organ/internal/liver/big,
		/obj/item/organ/internal/vital/lungs/long,
		/obj/item/organ/internal/vital/heart/huge)
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

/obj/item/circuitboard/genetics/gene_analyzer
	build_name = "Belvoix Genetic Analyzer"
	build_path = /obj/machinery/genetics/gene_analyzer
	board_type = "machine"
	origin_tech = list(TECH_DATA = 2, TECH_BIO = 3)
	req_components = list(
		/obj/item/stock_parts/scanning_module = 4, //Affects Genes Analyzed
		/obj/item/stock_parts/matter_bin = 4, //Affects Max Sample plates
	)

/obj/item/computer_hardware/hard_drive/portable/design/genetics_kit
	disk_name = "Genetics Studio Design Kit"
	desc = "A disc containing patented designs for the Xenogenetics lab. Contains additional licensed products from the lab's creator."
	icon = 'icons/obj/genetics/genetics_disks.dmi'
	icon_state = "genetics_factory"
	license = 10
	designs = list(
		/datum/design/autolathe/genetics/pulper = 1,
		/datum/design/autolathe/genetics/cloner = 1,
		/datum/design/autolathe/genetics/clone_console = 1,
		/datum/design/autolathe/genetics/purger = 0,
		/datum/design/autolathe/genetics/mut_injector = 0,
		/datum/design/autolathe/genetics/petite_scanner = 1
	)

/obj/item/computer_hardware/hard_drive/portable/design/genetics_kit_public
	disk_name = "Genetics Studio Resupply Kit"
	desc = "A disc containing quality-of-life designs for the Xenogenetics lab."
	icon = 'icons/obj/genetics/genetics_disks.dmi'
	icon_state = "genetics_purger"
	license = 3
	designs = list(
		/datum/design/autolathe/genetics/purger = 0,
		/datum/design/autolathe/genetics/mut_injector = 0,
		/datum/design/autolathe/genetics/petite_scanner = 1
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

/*
=================Xenogenetics Poster=================
Poster in R&D that gives helpful tips about Mutation Recipes.
Neglects to mention where to find its pieces.
*/

/obj/structure/sign/genetics
	name = "Xenogenetics Informational poster"
	desc = "Contains helpful device on Genetics. Unless you're reading this placeholder text, at least."
	icon = 'icons/obj/genetics/genetic_poster.dmi'
	icon_state = "genetic_poster"


/obj/structure/sign/genetics/Initialize()
	var/blurb = pick(list(
		"Roach DNA can be irradiated into a plethora of different breeds!",
		"Warning- The Gigantism gene combined with roach DNA can have hazardous results!",
		"Spider DNA can be irradiated into a plethora of different breeds!",
		"Termite DNA can be irradiated to a plethora of different breeds!",
		"Some termites can be made even larger!",
		"Loud sounds mixed with specific friends can lead to buddy's when you need it most.",
		"Cats can be made both bigger and smaller!",
		"Making a dog too big will result in a bear.",
		"The Gigantism gene only produces an Empress spider when combined with egg-laying spider DNA.",
		"The Gigantism gene only produces an Emperor spider when combined with Tarantula-type spider DNA.",
		"Do NOT, under ANY CIRCUMSTANCES, clone the combination of an emperor and an empress spider.",
		"When you get right down to it, Tatonkas are really just two cows stitched together.",
		"Tangu are like tatonka, only the DNA to clone them has been combined with 2 layers of cow skin.",
		"Mukwah are bears that have been irradiated by the planet's anomalous energy.",
		"Cerberus are formerly pigs, irradiated by the planet's anomalous energy.",
		"Chimera are Cerberus that develop with an accelerated heart beat. Combining their DNA with the Nervousness mutation should do the trick.",
		"Cluckers are chickens irradiated by the planet's anomalous energy.",
		"Tengolo Brutes, Chargers, and Stalkers are the Diyaabs' closest relatives.",
		"Hell Pigs can be created from a combination of Pig DNA and Tengolo Charger DNA.",
		"Hell Pigs can be created from a combination of Tahca DNA and Tengolo Charger DNA.",
		"Hell Pigs can be made with a Tengolo Charger and the gigantism mutation.",
		"Slepnir can be created from a combination of Pig DNA and Tengolo Brute DNA.",
		"Slepnir can be created from a combination of Tahca DNA and Tengolo Brute DNA.",
		"Slepnir can be made with a Tengolo Brute and the gigantism mutation.",
		"Wendigo can be created from a combination of Pig DNA and Tengolo Stalker DNA.",
		"Wendigo can be created from a combination of Tahca DNA and Tengolo Stalker DNA.",
		"Wendigo can be made with a Tengolo Stalker and the gigantism mutation.",
		"Croaker lords are frogs with gigantism.",
		"Dream Deamons surpass Nightmare Stalkers in size and stealth thanks to an electromagnetic field surrounding them.",
		"Bears can be stained brown with chocolate milk.",
		"Bears can be stained white with robust milk.",
		"A bat is kind of like a chicken with leathery skin.",
		"Sargoyle can be created by giving bats gigantism",
		"Giant snakes have snake DNA combined with gigantism.",
		"Opossum have mouse DNA combined with gigantism.",
		"You can increase milk production in cows by combining two copies of the 'Moo' mutation.",
		"Protein Milk, achievable by mixing the 'Moo' and 'Imbecile' mutation!",
		"Chocolate Milk, achievable by irradiating the 'Moo' mutation!",
		"The Hyperion mutation can enhance cloned organs, like the Heart.",
		"The Hyperion mutation can enhance cloned organs, like the Lungs.",
		"The Hyperion mutation can enhance cloned organs, like the Liver.",
		"The Hyperion mutation can enhance cloned organs, like the Blood Vessels.",
		"The Hyperion mutation can enhance cloned organs, like the Nerves.",
		"The Hyperion mutation can enhance cloned organs, like the Muscles.",
		"Mixed with a cloking mutation, the Hyperion mutation can be combined to cause phasing.",
		"A greater cloaking mutation can be irradiated to cause phasing.",
		"The DNA of a golden roach can be combined with an imbecile mutation to make a mutagen that enforces docility.",
		"The barotrauma mutation can be irradiated to make a strain that removes a need for breathing.",
		"The Bald mutation, combined with the Gigantism mutation, result in a Hulk mutation.",
		"Flesh sacs can be achieved through irradiated human DNA- if you're a bad person.",
		"Flesh sacs can be achieved through irradiated vatgrown DNA- if you're a morally ambiguous person.",
		"Flesh sacs can be achieved through irradiated monkey DNA with only limited moral quandaries!",
		"Bank to Bank, River to River, Ocean to Ocean, weaved together to make a Temple.",
		"Eye's of a cat, belly of a beast and a bank of blood will make a most regal sickness.",
		"If you combine the mutations that make roaches and spiders accept you, you can create a mutation that will cause them to ignore you."))
	desc = "Xenogenetics fact of the day: [blurb]"

