/obj/item/towel
	name = "towel"
	desc = "A soft cotton towel."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "towel"
	slot_flags = SLOT_HEAD | SLOT_BELT | SLOT_OCLOTHING
	force = 3.0
	w_class = ITEM_SIZE_NORMAL
	attack_verb = list("whipped")
	hitsound = 'sound/weapons/towelwhip.ogg'
	var/equip_delay = 2

/obj/item/towel/attack_self(mob/living/user as mob)
	user.visible_message(text("<span class='notice'>[] uses [] to towel themselves off.</span>", user, src))
	playsound(user, 'sound/weapons/towelwipe.ogg', 25, 1)
	if(user.fire_stacks > 0)
		user.fire_stacks = (max(0, user.fire_stacks - 1.5))
	else if(user.fire_stacks < 0)
		user.fire_stacks = (min(0, user.fire_stacks + 1.5))

/obj/item/towel/random/New()
	..()
	color = "#"+get_random_colour()

//Delayed equipping
/obj/item/towel/pre_equip(var/mob/user, var/slot)
	..(user, slot)
	if (equip_delay > 0)
		//If its currently worn, we must be taking it off
		if (is_worn())
			user.visible_message(
				SPAN_NOTICE("[user] starts taking off \the [src]..."),
				SPAN_NOTICE("You start taking off \the [src]...")
			)
			if(!do_after(user,equip_delay,src))
				return TRUE //A nonzero return value will cause the equipping operation to fail

		else if (is_held() && !(slot in unworn_slots))
			user.visible_message(
				SPAN_NOTICE("[user] starts putting on \the [src]..."),
				SPAN_NOTICE("You start putting on \the [src]...")
			)
			if(!do_after(user,equip_delay,src))
				return TRUE //A nonzero return value will cause the equipping operation to fail

// To catch MouseDrop on clothing
/obj/item/towel/MouseDrop(over_object)
	if(!(item_flags & DRAG_AND_DROP_UNEQUIP))
		return ..()
	if(!pre_equip(usr, over_object))
		..()