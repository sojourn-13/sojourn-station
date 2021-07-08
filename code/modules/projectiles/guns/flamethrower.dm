/obj/item/weapon/gun/flamethrower
	name = "\"Vietnam\"-Pattern Flamethrower"
	desc = "A flamethrower that launch burning globs of napalm. Perfect for burning down jungles and commiting war crimes."
	icon = 'icons/obj/guns/launcher/backburner.dmi'
	icon_state = "backburner"
	fire_delay = 25
	slot_flags = SLOT_BACK // Can only fit in the back
	twohanded = TRUE // Need two hands to shoot.
	max_upgrades = 0 // How do you want to upgrade flames?
	var/projectile_type = /obj/item/projectile/flamer_lob/flamethrower // What does it shoot
	var/use_amount = 10 // How much fuel is used per shot
	var/fuel_type = "fuel" // What kind of chem do we use?
	var/obj/item/weapon/weldpack/canister/fuel_can = null // The canister the gun use for ammo

/obj/item/weapon/gun/flamethrower/Initialize()
	..()
	fuel_can = new /obj/item/weapon/weldpack/canister/flamethrower(src) // Give the gun a new flask when mapped in.

/obj/item/weapon/gun/flamethrower/New()
	..()

/obj/item/weapon/gun/flamethrower/examine(mob/user)
	..(user)
	if(!fuel_can)
		to_chat(user, SPAN_NOTICE("It has no fuel_can inserted."))
		return
	if(use_amount) // In case we don't use any ammo
		var/shots_remaining = round(fuel_can.reagents.total_volume / use_amount)
		to_chat(user, "The [src.name] has [shots_remaining] shot\s remaining.")
	return

// Removing the fuel canister
/obj/item/weapon/gun/flamethrower/MouseDrop(over_object)
	if((src.loc == usr) && istype(over_object, /obj/screen/inventory/hand) && eject_item(fuel_can, usr))
		fuel_can = null
		update_icon()

/obj/item/weapon/gun/flamethrower/attackby(obj/item/weapon/W as obj, mob/living/user as mob)
	if(fuel_can && istype(W, /obj/item/weapon/weldpack/canister))
		to_chat(usr, SPAN_WARNING("[src] is already loaded."))
		return

	if(istype(W, /obj/item/weapon/weldpack/canister) && insert_item(W, user))
		fuel_can = W
		update_icon()
		return

/obj/item/weapon/gun/flamethrower/consume_next_projectile()
	if(!fuel_can) // Do we have a fuel can?
		return null
	if(!ispath(projectile_type)) // Do we actually shoot something?
		return null
	if(!fuel_can.reagents.remove_reagent(fuel_type, use_amount)) // Do we have enough fuel? (Also consume the fuel if we have enough)
		return null
	return new projectile_type(src)
