/obj/effect/decal/weldable
	layer = ABOVE_NORMAL_TURF_LAYER
	random_rotation = 1

/obj/effect/decal/weldable/cracks
	name = "cracks"
	desc = "Cracks on the tile. Perhaps a welding tool can help to get rid of them."
	gender = PLURAL
	icon = 'icons/obj/burrows.dmi'
	icon_state = "cracks"
	anchored = 1

/obj/effect/decal/weldable/attackby(obj/item/I, mob/user)
	if (I.has_quality(QUALITY_WELDING))
		user.visible_message("[user] starts welding [src] with the [I]", "You start welding [src] with the [I]")
		if(I.use_tool(user, src, WORKTIME_NORMAL, QUALITY_WELDING, FAILCHANCE_VERY_EASY, required_stat = STAT_MEC))
			qdel(src)
	if (I.has_quality(QUALITY_HAMMERING))
		user.visible_message("[user] starts hammering [src] with the [I]", "You start hammering out [src] with the [I]")
		if(I.use_tool(user, src, WORKTIME_NORMAL, QUALITY_HAMMERING, FAILCHANCE_EASY, required_stat = STAT_ROB))
			qdel(src)


/obj/effect/decal/weldable/preventsTurfInteractions()
	return TRUE
