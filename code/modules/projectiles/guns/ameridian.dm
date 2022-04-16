// Ameridian-based Weaponry require an ameridian core to be usable and consume liquid ameridian as ammo.

/obj/item/gun/ameridian
	name = "ameridian gun"
	desc = "A gun using liquid ameridian to shoot a beam of deadly radiation. It require an ameridian core & liquid ameridian to work"
	icon = 'icons/obj/guns/energy/sonic_emitter.dmi'
	icon_state = "sonic_emitter"
	item_state = "sonic_emitter"
	fire_delay = 25
	slot_flags = SLOT_BACK // Can only fit in the back
	twohanded = FALSE
	max_upgrades = 0
	fire_sound = 'sound/weapons/wave.ogg'
	reagent_flags = REFILLABLE |  DRAINABLE | TRANSPARENT
	var/projectile_type = /obj/item/projectile/beam/ameridian // What does it shoot
	var/internal_tank_size = 250 // How many reagents can the gun hold.
	var/use_amount = 10 // How much fuel is used per shot
	var/ammo_type = MATERIAL_AMERIDIAN // What kind of chem do we use?
	var/obj/item/ameridian_core/core // The ameridian core the gun need to work

/obj/item/gun/ameridian/Initialize(mapload, ...)
	..()
	create_reagents(internal_tank_size)
	if(mapload)
		core = new(src) // Give the gun a new core when mapped in.
		reagents.add_reagent(MATERIAL_AMERIDIAN, reagents.maximum_volume) // Start filled with ameridian

/obj/item/gun/ameridian/examine(mob/user)
	..(user)
	if(!core)
		to_chat(user, SPAN_NOTICE("[src] has no ameridian core."))
		return
	if(use_amount) // In case we don't use any ammo
		to_chat(user, "[src] has [round(reagents.total_volume / use_amount)] shot\s remaining.")
	return

/obj/item/gun/ameridian/MouseDrop(over_object)
	if((src.loc == usr) && istype(over_object, /obj/screen/inventory/hand) && eject_item(core, usr))
		core = null
		update_icon()

/obj/item/gun/ameridian/attackby(obj/item/W as obj, mob/living/user as mob)
	if(core && istype(W, /obj/item/ameridian_core))
		to_chat(usr, SPAN_WARNING("[src] already has a core."))
		return

	if(istype(W, /obj/item/ameridian_core) && insert_item(W, usr))
		core = W
		update_icon()
		return

	..()

/obj/item/gun/ameridian/consume_next_projectile()
	if(!core) // Do we have a fuel can?
		return null
	if(!ispath(projectile_type)) // Do we actually shoot something?
		return null
	if(!reagents.remove_reagent(ammo_type, use_amount)) // Do we have enough fuel? (Also consume the fuel if we have enough)
		return null
	return new projectile_type(src)
