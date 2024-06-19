/*
TGUI MODULES

This allows for datum-based TGUIs that can be hooked into objects.
This is useful for things such as the power monitor, which needs to exist on a physical console in the world, but also as a virtual device the AI can use

Code is pretty much ripped verbatim from nano modules, but with un-needed stuff removed
*/
/datum/tgui_module
	var/name
	var/datum/host
	var/list/using_access

	var/tgui_id
	var/ntos = FALSE
	var/available_to_ai = FALSE

/datum/tgui_module/New(new_host)
	host = new_host
	if(ntos)
		tgui_id = "Ntos" + tgui_id

/datum/tgui_module/Destroy()
	host = null
	. = ..()

/datum/tgui_module/ui_host()
	return host ? host.ui_host() : src

/datum/tgui_module/ui_close(mob/user)
	if(host)
		host.ui_close(user)

/datum/tgui_module/proc/check_eye(mob/user)
	return -1

/datum/tgui_module/proc/can_still_topic(mob/user, datum/ui_state/state)
	return (ui_status(user, state) == STATUS_INTERACTIVE)

/datum/tgui_module/proc/check_access(mob/user, access)
	if(!access)
		return 1

	if(using_access)
		if(access in using_access)
			return 1
		else
			return 0

	if(!istype(user))
		return 0

	var/obj/item/card/id/I = user.GetIdCard()
	if(!I)
		return 0

	if(access in I.access)
		return 1

	return 0

/datum/tgui_module/ui_data(mob/user)
	. = ..()

	var/obj/item/modular_computer/host = ui_host()
	if(istype(host))
		. += host.get_header_data()

/datum/tgui_module/ui_act(action, list/params, datum/tgui/ui, datum/ui_state/state)
	. = ..()
	if(.)
		return

	var/obj/item/modular_computer/host = ui_host()
	if(istype(host))
		host.ui_act(action, params, ui, state)

// Just a nice little default interact in case the subtypes don't need any special behavior here
/datum/tgui_module/ui_interact(mob/user, datum/tgui/ui = null)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, tgui_id, name)
		ui.open()

/datum/tgui_module/proc/relaymove(mob/user, direction)
	return FALSE
