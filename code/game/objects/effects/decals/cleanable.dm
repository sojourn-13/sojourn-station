/obj/effect/decal/cleanable
	layer = ABOVE_NORMAL_TURF_LAYER
	var/list/random_icon_states = null
	random_rotation = 1
	///When two of these are on a same tile or do we need to merge them into just one?
	var/mergeable_decal = FALSE

/obj/effect/decal/cleanable/clean_blood(ignore = 0)
	if(!ignore)
		qdel(src)
		return
	..()

/obj/effect/decal/cleanable/Initialize()
	. = ..()
	if(LAZYLEN(random_icon_states))
		icon_state = pick(random_icon_states)
	
	if(loc && isturf(loc))
		for(var/obj/effect/decal/cleanable/C in loc)
			if(C != src && C.type == type && !QDELETED(C))
				if(replace_decal(C))
					handle_merge_decal(C)
					return INITIALIZE_HINT_QDEL

/obj/effect/decal/cleanable/proc/replace_decal(obj/effect/decal/cleanable/C) // Returns true if we should give up in favor of the pre-existing decal
	if(mergeable_decal)
		return TRUE

/obj/effect/decal/cleanable/proc/handle_merge_decal(obj/effect/decal/cleanable/merger)
	if(!merger)
		return
	if(merger.reagents && reagents)
		reagents.trans_to(merger, reagents.total_volume)
