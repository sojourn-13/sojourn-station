/obj/item/clothing/gloves/stungloves
	name = "HS Power Gloves"
	desc = "Seinemetall Defense GmbH solution for police operations. Punch criminals right in the face instead of prodding them with some feeble rod."
	icon_state = "powerglove"
	item_state = "powerglove"
	armor_list = list(melee = 6, bullet = 2, energy = 5, bomb = 0, bio = 0, rad = 0)
	action_button_name = "Toggle Power Glove"
	price_tag = 250
	var/stunforce = 0
	var/agonyforce = 30
	var/status = FALSE		//whether the thing is on or not
	var/hitcost = 100
	cell = null
	suitable_cell = /obj/item/cell/medium

/obj/item/clothing/gloves/stungloves/Initialize()
	. = ..()
	cell = new /obj/item/cell/medium/high(src)
	update_icon()

/obj/item/clothing/gloves/stungloves/get_cell()
	return cell

/obj/item/clothing/gloves/stungloves/handle_atom_del(atom/A)
	..()
	if(A == cell)
		cell = null
		update_icon()

/obj/item/clothing/gloves/stungloves/proc/deductcharge(var/power_drain)
	if(cell)
		if(cell.checked_use(power_drain))
			//do we have enough power for another hit?
			if(!cell.check_charge(hitcost))
				status = FALSE
				update_icon()
			return TRUE
		else
			status = FALSE
			update_icon()
			return FALSE

/obj/item/clothing/gloves/stungloves/update_icon()
	if(status)
		icon_state = "powerglove_active"
	else
		icon_state = "powerglove"
	update_wear_icon()

/obj/item/clothing/gloves/stungloves/examine(mob/user)
	if(!..(user, 1))
		return

	if(cell)
		to_chat(user, SPAN_NOTICE("Power Glove is [round(cell.percent())]% charged."))
	else
		to_chat(user, SPAN_WARNING("Power Glove does not have a power source installed."))

/obj/item/clothing/gloves/stungloves/attack_self(mob/user)
	if(cell && cell.charge > hitcost)
		status = !status
		to_chat(user, "<span class='notice'>[src] is now [status ? "on" : "off"].</span>")
		playsound(loc, "sparks", 75, 1, -1)
		update_icon()
	else
		status = FALSE
		if(!cell)
			to_chat(user, SPAN_WARNING("[src] does not have a power source!"))
		else
			to_chat(user, SPAN_WARNING("[src] is out of charge."))
	add_fingerprint(user)

/obj/item/clothing/gloves/stungloves/Touch(mob/living/L, var/proximity)
	if(!status)
		return FALSE
	if(!istype(L) || !proximity)
		return ..()
	if(isrobot(L))
		return ..()

	var/mob/living/user = loc
	var/agony = agonyforce
	var/stun = stunforce
	var/obj/item/organ/external/affecting = null
	if(ishuman(L))
		var/mob/living/carbon/human/H = L
		affecting = H.get_organ(user.targeted_organ)

	//stun effects
	if(affecting)
		L.visible_message(SPAN_DANGER("[L] has been punched in the [affecting.name] with [src] by [user]!"))
	else
		L.visible_message(SPAN_DANGER("[L] has been punched with [src] by [user]!"))
	if(deductcharge(hitcost))
		L.stun_effect_act(stun, agony, user.targeted_organ, src)
		msg_admin_attack("[key_name(user)] stunned [key_name(L)] with the [src].")

	if(ishuman(L))
		var/mob/living/carbon/human/H = L
		H.forcesay(hit_appends)
		playsound(loc, 'sound/weapons/Egloves.ogg', 50, 1, -1)

/obj/item/clothing/gloves/stungloves/emp_act(severity)
	if(cell)
		cell.emp_act(severity)	//let's not duplicate code everywhere if we don't have to please.
	..()

/obj/item/clothing/gloves/stungloves/MouseDrop(over_object)
	if((src.loc == usr) && istype(over_object, /obj/screen/inventory/hand) && eject_item(cell, usr))
		cell = null
		status = FALSE
		update_icon()

/obj/item/clothing/gloves/stungloves/attackby(obj/item/C, mob/living/user)
	if(istype(C, suitable_cell) && !cell && insert_item(C, user))
		src.cell = C
		update_icon()

/obj/item/clothing/gloves/stungloves/trauma
	name = "SI shock gloves"
	desc = "Soterias solution to the age old question of unruly patients. Although the uneducation might call these a flagrant ripoff of Seinemetall powergloves, those more thoughtful will find that these come equipped with sterile, autoclave safe components, \
	high-power capacitors and grippy palm-pads."
	icon_state = "sipowerglove"
	item_state = "sipowerglove"
	permeability_coefficient = 0.01
	armor_list = list(melee = 3, bullet = 0, energy = 2, bomb = 0, bio = 100, rad = 0)  //same armor values as jackboots + bio protection.
	action_button_name = "Toggle placeholder Glove"
	price_tag = 500 //rarer and harder to find.
	agonyforce = 40 //same as the stun baton, these are slightly better than the Marshal version thusly.

/obj/item/clothing/gloves/stungloves/trauma/update_icon()
	if(status)
		icon_state = "sipowerglove_active"
	else
		icon_state = "sipowerglove"
	update_wear_icon()
