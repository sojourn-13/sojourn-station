//todo: get rid of s_active
//todo: close hud when storage item is thrown

/obj/item/storage
	name = "storage"
	icon = 'icons/obj/storage.dmi'
	w_class = ITEM_SIZE_NORMAL
	item_flags = DRAG_AND_DROP_UNEQUIP|EQUIP_SOUNDS
	var/list/can_hold = new/list() //List of objects which this item can store (if set, it can't store anything else)
	var/list/can_hold_extra = list() //List of objects which this item can additionally store not defined by the parent.
	var/list/cant_hold = new/list() //List of objects which this item can't store (in effect only if can_hold isn't set)
	var/list/is_seeing = new/list() //List of mobs which are currently seeing the contents of this item's storage
	var/max_w_class = ITEM_SIZE_NORMAL //Max size of objects that this object can store (in effect only if can_hold isn't set)
	var/max_storage_space = null //Total storage cost of items this can hold. Will be autoset based on storage_slots if left null.
	var/storage_slots = null //The number of storage slots in this container.
	var/use_to_pickup = null //Set this to make it possible to use this item in an inverse way, so you can have the item in your hand and click items on the floor to pick them up.
	var/display_contents_with_number = null //Set this to make the storage item group contents of the same type and display them as a number.
	var/allow_quick_empty = null //Set this variable to allow the object to have the 'empty' verb, which dumps all the contents on the floor.
	var/allow_quick_gather = null //Set this variable to allow the object to have the 'toggle mode' verb, which quickly collects all items from a tile.
	var/collection_mode = TRUE //0 = pick one at a time, 1 = pick all on tile
	var/use_sound = "rustle" //sound played when used. null for no sound.
	contained_sprite = FALSE
	var/acts_as_holster = FALSE // other systems can query this to treat the belt as a holster
	var/holster_enabled = TRUE // whether holster functionality is currently enabled (user toggleable)
	var/holster_slots = 0 // how many holster-capable slots we provide
	var/insertion_sound
	var/extraction_sound

	// Holds references to holstered items (indexes 1..holster_slots)
	var/list/holstered = list()

	var/exspand_when_spawned = TRUE
	no_swing = TRUE

/obj/item/storage/debug
	name = "Destickinator"
	desc = "A case that can fit legitimately anything inside it, used by Bluespace Technicians and the like to remove items stuck from people's hands. \
	Seems it somehow was made stable as well, allowing you to de-stick even bluespace items without risk of losing your limbs."
	icon_state = "desticker"
	w_class = ITEM_SIZE_PLANET
	max_w_class = 999
	max_storage_space = 999

/obj/item/storage/New()
	can_hold |= can_hold_extra
	. = ..()

	// Ensure holstered list matches holster_slots
	if(acts_as_holster && holster_slots && holstered.len < holster_slots)
		for(var/i = holstered.len + 1, i <= holster_slots, i++)
			holstered += null

	return

// Return first empty holster index or 0 if none
/obj/item/storage/proc/get_first_empty_holster()
	if(!holster_slots || !holster_enabled)
		return 0
	for(var/i = 1, i <= holster_slots, i++)
		if(!holstered[i])
			return i
	return 0

// Return first occupied holster index or 0 if none
/obj/item/storage/proc/get_first_occupied_holster()
	if(!holster_slots)
		return 0
	for(var/i = 1, i <= holster_slots, i++)
		if(holstered[i])
			return i
	return 0

// Return last occupied holster index or 0 if none
/obj/item/storage/proc/get_last_occupied_holster()
	if(!holster_slots)
		return 0
	for(var/i = holster_slots, i >= 1, i--)
		if(holstered[i])
			return i
	return 0

// Holster an item from user's active hand into the storage
/obj/item/storage/proc/holster(obj/item/W as obj, mob/living/user)
	update_holster_verbs()
	return holster_into(src, W, user)

// Unholster the first occupied holster into the user's active hand
/obj/item/storage/proc/unholster(mob/living/user)
	update_holster_verbs()
	return unholster_from(src, user)

// Unholster the last occupied holster into the user's active hand
/obj/item/storage/proc/unholster_last(mob/living/user)
	update_holster_verbs()
	return unholster_last_from(src, user)


// Global helper: holster into any storage-like atom (centralized logic)
/proc/holster_into(var/obj/item/storage/S, obj/item/W as obj, mob/living/user)
	if(!istype(W))
		return 0

	// Only storages that explicitly act as holsters should accept holstering.
	if(!S.acts_as_holster || !S.holster_enabled)
		to_chat(user, SPAN_WARNING("[S] cannot be used as a holster."))
		return 0
	// Only accept items with SLOT_HOLSTER flag
	if(!(W.slot_flags & SLOT_HOLSTER))
		to_chat(user, SPAN_WARNING("[W] won't fit in [S]!"))
		return 0

	var/index = S.get_first_empty_holster()
	if(!index)
		to_chat(user, SPAN_NOTICE("[S] has no free holster slots."))
		return 0

	if(!S.can_be_inserted(W, 0, user))
		return 0

	// For holsters with no regular storage slots, don't use regular storage insertion
	if(S.storage_slots == 0 && S.acts_as_holster)
		// Handle holster-only storage differently - don't add to contents
		if(usr)
			usr.prepare_for_slotmove(W)
			usr.update_icons()

		W.loc = S
		W.on_enter_storage(S)

		if(usr)
			if(usr.client)
				usr.client.screen -= W
			W.dropped(usr)
			S.add_fingerprint(usr)

			if(S.insertion_sound)
				playsound(get_turf(S), S.insertion_sound, 100)
	else
		if(!S.handle_item_insertion(W, FALSE, user))
			return 0

	S.holstered[index] = W
	user.visible_message(SPAN_NOTICE("[user] holsters \the [W]."), SPAN_NOTICE("You holster \the [W]."))
	playsound(user, 'sound/effects/holsterin.ogg', 75, 0)
	S.update_icon()
	return 1


// Global helper: unholster from any storage-like atom
/proc/unholster_from(var/obj/item/storage/S, mob/living/user)
	var/index = S.get_first_occupied_holster()
	// Note: default unholster behaviour pulls from the first occupied holster
	if(!index)
		to_chat(user, SPAN_NOTICE("There is nothing holstered."))
		return 0
	var/obj/item/W = S.holstered[index]
	if(!W)
		S.holstered[index] = null
		return 0

	if(user.lying)
		to_chat(user, SPAN_WARNING("You need to be standing!"))
		return 0

	if(istype(user.get_active_hand(),/obj))
		to_chat(user, SPAN_WARNING("You need an empty hand to draw \the [W]!"))
		return 0

	S.remove_from_storage(W, user)
	user.put_in_active_hand(W)
	W.add_fingerprint(user)
	playsound(user, 'sound/effects/holsterout.ogg', 75, 0)
	S.holstered[index] = null
	S.update_icon()
	return 1

// Unholster using the last occupied holster slot (LIFO behaviour)
/proc/unholster_last_from(var/obj/item/storage/S, mob/living/user)
	var/index = S.get_last_occupied_holster()
	if(!index)
		to_chat(user, SPAN_NOTICE("There is nothing holstered."))
		return 0
	var/obj/item/W = S.holstered[index]
	if(!W)
		S.holstered[index] = null
		return 0

	if(user.lying)
		to_chat(user, SPAN_WARNING("You need to be standing!"))
		return 0

	if(istype(user.get_active_hand(),/obj))
		to_chat(user, SPAN_WARNING("You need an empty hand to draw \the [W]!"))
		return 0

	// Handle holster-only storage differently
	if(S.storage_slots == 0 && S.acts_as_holster)
		// For holster-only storage, just move the item location without using remove_from_storage
		W.loc = get_turf(S)
		W.on_exit_storage(S)
		W.layer = initial(W.layer)
		W.set_plane(initial(W.plane))
		if(W.maptext)
			W.maptext = ""
		if(S.extraction_sound)
			playsound(get_turf(S), S.extraction_sound, 100)
	else
		S.remove_from_storage(W, get_turf(S))

	user.put_in_active_hand(W)
	W.add_fingerprint(user)
	playsound(user, 'sound/effects/holsterout.ogg', 75, 0)
	S.holstered[index] = null
	S.update_icon()
	return 1

// Helper proc to update holster-related verbs and storage
/obj/item/storage/proc/update_holster_verbs()
	if(!acts_as_holster)
		return

	if(!holster_enabled)
		verbs -= /obj/item/storage/verb/holster_verb
	else
		verbs |= /obj/item/storage/verb/holster_verb

// Toggle holster functionality verb
/obj/item/storage/verb/toggle_holster()
	set name = "Toggle Holster"
	set category = "Object"
	set src in usr

	if(!isliving(usr))
		return
	if(usr.stat)
		return

	// Only storages that can act as holsters should provide this option
	if(!src.acts_as_holster)
		to_chat(usr, SPAN_WARNING("[src] does not have holster capability."))
		return

	var/old_enabled = src.holster_enabled
	src.holster_enabled = !src.holster_enabled

	// Adjust storage slots based on holster status
	// BUT don't modify holster-only storage (storage_slots == 0) as that breaks the holster-only detection
	if(src.storage_slots != null && src.storage_slots != 0)
		if(src.holster_enabled && !old_enabled)
			// Enabling holster - add holster slots to storage
			src.storage_slots += src.holster_slots
		else if(!src.holster_enabled && old_enabled)
			// Disabling holster - remove holster slots from storage
			src.storage_slots -= src.holster_slots
			// Make sure we don't go negative
			if(src.storage_slots < 0)
				src.storage_slots = 0

	// Update verb visibility
	src.update_holster_verbs()

	if(src.holster_enabled)
		to_chat(usr, SPAN_NOTICE("You enable the holster functionality on [src]. It now has [src.holster_slots] additional storage slot\s."))
	else
		to_chat(usr, SPAN_NOTICE("You disable the holster functionality on [src]. It now has [src.holster_slots] fewer storage slot\s."))
		// If disabling holster while items are holstered, warn the user
		if(src.get_first_occupied_holster())
			to_chat(usr, SPAN_WARNING("Items are still holstered in [src]. Use the normal storage interface to remove them."))

	// Refresh any open storage windows
	src.refresh_all()

// Holster verb for storages that act as holsters
/obj/item/storage/verb/holster_verb()
	set name = "Holster"
	set category = "Object"
	set src in usr

	if(!isliving(usr))
		return
	if(usr.stat)
		return

	// Only storages that act as holsters should provide the holster action.
	if(!src.acts_as_holster)
		to_chat(usr, SPAN_WARNING("You cannot holster items into [src]."))
		return

	// Use last-in-first-out behaviour: unholster the last holstered item when H is pressed
	var/last_idx = src.get_last_occupied_holster()

	if(last_idx)
		// If user has an empty hand, just unholster into it.
		if(!istype(usr.get_active_hand(), /obj))
			src.unholster_last(usr)
		else
			// If user's hand is occupied, try to holster the currently held item into this storage first (swap behaviour).
			var/obj/item/cur = usr.get_active_hand()
			// Only try swap if the current item has SLOT_HOLSTER flag AND holstering is enabled
			var/can_swap = FALSE
			if(src.holster_enabled && (cur.slot_flags & SLOT_HOLSTER))
				can_swap = TRUE

			if(can_swap && src.holster(cur, usr))
				// Successfully holstered current item; now unholster the last one into the now-empty hand.
				src.unholster_last(usr)
			else
				// Cannot swap; just tell user they need an empty hand to unholster
				var/obj/item/peekW = src.holstered[last_idx]
				if(peekW)
					to_chat(usr, SPAN_WARNING("You need an empty hand to draw \the [peekW], or put away your [cur] first."))
				else
					to_chat(usr, SPAN_NOTICE("There is nothing holstered."))
	else
		// No items holstered, try to holster the currently held item
		if(!src.holster_enabled)
			to_chat(usr, SPAN_WARNING("You cannot holster items into [src]."))
			return
		var/obj/item/H = usr.get_active_hand()
		if(!istype(H, /obj/item))
			to_chat(usr, SPAN_WARNING("You need an item in your hand to holster it."))
			return
		// Attempt holster
		src.holster(H, usr)

/HUD_element/threePartBox/storageBackground
	start_icon = icon("icons/HUD/storage_start.png")
	middle_icon = icon("icons/HUD/storage_middle.png")
	end_icon = icon("icons/HUD/storage_end.png")

/HUD_element/threePartBox/storedItemBackground
	start_icon = icon("icons/HUD/stored_start.png")
	middle_icon = icon("icons/HUD/stored_middle.png")
	end_icon = icon("icons/HUD/stored_end.png")

/HUD_element/slottedItemBackground
	icon = 'icons/HUD/block.png'

/proc/storageBackgroundClick(var/HUD_element/sourceElement, var/mob/clientMob, location, control, params)
	var/atom/A = sourceElement.getData("item")
	if(A)
		var/obj/item/I = clientMob.get_active_hand()
		if(I)
			clientMob.ClickOn(A)

/proc/itemBackgroundClick(var/HUD_element/sourceElement, var/mob/clientMob, location, control, params)
	var/atom/A = sourceElement.getData("item")
	if(A)
		clientMob.ClickOn(A)

/proc/closeButtonClick(var/HUD_element/sourceElement, var/mob/clientMob, location, control, params)
	var/obj/item/storage/S = sourceElement.getData("item")
	if(S)
		S.close(clientMob)

/obj/item/storage/proc/setupItemBackground(var/HUD_element/itemBackground, var/atom/item, var/itemCount)
	itemBackground.setClickProc(GLOBAL_PROC_REF(itemBackgroundClick))
	itemBackground.setData("item", item)

	var/HUD_element/itemIcon = itemBackground.add(new/HUD_element())
	itemIcon.setDimensions(32,32) //todo: should be width/height of real object icon
	itemIcon.setAlignment(HUD_CENTER_ALIGNMENT,HUD_CENTER_ALIGNMENT) //center

	//todo: remove vis_contents, use mimic icon, make wrappers for dragdrop/examine/clicks, do not alter item
	item.pixel_x = 0 //no pixel offsets inside storage
	item.pixel_y = 0
	item.pixel_w = 0
	item.pixel_z = 0
	item.layer = ABOVE_HUD_LAYER
	item.plane = ABOVE_HUD_PLANE

	itemIcon.vis_contents += item //this draws the actual item, see byond ref for vis_contents var
	itemBackground.setName(item.name, TRUE)

	if (itemCount)
		item.maptext = "<font color='white'>[itemCount]</font>"

/obj/item/storage/proc/generateHUD(var/datum/hud/data)
	RETURN_TYPE(/HUD_element)
	var/HUD_element/main = new("storage")
	main.setDeleteOnHide(TRUE)

	var/HUD_element/closeButton = new
	closeButton.setName("HUD Storage Close Button")
	closeButton.setIcon(icon("icons/mob/screen1.dmi","x"))
	closeButton.setHideParentOnClick(TRUE)
	closeButton.setClickProc(GLOBAL_PROC_REF(closeButtonClick))
	closeButton.setData("item", src)

	//storage space based items
	if((storage_slots == null) && !display_contents_with_number)
		var/baseline_max_storage_space = 16 //should be equal to default backpack capacity
		var/minBackgroundWidth = min( round( 224 * max_storage_space/baseline_max_storage_space ,1) ,260) //in pixels

		var/HUD_element/threePartBox/storageBackground/storageBackground = new()
		main.add(storageBackground)

		storageBackground.setName("HUD Storage Background")
		storageBackground.setHideParentOnHide(TRUE)

		storageBackground.setClickProc(GLOBAL_PROC_REF(storageBackgroundClick))
		storageBackground.setData("item", src)

		var/paddingSides = 2 //in pixels
		var/spacingBetweenSlots = 1 //in pixels

		var/totalWidth = 0 + paddingSides //in pixels
		var/totalStorageCost = 0

		for(var/obj/item/I in contents)
			var/itemStorageCost = I.get_storage_cost()
			totalStorageCost += itemStorageCost

			var/HUD_element/threePartBox/storedItemBackground/itemBackground = new()
			storageBackground.add(itemBackground)

			var/itemBackgroundWidth = round(minBackgroundWidth * itemStorageCost/max(max_storage_space, 1))
			itemBackground.setPosition(totalWidth,0)
			itemBackground.scaleToSize(itemBackgroundWidth)
			itemBackground.setAlignment(HUD_NO_ALIGNMENT,HUD_CENTER_ALIGNMENT) //vertical center

			setupItemBackground(itemBackground,I)

			totalWidth += itemBackground.getWidth() + spacingBetweenSlots

		if (contents.len)
			totalWidth -= spacingBetweenSlots

		var/remainingStorage = max_storage_space - totalStorageCost
		if (remainingStorage)
			remainingStorage += 2 //in pixels, creates a small area where items can be put

		storageBackground.scaleToSize(max(totalWidth + remainingStorage, minBackgroundWidth) + paddingSides)

		storageBackground.add(closeButton)
		closeButton.setAlignment(HUD_HORIZONTAL_EAST_OUTSIDE_ALIGNMENT,HUD_CENTER_ALIGNMENT) //east of parent, center

	//slot storage based items
	else
		var/list/storage_contents
		var/list/filtered_contents_last
		var/list/filtered_contents_count
		if (display_contents_with_number) //used to display number next to item icons, indicating how many of such items are in storage
			storage_contents = new //item types in storage
			filtered_contents_last = new //last of x item type in storage
			filtered_contents_count = new //total number of x item type in storage
			for(var/obj/item/I in contents) //count items and remember last item for each type
				// Skip holstered items when holster is disabled
				if(acts_as_holster && !holster_enabled && (I in holstered))
					continue
				var/item_type = I.type
				if (filtered_contents_count[item_type])
					filtered_contents_count[item_type]++
				else
					storage_contents.Add(item_type)
					filtered_contents_count[item_type] = 1

				filtered_contents_last[item_type] = I
		else
			// Filter out holstered items when holster is disabled
			if(acts_as_holster && !holster_enabled && holstered.len)
				storage_contents = new
				for(var/obj/item/I in contents)
					if(!(I in holstered))
						storage_contents.Add(I)
			else
				storage_contents = contents //items in storage

		var/spacingBetweenSlots = 0 //in pixels

		var/totalWidth = 0 //in pixels
		var/totalHeight = 0

		var/slotsToDisplay = storage_contents.len+1 //how many item slots are being displayed
		if (storage_slots)
			slotsToDisplay = min(slotsToDisplay, storage_slots) //limit display to max slot count, if present

		var/currentSlot
		var/currentItemNumber = 1
		var/maxColumnCount = min(data.StorageData["ColCount"], slotsToDisplay)
		for (currentSlot = 1, currentSlot <= slotsToDisplay, currentSlot++)
			var/HUD_element/slottedItemBackground/itemBackground = new()
			main.add(itemBackground)
			itemBackground.setPosition(totalWidth, totalHeight)

			if (currentItemNumber <= storage_contents.len)
				if (display_contents_with_number)
					var/item_type = storage_contents[currentItemNumber]
					setupItemBackground(itemBackground, filtered_contents_last[item_type], filtered_contents_count[item_type])
				else
					setupItemBackground(itemBackground, storage_contents[currentItemNumber])

				currentItemNumber++
			else //empty slots
				itemBackground.setClickProc(GLOBAL_PROC_REF(storageBackgroundClick))
				itemBackground.setData("item", src)

			totalWidth += itemBackground.getWidth() + spacingBetweenSlots

			if (!(currentSlot%maxColumnCount))
				if (!totalHeight)
					main.add(closeButton)
					closeButton.setPosition(totalWidth, 0)

				totalWidth = 0 //reset width
				totalHeight = (currentSlot/maxColumnCount) * (itemBackground.getHeight() + spacingBetweenSlots)

	main.setPosition(data.StorageData["Xspace"],data.StorageData["Yspace"])
	return main

/obj/item/storage/Destroy()
	close_all()
	. = ..()

/obj/item/storage/MouseDrop(obj/over_object)
	if(ishuman(usr) && usr == over_object && !usr.incapacitated() && Adjacent(usr))
		return src.open(usr)
	return ..()

/obj/item/storage/proc/return_inv()
	var/list/L = list()

	L += src.contents

	for(var/obj/item/storage/S in src)
		L += S.return_inv()
	for(var/obj/item/gift/G in src)
		L += G.gift
		if (istype(G.gift, /obj/item/storage))
			L += G.gift:return_inv()
	return L

/obj/item/storage/proc/show_to(var/mob/user)
	if(!user.client)
		return

	if(user.s_active != src) //opening a new storage item
		if(user.s_active) //user already had a storage item open
			user.s_active.close(user)

		for(var/obj/item/I in src)
			if(I.on_found(user)) //trigger mousetraps etc.
				return

	var/datum/hud/data = GLOB.HUDdatums[user.defaultHUD]
	if(data)
		generateHUD(data).show(user.client)
		is_seeing |= user
		user.s_active = src
	LEGACY_SEND_SIGNAL(src, COMSIG_STORAGE_OPENED, user)
	LEGACY_SEND_SIGNAL(user, COMSIG_STORAGE_OPENED, src)

/obj/item/storage/proc/hide_from(var/mob/user)
	is_seeing -= user
	if(user.s_active == src)
		user.s_active = null

	if(!user.client)
		return

	user.client.hide_HUD_element("storage")

/obj/item/storage/proc/open(var/mob/user)
	if(src.use_sound)
		playsound(src.loc, src.use_sound, 50, 1, -5)

	show_to(user)

/obj/item/storage/proc/close(var/mob/user)
	hide_from(user)

/obj/item/storage/AltClick(mob/user)
	if(user.incapacitated())
		to_chat(user, SPAN_WARNING("You can't do that right now!"))
		return
	if(!in_range(src, user))
		return
	else
		src.open(user)

/obj/item/storage/proc/close_all()
	for (var/mob/M in is_seeing)
		close(M)

/obj/item/storage/proc/refresh_all()
	for (var/mob/M in is_seeing)
		if(M.client)
			var/datum/hud/data = GLOB.HUDdatums[M.defaultHUD]
			if (data)
				generateHUD(data).show(M.client)

//This proc return 1 if the item can be picked up and 0 if it can't.
//Set the stop_messages to stop it from printing messages
/obj/item/storage/proc/can_be_inserted(obj/item/W as obj, stop_messages = 0)
	if(!istype(W)) return //Not an item

	if(usr && usr.isEquipped(W) && !usr.canUnEquip(W))
		return 0

	if(src.loc == W)
		return 0 //Means the item is already in the storage item
	if(storage_slots != null && contents.len >= storage_slots)
		// For holsters with storage_slots = 0, don't count holstered items since they're not in contents
		if(storage_slots == 0 && acts_as_holster)
			// Holster-only storage: check if all holster slots are occupied
			if(get_first_empty_holster() == 0)
				if(!stop_messages)
					to_chat(usr, SPAN_NOTICE("[src] has no free holster slots."))
				return 0
		else
			// Regular storage or mixed storage: count holstered items properly
			var/holstered_items = 0
			if(acts_as_holster && holstered.len)
				for(var/obj/item/holstered_item in holstered)
					if(holstered_item && (holstered_item in contents))
						holstered_items++
			if((contents.len - holstered_items) >= storage_slots)
				if(!stop_messages)
					to_chat(usr, SPAN_NOTICE("[src] is full, make some space."))
				return 0 //Storage item is full

	if(W.anchored)
		return 0

	if(can_hold.len)
		// If this storage declares it acts_as_holster, accept items flagged SLOT_HOLSTER
		// BUT only if holster is enabled and the item is actually holsterable
		if(src && src.acts_as_holster && src.holster_enabled && (W.slot_flags & SLOT_HOLSTER))
			// allow holsterable items even if not explicitly in can_hold
			return 1
		if(!is_type_in_list(W, can_hold))
			if(!stop_messages && ! istype(W, /obj/item/hand_labeler))
				to_chat(usr, SPAN_NOTICE("[src] cannot hold \the [W]."))
			return 0
		var/max_instances = can_hold[W.type]
		if(max_instances && instances_of_type_in_list(W, contents) >= max_instances)
			if(!stop_messages && !istype(W, /obj/item/hand_labeler))
				to_chat(usr, SPAN_NOTICE("[src] has no more space specifically for \the [W]."))
			return 0

	if(cant_hold.len && is_type_in_list(W, cant_hold))
		if(!stop_messages)
			to_chat(usr, SPAN_NOTICE("[src] cannot hold [W]."))
		return 0

	if(max_w_class != null && W.w_class > max_w_class)
		if(!stop_messages)
			to_chat(usr, SPAN_NOTICE("[W] is too long for this [src]."))
		return 0

	//Slot based storage overrides space-based storage
	if(storage_slots == null)
		var/total_storage_space = W.get_storage_cost()
		for(var/obj/item/I in contents)
			total_storage_space += I.get_storage_cost() //Adds up the combined w_classes which will be in the storage item if the item is added to it.

		if(total_storage_space > max_storage_space)
			if(!stop_messages)
				to_chat(usr, SPAN_NOTICE("[src] is too full, make some space."))
			return 0

	if(W.w_class >= src.w_class && (istype(W, /obj/item/storage)))
		if(!stop_messages)
			to_chat(usr, SPAN_NOTICE("[src] cannot hold [W] as it's a storage item of the same size."))
		return 0 //To prevent the stacking of same sized storage items.

	return 1

//This proc handles items being inserted. It does not perform any checks of whether an item can or can't be inserted. That's done by can_be_inserted()
//The stop_warning parameter will stop the insertion message from being displayed. It is intended for cases where you are inserting multiple items at once,
//such as when picking up all the items on a tile with one click.
/obj/item/storage/proc/handle_item_insertion(obj/item/W as obj, prevent_warning = FALSE, mob/user, suppress_warning = FALSE)
	if (!istype(W)) return 0
	if (usr)
		usr.prepare_for_slotmove(W)
		usr.update_icons() //update our over-lays

	W.loc = src
	W.on_enter_storage(src)

	if(usr)
		if (usr.client)
			usr.client.screen -= W
		W.dropped(usr)
		add_fingerprint(usr)

		if(!suppress_warning)
			if(!prevent_warning && W.w_class >= ITEM_SIZE_NORMAL)
				if(insertion_sound)
					playsound(get_turf(src), insertion_sound, 100)
				visible_message(SPAN_NOTICE("[usr] puts \a [W] in \the [src]."),
								SPAN_NOTICE("You put \a [W] in \the [src].")
				)
			else
				to_chat(usr, SPAN_NOTICE("You put \a [W] in \the [src]."))

	refresh_all()

	update_icon()
	return 1

//Call this proc to handle the removal of an item from the storage item. The item will be moved to the atom sent as new_target
/obj/item/storage/proc/remove_from_storage(obj/item/W as obj, atom/new_location)
	if (!istype(W))
		return

	if (istype(src, /obj/item/storage/fancy)) //todo: why
		var/obj/item/storage/fancy/F = src
		F.update_icon(1)

	// Clean up holstered items list if this item was holstered
	if(acts_as_holster && holstered.len)
		for(var/i = 1, i <= holster_slots, i++)
			if(holstered[i] == W)
				holstered[i] = null
				break

	if (new_location)
		W.loc = new_location
	else
		W.loc = get_turf(src)

	refresh_all()

	if (W.maptext)
		W.maptext = ""

	W.on_exit_storage(src)
	W.layer = initial(W.layer)
	W.set_plane(initial(W.plane))
	if(extraction_sound)
		playsound(get_turf(src), extraction_sound, 100)
	update_icon()

//This proc is called when you want to place an item into the storage item.
/obj/item/storage/attackby(obj/item/W as obj, mob/user as mob)
	..()

	if(istype(W, /obj/item/device/lightreplacer))
		var/obj/item/device/lightreplacer/LP = W
		var/amt_inserted = 0
		var/turf/T = get_turf(user)
		for(var/obj/item/light/L in src.contents)
			if(L.status == 0)
				if(LP.uses < LP.max_uses)
					LP.AddUses(1)
					amt_inserted++
					remove_from_storage(L, T)
					qdel(L)
		if(amt_inserted)
			to_chat(user, "You inserted [amt_inserted] light\s into \the [LP.name]. You have [LP.uses] light\s remaining.")
			return

	if(!can_be_inserted(W))
		return

	if(istype(W, /obj/item/tray))
		var/obj/item/tray/T = W
		if(T.calc_carry() > 0)
			if(prob(85))
				to_chat(user, SPAN_WARNING("The tray won't fit in [src]."))
				return
			else //todo: proper drop handling
				W.loc = user.loc
				if (user.client)
					user.client.screen -= W
				W.dropped(user)
				to_chat(user, SPAN_WARNING("God damnit!"))

	W.add_fingerprint(user)

	// Check if this storage acts as a holster and the item can be holstered
	// Only attempt holstering if the item has SLOT_HOLSTER flag
	if(acts_as_holster && holster_enabled && (W.slot_flags & SLOT_HOLSTER))
		// Try to holster first if there are available holster slots
		if(get_first_empty_holster())
			return holster_into(src, W, user)

	return handle_item_insertion(W,,user)

/obj/item/storage/dropped(mob/user as mob)
	return

/obj/item/storage/attack_hand(mob/user as mob)
	// v Why does that exist? ~Luduk
	/*if(ishuman(user))
		var/mob/living/carbon/human/H = user
		if(H.l_store == src && !H.get_active_hand())	//Prevents opening if it's in a pocket.
			H.put_in_hands(src)
			H.l_store = null
			return
		if(H.r_store == src && !H.get_active_hand())
			H.put_in_hands(src)
			H.r_store = null
			return*/

	if (loc == user)
		open(user)
	else
		close_all()
		..()

	src.add_fingerprint(user)
	return

/obj/item/storage/verb/toggle_gathering_mode()
	set name = "Switch Gathering Method"
	set category = "Object"

	collection_mode = !collection_mode
	switch (collection_mode)
		if(1)
			to_chat(usr, "[src] now picks up all items in a tile at once.")
		if(0)
			to_chat(usr, "[src] now picks up one item at a time.")

/obj/item/storage/proc/collectItems(var/turf/target, var/mob/user)
	ASSERT(istype(target))
	. = FALSE
	var/limiter = 15
	for(var/obj/item/I in target)
		if(--limiter < 0)
			break
		if(can_be_inserted(I, TRUE))
			. |= TRUE
			handle_item_insertion(I, TRUE, user, TRUE)

	if(user)
		if(.)
			user.visible_message(SPAN_NOTICE("[user] puts some things in [src]."),SPAN_NOTICE("You put some things in [src]."),SPAN_NOTICE("You hear rustling."))
			if (src.use_sound)
				playsound(src.loc, src.use_sound, 50, 1, -5)
		else
			to_chat(user, SPAN_NOTICE("You fail to pick anything up with \the [src]."))


/obj/item/storage/resolve_attackby(atom/A, mob/user)
	if(src.verbs.Find(/obj/item/storage/verb/toggle_gathering_mode))
		if(collection_mode && isturf(A) || istype(A, /obj/item))
			if(collectItems(get_turf(A), user))
				return TRUE
	//Clicking on tile with no collectible items will empty it, if it has the verb to do that.
	if(allow_quick_empty)
		if(isturf(A) && !A.density)
			dump_it(A)
			return TRUE
	return ..()

/obj/item/storage/verb/quick_empty()
	set name = "Empty Contents"
	set category = "Object"
	set src in view(1)

	if((!ishuman(usr) && (src.loc != usr)) || usr.stat || usr.restrained())
		return

	var/turf/T = get_turf(src)
	if(!istype(T))
		return
	dump_it(T)


/obj/item/storage/proc/dump_it(var/turf/target) //he bought?
	if(!isturf(target))
		return
	hide_from(usr)
	for(var/obj/item/I in contents)
		remove_from_storage(I, target)

/obj/item/storage/Initialize(mapload, ...)
	. = ..()
	if(allow_quick_empty)
		verbs += /obj/item/storage/verb/quick_empty
	else
		verbs -= /obj/item/storage/verb/quick_empty

	if(allow_quick_gather)
		verbs += /obj/item/storage/verb/toggle_gathering_mode
	else
		verbs -= /obj/item/storage/verb/toggle_gathering_mode

	// Manage holster verb presence based on acts_as_holster
	if(acts_as_holster)
		// Ensure holster_slots is sane
		if(!holster_slots)
			holster_slots = 1

		// Add holster slots to total storage slots
		// BUT don't add to holster-only storage (storage_slots == 0) as that breaks the holster-only detection
		if(storage_slots != null && holster_enabled && storage_slots != 0)
			storage_slots += holster_slots

		verbs += /obj/item/storage/verb/toggle_holster

		// Ensure holstered list matches holster_slots
		if(holstered.len < holster_slots)
			for(var/i = holstered.len + 1, i <= holster_slots, i++)
				holstered += null

		// Set up initial verb state
		update_holster_verbs()
	else
		verbs -= /obj/item/storage/verb/holster_verb
		verbs -= /obj/item/storage/verb/toggle_holster

	if(isnull(max_storage_space) && !isnull(storage_slots))
		max_storage_space = storage_slots*BASE_STORAGE_COST(max_w_class)

	// Deferred storage doesn't populate_contents() from Initialize, it does so when accessed by player
	if(!istype(src, /obj/item/storage/deferred))
		populate_contents()

	var/total_storage_space = 0
	for(var/obj/item/I in contents)
		total_storage_space += I.get_storage_cost()
	if(exspand_when_spawned)
		max_storage_space = max(total_storage_space, max_storage_space) //prevents spawned containers from being too small for their contents

// Override in subtypes
/obj/item/storage/proc/populate_contents()
	return

/obj/item/storage/emp_act(severity)
	if(!isliving(loc))
		for(var/obj/O in contents)
			O.emp_act(severity)
	..()

/obj/item/storage/attack_self(mob/user as mob)
	if(user.get_active_hand() == src && user.get_inactive_hand() == null)
		if(user.swap_hand())
			open(user)

/obj/item/storage/proc/make_exact_fit()
	storage_slots = contents.len

	can_hold.Cut()
	max_w_class = 0
	max_storage_space = 0
	for(var/obj/item/I in src)
		can_hold[I.type]++
		max_w_class = max(I.w_class, max_w_class)
		max_storage_space += I.get_storage_cost()

//Variant of the above that makes sure nothing is lost
/obj/item/storage/proc/expand_to_fit()
	//Cache the old values
	var/ospace = max_storage_space
	var/omax = max_w_class
	var/olimitedhold = can_hold.len

	//Make fit
	make_exact_fit()

	//Then restore any values that are smaller than the original
	max_w_class = max(omax, max_w_class)
	max_storage_space = max(ospace, max_storage_space)

	//Remove any specific limits that were placed, if we were originally unlimited
	if (!olimitedhold)
		can_hold.Cut()

//Returns the storage depth of an atom. This is the number of storage items the atom is contained in before reaching toplevel (the area).
//Returns -1 if the atom was not found on container.
/atom/proc/storage_depth(atom/container)
	var/depth = 0
	var/atom/cur_atom = src

	while (cur_atom && !(cur_atom in container.contents))
		if (isarea(cur_atom))
			return -1
		if (istype(cur_atom.loc, /obj/item/storage))
			depth++
		cur_atom = cur_atom.loc

	if (!cur_atom)
		return -1	//inside something with a null loc.

	return depth

//Like storage depth, but returns the depth to the nearest turf
//Returns -1 if no top level turf (a loc was null somewhere, or a non-turf atom's loc was an area somehow).
/atom/proc/storage_depth_turf()
	var/depth = 0
	var/atom/cur_atom = src

	while (cur_atom && !isturf(cur_atom))
		if (isarea(cur_atom))
			return -1
		if (istype(cur_atom.loc, /obj/item/storage))
			depth++
		cur_atom = cur_atom.loc

	if (!cur_atom)
		return -1	//inside something with a null loc.

	return depth

/obj/item/proc/get_storage_cost()
	return BASE_STORAGE_COST(w_class) //If you want to prevent stuff above a certain w_class from being stored, use max_w_class


//Useful for spilling the contents of containers all over the floor
/obj/item/storage/proc/spill(var/dist = 2, var/turf/T = null)
	if (!istype(T))//If its not on the floor this might cause issues
		T = get_turf(src)

	for (var/obj/O in contents)
		remove_from_storage(O, T)
		O.tumble(2)

/obj/item/storage/AllowDrop()
	return TRUE
