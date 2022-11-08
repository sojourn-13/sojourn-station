/atom
	var/light_power = 1 // intensity of the light
	var/light_range = 0 // range in tiles of the light
	var/light_color		// Hexadecimal RGB string representing the colour of the light

	var/datum/light_source/light
	var/list/light_sources

// Nonsensical value for l_color default, so we can detect if it gets set to null.
#define NONSENSICAL_VALUE -99999
/atom/proc/set_light(l_range, l_power, l_color = NONSENSICAL_VALUE, no_update = FALSE)
	. = 0 //make it less costly if nothing's changed

	if(l_power != null && l_power != light_power)
		light_power = l_power
		. = 1
	if(l_range != null && l_range != light_range)
		light_range = l_range
		. = 1
	if(l_color != NONSENSICAL_VALUE && l_color != light_color)
		light_color = l_color
		. = 1

	if(. && !no_update)
		update_light()

#undef NONSENSICAL_VALUE

/atom/proc/update_light()
	set waitfor = FALSE

	if(!light_power || !light_range)
		if(light)
			light.destroy()
			light = null
	else
		if(!istype(loc, /atom/movable))
			. = src
		else
			. = loc

		if(light)
			light.update(.)
		else
			light = new /datum/light_source(src, .)


/atom/New()
	. = ..()

	if(light_power && light_range)
		update_light()

	if(opacity && isturf(loc))
		var/turf/T = loc
		T.has_opaque_atom = TRUE // No need to recalculate it in this case, it's guranteed to be on afterwards anyways.

/atom/Destroy()
	if(light)
		light.destroy() //wtf is this? why arent we just qdelling it or setting the refs to null? what??
		light.top_atom = null //i hope this works
		light.source_atom = null
		light = null
	return ..()

/atom/movable/New()
	. = ..()

	if(opacity && isturf(loc))
		var/turf/T = loc
		T.reconsider_lights()

	if(istype(loc, /turf/simulated/open))
		var/turf/simulated/open/open = loc
		if(open.isOpen())
			open.fallThrough(src)

/atom/movable/Move()
	var/turf/old_loc = loc
	. = ..()

	if(loc != old_loc)
		for(var/datum/light_source/L in light_sources)
			L.source_atom.update_light()

	var/turf/new_loc = loc
	if(istype(old_loc) && opacity)
		old_loc.reconsider_lights()

	if(istype(new_loc) && opacity)
		new_loc.reconsider_lights()

/atom/proc/set_opacity(new_opacity)
	if(new_opacity == opacity)
		return

	var/old_opacity = opacity

	opacity = new_opacity
	var/turf/T = isturf(src) ? src : loc
	if(!isturf(T))
		return

	if(new_opacity == TRUE)
		T.has_opaque_atom = TRUE
		T.reconsider_lights()
	else
		var/old_has_opaque_atom = T.has_opaque_atom
		T.recalc_atom_opacity()
		if(old_has_opaque_atom != T.has_opaque_atom)
			T.reconsider_lights()

	GLOB.opacity_set_event.raise_event(src, old_opacity, new_opacity)

/obj/item/equipped()
	. = ..()
	update_light()

/obj/item/pickup()
	. = ..()
	update_light()

/obj/item/dropped()
	. = ..()
	LEGACY_SEND_SIGNAL(src, COMSIG_ITEM_DROPPED, src)
	update_light()
