/datum/computer_file/program/wordprocessor
	filename = "wordprocessor"
	filedesc = "NanoWord"
	extended_desc = "This program allows the editing and preview of text documents."
	program_icon_state = "word"
	program_key_state = "atmos_key"
	program_menu_icon = "file-word"
	size = 4
	requires_ntnet = FALSE
	available_on_ntnet = TRUE
	var/browsing
	var/open_file
	// WARNING: UNSANITIZED VARIABLE
	// THIS MUST BE SANITIZED BEFORE BEING SENT ANYWHERE VULNERABLE TO HTML
	var/loaded_data = ""
	var/error
	var/is_edited
	usage_flags = PROGRAM_ALL

/datum/computer_file/program/wordprocessor/proc/open_file(var/filename)
	var/datum/computer_file/data/F = get_file(filename)
	if(F)
		open_file = F.filename
		loaded_data = F.stored_data
		return TRUE

/datum/computer_file/program/wordprocessor/proc/save_file(var/filename)
	var/datum/computer_file/data/F = get_file(filename)
	if(!F) //try to make one if it doesn't exist
		F = create_file(filename, loaded_data, /datum/computer_file/data/text)
		return !isnull(F)
	var/datum/computer_file/data/backup = F.clone()
	var/obj/item/computer_hardware/hard_drive/HDD = computer.hard_drive
	if(!HDD)
		return
	HDD.remove_file(F)
	F.stored_data = loaded_data
	F.calculate_size()
	if(!HDD.store_file(F))
		HDD.store_file(backup)
		return FALSE
	is_edited = FALSE
	return TRUE

/datum/computer_file/program/wordprocessor/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "NtosWord", filedesc)
		ui.open()

/datum/computer_file/program/wordprocessor/ui_data(mob/user)
	var/list/data = ..()
	data["error"] = error

	if(!computer || !computer.hard_drive || !computer.hard_drive.check_functionality())
		data["error"] = "I/O ERROR: Unable to access hard drive."
		return data

	var/list/files = list()
	for(var/datum/computer_file/F in computer.hard_drive.stored_files)
		if(F.filetype == "TXT")
			files += list(list(
				"name" = F.filename,
				"size" = F.size
			))
	data["files"] = files

	var/list/usbfiles = list()
	if(istype(computer.portable_drive))
		for(var/datum/computer_file/F in computer.portable_drive.stored_files)
			if(F.filetype == "TXT")
				usbfiles += list(list(
					"name" = F.filename,
					"size" = F.size,
				))
	data["usbfiles"] = usbfiles
	
	data["open_file"] = open_file
	data["loaded_data"] = loaded_data
	data["loaded_data_html"] = pencode2html(sanitize(replacetext(loaded_data, "\n", "\[br\]"), MAX_TEXTFILE_LENGTH))
	data["max_length"] = MAX_TEXTFILE_LENGTH

	return data

/datum/computer_file/program/wordprocessor/ui_act(action, list/params, datum/tgui/ui, datum/ui_state/state)
	. = ..()
	if(.)
		return

	switch(action)
		if("PRG_reseterror")
			error = null
			. = TRUE
	
		if("PRG_openfile")
			if(!open_file(params["file"]))
				error = "I/O error: Unable to open file '[params["file"]]'."
			. = TRUE

		if("PRG_newfile")
			var/newname = sanitize(input(usr, "Enter file name:", "New File") as text|null)
			if(!newname)
				return TRUE

			var/datum/computer_file/data/F = create_file(newname, "", /datum/computer_file/data/text)
			if(F)
				open_file = F.filename
				loaded_data = ""
				return TRUE
			else
				error = "I/O error: Unable to create file '[newname]'."
			. = TRUE

		if("PRG_saveasfile")
			var/newname = sanitize(input(usr, "Enter file name:", "Save As") as text|null)
			if(!newname)
				return TRUE
			
			var/datum/computer_file/data/F = create_file(newname, loaded_data, /datum/computer_file/data/text)
			if(F)
				open_file = F.filename
			else
				error = "I/O error: Unable to create file '[newname]'."
			. = TRUE

		if("PRG_savefile")
			if(!open_file)
				open_file = sanitize(input(usr, "Enter file name:", "Save As") as text|null)
				if(!open_file)
					return TRUE

			if(!save_file(open_file))
				error = "I/O error: Unable to save file '[open_file]'."
			. = TRUE

		if("PRG_editfile")
			loaded_data = copytext(params["text"], 1, MAX_TEXTFILE_LENGTH)
			return TRUE

		if("PRG_printfile")
			if(!computer.printer)
				error = "Missing Hardware: Your computer does not have the required hardware to complete this operation."
				return TRUE
			if(!computer.printer.print_text(pencode2html(sanitize(replacetext(loaded_data, "\n", "\[br\]"), MAX_TEXTFILE_LENGTH))))
				error = "Hardware error: Printer was unable to print the file. It may be out of paper."
				return TRUE
			. = TRUE
