#define CLONING_STAGE_BASE 		20	//Points needed to advance a stage
#define CLONING_BREAKOUT_POINT	300


#define ANIM_OPEN 1
#define ANIM_NONE 0
#define ANIM_CLOSE -1


#define SEND_PRESSURE (700 + ONE_ATMOSPHERE) //kPa - assume the inside of a dispoal pipe is 1 atm, so that needs to be added.
#define PRESSURE_TANK_VOLUME 150	//L
#define PUMP_MAX_FLOW_RATE 90		//L/s - 4 m/s using a 15 cm by 15 cm inlet

/obj/machinery/genetics/cloner
	name = "Belvoix Anomalous Cloning Chamber"
	desc = "A heavily customized cloning vat, retooled for cloning strange and fantastic creatures. It seems hard-coded to prevent colonists from being cloned."
	icon = 'icons/obj/neotheology_pod.dmi'
	icon_state = "preview"
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

	var/cloning_speed  = 10	//Try to avoid use of non integer values

	var/embryo_stage = 0 //Which stage the embryo is currently in

	var/feed_the_beast = 0 //1= beast is hungry, 2= beast breaks out. Only increments if the clone is ready and protein is scarce.

	var/progress = 0

	var/progress_increment = 1 MINUTE

	var/progress_benchmark

	//How much protein is eaten in order to advance the progress by the cloning speed.
	//Higher numbers means the clone eats MORE MEAT.
	var/protein_consumption = 20

	var/datum/genetics/genetics_holder/clone_info //Genetics holder for the mob

	var/datum/genetics/mutation/clone_mutation // The clone mutatation being used to create the mob.

	var/image/anim0 = null
	var/image/anim1 = null

	var/power_cost = 250


	//Disposals info
	var/datum/gas_mixture/air_contents	// internal reservoir
	var/mode = 1	// item mode 0=off 1=charging 2=charged
	var/flush = 0	// true if flush handle is pulled
	var/obj/structure/disposalpipe/trunk/trunk = null // the attached pipe trunk
	var/flushing = 0	// true if flushing in progress
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
			flush = 0
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
	if(container_west)
		return container_west
	return null

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


/obj/machinery/genetics/cloner/proc/breakout()
	//TODO: Glass shattering stuff.

	eject_contents()
	stop()

//TODO: rewrite to attempt ejection into vents shaft, or breakout event, etc.
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


	stop()
	update_icon()


/obj/machinery/genetics/cloner/proc/start()
	log_debug("Ran Start()")
	if(cloning)
		visible_message(SPAN_DANGER("The Cloning Vat says: \"Error, Cloning already in progress~!\""))
		log_debug("Start(): cloning already set to TRUE!")
		return


	if(embryo)
		visible_message(SPAN_DANGER("The Cloning Vat says: \"Error, Please vacate the dead embryo from the chamber~!\""))
		return


	reader = find_reader()
	if(!reader)
		visible_message(SPAN_DANGER("The Cloning Vat says: \"Error, Operations console not detected~!\""))
		return

	reader_loc = reader.loc
	//reader.reading = TRUE
	//reader.update_icon()

	container = find_container()
	if(!container)
		visible_message(SPAN_DANGER("The Cloning Vat says: \"Error, Protein canister not detected~!\""))
		return

	if(!container.anchored)
		visible_message(SPAN_DANGER("The Cloning Vat says: \"Error, Protein canister not Anchored~!\""))
		return
	container_loc = container.loc

	trunk = locate() in src.loc
	if(!trunk)
		visible_message(SPAN_DANGER("The Cloning Vat says: \"Error, Pipe trunk not detected~!\""))
		return

	clone_mutation = clone_info.findCloneMutation()

	if(!clone_mutation)
		visible_message(SPAN_DANGER("The Cloning Vat says: \"Error, Error~! Cloning data not found.\""))
		return

	progress = 0
	embryo_stage = 0

	cloning = TRUE
	
	clone_ready = FALSE
	
	occupant = null

	closed = TRUE

	ready_message = FALSE

	embryo_stage = 0
	embryo = new /obj/item/genetics/reject(clone_mutation.source_name)

	//Create the mobs/items for later reference.
	var/clone_type = clone_mutation.onClone()
	if(ispath(clone_type, /mob/living))
		occupant = new clone_type()
		clone_info.inject_mutations(occupant)

	if(ispath(clone_type, /obj/item))
		nonliving_occupant = new clone_type()

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

	update_icon()
	return TRUE


//Derived function from:
//obj/structure/disposalholder/proc/init(var/obj/machinery/disposal/D, var/datum/gas_mixture/flush_gas)
/obj/machinery/genetics/cloner/proc/init_disposal_holder()
	var/obj/structure/disposalholder/holder = new()

	holder.gas = air_contents// transfer gas resv. into holder object -- let's be explicit about the data this proc consumes, please.
	holder.from_cloner = TRUE

	//Check for any living mobs trigger hasmob.
	//hasmob effects whether the package goes to cargo or its tagged destination.
	if(occupant)
		if(clone_ready)
			occupant.forceMove(holder)
		occupant = null
	else if (nonliving_occupant)
		if(clone_ready)
			nonliving_occupant.forceMove(holder)
		nonliving_occupant = null

	if(!clone_ready)
		embryo.forceMove(holder)
	embryo = null

	if(!trunk)
		visible_message(SPAN_DANGER("The Cloning Vat says: \"Pipe not conected. Aborting~!\""))
		return

	holder.forceMove(trunk)
	holder.active=TRUE
	holder.set_dir(DOWN)
	spawn(1)
		holder.move()		// spawn off the movement process

/obj/machinery/genetics/cloner/proc/get_progress()
	return (progress / cloning_stage_counter)


/obj/machinery/genetics/cloner/Process()
	if(cloning)
		if(stat & NOPOWER)
			log_debug("Not powered. PROCESS CAN'T START. NOT POWERED.")
			return

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

			visible_message(SPAN_DANGER("The Cloning Vat says: \"Feeding~! Test Subject~!\""))

			//Feed the beast.
			if(progress <= CLONING_BREAKOUT_POINT)
				if(container)
					if(!container.reagents.remove_reagent("protein", protein_consumption))
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
							visible_message(SPAN_DANGER("The Cloning Vat says: \"Protein not available~, The Embryo has perished.\""))
							stop() //The clone is dead.
				else
					visible_message(SPAN_DANGER("The Cloning Vat says: \"Container not found~, The Embryo has perished.\""))
					stop()
		use_power(power_cost)

	if (clone_ready && !ready_message)
		visible_message(SPAN_DANGER("The Cloning Vat says: \"The Test Subject has Matured~!\""))
		ready_message = TRUE

		embryo = null

	//Disposal loop
	if(flush && air_contents.return_pressure() >= SEND_PRESSURE )	// flush can happen even without power
		visible_message(SPAN_DANGER("The Cloning Vat says: \"Flushing~ Test Subject~\""))

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
	flushing = 1
	stop()

	// virtual holder object which actually travels through the pipes.
	init_disposal_holder()

	air_contents = new(PRESSURE_TANK_VOLUME)	// new empty gas resv.
	flushing = 0
	// now reset disposal state
	flush = 0
	if(mode == 2)	// if was ready,
		mode = 1	// switch to charging
	return

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

/obj/machinery/genetics/cloner/attackby(obj/item/I, mob/user)
	//Handle attaching the BIDON to a cloner
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


/obj/machinery/genetics/cloner/verb/eject_cloneling()
	set category = "Object"
	set name = "Eject Contents"
	set src in view(1)
	eject_contents()
	stop()

/obj/machinery/genetics/cloner/verb/start_cloneling()
	set category = "Object"
	set name = "Start Cloning"
	set src in view(1)
	start()

/obj/machinery/genetics/cloner/verb/manual_flush()
	set category = "Object"
	set name = "Manual Flush"
	set src in view(1)
	flush = TRUE

/obj/machinery/computer/genetics/clone_console
	name = "Vat Control Console"
	desc = "A console for controlling and monitoring crimes against nature."
	icon_keyboard = "teleport_key"
	icon_screen = "medcomp"

#undef CLONING_STAGE_BASE
#undef CLONING_BREAKOUT_POINT

#undef ANIM_OPEN
#undef ANIM_NONE
#undef ANIM_CLOSE

#undef SEND_PRESSURE
#undef PRESSURE_TANK_VOLUME
#undef PUMP_MAX_FLOW_RATE