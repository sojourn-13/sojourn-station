/obj/item/folder
	name = "folder"
	desc = "A folder."
	icon = 'icons/obj/bureaucracy.dmi'
	icon_state = "folder"
	w_class = ITEM_SIZE_TINY
	/// The background color for tgui in hex (with a `#`)
	var/bg_color = "#7f7f7f"
	var/list/allowed_paper_items = list(
	/obj/item/oddity/ls/manual,
	/obj/item/folder,
	/obj/item/paper,
	/obj/item/paper_bundle,
	/obj/item/photo,
	/obj/item/paper/alchemy_recipes
	)

/obj/item/folder/black
	desc = "A black folder."
	icon_state = "folder_black"
	bg_color = "#313639"

/obj/item/folder/blue
	desc = "A blue folder."
	icon_state = "folder_blue"
	bg_color = "#355e9f"

/obj/item/folder/cyan
	desc = "A cyan folder."
	icon_state = "folder_cyan"
	bg_color = "##00ffff"

/obj/item/folder/red
	desc = "A red folder."
	icon_state = "folder_red"
	bg_color = "#b5002e"

/obj/item/folder/yellow
	desc = "A yellow folder."
	icon_state = "folder_yellow"
	bg_color = "#b88f3d"

/obj/item/folder/syndicate
	icon_state = "folder_red"
	bg_color = "#3f3f3f"
	name = "folder- 'TOP SECRET'"
	desc = "A folder stamped \"Top Secret - Property of The Syndicate.\""

/obj/item/folder/Initialize()
	update_icon()
	. = ..()

/obj/item/folder/examine()
	. = ..()
	if(contents && contents.len > 0) //Needs to be more than 0 or an attempt to access the index 1 (which will be empty as there is nothing there) will cause it to go out of bounds - Ryuu
		. += "<span class='notice'>Alt-click to remove [contents[1]].</span>"

/obj/item/folder/proc/rename(mob/user)
	var/inputvalue = stripped_input(user, "What would you like to label the folder?", "Folder Labelling", "", MAX_NAME_LEN)

	if(!inputvalue)
		return

	if(user.CanUseTopic(user))
		name = "folder[(inputvalue ? " - '[inputvalue]'" : null)]"

/obj/item/folder/proc/remove_item(obj/item/Item, mob/user)
	if(istype(Item))
		Item.forceMove(user.loc)
		user.put_in_hands(Item)
		to_chat(user, "<span class='notice'>You remove [Item] from [src].</span>")
		update_icon()

/obj/item/folder/AltClick(mob/user)
	..()
	if(contents && contents.len > 0)
		remove_item(contents[1], user)

/obj/item/folder/update_icon()
	. = ..()
	cut_overlays()
	if(contents.len)
		add_overlay("folder_paper")

/obj/item/folder/attackby(obj/item/weapon, mob/user, params)
	if(LAZYLEN(allowed_paper_items))
		if(is_type_in_list(weapon,allowed_paper_items))
			//Add paper, photo or documents into the folder
			user.drop_item()
			weapon.loc = src
			playsound(src,'sound/effects/Paper_Shake.ogg',40,1)
			to_chat(user, "<span class='notice'>You put [weapon] into [src].</span>")
			update_icon()
	if(istype(weapon, /obj/item/pen))
		rename(user)

/obj/item/folder/attack_self(mob/user)
	add_fingerprint(usr)
	ui_interact(user)
	return

/obj/item/folder/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "Folder")
		ui.open()

/obj/item/folder/ui_data(mob/user)
	var/list/data = list()
	if(istype(src, /obj/item/folder/syndicate))
		data["theme"] = "syndicate"
	data["bg_color"] = "[bg_color]"
	data["folder_name"] = "[name]"

	data["contents"] = list()
	data["contents_ref"] = list()
	for(var/Content in src)
		data["contents"] += "[Content]"
		data["contents_ref"] += "[REF(Content)]"

	return data

/obj/item/folder/ui_act(action, params)
	. = ..()
	if(.)
		return

	if(usr.stat != CONSCIOUS)
		return

	switch(action)
		// Take item out
		if("remove")
			var/obj/item/Item = locate(params["ref"]) in src
			remove_item(Item, usr)
			. = TRUE
		// Inspect the item
		if("examine")
			var/obj/item/Item = locate(params["ref"]) in src
			if(istype(Item))
				usr.examinate(Item)
				. = TRUE

/obj/item/folder/envelope
	name = "envelope"
	desc = "A thick envelope. You can't see what's inside."
	icon_state = "envelope_sealed"
	var/sealed = 1

/obj/item/folder/envelope/update_icon()
	if(sealed)
		icon_state = "envelope_sealed"
	else
		icon_state = "envelope[contents.len > 0]"

/obj/item/folder/envelope/examine(mob/user)
	. = ..()
	to_chat(user, "The seal is [sealed ? "intact" : "broken"].")

/obj/item/folder/envelope/proc/sealcheck(user)
	var/ripperoni = alert("Are you sure you want to break the seal on \the [src]?", "Confirmation","Yes", "No")
	if(ripperoni == "Yes")
		visible_message("[user] breaks the seal on \the [src], and opens it.")
		sealed = 0
		update_icon()
		return 1

/obj/item/folder/envelope/attack_self(mob/user as mob)
	if(sealed)
		sealcheck(user)
		return
	else
		..()

/obj/item/folder/envelope/attackby(obj/item/W as obj, mob/user as mob)
	if(sealed)
		sealcheck(user)
		return
	else
		..()
