/datum/computer_file/program/email_client
	filename = "emailc"
	filedesc = "Email Client"
	extended_desc = "This program may be used to log in into your email account."
	program_icon_state = "generic"
	program_key_state = "generic_key"
	program_menu_icon = "envelope"
	size = 7
	requires_ntnet = 1
	available_on_ntnet = 1
	usage_flags = PROGRAM_ALL

	//Those needed to restore data when programm is killed
	var/stored_login = ""
	var/stored_password = ""
	var/datum/computer_file/data/email_account/current_account

	var/ringtone = TRUE

	tguimodule_path = /datum/tgui_module/email_client/ntos

// Persistency. Unless you log out, or unless your password changes, this will pre-fill the login data when restarting the program
/datum/computer_file/program/email_client/kill_program(forced = FALSE)
	if(TM)
		var/datum/tgui_module/email_client/TME = TM
		if(TME.current_account)
			stored_login = TME.stored_login
			stored_password = TME.stored_password
			TME.log_out()
		else
			stored_login = ""
			stored_password = ""
		update_email()
	. = ..()

/datum/computer_file/program/email_client/run_program()
	. = ..()

	if(TM)
		var/datum/tgui_module/email_client/TME = TM
		TME.stored_login = stored_login
		TME.stored_password = stored_password
		TME.log_in()
		TME.error = ""
		TME.check_for_new_messages(1)

/datum/computer_file/program/email_client/process_tick()
	..()
	var/datum/tgui_module/email_client/TME = TM
	if(istype(TME))
		TME.relayed_process(ntnet_speed)

		var/check_count = TME.check_for_new_messages()
		if(check_count)
			ui_header = "ntnrc_new.gif"
		else
			ui_header = "ntnrc_idle.gif"

/datum/computer_file/program/email_client/Destroy()
	// Disconnect from the email account
	stored_login =  ""
	update_email()
	return ..()

/datum/computer_file/program/email_client/proc/update_email()
	if(current_account)
		current_account.connected_clients -= src
		current_account = null

	if(stored_login)
		var/datum/computer_file/data/email_account/account = ntnet_global.find_email_by_login(stored_login)
		if(account && !account.suspended && account.password == stored_password)
			current_account = account
			current_account.connected_clients |= src

/datum/computer_file/program/email_client/Topic(href, href_list)
	// Note: We deliberately bypass ..() because we want to autolaunch ourselves
	if(href_list["chat_open"])
		if(computer.enabled && computer.screen_on && !computer.bsod)
			computer.run_program(filename)
			ui_interact(usr)
		else
			to_chat(usr, SPAN_WARNING("\The [computer] cannot open your email client. Is it powered off?"))

	. = ..()

/datum/computer_file/program/email_client/proc/mail_received(datum/computer_file/data/email_message/received_message)
	// If the client is currently running, sending notification is handled by /datum/tgui_module/email_client instead
	if(program_state != PROGRAM_STATE_KILLED)
		return

	// The app is not on a functioning disk, not in an MPC, or the MPC is not running
	if(!holder?.check_functionality() || !computer?.enabled)
		return

	var/mob/living/L = get(computer, /mob/living)
	if(L)
		var/open_app_link = "<a href='?src=\ref[src];chat_open=1'>Open Email Client</a>"
		received_message.notify_mob(L, computer, open_app_link)
