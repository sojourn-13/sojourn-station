/*
 * Trays - Agouri
 */
/obj/item/tray
	name = "tray"
	icon = 'icons/obj/food.dmi'
	icon_state = "tray"
	desc = "A metal tray to lay food on."
	force = WEAPON_FORCE_WEAK
	throwforce = WEAPON_FORCE_WEAK
	throw_speed = 1
	throw_range = 5
	w_class = ITEM_SIZE_NORMAL
	flags = CONDUCT
	matter = list(MATERIAL_STEEL = 3)
	var/list/carrying = list() // List of things on the tray. - Doohl
	var/max_carry = 10


/*
===============~~~~~================================~~~~~====================
=																			=
=  Code for trays carrying things. By Doohl for Doohl erryday Doohl Doohl~  =
=																			=
===============~~~~~================================~~~~~====================
*/
/obj/item/tray/proc/calc_carry()
	// calculate the weight of the items on the tray
	var/val = 0 // value to return

	for(var/obj/item/I in carrying)
		if(I.w_class == ITEM_SIZE_TINY)
			val ++
		else if(I.w_class == ITEM_SIZE_SMALL)
			val += 3
		else
			val += 5

	return val

/obj/item/tray/pre_pickup(mob/user)
	if(!isturf(loc))
		return FALSE

	for(var/obj/item/I in loc)
		if( I != src && !I.anchored && !istype(I, /obj/item/clothing/under) && !istype(I, /obj/item/clothing/suit) && !istype(I, /obj/item/projectile) )
			var/add = 0
			if(I.w_class == ITEM_SIZE_TINY)
				add = 1
			else if(I.w_class == ITEM_SIZE_SMALL)
				add = 3
			else
				add = 5
			if(calc_carry() + add >= max_carry)
				break

			I.loc = src
			carrying.Add(I)
			add_overlay(image("icon" = I.icon, "icon_state" = I.icon_state, "layer" = 30 + I.layer, "pixel_x" = I.pixel_x, "pixel_y" = I.pixel_y))

	return ..()

/obj/item/tray/dropped(mob/user)

	spawn(1) //why sleep 1? Because forceMove first drops us on the ground.
		if(!isturf(loc)) //to handle hand switching
			return

		var/foundtable = 0
		for(var/obj/structure/table/T in loc)
			foundtable = 1
			break

		cut_overlays()

		for(var/obj/item/I in carrying)
			I.loc = loc
			carrying.Remove(I)
			if(!foundtable && isturf(loc))
			// if no table, presume that the person just shittily dropped the tray on the ground and made a mess everywhere!
				spawn()
					for(var/i = 1, i <= rand(1,2), i++)
						if(I)
							step(I, pick(NORTH,SOUTH,EAST,WEST))
							sleep(rand(2,4))