
/obj/item/mech_ammo_box	//Should not be used by its own / It ignores ammo_type so you know FUNNY mechcode
	name = "ammunition box"
	desc = "Gun ammunition stored in a shiny new box. You can see caliber information on the label."
	icon = 'icons/obj/ammo.dmi'
	icon_state = "boxhrifle-hv"
	w_class = ITEM_SIZE_BULKY
	var/ammo_amount_left = 0 //How many shells this box has left
	var/ammo_max_amout = 0 //How many shells can this big box hold?
	var/amount_per_click = 1 //how many we load per click. Used to
	var/ammo_type = null//What kinda ammo do we load?
	matter = list(MATERIAL_STEEL = 35)

/obj/item/mech_ammo_box/examine(mob/user)
	..()
	to_chat(user, "<span class='info'>Ammo left: [ammo_amount_left]</span>")
	to_chat(user, "<span class='info'>Ammo type: [ammo_type]</span>")

/obj/item/mech_ammo_box/attackby(obj/item/I, mob/user as mob)
	..()
	if (istype(I, /obj/item/mech_ammo_box))
		while(1)
			if(ammo_type != src.ammo_type)
				to_chat(user, SPAN_WARNING("Wrong ammo type!"))
				return 0
			if(ammo_amount_left <= 0)
				to_chat(user, SPAN_WARNING("The box is out of ammo."))
				return 0
			if(src.ammo_max_amout <= src.ammo_amount_left)
				to_chat(user, SPAN_WARNING("The box is full."))
				return 0
			ammo_amount_left -= amount_per_click
			src.ammo_amount_left += amount_per_click
			return 1

///////////
/// HMG ///
///////////

/obj/item/mech_ammo_box/hmg
	name = "25mm ammunition box"
	desc = "A box of ammo meant for loading into a HMG platforms."
	icon_state = "boxhrifle-practice"
	ammo_amount_left = 300
	ammo_max_amout = 300
	amount_per_click = 3 //Hack to make them impossable to go into negitives / It can still go into negatives
	ammo_type = CAL_MECH_MACHINEGUN
	price_tag = 30

//////////////////
/// AUTOCANNON ///
//////////////////

/obj/item/mech_ammo_box/cannon
	name = "60mm HEAD ammunition box"
	desc = "A box of ammo meant for loading into a AC platforms."
	icon_state = "boxhrifle-practice"
	ammo_amount_left = 25
	ammo_max_amout = 25
	amount_per_click = 3
	ammo_type = CAL_MECH_AUTOCANNON
	price_tag = 30

/obj/item/mech_ammo_box/ultracannon
	name = "50mm HEAD ammunition box"
	desc = "A box of ammo meant for loading into a U-AC platforms."
	icon_state = "boxhrifle-practice"
	ammo_amount_left = 25
	ammo_max_amout = 25
	amount_per_click = 3
	ammo_type = CAL_MECH_ULTRACANNON
	price_tag = 30

////////////////
/// FLAK/LBX ///
////////////////

/obj/item/mech_ammo_box/scattershot
	name = "30mm HEAD ammunition box"
	desc = "A box of ammo meant for loading into a LB-X/flak platforms."
	icon_state = "boxhrifle-hv"
	ammo_amount_left = 40
	ammo_max_amout = 40
	ammo_type = CAL_MECH_SHOTGUN
	price_tag = 30

///////////////
/// MISSILE ///
///////////////

/obj/item/missile
	icon = 'icons/obj/grenade.dmi'
	icon_state = "missile"
	var/primed = null
	throwforce = 15
	allow_spin = 0

	throw_impact(atom/hit_atom)
		if(primed)
			explosion(hit_atom, 0, 1, 2, 4)
			qdel(src)
		else
			..()
		return
