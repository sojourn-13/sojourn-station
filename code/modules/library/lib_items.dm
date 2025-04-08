/* Library Items
 *
 * Contains:
 *		Bookcase
 *		Book
 *		Barcode Scanner
 */


/*
 * Bookcase
 */

/obj/structure/bookcase
	name = "bookcase"
	desc = "A wooden shelving unit used for storing all sorts of literature."
	icon = 'icons/obj/library.dmi'
	icon_state = "book-0"
	matter = list(MATERIAL_WOOD = 10)
	anchored = TRUE
	density = TRUE
	opacity = TRUE
	var/list/allowed_book_items = list(
	/obj/item/book,
	/obj/item/oddity/common/blueprint,
	/obj/item/oddity/common/book_eyes,
	/obj/item/oddity/common/book_omega,
	/obj/item/oddity/common/book_bible,
	/obj/item/oddity/common/book_log,
	/obj/item/oddity/common/book_unholy,
	/obj/item/oddity/common/instructional_bio,
	/obj/item/oddity/common/instructional_cog_python,
	/obj/item/oddity/chem_book,
	/obj/item/oddity/code_book,
	/obj/item/oddity/ls/manual,
	/obj/item/folder,
	/obj/item/paper,
	/obj/item/paper_bundle,
	/obj/item/photo,
	/obj/item/paper/alchemy_recipes,
	/obj/item/scroll
	)
	var/hex_code_for_ui_backround = "#C4A484"

/obj/structure/bookcase/Initialize()
	. = ..()
	for(var/obj/item/I in loc)
		if(LAZYLEN(allowed_book_items))
			if(!is_type_in_list(I,allowed_book_items))
				return
			I.loc = src

	update_icon()

/obj/structure/bookcase/attack_hand(mob/living/carbon/user, list/modifiers)
	. = ..()
	ui_interact(user)

/obj/structure/bookcase/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "BookCase")
		ui.open()

/obj/structure/bookcase/ui_data(mob/user)
	var/list/data = list()

	data["bookcase_name"] = "[name]"
	data["contents"] = list()
	data["contents_ref"] = list()
	data["hex_code_for_backround"] = hex_code_for_ui_backround
	for(var/obj/item/content in src)
		data["contents"] += "[content]"
		data["contents_ref"] += "[REF(content)]"

	return data

/obj/structure/bookcase/ui_act(action, params)
	. = ..()
	if(.)
		return

	switch(action)
		// Take the object out
		if("remove_object")
			var/obj/item/content = locate(params["ref"]) in src
			if(istype(content) && in_range(src, usr))
				usr.put_in_hands(content)
				updateUsrDialog()
				update_icon()

/obj/structure/bookcase/Topic(href, href_list)
	if(href_list["retrieve"])
		usr << browse("", "window=bookcase") // Close the menu

		var/obj/item/P = locate(href_list["retrieve"]) in src //contents[retrieveindex]
		if(istype(P) && in_range(src, usr))
			usr.put_in_hands(P)
			updateUsrDialog()
			update_icon()



/obj/structure/bookcase/attackby(obj/item/O, mob/user)
	if(LAZYLEN(allowed_book_items))
		if(is_type_in_list(O,allowed_book_items))
			user.drop_item()
			O.loc = src
			update_icon()
	if(istype(O, /obj/item/pen))
		var/newname = sanitizeSafe(input("What would you like to title?"), MAX_NAME_LEN)
		if(!newname)
			return
		else
			name = ("bookcase ([newname])")

	var/tool_type = O.get_tool_type(user, list(QUALITY_SCREW_DRIVING, QUALITY_BOLT_TURNING), src)
	switch(tool_type)
		if(QUALITY_SCREW_DRIVING)
			to_chat(user, SPAN_NOTICE("You begin dismantling \the [src]."))
			if(O.use_tool(user, src, WORKTIME_NORMAL, QUALITY_SCREW_DRIVING, FAILCHANCE_VERY_EASY, required_stat = STAT_MEC))
				to_chat(user, SPAN_NOTICE("You dismantle \the [src]."))
				drop_materials(drop_location())
				for(var/obj/item/book/b in contents)
					b.loc = (get_turf(src))
				qdel(src)
		if(QUALITY_BOLT_TURNING)
			to_chat(user, SPAN_NOTICE("You begin unwrenching \the [src]."))
			if(O.use_tool(user, src, WORKTIME_NORMAL, QUALITY_BOLT_TURNING, FAILCHANCE_VERY_EASY, required_stat = STAT_MEC))
				playsound(src.loc, 'sound/items/Ratchet.ogg', 100, 1)
				to_chat(user, (anchored ? SPAN_NOTICE("You unfasten \the [src] from the floor.") : SPAN_NOTICE("You secure \the [src] to the floor.")))
				anchored = !anchored
	add_fingerprint(user)

	..()

/obj/structure/bookcase/attack_tk(mob/user)
	if(anchored)
		return attack_self_tk(user)
	return ..()

/obj/structure/bookcase/attack_self_tk(mob/user)
	if(contents.len)
		if(prob(40 + contents.len * 5))
			var/obj/item/I = pick(contents)
			I.loc = loc
			I.reset_plane_and_layer()
			if(prob(25))
				step_rand(I)
			to_chat(user, SPAN_NOTICE("You pull \a [I] out of [src] at random."))
			update_icon()
			return
	to_chat(user, SPAN_NOTICE("You find nothing in [src]."))

/obj/structure/bookcase/ex_act(severity)
	switch(severity)
		if(1)
			for(var/obj/item/b in contents)
				qdel(b)
			qdel(src)
			return
		if(2)
			for(var/obj/item/b in contents)
				if (prob(50)) b.loc = (get_turf(src))
				else qdel(b)
			qdel(src)
			return
		if(3)
			if (prob(50))
				for(var/obj/item/b in contents)
					b.loc = (get_turf(src))
				qdel(src)
			return
		else
	return

/obj/structure/bookcase/update_icon()
	if(contents.len < 5)
		icon_state = "book-[contents.len]"
	else
		icon_state = "book-5"

/*Metal Bookcase - same functionality, just a reskin.*/

/obj/structure/bookcase/metal
	desc = "A metal shelving unit used for storing all sorts of literature."
	icon_state = "metalshelf-0"
	hex_code_for_ui_backround = "#897E75"

/obj/structure/bookcase/metal/update_icon()
	if(contents.len < 5)
		icon_state = "metalshelf-[contents.len]"
	else
		icon_state = "metalshelf-5"

/obj/structure/bookcase/manuals/medical
	name = "Medical Manuals bookcase"

	New()
		..()
		new /obj/item/book/manual/medical_cloning(src)
		new /obj/item/book/manual/wiki/medical_guide(src)
		new /obj/item/book/manual/wiki/medical_guide(src)
		new /obj/item/book/manual/wiki/medical_guide(src)
		update_icon()


/obj/structure/bookcase/manuals/engineering
	name = "Engineering Manuals bookcase"

	New()
		..()
		new /obj/item/book/manual/wiki/engineering_construction(src)
		new /obj/item/book/manual/wiki/engineering_hacking(src)
		new /obj/item/book/manual/wiki/engineering_atmos(src)
		new /obj/item/book/manual/evaguide(src)
		new /obj/item/book/manualshield_generator_guide(src)
		update_icon()

/obj/structure/bookcase/manuals/research_and_development
	name = "R&D Manuals bookcase"

	New()
		..()
		new /obj/item/book/manual/research_and_development(src)
		update_icon()


/obj/structure/bookcase/guncase
	name = "gunparts locker"
	desc = "A metal locker unit that can store, gun parts, ammo and tools related to gunsmithing. As well as gun storage such as pouches or cases."
	icon_state = "gunpart_locker"
	hex_code_for_ui_backround = "#897E75"
	allowed_book_items = list(
	/obj/item/part/gun,
	/obj/item/tool_upgrade,
	/obj/item/gun_upgrade,
	/obj/item/tool/screwdriver,
	/obj/item/tool/wirecutters,
	/obj/item/tool/crowbar,
	/obj/item/tool/hammer,
	/obj/item/tool/saw,
	/obj/item/ammo_magazine,
	/obj/item/ammo_casing,
	/obj/item/reagent_containers/spray/vvd40,
	/obj/item/reagent_containers/glass/beaker,
	/obj/item/storage/backpack/guncase,
	/obj/item/clothing/accessory/holster,
	/obj/item/storage/pouch/baton_holster,
	/obj/item/storage/pouch/ammo,
	/obj/item/ammo_kit
	)


/obj/structure/bookcase/guncase/update_icon()
	return


/*
 * Book
 */
/obj/item/book
	name = "book"
	icon = 'icons/obj/library.dmi'
	icon_state ="book"
	throw_speed = 1
	throw_range = 5
	w_class = ITEM_SIZE_NORMAL		 //upped to three because books are, y'know, pretty big. (and you could hide them inside eachother recursively forever)
	attack_verb = list("bashed", "whacked", "educated")
	var/dat			 // Actual page content
	var/due_date = 0 // Game time in 1/10th seconds
	var/author		 // Who wrote the thing, can be changed by pen or PC. It is not automatically assigned
	var/unique = FALSE // FALSE - Normal book, TRUE - Should not be treated as normal book, unable to be copied, unable to be modified
	var/title		 // The real name of the book.
	var/carved = 0	 // Has the book been hollowed out for use as a secret storage item?
	var/obj/item/store	//What's in the book?
	var/window_size = null // Specific window size for the book, i.e: "1920x1080", Size x Width

/obj/item/book/attack_self(mob/user)
	playsound(src.loc, pick('sound/items/BOOK_Turn_Page_1.ogg',\
		'sound/items/BOOK_Turn_Page_2.ogg',\
		'sound/items/BOOK_Turn_Page_3.ogg',\
		'sound/items/BOOK_Turn_Page_4.ogg',\
		), rand(40,80), 1)
	if(carved)
		if(store)
			to_chat(user, SPAN_NOTICE("[store] falls out of [title]!"))
			store.loc = get_turf(src.loc)
			store = null
			return
		else
			to_chat(user, SPAN_NOTICE("The pages of [title] have been cut out!"))
			return
	if(src.dat)
		user << browse("<TT><I>Penned by [author].</I></TT> <BR>" + "[dat]", "window=book[window_size != null ? ";size=[window_size]" : ""]")
		user.visible_message("[user] opens a book titled \"[src.title]\" and begins reading intently.")
		onclose(user, "book")
	else
		to_chat(user, "This book is completely blank!")

/obj/item/book/attackby(obj/item/I, mob/user)
	if(carved)
		if(!store)
			if(I.w_class < ITEM_SIZE_NORMAL)
				user.drop_item()
				I.loc = src
				store = I
				to_chat(user, SPAN_NOTICE("You put [I] in [title]."))
				return
			else
				to_chat(user, SPAN_NOTICE("[I] won't fit in [title]."))
				return
		else
			to_chat(user, SPAN_NOTICE("There's already something in [title]!"))
			return
	if(istype(I, /obj/item/pen))
		if(unique)
			to_chat(user, "These pages don't seem to take the ink well. Looks like you can't modify it.")
			return
		var/choice = input("What would you like to change?") in list("Title", "Contents", "Author", "Cancel")
		switch(choice)
			if("Title")
				var/newtitle = reject_bad_text(sanitizeSafe(input("Write a new title:")))
				if(!newtitle)
					to_chat(usr, "The title is invalid.")
					return
				else
					src.name = newtitle
					src.title = newtitle
			if("Contents")
				var/content = sanitize(input("Write your book's contents (HTML NOT allowed):") as message|null, MAX_BOOK_MESSAGE_LEN)
				if(!content)
					to_chat(usr, "The content is invalid.")
					return
				else
					src.dat += content
			if("Author")
				var/newauthor = sanitize(input(usr, "Write the author's name:"))
				if(!newauthor)
					to_chat(usr, "The name is invalid.")
					return
				else
					src.author = newauthor
			else
				return
	else if(istype(I, /obj/item/barcodescanner))
		var/obj/item/barcodescanner/scanner = I
		if(!scanner.computer)
			to_chat(user, "[I]'s screen flashes: 'No associated computer found!'")
		else
			switch(scanner.mode)
				if(0)
					scanner.book = src
					to_chat(user, "[I]'s screen flashes: 'Book stored in buffer.'")
				if(1)
					scanner.book = src
					scanner.computer.buffer_book = src.name
					to_chat(user, "[I]'s screen flashes: 'Book stored in buffer. Book title stored in associated computer buffer.'")
				if(2)
					scanner.book = src
					for(var/datum/borrowbook/b in scanner.computer.checkouts)
						if(b.bookname == src.name)
							scanner.computer.checkouts.Remove(b)
							to_chat(user, "[I]'s screen flashes: 'Book stored in buffer. Book has been checked in.'")
							return
					to_chat(user, "[I]'s screen flashes: 'Book stored in buffer. No active check-out record found for current title.'")
				if(3)
					scanner.book = src
					for(var/obj/item/book in scanner.computer.inventory)
						if(book == src)
							to_chat(user, "[I]'s screen flashes: 'Book stored in buffer. Title already present in inventory, aborting to avoid duplicate entry.'")
							return
					scanner.computer.inventory.Add(src)
					to_chat(user, "[I]'s screen flashes: 'Book stored in buffer. Title added to general inventory.'")
	else if(QUALITY_CUTTING in I.tool_qualities)
		if(carved)	return
		to_chat(user, SPAN_NOTICE("You begin to carve out [title]."))
		if(do_after(user, 30, src))
			to_chat(user, SPAN_NOTICE("You carve out the pages from [title]! You didn't want to read it anyway."))
			carved = 1
			return
	else
		..()

/obj/item/book/attack(mob/living/carbon/M as mob, mob/living/carbon/user as mob)
	if(user.targeted_organ == BP_EYES)
		user.visible_message(SPAN_NOTICE("You open up the book and show it to [M]. "), \
			SPAN_NOTICE(" [user] opens up a book and shows it to [M]. "))
		M << browse("<TT><I>Penned by [author].</I></TT> <BR>" + "[dat]", "window=book")
		user.setClickCooldown(DEFAULT_QUICK_COOLDOWN) //to prevent spam


/*
 * Barcode Scanner
 */
/obj/item/barcodescanner
	name = "barcode scanner"
	icon = 'icons/obj/library.dmi'
	icon_state ="scanner"
	throw_speed = 1
	throw_range = 5
	w_class = ITEM_SIZE_SMALL
	var/obj/machinery/librarycomp/computer // Associated computer - Modes 1 to 3 use this
	var/obj/item/book/book	 //  Currently scanned book
	var/mode = 0 					// 0 - Scan only, 1 - Scan and Set Buffer, 2 - Scan and Attempt to Check In, 3 - Scan and Attempt to Add to Inventory

	attack_self(mob/user)
		mode += 1
		if(mode > 3)
			mode = 0
		to_chat(user, "[src] Status Display:")
		var/modedesc
		switch(mode)
			if(0)
				modedesc = "Scan book to local buffer."
			if(1)
				modedesc = "Scan book to local buffer and set associated computer buffer to match."
			if(2)
				modedesc = "Scan book to local buffer, attempt to check in scanned book."
			if(3)
				modedesc = "Scan book to local buffer, attempt to add book to general inventory."
			else
				modedesc = "ERROR"
		to_chat(user, " - Mode [mode] : [modedesc]")
		if(src.computer)
			to_chat(user, "<font color=green>Computer has been associated with this unit.</font>")
		else
			to_chat(user, "<font color=red>No associated computer found. Only local scans will function properly.</font>")
		to_chat(user, "\n")
