// Minigun, fed via a backpack
/obj/item/gun/minigun
	name = "minigun"
	desc = "A backpack-fed minigun"
	icon = 'icons/obj/guns/plasma/hydrogen.dmi'
	icon_state = "plasma"
	origin_tech = list(TECH_COMBAT = 10)
	w_class = ITEM_SIZE_BULKY
	recoil_buildup = 1
	max_upgrades = 3
	fire_delay = 3
	fire_sound = 'sound/weapons/guns/fire/smg_fire.ogg'
	matter = list(MATERIAL_STEEL = 25, MATERIAL_PLASTEEL = 15, MATERIAL_DURASTEEL = 5)
	init_firemodes = list(SEMI_AUTO_NODELAY, BURST_3_ROUND, BURST_5_ROUND, BURST_8_ROUND, FULL_AUTO_800)

	var/projectile_type = /obj/item/projectile/bullet/pistol_35
	var/obj/item/minigun_backpack/connected = null // The backpack the gun is connected to

/obj/item/gun/minigun/New()
	..()
	START_PROCESSING(SSobj, src)

/obj/item/gun/minigun/Process()
	..()
	// Check if the gun is attached
	if(connected && (loc != connected) && (loc != connected.loc)) // Are we connected to something?
		src.visible_message("[src] reattach itself to the [connected.name].")
		usr.remove_from_mob(src)
		forceMove(connected)

/obj/item/gun/minigun/update_icon()
	cut_overlays()
	if(connected)
		add_overlay("[icon_state]_connected")

/obj/item/gun/minigun/consume_next_projectile()
	if(connected?.use())
		return new projectile_type(src)



// Backpack Ammo Pack
/obj/item/minigun_backpack
	name = "ammo pack"
	desc = "A backpack full of ammo for a minigun."
	icon = 'icons/obj/guns/plasma/hydrogen.dmi'
	icon_state = "plasmapack"
	item_state = "plasmapack"
	contained_sprite = TRUE
	item_state_slots = list(slot_back_str = "plasmapack_back", slot_l_hand_str = "plasma_can_left", slot_r_hand_str = "plasma_can_right")

	var/ammo = 5000
	slot_flags = SLOT_BACK
	w_class = ITEM_SIZE_HUGE
	var/obj/item/gun/minigun/the_gun = null

/obj/item/minigun_backpack/examine(mob/user)
	..()
	if(the_gun)
		to_chat(user, SPAN_NOTICE("[src] is currently attached to [the_gun]."))
	to_chat(user, SPAN_NOTICE("[src] has [ammo] bullets left!"))

/obj/item/minigun_backpack/attackby(obj/item/W as obj, mob/living/user as mob)
	..()

	// Is the object a minigun?
	if(istype(W, /obj/item/gun/minigun))
		if(!the_gun) // Do we have a gun?
			var/obj/item/gun/minigun/H = W
			user.visible_message(	SPAN_NOTICE("[user] start to connect [W] to [src]."),
									SPAN_NOTICE("You start to connect [W] to [src].")
									)
			if(do_after(user, WORKTIME_DELAYED, src))
				user.visible_message(	SPAN_NOTICE("[user] connect [name] to [src]."),
										SPAN_NOTICE("You connect [name] to [src].")
									)
				the_gun = H
				H.connected = src
				H.update_icon()
				insert_item(W, user)
			return
		else // We got the gun, and it is connected, put it back it.
			user.visible_message(
									SPAN_NOTICE("[user] attach [the_gun] from [src]."),
									SPAN_NOTICE("You attach [the_gun] from [src].")
								)
			insert_item(W, user)

	// Wrench to remove the gun
	if(QUALITY_BOLT_TURNING)
		if(the_gun) // Do we have the gun?
			var/obj/item/tool/T = W // New var to use tool-only procs.
			user.visible_message(
									SPAN_NOTICE("[user] start to disconnect [the_gun] from [src]."),
									SPAN_NOTICE("You start to disconnect [the_gun] from [src].")
								)
			if(T.use_tool(user, src, WORKTIME_EXTREMELY_LONG, QUALITY_BOLT_TURNING, FAILCHANCE_HARD, required_stat = STAT_MEC)) // Skill check. Hard to pass and long to do.
				// Remove the connectionts between the gun and the backpack
				the_gun.connected = null
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
			to_chat(user, "[src] doesn't have any gun connected to it.")

// Removing the gun, but still connected
/obj/item/minigun_backpack/MouseDrop(over_object)
	if(the_gun)
		usr.visible_message(
								SPAN_NOTICE("[usr] detach [the_gun] from [src]."),
								SPAN_NOTICE("You detach [the_gun] from [src].")
									)
		eject_item(the_gun, usr)

	else if((src.loc == usr) && istype(over_object, /obj/screen/inventory/hand))
		to_chat(usr, SPAN_NOTICE("[src] doesn't have any gun attached to it."))

/obj/item/minigun_backpack/proc/use()
	return ammo-- // Return how much ammo is left, then decrease it by 1,
