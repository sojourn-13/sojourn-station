/datum/wurm_controller

	var/turf/loc  // Location of the wurm_controller
	var/list/obj/structure/wurm_burrow/burrows = list()  // List of wurm burrows tied to the controller
	var/list/mob/living/carbon/superior_animal/wurm = list() //List of wurms tied to the controller
	var/processing = TRUE
	var/obj/machinery/mining/drill/DD

	// Wave related variables
	var/datum/wurm_wave/WW  // wurm wave datum
	var/count = 0  // Number of burrows created since the start
	var/time_burrow = 0  // Timestamp of last created burrow
	var/time_spawn = 0  // Timestamp of last spawn wave

/datum/wurm_controller/New(turf/location, seismic, drill)
	loc = location
	var/path = GLOB.wurm_waves[seismic]  // Retrieve which kind of wave it is depending on seismic activity
	WW = new path()
	if(drill)
		DD = drill

	START_PROCESSING(SSobj, src)

/datum/wurm_controller/Destroy()
	processing = FALSE  // Stop processing
	qdel(WW)  // Destroy wave object
	WW = null
	DD = null
	for(var/obj/structure/wurm_burrow/GB in burrows)  // Unlink burrows and controller
		GB.stop()
	..()

/datum/wurm_controller/Process()
	// Currently, STOP_PROCESSING does NOT instantly remove the object from processing queue
	// This is a quick and dirty fix for runtime error spam caused by this
	if(!processing)
		return

	// Check if a new burrow should be created
	if(count < WW.burrow_count && (world.time - time_burrow) > WW.burrow_interval)
		time_burrow = world.time
		count++
		spawn_wurm_burrow()

	// Check if a new spawn wave should occur
	if((world.time - time_spawn) > WW.spawn_interval)
		time_spawn = world.time
		spawn_wurms()

/datum/wurm_controller/proc/spawn_wurm_burrow()
	// Spawn burrow randomly in a donut around the drill
	var/turf/T = pick(getcircle(loc, 7))
	while(loc && check_density_no_mobs(T) && T != loc)
		T = get_step(T, get_dir(T, loc))
	// If we end up on top of the drill, just spawn next to it
	if(T == loc)
		T = get_step(loc, pick(cardinal))

	burrows += new /obj/structure/wurm_burrow(T, src)  // Spawn burrow at final location

/datum/wurm_controller/proc/spawn_wurms()
	// Spawn wurms at all burrows
	for(var/obj/structure/wurm_burrow/GB in burrows)
		if(!GB.loc)  // If the burrow is in nullspace for some reason
			burrows -= GB  // Remove it from the pool of burrows
			continue
		var/list/possible_directions = cardinal.Copy()
		var/i = 0
		var/proba = WW.special_probability
		// Spawn wurms around the burrow on free turfs
		while(i < WW.wurm_spawn && possible_directions.len)
			var/turf/possible_T = get_step(GB.loc, pick_n_take(possible_directions))
			if(!check_density_no_mobs(possible_T))
				var/wurmtype
				if(prob(proba))
					wurmtype = pick(GLOB.wurms_special) //Pick a special wurm.
					proba = max(0, proba - 10) //Decresing probability to avoid mass spawn of specials.
				else
					wurmtype = pick(GLOB.wurms_normal)
				i++
				new wurmtype(possible_T, drill=DD, parent=src)  // Spawn golem at free location
		// Spawn remaining wurms on top of burrow
		if(i < WW.wurm_spawn)
			for(var/j in i to (WW.wurm_spawn-1))
				var/wurmtype
				if(prob(proba))
					wurmtype = pick(GLOB.wurms_special) //Pick a special wurm.
					proba = max(0, proba - 10) //Decreasing probability to avoid mass spawn of specials.
				else
					wurmtype = pick(GLOB.wurms_normal) //Pick a normal wurm.
				new wurmtype(GB.loc, drill=DD, parent=src) //Spawn wurm at that burrow.

/datum/wurm_controller/proc/stop()
	// Disable wave
	processing = FALSE
	// Delete controller and all golems after given delay
	spawn(3 MINUTES)
		// Delete burrows
		for(var/obj/structure/wurm_burrow/BU in burrows)
			qdel(BU)

		// Delete wurms
		for(var/mob/living/carbon/superior_animal/wurm/GO)
			GO.ore = null  // Do not spawn ores
			GO.death(FALSE, "burrows into the ground.")

		// Delete controller
		qdel(src)

/datum/wurm_controller/proc/check_density_no_mobs(turf/F)
	if(F.density)
		return TRUE
	for(var/atom/A in F)
		if(A.density && !(A.flags & ON_BORDER) && !ismob(A))
			return TRUE
	return FALSE