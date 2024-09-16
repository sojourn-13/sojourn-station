// Flasks used as ammo for the plasma guns

/obj/item/hydrogen_fuel_cell //Basic type of the cells, should't be used by itself
	name = "cryo-sealed hydrogen fuel cell"
	desc = "A flask full of volatile hydrogen. It cannot be refilled once spent."
	icon = 'icons/obj/guns/plasma/hydrogen.dmi'
	icon_state = "plasma_can"
	item_state = "plasma_can"
	contained_sprite = TRUE
	item_state_slots = list(slot_l_hand_str = "plasma_can_left", slot_r_hand_str = "plasma_can_right")
	origin_tech = list(TECH_POWER = 1)
	matter = list(MATERIAL_PLASTEEL = 5, MATERIAL_MHYDROGEN = 1, MATERIAL_OSMIUM = 1, MATERIAL_TRITIUM = 1)
	force = WEAPON_FORCE_WEAK
	throwforce = WEAPON_FORCE_WEAK
	throw_speed = 3
	throw_range = 5
	w_class = ITEM_SIZE_SMALL
	var/plasma = 150
	var/max_plasma = 150

/obj/item/hydrogen_fuel_cell/examine(mob/user)
	..()
	to_chat(user, "The [src.name] currently holds [plasma] units of plasma fuel.")

/obj/item/hydrogen_fuel_cell/proc/use(var/amount)
	if(plasma >= amount) // Is there enough plasma left?
		plasma -= amount
		return TRUE
	else
		return FALSE

// Fuel Cell for the bluecross weapon
/obj/item/hydrogen_fuel_cell/bluecross
	name = "anomalous hydrogen fuel cell"
	desc = "An anomalous fuel cell created by an unknown person (or group?), their work marked by a blue cross, these objects are known to vanish and reappear when left alone.\
			This hydrogen flask has been internally expanded in capacity via pocket bluespace infusion, carrying a lot more than the standard ones."
	plasma = 300
	max_plasma = 300 // Double the capacity of a normal cell
	icon_state = "plasma_can_bluecross"
	item_state = "plasma_can_bluecross"

/*	This cell used to be infinite, but was deemed too powerful. Leaving this commented out as legacy code for it.
/obj/item/hydrogen_fuel_cell/infinite/use(var/amount)
	return TRUE // Never runs out.
*/

// Backpack variant.
/obj/item/hydrogen_fuel_cell/backpack
	name = "cryo-sealed hydrogen fuel pack"
	desc = "A backpack full of volatile hydrogen. It cannot be refilled once spent."
	description_info = "Insert your hydrogen gun on it to connect it to its holding port, then drag the backpack to an empty hand to draw the gun. To disconnect it for retrieval, use a wrenching tool on the backpack."

	icon_state = "plasmapack"
	item_state = "plasmapack"
	contained_sprite = TRUE
	item_state_slots = list(slot_back_str = "plasmapack_back", slot_l_hand_str = "plasma_can_left", slot_r_hand_str = "plasma_can_right")

	plasma = 5000
	max_plasma = 5000
	slot_flags = SLOT_BACK
	w_class = ITEM_SIZE_HUGE
	var/obj/item/gun/hydrogen/the_gun = null

/obj/item/hydrogen_fuel_cell/backpack/examine(mob/user)
	..()
	if(the_gun)
		to_chat(user, "The [src.name] is currently attached to [the_gun.name]. Click-drag the [src.name] to an empty hand to draw it.")

/obj/item/hydrogen_fuel_cell/backpack/attackby(obj/item/W as obj, mob/living/user as mob)
	..()

	// Is the object a plasma gun?
	if(istype(W, /obj/item/gun/hydrogen))
		if(!the_gun) // Do we have a gun?
			var/obj/item/gun/hydrogen/H = W
			user.visible_message(	SPAN_NOTICE("[user] start to connect the [W.name] to the [src.name]."),
									SPAN_NOTICE("You start to connect the [W.name] to the [src.name].")
									)
			if(do_after(user, WORKTIME_DELAYED, src))
				user.visible_message(	SPAN_NOTICE("[user] connect the [W.name] to the [src.name]."),
										SPAN_NOTICE("You connect the [W.name] to the [src.name].")
									)
				the_gun = H
				H.flask = src
				H.connected = src
				H.secured = TRUE
				H.update_icon()
				insert_item(W, user)
			return
		else // We got the gun, and it is connected, put it back it.
			user.visible_message(
									SPAN_NOTICE("[user] attach the [the_gun.name] from the [src.name]."),
									SPAN_NOTICE("You attach the [the_gun.name] from the [src.name].")
								)
			insert_item(W, user)

	// Wrench to remove the gun
	if(QUALITY_BOLT_TURNING in W.tool_qualities)
		if(the_gun) // Do we have the gun?
			var/obj/item/tool/T = W // New var to use tool-only procs.
			user.visible_message(
									SPAN_NOTICE("[user] start to disconnect the [the_gun.name] from the [src.name]."),
									SPAN_NOTICE("You start to disconnect the [the_gun.name] from the [src.name].")
								)
			if(T.use_tool(user, src, WORKTIME_EXTREMELY_LONG, QUALITY_BOLT_TURNING, FAILCHANCE_HARD, required_stat = STAT_MEC)) // Skill check. Hard to pass and long to do.
				// Remove the connectionts between the gun and the backpack
				the_gun.secured = FALSE
				the_gun.connected = null
				the_gun.flask = null
				the_gun.update_icon()

				// Remove the gun from the user if it is there
				if(the_gun.loc == user)
					user.remove_from_mob(the_gun)
					the_gun.forceMove(src)
				eject_item(the_gun, user)
				the_gun = null
				return
			return
		else
			to_chat(user, "The [src.name] doesn't have any gun connected to it.")

// Removing the gun, but still connected
/obj/item/hydrogen_fuel_cell/backpack/MouseDrop(over_object)
	if(the_gun)
		usr.visible_message(
								SPAN_NOTICE("[usr] detach the [the_gun.name] from the [src.name]."),
								SPAN_NOTICE("You detach the [the_gun.name] from the [src.name].")
									)
		eject_item(the_gun, usr)

	else if((src.loc == usr) && istype(over_object, /obj/screen/inventory/hand))
		to_chat(usr, SPAN_NOTICE("The [src.name] doesn't have any gun attached to it."))

// The boxes holding the hydrogen cell
/obj/item/storage/box/hydrogen_cell
	name = "\improper Hydrogen Fuel Cell box"
	desc = "A box full of cryo-sealed hydrogen fuel cells"
	var/amount_cell = 10 // Number of cell in the box.

/obj/item/storage/box/hydrogen_cell/populate_contents()
	for(var/i in 1 to amount_cell)
		new /obj/item/hydrogen_fuel_cell(src)
