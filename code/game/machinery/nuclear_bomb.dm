var/bomb_set

/obj/machinery/nuclearbomb
	name = "\improper nuclear fission explosive"
	desc = "This is probably dangerous."
	icon = 'icons/obj/stationobjs.dmi'
	icon_state = "nuclearbomb0"
	density = 1
	var/deployable = 0
	var/extended = 0
	var/lighthack = 0
	var/timeleft = 120
	var/timing = 0
	var/r_code = "ADMIN"
	var/code = ""
	var/yes_code = 0
	var/safety = 1

	// Nuclear sequence timing variables
	var/abort_window_time = 150  // 2 minutes and 30 seconds (150 seconds) to abort
	var/evacuation_time = 150    // 2 minutes and 30 seconds for evacuation phase
	var/final_countdown_time = 300  // 5 minutes final countdown to detonation
	var/sequence_stage = 0       // 0 = not started, 1 = abort window, 2 = evacuation, 3 = final countdown
	var/evacuation_called = FALSE
	var/sound_timer = 0          // Timer for countdown sound effects
	var/explosion_timer = 0      // Timer for random explosions during final countdown
	var/alarm_loop_timer = 0     // Timer for repeating alarm loop
	var/abort_warning_played = FALSE  // Track if 1-minute abort warning has been played
	var/obj/item/disk/nuclear/auth = null
	var/removal_stage = 0 // 0 is no removal, 1 is covers removed, 2 is covers open, 3 is sealant open, 4 is unwrenched, 5 is removed from bolts.
	var/lastentered
	use_power = NO_POWER_USE
	unacidable = 1
	var/previous_level = ""
	var/datum/wires/nuclearbomb/wires = null
	var/decl/security_level/original_level  // Store original security level

	var/eris_ship_bomb = FALSE           // if TRUE (1 in map editor), then Heads will get parts of code for this bomb. Obviously used in map editor. Single mapped bomb supported.

/obj/machinery/nuclearbomb/New()
	..()
	if(eris_ship_bomb)
		r_code = "[rand(100000, 999999)]" // each time new Head spawns, s/he gets 2 numbers of code.
	else                                  // i decided not to touch normal bombs code length.
		r_code = "[rand(10000, 99999.0)]" //Creates a random code upon object spawn.
	wires = new/datum/wires/nuclearbomb(src)
	update_icon() // Ensure light is set on spawn

/obj/machinery/nuclearbomb/Initialize()
	. = ..()
	if(eris_ship_bomb) // this is in initialize because there is no ticker at world init.
		SSticker.ship_nuke_code = r_code // even if this bomb stops to exist, heads of staff still gets this password, so it won't affect meta or whatever.

/obj/machinery/nuclearbomb/Destroy()
	qdel(wires)
	wires = null
	return ..()

/obj/machinery/nuclearbomb/Process()
	if (src.timing)
		src.timeleft = max(timeleft - 2, 0) // 2 seconds per process()

		// Play a beep sound every countdown tick
		playsound(src, 'sound/effects/beep-countdown.mp3', 100, 1)

		alarm_loop_timer += 2
		if(alarm_loop_timer >= 510) // 255 seconds = 4:15 minutes (510 deciseconds with 2-second increments)
			world << sound('sound/effects/2.mp3', volume = 75)
			alarm_loop_timer = 0

		// Repeating alarm loop during active sequence (4:15 minute sound)
		if(sequence_stage >= 1) // During any active sequence stage

		// Light pulsing effect for urgent states
		if(sequence_stage >= 2) // During evacuation and final countdown
			if(sound_timer % 20 == 0) // Pulse every 2 seconds
				var/current_power = light_power
				set_light(l_power = current_power * 1.5) // Brighten
				spawn(10) // After 1 second
					set_light(l_power = current_power) // Return to normal

		// Handle the multi-stage nuclear sequence
		if(sequence_stage == 1) // Abort window phase
			// Check for 1-minute abort warning
			if(timeleft <= 0)
				// Abort window expired, move to evacuation phase
				sequence_stage = 2
				timeleft = evacuation_time
				trigger_evacuation()
		else if(sequence_stage == 2) // Evacuation phase
			if(timeleft <= 0)
				// Evacuation time expired, move to final countdown
				sequence_stage = 3
				timeleft = final_countdown_time

				announce_final_countdown()
		else if(sequence_stage == 3) // Final countdown phase
			// Check for 1-minute abort warning
			if(timeleft <= 60 && !abort_warning_played)
				abort_warning_played = TRUE
				world << sound('sound/effects/3.wav', volume = 75)
				command_announcement.Announce("ATTENTION. EMERGENCY. All personnel. T-Minus one minute to detonation. T-Minus one minute. You now have one minute to reach minimum safe distance.", "Emergency Announcement")

			// Faster random explosions during final countdown
			explosion_timer += 2
			if(explosion_timer >= 10) // Every 5 seconds (10 deciseconds) - much faster
				trigger_random_explosion()
				explosion_timer = 0

			if(timeleft <= 0)
				spawn
					explode()
		else // Original behavior for non-sequenced bombs
			if (timeleft <= 0)
				spawn
					explode()

		SSnano.update_uis(src)
	return

/obj/machinery/nuclearbomb/attackby(obj/item/I, mob/user, params)
	src.add_fingerprint(user)

	var/list/usable_qualities = list(QUALITY_SCREW_DRIVING)
	if(anchored && (removal_stage == 0 || removal_stage == 2))
		usable_qualities.Add(QUALITY_WELDING)
	if(anchored && (removal_stage == 3))
		usable_qualities.Add(QUALITY_BOLT_TURNING)
	if(anchored && (removal_stage == 1 || removal_stage == 4))
		usable_qualities.Add(QUALITY_PRYING)

	var/tool_type = I.get_tool_type(user, usable_qualities, src)
	switch(tool_type)

		if(QUALITY_SCREW_DRIVING)
			if(I.use_tool(user, src, WORKTIME_FAST, tool_type, FAILCHANCE_VERY_EASY, required_stat = STAT_MEC))
				if (src.auth)
					if (panel_open == 0)
						panel_open = 1
						add_overlay(image(icon, "npanel_open"))
						to_chat(user, SPAN_NOTICE("You unscrew the control panel of [src]."))
					else
						panel_open = 0
						cut_overlay(image(icon, "npanel_open"))
						to_chat(user, SPAN_NOTICE("You screw the control panel of [src] back on."))
				else
					if (panel_open == 0)
						to_chat(user, SPAN_NOTICE("\The [src] emits a buzzing noise, the panel staying locked in."))
					if (panel_open == 1)
						panel_open = 0
						cut_overlay(image(icon, "npanel_open"))
						to_chat(user, SPAN_NOTICE("You screw the control panel of \the [src] back on."))
						playsound(src, 'sound/items/Screwdriver.ogg', 50, 1)
					flick("nuclearbombc", src)
				return
			return

		if(QUALITY_WELDING)
			if(anchored && (removal_stage == 0 || removal_stage == 2))
				if(I.use_tool(user, src, WORKTIME_FAST, tool_type, FAILCHANCE_VERY_EASY, required_stat = STAT_MEC))
					if(removal_stage == 0)
						user.visible_message("\The [user] cuts through the bolt covers on \the [src].", "You cut through the bolt cover.")
						removal_stage = 1
						return
					if(removal_stage == 2)
						user.visible_message("\The [user] cuts apart the anchoring system sealant on \the [src].", "You cut apart the anchoring system's sealant.")
						removal_stage = 3
						return
			return

		if(QUALITY_BOLT_TURNING)
			if(anchored && (removal_stage == 3))
				if(I.use_tool(user, src, WORKTIME_FAST, tool_type, FAILCHANCE_VERY_EASY, required_stat = STAT_MEC))
					user.visible_message("[user] unwrenches the anchoring bolts on [src].", "You unwrench the anchoring bolts.")
					removal_stage = 4
					return
			return

		if(QUALITY_PRYING)
			if(anchored && (removal_stage == 1 || removal_stage == 4))
				if(I.use_tool(user, src, WORKTIME_FAST, tool_type, FAILCHANCE_VERY_EASY, required_stat = STAT_ROB))
					if(removal_stage == 1)
						user.visible_message("\The [user] forces open the bolt covers on \the [src].", "You force open the bolt covers.")
						removal_stage = 2
						return
					if(removal_stage == 4)
						user.visible_message("\The [user] crowbars \the [src] off of the anchors. It can now be moved.", "You jam the crowbar under the nuclear device and lift it off its anchors. You can now move it!")
						anchored = 0
						removal_stage = 5
						return
			return

		if(ABORT_CHECK)
			return

	if (panel_open && (istype(I, /obj/item/tool)))
		return attack_hand(user)

	if (src.extended)
		if (istype(I, /obj/item/disk/nuclear))
			usr.drop_item()
			I.loc = src
			src.auth = I
			src.add_fingerprint(user)
			return attack_hand(user)

	..()

/obj/machinery/nuclearbomb/attack_ghost(mob/user as mob)
	attack_hand(user)

/obj/machinery/nuclearbomb/attack_hand(mob/user as mob)
	if (extended)
		if (panel_open)
			wires.Interact(user)
		else
			nano_ui_interact(user)
	else if (deployable)
		if(removal_stage < 5)
			src.anchored = 1
			visible_message(SPAN_WARNING("With a steely snap, bolts slide out of [src] and anchor it to the flooring!"))
		else
			visible_message(SPAN_WARNING("\The [src] makes a highly unpleasant crunching noise. It looks like the anchoring bolts have been cut."))
		extended = 1
		if(!src.lighthack)
			flick("nuclearbombc", src)
			update_icon()
	return

/obj/machinery/nuclearbomb/nano_ui_interact(mob/user, ui_key = "main", var/datum/nanoui/ui = null, var/force_open = NANOUI_FOCUS)
	var/data[0]
	data["hacking"] = 0
	data["auth"] = is_auth(user)
	if (is_auth(user))
		if (yes_code)
			data["authstatus"] = timing ? "Functional/Set" : "Functional"
		else
			data["authstatus"] = "Auth. S2"
	else
		if (timing)
			data["authstatus"] = "Set"
		else
			data["authstatus"] = "Auth. S1"
	data["safe"] = safety ? "Safe" : "Engaged"
	data["time"] = timeleft
	data["timer"] = timing
	data["safety"] = safety
	data["anchored"] = anchored
	data["yescode"] = yes_code
	data["message"] = "AUTH"

	// Add sequence stage information
	switch(sequence_stage)
		if(0)
			data["sequence_stage"] = "Standby"
			icon_state = "idle"
		if(1)
			data["sequence_stage"] = "Abort Window"
			icon_state = "greenlight"
		if(2)
			data["sequence_stage"] = "Evacuation Phase"
			icon_state = "urgent"
		if(3)
			icon_state = "exploding"
			data["sequence_stage"] = "Final Countdown"
	data["sequence_stage_num"] = sequence_stage
	data["can_abort"] = (sequence_stage == 1 || sequence_stage == 2) // Can abort during abort window and evacuation phase
	data["interface_locked"] = (sequence_stage >= 3) // Lock interface only during final countdown
	if (is_auth(user))
		data["message"] = code
		if (yes_code)
			data["message"] = "*****"

	ui = SSnano.try_update_ui(user, src, ui_key, ui, data, force_open)
	if (!ui)
		ui = new(user, src, ui_key, "nuclear_bomb.tmpl", "Nuke Control Panel", 300, 510)
		ui.set_initial_data(data)
		ui.open()
		ui.set_auto_update(1)

/obj/machinery/nuclearbomb/verb/toggle_deployable()
	set category = "Object"
	set name = "Toggle Deployable"
	set src in oview(1)

	if(usr.incapacitated())
		return

	if (src.deployable)
		to_chat(usr, SPAN_WARNING("You close several panels to make [src] undeployable."))
		src.deployable = 0
	else
		to_chat(usr, SPAN_WARNING("You adjust some panels to make [src] deployable."))
		src.deployable = 1
	return

/obj/machinery/nuclearbomb/verb/admin_initiate_countdown()
	set name = "Admin: Initiate Nuclear Countdown"
	set category = "Admin"
	set desc = "Manually start the nuclear self-destruct sequence"

	if(!check_rights(R_ADMIN))
		return

	src.admin_initiate_countdown_proc()

/obj/machinery/nuclearbomb/proc/is_auth(var/mob/user)
	if(auth)
		return 1
	if(isAdminGhostAI(user))
		return 1
	return 0

/obj/machinery/nuclearbomb/Topic(href, href_list)
	if(..())
		return 1

	if (href_list["auth"])
		if (auth)
			auth.loc = loc
			yes_code = 0
			auth = null
		else
			var/obj/item/I = usr.get_active_hand()
			if (istype(I, /obj/item/disk/nuclear))
				usr.drop_item()
				I.loc = src
				auth = I
	if (is_auth(usr))
		// Check if interface is locked (during final countdown only)
		if(sequence_stage >= 3)
			to_chat(usr, SPAN_WARNING("Interface locked. Nuclear sequence cannot be modified during final countdown phase."))
			SSnano.update_uis(src)
			return

		if (href_list["type"])
			if (href_list["type"] == "E")
				if (code == r_code)
					yes_code = 1
					code = null
				else
					code = "ERROR"
			else
				if (href_list["type"] == "R")
					yes_code = 0
					code = null
				else
					if(code == "ERROR") // for codes with 6 digits or more, it will look awkward when user enters 8 and sees ERROR8, -
						SSnano.update_uis(src)
						return // - so we force user to press R before entering new code as it was with 5-digit codes.
					lastentered = text("[]", href_list["type"])
					if (text2num(lastentered) == null)
						var/turf/LOC = get_turf(usr)
						message_admins("[key_name_admin(usr)] tried to exploit a nuclear bomb by entering non-numerical codes: <a href='?_src_=vars;Vars=\ref[src]'>[lastentered]</a>! ([LOC ? "<a href='?_src_=holder;adminplayerobservecoodjump=1;X=[LOC.x];Y=[LOC.y];Z=[LOC.z]'>JMP</a>" : "null"])", 0)
						log_admin("EXPLOIT: [key_name(usr)] tried to exploit a nuclear bomb by entering non-numerical codes: [lastentered]!")
					else
						code += lastentered
						if (length(code) > length(r_code))
							code = "ERROR"

		// Handle abort button - accessible with nuclear disk regardless of code entry
		if (href_list["abort"])
			if(sequence_stage >= 3)
				to_chat(usr, SPAN_WARNING("Final countdown has begun - abort is no longer possible. Random explosions will begin shortly."))
			else if(!timing)
				to_chat(usr, SPAN_WARNING("No nuclear sequence is currently active."))
			else
				// Abort the sequence
				if(abort_nuclear_sequence())
					to_chat(usr, SPAN_NOTICE("Nuclear sequence aborted successfully."))
					log_and_message_admins("aborted a nuclear bomb sequence")
				else
					to_chat(usr, SPAN_WARNING("Unable to abort nuclear sequence at this time."))
			SSnano.update_uis(src)
			return

		if (yes_code)
			if (href_list["time"])
				var/time = text2num(href_list["time"])
				timeleft += time
				timeleft = CLAMP(timeleft, 120, 600)
			if (href_list["timer"])
				if (timing == -1)
					SSnano.update_uis(src)
					return
				if (!anchored)
					to_chat(usr, SPAN_WARNING("\The [src] needs to be anchored."))
					SSnano.update_uis(src)
					return
				if (safety)
					to_chat(usr, SPAN_WARNING("The safety is still on."))
					SSnano.update_uis(src)
					return
				if (wires.IsIndexCut(NUCLEARBOMB_WIRE_TIMING))
					to_chat(usr, SPAN_WARNING("Nothing happens, something might be wrong with the wiring."))
					SSnano.update_uis(src)
					return

				if (!timing && !safety)
					start_nuclear_sequence()
					log_and_message_admins("engaged a nuclear bomb")
					bomb_set++ //There can still be issues with this resetting when there are multiple bombs. Not a big deal though for Nuke/N
					update_icon()
				else
					secure_device()
			if (href_list["safety"])
				if (wires.IsIndexCut(NUCLEARBOMB_WIRE_SAFETY))
					to_chat(usr, SPAN_WARNING("Nothing happens, something might be wrong with the wiring."))
					SSnano.update_uis(src)
					return

				var/old_safety = safety
				safety = !safety

				if(safety && !old_safety && timing)
					// Safety was re-engaged during active countdown - abort sequence
					to_chat(usr, SPAN_NOTICE("Safety re-engaged. Nuclear sequence automatically aborted."))
					if(abort_nuclear_sequence())
						log_and_message_admins("aborted a nuclear bomb sequence by re-engaging safety")
					else
						secure_device()
				else if(safety)
					secure_device()
			if (href_list["anchor"])
				if(removal_stage == 5)
					anchored = 0
					visible_message(SPAN_WARNING("\The [src] makes a highly unpleasant crunching noise. It looks like the anchoring bolts have been cut."))
					SSnano.update_uis(src)
					return

				if(!isinspace())
					// Can only anchor, not unanchor - nuclear bombs should stay secured
					if(!anchored)
						anchored = 1
						visible_message(SPAN_WARNING("With a steely snap, bolts slide out of [src] and anchor it to the flooring."))
					else
						to_chat(usr, SPAN_WARNING("The nuclear device is permanently anchored and cannot be moved."))
				else
					to_chat(usr, SPAN_WARNING("There is nothing to anchor to!"))

	SSnano.update_uis(src)

/obj/machinery/nuclearbomb/proc/secure_device()
	if(timing <= 0)
		return

	bomb_set--
	timing = 0
	sound_timer = 0  // Reset sound timer when securing device
	explosion_timer = 0  // Reset explosion timer when securing device
	timeleft = CLAMP(timeleft, 120, 600)
	update_icon()

/obj/machinery/nuclearbomb/ex_act(severity)
	return

#define NUKERANGE 80
/obj/machinery/nuclearbomb/proc/explode()
	if (src.safety)
		timing = 0
		return
	src.timing = -1
	src.yes_code = 0
	src.safety = 1
	update_icon()
	world << sound('sound/machines/Alarm.ogg', volume = 75)
	SSticker.nuke_in_progress = TRUE
	sleep(100)

	var/off_station = 0
	var/turf/bomb_location = get_turf(src)
	var/list/map_z_levels = list()

	// Get all z-levels that belong to the same map as the bomb
	if(bomb_location)
		// Find all z-levels that are part of the same station/map
		for(var/z_level = 1; z_level <= world.maxz; z_level++)
			if(isStationLevel(z_level))
				map_z_levels += z_level

	// Check if bomb is within the map's main area on any relevant z-level
	if(bomb_location && (bomb_location.z in map_z_levels))
		// Check if it's within the main station area (adjust coordinates as needed for your map)
		if( (bomb_location.x < (128-NUKERANGE)) || (bomb_location.x > (128+NUKERANGE)) || (bomb_location.y < (128-NUKERANGE)) || (bomb_location.y > (128+NUKERANGE)) )
			off_station = 1
	else
		off_station = 2

	if(get_storyteller())
		SSticker.nuke_in_progress = FALSE
		if(off_station == 1)
			to_chat(world, "<b>A nuclear device was set off, but the explosion was out of reach of the main colony area!</b>")
		else if(off_station == 2)
			to_chat(world, "<b>A nuclear device was set off, but the device was not in the primary operational zone!</b>")
		else
			to_chat(world, "<b>The colony was destroyed by the nuclear blast!</b>")

		// Affect all z-levels that are part of the same map
		SSticker.ship_was_nuked = (off_station < 2 && bomb_location && (bomb_location.z in map_z_levels))

		// Call explosion cinematic for all relevant z-levels
		SSticker.station_explosion_cinematic(off_station, map_z_levels)

	return

// Nuclear sequence helper functions
/obj/machinery/nuclearbomb/proc/trigger_random_explosion()
	// Get all z-levels that belong to the same map as the bomb
	var/turf/bomb_location = get_turf(src)
	if(!bomb_location)
		return

	var/list/map_z_levels = list()
	// Find all z-levels that are part of the same station/map
	for(var/z_level = 1; z_level <= world.maxz; z_level++)
		if(isStationLevel(z_level))
			map_z_levels += z_level

	// Get a random area from any map z-level
	var/list/valid_areas = list()
	for(var/area/A in GLOB.map_areas)
		if((A.z in map_z_levels) && A.type != /area && !istype(A, /area/space))
			valid_areas += A

	if(!valid_areas.len)
		return

	var/area/target_area = pick(valid_areas)
	var/list/turfs_in_area = list()

	// Get all valid turfs in the selected area from any map z-level
	for(var/turf/T in target_area)
		if(istype(T, /turf/simulated/floor) && (T.z in map_z_levels))
			turfs_in_area += T

	if(!turfs_in_area.len)
		return

	// Pick a random turf and create an explosion
	var/turf/explosion_turf = pick(turfs_in_area)

	// Create the explosion immediately - no delay for faster pace
	explosion(explosion_turf, 1, 2, 3, 4) // Small but noticeable explosion
	playsound(explosion_turf, 'sound/effects/explosion1.ogg', 75, 1)

/obj/machinery/nuclearbomb/proc/trigger_evacuation()
	if(!evacuation_called && evacuation_controller)
		evacuation_called = TRUE
		evacuation_controller.call_evacuation(null, TRUE) // Emergency evacuation

		// Announce evacuation with priority announcement
		priority_announcement.Announce("ATTENTION. EMERGENCY. All personnel. T-Minus seven minutes and thirty seconds to detonation. Proceed immediately to nearest emergency exit. You now have seven minutes to reach minimum safe distance.", "Emergency Announcement")

		world << sound('sound/effects/Evacuation.ogg', volume = 75)

	// Update station bomb state variables
	if(istype(src, /obj/machinery/nuclearbomb/station))
		var/obj/machinery/nuclearbomb/station/S = src
		S.greenlight = 0
		S.urgent = 1
		S.lock = 1  // Lock interface when evacuation begins

/obj/machinery/nuclearbomb/proc/announce_final_countdown()
	// Announce final countdown with priority announcement
	priority_announcement.Announce("ATTENTION. EMERGENCY. All personnel. T-Minus five minutes to detonation. The option to override detonation procedure has expired. You now have five minutes to reach minimum safe distance.", "Emergency Announcement")

	world << sound('sound/effects/siren.ogg', volume = 75)

	// Update station bomb state variables
	if(istype(src, /obj/machinery/nuclearbomb/station))
		var/obj/machinery/nuclearbomb/station/S = src
		S.urgent = 0
		S.exploding = 1

	// Set all areas to red alert
	for(var/area/A in GLOB.map_areas)
		if(istype(A, /area/nadezhda/hallway))
			A.readyalert()

/obj/machinery/nuclearbomb/proc/start_nuclear_sequence()
	if(timing)
		return FALSE // Already running

	sequence_stage = 1
	timeleft = abort_window_time
	timing = 1
	sound_timer = 0  // Reset sound timer when starting countdown
	explosion_timer = 0  // Reset explosion timer when starting countdown
	alarm_loop_timer = 0  // Reset alarm loop timer
	abort_warning_played = FALSE  // Reset abort warning flag

	// Set security level to DELTA when bomb is activated
	var/decl/security_state/security_state = decls_repository.get_decl(GLOB.maps_data.security_state)
	original_level = security_state.current_security_level
	security_state.set_security_level(security_state.severe_security_level, TRUE)

	// Trigger emergency red lighting on all lights in the colony
	for(var/obj/machinery/light/L in world)
		if(isStationLevel(L.z))
			spawn()
				L.set_red()

	// Update station bomb state variables
	if(istype(src, /obj/machinery/nuclearbomb/station))
		var/obj/machinery/nuclearbomb/station/S = src
		S.idle = 0
		S.greenlight = 1
		S.urgent = 0
		S.exploding = 0
		S.lock = 0  // Unlocked during abort window

	// Use priority announcement system for nuclear activation
	priority_announcement.Announce("ATTENTION. EMERGENCY. All personnel. The Nadezhda Colony self-destruct sequence has been activated. T-Minus ten minutes to detonation. T-Minus ten minutes. The option to override automatic detonation expires in T-Minus five minutes. For your own safety, please evacuate this colony. This is not a drill.", "Emergency Announcement")
	world << sound('sound/effects/siren.ogg', volume = 75)

	// Start the repeating alarm loop immediately
	world << sound('sound/effects/2.mp3', volume = 75)

	return TRUE

// Admin proc to manually initiate nuclear countdown
/obj/machinery/nuclearbomb/proc/admin_initiate_countdown_proc()
	if(!check_rights(R_ADMIN))
		return

	if(timing)
		to_chat(usr, SPAN_WARNING("Nuclear sequence is already active."))
		return

	var/confirm = alert(usr, "Are you sure you want to initiate the nuclear self-destruct sequence? This will start the countdown immediately.", "Nuclear Countdown Confirmation", "Yes", "No")
	if(confirm != "Yes")
		return

	// Force the bomb into an active state
	auth = new /obj/item/disk/nuclear(src) // Create auth disk
	yes_code = 1
	safety = 0
	anchored = 1
	extended = 1

	// Start the sequence
	if(start_nuclear_sequence())
		message_admins("[key_name_admin(usr)] manually initiated nuclear countdown on [src] at [get_area(src)]")
		log_admin("[key_name(usr)] manually initiated nuclear countdown on [src] at [get_area(src)]")
		to_chat(usr, SPAN_NOTICE("Nuclear countdown initiated successfully."))
	else
		to_chat(usr, SPAN_WARNING("Failed to initiate nuclear countdown."))

/obj/machinery/nuclearbomb/proc/abort_nuclear_sequence()
	if(!timing)
		return FALSE // No sequence to abort

	if(sequence_stage >= 3)
		return FALSE // Cannot abort during final countdown

	// Stop the timing and reset everything
	timing = 0
	sequence_stage = 0
	timeleft = 120
	evacuation_called = FALSE
	sound_timer = 0  // Reset sound timer when aborting sequence
	explosion_timer = 0  // Reset explosion timer when aborting sequence
	alarm_loop_timer = 0  // Reset alarm loop timer
	abort_warning_played = FALSE  // Reset abort warning flag

	// Restore original security level when aborted
	if(original_level)
		var/decl/security_state/security_state = decls_repository.get_decl(GLOB.maps_data.security_state)
		security_state.set_security_level(original_level, TRUE)

	// Restore normal lighting on all lights in the colony
	for(var/obj/machinery/light/L in world)
		if(isStationLevel(L.z))
			spawn()
				L.reset_color()

	// Reset station bomb state variables
	if(istype(src, /obj/machinery/nuclearbomb/station))
		var/obj/machinery/nuclearbomb/station/S = src
		S.idle = 1
		S.greenlight = 0
		S.urgent = 0
		S.exploding = 0
		S.lock = 0

	// Use priority announcement for abort notification
	priority_announcement.Announce("ATTENTION. EMERGENCY. The self-destruct sequence has been aborted. Repeat. The self-destruct sequence has been aborted. All systems returning to normal operation.", "Emergency Announcement")
	// Stop all ongoing nuclear-related sounds before playing abort sound
	world << sound(null) // Stop all sounds
	// Play abort sound
	world << sound('sound/machines/chime.ogg', volume = 75)

	bomb_set--
	update_icon()
	return TRUE

/obj/machinery/nuclearbomb/update_icon()
	if(lighthack)
		icon_state = "idle"
		set_light(l_range = 3, l_power = 0.5, l_color = COLOR_LIGHTING_BLUE_BRIGHT)
		return

	// Use proper state variables for station bombs
	if(istype(src, /obj/machinery/nuclearbomb/station))
		var/obj/machinery/nuclearbomb/station/S = src
		if(timing == -1 || S.exploding)
			icon_state = "exploding"
			set_light(l_range = 6, l_power = 1.2, l_color = COLOR_LIGHTING_RED_MACHINERY)
			// Intense pulsing red light for exploding state
		else if(timing || S.urgent)
			icon_state = "urgent"
			set_light(l_range = 5, l_power = 0.9, l_color = COLOR_LIGHTING_RED_MACHINERY)
			// Bright red warning light for urgent state
		else if(extended || S.greenlight)
			icon_state = "greenlight"
			set_light(l_range = 4, l_power = 0.7, l_color = COLOR_LIGHTING_RED_MACHINERY)
			// Green armed/ready light
		else if(S.idle)
			icon_state = "idle"
			set_light(l_range = 3, l_power = 0.5, l_color = COLOR_LIGHTING_BLUE_BRIGHT)
			// Calm blue idle light
		else
			icon_state = "idle"
			set_light(l_range = 3, l_power = 0.5, l_color = COLOR_LIGHTING_BLUE_BRIGHT)
	else
		// For regular nuclear bombs (not station bombs)
		if(timing == -1)
			icon_state = "exploding"
			set_light(l_range = 6, l_power = 1.2, l_color = COLOR_LIGHTING_RED_MACHINERY)
		else if(timing)
			icon_state = "urgent"
			set_light(l_range = 5, l_power = 0.9, l_color = COLOR_LIGHTING_RED_MACHINERY)
		else if(extended)
			icon_state = "greenlight"
			set_light(l_range = 4, l_power = 0.7, l_color = COLOR_LIGHTING_RED_MACHINERY)
		else
			icon_state = "idle"
			set_light(l_range = 3, l_power = 0.5, l_color = COLOR_LIGHTING_BLUE_BRIGHT)
/*
if(!N.lighthack)
	if (N.icon_state == "nuclearbomb2")
		N.icon_state = "nuclearbomb1"
		*/

//====The nuclear authentication disc====
/obj/item/disk/nuclear
	name = "nuclear authentication disk"
	desc = "Better keep this safe."
	icon = 'icons/obj/discs.dmi'
	icon_state = "nuclear"
	item_state = "card-id"
	w_class = ITEM_SIZE_TINY

/obj/item/disk/nuclear/touch_map_edge()
	qdel(src)

//====the nuclear football (holds the disk and instructions)====
/obj/item/storage/secure/briefcase/nukedisk
	name = "nuclear football"
	desc = "A large briefcase with a digital locking system. This one has a nuclear warning symbol on it."

/obj/item/storage/secure/briefcase/nukedisk/Initialize()
	. = ..()
	new /obj/item/disk/nuclear(src)
	new /obj/item/folder/envelope/nuke_instructions(src)

/obj/item/folder/envelope/nuke_instructions
	name = "instructions envelope"
	desc = "A small manilla envelope with multiple warning labels and an integrity seal. The label reads 'open only in event of imminent destruction or hostile takeover of colony command infrastructure' Another note indicates that failure to obey the warning is grounds for high treason."

/obj/item/folder/envelope/nuke_instructions/Initialize()
	. = ..()
	// Create basic instruction paper without complex formatting
	var/obj/item/paper/R = new(src)
	if(R)
		R.set_content("Nuclear Self-Destruct System Instructions<br><br>\
		In the event of a Delta-level emergency, this document will guide you through the activation of the colony's \
		nuclear self-destruct system. Please read carefully.<br><br>\
		1) Announce the imminent activation to any surviving crew members, and begin these procedures.<br>\
		2) Notify heads of staff with proper authorization.<br>\
		3) Request the nuclear disk from the High Council via secure fax channels.<br>\
		4) Proceed to the self-destruct chamber once approval and the authentication disk has been received.<br>\
		5) Authenticate with two Department Heads' approval using the secure terminals on either side of the room to retrieve the authorization code.<br>\
		6) Remove all nuclear cylinders from their slots in the storage compartment after unlocking it with a premier-level ID.<br>\
		7) Insert the nuclear cylinders into their slots and arm them by lowering the locking mechanism.<br>\
		8) Insert the nuclear authentication disk into the self-destruct terminal.<br>\
		9) Enter the authentication code into the self-destruct terminal.<br>\
		10) Start the sequence at the main terminal by disabling safety interlocks and activating the self-destruct sequence.<br><br>\
		The sequence may only be aborted during the first 5 minutes of the countdown. "
		)
		R.name = "colony self-destruct instructions"

//====colony self-destruct system====
/obj/machinery/nuclearbomb/station
	name = "self-destruct terminal"
	desc = "For when it all gets too much to bear. Do not taunt."
	icon = 'icons/obj/machines/nuke_station.dmi'
	icon_state = "idle"
	anchored = 1
	deployable = 1
	extended = 1

	var/idle = 1
	var/greenlight = 0
	var/urgent = 0
	var/exploding = 0
	var/lock = 0

	var/list/flash_tiles = list()
	var/list/inserters = list()
	var/last_turf_state

	var/announced = 0
	var/time_to_explosion = 0
	var/self_destruct_cutoff = 60 //Seconds
	timeleft = 300 // 5 minutes

/obj/machinery/nuclearbomb/station/Initialize()
	. = ..()
	verbs -= /obj/machinery/nuclearbomb/verb/toggle_deployable
	for(var/turf/simulated/floor/T in get_area(src))
		if(istype(T.flooring, /decl/flooring/reinforced/circuit))
			flash_tiles += T
	icon_state = "idle"
	update_icon()
	for(var/obj/machinery/self_destruct/ch in get_area(src))
		inserters += ch

/obj/machinery/nuclearbomb/station/proc/start_bomb()
	// Check that all inserters are armed AND have cylinders lowered
	var/total_inserters = inserters.len
	var/armed_cylinders = 0

	for(var/inserter in inserters)
		var/obj/machinery/self_destruct/sd = inserter
		if(!istype(sd))
			to_chat(usr, "<span class='warning'>An inserter is damaged or missing.</span>")
			return
		if(!sd.armed)
			to_chat(usr, "<span class='warning'>Inserter [sd] has not been armed.</span>")
			return
		if(sd.armed == 1)  // Cylinder is lowered when density is 0
			armed_cylinders++

	// Verify we have the minimum required inserters and all cylinders are lowered
	if(total_inserters < 12)
		to_chat(usr, "<span class='warning'>Insufficient inserters found. Expected 6, found [total_inserters].</span>")
		return

	if(armed_cylinders < total_inserters)
		to_chat(usr, "<span class='warning'>Not all nuclear cylinders have been lowered. [armed_cylinders]/[total_inserters] cylinders are in position.</span>")
		return

	visible_message("<span class='warning'>Warning. The self-destruct sequence override will be disabled [self_destruct_cutoff] seconds before detonation.</span>")
	start_nuclear_sequence()

/obj/machinery/nuclearbomb/station/attackby(obj/item/I, mob/user, params)
	if(isWrench(I))
		return
	return ..()

/obj/machinery/nuclearbomb/station/Topic(href, href_list)
	if((. = ..()))
		return
	if(href_list["anchor"])
		return

	// Override timer handling for station bombs to use start_bomb() instead of start_nuclear_sequence()
	if(is_auth(usr) && yes_code && href_list["timer"])
		if(!timing && !safety && anchored)
			start_bomb()
			log_and_message_admins("engaged a nuclear bomb")
			bomb_set++
			update_icon()
		SSnano.update_uis(src)
		return
