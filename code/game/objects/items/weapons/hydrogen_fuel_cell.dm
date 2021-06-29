// Flask used as ammo for the plasma guns

/obj/item/weapon/hydrogen_fuel_cell //Basic type of the cells, should't be used by itself
	name = "\improper cryo-sealed hydrogen fuel cell"
	desc = "A flask full of volatile hydrogen. It cannot be refilled once spent."
	icon = 'icons/obj/guns/plasma/hydrogen.dmi'
	icon_state = "canister"
	origin_tech = list(TECH_POWER = 1)
	force = WEAPON_FORCE_WEAK
	throwforce = WEAPON_FORCE_WEAK
	throw_speed = 3
	throw_range = 5
	w_class = ITEM_SIZE_SMALL
	var/plasma = 150
	var/max_plasma = 150

/obj/item/weapon/hydrogen_fuel_cell/examine(mob/user)
	..()
	to_chat(user, "The [src.name] currently hold [plasma] units of plasma fuel.")

/obj/item/weapon/hydrogen_fuel_cell/proc/use(var/amount)
	if(plasma >= amount) // Is there enough plasma left?
		plasma -= amount
		return TRUE
	else
		return FALSE

// Fuel Cell for the bluecross weapon
/obj/item/weapon/hydrogen_fuel_cell/infinite
	name = "Anomalous hydrogen fuel cell"
	desc = "This fuel cell doesn't seem to run out."
	plasma = 500
	max_plasma = 500

/obj/item/weapon/hydrogen_fuel_cell/infinite/use(var/amount)
	return TRUE // Never runs out.

// Backpack variant.
/obj/item/weapon/hydrogen_fuel_cell/backpack
	name = "\improper plasmapack"
	desc = "A backpack full of volatile hydrogen. It cannot be refilled once spent."
	icon_state = "plasmapack"
	plasma = 2000
	max_plasma = 2000
	slot_flags = SLOT_BACK
	w_class = ITEM_SIZE_HUGE
	var/obj/item/weapon/gun/hydrogen/the_gun = null

/obj/item/weapon/hydrogen_fuel_cell/backpack/attackby(obj/item/weapon/W as obj, mob/living/user as mob)
	..()

	// Is the object a plasma gun?
	if(istype(W, /obj/item/weapon/gun/hydrogen))
		if(!the_gun) // Do we have a gun?
			var/obj/item/weapon/gun/hydrogen/H = W
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
	if(QUALITY_BOLT_TURNING)
		if(the_gun) // Do we have the gun?
			var/obj/item/weapon/tool/T = W // New var to use tool-only procs.
			if(T.use_tool(user, src, WORKTIME_EXTREMELY_LONG, QUALITY_BOLT_TURNING, FAILCHANCE_HARD, required_stat = STAT_MEC)) // Skill check. Hard to pass and long to do.
				user.visible_message(
										SPAN_NOTICE("[user] unsecure the [the_gun.name] from the [src.name]."),
										SPAN_NOTICE("You unsecure the [the_gun.name] from the [src.name].")
									)
				the_gun.secured = FALSE
				the_gun.connected = null
				the_gun.flask = null
				the_gun.update_icon()
				eject_item(the_gun, user)
				the_gun = null
				return
			return
		else
			to_chat(user, "The [src.name] doesn't have any gun connected to it.")

// Removing the gun, but still connected
/obj/item/weapon/hydrogen_fuel_cell/backpack/MouseDrop(over_object)
	if(the_gun)
		usr.visible_message(
								SPAN_NOTICE("[usr] detach the [the_gun.name] from the [src.name]."),
								SPAN_NOTICE("You detach the [the_gun.name] from the [src.name].")
									)
		eject_item(the_gun, usr)

	else if((src.loc == usr) && istype(over_object, /obj/screen/inventory/hand))
		to_chat(usr, SPAN_NOTICE("The [src.name] doesn't have any gun attached to it."))
