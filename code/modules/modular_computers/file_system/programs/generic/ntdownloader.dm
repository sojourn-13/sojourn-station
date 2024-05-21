/datum/computer_file/program/downloader
	filename = "downloader"
	filedesc = "Software Download Tool"
	program_icon_state = "generic"
	program_key_state = "generic_key"
	program_menu_icon = "download"
	extended_desc = "This program allows downloads of software from official software repositories"
	unsendable = 1
	undeletable = 1
	size = 4
	requires_ntnet = 1
	requires_ntnet_feature = NTNET_SOFTWAREDOWNLOAD
	available_on_ntnet = 0
	ui_header = "downloader_finished.gif"
	var/datum/computer_file/program/downloaded_file = null
	var/hacked_download = FALSE
	var/download_completion = 0 //GQ of downloaded data.

	var/downloaderror = ""
	var/list/downloads_queue = list()
	var/file_info //For logging, can be faked by antags.
	var/server
	var/download_paused = FALSE
	usage_flags = PROGRAM_ALL

/datum/computer_file/program/downloader/kill_program(forced = FALSE)
	..()
	downloaded_file = null
	download_completion = 0
	downloaderror = ""
	ui_header = "downloader_finished.gif"

/datum/computer_file/program/downloader/proc/begin_file_download(filename, skill)
	if(downloaded_file)
		return 0

	var/datum/computer_file/program/PRG = ntnet_global.find_ntnet_file_by_name(filename)

	if(!check_file_download(filename))
		return 0

	ui_header = "downloader_running.gif"

	hacked_download = (PRG in ntnet_global.available_antag_software)
	file_info = hide_file_info(PRG)
	generate_network_log("Began downloading file [file_info] from [server].")
	downloaded_file = PRG.clone()

/datum/computer_file/program/downloader/proc/check_file_download(var/filename)
	//returns 1 if file can be downloaded, returns 0 if download prohibited
	var/datum/computer_file/program/PRG = ntnet_global.find_ntnet_file_by_name(filename)

	if(!PRG || !istype(PRG))
		return 0

	// Attempting to download antag only program, but without having emagged computer. No.
	if(PRG.available_on_syndinet && !computer_emagged)
		return 0

	if(!computer || !computer.hard_drive || !computer.hard_drive.try_store_file(PRG))
		return 0

	return 1

/datum/computer_file/program/downloader/proc/hide_file_info(datum/computer_file/file, skill)
	server = (file in ntnet_global.available_station_software) ? "NTNet Software Repository" : "unspecified server"
	if(!hacked_download)
		return "[file.filename].[file.filetype]"
	var/stealth_chance = max(skill - STAT_LEVEL_BASIC, 0) * 30
	if(!prob(stealth_chance))
		return "**ENCRYPTED**.[file.filetype]"
	var/datum/computer_file/fake_file = pick(ntnet_global.available_station_software)
	server = "NTNet Software Repository"
	return "[fake_file.filename].[fake_file.filetype]"


/datum/computer_file/program/downloader/proc/end_file_download(abort=FALSE)
	if(!downloaded_file)
		return

	generate_network_log("[abort ? "Aborted" : "Completed"] download of file [file_info].")

	if(!abort)
		if(!computer?.hard_drive?.store_file(downloaded_file))
			// The download failed
			downloaderror = {"I/O ERROR - Unable to save file.
			Check whether you have enough free space on your hard drive and whether your hard drive is properly connected."}

	downloaded_file = null
	download_completion = 0
	ui_header = "downloader_finished.gif"

	if(downloads_queue.len > 0)
		begin_file_download(downloads_queue[1], downloads_queue[downloads_queue[1]])
		downloads_queue.Remove(downloads_queue[1])

/datum/computer_file/program/downloader/process_tick()
	if(!downloaded_file || download_paused)
		return

	if(download_completion >= downloaded_file.size)
		end_file_download()

	if(!downloaded_file)
		return

	// Download speed according to connectivity state. Network server is assumed to be on unlimited speed so we're limited by our local connectivity
	// Allow speed to vary 15% up or down
	update_netspeed(speed_variance=15)
	download_completion = min(download_completion + ntnet_speed, downloaded_file.size)

/datum/computer_file/program/downloader/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if (!ui)
		ui = new(user, src, "NtosDownloader")
		ui.open()

/datum/computer_file/program/downloader/ui_data(mob/user)
	var/list/data = ..()

	data["error"] = downloaderror || null

	if(downloaded_file) // Download running. Wait please..
		data["downloaded_file"] = list(
			"downloadname" = downloaded_file.filename,
			"downloaddesc" = downloaded_file.filedesc,
			"downloadsize" = downloaded_file.size,
			"downloadspeed" = ntnet_speed,
			"downloadcompletion" = round(download_completion, 0.01)
		)
	else
		data["downloaded_file"] = null

	data["download_paused"] = download_paused
	data["disk_size"] = computer.hard_drive.max_capacity
	data["disk_used"] = computer.hard_drive.used_capacity

	// There's no way you could get here without a hard drive
	var/obj/item/computer_hardware/hard_drive/HDD = computer.hard_drive
	
	var/list/datum/computer_file/program/installed_programs = list()
	for(var/datum/computer_file/program/P in HDD.stored_files)
		installed_programs += P

	var/list/datum/computer_file/program/downloadable_programs = list()
	for(var/datum/computer_file/program/P in ntnet_global.available_station_software)
		downloadable_programs += P

	for(var/datum/computer_file/program/P in downloadable_programs) //Removeing programs from list that are already present on HDD
		for(var/datum/computer_file/program/I in installed_programs)
			if(P.filename == I.filename)
				downloadable_programs -= P
				break

	var/list/queue = list()
	if(downloads_queue.len > 0)
		for(var/item in downloads_queue)
			queue += item
	data["downloads_queue"] = queue

	var/list/all_entries = list()
	for(var/datum/computer_file/program/P in downloadable_programs)
		// Only those programs our user can run will show in the list
		if(!P.can_run(user) && P.requires_access_to_download)
			continue

		if(!P.is_supported_by_hardware(computer, user))
			continue

		all_entries += list(list(
			"filename" = P.filename,
			"filedesc" = P.filedesc,
			"fileinfo" = P.extended_desc,
			"size" = P.size,
			"icon" = P.program_menu_icon,
			"in_queue" = (P.filename in queue) ? 1 : 0
		))

	var/list/hacked_programs = list()
	if(computer_emagged) // If we are running on emagged computer we have access to some "bonus" software
		for(var/datum/computer_file/program/P in ntnet_global.available_antag_software)
			hacked_programs += list(list(
				"filename" = P.filename,
				"filedesc" = P.filedesc,
				"fileinfo" = P.extended_desc,
				"size" = P.size,
				"icon" = P.program_menu_icon
			))
	data["hacked_programs"] = hacked_programs

	data["downloadable_programs"] = all_entries

	return data

/datum/computer_file/program/downloader/ui_act(action, list/params, datum/tgui/ui, datum/ui_state/state)
	. = ..()
	if(.)
		return

	switch(action)
		if("download_file")
			if(!downloaded_file)
				begin_file_download(params["file"], usr.stats.getStat(STAT_COG))
			else if(check_file_download(params["file"]) && !downloads_queue.Find(params["file"]) && downloaded_file.filename != params["file"])
				downloads_queue[params["file"]] = usr.stats.getStat(STAT_COG)
			. = TRUE
		
		if("remove_queued")
			downloads_queue -= params["file"]
			. = TRUE
		
		if("reset_error")
			if(downloaderror)
				download_completion = 0
				downloaded_file = null
				downloaderror = ""
			. = TRUE
		
		if("download_pause")
			download_paused = !download_paused
			if (download_paused)
				ui_header = "downloader_paused.gif"
			else
				ui_header = "downloader_running.gif"
			. = TRUE

		if("download_stop")
			if(downloaded_file)
				end_file_download(abort=TRUE)
			. = TRUE
