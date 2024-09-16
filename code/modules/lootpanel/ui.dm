
/datum/lootpanel/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "LootPanel")
		ui.set_autoupdate(FALSE)
		ui.open()

/datum/lootpanel/ui_close(mob/user)
	. = ..()

	source_turf = null
	reset_contents()

/datum/lootpanel/ui_data(mob/user)
	var/list/data = list()

	data["contents"] = get_contents()
	data["is_blind"] = is_blind(user)

	return data

/datum/lootpanel/ui_status(mob/user, datum/ui_state/state)
	if(user.incapacitated())
		return UI_DISABLED

	return UI_INTERACTIVE

/datum/lootpanel/ui_act(action, list/params)
	. = ..()
	if(.)
		return

	switch(action)
		if("grab")
			return grab(usr, params)
		if("refresh")
			return populate_contents()

	return FALSE

/// UI helper for converting the associative list to a list of lists
/datum/lootpanel/proc/get_contents()
	var/list/items = list()

	for(var/datum/search_object/index as anything in contents)
		UNTYPED_LIST_ADD(items, list(
			"icon" = index.icon,
			"name" = index.name,
			"path" = index.path,
			"ref" = REF(index),
		))

	return items

/// Clicks an object from the contents. Validates the object and the user
/datum/lootpanel/proc/grab(mob/user, list/params)
	var/ref = params["ref"]
	if(isnull(ref))
		return FALSE

	var/datum/search_object/index = locate(ref) in contents
	var/atom/thing = index?.item
	if(QDELETED(index) || QDELETED(thing)) // Obj is gone
		return FALSE

	if(thing != source_turf && !(locate(thing) in source_turf.contents))
		qdel(index) // Item has moved
		return TRUE

	var/modifiers = ""
	if(params["ctrl"])
		modifiers += "ctrl=1;"
	if(params["middle"])
		modifiers += "middle=1;"
	if(params["shift"])
		modifiers += "shift=1;"
	if(params["alt"])
		modifiers += "alt=1;"
	if(params["right"])
		modifiers += "right=1;"

	user.client?.Click(thing, thing.loc, null, modifiers)

	return TRUE
