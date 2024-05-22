/datum/computer_file/program/filemanager
	filename = "filemanager"
	filedesc = "File Manager"
	extended_desc = "This program allows management of files."
	program_icon_state = "generic"
	program_key_state = "generic_key"
	program_menu_icon = "folder"
	size = 6
	requires_ntnet = 0
	available_on_ntnet = 0
	undeletable = 1
	usage_flags = PROGRAM_ALL
	var/open_file
	var/error

/datum/computer_file/program/filemanager/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if (!ui)
		ui = new(user, src, "NtosFileManager")
		ui.open()

/datum/computer_file/program/filemanager/ui_data(mob/user)
	var/list/data = ..()

	data["error"] = error

	data["internal_disk"] = computer.hard_drive.nano_ui_data()
	data["portable_disk"] = computer.portable_drive?.nano_ui_data()

	if(open_file)
		var/datum/computer_file/data/file
		file = computer.hard_drive.find_file_by_name(open_file)
		
		if(file.filetype == "AUD")
			data["error"] = "Software error: Please use a dedicated Audio Player program to read audio files."
		else if(!istype(file))
			data["error"] = "I/O ERROR: Unable to open file."
		else
			data["open_file"] = list(
				"filedata" = pencode2html(file.stored_data),
				"filename" = "[file.filename].[file.filetype]"
			)
	else
		data["open_file"] = null

	return data

/datum/computer_file/program/filemanager/ui_act(action, list/params, datum/tgui/ui, datum/ui_state/state)
	. = ..()
	if(.)
		return

	switch(action)
		if("set_open_file")
			open_file = params["file"]
			. = TRUE

		if("new_text_file")
			var/newname = sanitize(input(usr, "Enter file name or leave blank to cancel:", "File rename") as text|null)
			if(!newname)
				return

			var/obj/item/computer_hardware/hard_drive/HDD = computer.hard_drive
			if(!HDD || HDD.read_only)
				return

			var/datum/computer_file/data/F = new/datum/computer_file/data()
			F.filename = newname
			F.filetype = "TXT"
			HDD.store_file(F)

			. = TRUE

		if("delete_file")
			var/obj/item/computer_hardware/hard_drive/HDD
			if(params["portable"])
				HDD = computer.portable_drive
			else
				HDD = computer.hard_drive

			if(!HDD)
				return

			var/datum/computer_file/file = HDD.find_file_by_name(params["file"])
			if(!file || file.undeletable)
				return

			HDD.remove_file(file)
			. = TRUE

		if("close_file")
			open_file = null
			error = null
			. = TRUE

		if("clone_file")
			var/obj/item/computer_hardware/hard_drive/HDD = computer.hard_drive
			if(!HDD || HDD.read_only)
				return

			var/datum/computer_file/F = HDD.find_file_by_name(params["file"])
			if(!F || !istype(F) || !F.clone_able || F.undeletable)
				return

			var/datum/computer_file/C = F.clone(1)
			HDD.store_file(C)
			. = TRUE

		if("rename_file")
			var/obj/item/computer_hardware/hard_drive/HDD = computer.hard_drive
			if(!HDD || HDD.read_only)
				return

			var/datum/computer_file/file = HDD.find_file_by_name(params["file"])
			if(!file || !istype(file) || file.undeletable)
				return

			var/newname = sanitize(input(usr, "Enter new file name:", "File rename", file.filename) as text|null)
			if(file && newname)
				file.filename = newname
			. = TRUE

		if("edit_file")
			if(!open_file)
				return

			var/obj/item/computer_hardware/hard_drive/HDD = computer.hard_drive
			if(!HDD || HDD.read_only)
				return

			var/datum/computer_file/data/F = HDD.find_file_by_name(open_file)
			if(!F || !istype(F) || F.undeletable)
				return

			if(F.read_only && (alert("WARNING: This file is not compatible with editor. Editing it may result in permanently corrupted formatting or damaged data consistency. Edit anyway?", "Incompatible File", "No", "Yes") == "No"))
				return

			var/oldtext = html_decode(F.stored_data)
			oldtext = replacetext(oldtext, "\[br\]", "\n")

			var/newtext = sanitize(replacetext(input(usr, "Editing file [open_file]. You may use most tags used in paper formatting:", "Text Editor", oldtext) as message|null, "\n", "\[br\]"), MAX_TEXTFILE_LENGTH)
			if(!newtext)
				return

			if(F)
				var/datum/computer_file/data/backup = F.clone()
				HDD.remove_file(F)
				F.stored_data = newtext
				F.calculate_size()
				// We can't store the updated file, it's probably too large. Print an error and restore backed up version.
				// This is mostly intended to prevent people from losing texts they spent lot of time working on due to running out of space.
				// They will be able to copy-paste the text from error screen and store it in notepad or something.
				if(!HDD.store_file(F))
					error = "I/O error: Unable to overwrite file. Hard drive is probably full. You may want to backup your changes before closing this window:<br><br>[html_decode(F.stored_data)]<br><br>"
					HDD.store_file(backup)

			. = TRUE

		if("print_file")
			if(!open_file)
				return

			var/obj/item/computer_hardware/hard_drive/HDD = computer.hard_drive
			if(!HDD)
				return

			var/datum/computer_file/data/F = HDD.find_file_by_name(open_file)
			if(!F || !istype(F))
				return

			if(!computer.printer)
				error = "Missing Hardware: Your computer does not have required hardware to complete this operation."
				return

			if(!computer.printer.print_text(pencode2html(F.stored_data)))
				error = "Hardware error: Printer was unable to print the file. It may be out of paper."
				return

			. = TRUE

		if("copy_to_usb")
			var/obj/item/computer_hardware/hard_drive/HDD = computer.hard_drive
			var/obj/item/computer_hardware/hard_drive/portable/RHDD = computer.portable_drive
			if(!HDD || !RHDD)
				return

			var/datum/computer_file/F = HDD.find_file_by_name(params["file"])
			if(!F || !istype(F) || F.undeletable || !F.clone_able)
				return

			var/datum/computer_file/C = F.clone(0)
			RHDD.store_file(C)
			. = TRUE

		if("copy_from_usb")
			var/obj/item/computer_hardware/hard_drive/HDD = computer.hard_drive
			var/obj/item/computer_hardware/hard_drive/portable/RHDD = computer.portable_drive
			if(!HDD || !RHDD)
				return

			var/datum/computer_file/F = RHDD.find_file_by_name(params["file"])
			if(!F || !istype(F) || F.undeletable || !F.clone_able)
				return

			var/datum/computer_file/C = F.clone(0)
			HDD.store_file(C)
			. = TRUE
