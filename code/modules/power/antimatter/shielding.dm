//like orange but only checks north/south/east/west for one step
/proc/cardinalrange(var/center)
	var/list/things = list()
	for(var/direction in cardinal)
		var/turf/T = get_step(center, direction)
		if(!T)
			continue
		things += T.contents
	return things

/obj/machinery/am_shielding
	name = "antimatter reactor section"
	desc = "This device was built using a plasma life-form that seems to increase plasma's natural ability to react with neutrinos while reducing the combustibility."

	icon = 'icons/obj/machines/antimatter.dmi'
	icon_state = "shield_0"
	anchored = TRUE
	density = TRUE
	dir = SOUTH
	use_power = NO_POWER_USE//Living things generally dont use power
	idle_power_usage = 0
	active_power_usage = 0

	var/obj/machinery/power/am_control_unit/control_unit = null
	var/processing = FALSE//To track if we are in the update list or not, we need to be when we are damaged and if we ever
	var/stability = 100//If this gets low bad things tend to happen
	var/efficiency = 1//How many cores this core counts for when doing power processing, plasma in the air and stability could affect this
	var/coredirs = 0
	var/dirs = 0

/obj/machinery/am_shielding/New(loc)
	..(loc)
	spawn(10)
		controllerscan()

/obj/machinery/am_shielding/proc/overheat()
	visible_message("<span class='danger'>[src] melts!</span>")
	qdel(src)

/obj/machinery/am_shielding/proc/collapse()
	visible_message("<span class='notice'>[src] collapses back into a container!</span>")
	new /obj/item/am_shielding_container(drop_location())
	qdel(src)

/obj/machinery/am_shielding/proc/controllerscan(priorscan = 0)
	//Make sure we are the only one here
	if(!isturf(loc))
		collapse()
		return
	for(var/obj/machinery/am_shielding/AMS in loc.contents)
		if(AMS == src)
			continue
		spawn(0)
			collapse()
		return

	//Search for shielding first
	for(var/obj/machinery/am_shielding/AMS in cardinalrange(src))
		if(AMS && AMS.control_unit && link_control(AMS.control_unit))
			break

	if(!control_unit)//No other guys nearby look for a control unit
		for(var/direction in cardinal)
		for(var/obj/machinery/power/am_control_unit/AMC in cardinalrange(src))
			if(AMC.add_shielding(src))
				break

	if(!control_unit)
		if(!priorscan)
			spawn(20)
				controllerscan(1)//Last chance
			return
		spawn(0)
			collapse()

/obj/machinery/am_shielding/Destroy()
	if(control_unit)
		control_unit.remove_shielding(src)
	if(processing)
		shutdown_core()
	//Might want to have it leave a mess on the floor but no sprites for now
	return ..()

/obj/machinery/am_shielding/CanPass(atom/movable/mover, turf/target)
	return 0

/obj/machinery/am_shielding/Process()
	//update_icon()
	return

/obj/machinery/am_shielding/emp_act()//Immune due to not really much in the way of electronics.
	return

/obj/machinery/am_shielding/ex_act(severity)
	switch(severity)
		if(1)
			stability -= 80
		if(2)
			stability -= 40
		if(3)
			stability -= 20
	check_stability()
	return

/obj/machinery/am_shielding/bullet_act(var/obj/item/projectile/Proj)
	if (!(Proj.testing))
		if(Proj.check_armour != ARMOR_BULLET)
			stability -= Proj.force/2
	return 0

/obj/machinery/am_shielding/update_icon()
	cut_overlays()
	icon_state = ""
	var/dir_sum = 0 // All the directions that have shielding, used to choose which icon to set
	var/turf/T
	for(var/direction  in cardinal) // Check the four directions
		T = get_step(src, direction) // Get the turf
		if(locate(/obj/machinery/am_shielding, T) || locate(/obj/machinery/power/am_control_unit, T)) // Check if there's shielding on that turf
			dir_sum += direction // Add the direction to the value.
	icon_state = "shield_[dir_sum]" // Update the icon

	if(core_check()) // Check if we can become a core.
		icon_state = "core_empty"
		if(!processing) // Become a core if we weren't one already
			setup_core()
	else if(processing) // Shutdown if we're somehow a core without the conditions
		shutdown_core()

	return dir_sum // Return the sum of all the directions where there was shielding

/obj/machinery/am_shielding/attackby(obj/item/W, mob/user)
	if(!istype(W) || !user) return
	if(W.force > 10)
		stability -= W.force/2
		check_stability()
	..()
	return

//Call this to link a detected shilding unit to the controller
/obj/machinery/am_shielding/proc/link_control(obj/machinery/power/am_control_unit/AMC)
	if(!istype(AMC))
		return 0
	if(control_unit && control_unit != AMC)
		return 0//Already have one
	control_unit = AMC
	control_unit.add_shielding(src, TRUE)
	return 1

//Scans cards for shields or the control unit and if all there it
/obj/machinery/am_shielding/proc/core_check()
	var/counter = 0
	for(var/obj/machinery/O in orange(1, src))
		if(istype(O, /obj/machinery/am_shielding) || istype(O, /obj/machinery/power/am_control_unit))
			counter++
	if(counter >= 8)
		return counter
	else
		return FALSE

	/*for(var/direction in alldirs)
		var/machine = locate(/obj/machinery, get_step(loc, direction))
		if(!machine)
			return FALSE //Need all for a core
		if(!istype(machine, /obj/machinery/am_shielding) && !istype(machine, /obj/machinery/power/am_control_unit))
			return FALSE
	return TRUE*/

/obj/machinery/am_shielding/proc/setup_core()
	processing = TRUE
	GLOB.machines += src
	if(!control_unit)
		return
	control_unit.linked_cores.Add(src)
	control_unit.reported_core_efficiency += efficiency
	icon_state = "core_inactive"
	return

/obj/machinery/am_shielding/proc/shutdown_core()
	processing = FALSE
	if(!control_unit)
		return
	control_unit.linked_cores.Remove(src)
	control_unit.reported_core_efficiency -= efficiency
	icon_state = "core_empty"
	return

/obj/machinery/am_shielding/proc/check_stability(var/injecting_fuel = FALSE)
	if(stability > 0)
		return
	if(injecting_fuel && control_unit)
		control_unit.exploding = TRUE
	if(src)
		overheat()
	return

/obj/machinery/am_shielding/proc/recalc_efficiency(new_efficiency)//tbh still not 100% sure how I want to deal with efficiency so this is likely temp
	if(!control_unit || !processing)
		return
	if(stability < 50)
		new_efficiency /= 2
	control_unit.reported_core_efficiency += (new_efficiency - efficiency)
	efficiency = new_efficiency
	return

/obj/item/am_shielding_container
	name = "packaged antimatter reactor section"
	desc = "A small storage unit containing an antimatter reactor section.  To use place near an antimatter control unit or deployed antimatter reactor section and use a multitool to activate this package."
	icon = 'icons/obj/machines/antimatter.dmi'
	icon_state = "box"
	item_state = "electronic"
	w_class = ITEM_SIZE_BULKY
	flags = CONDUCT
	throwforce = 5
	throw_speed = 1
	throw_range = 2
	matter = list(MATERIAL_STEEL = 3)

/obj/item/am_shielding_container/attackby(obj/item/I as obj, mob/user as mob)
	if((QUALITY_PULSING in I.tool_qualities) && isturf(src.loc))
		new /obj/machinery/am_shielding(src.loc)
		qdel(src)
		return
	else
		return ..()
