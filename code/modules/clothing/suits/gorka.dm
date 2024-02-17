
//
/// General hooded code.
//

/obj/item/clothing/suit/gorka
	var/obj/item/clothing/head/hood/hood
	var/hoodtype = null //So other clothing can override this.

/obj/item/clothing/suit/gorka/New()
	MakeHood()
	..()

/obj/item/clothing/suit/gorka/Destroy()
	qdel(hood)
	return ..()

/obj/item/clothing/suit/gorka/proc/MakeHood()
	if(!hood && hoodtype)
		hood = new hoodtype(src)

/obj/item/clothing/suit/gorka/equipped(mob/M)
	..()

	if (is_held())
		retract()

	var/mob/living/carbon/human/H = M

	if(!istype(H)) return

	if(H.wear_suit != src)
		return

/obj/item/clothing/suit/gorka/dropped()
	..()
	retract()

/obj/item/clothing/suit/gorka/proc/retract()
	var/mob/living/carbon/human/H

	if(hood)
		H = hood.loc
		if(istype(H))
			if(hood && H.head == hood)
				H.drop_from_inventory(hood)
				hood.forceMove(src)
				if(hood.overslot)
					hood.remove_overslot_contents(H)

/obj/item/clothing/suit/gorka/verb/toggle_hood()

	set name = "Toggle Hood"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	if(!hood)
		usr << "There is no hood."
		return

	var/mob/living/carbon/human/H = usr

	if(!istype(H)) return
	if(H.stat) return
	if(H.wear_suit != src) return

	if(H.head == hood)
		H << SPAN_NOTICE("You lower your hood.")
		hood.canremove = 1
		H.drop_from_inventory(hood)
		hood.forceMove(src)
	else
		if(H.head)
			H << SPAN_DANGER("You cannot rise your hood while wearing \the [H.head].")
			return
		if(H.equip_to_slot_if_possible(hood, slot_head))
			hood.canremove = 0
			H << "<span class='info'>You rise your hood.</span>"


//Jackets with buttons, used for labcoats, IA jackets, First Responder jackets, and brown jackets.


/obj/item/clothing/suit/gorka/toggle
	var/icon_open
	var/icon_closed
	verb/toggle()
		set name = "Toggle Coat Buttons"
		set category = "Object"
		set src in usr
		if(!usr.canmove || usr.stat || usr.restrained())
			return 0

		if(icon_state == icon_open) //Will check whether icon state is currently set to the "open" or "closed" state and switch it around with a message to the user
			icon_state = icon_closed
			to_chat(usr, "You button up the coat.")
		else if(icon_state == icon_closed)
			icon_state = icon_open
			to_chat(usr, "You unbutton the coat.")
		else //in case some goofy admin switches icon states around without switching the icon_open or icon_closed
			to_chat(usr, "You attempt to button-up the velcro on your [src], before promptly realising how silly you are.")
			return
		update_wear_icon()	//so our over-lays update

//Haveing them hold shit


/obj/item/clothing/suit/gorka
	item_flags = DRAG_AND_DROP_UNEQUIP|EQUIP_SOUNDS
	var/obj/item/storage/internal/pockets

/obj/item/clothing/suit/gorka/New()
	..()
	pockets = new/obj/item/storage/internal(src)
	pockets.storage_slots = 2	//two slots
	pockets.max_w_class = ITEM_SIZE_SMALL		//fit only pocket sized items
	pockets.max_storage_space = 4

/obj/item/clothing/suit/gorka/Destroy()
	qdel(pockets)
	pockets = null
	. = ..()

/obj/item/clothing/suit/gorka/attack_hand(mob/user)
	if ((is_worn() || is_held()) && !pockets.handle_attack_hand(user))
		return TRUE
	..(user)

/obj/item/clothing/suit/gorka/MouseDrop(obj/over_object)
	if(pockets.handle_mousedrop(usr, over_object))
		return TRUE
	..(over_object)

/obj/item/clothing/suit/gorka/attackby(obj/item/W, mob/user)
	if(!istype(W, /obj/item/clothing/accessory)) // Do not put accessories into pockets
		pockets.attackby(W, user)
	..()

/obj/item/clothing/suit/gorka/emp_act(severity)
	pockets.emp_act(severity)
	..()


// Gorka Base

/obj/item/clothing/suit/gorka/toggle/gorka/camo
	name = "camo gorka jacket"
	desc = "A rugged, two-tone military field parka for the partizan fighter in you."
	icon_state = "gorka_jacket_ss"
	icon_open = "gorka_jacket_ss_open"
	icon_closed = "gorka_jacket_ss"
	hoodtype = /obj/item/clothing/head/hood/gorkahood/camo

/obj/item/clothing/suit/gorka/toggle/gorka/crew
	name = "crew gorka jacket"
	desc = "A vaguely military style utility jacket in a modest grey two-tone."
	icon_state = "gorka_jacket_crew"
	icon_open = "gorka_jacket_crew_open"
	icon_closed = "gorka_jacket_crew"
	hoodtype = /obj/item/clothing/head/hood/gorkahood/crew

/obj/item/clothing/suit/gorka/toggle/gorka/crew_b
	name = "blue crew gorka jacket"
	desc = "A vaguely military style utility jacket in a modest grey two-tone featuring blue liverly."
	icon_state = "gorka_jacket_crew_b"
	icon_open = "gorka_jacket_crew_b_open"
	icon_closed = "gorka_jacket_crew_b"
	hoodtype = /obj/item/clothing/head/hood/gorkahood/crew_blue

/obj/item/clothing/suit/gorka/toggle/gorka/crew_g
	name = "green crew gorka jacket"
	desc = "A vaguely military style utility jacket in a modest grey two-tone featuring green liverly."
	icon_state = "gorka_jacket_crew_g"
	icon_open = "gorka_jacket_crew_g_open"
	icon_closed = "gorka_jacket_crew_g"
	hoodtype = /obj/item/clothing/head/hood/gorkahood/crew_green

/obj/item/clothing/suit/gorka/toggle/gorka/crew_light
	name = "light crew gorka"
	desc = "A fashionable parka of vaguely militant design."
	icon_state = "gorka_jacket_crew_light"
	icon_open = "gorka_jacket_crew_light_open"
	icon_closed = "gorka_jacket_crew_light"
	hoodtype = /obj/item/clothing/head/hood/gorkahood/crew_light

/obj/item/clothing/suit/gorka/toggle/gorka/crew_light_b
	name = "light blue crew gorka"
	desc = "A fashionable parka of vaguely militant design featuring a sporty two-tone blue-on-white scheme."
	icon_state = "gorka_jacket_crew_light_b"
	icon_open = "gorka_jacket_crew_light_b_open"
	icon_closed = "gorka_jacket_crew_light_b"
	hoodtype = /obj/item/clothing/head/hood/gorkahood/crew_light_b

/obj/item/clothing/suit/gorka/toggle/gorka/crew_o
	name = "orange crew gorka jacket"
	desc = "A vaguely military style utility jacket in a modest grey two-tone and featuring orange liverly."
	icon_state = "gorka_jacket_crew_o"
	icon_open = "gorka_jacket_crew_o_open"
	icon_closed = "gorka_jacket_crew_o"
	hoodtype = /obj/item/clothing/head/hood/gorkahood/crew_orange

/obj/item/clothing/suit/gorka/toggle/gorka/crew_y
	name = "yellow crew gorka jacket"
	desc = "A vaguely military style utility jacket in a modest grey two-tone and featuring orange liverly."
	icon_state = "gorka_jacket_crew_y"
	icon_open = "gorka_jacket_crew_y_open"
	icon_closed = "gorka_jacket_crew_y"
	hoodtype = /obj/item/clothing/head/hood/gorkahood/crew_yellow

/obj/item/clothing/suit/gorka/toggle/gorka/standard
	name = "standard gorka jacket"
	desc = "A rugged, two-tone military style field parka for the adventurer or paramilitant in you."
	icon_state = "gorka_jacket"
	icon_open = "gorka_jacket_open"
	icon_closed = "gorka_jacket"
	hoodtype = /obj/item/clothing/head/hood/gorkahood/standard

/obj/item/clothing/suit/gorka/toggle/gorka/dark
	name = "dark gorka jacket"
	desc = "A rugged, vaguely slavic two-tone parka, made with dark cloath."
	icon_state = "gorka_jacket_ih"
	icon_open = "gorka_jacket_ih_open"
	icon_closed = "gorka_jacket_ih"
	hoodtype = /obj/item/clothing/head/hood/gorkahood/dark

/obj/item/clothing/suit/gorka/toggle/gorka
	name = "tan gorka jacket"
	desc = "A rugged, two-tone military style tan parka for the adventurer or paramilitant in you."
	icon_state = "gorka_jacket_tan"
	icon_open = "gorka_jacket_tan_open"
	icon_closed = "gorka_jacket_tan"
	blood_overlay_type = "coat"
	armor_list = list(melee = 5, bullet = 0, energy = 5, bomb = 0, bio = 0, rad = 0)
	body_parts_covered = UPPER_TORSO|ARMS
	cold_protection = UPPER_TORSO|ARMS
	min_cold_protection_temperature = T0C - 20
	siemens_coefficient = 0.7
	hoodtype = /obj/item/clothing/head/hood/gorkahood

/*Gorka Hood*/

/obj/item/clothing/head/hood/gorkahood/camo
	name = "camo gorka hood"
	desc = "A hood from a gorka jacket, oddly cozy."
	icon_state = "gorka_jacket_ss_hood"

/obj/item/clothing/head/hood/gorkahood/crew
	name = "crew gorka hood"
	desc = "A hood from a gorka jacket, oddly cozy."
	icon_state = "gorka_jacket_crew_hood"

/obj/item/clothing/head/hood/gorkahood/crew_blue
	name = "blue crew gorka hood"
	desc = "A hood from a gorka jacket, oddly cozy."
	icon_state = "gorka_jacket_crew_b_hood"

/obj/item/clothing/head/hood/gorkahood/crew_green
	name = "green crew gorka hood"
	desc = "A hood from a gorka jacket, oddly cozy."
	icon_state = "gorka_jacket_crew_g_hood"

/obj/item/clothing/head/hood/gorkahood/crew_light
	name = "light crew gorka hood"
	desc = "A hood from a gorka jacket, oddly cozy."
	icon_state = "gorka_jacket_crew_light_hood"

/obj/item/clothing/head/hood/gorkahood/crew_light_b
	name = "light blue crew gorka hood"
	desc = "A hood from a gorka jacket, oddly cozy."
	icon_state = "gorka_jacket_crew_light_b_hood"

/obj/item/clothing/head/hood/gorkahood/crew_orange
	name = "orange crew gorka hood"
	desc = "A hood from a gorka jacket, oddly cozy."
	icon_state = "gorka_jacket_crew_o_hood"

/obj/item/clothing/head/hood/gorkahood/crew_yellow
	name = "yellow crew gorka hood"
	desc = "A hood from a gorka jacket, oddly cozy."
	icon_state = "gorka_jacket_crew_y_hood"

/obj/item/clothing/head/hood/gorkahood/standard
	name = "standard gorka jacket hood"
	icon_state = "gorka_jacket_hood"
	desc = "A hood from a gorka jacket, oddly cozy."

/obj/item/clothing/head/hood/gorkahood/dark
	name = "dark gorka hood"
	desc = "A hood from a gorka jacket, oddly sneaky."
	icon_state = "gorka_jacket_ih_hood"

/obj/item/clothing/head/hood/gorkahood
	name = "tan gorka jacket hood"
	desc = "A hood from a gorka jacket, oddly cozy."
	icon_state = "gorka_jacket_tan_hood"
	flags_inv = HIDEEARS|BLOCKHEADHAIR
	body_parts_covered = HEAD|EARS

/*Gorka Ranks*/

/obj/item/clothing/suit/gorka/toggle/gorka_crew_sci
	name = "science crew gorka"
	desc = "A durable, baggy grey parka sporting research and development patches."
	icon_state = "gorka_jacket_crew_sci"
	icon_open = "gorka_jacket_crew_sci_open"
	icon_closed = "gorka_jacket_crew_sci"
	blood_overlay_type = "coat"
	permeability_coefficient = 0.50
	armor_list = list(melee = 5, bullet = 0, energy = 5, bomb = 0, bio = 0, rad = 0)
	body_parts_covered = UPPER_TORSO|ARMS
	cold_protection = UPPER_TORSO|ARMS
	min_cold_protection_temperature = T0C - 20
	siemens_coefficient = 0.7
	hoodtype = /obj/item/clothing/head/hood/gorkahood_crew_sci

/obj/item/clothing/head/hood/gorkahood_crew_sci
	name = "science crew gorka hood"
	desc = "A hood from a gorka jacket, oddly cozy."
	icon_state = "gorka_jacket_crew_sci_hood"
	permeability_coefficient = 0.50
	armor_list = list(melee = 5, bullet = 0, energy = 5, bomb = 0, bio = 5, rad = 5)
	flags_inv = HIDEEARS|BLOCKHEADHAIR
	body_parts_covered = HEAD|EARS

/obj/item/clothing/suit/gorka/toggle/crew_med
	name = "medical crew gorka jacket"
	desc = "A durable, baggy grey jacket sporting EMS patches, high vis strips and stain resistant coating."
	icon_state = "gorka_jacket_crew_med"
	icon_open = "gorka_jacket_crew_med_open"
	icon_closed = "gorka_jacket_crew_med"
	blood_overlay_type = "coat"
	permeability_coefficient = 0.50
	armor_list = list(melee = 5, bullet = 0, energy = 5, bomb = 0, bio = 5, rad = 0)
	body_parts_covered = UPPER_TORSO|ARMS
	cold_protection = UPPER_TORSO|ARMS
	min_cold_protection_temperature = T0C - 20
	siemens_coefficient = 0.7
	hoodtype = /obj/item/clothing/head/hood/gorkahood_crew_med

/obj/item/clothing/head/hood/gorkahood_crew_med
	name = "medical crew gorka jacket hood"
	desc = "A hood from a gorka jacket, oddly cozy."
	icon_state = "gorka_jacket_crew_med_hood"
	permeability_coefficient = 0.50
	armor_list = list(melee = 5, bullet = 0, energy = 5, bomb = 0, bio = 5, rad = 5)
	flags_inv = HIDEEARS|BLOCKHEADHAIR
	body_parts_covered = HEAD|EARS

/obj/item/clothing/suit/gorka/toggle/gorka_ih
	name = "security gorka jacket"
	desc = "A rugged, vaguely slavic two-tone parka, made with robust materials and lined with ballistic mesh."
	icon_state = "gorka_jacket_ih"
	icon_open = "gorka_jacket_ih_open"
	icon_closed = "gorka_jacket_ih"
	blood_overlay_type = "coat"
	armor_list = list(melee = 6, bullet = 6, energy = 3, bomb = 15, bio = 0, rad = 0)
	body_parts_covered = UPPER_TORSO|ARMS
	cold_protection = UPPER_TORSO|ARMS
	min_cold_protection_temperature = T0C - 20
	siemens_coefficient = 0.7
	hoodtype = /obj/item/clothing/head/hood/gorkahood_ih

/obj/item/clothing/head/hood/gorkahood_ih
	name = "security gorka hood"
	desc = "A hood from a gorka jacket, oddly robust."
	icon_state = "gorka_jacket_ih_hood"
	armor_list = list(melee = 5, bullet = 3, energy = 2, bomb = 10, bio = 0, rad = 0)
	flags_inv = HIDEEARS|BLOCKHEADHAIR
	body_parts_covered = HEAD|EARS

/obj/item/clothing/suit/gorka/toggle/gorka_ih/ih_med_b
	name = "blue corpsman gorka jacket"
	desc = "A durable, baggy jacket featuring blue medical liverly, stain-resistant coating and a light ballistic mesh."
	icon_state = "gorka_jacket_ih_med_b"
	icon_open = "gorka_jacket_ih_med_b_open"
	icon_closed = "gorka_jacket_ih_med_b"
	hoodtype = /obj/item/clothing/head/hood/gorkahood_ih/ih_med_b

/obj/item/clothing/head/hood/gorkahood_ih/ih_med_b
	name = "blue corpsman hood"
	desc = "A hood from a gorka jacket, oddly robust."
	icon_state = "gorka_jacket_ih_med_b_hood"

/obj/item/clothing/suit/gorka/toggle/gorka_ih/ih_med_g
	name = "green corpsman gorka jacket"
	desc = "A durable, baggy jacket featuring green medical liverly, stain-resistant coating and a light ballistic mesh."
	icon_state = "gorka_jacket_ih_med_g"
	icon_open = "gorka_jacket_ih_med_g_open"
	icon_closed = "gorka_jacket_ih_med_g"
	hoodtype = /obj/item/clothing/head/hood/gorkahood_ih/ih_med_g

/obj/item/clothing/head/hood/gorkahood_ih/ih_med_g
	name = "green corpsman hood"
	desc = "A hood from a gorka jacket, oddly robust."
	icon_state = "gorka_jacket_ih_med_g_hood"

