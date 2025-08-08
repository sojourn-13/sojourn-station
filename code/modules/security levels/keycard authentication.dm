/obj/machinery/keycard_auth
	name = "keycard authentication device"
	desc = "This device is used to trigger various high security functions. It requires the simultaneous swipe of two authorized ID cards."
	icon = 'icons/obj/monitors.dmi'
	icon_state = "auth_off"
	var/active = 0 //This gets set to 1 on all devices except the one where the initial request was made.
	var/event = ""
	var/screen = 1
	var/confirmed = 0
	var/datum/announcement/priority/auth_announcement = new(do_log = 1, new_sound = sound('sound/misc/notice1.ogg'), do_newscast = 1)
	anchored = 1
	use_power = IDLE_POWER_USE
	idle_power_usage = 2
	active_power_usage = 6
	req_access = list(access_keycard_auth)

	var/static/list/ongoing_countdowns = list()
	var/static/list/initiator_card = list()
	var/static/next_countdown
	var/static/list/event_names = list(
		redalert = "red alert",
		pods = "spacecraft abandonment"
	)
	var/static/datum/announcement/priority/kcad_announcement = new(do_log = 1, new_sound = sound('sound/misc/notice1.ogg'), do_newscast = 1)

	// Global dual authentication variables - shared across all keycard auth devices
	var/static/list/global_auth_users = list()         // List of user details who have swiped their cards
	var/static/list/global_auth_devices = list()       // List of devices that have been used for auth
	var/static/global_auth_time_limit = 50             // 5 seconds (10 deciseconds per second)
	var/static/global_auth_timer = 0                   // Current timer for dual auth
	var/static/global_dual_auth_active = FALSE         // Whether dual auth is in progress
	var/static/global_pending_event = ""               // Event waiting for dual auth
	var/static/global_auth_initiator = null            // Device that started the auth process
	var/static/countdown = 100                         // Timer for countdowns
	var/static/cooldown = 600                          // Cooldown between events

/obj/machinery/keycard_auth/attack_ai(mob/user as mob)
	return

/obj/machinery/keycard_auth/inoperable(var/additional_flags = 0)
	return (stat & (BROKEN|additional_flags))

/obj/machinery/keycard_auth/attack_hand(mob/user)
	. = ..()
	if(.)
		return

	user.set_machine(src)
	nano_ui_interact(user)

/obj/machinery/keycard_auth/nano_ui_interact(mob/user, ui_key = "main", var/datum/nanoui/ui = null, var/force_open = NANOUI_FOCUS)
	var/data[0]
	var/decl/security_state/security_state = decls_repository.get_decl(GLOB.maps_data.security_state)

	data["seclevel"] = security_state.current_security_level.name
	data["emergencymaint"] = maint_all_access
	data["events"] = ongoing_countdowns
	data["oncooldown"] = next_countdown > world.time
	data["maint_all_access"] = maint_all_access

	// Add global dual auth status to UI data
	data["dual_auth_active"] = global_dual_auth_active
	data["auth_users_count"] = global_auth_users.len
	data["auth_timer"] = global_auth_timer
	data["pending_event"] = global_pending_event

	ui = SSnano.try_update_ui(user, src, ui_key, ui, data, force_open)
	if(!ui)
		ui = new(user, src, ui_key, "keycard authentication.tmpl", "Keycard Authentication Device", 440, 300)
		ui.set_initial_data(data)
		ui.open()
		ui.set_auto_update(1)

/obj/machinery/keycard_auth/Topic(href, href_list)
	if(..())
		return TRUE

	if(!allowed(usr))
		return TRUE

	if(href_list["start"])
		if(next_countdown > world.time)
			return TRUE
		var/event = href_list["start"]
		if(ongoing_countdowns[event])
			return

		// Start global dual authentication for regular keycard auth
		global_pending_event = event
		start_global_dual_auth(src)
		return TRUE

	if(href_list["cancel"])
		var/event = href_list["cancel"]
		if(!ongoing_countdowns[event])
			return
		kcad_announcement.Announce("[usr] has cancelled [event_names[event]] countdown.")
		deltimer(ongoing_countdowns[event])
		ongoing_countdowns -= event
		initiator_card -= event
	if(href_list["proceed"])
		var/event = href_list["proceed"]
		if(!ongoing_countdowns[event])
			return
		var/obj/item/card/id/id = usr.GetIdCard()
		if(initiator_card[event] == id)
			return
		kcad_announcement.Announce("[usr] has proceeded [event_names[event]] countdown.")
		countdown_finished(event)
	if(href_list["emergencymaint"])
		var/event = href_list["emergencymaint"]
		switch(event)
			if("grant")
				// Start global dual auth for maintenance access
				global_pending_event = "emergencymaint_grant"
				start_global_dual_auth(src)
			if("revoke")
				// Start global dual auth for maintenance revoke
				global_pending_event = "emergencymaint_revoke"
				start_global_dual_auth(src)
	playsound(usr.loc, 'sound/machines/button.ogg', 100, 1)
	return

/obj/machinery/keycard_auth/proc/countdown_finished(event)
	switch(event)
		if("redalert")
			var/decl/security_state/security_state = decls_repository.get_decl(GLOB.maps_data.security_state)
			security_state.set_security_level(security_state.high_security_level)
		if("pods")
			evacuation_controller.call_evacuation(null, TRUE)
	if(event)
		deltimer(ongoing_countdowns[event])
		ongoing_countdowns -= event
		initiator_card -= event

// Global dual authentication support for all keycard auth devices
/obj/machinery/keycard_auth/attackby(obj/item/W as obj, mob/user as mob)
	if(istype(W, /obj/item/card/id))
		// Check for any active global dual authentication (not just initiated by this device)
		if(global_dual_auth_active && global_auth_timer > 0)
			var/obj/item/card/id/ID = W
			if(!ID.access || !(access_keycard_auth in ID.access))
				to_chat(user, "<span class='warning'>Access denied. High-level authorization required.</span>")
				return

			var/user_name = ID.registered_name
			if(!user_name)
				user_name = user.real_name

			// Check if this user already authenticated
			var/user_found = FALSE
			for(var/list/user_info in global_auth_users)
				if(user_info["ckey"] == user.ckey)
					user_found = TRUE
					break
			if(user_found)
				to_chat(user, "<span class='warning'>You have already authenticated for this event.</span>")
				return

			// Check if this device has already been used
			if(src in global_auth_devices)
				to_chat(user, "<span class='warning'>This device has already been used for authentication. Use a different keycard authenticator.</span>")
				return

			// Add user and device to authenticated lists with detailed information
			var/list/user_details = list(
				"ckey" = user.ckey,
				"real_name" = user.real_name,
				"id_name" = user_name,
				"id_assignment" = ID.assignment ? ID.assignment : "Unknown"
			)
			global_auth_users += list(user_details)
			global_auth_devices += src
			playsound(src, 'sound/machines/twobeep.ogg', 50, 1)
			to_chat(user, "<span class='notice'>Authentication accepted ([global_auth_users.len]/2).</span>")

			if(global_auth_users.len == 1)
				visible_message("<span class='notice'>[user] swipes their card on [src]. Waiting for second authorization on a different device...</span>")
				to_chat(world, "<span class='notice'>Dual keycard authentication in progress. First authorization received. Second authorization required on a different keycard authenticator within [global_auth_timer/10] seconds.</span>")
			else if(global_auth_users.len >= 2)
				visible_message("<span class='notice'>[user] provides the second authorization on [src]. Dual authentication complete!</span>")
				// Determine which type of authentication completion to use
				if(istype(global_auth_initiator, /obj/machinery/keycard_auth/enhanced))
					var/obj/machinery/keycard_auth/enhanced/enhanced_device = global_auth_initiator
					enhanced_device.execute_enhanced_authenticated_event()
				else
					execute_global_authenticated_event()
		else
			to_chat(user, "<span class='warning'>Authentication not currently active.</span>")
		return
	..()

/obj/machinery/keycard_auth/proc/start_global_dual_auth(var/obj/machinery/keycard_auth/initiator)
	global_auth_users = list()
	global_auth_devices = list()
	global_auth_timer = global_auth_time_limit
	global_dual_auth_active = TRUE
	global_auth_initiator = initiator

	to_chat(world, "<span class='notice'>Dual keycard authentication required for [global_pending_event]. Please swipe two authorized cards on different keycard authenticators within 5 seconds.</span>")

	spawn()
		while(global_auth_timer > 0 && global_dual_auth_active)
			sleep(1)
			global_auth_timer--

		if(global_dual_auth_active && global_auth_users.len < 2)
			to_chat(world, "<span class='warning'>Dual authentication timeout. Authentication failed.</span>")
			reset_global_auth()

/obj/machinery/keycard_auth/proc/reset_global_auth()
	global_auth_users = list()
	global_auth_devices = list()
	global_auth_timer = 0
	global_dual_auth_active = FALSE
	global_pending_event = ""
	global_auth_initiator = null

/obj/machinery/keycard_auth/proc/execute_global_authenticated_event()
	global_dual_auth_active = FALSE
	spawn(5) // Small delay for dramatic effect

		// Execute the pending event after successful dual auth
		switch(global_pending_event)
			if("redalert")
				kcad_announcement.Announce("Dual authentication successful on separate devices. Initiating [event_names[global_pending_event]] countdown.")
				ongoing_countdowns[global_pending_event] = addtimer(CALLBACK(global_auth_initiator, PROC_REF(countdown_finished), global_pending_event), countdown, TIMER_UNIQUE | TIMER_STOPPABLE)
				next_countdown = world.time + cooldown
			if("pods")
				kcad_announcement.Announce("Dual authentication successful on separate devices. Initiating [event_names[global_pending_event]] countdown.")
				ongoing_countdowns[global_pending_event] = addtimer(CALLBACK(global_auth_initiator, PROC_REF(countdown_finished), global_pending_event), countdown, TIMER_UNIQUE | TIMER_STOPPABLE)
				next_countdown = world.time + cooldown
			if("emergencymaint_grant")
				make_maint_all_access()
				kcad_announcement.Announce("Dual authentication successful on separate devices. Emergency maintenance access granted.")
			if("emergencymaint_revoke")
				revoke_maint_all_access()
				kcad_announcement.Announce("Dual authentication successful on separate devices. Emergency maintenance access revoked.")

		sleep(10)
		reset_global_auth()

var/global/maint_all_access = 0

/proc/make_maint_all_access()
	maint_all_access = 1
	to_chat(world, "<font size=4 color='red'>Attention!</font>")
	to_chat(world, "<font color='red'>The maintenance access requirement has been revoked on all airlocks.</font>")

/proc/revoke_maint_all_access()
	maint_all_access = 0
	to_chat(world, "<font size=4 color='red'>Attention!</font>")
	to_chat(world, "<font color='red'>The maintenance access requirement has been readded on all maintenance airlocks.</font>")

/obj/machinery/door/airlock/allowed(mob/M)
	if(maint_all_access && src.check_access_list(list(access_maint_tunnels)))
		return 1
	return ..(M)

//====Enhanced keycard authentication device====
/obj/machinery/keycard_auth/enhanced
	name = "enhanced keycard authentication device"
	desc = "This device is used to trigger high security events. It requires the simultaneous swipe of two high-level ID cards on different devices."

/obj/machinery/keycard_auth/enhanced/Process()
	if(global_dual_auth_active && global_auth_timer > 0)
		// Update the UI for anyone viewing this device
		for(var/mob/user in range(3, src))
			if(user.machine == src && user.client)
				attack_hand(user)

/obj/machinery/keycard_auth/enhanced/attack_hand(mob/user)
	if(inoperable())
		return
	user.set_machine(src)

	var/list/dat = list()

	dat += "<h1>Enhanced Keycard Authentication Device</h1>"

	dat += "This device is used to trigger some high security events. It requires the simultaneous swipe of two high-level ID cards on different devices."
	dat += "<br><hr><br>"

	// Show global dual authentication status
	if(global_dual_auth_active && global_auth_timer > 0)
		dat += "<div style='color: yellow; font-weight: bold;'>DUAL AUTHENTICATION IN PROGRESS</div>"
		dat += "Users authenticated: [global_auth_users.len]/2<br>"
		dat += "Devices used: [global_auth_devices.len]/2<br>"
		dat += "Time remaining: [global_auth_timer/10] seconds<br>"
		if(global_auth_users.len > 0)
			dat += "Waiting for second ID swipe on a different device...<br>"
		dat += "<br>"

	if(screen == 1)
		dat += "Select an event to trigger:<br>"

		var/decl/security_state/security_state = decls_repository.get_decl(GLOB.maps_data.security_state)
		if(security_state.current_security_level == security_state.severe_security_level)
			dat += "Cannot modify the alert level at this time: [security_state.severe_security_level.name] engaged.<br>"
		else
			if(security_state.current_security_level == security_state.high_security_level)
				dat += "<A href='?src=\ref[src];triggerevent=Revert alert'>Disengage [security_state.high_security_level.name]</A><br>"
			else
				dat += "<A href='?src=\ref[src];triggerevent=Red alert'>Engage [security_state.high_security_level.name]</A><br>"

		dat += "<A href='?src=\ref[src];triggerevent=Grant Emergency Maintenance Access'>Grant Emergency Maintenance Access</A><br>"
		dat += "<A href='?src=\ref[src];triggerevent=Revoke Emergency Maintenance Access'>Revoke Emergency Maintenance Access</A><br>"
		dat += "<A href='?src=\ref[src];triggerevent=Grant Nuclear Authorization Code'>Grant Nuclear Authorization Code</A><br>"
		dat += "<a href='?src=\ref[src];triggerevent=Evacuate'>Initiate Evacuation Procedures</a><br>"
	if(screen == 2)
		if(global_dual_auth_active && global_auth_timer > 0)
			dat += "Dual authentication in progress...<br>"
			dat += "Users authenticated: [global_auth_users.len]/2<br>"
			dat += "Devices used: [global_auth_devices.len]/2<br>"
			dat += "Time remaining: [global_auth_timer/10] seconds<br>"
			if(global_auth_users.len > 0)
				dat += "Waiting for second ID swipe on a different device...<br>"
			dat += "Please swipe your card to authorize the following event: <b>[event]</b><br>"
		else if(global_auth_users.len >= 2)
			dat += "Authentication complete! Executing: <b>[event]</b><br>"
		else
			dat += "Please swipe your card to authorize the following event: <b>[event]</b><br>"
		dat += "<p><A href='?src=\ref[src];reset=1'>Back</A>"

	// Update existing browser or create new one
	var/datum/browser/popup = new(user, "kad_window", "Enhanced Keycard Authentication Device", 500, 250)
	popup.set_content(jointext(dat, ""))
	popup.open()
	return

/obj/machinery/keycard_auth/enhanced/Topic(href, href_list)
	if(..())
		return

	if(href_list["triggerevent"])
		event = href_list["triggerevent"]
		screen = 2
		start_enhanced_dual_auth()

	if(href_list["reset"])
		screen = 1
		event = ""
		reset_global_auth()

	src.attack_hand(usr)

/obj/machinery/keycard_auth/enhanced/attackby(obj/item/W as obj, mob/user as mob)
	if(istype(W, /obj/item/card/id))
		// Check for active dual authentication regardless of screen state
		if(global_dual_auth_active && global_auth_timer > 0)
			var/obj/item/card/id/ID = W
			if(!ID.access || !(access_keycard_auth in ID.access))
				to_chat(user, "<span class='warning'>Access denied. High-level authorization required.</span>")
				return

			var/user_name = ID.registered_name
			if(!user_name)
				user_name = user.real_name

			// Check if this user already authenticated
			var/user_found = FALSE
			for(var/list/user_info in global_auth_users)
				if(user_info["ckey"] == user.ckey)
					user_found = TRUE
					break
			if(user_found)
				to_chat(user, "<span class='warning'>You have already authenticated for this event.</span>")
				return

			// Check if this device has already been used
			if(src in global_auth_devices)
				to_chat(user, "<span class='warning'>This device has already been used for authentication. Use a different keycard authenticator.</span>")
				return

			// Add user and device to authenticated lists with detailed information
			var/list/user_details = list(
				"ckey" = user.ckey,
				"real_name" = user.real_name,
				"id_name" = user_name,
				"id_assignment" = ID.assignment ? ID.assignment : "Unknown"
			)
			global_auth_users += list(user_details)
			global_auth_devices += src
			playsound(src, 'sound/machines/twobeep.ogg', 50, 1)
			to_chat(user, "<span class='notice'>Authentication accepted ([global_auth_users.len]/2).</span>")

			if(global_auth_users.len == 1)
				visible_message("<span class='notice'>[user] swipes their card on [src]. Waiting for second authorization on a different device...</span>")
			else if(global_auth_users.len >= 2)
				visible_message("<span class='notice'>[user] provides the second authorization on [src]. Dual authentication complete!</span>")
				// Determine which type of authentication completion to use
				if(istype(global_auth_initiator, /obj/machinery/keycard_auth/enhanced))
					var/obj/machinery/keycard_auth/enhanced/enhanced_device = global_auth_initiator
					enhanced_device.execute_enhanced_authenticated_event()
				else
					execute_global_authenticated_event()
		else
			to_chat(user, "<span class='warning'>Authentication not currently active.</span>")
		return
	..()

/obj/machinery/keycard_auth/enhanced/proc/start_enhanced_dual_auth()
	global_auth_users = list()
	global_auth_devices = list()
	global_auth_timer = global_auth_time_limit
	global_dual_auth_active = TRUE
	global_pending_event = event
	global_auth_initiator = src

	to_chat(world, "<span class='notice'>Enhanced dual keycard authentication required for [event]. Please swipe two authorized cards on different keycard authenticators within 5 seconds.</span>")

	spawn()
		while(global_auth_timer > 0 && global_dual_auth_active)
			sleep(1)
			global_auth_timer--

		if(global_dual_auth_active && global_auth_users.len < 2)
			to_chat(world, "<span class='warning'>Enhanced dual authentication timeout. Authentication failed.</span>")
			reset_global_auth()

/obj/machinery/keycard_auth/enhanced/proc/execute_enhanced_authenticated_event()
	global_dual_auth_active = FALSE
	spawn(5) // Small delay for dramatic effect
		trigger_event()
		sleep(10)
		reset_global_auth()

/obj/machinery/keycard_auth/enhanced/proc/trigger_event()
	// Make announcement for ALL events with dual authentication
	var/datum/announcement/priority/security/auth_announcement = new(do_log = 1, do_newscast = 1, new_sound = sound('sound/misc/notice1.ogg'))

	switch(event)
		if("Red alert")
			var/decl/security_state/security_state = decls_repository.get_decl(GLOB.maps_data.security_state)
			security_state.set_security_level(security_state.high_security_level)
			auth_announcement.Announce("SECURITY ALERT: Red alert status has been activated via dual keycard authentication on separate devices.", "Keycard Authentication Control")

		if("Revert alert")
			var/decl/security_state/security_state = decls_repository.get_decl(GLOB.maps_data.security_state)
			if(security_state.stored_security_level)
				security_state.set_security_level(security_state.stored_security_level)
			else
				// Fallback to first security level if no stored level
				security_state.set_security_level(security_state.all_security_levels[1])
			auth_announcement.Announce("SECURITY UPDATE: Alert status has been reverted via dual keycard authentication on separate devices.", "Keycard Authentication Control")

		if("Grant Emergency Maintenance Access")
			make_maint_all_access()
			auth_announcement.Announce("MAINTENANCE ALERT: Emergency maintenance access has been granted to all personnel via dual keycard authentication on separate devices. All maintenance areas are now accessible.", "Keycard Authentication Control")

		if("Revoke Emergency Maintenance Access")
			revoke_maint_all_access()
			auth_announcement.Announce("MAINTENANCE ALERT: Emergency maintenance access has been revoked via dual keycard authentication on separate devices. Normal access restrictions are now in effect.", "Keycard Authentication Control")

		if("Grant Nuclear Authorization Code")
			// Disarm nuclear safeties globally
			for(var/obj/machinery/self_destruct/SD in world)
				SD.safeties_disarmed = TRUE

			// Trigger DELTA alert when safeties are disarmed - this is the critical change
			var/decl/security_state/security_state = decls_repository.get_decl(GLOB.maps_data.security_state)
			security_state.set_security_level(security_state.severe_security_level)

			// Make announcement about safeties being disarmed using the correct global object
			var/datum/announcement/priority/security/nuke_announcement = new(do_log = 1, do_newscast = 1, new_sound = sound('sound/effects/siren.ogg'))
			nuke_announcement.Announce("CRITICAL ALERT: Nuclear weapon safeties have been disarmed via dual keycard authentication on separate devices. All personnel are advised that the station is now in a state of extreme emergency. DELTA security protocols are now in effect. This is not a drill.", "Nuclear Safety Control")

			// Discord notification for nuclear authorization
			var/user_details = ""
			for(var/list/user_info in global_auth_users)
				if(user_details != "")
					user_details += ", "
				user_details += "[user_info["real_name"]] ([user_info["ckey"]]) - [user_info["id_name"]] ([user_info["id_assignment"]])"
			send2adminirc("nuclear authentication device used | Users: [user_details] | Alert Level: [security_state.current_security_level.name]")

			var/obj/machinery/nuclearbomb/nuke = locate(/obj/machinery/nuclearbomb/station) in world
			if(nuke)
				to_chat(usr, "The nuclear authorization code is [nuke.r_code]")
			else
				to_chat(usr, "No self destruct terminal found.")

		if("Evacuate")
			evacuation_controller.call_evacuation(null, TRUE)
			auth_announcement.Announce("EVACUATION ALERT: Emergency evacuation procedures have been initiated via dual keycard authentication on separate devices. All personnel must proceed to evacuation points immediately.", "Emergency Control")

			// Discord notification for evacuation
			var/decl/security_state/security_state = decls_repository.get_decl(GLOB.maps_data.security_state)
			var/user_details = ""
			for(var/list/user_info in global_auth_users)
				if(user_details != "")
					user_details += ", "
				user_details += "[user_info["real_name"]] ([user_info["ckey"]]) - [user_info["id_name"]] ([user_info["id_assignment"]])"
			send2adminirc("emergency evacuation triggered | Users: [user_details] | Alert Level: [security_state.current_security_level.name]")

// These procs need to access the static variables from the main class
/proc/check_global_dual_auth_status()
	// Check if ANY keycard auth device has active dual authentication
	for(var/obj/machinery/keycard_auth/KAD in world)
		if(KAD.global_dual_auth_active && KAD.global_auth_timer > 0)
			return TRUE
	return FALSE

// Global proc to start dual auth requirement for nuclear systems
/proc/start_global_dual_auth_requirement()
	// This would be called when attempting to access nuclear systems
	// Returns TRUE if dual auth is in progress for nuclear access
	return check_global_dual_auth_status()
