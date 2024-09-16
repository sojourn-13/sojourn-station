// This is special hardware configuration program.
// It is to be used only with modular computers.
// It allows you to toggle components of your device.

/datum/computer_file/program/computerconfig
	filename = "compconfig"
	filedesc = "Computer Configuration Tool"
	extended_desc = "This program allows configuration of computer's hardware"
	program_icon_state = "generic"
	program_key_state = "generic_key"
	program_menu_icon = "cog"
	unsendable = 1
	undeletable = 1
	size = 4
	available_on_ntnet = 0
	requires_ntnet = 0
	// nanomodule_path = /datum/nano_module/program/computer_configurator
	usage_flags = PROGRAM_ALL

/datum/computer_file/program/computerconfig/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if (!ui)
		ui = new(user, src, "NtosComputerConfig")
		ui.open()

/datum/computer_file/program/computerconfig/ui_data(mob/user)
	var/list/data = ..()

	data["available_themes"] = GLOB.ntos_themes

	var/list/hardware = computer.get_all_components()

	data["disk_size"] = computer.hard_drive.max_capacity
	data["disk_used"] = computer.hard_drive.used_capacity
	data["power_usage"] = computer.last_power_usage
	data["battery_exists"] = !!computer.cell
	data["battery_rating"] = computer.cell?.maxcharge
	data["battery_percent"] = round(computer.cell?.percent())

	// Configurable stuff
	var/obj/item/computer_hardware/printer/printer = computer.printer
	data["print_language"] = printer ? printer.print_language : null

	var/list/hardware_data = list()
	for(var/obj/item/computer_hardware/H in hardware)
		hardware_data += list(list(
			"name" = H.name,
			"desc" = H.desc,
			"enabled" = H.enabled,
			"critical" = H.critical,
			"powerusage" = H.power_usage
		))

	data["hardware"] = hardware_data

	return data

/datum/computer_file/program/computerconfig/ui_act(action, list/params, datum/tgui/ui, datum/ui_state/state)
	. = ..()
	if(.)
		return

	switch(action)
		if("set_device_theme")
			var/theme = params["theme"]
			if((theme in GLOB.ntos_themes) || theme == "")
				computer.device_theme = theme
				return TRUE
			to_chat(usr, SPAN_DANGER("The theme '[theme]' is not available on this device."))

		if("edit_language")
			var/obj/item/computer_hardware/printer/printer = computer.printer
			if (!printer)
				to_chat(usr, SPAN_WARNING("No printer found, unable to update language."))
				return TRUE
			var/list/selectable_languages = list()
			for(var/datum/language/L in usr.languages)
				if(L.has_written_form)
					selectable_languages += L
			var/new_language = input(usr, "What language do you want to print in?", "Change language", printer.print_language) as null|anything in selectable_languages
			if (!new_language)
				return TRUE
			printer.print_language = new_language
			. = TRUE
