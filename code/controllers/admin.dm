// Clickable stat() button.
/obj/effect/statclick
	name = "Initializing..."
	var/target

INITIALIZE_IMMEDIATE(/obj/effect/statclick)

/obj/effect/statclick/Initialize(mapload, text, target)
	. = ..()
	name = text
	src.target = target
	if(istype(target, /datum)) //Harddel man bad
		RegisterSignal(target, COMSIG_PARENT_QDELETING, PROC_REF(cleanup))

/obj/effect/statclick/Destroy()
	target = null
	return ..()

/obj/effect/statclick/proc/cleanup()
	//SIGNAL_HANDLER
	qdel(src)

/obj/effect/statclick/proc/update(text)
	name = text
	return src

/obj/effect/statclick/debug
	var/class

/obj/effect/statclick/debug/Click()
	if(!usr.client.holder || !target)
		return
	if(!class)
		if(istype(target, /datum/controller/subsystem))
			class = "subsystem"
		else if(istype(target, /datum/controller))
			class = "controller"
		else if(istype(target, /datum))
			class = "datum"
		else
			class = "unknown"

	usr.client.debug_variables(target)
	message_admins("Admin [key_name_admin(usr)] is debugging the [target] [class].")


ADMIN_VERB_ADD(/client/proc/restart_controller, R_DEBUG, null)
// Debug verbs.
/client/proc/restart_controller(controller in list("Master", "Failsafe"))
	set category = "Debug"
	set name = "Restart Controller"
	set desc = "Restart one of the various periodic loop controllers for the game (be careful!)"

	if(!holder)
		return
	switch(controller)
		if("Master")
			Recreate_MC()
		if("Failsafe")
			new /datum/controller/failsafe()

	message_admins("Admin [key_name_admin(usr)] has restarted the [controller] controller.")

ADMIN_VERB_ADD(/client/proc/debug_controller, R_DEBUG, null)
/client/proc/debug_controller()
	set category = "Debug"
	set name = "Debug Controller"
	set desc = "Debug the various periodic loop controllers for the game (be careful!)"

	if(!holder)
		return

	var/list/controllers = list()
	var/list/controller_choices = list()

	for (var/datum/controller/controller in world)
		if (istype(controller, /datum/controller/subsystem))
			continue
		controllers["[controller] (controller.type)"] = controller //we use an associated list to ensure clients can't hold references to controllers
		controller_choices += "[controller] (controller.type)"

	var/datum/controller/controller_string = input("Select controller to debug", "Debug Controller") as null|anything in controller_choices
	var/datum/controller/controller = controllers[controller_string]

	if (!istype(controller))
		return
	debug_variables(controller)

	message_admins("Admin [key_name_admin(usr)] is debugging the [controller] controller.")

/proc/send_ahelp_to_irc(var/client/sender, var/client/recipient, var/message)
    // Send ahelp to IRC following the specified syntax
    // Adminhelp: ckey/(character) to ckey/(character): contents

    var/sender_ckey = sender ? sender.key : "Unknown"
    var/sender_char = "Unknown"
    if(sender && sender.mob && sender.mob.real_name)
        sender_char = sender.mob.real_name

    var/recipient_ckey = recipient ? recipient.key : "Admins"
    var/recipient_char = "Admin"
    if(recipient && recipient.mob && recipient.mob.real_name)
        recipient_char = recipient.mob.real_name

    var/irc_msg = "Adminhelp: [sender_ckey]/([sender_char]) to [recipient_ckey]/([recipient_char]): [message]"
    send2adminirc(irc_msg)

/proc/send_reply_to_irc(var/client/admin_sender, var/client/player_recipient, var/message)
    // Send admin reply to IRC with "Reply" prefix for bot parsing
    var/admin_ckey = admin_sender ? admin_sender.key : "Unknown"
    var/admin_char = "Admin"
    if(admin_sender && admin_sender.mob && admin_sender.mob.real_name)
        admin_char = admin_sender.mob.real_name

    var/player_ckey = player_recipient ? player_recipient.key : "Unknown"
    var/player_char = "Unknown"
    if(player_recipient && player_recipient.mob && player_recipient.mob.real_name)
        player_char = player_recipient.mob.real_name

    var/irc_msg = "Reply [admin_ckey]/([admin_char]) to [player_ckey]/([player_char]): [message]"
    send2adminirc(irc_msg)

/proc/process_all_ahelps(var/client/sender, var/message, var/client/admin_recipient = null)
    // Process and send every ahelp to IRC
    if(admin_recipient)
        // This is an admin responding to a player - use Reply format
        if(sender.holder && !admin_recipient.holder)
            send_reply_to_irc(sender, admin_recipient, message)
        // This is a player responding to an admin - use regular Adminhelp format
        else
            send_ahelp_to_irc(sender, admin_recipient, message)
    else
        // This is a player sending an adminhelp - use regular Adminhelp format
        send_ahelp_to_irc(sender, admin_recipient, message)

    // Also log to game logs
    if(admin_recipient)
        log_admin("AHELP RESPONSE: [key_name(sender)] to [key_name(admin_recipient)] - [message]")
    else
        log_admin("AHELP: [key_name(sender)] - [message]")
