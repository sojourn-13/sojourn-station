
/**********************Ore box**************************/

/obj/structure/ore_box
	icon = 'icons/obj/mining.dmi'
	icon_state = "orebox0"
	name = "ore box"
	desc = "A heavy box used for storing ore."
	density = TRUE
	spawn_tags = SPAWN_TAG_STRUCTURE_COMMON
	var/last_update = 0
	var/list/stored_ore = list()

/obj/structure/ore_box/attackby(obj/item/W, mob/user)
	if (istype(W, /obj/item/stack/ore/))
		user.remove_from_mob(W)
		src.contents += W
	if (istype(W, /obj/item/storage))
		var/obj/item/storage/S = W
		S.hide_from(usr)
		if (locate(/obj/item/stack/ore/) in S.contents)
			for(var/obj/item/stack/ore/O in S.contents)
				S.remove_from_storage(O, src) //This will move the item to this item's contents
			playsound(loc, S.use_sound, 50, 1, -5)
			user.visible_message(SPAN_NOTICE("[user.name] empties the [S] into the box"), SPAN_NOTICE("You empty the [S] into the box."), SPAN_NOTICE("You hear a rustling sound"))
		else
			to_chat(user, SPAN_WARNING("There's no ore inside the [S] to empty into here"))
	update_ore_count()

	return

/obj/structure/ore_box/proc/update_ore_count()
	stored_ore = list()

	for(var/obj/item/stack/ore/O in contents)
		if(stored_ore[O.name])
			stored_ore[O.name]++
		else
			stored_ore[O.name] = 1

/obj/structure/ore_box/examine(mob/user)
	to_chat(user, "That's an [src].")
	to_chat(user, desc)

	// Borgs can now check contents too.
	if((!ishuman(user)) && (!isrobot(user)))
		return

	if(!Adjacent(user)) //Can only check the contents of ore boxes if you can physically reach them.
		return

	add_fingerprint(user)

	if(!contents.len)
		to_chat(user, "It is empty.")
		return

	if(world.time > last_update + 10)
		update_ore_count()
		last_update = world.time

	to_chat(user, SPAN_NOTICE("The box contains:"))
	var/list/nice_display_list = list()
	for(var/type in contents)
		var/obj/item/stack/ore/O = type
		nice_display_list[initial(O.name)] += O.amount
	for(var/element in nice_display_list)
		var/numtoshow = nice_display_list[element]
		to_chat(user, SPAN_NOTICE("[numtoshow] of [element]"))

/obj/structure/ore_box/attack_hand(mob/user, list/modifiers)
	. = ..()
	if(.)
		return
	if(Adjacent(user))
		ui_interact(user)

/obj/structure/ore_box/attack_robot(mob/user)
	if(Adjacent(user))
		ui_interact(user)

/obj/structure/ore_box/proc/dump_all_contents()
	var/drop = drop_location()
	for(var/obj/item/stack/ore/O in src)
		if(QDELETED(O))
			continue
		if(QDELETED(src))
			break
		O.forceMove(drop)

	update_ore_count()

/obj/structure/ore_box/proc/dump_all_of_type(ore_type)
	var/drop = drop_location()
	for(var/obj/item/stack/ore/O in src)
		if(QDELETED(O))
			continue
		if(QDELETED(src))
			break
		if("[O.type]" != ore_type)
			continue
		O.forceMove(drop)

	update_ore_count()

/obj/structure/ore_box/proc/dump_ore(ore_type, ore_number)
	var/drop = drop_location()

	var/to_drop = ore_number
	for(var/obj/item/stack/ore/O in src)
		if(to_drop <= 0)
			break
		if(QDELETED(O))
			continue
		if(QDELETED(src))
			break
		if("[O.type]" != ore_type)
			continue

		if(O.amount > to_drop)
			// Split remainder directly into our inventory
			// We keep the split so the user always gets their original (fucked up) stack back first
			O.split(O.amount - to_drop)
			if(!QDELETED(O))
				to_drop = 0
				O.forceMove(drop)
		else
			to_drop -= O.amount
			O.forceMove(drop)

	update_ore_count()
	return ore_number - to_drop

/obj/structure/ore_box/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "OreBox", name)
		ui.open()

/obj/structure/ore_box/ui_data()                        //you're telling me a blue haired cat wrote this code?
    var/contents = list()
    for(var/obj/item/stack/ore/O in src)
        contents[O.type] += O.amount

    var/data = list()
    data["materials"] = list()
    for(var/type in contents)
        var/obj/item/stack/ore/O = type
        var/name = initial(O.name)
        data["materials"] += list(list("name" = name, "amount" = contents[type], "type" = type))

    return data

/obj/structure/ore_box/ui_act(action, params)
	. = ..()
	if(.)
		return
	if(!Adjacent(usr))
		return
	add_fingerprint(usr)
	switch(action)
		if("ejectallores")
			dump_all_contents()
			to_chat(usr, span_notice("You release all the content of the box."))
			return TRUE

		if("ejectall")
			var/ore_type = params["type"]
			dump_all_of_type(ore_type)

			var/obj/item/stack/ore/O = text2path(ore_type)
			var/name = initial(O.name)
			to_chat(usr, span_notice("You release all \the [name]."))

			return TRUE

		if("eject")
			var/ore_type = params["type"]
			var/ore_amount = params["qty"]
			var/amount_dropped = dump_ore(ore_type, ore_amount)

			var/obj/item/stack/ore/O = text2path(ore_type)
			var/name = initial(O.name)
			to_chat(usr, span_notice("You release [amount_dropped] [name]."))

			return TRUE
