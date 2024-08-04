#define CLONING_STAGE_BASE 		20	//Points needed to advance a stage
#define CLONING_BREAKOUT_POINT	200
#define BASE_PROTEIN_CONSUMPTION 20

#define ANIM_OPEN 1
#define ANIM_NONE 0
#define ANIM_CLOSE -1


#define SEND_PRESSURE (700 + ONE_ATMOSPHERE) //kPa - assume the inside of a dispoal pipe is 1 atm, so that needs to be added.
#define PRESSURE_TANK_VOLUME 150	//L
#define PUMP_MAX_FLOW_RATE 90		//L/s - 4 m/s using a 15 cm by 15 cm inlet

/*
===============================================================================================================================================
Belvoix Cloning Chamber

A cloning machine for Genetics- basically, it takes mutation holders and makes mobs based on what "cloning" mutation is active in it.
This machine allows us to create more genetic research data in R&D without necessarily needing a steady supply of meat Because cloning
takes time, donated meat will still save a lot of time for the department, but they aren't extremely necessary so long as we have at
least ONE meat of certain types.

The cloning vat requires animal protein to function, loaded into a BIDON can for easy usage. Getting enough meat is part of the genetics loop,
but can be supported with synthetic meat from xenobotany.

The cloner is operated by loading a filled "Sample Plate" into the cloning machine, anchoring a bidon can to the WEST of a cloning vat, and
turning on the cloner through the control console. The cloner then drains protein from the anchored bidon can, and slowly grows the creature
over time.

Once the creature is grown, the user has to manually vent the grown mob down a disposal pipe into a containment room. If they don't, the creature
will continue to consume protein and eventually break out of the vat and even start attacking people if it is hostile.

This makes cloning vat is probably the most dangerous tool in Genetics. Because science needs a little danger to be interesting.
===============================================================================================================================================
*/

/obj/machinery/genetics/cloner
	name = "Belvoix Xenofauna Cloning Vat"
	desc = "A heavily customized cloning vat, retooled for cloning strange and fantastic creatures far and beyond regular fauna. Requires a steady supply of protein to function."
	icon = 'icons/obj/neotheology_pod.dmi'
	icon_state = "preview"
	frame_type = FRAME_VERTICAL
	circuit = /obj/item/circuitboard/genetics/cloner

	density = TRUE
	anchored = TRUE
	layer = 2.8
	var/obj/machinery/computer/genetics/clone_console/reader
	var/reader_loc

	var/obj/structure/reagent_dispensers/bidon/container
	var/container_loc

	var/mob/living/occupant

	var/obj/item/genetics/reject/embryo //Held in the cloner for on-failure events.

	var/obj/item/nonliving_occupant //If or when we're cloning a biological item instead of a mob.

	var/cloning = FALSE //Whether or not the machine is currently attempting to make a clone.

	var/closed = FALSE //Animation marker for closing the vat.

	var/clone_ready = FALSE //If the clone is ready to be expelled

	var/ready_message = FALSE //If the "Clone ready" message has been sent yet

	var/cloning_stage_counter = CLONING_STAGE_BASE

	var/breakout_point = CLONING_BREAKOUT_POINT //The amount of "overgrowing" required to cause a creature to break out of containment.

	var/cloning_speed  = 5	//Try to avoid use of non integer values

	var/embryo_stage = 0 //Which stage the embryo is currently in

	var/feed_the_beast = 0 //1= beast is hungry, 2= beast breaks out. Only increments if the clone is ready and protein is scarce.

	var/progress = 0

	var/progress_increment = 30 SECONDS

	var/progress_benchmark

	//How much protein is eaten in order to advance the progress by the cloning speed.
	//Higher numbers means the clone eats MORE MEAT.
	var/protein_consumption = BASE_PROTEIN_CONSUMPTION
	var/protein_mod = CLONE_MEDIUM // modifier changing how much protein is consumed by cloning

	var/datum/genetics/genetics_holder/clone_info //Genetics holder for the mob

	var/datum/genetics/mutation/clone_mutation // The clone mutatation being used to create the mob.

	var/image/anim0 = null
	var/image/anim1 = null

	var/power_cost = 250

	anchor_direction = WEST //Direction the bidon can should be anchored in
	anchor_type = /obj/structure/reagent_dispensers/bidon //Allows a bidon can to be anchored to this.


	//Disposals info
	var/datum/gas_mixture/air_contents	// internal reservoir
	var/mode = 1	// item mode 0=off 1=charging 2=charged
	var/flush = FALSE	// true if flush handle is pulled
	var/obj/structure/disposalpipe/trunk/trunk = null // the attached pipe trunk
	var/flushing = FALSE	// true if flushing in progress
	var/last_sound = 0
	active_power_usage = 2200	//the pneumatic pump power. 3 HP ~ 2200W
	idle_power_usage = 100

/obj/machinery/genetics/cloner/New()
	..()
	icon = 'icons/obj/neotheology_machinery.dmi'
	progress_benchmark = world.time
	spawn(5)
		trunk = locate() in src.loc
		if(!trunk)
			mode = 0
			flush = FALSE
		else
			trunk.linked = src	// link the pipe trunk to self

		air_contents = new/datum/gas_mixture(PRESSURE_TANK_VOLUME)

	update_icon()

/obj/machinery/genetics/cloner/Destroy()
	if(occupant)
		qdel(occupant)
	if(trunk)
		trunk.linked = null
	return ..()

/obj/machinery/genetics/cloner/proc/find_container()
	var/turf/turf_west = get_step(get_turf(src), WEST)
	var/obj/structure/reagent_dispensers/bidon/container_west = locate(/obj/structure/reagent_dispensers/bidon, turf_west)
	if(container_west && container_west.anchored_machine == src)
		return container_west
	return null

/obj/machinery/genetics/cloner/proc/addLog(var/message)
	if(reader)
		reader.addLog(message)
	

/obj/machinery/genetics/cloner/proc/find_reader()
	//every direction but west and north
	var/list/check_directions = list(SOUTHWEST, SOUTH, SOUTHEAST, EAST, NORTHWEST, NORTH, NORTHEAST)

	//check a step in that direction for the console
	for (var/direction in check_directions)
		var/turf/turf_not_west = get_step(get_turf(src), direction)
		var/obj/machinery/computer/genetics/clone_console/reader = locate(/obj/machinery/computer/genetics/clone_console, turf_not_west)
		if(reader)
			return reader
	return null

/obj/machinery/genetics/cloner/return_air_for_internal_lifeform()
	//assume that the cryo cell has some kind of breath mask or something that
	//draws from the cryo tube's environment, instead of the cold internal air.
	if(loc)
		return loc.return_air()
	else
		return null

/obj/machinery/genetics/cloner/proc/breakout()
	//TODO: Glass shattering stuff.

	eject_contents()
	stop()


/obj/machinery/genetics/cloner/proc/eject_contents()

	if(occupant)
		if(clone_ready)
			occupant.forceMove(loc)
		occupant = null
	else if (nonliving_occupant)
		if(clone_ready)
			nonliving_occupant.forceMove(loc)
		nonliving_occupant = null
	else if (embryo)
		embryo.forceMove(loc)
		embryo = null

	protein_mod = initial(protein_mod)

	stop()
	update_icon()


/obj/machinery/genetics/cloner/proc/start()
	log_debug("Genetics cloner: Ran Start()")

	reader = find_reader()
	if(!reader)
		visible_message(SPAN_DANGER("The Cloning Vat says: \"Error, Operations console not detected~!\""))
		return
	reader_loc = reader.loc

	if(cloning)
		addLog("Error, Cloning already in progress~!")
		return

	if(embryo)
		addLog("Error, Please vacate the dead embryo from the chamber~!")
		return

	container = find_container()
	if(!container)
		addLog("Error, Protein canister not detected~!")
		return

	container_loc = container.loc

	trunk = locate() in src.loc
	if(!trunk)
		addLog("Error, Pipe trunk not detected~!")
		return

	if(!clone_info)
		addLog("Error, Genetic Sample Plate not detected~!")
		return

	clone_mutation = clone_info.findCloneMutation()

	if(!clone_mutation)
		addLog("Error, Cloning data not found~!")
		return

	progress = 0
	embryo_stage = 0

	cloning = TRUE

	clone_ready = FALSE

	occupant = null

	protein_mod = initial(protein_mod)

	closed = TRUE

	ready_message = FALSE

	embryo_stage = 0
	embryo = new /obj/item/genetics/reject(clone_mutation.source_name)

	//Create the mobs/items for later reference.
	var/clone_type = clone_mutation.onClone()
	if(ispath(clone_type, /mob/living))
		occupant = new clone_type()
		occupant.loc = src
		occupant.drop_items = null
		clone_info.inject_mutations(occupant)
		protein_mod = occupant.clone_difficulty
		//Run any special cloning mutations that only proc on creature creation.
		for (var/datum/genetics/mutation/clone_create_mutation in clone_info.mutation_pool)
			if(clone_create_mutation.active)
				clone_create_mutation.postCloneCreation(occupant)


	if(ispath(clone_type, /obj/item))
		nonliving_occupant = new clone_type()
		nonliving_occupant.loc = src
		//Run any special cloning mutations that only proc on creature creation.
		for (var/datum/genetics/mutation/clone_create_mutation in clone_info.mutation_pool)
			if(clone_create_mutation.active)
				clone_create_mutation.postCloneCreation(nonliving_occupant)

	feed_the_beast = 0

	close_anim()

	update_icon()
	return TRUE

/obj/machinery/genetics/cloner/proc/stop()
	if(!cloning)
		return

	cloning = FALSE
	closed = FALSE
	//if(reader)
		//reader.reading = FALSE
		//reader.update_icon()

	progress = 0
	embryo_stage = 0
	clone_ready = FALSE

	protein_mod = initial(protein_mod)

	update_icon()
	return TRUE


//Derived function from:
//obj/structure/disposalholder/proc/init(var/obj/machinery/disposal/D, var/datum/gas_mixture/flush_gas)
/obj/machinery/genetics/cloner/proc/init_disposal_holder()
	var/obj/structure/disposalholder/holder = new()

	holder.from_cloner = TRUE

	//Check for any living mobs trigger hasmob.
	//hasmob effects whether the package goes to cargo or its tagged destination.
	if(clone_ready)
		if(occupant)
			holder.has_mob = TRUE
			occupant.forceMove(holder)
			occupant = null
		if (nonliving_occupant)
			nonliving_occupant.forceMove(holder)
			nonliving_occupant = null


	if(!clone_ready && embryo)
		embryo.forceMove(holder)
	embryo = null

	if(!trunk)
		addLog("Pipe not conected. Aborting Cloning proceedure.")
		return

	holder.forceMove(trunk)
	holder.active=TRUE
	holder.set_dir(DOWN)
	spawn(1)
		holder.move()		// spawn off the movement process

/obj/machinery/genetics/cloner/proc/get_progress()
	return round(progress / cloning_stage_counter)


/obj/machinery/genetics/cloner/Process()
	if(cloning)
		if(stat & NOPOWER)
			return

		use_power(power_cost)

		if(!reader || reader.loc != reader_loc || !container || container.loc != container_loc)
			open_anim()
			stop()
			update_icon()
			return

		if(progress_benchmark <= world.time)
			progress_benchmark = world.time + progress_increment
			progress+=cloning_speed

			embryo_stage = get_progress()
			if(embryo_stage >= 5)
				clone_ready = TRUE

			addLog("Dispensing Protein to the Test Subject.")

			//Feed the beast.
			if(progress <= breakout_point)
				if(container)
					//This is the part where we drain protein from the container
					if(!container.reagents.remove_reagent("protein", round(protein_consumption * protein_mod)))
						if(clone_ready)
							feed_the_beast += 1
							if(feed_the_beast == 1)
								visible_message(SPAN_DANGER("The creature bashes against the inside of the vat."))
							if(feed_the_beast == 2)
								visible_message(SPAN_DANGER("The creature's thrashing causes cracks the glass of the vat!"))
							if(feed_the_beast == 3)
								visible_message(SPAN_DANGER("The creature breaks free!"))
								//TODO: SPECIAL BREAKOUT EVENT
								breakout()
						else
							addLog("Protein not available~, The Embryo has starved to death.")
							stop() //The clone is dead.
					else if(clone_ready)
						visible_message(SPAN_DANGER("The creature inside the cloning vat begins to stir..."))
				else
					addLog("Protein container not found~, The Embryo has starved to death.")
					stop()
			else
				breakout()

	if (clone_ready && !ready_message)
		addLog("The Test Subject has Matured~!")
		ready_message = TRUE
		embryo = null

	//Disposal loop
	if(flush && air_contents.return_pressure() >= SEND_PRESSURE )	// flush can happen even without power
		addLog("Flushed the Test Subject down the disposal pipe~")
		flush()
	if(mode != 1) //if off or ready, no need to charge
		update_use_power(1)
	else if(air_contents.return_pressure() >= SEND_PRESSURE)
		mode = 2 //if full enough, switch to ready mode
	else
		src.pressurize() //otherwise charge

/obj/machinery/genetics/cloner/proc/pressurize()
	if(stat & NOPOWER)			// won't charge if no power
		update_use_power(0)
		return

	var/atom/L = loc						// recharging from loc turf
	var/datum/gas_mixture/env = L.return_air()

	var/power_draw = -1
	if(env && env.temperature > 0)
		var/transfer_moles = (PUMP_MAX_FLOW_RATE/env.volume)*env.total_moles	//group_multiplier is divided out here
		power_draw = pump_gas(src, env, air_contents, transfer_moles, active_power_usage)

	if (power_draw > 0)
		use_power(power_draw)

// perform a flush
/obj/machinery/genetics/cloner/proc/flush()
	flushing = TRUE


	// virtual holder object which actually travels through the pipes.
	init_disposal_holder()

	stop()

	air_contents = new(PRESSURE_TANK_VOLUME)	// new empty gas resv.
	flushing = FALSE
	// now reset disposal state
	flush = FALSE
	if(mode == 2)	// if was ready,
		mode = 1	// switch to charging
	return

//upgrading parts
/obj/machinery/genetics/cloner/RefreshParts()
	..()
	var/manip_rating = 0
	var/scanner_rating = 0
	var/bin_rating = 0

	for(var/obj/item/stock_parts/part in component_parts)
		if(istype(part, /obj/item/stock_parts/manipulator))
			manip_rating += part.rating
		if(istype(part, /obj/item/stock_parts/matter_bin))
			bin_rating += part.rating
		if(istype(part, /obj/item/stock_parts/scanning_module))
			scanner_rating += part.rating

	//Something that might be pretty good to have along with other top tier parts
	breakout_point = CLONING_BREAKOUT_POINT * scanner_rating

	if(manip_rating >= 10)
		cloning_speed = 50
	else
		cloning_speed = initial(cloning_speed) + ((manip_rating-2) * 5)

	//Faster cloning speed means higher protein consumption.
	protein_consumption = round(BASE_PROTEIN_CONSUMPTION * (2 / (bin_rating))) * (cloning_speed/5)

/obj/machinery/genetics/cloner/attackby(obj/item/I, mob/user)
	if(!user.stats?.getPerk(PERK_SI_SCI) && !usr.stat_check(STAT_COG, 90) &&!user.stats?.getPerk(PERK_NERD) && !usr.stat_check(STAT_BIO, 180))
		to_chat(usr, SPAN_WARNING("The console pityingly suggests: \"Sorry hun, you were pressing some weird buttons so I locked you out~ Maybe have a scientist help~?\""))
		return

	if(default_deconstruction(I, user))
		return
	if(default_part_replacement(I, user))
		return

	//Inserting a sample
	if(istype(I, /obj/item/genetics/sample))
		var/obj/item/genetics/sample/incoming_sample = I
		if(!incoming_sample.genetics_holder)
			to_chat(user, SPAN_WARNING("This sample has no genetic data left."))
			return
		clone_info = incoming_sample.unload_genetics()
		to_chat(user, SPAN_WARNING("You load Genetic Data into the cloner."))
		return
	else
		. = ..()

/obj/machinery/genetics/cloner/proc/close_anim()
	qdel(anim0)
	anim0 = image(icon, "pod_closing0")
	anim0.layer = 5.01

	qdel(anim1)
	anim1 = image(icon, "pod_closing1")
	anim1.layer = 5.01
	anim1.pixel_z = 32

	update_icon()
	spawn(20)
		qdel(anim0)
		qdel(anim1)
		anim0 = null
		anim1 = null
		update_icon()

	return TRUE

/obj/machinery/genetics/cloner/proc/open_anim()
	qdel(anim0)
	anim0 = image(icon, "pod_opening0")
	anim0.layer = 5.01

	qdel(anim1)
	anim1 = image(icon, "pod_opening1")
	anim1.layer = 5.01
	anim1.pixel_z = 32

	update_icon()
	spawn(20)
		qdel(anim0)
		qdel(anim1)
		anim0 = null
		anim1 = null
		update_icon()

	return TRUE

/obj/machinery/genetics/cloner/update_icon()
	icon_state = "pod_base0"

	cut_overlays()

	if(panel_open)
		var/image/P = image(icon, "pod_panel")
		add_overlay(P)

	var/image/I = image(icon, "pod_base1")
	I.layer = 5
	I.pixel_z = 32
	add_overlay(I)

	if(closed)
		I = image(icon, "pod_under")
		I.layer = 5
		add_overlay(I)

		I = image(icon, "pod_top_on")
		I.layer = 5.021
		I.pixel_z = 32
		add_overlay(I)


	/////////BODY
	if(cloning)
		var/icon/IC = icon('icons/obj/surgery.dmi', "innards")
		I = image(IC)
		I.layer = 5
		I.pixel_z = 11

		add_overlay(I)

	//////////////

	if(closed)
		if(!anim0 && !anim1)
			I = image(icon, "pod_glass0")
			I.layer = 5.01
			add_overlay(I)

			I = image(icon, "pod_glass1")
			I.layer = 5.01
			I.pixel_z = 32
			add_overlay(I)

			I = image(icon, "pod_liquid0")
			I.layer = 5.01
			add_overlay(I)

			I = image(icon, "pod_liquid1")
			I.layer = 5.01
			I.pixel_z = 32
			add_overlay(I)

	if(anim0 && anim1)
		add_overlay(anim0)
		add_overlay(anim1)

	I = image(icon, "pod_top0")

	if(!cloning)
		I.layer = layer
	else
		I.layer = 5.02

	add_overlay(I)

	I = image(icon, "pod_top1")
	I.layer = 5.02
	I.pixel_z = 32
	add_overlay(I)

/*
//Debugging
/obj/machinery/genetics/cloner/verb/eject_cloneling()
	set category = "Debug"
	set name = "Eject Contents"
	set src in view(1)
	eject_contents()
	stop()

/obj/machinery/genetics/cloner/verb/start_cloneling()
	set category = "Debug"
	set name = "Start Cloning"
	set src in view(1)
	start()

/obj/machinery/genetics/cloner/verb/manual_flush()
	set category = "Debug"
	set name = "Manual Flush"
	set src in view(1)
	flush = TRUE
*/
#undef CLONING_STAGE_BASE
#undef CLONING_BREAKOUT_POINT
#undef BASE_PROTEIN_CONSUMPTION

#undef ANIM_OPEN
#undef ANIM_NONE
#undef ANIM_CLOSE

#undef SEND_PRESSURE
#undef PRESSURE_TANK_VOLUME
#undef PUMP_MAX_FLOW_RATE

/*
===============================================================================================================================================
Vat Control Console

A control console for the Cloning Vat, has displays to monitor the can usage and logs messages. It displays the (known) active mutations and
instability in the creature being cloned. It also links up to the core R&D console, for eventually interfacing to see what mutations are known
and which aren't.
===============================================================================================================================================
*/

#define VAT_MENU_WORKING 0
#define VAT_MENU_SELECT 1


/obj/machinery/computer/genetics/clone_console
	name = "Vat Control Console"
	desc = "A console for controlling and monitoring crimes against nature."
	icon_keyboard = "teleport_key"
	icon_screen = "medcomp"

	var/cloneLog = ""
	var/menuOption = VAT_MENU_SELECT
	circuit = /obj/item/circuitboard/genetics/clone_console
	var/obj/machinery/genetics/cloner/linked_cloner
	var/obj/structure/reagent_dispensers/bidon/linked_bidon

/obj/machinery/computer/genetics/clone_console/New()
	sync()

/obj/machinery/computer/genetics/clone_console/proc/sync()
	for(var/obj/machinery/genetics/cloner/adjacent_cloner in orange(1,src))
		linked_cloner = adjacent_cloner

	if(linked_cloner)
		for(var/obj/structure/reagent_dispensers/bidon/adjacent_bidon in orange(1,linked_cloner))
			if(adjacent_bidon.anchored_machine == linked_cloner)
				linked_bidon = adjacent_bidon
	menuOption = VAT_MENU_SELECT
	SSnano.update_uis(src) // update all UIs attached to src

/obj/machinery/computer/genetics/clone_console/Initialize()
	. = ..()
	sync()
	addLog("Belvoix Cloning Vat Console initialized. Welcome~")

/obj/machinery/computer/genetics/clone_console/proc/addLog(string)
	cloneLog = "\[[stationtime2text()]\] " + string + "<br>" + cloneLog

/obj/machinery/computer/genetics/clone_console/attack_hand(mob/user)
	if(!user.stats?.getPerk(PERK_SI_SCI) && !usr.stat_check(STAT_COG, 75) &&!user.stats?.getPerk(PERK_NERD) && !usr.stat_check(STAT_BIO, 150))
		to_chat(usr, SPAN_WARNING("This is a bit beyond your cognitive understanding."))
		return
	if(..())
		return TRUE
	nano_ui_interact(user)

 /**
  * The nano_ui_interact proc is used to open and update Nano UIs
  * If nano_ui_interact is not used then the UI will not update correctly
  * nano_ui_interact is currently defined for /atom/movable (which is inherited by /obj and /mob)
  *
  * @param user /mob The mob who is interacting with this ui
  * @param ui_key string A string key to use for this ui. Allows for multiple unique uis on one obj/mob (defaut value "main")
  * @param ui /datum/nanoui This parameter is passed by the nanoui process() proc when updating an open ui
  *
  * @return nothing
  */
/obj/machinery/computer/genetics/clone_console/nano_ui_interact(mob/user, ui_key = "main", datum/nanoui/ui = null, force_open = NANOUI_FOCUS)
	// this is the data which will be sent to the ui
	var/list/data = form_data()
	ui = SSnano.try_update_ui(user, src, ui_key, ui, data, force_open)
	if(!ui)
		ui = new(user, src, ui_key, "clone_console.tmpl", "VatConsole", 600, 600)
		ui.set_initial_data(data)
		ui.open()
		ui.set_auto_update(TRUE)
		ui.set_auto_update_layout(TRUE)

/obj/machinery/computer/genetics/clone_console/proc/form_data()
	if(!istype(linked_cloner) || QDELETED(linked_cloner))
		linked_cloner = null
	if(!istype(linked_bidon) || QDELETED(linked_bidon))
		linked_bidon = null

	var/list/data = list()
	data["clonerPresent"] = linked_cloner ? TRUE : FALSE
	data["linked_bidon"] = linked_bidon ? TRUE : FALSE
	data["menu"] = menuOption
	data["log"] = cloneLog

	//Get the amount of protein in the canister
	var/can_max_volume = 0
	var/protein_volume = 0
	if(linked_bidon)
		can_max_volume = linked_bidon.volume
		if(linked_bidon.reagents.reagent_list.len)
			for(var/target_reagent in linked_bidon.reagents.reagent_list)
				var/datum/reagent/instanced_reagent = target_reagent
				if(instanced_reagent.id == "protein")
					protein_volume = instanced_reagent.volume
	data["protein_volume"] = protein_volume
	data["can_max_volume"] = can_max_volume
	data["protein_bar_text"] = "[protein_volume] / [can_max_volume]"

	//Get data from the Cloning Vat
	var/clone_progress = 0
	var/clone_total_progress = 0
	var/cloning = FALSE
	var/flush = FALSE
	if(linked_cloner)
		clone_total_progress = linked_cloner.cloning_stage_counter * 5
		//Make sure clone_progress doesn't exceed the maximum in the UI, because the number CAN for tracking breakout events.
		clone_progress = CLAMP(linked_cloner.progress, 0, clone_total_progress)
		cloning = linked_cloner.cloning
		if(linked_cloner.cloning && linked_cloner.flush)
			flush = TRUE
	data["clone_progress"] = clone_progress
	data["clone_total_progress"] = clone_total_progress
	data["clone_bar_text"] = "[clone_progress] / [clone_total_progress]"
	data["cloning"] = cloning
	data["flush"] = flush

	return data

/obj/machinery/computer/genetics/clone_console/Topic(href, href_list)
	if(..())
		return FALSE
	if(!linked_cloner)
		return FALSE

	if(href_list["sync_console"])
		menuOption = VAT_MENU_WORKING
		//This is too wierd to chance using.
		//addtimer(CALLBACK(src, PROC_REF(sync)), 3 SECONDS)
		sync()

	add_fingerprint(usr)

	if(menuOption == VAT_MENU_SELECT)
		if(linked_cloner)
			if(href_list["start_cloning"])
				linked_cloner.start()
				return TRUE
			if(href_list["flush"])
				linked_cloner.flush = 1
				return TRUE
			if(href_list["eject"])
				linked_cloner.eject_contents()
				linked_cloner.stop()
				return TRUE
	return FALSE
