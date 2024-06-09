/*
CONTAINS:
BEDSHEETS
LINEN BINS
*/

/obj/item/bedsheet
	name = "bed sheet"
	desc = "A surprisingly soft linen bed sheet."
	icon = 'icons/obj/bedsheets.dmi'
	icon_state = "sheet"
	item_state = "bedsheet"
	layer = 4.0
	throwforce = WEAPON_FORCE_HARMLESS
	throw_speed = 1
	throw_range = 2
	w_class = ITEM_SIZE_NORMAL
	var/rolled = FALSE
	var/folded = FALSE
	var/inuse = FALSE

/obj/item/bedsheet/Initialize(mapload, nfolded=FALSE)
	. = ..()
	folded = nfolded
	update_icon()

/obj/item/bedsheet/afterattack(atom/A, mob/user)
	if(!user || user.incapacitated() || !user.Adjacent(A))
		return
	if(toggle_fold(user))
		pixel_x = 0
		pixel_y = 0
		pixel_z = 0
		pixel_w = 0
		user.drop_item()
		forceMove(get_turf(A))
		add_fingerprint(user)
		return

/obj/item/bedsheet/proc/toggle_roll(mob/living/user, no_message = FALSE)
	if(!user)
		return FALSE
	if(inuse)
		to_chat(user, "Someone is already using \the [src]")
		return FALSE
	inuse = TRUE
	if (do_after(user, 6, src, incapacitation_flags = INCAPACITATION_KNOCKOUT))
		if(user.loc != loc)
			user.do_attack_animation(src)
		playsound(get_turf(loc), "rustle", 15, 1, -5)
		if(!no_message)
			user.visible_message(
				SPAN_NOTICE("\The [user] [rolled ? "unrolled" : "rolled"] \the [src]."),
				SPAN_NOTICE("You [rolled ? "unrolled" : "rolled"] \the [src].")
			)
		if(!rolled)
			rolled = TRUE
		else
			rolled = FALSE
			if(!user.resting && get_turf(src) == get_turf(user))
				user.lay_down()
		inuse = FALSE
		update_icon()
		return TRUE
	inuse = FALSE
	return FALSE

/obj/item/bedsheet/proc/toggle_fold(mob/user, no_message = FALSE)
	if(!user)
		return FALSE
	if(inuse)
		to_chat(user, "Someone already using \the [src]")
		return FALSE
	inuse = TRUE
	if (do_after(user, 25, src))
		rolled = FALSE
		if(user.loc != loc)
			user.do_attack_animation(src)
		playsound(get_turf(loc), "rustle", 15, 1, -5)
		if(!no_message)
			user.visible_message(
				SPAN_NOTICE("\The [user] [folded ? "unfolded" : "folded"] \the [src]."),
				SPAN_NOTICE("You [folded ? "unfolded" : "folded"] \the [src].")
			)
		if(!folded)
			folded = TRUE
			w_class = ITEM_SIZE_SMALL
		else

			folded = FALSE
			w_class =ITEM_SIZE_NORMAL
		inuse = FALSE
		update_icon()
		return TRUE
	inuse = FALSE
	return FALSE

/obj/item/bedsheet/verb/fold_verb()
	set name = "Fold bed sheet"
	set category = "Object"
	set src in view(1)

	if(istype(loc,/mob))
		to_chat(usr, "Drop \the [src] first.")
	else if(ishuman(usr))
		toggle_fold(usr)

/obj/item/bedsheet/verb/roll_verb()
	set name = "Roll bed sheet"
	set category = "Object"
	set src in view(1)

	if(folded)
		to_chat(usr, "Unfold \the [src] first.")
	else if(istype(loc,/mob))
		to_chat(usr, "Drop \the [src] first.")
	else if(ishuman(usr))
		toggle_roll(usr)

/obj/item/bedsheet/attackby(obj/item/I, mob/user)
	if(is_sharp(I))
		user.visible_message(
			SPAN_NOTICE("\The [user] begins cutting up \the [src] with \a [I]."),
			SPAN_NOTICE("You begin cutting up \the [src] with \the [I].")
		)
		if(do_after(user, 50, src))
			to_chat(user, SPAN_NOTICE("You cut \the [src] into pieces!"))
			for(var/i in 1 to rand(2,5))
				new /obj/item/stack/material/cloth(get_turf(src))
			qdel(src)
		return
	..()

/obj/item/bedsheet/attack_hand(mob/user)
	if(!user || user.incapacitated(INCAPACITATION_KNOCKOUT))
		return
	if(!folded)
		toggle_roll(user)
	else
		.=..()
	add_fingerprint(user)

/obj/item/bedsheet/MouseDrop(over_object, src_location, over_location)
	..()
	if(over_object == usr || istype(over_object, /obj/screen/inventory/hand))
		if(!ishuman(over_object))
			return
		if(!folded)
			toggle_fold(usr)
		if(folded)
			pickup(usr)

/obj/item/bedsheet/update_icon()
	if (folded)
		icon_state = "sheet-folded"
	else if (rolled)
		icon_state = "sheet-rolled"
	else
		icon_state = initial(icon_state)

/obj/item/bedsheet/blue
	icon_state = "sheetblue"

/obj/item/bedsheet/green
	icon_state = "sheetgreen"

/obj/item/bedsheet/orange
	icon_state = "sheetorange"

/obj/item/bedsheet/purple
	icon_state = "sheetpurple"

/obj/item/bedsheet/rainbow
	icon_state = "sheetrainbow"

/obj/item/bedsheet/red
	icon_state = "sheetred"

/obj/item/bedsheet/yellow
	icon_state = "sheetyellow"

/obj/item/bedsheet/mime
	icon_state = "sheetmime"

/obj/item/bedsheet/clown
	icon_state = "sheetclown"

/obj/item/bedsheet/captain
	icon_state = "sheetcaptain"

/obj/item/bedsheet/rd
	icon_state = "sheetrd"

/obj/item/bedsheet/medical
	icon_state = "sheetmedical"

/obj/item/bedsheet/hos
	icon_state = "sheethos"

/obj/item/bedsheet/hop
	icon_state = "sheethop"

/obj/item/bedsheet/ce
	icon_state = "sheetce"

/obj/item/bedsheet/brown
	icon_state = "sheetbrown"

/obj/item/bedsheet/ian
	icon_state = "sheetian"

/obj/item/bedsheet/double
	icon_state = "doublesheet"
	item_state = "sheet"

/obj/item/bedsheet/bluedouble
	icon_state = "doublesheetblue"
	item_state = "sheetblue"

/obj/item/bedsheet/greendouble
	icon_state = "doublesheetgreen"
	item_state = "sheetgreen"

/obj/item/bedsheet/orangedouble
	icon_state = "doublesheetorange"
	item_state = "sheetorange"

/obj/item/bedsheet/purpledouble
	icon_state = "doublesheetpurple"
	item_state = "sheetpurple"

/obj/item/bedsheet/rainbowdouble //all the way across the sky.
	icon_state = "doublesheetrainbow"
	item_state = "sheetrainbow"

/obj/item/bedsheet/reddouble
	icon_state = "doublesheetred"
	item_state = "sheetred"

/obj/item/bedsheet/yellowdouble
	icon_state = "doublesheetyellow"
	item_state = "sheetyellow"

/obj/item/bedsheet/mimedouble
	icon_state = "doublesheetmime"
	item_state = "sheetmime"

/obj/item/bedsheet/clowndouble
	icon_state = "doublesheetclown"
	item_state = "sheetrainbow"

/obj/item/bedsheet/captaindouble
	icon_state = "doublesheetcaptain"
	item_state = "sheetcaptain"

/obj/item/bedsheet/rddouble
	icon_state = "doublesheetrd"
	item_state = "sheetrd"

/obj/item/bedsheet/hosdouble
	icon_state = "doublesheethos"
	item_state = "sheethos"

/obj/item/bedsheet/hopdouble
	icon_state = "doublesheethop"
	item_state = "sheethop"

/obj/item/bedsheet/cedouble
	icon_state = "doublesheetce"
	item_state = "sheetce"

/obj/item/bedsheet/browndouble
	icon_state = "doublesheetbrown"
	item_state = "sheetbrown"

/obj/item/bedsheet/iandouble
	icon_state = "doublesheetian"
	item_state = "sheetian"


/obj/structure/bedsheetbin
	name = "linen bin"
	desc = "A linen bin. It looks rather cozy."
	icon = 'icons/obj/structures.dmi'
	icon_state = "linenbin-full"
	anchored = 1
	var/amount = 20
	var/list/sheets = list()
	var/obj/item/hidden
	var/double = FALSE


/obj/structure/bedsheetbin/examine(mob/user)
	..(user)

	if(amount < 1)
		if (double)
			to_chat(user, "There are no double bed sheets in the bin.")
		else
			to_chat(user, "There are no bed sheets in the bin.")
		return
	if(amount == 1)
		if (double)
			to_chat(user, "There is one double bed sheet in the bin.")
		else
			to_chat(user, "There is one bed sheet in the bin.")
		return
	if (double)
		to_chat(user, "There are [amount] double bed sheets in the bin.")
	else
		to_chat(user, "There are [amount] bed sheets in the bin.")


/obj/structure/bedsheetbin/update_icon()
	if(amount < 1)
		icon_state = "linenbin-empty"
	else if(amount < 5)
		icon_state = "linenbin-half"
	else
		icon_state = "linenbin-full"


/obj/structure/bedsheetbin/attackby(obj/item/I, mob/user)
	if(istype(I, /obj/item/bedsheet))
		user.drop_item()
		I.loc = src
		sheets.Add(I)
		amount++
		to_chat(user, SPAN_NOTICE("You put [I] in [src]."))
	//make sure there's sheets to hide it among, make sure nothing else is hidden in there.
	else if(amount && !hidden && I.w_class < ITEM_SIZE_BULKY)
		user.drop_item()
		I.loc = src
		hidden = I
		to_chat(user, SPAN_NOTICE("You hide [I] among the sheets."))

/obj/structure/bedsheetbin/attack_hand(mob/user)
	if(amount >= 1)
		amount--

		var/obj/item/bedsheet/B
		if(sheets.len > 0)
			B = sheets[sheets.len]
			sheets.Remove(B)

		else if (double)
			B = new /obj/item/bedsheet/double(loc, TRUE)
		else
			B = new /obj/item/bedsheet(loc, TRUE)

		B.loc = user.loc
		user.put_in_hands(B)
		to_chat(user, SPAN_NOTICE("You take [B] out of [src]."))

		if(hidden)
			hidden.loc = user.loc
			to_chat(user, SPAN_NOTICE("[hidden] falls out of [B]!"))
			hidden = null


	add_fingerprint(user)
	update_icon()

/obj/structure/bedsheetbin/attack_tk(mob/user)
	if(amount >= 1)
		amount--

		var/obj/item/bedsheet/B
		if(sheets.len > 0)
			B = sheets[sheets.len]
			sheets.Remove(B)

		else if (double)
			B = new /obj/item/bedsheet/double(loc, TRUE)
		else
			B = new /obj/item/bedsheet(loc, TRUE)

		B.loc = loc
		to_chat(user, SPAN_NOTICE("You telekinetically remove [B] from [src]."))
		update_icon()

		if(hidden)
			hidden.loc = loc
			hidden = null


	add_fingerprint(user)
