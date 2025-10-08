//Procs and vars related to dirt, cleaning, and mopping

/*
	Wetness and slipping
*/

/turf/simulated/proc/wet_floor(var/wet_val = 1, var/force_wet = FALSE)
	if(wet_val < wet && !force_wet)
		return

	if(force_wet || !wet)
		wet = wet_val
	if(!wet_overlay)
		wet_overlay = image('icons/effects/water.dmi',src,"wet_floor")
		add_overlay(wet_overlay)

	addtimer(CALLBACK(src, PROC_REF(unwet_floor), TRUE), rand(1 MINUTES, 1.5 MINUTES), TIMER_UNIQUE|TIMER_OVERRIDE)

/turf/simulated/proc/unwet_floor(var/check_very_wet)
	wet = 0
	if(wet_overlay)
		cut_overlay(wet_overlay)
		wet_overlay = null


/*
	Cleaning
*/

/turf/simulated/clean_blood()
	// Preserve the was_bloodied marker on the turf while removing visible
	// blood decals/overlays. Individual decals will be removed below; call
	// their clean_blood so they can null out their internals if needed.
	for(var/obj/effect/decal/cleanable/blood/B in contents)
		B.clean_blood()
	..()

//expects an atom containing the reagents used to clean the turf
/turf/proc/clean(atom/source, mob/user)
	var/amt = 0  // Amount of filth collected (for holy vacuum cleaner)
	if(source.reagents.has_reagent("water", 1) || source.reagents.has_reagent("cleaner", 1) || source.reagents.has_reagent("holywater", 1) || source.reagents.has_reagent("sterilizine", 1))
		// If the cleaning source contains sterilizine, perform a full clean
		// (sterilizine intentionally clears forensic traces). Otherwise,
		// perform a preserve-clean: remove visible decals/overlays but keep
		// the turf's `was_bloodied` flag intact so luminol traces still work.
		var/full_clean = source.reagents.has_reagent("sterilizine", 1)
		if(full_clean)
			clean_blood()
		else
			// Preserve the forensic marker on the turf while removing visible overlays.
			// The turf's own clean_blood is conservative, but we call a preserve helper
			// to be explicit and future-proof.
			src.clean_blood_preserve_was()

		for(var/obj/effect/O in src)
			if(istype(O,/obj/effect/decal/cleanable) || istype(O,/obj/effect/overlay) && !istype(O,/obj/effect/overlay/water))
				amt++
				qdel(O)
		if(user && user.stats)
			if(user.stats.getPerk(PERK_NEAT))
				if(ishuman(user))
					var/mob/living/carbon/human/H = user
					if(H.sanity)
						H.sanity.changeLevel(0.5)
	else
		to_chat(user, SPAN_WARNING("\The [source] is too dry to wash that."))
	source.reagents.trans_to_turf(src, 1, 10)	//10 is the multiplier for the reaction effect. probably needed to wet the floor properly.
	return amt

/turf/proc/clean_ultimate(var/mob/user)
	clean_blood()
	for(var/obj/effect/O in src)
		if(istype(O,/obj/effect/decal/cleanable))
			qdel(O)

//As above, but has limitations. Instead of cleaning the tile completely, it just cleans [count] number of things
/turf/proc/clean_partial(atom/source, mob/user, var/count = 1)
	if (!count)
		return

	//A negative value can mean infinite cleaning, but in that case just call the unlimited version
	if (!isnum(count) || count < 0)
		clean(source, user)
		return

	if(source.reagents.has_reagent("water", 1) || source.reagents.has_reagent("cleaner", 1))
		source.reagents.trans_to_turf(src, 1, 10)
	else
		to_chat(user, SPAN_WARNING("\The [source] is too dry to wash that."))
		return

	for (count;count > 0;count--)
		var/cleanedsomething = FALSE


		for(var/obj/effect/O in src)
			if(istype(O,/obj/effect/decal/cleanable) || istype(O,/obj/effect/overlay) && !istype(O,/obj/effect/overlay/water))
				qdel(O)
				cleanedsomething = TRUE
				break //Only clean one per loop iteration

		//If the tile is clean, don't keep looping
		if (!cleanedsomething)
			break

/turf/proc/update_blood_overlays()
	return








/turf/simulated/proc/AddTracks(var/typepath,var/bloodDNA,var/comingdir,var/goingdir,var/bloodcolor="#A10808")
	var/obj/effect/decal/cleanable/blood/tracks/tracks = locate(typepath) in src
	if(!tracks)
		tracks = new typepath(src)
	tracks.AddTracks(bloodDNA,comingdir,goingdir,bloodcolor)


//returns 1 if made bloody, returns 0 otherwise
/turf/simulated/add_blood(mob/living/carbon/human/M as mob)
	if (!..())
		return 0

	if(istype(M))
		for(var/obj/effect/decal/cleanable/blood/B in contents)
			if(!B.blood_DNA)
				B.blood_DNA = list()
			if(!B.blood_DNA[M.dna.unique_enzymes])
				B.blood_DNA[M.dna.unique_enzymes] = M.dna.b_type
			return 1 //we bloodied the floor
		blood_splatter(src,M.get_blood(),1)
		// mark the turf as having been bloodied for forensic traces
		was_bloodied = TRUE
		if(!blood_DNA || !istype(blood_DNA,/list))
			blood_DNA = list()
		if(istype(M.dna, /datum/dna))
			if(!blood_DNA[M.dna.unique_enzymes])
				blood_DNA[M.dna.unique_enzymes] = M.dna.b_type
		return 1 //we bloodied the floor
	return 0

// Only adds blood on the floor -- Skie
/turf/simulated/proc/add_blood_floor(mob/living/carbon/M as mob)
	if( istype(M, /mob/living/carbon/alien ))
		var/obj/effect/decal/cleanable/blood/xeno/this = new /obj/effect/decal/cleanable/blood/xeno(src)
		this.blood_DNA["UNKNOWN BLOOD"] = "X*"
	else if( istype(M, /mob/living/silicon/robot ))
		new /obj/effect/decal/cleanable/blood/oil(src)
	else
		// Normal human/organism blood: ensure the turf records it
		was_bloodied = TRUE
		if(!blood_DNA || !istype(blood_DNA,/list))
			blood_DNA = list()
		if(istype(M.dna, /datum/dna))
			if(!blood_DNA[M.dna.unique_enzymes])
				blood_DNA[M.dna.unique_enzymes] = M.dna.b_type

// Reveal blood traces with luminol
/turf/simulated/reveal_blood()
	if(was_bloodied && !fluorescent)
		fluorescent = 1
		blood_color = COLOR_LUMINOL
		// Check if there are any existing blood decals
		for(var/obj/effect/decal/cleanable/blood/B in contents)
			B.reveal_blood()
			return
		// If no blood decals exist but the turf was bloodied, create a luminol trace
		var/obj/effect/decal/cleanable/blood/luminol_trace = new /obj/effect/decal/cleanable/blood(src)
		luminol_trace.basecolor = COLOR_LUMINOL
		luminol_trace.fluorescent = TRUE
		luminol_trace.blood_DNA = list("UNKNOWN" = "O+")  // Generic blood type for traces
		luminol_trace.update_icon()


// Like clean_blood but preserves the turf's was_bloodied flag and blood_DNA.
// Removes visible decals/overlays and fluorescent state but does not clear
// forensic markers. Returns TRUE if any visible overlays/decals were removed.
/turf/simulated/clean_blood_preserve_was()
	if(!simulated)
		return
	was_bloodied = TRUE
	fluorescent = 0
