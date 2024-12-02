// Hydrogen Grenade, explode when hitting something, even if thrown.
/obj/item/hydrogen_grenade
	name = "hydrogen grenade"
	desc = "A case that can support a hydrogen fuel cell. It has a flimsy safe guard that barely prevents it from exploding from the weakest impact."
	icon = 'icons/obj/guns/plasma/hydrogen.dmi'
	icon_state = "grenade"
	item_state = "grenade"
	contained_sprite = TRUE
	origin_tech = list(TECH_POWER = 3)
	matter = list(MATERIAL_PLASTEEL = 3, MATERIAL_MHYDROGEN = 0.5, MATERIAL_OSMIUM = 0.5, MATERIAL_TRITIUM = 0.5)
	force = WEAPON_FORCE_WEAK
	throwforce = WEAPON_FORCE_WEAK
	throw_speed = 3
	throw_range = 7
	w_class = ITEM_SIZE_SMALL
	var/armed = FALSE
	var/obj/item/hydrogen_fuel_cell/fuel_cell = null // The flask the sword consume to stay active
	var/burn_min = 50 // How much burn damage the grenade do to nearby mobs.
	var/burn_max = 75 // How much burn damage the grenade do to nearby mobs.
	var/hydrogen_threshold = 10 // How much hydrogen must be in the cell for it to be viable.

/obj/item/hydrogen_grenade/attack_self(mob/living/user as mob)
	if(!fuel_cell)
		to_chat(user, "There isn't any hydrogen cell in the grenade, you can't arm it.")
		return

	if(fuel_cell.plasma < hydrogen_threshold)
		to_chat(user, "There isn't enough hydrogen in the cell, arming it would be useless.")
		return

	armed = !armed
	to_chat(user, SPAN_NOTICE("You [armed ? "arm" : "disarm"] the [src.name]."))
	playsound(loc, 'sound/weapons/armbomb.ogg', 75, 1, -3)
	update_icon()
	add_fingerprint(user)

/obj/item/hydrogen_grenade/attackby(obj/item/W as obj, mob/living/user as mob)
	if(istype(W, /obj/item/hydrogen_fuel_cell))
		if(fuel_cell)
			to_chat(usr, SPAN_WARNING("[src] is already loaded."))
			return

		if(insert_item(W, user))
			fuel_cell = W
			update_icon()
	else
		..()

/obj/item/hydrogen_grenade/MouseDrop(over_object)
	if((src.loc == usr) && istype(over_object, /obj/screen/inventory/hand) && eject_item(fuel_cell, usr))
		fuel_cell = null
		if(armed)
			armed = FALSE
		update_icon()

/obj/item/hydrogen_grenade/update_icon()
	cut_overlays()
	if(fuel_cell)
		add_overlay("[icon_state]_loaded")
	if(armed)
		add_overlay("[icon_state]_armed")

/obj/item/hydrogen_grenade/throw_impact(atom/hit_atom, var/speed)
	..()
	if(armed)
		explode()

/obj/item/hydrogen_grenade/attack(mob/living/M, mob/living/user, target_zone)
	if(..() && armed)
		explode()

/obj/item/hydrogen_grenade/proc/explode()
	var/turf/T = get_turf(src)
	explosion(T, 0, 1, 2, 4) // Explode
	new /obj/effect/explosion(T)
	for(var/mob/M in view(2, T)) // Burn every mob nearby.
		to_chat(M, SPAN_DANGER("You feel a wave of heat scorch your body!"))
		M.take_overall_damage(0, rand(burn_min, burn_max))
	spawn(20)
		qdel(src)
