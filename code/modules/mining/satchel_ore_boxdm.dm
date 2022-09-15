
/**********************Ore box**************************/

/obj/structure/ore_box
	icon = 'icons/obj/mining.dmi'
	icon_state = "orebox0"
	name = "ore box"
	desc = "A heavy box used for storing ore."
	density = 1

/obj/structure/ore_box/attackby(obj/item/W as obj, mob/user as mob)
	if (istype(W, /obj/item/stack/ore))
		user.remove_from_mob(W)
		W.forceMove(src)
	if (istype(W, /obj/item/storage))
		var/obj/item/storage/S = W
		S.hide_from(usr)
		if (locate(/obj/item/stack/ore) in S.contents)
			for(var/obj/item/stack/ore/O in S.contents)
				S.remove_from_storage(O, src) //This will move the item to this item's contents
			playsound(loc, S.use_sound, 50, 1, -5)
			user.visible_message(SPAN_NOTICE("[user.name] empties the [S] into the box"), SPAN_NOTICE("You empty the [S] into the box."), SPAN_NOTICE("You hear a rustling sound"))
		else
			to_chat(user, SPAN_WARNING("There's no ore inside the [S] to empty into here"))

	return

/obj/structure/ore_box/examine(mob/user)
	..()
	to_chat(user, SPAN_NOTICE("The box contains:"))
	var/list/nice_display_list = list()
	for(var/type in contents)
		var/obj/item/stack/ore/O = type
		nice_display_list[initial(O.name)] += O.amount
	for(var/element in nice_display_list)
		var/numtoshow = nice_display_list[element]
		to_chat(user, SPAN_NOTICE("[numtoshow] of [element]"))

/obj/structure/ore_box/verb/empty_box()
	set name = "Empty Ore Box"
	set category = "Object"
	set src in view(1)

	if(!ishuman(usr) && !isrobot(usr)) //Only living, intelligent creatures with hands can empty material boxes.
		to_chat(usr, "\red You are physically incapable of emptying the ore box.")
		return

	if( usr.stat || usr.restrained() )
		return

	if(!Adjacent(usr)) //You can only empty the box if you can physically reach it
		to_chat(usr, "You cannot reach the ore box.")
		return

	add_fingerprint(usr)

	if(contents.len < 1)
		to_chat(usr, "\red The ore box is empty")
		return


	dump_box_contents()

	return


/obj/structure/ore_box/proc/dump_box_contents(drop_loc = null)
	var/drop = drop_loc ? drop_loc : drop_location()
	for(var/obj/item/stack/ore/O in src)
		if(QDELETED(O))
			continue
		if(QDELETED(src))
			break
		O.forceMove(drop)
		if(TICK_CHECK)
			stoplag()
			drop = drop_loc ? drop_loc : drop_location()

/obj/structure/ore_box/ex_act(severity)
	if(severity == 1.0 || (severity < 3.0 && prob(50)))
		for (var/obj/item/stack/ore/O in contents)
			O.loc = src.loc
			O.ex_act(severity++)
		qdel(src)
		return
