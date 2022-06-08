var/global/file_uid = 0

/datum/computer_file
	var/filename = "NewFile" 								// Placeholder. No spacebars
	var/filetype = "XXX" 									// File full names are [filename].[filetype] so like NewFile.XXX in this case
	var/size = 1											// File size in GQ. Integers only!
	var/obj/item/computer_hardware/hard_drive/holder		// Holder that contains this file.
	var/unsendable = FALSE									// Whether the file may be sent to someone via NTNet transfer or other means.
	var/undeletable = FALSE									// Whether the file may be deleted. Setting to TRUE prevents deletion/renaming/etc.
	var/uid													// UID of this file
	var/clone_able = TRUE									// Used if we cant clone a file
	var/added_wealth = 0									// How much is are file on export worth?
	var/copy_cat = FALSE 									// Are we a copy or the organial?

/datum/computer_file/New()
	..()
	uid = file_uid
	file_uid++

/datum/computer_file/Destroy()
	if(holder)
		holder.remove_file(src)
		holder = null

	return ..()

// Returns independent copy of this file.
/datum/computer_file/proc/clone(rename = 0)
	if(!clone_able && copy_cat)
		return
	var/datum/computer_file/temp = new type
	temp.unsendable = unsendable
	temp.undeletable = undeletable
	temp.size = size
	temp.filetype = filetype
	temp.filename = filename
	temp.copy_cat = TRUE

	if(rename)
		temp.filename += "(Copy)"

	return temp
