/obj/item/stack/cable_coil/heavyduty
	name = "heavy cable coil"
	icon = 'icons/obj/power.dmi'
	icon_state = "wire"

/obj/structure/cable/heavyduty
	icon = 'icons/obj/power_cond_heavy.dmi'
	name = "large power cable"
	desc = "This cable is tough. It cannot be cut with simple hand tools."
	layer = WIRE_LAYER - 0.05 //Just below pipes
	color = null

/obj/structure/cable/heavyduty/attackby(obj/item/I, mob/user)

	var/turf/T = src.loc
	if(!T.is_plating())
		return

	if(I.use_tool(user, src, WORKTIME_INSTANT, QUALITY_WIRE_CUTTING, FAILCHANCE_EASY, required_stat = STAT_MEC))
		usr << "<font color='blue'>These cables are too tough to be cut with those.</font>"
		return
	else if(istype(I, /obj/item/stack/cable_coil))
		usr << "<font color='blue'>You will need heavier cables to connect to these.</font>"
		return
	else
		..()

/obj/structure/cable/heavyduty/cableColor(var/colorC)
	return

/obj/structure/cable/ender
	// Pretend to be heavy duty power cable
	icon = 'icons/obj/power_cond_heavy.dmi'
	name = "large power cable"
	desc = "This cable is tough. It cannot be cut with simple hand tools."
	layer = WIRE_LAYER - 0.05 //Just below pipes
	color = null
	unacidable = 1
	var/id = null

/obj/structure/cable/ender/get_connections(var/powernetless_only = 0)
	. = ..() // Do the normal stuff
	if(id)
		for(var/obj/structure/cable/ender/target in GLOB.cable_list)
			if(target.id == id)
				if (!powernetless_only || !target.powernet)
					. |= target

/obj/structure/cable/heavyduty/attackby(obj/item/I, mob/user)

	var/turf/T = src.loc
	if(!T.is_plating())
		return

	if(I.use_tool(user, src, WORKTIME_INSTANT, QUALITY_WIRE_CUTTING, FAILCHANCE_EASY, required_stat = STAT_MEC))
		usr << "<font color='blue'>These cables are too tough to be cut with those.</font>"
		return
	else if(istype(I, /obj/item/stack/cable_coil))
		usr << "<font color='blue'>You will need heavier cables to connect to these.</font>"
		return
	else
		..()

// Because they cannot be rebuilt, they are hard to destroy
/obj/structure/cable/ender/ex_act(severity)
	return

