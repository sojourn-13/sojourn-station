//Sprite by Aeger Medela#2891
/obj/item/scale
	name = "Scale"
	desc = "A 10 point scale, used when tallying points. AltClick to remove a tally, CtrlShiftClick to add a tally."
	icon_state = "scale"
	icon = 'modular_sojourn/cardgame_2/cardgame_sprites.dmi'
	var/tally = 0 //Number
	w_class = ITEM_SIZE_SMALL

/obj/item/scale/New()
	..()
	update_icon()

/obj/item/scale/examine(mob/user)
	..()
	to_chat(user, "<span class='info'>The scale reads a tally of : [tally]</span>")

/obj/item/scale/update_icon()
	if(tally >= 5 || -5 >= tally)
		return
	icon_state = "scale_[tally]"

/obj/item/scale/AltClick(mob/user)
	if(-5 >= tally)
		to_chat(user, SPAN_NOTICE("You cant tip the scale any more this way."))
		return
	tally -= 1
	user.visible_message(SPAN_NOTICE("[user] removes a tally from [src] making it [tally]."), SPAN_NOTICE("You remove a tally from \the [src]."))
	update_icon()
	return

/obj/item/scale/CtrlShiftClick(mob/user)
	if(tally >= 5)
		to_chat(user, SPAN_NOTICE("You cant tip the scale any more this way."))
		return
	tally += 1
	user.visible_message(SPAN_NOTICE("[user] adds a tally into \the [src]."), SPAN_NOTICE("You put a tally into \the [src]."))
	update_icon()
	return

//Sprite by Gidgit#0143
/obj/item/bone_counter
	name = "Bone Pile"
	desc = "A bone pile, used when tallying marks. AltClick to remove a tally, CtrlShiftClick to add a tally.\
	Used for tracking life points in special games or more commonly keeping track of bone counters. Primarily used for CardCarpCo games."
	icon_state = "skull"
	icon = 'modular_sojourn/cardgame_2/cardgame_sprites.dmi'
	var/tally = 0 //Number
	w_class = ITEM_SIZE_SMALL

/obj/item/bone_counter/New()
	..()
	update_icon()

/obj/item/bone_counter/examine(mob/user)
	..()
	to_chat(user, "<span class='info'>The screen reads a tally of : [tally]</span>")

/obj/item/bone_counter/update_icon()
	if(tally >= 10)
		icon_state = "skull_+"
		return
	if(-10 >= tally)
		icon_state = "skull_-"
		return
	icon_state = "skull_[tally]"

/obj/item/bone_counter/AltClick(mob/user)
	tally -= 1
	user.visible_message(SPAN_NOTICE("[user] removes a tally from [src] making it [tally]."), SPAN_NOTICE("You remove a tally from \the [src]."))
	update_icon()
	return

/obj/item/bone_counter/CtrlShiftClick(mob/user)
	tally += 1
	user.visible_message(SPAN_NOTICE("[user] adds a tally into \the [src]."), SPAN_NOTICE("You put a tally into \the [src]."))
	update_icon()
	return

