/obj/structure/catwalk/rgfloor
	layer = TURF_LAYER + 0.5
	icon = 'icons/turf/reinf_glass.dmi'
	icon_state = "reinf_glass15-15"
	name = "Reinforced glass floor"
	desc = "Reinforced and safe to step on. Watch your skirt!"
	density = 0
	anchored = 1.0


/obj/structure/catwalk/rgfloor/New()
	..()
	if (istype(loc, /turf/simulated/open))
		var/turf/simulated/open/T = loc
		T.updateFallability()
	spawn(4)
		if(src)
			for(var/obj/structure/catwalk/rgfloor/C in get_turf(src))
				if(C != src)
					qdel(C)
			update_icon()
			redraw_nearby_rgfloor()

/obj/structure/catwalk/rgfloor/Destroy()
	if (istype(loc, /turf/simulated/open))
		var/turf/simulated/open/T = loc
		T.updateFallability(src)
	redraw_nearby_rgfloor()
	. = ..()

/obj/structure/catwalk/rgfloor/proc/redraw_nearby_rgfloor()
	for(var/direction in alldirs)
		if(locate(/obj/structure/catwalk/rgfloor, get_step(src, direction)))
			var/obj/structure/catwalk/rgfloor/L = locate(/obj/structure/catwalk/rgfloor, get_step(src, direction))
			L.update_icon() //so siding get updated properly


/obj/structure/catwalk/rgfloor/update_icon()
	var/connectdir = 0
	for(var/direction in cardinal)
		if(locate(/obj/structure/catwalk/rgfloor, get_step(src, direction)))
			connectdir |= direction

	//Check the diagonal connections for corners, where you have, for example, connections both north and east. In this case it checks for a north-east connection to determine whether to add a corner marker or not.
	var/diagonalconnect = 0 //1 = NE; 2 = SE; 4 = NW; 8 = SW
	//NORTHEAST
	if(connectdir & NORTH && connectdir & EAST)
		if(locate(/obj/structure/catwalk/rgfloor, get_step(src, NORTHEAST)))
			diagonalconnect |= 1
	//SOUTHEAST
	if(connectdir & SOUTH && connectdir & EAST)
		if(locate(/obj/structure/catwalk/rgfloor, get_step(src, SOUTHEAST)))
			diagonalconnect |= 2
	//NORTHWEST
	if(connectdir & NORTH && connectdir & WEST)
		if(locate(/obj/structure/catwalk/rgfloor, get_step(src, NORTHWEST)))
			diagonalconnect |= 4
	//SOUTHWEST
	if(connectdir & SOUTH && connectdir & WEST)
		if(locate(/obj/structure/catwalk/rgfloor, get_step(src, SOUTHWEST)))
			diagonalconnect |= 8

	icon_state = "reinf_glass[connectdir]-[diagonalconnect]"


/obj/structure/catwalk/rgfloor/ex_act(severity)
	switch(severity)
		if(1.0)
			qdel(src)
		if(2.0)
			qdel(src)
	return

/obj/structure/catwalk/rgfloor/attackby(obj/item/I, mob/user)
	if(QUALITY_WELDING in I.tool_qualities)
		if(I.use_tool(user, src, WORKTIME_FAST, QUALITY_WELDING, FAILCHANCE_EASY, required_stat = STAT_MEC))
			to_chat(user, "\blue Slicing panels joints ...")
			new /obj/item/stack/rods(get_turf(user))
			new /obj/item/stack/rods(get_turf(user))
			new /obj/structure/lattice/(src.loc)
			qdel(src)
	return


/obj/structure/catwalk/rgfloor/can_prevent_fall()
	return FALSE