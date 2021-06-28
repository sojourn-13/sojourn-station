// Flask used as ammo for the plasma guns

/obj/item/weapon/plasma_flask //Basic type of the cells, should't be used by itself
	name = "\improper cryo-sealed hydrogen fuel cell."
	desc = "A flask full of volatile hydrogen. It cannot be refilled once spent."
	icon = 'icons/obj/guns/plasma/plasma.dmi'
	icon_state = "canister"
	origin_tech = list(TECH_POWER = 1)
	force = WEAPON_FORCE_WEAK
	throwforce = WEAPON_FORCE_WEAK
	throw_speed = 3
	throw_range = 5
	w_class = ITEM_SIZE_SMALL
	var/plasma = 150
	var/max_plasma = 150

/obj/item/weapon/plasma_flask/examine(mob/user)
	..()
	to_chat(user, "The [src.name] currently hold [plasma] units of plasma fuel.")

/obj/item/weapon/plasma_flask/proc/use(var/amount)
	if(plasma >= amount) // Is there enough plasma left?
		plasma -= amount
		return TRUE
	else
		return FALSE

// Backpack variant.
/obj/item/weapon/plasma_flask/backpack
	name = "\improper plasmapack"
	desc = "A backpack full of volatile hydrogen. It cannot be refilled once spent."
	icon_state = "plasmapack"
	plasma = 2000
	max_plasma = 2000
	slot_flags = SLOT_BACK
	w_class = ITEM_SIZE_HUGE
