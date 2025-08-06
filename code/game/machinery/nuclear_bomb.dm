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
	var/abort_window_time = 300  // 5 minutes (300 seconds) to abort
	var/evacuation_time = 300    // 5 minutes for evacuation phase
	var/final_countdown_time = 60  // 1 minute final countdown to detonation
	var/sequence_stage = 0       // 0 = not started, 1 = abort window, 2 = evacuation, 3 = final countdown
	var/evacuation_called = FALSE
	var/sound_timer = 0          // Timer for countdown sound effects
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

		// Play countdown sound every 5 seconds
		sound_timer += 2
		if(sound_timer >= 50) // 50 deciseconds = 5 seconds
			playsound(src, 'sound/effects/3.wav', 50, 0)
			sound_timer = 0

		// Handle the multi-stage nuclear sequence
		if(sequence_stage == 1) // Abort window phase
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
	data["can_abort"] = (sequence_stage == 1) // Can only abort during abort window
	data["interface_locked"] = (sequence_stage >= 2) // Lock interface after abort window expires
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
		// Check if interface is locked (after abort window expires)
		if(sequence_stage >= 2)
			to_chat(usr, SPAN_WARNING("Interface locked. Nuclear sequence cannot be modified after abort window expires."))
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
			if (href_list["abort"])
				if(sequence_stage == 1 && is_auth(usr)) // Only during abort window and if authorized
					if(abort_nuclear_sequence())
						to_chat(usr, SPAN_NOTICE("Nuclear sequence aborted successfully."))
						log_and_message_admins("aborted a nuclear bomb sequence")
					else
						to_chat(usr, SPAN_WARNING("Unable to abort nuclear sequence at this time."))
				else if(sequence_stage >= 2)
					to_chat(usr, SPAN_WARNING("Abort window has expired. Evacuation phase has begun - abort is no longer possible."))
				else
					to_chat(usr, SPAN_WARNING("Abort window has expired or insufficient authorization."))
				SSnano.update_uis(src)
				return
			if (href_list["safety"])
				if (wires.IsIndexCut(NUCLEARBOMB_WIRE_SAFETY))
					to_chat(usr, SPAN_WARNING("Nothing happens, something might be wrong with the wiring."))
					SSnano.update_uis(src)
					return
				safety = !safety
				if(safety)
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
	playsound(src,'sound/machines/Alarm.ogg',100,0,5)
	SSticker.nuke_in_progress = TRUE
	sleep(100)

	var/off_station = 0
	var/turf/bomb_location = get_turf(src)
	if(bomb_location && isStationLevel(bomb_location.z))
		if( (bomb_location.x < (128-NUKERANGE)) || (bomb_location.x > (128+NUKERANGE)) || (bomb_location.y < (128-NUKERANGE)) || (bomb_location.y > (128+NUKERANGE)) )
			off_station = 1
	else
		off_station = 2

	if(get_storyteller())
		SSticker.nuke_in_progress = FALSE
		if(off_station == 1)
			to_chat(world, "<b>A nuclear device was set off, but the explosion was out of reach of the ship!</b>")
		else if(off_station == 2)
			to_chat(world, "<b>A nuclear device was set off, but the device was not on the ship!</b>")
		else
			to_chat(world, "<b>The ship was destoyed by the nuclear blast!</b>")

		SSticker.ship_was_nuked = (off_station<2)	//offstation==1 is a draw. the station becomes irradiated and needs to be evacuated.
														//kinda shit but I couldn't  get permission to do what I wanted to do.

		SSticker.station_explosion_cinematic(off_station)

	return

// Nuclear sequence helper functions
/obj/machinery/nuclearbomb/proc/trigger_evacuation()
	if(!evacuation_called && evacuation_controller)
		evacuation_called = TRUE
		evacuation_controller.call_evacuation(null, TRUE) // Emergency evacuation

		// Announce evacuation with priority announcement
		priority_announcement.Announce("NUCLEAR ALERT: Evacuation phase has begun. All personnel must proceed to evacuation points immediately. This is not a drill.", "Nuclear Safety Control")

		playsound(src, 'sound/effects/Evacuation.ogg', 100, 0, 10)

	// Update station bomb state variables
	if(istype(src, /obj/machinery/nuclearbomb/station))
		var/obj/machinery/nuclearbomb/station/S = src
		S.greenlight = 0
		S.urgent = 1
		S.lock = 1  // Lock interface when evacuation begins

/obj/machinery/nuclearbomb/proc/announce_final_countdown()
	// Announce final countdown with priority announcement
	priority_announcement.Announce("CRITICAL ALERT: Self-destruct sequence has reached terminal countdown. Abort systems have been disabled. All personnel must evacuate immediately. This is not a drill.", "Nuclear Safety Control")

	playsound(src, 'sound/effects/siren.ogg', 100, 0, 15)

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

	// Set security level to DELTA when bomb is activated
	var/decl/security_state/security_state = decls_repository.get_decl(GLOB.maps_data.security_state)
	original_level = security_state.current_security_level
	security_state.set_security_level(security_state.severe_security_level, TRUE)

	// Update station bomb state variables
	if(istype(src, /obj/machinery/nuclearbomb/station))
		var/obj/machinery/nuclearbomb/station/S = src
		S.idle = 0
		S.greenlight = 1
		S.urgent = 0
		S.exploding = 0
		S.lock = 0  // Unlocked during abort window

	// Use priority announcement system for nuclear activation
	priority_announcement.Announce("NUCLEAR ALERT: The nuclear self-destruct sequence has been activated. All personnel have 5 minutes to abort before evacuation procedures begin. This is not a drill.", "Nuclear Safety Control")
	playsound(src, 'sound/effects/siren.ogg', 100, 0, 5)

	return TRUE

/obj/machinery/nuclearbomb/proc/abort_nuclear_sequence()
	if(sequence_stage != 1)
		return FALSE // Can only abort during abort window (stage 1), not during evacuation (stage 2) or final countdown (stage 3)

	timing = 0
	sequence_stage = 0
	timeleft = 120
	evacuation_called = FALSE
	sound_timer = 0  // Reset sound timer when aborting sequence

	// Restore original security level when aborted
	if(original_level)
		var/decl/security_state/security_state = decls_repository.get_decl(GLOB.maps_data.security_state)
		security_state.set_security_level(original_level, TRUE)

	// Reset station bomb state variables
	if(istype(src, /obj/machinery/nuclearbomb/station))
		var/obj/machinery/nuclearbomb/station/S = src
		S.idle = 1
		S.greenlight = 0
		S.urgent = 0
		S.exploding = 0
		S.lock = 0

	// Use priority announcement for abort notification
	priority_announcement.Announce("NUCLEAR ALERT CANCELLED: Nuclear self-destruct sequence has been successfully aborted. All systems returning to normal operation.", "Nuclear Safety Control")

	bomb_set--
	update_icon()
	return TRUE

/obj/machinery/nuclearbomb/update_icon()
	if(lighthack)
		icon_state = "idle"
		return

	// Use proper state variables for station bombs
	if(istype(src, /obj/machinery/nuclearbomb/station))
		var/obj/machinery/nuclearbomb/station/S = src
		if(timing == -1 || S.exploding)
			icon_state = "exploding"
		else if(timing || S.urgent)
			icon_state = "urgent"
		else if(extended || S.greenlight)
			icon_state = "greenlight"
		else if(S.idle)
			icon_state = "idle"
		else
			icon_state = "idle"
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
	desc = "A small envelope. The label reads 'open only in event of high emergency'."

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
