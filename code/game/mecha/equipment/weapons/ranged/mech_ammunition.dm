
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
	. = ..()
	to_chat(user, "<span class='info'>Ammo left: [ammo_amount_left]</span>")
	to_chat(user, "<span class='info'>Ammo type: [ammo_type]</span>")

/obj/item/mech_ammo_box/attackby(obj/item/I, mob/user as mob)
	. = ..()
	if(istype(I, /obj/item/mech_ammo_box))
		var/obj/item/mech_ammo_box/FMJ = I //Full metal jecket
		if(FMJ.ammo_type != ammo_type)
			to_chat(user, SPAN_WARNING("Wrong ammo type!"))
			return 0
		if(FMJ.ammo_amount_left <= 0)
			to_chat(user, SPAN_WARNING("[FMJ] is out of ammo."))
			return 0
		if(ammo_amount_left >= ammo_max_amout)
			to_chat(user, SPAN_WARNING("[src] is full."))
			return 0
		if(FMJ.ammo_amount_left + amount_per_click > ammo_max_amout)
			amount_per_click = ammo_max_amout - FMJ.ammo_amount_left
		FMJ.ammo_amount_left -= amount_per_click
		ammo_amount_left += amount_per_click
		return 1

///////////
/// HMG ///
///////////

/obj/item/mech_ammo_box/hmg
	name = "25mm ammunition box"
	desc = "A heavy duty box with a feeder containing ammunition for a mech-mounted heavy machinegun."
	icon_state = "boxhrifle-practice"
	ammo_amount_left = 360
	ammo_max_amout = 360
	amount_per_click = 40 //Hack to make them impossable to go into negitives / It can still go into negatives
	ammo_type = CAL_MECH_MACHINEGUN
	price_tag = 30

//////////////////
/// AUTOCANNON ///
//////////////////

/obj/item/mech_ammo_box/cannon
	name = "60mm HEAD ammunition box"
	desc = "A heavy duty box with a feeder containing ammunition for a full-sized autocannon."
	icon_state = "boxhrifle-practice"
	ammo_amount_left = 80
	ammo_max_amout = 80
	amount_per_click = 10
	ammo_type = CAL_MECH_AUTOCANNON
	price_tag = 30

/obj/item/mech_ammo_box/ultracannon
	name = "30mm HEAD ammunition box"
	desc = "A heavy duty box with a feeder containing ammunition for a mech-sized autocannon."
	icon_state = "boxhrifle-practice"
	ammo_amount_left = 180
	ammo_max_amout = 180
	amount_per_click = 30
	ammo_type = CAL_MECH_ULTRACANNON
	price_tag = 30

////////////////
/// FLAK/LBX ///
////////////////

/obj/item/mech_ammo_box/scattershot
	name = "50mm HEAD ammunition box"
	desc = "A heavy duty box with a feeder containing ammunition for a flak cannon."
	icon_state = "boxhrifle-hv"
	ammo_amount_left = 90
	ammo_max_amout = 90
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

/obj/item/missile/throw_impact(atom/hit_atom)
	if(primed)
		explosion(hit_atom, 0, 1, 2, 4)
		qdel(src)
	else
		..()

/obj/item/longtom
	icon = 'icons/obj/grenade.dmi'
	icon_state = "missile_tom"
	var/primed = null
	throwforce = 10
	allow_spin = 0

/obj/item/longtom/throw_impact(atom/hit_atom)
	if(primed)
		explosion(hit_atom, 3, 4, 6, 5)
		qdel(src)
	else
		..()
