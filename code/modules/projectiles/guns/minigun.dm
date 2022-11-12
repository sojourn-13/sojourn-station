// Minigun, fed via a backpack
/obj/item/gun/minigun
	name = "\"Bullet Storm\" fenrir minigun"
	desc = "A backpack-fed minigun designed by and for the kriosan castellan class after seeing the fenrir chaingun in action. It takes both size and strength\
	to carry such a heavy weapon. While used by other groups (and smaller people), it is at home in the confederacy \
	quelling riots, turning pirates into swiss cheese, and taking down extremely huge or dangerous fauna. It takes a suitably strong man to carry this without being heavily slowed."
	icon = 'icons/obj/guns/projectile/minigun.dmi'
	icon_state = "minigun"
	wielded_icon = "minigun_doble"
	origin_tech = list(TECH_COMBAT = 10)
	w_class = ITEM_SIZE_BULKY
	init_recoil = CARBINE_RECOIL(0.01)
	max_upgrades = 3
	fire_delay = 1
	fire_sound = 'sound/weapons/guns/fire/chaingun_fire.ogg'
	matter = list(MATERIAL_STEEL = 25, MATERIAL_PLASTEEL = 15, MATERIAL_DURASTEEL = 5)
	init_firemodes = list(BURST_3_ROUND, BURST_8_ROUND, FULL_AUTO_600)
	serial_type = "Kriosan"

	var/projectile_type = /obj/item/projectile/bullet/heavy_rifle_408/hv
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
	var/iconstring = initial(icon_state)
	var/itemstring = ""

	if(wielded)
		itemstring += "_doble"

	icon_state = iconstring
	set_item_state(itemstring)
	cut_overlays()
	if(connected)
		add_overlay("[icon_state]_connected")

/obj/item/gun/minigun/consume_next_projectile()
	if(connected?.use())
		return new projectile_type(src)



// Backpack Ammo Pack
/obj/item/minigun_backpack
	name = "ammo pack"
	desc = "A backpack full of ammo for a minigun. Looks heavy, it'd take a robust person to carry this effortlessly."
	icon = 'icons/obj/guns/projectile/minigun.dmi'
	icon_state = "powerpack"
	item_state = "powerpack"
	contained_sprite = TRUE // This mean that all the icons are in one file.
	item_state_slots = list(slot_back_str = "powerpack_back")

	var/ammo = 2000
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
				playsound(src.loc, 'sound/weapons/guns/interact/chaingun_magin.ogg', 75, 1)
			return
		else // We got the gun, and it is connected, put it back it.
			user.visible_message(
									SPAN_NOTICE("[user] attach [the_gun] from [src]."),
									SPAN_NOTICE("You attach [the_gun] from [src].")
								)
			insert_item(W, user)

	// Wrench to remove the gun
	if(QUALITY_BOLT_TURNING in W.tool_qualities)
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

/obj/item/minigun_backpack/pre_equip(var/mob/user, var/slot)
	..()
	if(user.stats.getStat(STAT_ROB) < 30)
		to_chat(user, SPAN_NOTICE("You equip [src], but its weight slows you down because you are weak.."))
		slowdown = 0.5 // 50% speed decrease
	else
		slowdown = 0

// Removing the gun, but still connected
/obj/item/minigun_backpack/MouseDrop(over_object)
	if(the_gun)
		usr.visible_message(
								SPAN_NOTICE("[usr] detach [the_gun] from [src]."),
								SPAN_NOTICE("You detach [the_gun] from [src].")
									)
		eject_item(the_gun, usr)
		playsound(src.loc, 'sound/weapons/guns/interact/chaingun_magout.ogg', 100, 1)

	else if((src.loc == usr) && istype(over_object, /obj/screen/inventory/hand))
		to_chat(usr, SPAN_NOTICE("[src] doesn't have any gun attached to it."))

/obj/item/minigun_backpack/proc/use()
	return ammo-- // Return how much ammo is left, then decrease it by 1,
