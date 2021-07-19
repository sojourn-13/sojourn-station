// Use hydrogen cells as fuel to make power, like pacmans.
/obj/machinery/power/hydrogen_gen
	name = "Hydrogen Generator"
	desc = "A portable generator for emergency backup power, use hydrogen fuel cell."
	icon = 'icons/obj/power.dmi'
	icon_state = "portgen0"
	density = 1
	anchored = FALSE
	use_power = NO_POWER_USE

	var/active = FALSE // Is the generator running?
	var/power_gen = 50000 // How much power does it produce?
	var/power_output = 1 // Modifier to the power_gen var.
	var/hydrogen_usage = 0.1 // How much hydrogen is used per tick.

	var/obj/item/weapon/hydrogen_fuel_cell/fuel_cell // Var that hold the fuel cell

// This proc run only when the object is mapped in
/obj/machinery/power/hydrogen_gen/Initialize()
	..()
	if(anchored)
		connect_to_network()
	fuel_cell = new /obj/item/weapon/hydrogen_fuel_cell(src)

// This proc run when the object is created
/obj/machinery/power/hydrogen_gen/New()
	..()

/obj/machinery/power/hydrogen_gen/examine(mob/user)
	..()
	to_chat(user, SPAN_NOTICE("The generator is [active ? "on" : "off"].")) // Is the generator on?
	if(active)
		to_chat(user, SPAN_NOTICE("The [src.name] is currently generating [(power_gen * power_output)/1000] KW of power.")) // How much power is it producing?
	to_chat(user, SPAN_NOTICE("The [src.name] currently hold [fuel_cell.plasma] units of hydrogen.")) // Show the total

// Switch the machine on or off.
/obj/machinery/power/hydrogen_gen/proc/SwitchOnOff(mob/user)
	active = !active // Switch the generator either on or off.
	user.visible_message(
							SPAN_NOTICE("[user] turn the [src.name] [active ? "on" : "off"]."),
							SPAN_NOTICE("You turn the [src.name] [active ? "on" : "off"].")
							)

// Try to use the hydrogen, return true if we used it, false if we couldn't consume it.
// The hydrogen fuel cell already have a proc that consume the indicated amount and return FALSE if there wasn't enough.
/obj/machinery/power/hydrogen_gen/proc/UseFuel()
	return fuel_cell.use(hydrogen_usage)

// Proc to insert the fuel cell in the generator
/obj/machinery/power/hydrogen_gen/proc/InsertFuelCell(obj/item/weapon/hydrogen_fuel_cell/C, mob/user)
	if(fuel_cell == null) // Check if that cell slot is free
		fuel_cell = C // Add the cell to the list.
		insert_item(C, user)
		user.visible_message(
								SPAN_NOTICE("[user] insert the [C.name] in the [src.name].") // No need for the user message sine 'insert_item' handle that
							)
		return TRUE
	else
		to_chat(user, SPAN_NOTICE("There is already a fuel cell in the [src.name]."))
		return FALSE

// Proc to remove the fuel cell from the generator
/obj/machinery/power/hydrogen_gen/proc/DropFuelCell(mob/user)
	if(fuel_cell != null)
		user.visible_message(
								SPAN_NOTICE("[user] remove the [fuel_cell.name] from the [src.name].") // No need for the user message sine 'eject_item' handle that
							)
		eject_item(fuel_cell, user)
		fuel_cell = null // Remove the cell from the list.
		return TRUE
	else
		to_chat(user, SPAN_NOTICE("There is no fuel cell in the [src.name]."))
		return FALSE

// Proc to consume the fuel & produce power
/obj/machinery/power/hydrogen_gen/Process()
	if(active && UseFuel() && anchored && powernet)
		add_avail(power_gen * power_output)
		src.updateDialog()
	else
		active = 0

	update_icon()

// Drag-click proc, we use it to remove the fuel cell
/obj/machinery/power/hydrogen_gen/MouseDrop(over_object)
	DropFuelCell(usr)

// Proc when attacking the generator with something, used for upgrades, inserting fuel cells & wrenching it to the ground
/obj/machinery/power/hydrogen_gen/attackby(obj/item/weapon/W, mob/user)

	if(default_deconstruction(W, user))
		return

	if(default_part_replacement(W, user))
		return

	if(istype(W, /obj/item/weapon/hydrogen_fuel_cell))
		InsertFuelCell(W, user)
		return

	if(active)
		to_chat(user, SPAN_NOTICE("You can't work with [src] while its running!"))
	else
		var/list/usable_qualities = list(QUALITY_BOLT_TURNING)
		var/tool_type = W.get_tool_type(user, usable_qualities, src)
		switch(tool_type)
			if(QUALITY_BOLT_TURNING)
				if(istype(get_turf(src), /turf/space) && !anchored)
					to_chat(user, SPAN_NOTICE("You can't anchor something to empty space. Idiot."))
					return
				if(W.use_tool(user, src, WORKTIME_NORMAL, tool_type, FAILCHANCE_EASY, required_stat = STAT_MEC))
					to_chat(user, SPAN_NOTICE("You [anchored ? "un" : ""]anchor the brace with [W]."))
					anchored = !anchored
					if(anchored)
						connect_to_network()
					else
						disconnect_from_network()

			if(ABORT_CHECK)
				return

	..()

// Proc when you attack the generator with an empty hand, used to turn the generator on or off
/obj/machinery/power/hydrogen_gen/attack_hand(mob/user)
	..()
	if (!anchored)
		return
	SwitchOnOff(user) // Switch the generator on or off

// Proc that is called when upgrading the machine, currently only capacitors increase the amount of power consumed.
/obj/machinery/power/hydrogen_gen/RefreshParts()
	..()

	// Where we modify the power output with the parts
	power_output = initial(power_output) // Reset the power output to prevent infinite loop
	var/cap_rating = 0
	var/cap_amount = 0
	for(var/obj/item/weapon/stock_parts/capacitor/C in component_parts)
		cap_rating += C.rating
		cap_amount++
	cap_rating -= cap_amount
	power_output += cap_rating

// TODO : Add sprite and overlays for each fuel cell
/obj/machinery/power/hydrogen_gen/update_icon()
	if(active)
		icon_state = "portgen1"
	else
		icon_state = "portgen0"
