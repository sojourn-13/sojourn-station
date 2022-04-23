/datum/termite_controller

	var/turf/loc  // Location of the termite_controller
	var/list/obj/structure/termite_burrow/burrows = list()  // List of termite burrows tied to the controller
	var/list/mob/living/carbon/superior_animal/termite = list() //List of termites tied to the controller
	var/processing = TRUE
	var/obj/machinery/mining/drill/DD

	// Wave related variables
	var/datum/termite_wave/TW  // termite wave datum
	var/count = 0  // Number of burrows created since the start
	var/time_burrow = 0  // Timestamp of last created burrow
	var/time_spawn = 0  // Timestamp of last spawn wave

/datum/termite_controller/New(turf/location, seismic, drill)
	loc = location
	var/path = GLOB.termite_waves[seismic]  // Retrieve which kind of wave it is depending on seismic activity
	TW = new path()
	if(drill)
		DD = drill

	START_PROCESSING(SSobj, src)

/datum/termite_controller/Destroy()
	processing = FALSE  // Stop processing
	qdel(TW)  // Destroy wave object
	TW = null
	DD = null
	for(var/obj/structure/termite_burrow/GB in burrows)  // Unlink burrows and controller
		GB.stop()
	..()

/datum/termite_controller/Process()
	// Currently, STOP_PROCESSING does NOT instantly remove the object from processing queue
	// This is a quick and dirty fix for runtime error spam caused by this
	if(!processing)
		return

	// Check if a new burrow should be created
	if(count < TW.burrow_count && (world.time - time_burrow) > TW.burrow_interval)
		time_burrow = world.time
		count++
		spawn_termite_burrow()

	// Check if a new spawn wave should occur
	if((world.time - time_spawn) > TW.spawn_interval)
		time_spawn = world.time
		spawn_termites()

/datum/termite_controller/proc/spawn_termite_burrow()
	// Spawn burrow randomly in a donut around the drill
	var/turf/T = pick(getcircle(loc, 7))
	while(loc && check_density_no_mobs(T) && T != loc)
		T = get_step(T, get_dir(T, loc))
	// If we end up on top of the drill, just spawn next to it
	if(T == loc)
		T = get_step(loc, pick(cardinal))

	burrows += new /obj/structure/termite_burrow(T, src)  // Spawn burrow at final location

/datum/termite_controller/proc/spawn_termites()
	// Spawn termites at all burrows
	for(var/obj/structure/termite_burrow/GB in burrows)
		if(!GB.loc)  // If the burrow is in nullspace for some reason
			burrows -= GB  // Remove it from the pool of burrows
			continue
		var/list/possible_directions = cardinal.Copy()
		var/i = 0
		var/proba = TW.special_probability
		// Spawn termites around the burrow on free turfs
		while(i < TW.termite_spawn && possible_directions.len)
			var/turf/possible_T = get_step(GB.loc, pick_n_take(possible_directions))
			if(!check_density_no_mobs(possible_T))
				var/termitetype
				if(prob(proba))
					termitetype = pick(GLOB.termites_special) //Pick a special termite.
					proba = max(0, proba - 10) //Decresing probability to avoid mass spawn of specials.
				else
					termitetype = pick(GLOB.termites_normal)
				i++
				new termitetype(possible_T, drill=DD, parent=src)  // Spawn golem at free location
		// Spawn remaining termites on top of burrow
		if(i < TW.termite_spawn)
			for(var/j in i to (TW.termite_spawn-1))
				var/termitetype
				if(prob(proba))
					termitetype = pick(GLOB.termites_special) //Pick a special termite.
					proba = max(0, proba - 10) //Decreasing probability to avoid mass spawn of specials.
				else
					termitetype = pick(GLOB.termites_normal) //Pick a normal termite.
				new termitetype(GB.loc, drill=DD, parent=src) //Spawn termite at that burrow.

/datum/termite_controller/proc/stop()
	// Disable wave
	processing = FALSE
	// Delete controller and all golems after given delay
	spawn(1 MINUTES)
		// Delete burrows
		for(var/obj/structure/termite_burrow/BU in burrows)
			qdel(BU)

		// Delete termites
		for(var/mob/living/carbon/superior_animal/termite/GO)
			GO.ore = null  // Do not spawn ores
			GO.death(FALSE, "burrows into the ground.")

		// Delete controller
		qdel(src)

/datum/termite_controller/proc/check_density_no_mobs(turf/F)
	if(F.density)
		return TRUE
	for(var/atom/A in F)
		if(A.density && !(A.flags & ON_BORDER) && !ismob(A))
			return TRUE
	return FALSE