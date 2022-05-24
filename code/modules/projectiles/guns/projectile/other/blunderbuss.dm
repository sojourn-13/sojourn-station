/obj/item/gun/blunderbuss
	name = "blunderbuss"
	desc = "A tube with a flared end. Has a small tank attached to a fuel injector leading into the barrel."
	icon = 'icons/obj/guns/projectile/blunderbuss.dmi'
	icon_state = "blunderbuss"
	fire_delay = 15
	slot_flags = SLOT_BACK
	twohanded = TRUE // Need two hands to shoot.
	var/scrap_count = 0 //how much crap do we have loaded?
	var/use_amount = 10 // How much fuel is used per shot
	var/internal_tank_size = 100
	var/fuel_type = "fuel" // What kind of chem do we use?
	serial_type = null
	fire_sound = 'sound/weapons/guns/fire/rushingbull.ogg'
	var/list/scrap_typecache = list(/obj/item/scrap_lump = 3, /obj/item/material/shard = 3, /obj/item/trash = 1, /obj/item/stack/rods = 2, /obj/item/stack/thrown = 6, /obj/item/stack/tile = 2, /obj/item/stack/material/steel = 2) //scrap is worth more than rods since they're easier to load

/obj/item/gun/blunderbuss/Initialize()
	..()
	create_reagents(internal_tank_size)


/obj/item/gun/blunderbuss/examine(mob/user)
	..(user)
	if(use_amount) // In case we don't use any ammo
		var/shots_remaining = round(reagents.total_volume / use_amount)
		to_chat(user, "[src] has propellant for [shots_remaining] shot\s remaining.")
	if(scrap_count)
		to_chat(user, "[src] has [english_list(contents)] loaded.")
	return

/obj/item/gun/blunderbuss/attackby(obj/item/W, mob/living/user)
	if(is_type_in_list(W, scrap_typecache, TRUE))
		scrap_count = min(scrap_count + scrap_typecache[W.type], 6)
		to_chat(user, SPAN_NOTICE("You load the [W] into [src]."))
		if(istype(W, /obj/item/stack))
			var/obj/item/stack/thestack = W
			W = thestack.split(1) //take 1 out to put it in the thing
		W.forceMove(src)

/obj/item/gun/blunderbuss/attack_hand(mob/user)
	if(LAZYLEN(contents))
		scrap_count = 0
		to_chat(user, SPAN_NOTICE("You pull out all the scrap from [src]."))
		for(var/item in contents)
			if(isitem(item))
				var/obj/item/I = item
				I.forceMove(get_turf(src))
	else
		..()
	update_icon()

/obj/item/gun/blunderbuss/consume_next_projectile()
	if(!scrap_count)
		return null
	if(!reagents.remove_reagent(fuel_type, use_amount)) // Do we have enough fuel? (Also consume the fuel if we have enough)
		return null
	var/obj/item/projectile/bullet/pellet/shotgun/blunderbuss/BB = new /obj/item/projectile/bullet/pellet/shotgun/blunderbuss(src)
	BB.pellets = scrap_count
	scrap_count = max(scrap_count - 2, 0)
	for(var/item in contents)
		if(isitem(item))
			qdel(item)
	return BB
