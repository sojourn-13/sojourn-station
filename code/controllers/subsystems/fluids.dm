// Fluids subsystem (scaffold) - backport foundation from Baystation PR 22765
// Handles active fluid tiles, bulk flooding sources, and overlay pooling.

SUBSYSTEM_DEF(fluids)
	name = "Fluids"
	priority = SS_PRIORITY_DEFAULT
	// Fast-ish tick; tune later after profiling.
	wait = 5
	flags = SS_BACKGROUND

	var/list/active_fluids = list()		// /obj/effect/fluid => TRUE
	var/list/water_sources = list()		// /turf => TRUE (bulk flood sources)
	var/list/fluid_images = list()		 // state => shared image ref
	var/process_index = 1

/datum/controller/subsystem/fluids/Initialize()
	..()

/datum/controller/subsystem/fluids/fire(resumed)
	if(!length(active_fluids) && !length(water_sources))
		return

	// Process fluid tiles in slices to avoid long frames
	var/list/keys = active_fluids.Copy()
	if(process_index > keys.len)
		process_index = 1

	var/upper = min(process_index + 30, keys.len) // slice size
	for(var/i = process_index; i <= upper; i++)
		var/obj/effect/fluid/F = keys[i]
		if(!F || QDELETED(F))
			active_fluids -= F
			continue
		F.process_fluid()
	process_index = upper + 1

	// Water sources: attempt heavy flooding (one pass per tick)
	if(length(water_sources))
		var/list/srcs = water_sources.Copy()
		for(var/turf/T in srcs)
			if(!T || QDELETED(T)) { water_sources -= T; continue }
			var/flooded_a_neighbor = FALSE
			FLOOD_TURF_NEIGHBORS(T, FALSE)

	// Trim deleted refs (lazy)
	if(prob(5))
		for(var/obj/effect/fluid/G in active_fluids)
			if(QDELETED(G)) active_fluids -= G
