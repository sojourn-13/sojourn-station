#define NO_MESSAGES 0
#define ALREADY_NOTIFIED 1
#define NEW_MESSAGES 2

/datum/tgui_module/email_client
	name = "Email Client"
	tgui_id = "EmailClient"

	var/stored_login = ""
	var/stored_password = ""
	var/error = ""

	var/folder = "Inbox"
	var/datum/computer_file/msg_attachment = null

	var/last_message_count = 0	// How many messages were there during last check.
	var/read_message_count = 0	// How many messages were there when user has last accessed the UI.

	var/datum/computer_file/downloading = null
	var/download_progress = 0
	var/download_speed = 0

	var/datum/computer_file/data/email_account/current_account = null
	var/datum/computer_file/data/email_message/current_message = null

/datum/tgui_module/email_client/ntos
	ntos = TRUE

/datum/tgui_module/email_client/silicon
	available_to_ai = TRUE

/datum/tgui_module/email_client/silicon/ui_state(mob/user)
	return GLOB.self_state

/datum/tgui_module/email_client/proc/log_in()
	var/list/id_login

	var/obj/item/modular_computer/computer = ui_host()
	if(istype(computer))
		var/obj/item/card/id/id = computer.GetIdCard()
		if(!id && ismob(computer.loc))
			var/mob/M = computer.loc
			id = M.GetIdCard()
		if(id)
			id_login = id.associated_email_login.Copy()

	var/datum/computer_file/data/email_account/target
	for(var/datum/computer_file/data/email_account/account in ntnet_global.email_accounts)
		if(!account || !account.can_login)
			continue
		if(stored_login && stored_login == account.login)
			target = account
			break
		if(id_login && id_login["login"] == account.login)
			target = account
			break

	if(!target)
		error = "Invalid Login"
		return FALSE

	if(target.suspended)
		error = "This account has been suspended. Please contact the system administrator for assistance."
		return FALSE

	var/use_pass
	if(stored_password)
		use_pass = stored_password
	else if(id_login)
		use_pass = id_login["password"]

	if(use_pass == target.password)
		current_account = target
		current_account.connected_clients |= src
		return TRUE
	else
		error = "Invalid Password"
		return FALSE

/datum/tgui_module/email_client/proc/log_out()
	if(current_account)
		current_account.connected_clients -= src
	current_account = null
	downloading = null
	download_progress = 0
	last_message_count = 0
	read_message_count = 0

// Returns: 
// - `NO_MESSAGES` if no new messages were received,
// - `ALREADY_NOTIFIED` if there is an unread message but notification has already been sent.
// - `NEW_MESSAGES` if there is a new message that appeared in this tick (and therefore notification should be sent by the program).
/datum/tgui_module/email_client/proc/check_for_new_messages(var/messages_read = FALSE)
	if(!current_account)
		return 0

	var/list/allmails = current_account.all_emails()

	if(allmails.len > last_message_count)
		. = 2
	else if(allmails.len > read_message_count)
		. = 1
	else
		. = 0

	last_message_count = allmails.len
	if(messages_read)
		read_message_count = allmails.len


/datum/tgui_module/email_client/proc/find_message_by_fuid(var/fuid)
	if(!istype(current_account))
		return

	// params works with strings, so this makes it a bit easier for us
	if(istext(fuid))
		fuid = text2num(fuid)

	for(var/datum/computer_file/data/email_message/message in current_account.all_emails())
		if(message.uid == fuid)
			return message

/datum/tgui_module/email_client/proc/relayed_process(var/netspeed)
	download_speed = netspeed
	if(!downloading)
		return

	download_progress = min(download_progress + netspeed, downloading.size)

	if(download_progress >= downloading.size)
		var/obj/item/modular_computer/MC = ui_host()
		if(!istype(MC) || !MC.hard_drive || !MC.hard_drive.check_functionality())
			error = "Error uploading file. Are you using a functional and NTOSv2-compliant device?"
			downloading = null
			download_progress = 0
			return

		if(MC.hard_drive.store_file(downloading))
			error = "File successfully downloaded to local device."
		else
			error = "Error saving file: I/O Error: The hard drive may be full or nonfunctional."

		downloading = null
		download_progress = 0

// Used explicitly for mail_received chat link
/datum/tgui_module/email_client/Topic(href, href_list)
	. = ..()
	if(.)
		return

	if(href_list["open"])
		ui_interact(usr)

/datum/tgui_module/email_client/proc/mail_received(datum/computer_file/data/email_message/received_message)
	var/real_host = ui_host()
	var/mob/living/L = get(real_host, /mob/living)
	if(L)
		// Deliberately not using real_host, we want to ping our parent program, not our computer
		if(istype(host, /datum/computer_file/program/email_client))
			received_message.notify_mob(L, real_host, "<a href='?src=\ref[host];chat_open=1;'>Open Email</a>")
		else
			received_message.notify_mob(L, real_host, "<a href='?src=\ref[src];open=1;'>Open Email</a>")
		log_and_message_admins("[usr] received email from [received_message.source]. \n Message title: [received_message.title]. \n [received_message.stored_data]")

/datum/tgui_module/email_client/ui_data(mob/user)
	var/list/data = ..()

	// Password has been changed by other client connected to this email account
	if(current_account)
		if(current_account.password != stored_password)
			if(!log_in())
				log_out()
				error = "Invalid Password"
		// Banned.
		if(current_account.suspended)
			log_out()
			error = "This account has been suspended. Please contact the system administrator for assistance."

	data["error"] = error

	data["download"] = null
	if(downloading)
		data["download"] = list(
			"filename" = "[downloading.filename].[downloading.filetype]",
			"progress" = download_progress,
			"size" = downloading.size,
			"speed" = download_speed
		)

	data["stored_login"] = stored_login
	data["stored_password"] = stars(stored_password, 0)

	data["id_available"] = FALSE
	data["id_matches"] = FALSE
	var/real_host = ui_host()
	if(istype(real_host, /obj/item/modular_computer))
		var/obj/item/modular_computer/computer = real_host
		var/obj/item/card/id/id = computer.GetIdCard()
		if(!id && ismob(computer.loc))
			var/mob/M = computer.loc
			id = M.GetIdCard()
		if(istype(id))
			data["id_available"] = TRUE
			if(current_account)
				var/list/id_login = id.associated_email_login
				data["id_matches"] = (id_login["login"] == current_account.login && id_login["password"] == current_account.password)

	data["account_data"] = null
	if(istype(current_account))
		var/list/account_data = list()

		account_data["login"] = current_account.login
		
		account_data["ringtone"] = FALSE

		if(issilicon(real_host))
			var/mob/living/silicon/S = real_host
			account_data["ringtone"] = S.email_ringtone
		else if(istype(real_host, /obj/item/modular_computer))
			var/obj/item/modular_computer/computer = real_host
			var/datum/computer_file/program/email_client/PRG = computer.active_program
			if(istype(PRG))
				account_data["ringtone"] = PRG.ringtone

		var/list/addressbook = list()
		for(var/datum/computer_file/data/email_account/account in ntnet_global.email_accounts)
			if(!account.can_login)
				continue
			addressbook += list(account.login)
		account_data["addressbook"] = addressbook

		account_data["attachment"] = null
		if(msg_attachment)
			account_data["attachment"] = list(
				"filename" = "[msg_attachment.filename].[msg_attachment.filetype]",
				"size" = msg_attachment.size
			)

		account_data["current_message"] = null
		account_data["main_menu"] = null

		if(current_message)
			account_data["current_message"] = list(
				"title" = current_message.title,
				"body" = pencode2html(current_message.stored_data),
				"source" = current_message.source,
				"timestamp" = current_message.timestamp,
				"uid" = current_message.uid,
			)
			if(istype(current_message.attachment))
				account_data["current_message"]["attachment"] = list(
					"filename" = "[current_message.attachment.filename].[current_message.attachment.filetype]",
					"size" = current_message.attachment.size
				)
		else
			var/list/main_menu_data = list()

			main_menu_data["label_inbox"] = "Inbox ([current_account.inbox.len])"
			main_menu_data["label_outbox"] = "Sent ([current_account.outbox.len])"
			main_menu_data["label_spam"] = "Spam ([current_account.spam.len])"
			main_menu_data["label_deleted"] = "Deleted ([current_account.deleted.len])"

			main_menu_data["folder"] = folder

			var/list/message_source
			if(folder == "Inbox")
				message_source = current_account.inbox
			else if(folder == "Sent")
				message_source = current_account.outbox
			else if(folder == "Spam")
				message_source = current_account.spam
			else if(folder == "Deleted")
				message_source = current_account.deleted

			var/list/messages_data = list()
			if(message_source)
				for(var/datum/computer_file/data/email_message/message in message_source)
					messages_data += list(list(
						"title" = message.title,
						"body" = null, // pencode2html(message.stored_data),
						"source" = message.source,
						"timestamp" = message.timestamp,
						"uid" = message.uid
					))
			main_menu_data["messages"] = messages_data

			account_data["main_menu"] = main_menu_data

		data["account_data"] = account_data

	return data

/datum/tgui_module/email_client/ui_act(action, list/params, datum/tgui/ui, datum/ui_state/state)
	. = ..()
	if(.)
		return

	// Any action ticks read notifications
	check_for_new_messages(1)

	switch(action)
		// Basic Functionality
		if("log_in")
			log_in()
			. = TRUE

		if("log_out")
			log_out()
			. = TRUE

		if("autofill_id")
			stored_login = ""
			stored_password = ""
	
			var/obj/item/modular_computer/computer = ui_host()
			if(!istype(computer) || !computer.hard_drive || !computer.hard_drive.check_functionality())
				error = "Error exporting file. Are you using a functional and NTOS-compliant device?"
				return TRUE

			var/obj/item/card/id/id = computer.GetIdCard()
			if(!id && ismob(computer.loc))
				var/mob/M = computer.loc
				id = M.GetIdCard()
			if(id)
				var/list/id_login = id.associated_email_login.Copy()
				stored_login = id_login["login"]
				stored_password = id_login["password"]
			. = TRUE

		if("sync_id")
			var/obj/item/modular_computer/computer = ui_host()
			if(!istype(computer) || !computer.hard_drive || !computer.hard_drive.check_functionality())
				error = "Error exporting file. Are you using a functional and NTOS-compliant device?"
				return TRUE

			if(!current_account)
				error = "Log in first"
				return TRUE

			var/obj/item/card/id/id = computer.GetIdCard()
			if(!id && ismob(computer.loc))
				var/mob/M = computer.loc
				id = M.GetIdCard()
			if(!istype(id))
				error = "No ID card found"
				return TRUE

			var/confirmation = input(usr, "Would you like to overwrite \the [id]'s stored email with [current_account.login]?") as null|anything in list("Yes", "No")
			if(confirmation != "Yes")
				return TRUE

			id.associated_email_login = list(
				"login" = current_account.login,
				"password" = current_account.password
			)
			. = TRUE

		// Set/Reset
		if("reset_error")
			error = null
			. = TRUE

		if("set_stored_login")
			stored_login = sanitize(params["login"], 100)
			. = TRUE

		if("set_stored_password")
			stored_password = sanitize(params["password"], 100)
			. = TRUE

		if("set_folder")
			folder = params["folder"]
			. = TRUE

		if("set_current_message")
			var/datum/computer_file/data/email_message/M = find_message_by_fuid(params["uid"])
			if(istype(M))
				current_message = M
			. = TRUE
		
		if("clear_current_message")
			current_message = null
			. = TRUE

		// Complicated stuff
		if("send_message")
			if(!current_account)
				return TRUE

			var/body = sanitize(params["body"], 20000)
			var/recipient = sanitize(params["recipient"], 180)
			var/title = sanitize(params["title"], 180) || "No Subject"

			if(!length(body))
				error = "Error sending mail: Message body empty!"
				return TRUE
			
			if(!length(recipient))
				error = "Error sending mail: No recipient specified!"
				return TRUE

			var/datum/computer_file/data/email_message/message = new()
			message.title = title
			message.stored_data = body
			message.source = current_account.login
			message.attachment = msg_attachment

			if(!current_account.send_mail(recipient, message))
				error = "Error sending email: this address doesn't exist."
				return TRUE

			error = "Email successfully sent."
			msg_attachment = null
			. = TRUE

		if("delete_message")
			if(!current_account)
				return TRUE

			var/datum/computer_file/data/email_message/M = find_message_by_fuid(params["uid"])
			if(!istype(M))
				return TRUE

			if(folder == "Deleted")
				current_account.deleted.Remove(M)
				qdel(M)
			else
				current_account.deleted |= M
				current_account.inbox.Remove(M)
				current_account.spam.Remove(M)
				current_account.outbox.Remove(M)

			// Handle current_message being the deleted message
			if(current_message == M)
				current_message = null
			. = TRUE

		if("print_message")
			if(!current_account)
				return TRUE

			var/obj/item/modular_computer/computer = ui_host()
			if(!istype(computer) || !computer.hard_drive || !computer.hard_drive.check_functionality())
				error = "Error exporting file. Are you using a functional and NTOS-compliant device?"
				return TRUE

			if(!computer.printer)
				error = "Missing Hardware: Your computer does not have the required hardware to complete this operation."
				return TRUE

			var/datum/computer_file/data/email_message/M = find_message_by_fuid(params["uid"])
			if(!istype(M))
				return TRUE

			if(!computer.printer.print_text(pencode2html(M.stored_data)))
				error = "Hardware error: Printer was unable to print the file. It may be out of paper."
			. = TRUE

		if("save_message")
			if(!current_account)
				return TRUE

			var/obj/item/modular_computer/computer = ui_host()
			if(!istype(computer) || !computer.hard_drive || !computer.hard_drive.check_functionality())
				error = "Error exporting file. Are you using a functional and NTOS-compliant device?"
				return TRUE

			var/datum/computer_file/data/email_message/M = find_message_by_fuid(params["uid"])
			if(!istype(M))
				return TRUE

			var/filename = sanitize(input(usr, "Please specify file name:", "Message export") as text|null, 100)
			if(!filename)
				return TRUE

			var/datum/computer_file/data/mail = M.export()
			if(!istype(mail))
				return TRUE

			mail.filename = filename
			if(!computer.hard_drive || !computer.hard_drive.store_file(mail))
				error = "Internal I/O error when writing file, the hard drive may be full."
			else
				error = "Email exported successfully"

			. = TRUE

		if("download_message_attachment")
			if(!current_account)
				return TRUE

			var/obj/item/modular_computer/computer = ui_host()
			if(!istype(computer) || !computer.hard_drive || !computer.hard_drive.check_functionality())
				error = "Error exporting file. Are you using a functional and NTOS-compliant device?"
				return TRUE

			var/datum/computer_file/data/email_message/M = find_message_by_fuid(params["uid"])
			if(!istype(M))
				return TRUE

			downloading = M.attachment.clone()
			download_progress = 0
			. = TRUE

		if("cancel_download")
			downloading = null
			download_progress = 0
			. = TRUE

		if("add_attachment")
			if(!current_account)
				return TRUE

			var/obj/item/modular_computer/MC = ui_host()
			if(!istype(MC) || !MC.hard_drive || !MC.hard_drive.check_functionality())
				error = "Error uploading file. Are you using a functional and NTOSv2-compliant device?"
				return TRUE

			msg_attachment = null

			var/list/filenames = list()
			for(var/datum/computer_file/CF in MC.hard_drive.stored_files)
				if(CF.unsendable)
					continue
				filenames.Add(CF.filename)
			var/picked_file = input(usr, "Please pick a file to send as attachment (max 32GQ)") as null|anything in filenames

			if(!picked_file)
				return TRUE

			// Check that PC is still working
			if(!istype(MC) || !MC.hard_drive || !MC.hard_drive.check_functionality())
				error = "Error uploading file. Are you using a functional and NTOSv2-compliant device?"
				return TRUE

			for(var/datum/computer_file/CF in MC.hard_drive.stored_files)
				if(CF.unsendable)
					continue
				if(CF.filename == picked_file)
					msg_attachment = CF.clone()
					break

			if(!istype(msg_attachment))
				msg_attachment = null
				error = "Unknown error when uploading attachment."
				return TRUE

			if(msg_attachment.size > 32)
				error = "Error uploading attachment: File exceeds maximal permitted file size of 32GQ."
				msg_attachment = null
			else
				error = "File [msg_attachment.filename].[msg_attachment.filetype] has been successfully uploaded."

			. = TRUE

		if("clear_attachment")
			msg_attachment = null
			. = TRUE

		if("change_password")
			var/old_password = sanitize(input(usr, "Please enter your old password:", "Password Change") as text|null, 100)
			if(!old_password)
				return TRUE
			var/new_password = sanitize(input(usr, "Please enter your new password:", "Password Change") as text|null, 100)
			if(!new_password)
				return TRUE
			var/confirm_password = sanitize(input(usr, "Please re-enter your new password:", "Password Change") as text|null, 100)
			if(!confirm_password)
				return TRUE

			if(!istype(current_account))
				error = "Please log in before proceeding."
				return TRUE

			if(current_account.password != old_password)
				error = "Incorrect original password"
				return TRUE

			if(new_password != confirm_password)
				error = "The entered passwords do not match."
				return TRUE

			current_account.password = new_password
			stored_password = new_password
			error = "Your password has been successfully changed!"
			. = TRUE

		if("ringtone_toggle")
			var/real_host = ui_host()
			if(issilicon(real_host))
				var/mob/living/silicon/S = real_host
				S.email_ringtone = !S.email_ringtone
			else if(istype(real_host, /obj/item/modular_computer))
				var/obj/item/modular_computer/computer = real_host
				var/datum/computer_file/program/email_client/PRG = computer.active_program
				if(istype(PRG))
					PRG.ringtone = !PRG.ringtone
			. = TRUE

#undef NO_MESSAGES
#undef ALREADY_NOTIFIED
#undef NEW_MESSAGES
