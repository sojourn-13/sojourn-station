//Don't needed because of vis_contents feature

/mob  // TODO: rewrite as obj.
	var/mob/shadow/shadow

/mob/shadow
	name = "shadow"
	desc = "Z-level shadow"
	anchored = 1
	unacidable = 1
	density = 0
	alpha = 0
	original_plane = FLOOR_PLANE
	layer = ABOVE_OPEN_TURF_LAYER
	vis_flags = VIS_HIDE // Prevents mob shadows from stacking on open spaces when the mob is more than 1 z-level below
	var/mob/owner = null
	var/size_multiplier = 1

/mob/shadow/can_fall()
	return FALSE

/mob/shadow/New(var/mob/L)
	datum_flags &= ~DF_USE_TAG //In case something tries to REF us
	if(!istype(L))
		qdel(src)
		return
	//..()
	owner = L
	sync_icon(L)
	if(ishuman(owner))
		var/mob/living/carbon/human/shadow_caster = L
		size_multiplier = shadow_caster.size_multiplier

/mob/Destroy()
	qdel(shadow)
	shadow = null
	. = ..()

/mob/shadow/examine(mob/user, distance, infix, suffix)
	return owner.examine(user, distance, infix, suffix)

/mob/shadow/proc/sync_icon(var/mob/M)
	name = M.name
	icon = M.icon
	icon_state = M.icon_state
	color = M.color
	copy_overlays(M, TRUE)
	copy_transformations_from(M)
	dir = M.dir
	if(shadow)
		shadow.sync_icon(src)

/mob/living/Move(NewLoc, Dir = 0, step_x = 0, step_y = 0, var/glide_size_override = 0)
	. = ..()
	check_shadow()

/mob/living/forceMove(atom/destination, var/special_event, glide_size_override=0)
	. = ..()
	check_shadow()

	var/turf/location = get_turf(src)
	update_z(location?.z)

/mob/living/proc/check_shadow()
	var/mob/M = src
	if(isturf(M.loc))
		var/turf/T = GetAbove(src)
		while(T && T.isTransparent)
			if(!M.shadow)
				M.shadow = new(M)
			M.shadow.forceMove(T)
			M = M.shadow
			T = GetAbove(M)

	if(M.shadow)
		qdel(M.shadow)
		M.shadow = null
		var/client/C = M.client
		if(C && C.eye == shadow)
			M.reset_view(0)

/mob/living/update_icons()
	. = ..()
	if(shadow)
		shadow.sync_icon(src)

/mob/set_dir(new_dir)
	. = ..()
	if(shadow)
		shadow.set_dir(new_dir)
