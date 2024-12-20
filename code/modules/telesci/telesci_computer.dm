#define BS_MENU_SELECT 1
#define BS_MENU_MASTERMIND 2
#define BS_MENU_PATHFINDING 3
#define BS_MENU_PORTAL 4

#define BS_DISTANCE_INVALID -1
#define BS_DISTANCE_BYPASSED 0
#define BS_DISTANCE_SHORT 1
#define BS_DISTANCE_MEDIUM 2
#define BS_DISTANCE_LONG 3
#define BS_DISTANCE_FAR 4
#define BS_DISTANCE_STRESSFUL 5
#define BS_RANGE_SHORT 30
#define BS_RANGE_MEDIUM 60
#define BS_RANGE_LONG 90

#define BS_PATHING_DELAY 10

/obj/machinery/computer/telesci_console
	name = "\improper Advanced Telepad Control Console"
	desc = "Controls the advanced telepad."
	icon_screen = "teleport"
	light_color = "#6496fa"
	circuit = /obj/item/circuitboard/telesci_console
	var/obj/machinery/telesci_pad/telepad = null

	// VARIABLES //
	var/teleLog = ""
	var/menuOption = BS_MENU_SELECT
	var/beaconPanel = FALSE
	var/list/mastermindKey
	var/list/inputKey
	var/properInput = FALSE
	var/portalOpened = FALSE

	var/obj/item/device/radio/beacon/tracked_beacon
	var/tracking_beacon = FALSE
	var/targetX = 100
	var/targetY = 100
	var/targetZ = 1
	var/dangerous = FALSE
	var/invalid = FALSE

	var/list/obj/item/device/radio/beacon/temp_beacons_list

	var/ticking = FALSE
	var/ready = FALSE
	var/currentStage = -1
	var/progressMessage = "Timer failed, please contact an administrator."
	var/totalDelay
	var/totalProgress
	var/list/delayStages = list()
	var/obj/effect/telesci_portal_telegraph/telegraph
	var/obj/effect/telesci_portal_construct/construct

/obj/machinery/computer/telesci_console/Initialize()
	. = ..()
	addLog("Hawker-Nayala Bluespace Tunnel Console initialized. Welcome.")

/obj/machinery/computer/telesci_console/attackby(obj/item/W, mob/user, params)
	if(istype(W, /obj/item/tool/multitool))
		var/obj/item/tool/multitool/M = W
		if(M.buffer_object && istype(M.buffer_object, /obj/machinery/telesci_pad))
			if(istype(telepad))
				closePortal()
			telepad = M.buffer_object
			telepad.boundComputer = src
			M.buffer_object = null
			to_chat(user, SPAN_WARNING("You upload the data from the [W.name]'s buffer."))
	else
		..()

/obj/machinery/computer/telesci_console/Process()
	if(!istype(telepad) || QDELETED(telepad))
		telepad = null
	if(!tracked_beacon || !istype(tracked_beacon))
		tracked_beacon = null
		if(tracking_beacon)
			addLog("Connection to beacon timed out after [rand(10,400)]ms. No longer tracking.")
			tracking_beacon = FALSE
	if(portalOpened && (!telepad || !telepad.portal))
		portalOpened = FALSE
		addLog("Telepad unable to maintain bluespace tunnel. Tunnel closed.")
		resetMenus()

	if(ticking)
		totalProgress++
		if(totalProgress >= totalDelay)
			ticking = FALSE
			progressMessage = "Pathfinding complete. Opening bluespace tunnel."
			openPortal()
			return TRUE

		currentStage = 1
		for(var/i in 1 to delayStages.len)
			if(totalProgress > delayStages[i])
				currentStage++
		if(currentStage > delayStages.len)
			ticking = FALSE
			progressMessage = "Pathfinding complete. Opening bluespace tunnel."
			openPortal()

		if(currentStage <= 1)
			if(tracking_beacon)
				progressMessage = "Coordinating with selected beacon for pathing."
			else
				progressMessage = "Acquiring Relays for calculation assistance."
		if(currentStage > 1)
			progressMessage = "Querying Relay [currentStage-1] for calculations."
		if(currentStage > 5)
			progressMessage = "Bypassing bluespace interference."

		var/numPings = rand(5, 15)
		for(var/i in 1 to numPings)
			var/turf/randTurf = get_random_turf_in_range(telegraph, 7, 1)
			new /obj/effect/telesci_ping(randTurf)
		playsound(telegraph,'sound/effects/telesci_ping.ogg',50,FALSE, 7, extrarange = 10, is_global = FALSE, ignore_walls = TRUE)
		playsound(src,'sound/effects/telesci_process.ogg',50,FALSE, 7, is_global = FALSE)

/obj/machinery/computer/telesci_console/proc/addLog(string)
	teleLog = "\[[stationtime2text()]\] " + string + "<br>" + teleLog

/obj/machinery/computer/telesci_console/proc/openPortal()
	portalOpened = TRUE
	telepad.openPortal(targetX, targetY, targetZ)
	var/area/portalarea = get_area(get_turf(locate(targetX,targetY,targetZ)))
	if(portalarea.tele_inhibited())
		for(var/obj/machinery/telesci_relay/relay in telepad.relaysInUse)
			relay.chanceExplode()
		var/inhibitorExploded = FALSE
		for(var/obj/machinery/telesci_inhibitor/blocker in portalarea.tele_inhibitors)
			if(!istype(blocker))
				continue
			inhibitorExploded = TRUE
			playsound(blocker,'sound/effects/telesci_inhibitor_alarm.ogg', 80, FALSE, 7, extrarange = 10, is_global = FALSE, ignore_walls = TRUE)
			blocker.visible_message(SPAN_DANGER("\The [src] sparks violently and begins to shake!"))
			do_sparks(6, FALSE, get_turf(blocker))
			addtimer(CALLBACK(blocker, TYPE_PROC_REF(/obj/machinery/telesci_inhibitor, explode)), 1 SECOND)

		if(inhibitorExploded)
			var/obj/item/device/radio/headset/a = new /obj/item/device/radio/headset(null)
			a.autosay("ALERT: Extreme bluespace disruption detected in [loc]. Equipment failure imm-m-...", "Bluespace Inhibition Node")
			qdel(a)


	QDEL_NULL(telegraph)
	QDEL_NULL(construct)
	menuOption = BS_MENU_PORTAL

/obj/machinery/computer/telesci_console/proc/closePortal()
	portalOpened = FALSE
	if(istype(telepad))
		telepad.calculating = FALSE
		telepad.update_icon()
		for(var/obj/machinery/telesci_relay/relay in telepad.relaysInUse)
			telepad.relaysInUse -= relay
			relay.inUse = FALSE
			relay.update_icon()
		telepad.closePortal()
	resetMenus()

/obj/machinery/computer/telesci_console/proc/getDigitRequirement()
	var/turf/target = get_turf(locate(targetX,targetY,targetZ))
	var/area/targetArea = target.loc
	var/turf/origin = get_turf(telepad)
	if(!isPlayerLevel(targetZ))
		return BS_DISTANCE_INVALID //Invalid area.
//	if(isSealedLevel(targetZ)) //Commented out. Nearly all of our z-levels are sealed  we don't need to check for this. -Benl8561
//		return BS_DISTANCE_STRESSFUL //Sealed Z levels like deep maint require stressing the telepad.
	if(targetArea.tele_inhibited())
		return BS_DISTANCE_STRESSFUL //Tele inhibited Z levels also require stressing the telepad.
	if(tracking_beacon)
		return BS_DISTANCE_BYPASSED //Teleporting to a beacon is easy if it's not in a tele_inhibited area.
	if(!isOnStationLevel(telepad))
		if(targetZ != origin.z)
			return BS_DISTANCE_FAR
	else
		if(isNotStationLevel(targetZ))
			return BS_DISTANCE_FAR
		var/dist = get_dist(target, origin)
		if(dist <= BS_RANGE_SHORT)
			return BS_DISTANCE_SHORT
		if(dist <= BS_RANGE_MEDIUM)
			return BS_DISTANCE_MEDIUM
		if(dist <= BS_RANGE_LONG)
			return BS_DISTANCE_LONG
		return BS_DISTANCE_FAR

/obj/machinery/computer/telesci_console/proc/pingRelays(relayCount)
	var/list/obj/machinery/telesci_relay/relays = telepad.findRelays()
	var/numRelays = 0
	var/relaysCounted = 0
	for(var/obj/machinery/telesci_relay/relay in relays)
		relaysCounted++
		if(relay.pingCrystal())
			numRelays++
		if(relaysCounted >= relayCount)
			break
	return numRelays

/obj/machinery/computer/telesci_console/proc/generateMastermindKey()
	mastermindKey = list()
	for(var/i in 1 to getDigitRequirement())
		mastermindKey += ("[rand(1,9)]")

/obj/machinery/computer/telesci_console/proc/storeInputKey(input)
	var/list/digits = list("0","1","2","3","4","5","6","7","8","9")
	inputKey = list()
	for(var/i in 1 to length(input))
		var/guesschar = copytext(input, i, i+1)
		if(!(guesschar in digits))
			return FALSE
		if(guesschar == "0")
			guesschar = "1"
		inputKey += guesschar
	return TRUE

/obj/machinery/computer/telesci_console/proc/compareKeys()
	properInput = FALSE
	if(!mastermindKey || mastermindKey.len <= 0)
		addLog("Critical error encountered while routing course. Please contact a system administrator.")
		return FALSE

	if(!inputKey || inputKey.len <= 0)
		return FALSE

	if(mastermindKey.len != inputKey.len)
		inputKey = list()
		addLog("Input path length [inputKey.len < mastermindKey.len ? "insufficient for" : "exceeds"] optimal path.")
		return FALSE

	var/list/obj/machinery/telesci_relay/workingRelays = telepad.findWorkingRelays()

	if(workingRelays.len <= 0)
		addLog("No available relays detected. Please check to ensure at least one relay is aligned with the telepad on the X/Y axis, and has a bluespace crystal loaded.")
		return FALSE

	if(mastermindKey.len == 5 && workingRelays.len < 4)
		addLog("Bluespace interference detected at target location. Four available relays are required to isolate accurate path.")
		return FALSE

	var/bulls = 0
	var/cows = 0
	var/list/keyContents = mastermindKey.Copy()
	var/list/inputContents = inputKey.Copy()
	for(var/i in 1 to keyContents.len)
		if(inputKey[i] == keyContents[i])
			bulls++
			keyContents[i] = null

	for(var/i in 1 to inputContents.len)
		for(var/n in 1 to keyContents.len)
			if(inputContents[i] == keyContents[n])
				cows++
				keyContents[n] = null

	var/failedAttempts = 0
	for(var/i in 1 to min(mastermindKey.len, 4))
		if(i > workingRelays.len)
			var/obj/machinery/telesci_relay/relay = pick(workingRelays)
			if(!relay.damageCrystal(1))
				workingRelays -= relay
				if(workingRelays.len <= 0)
					addLog("Warning: Equipment failure detected. Relay failed to supply bluespace calculations via crystal interface. Please try calculation again after resolving issue.")
					return FALSE
				relay = pick(workingRelays)
				if(!relay.damageCrystal(1))
					addLog("Warning: Equipment failure detected. Relay failed to supply bluespace calculations via crystal interface. Please try calculation again after resolving issue.")
					return FALSE
			failedAttempts++
		else
			workingRelays[i].pingCrystal()

	if(failedAttempts > 0)
		addLog("Warning: Insufficient crystals aligned with telepad. [failedAttempts] crystalline metastructure fault[failedAttempts == 1 ? "" : "s"] detected as a result of this pathing attempt.")
	properInput = TRUE
	if(bulls == mastermindKey.len)
		addLog("Attempt successful. Effective bluespace pathway isolated.")
		inputKey = list()
		return TRUE
	else
		addLog("Attempt failed. [cows] instruction vector[cows == 1 ? "" : "s"] aligned. [bulls] instruction[bulls == 1 ? "" : "s"] identified as effective.")
		inputKey = list()
		return FALSE

/obj/machinery/computer/telesci_console/proc/startMastermind()
	menuOption = BS_MENU_MASTERMIND
	inputKey = list()
	generateMastermindKey()

/obj/machinery/computer/telesci_console/proc/startPathfinding()
	menuOption = BS_MENU_PATHFINDING

/obj/machinery/computer/telesci_console/proc/resetMenus()
	mastermindKey = null
	inputKey = null
	totalDelay = null
	totalProgress = null
	delayStages = null
	ticking = FALSE
	menuOption = BS_MENU_SELECT
	QDEL_NULL(telegraph)
	QDEL_NULL(construct)
	for(var/obj/machinery/telesci_relay/relay in telepad.relaysInUse)
		telepad.relaysInUse -= relay
		relay.inUse = FALSE
		relay.update_icon()

/obj/machinery/computer/telesci_console/proc/startTimer(var/baseDelay = BS_PATHING_DELAY)
	var/list/obj/machinery/telesci_relay/workingRelays = telepad.findWorkingRelays()
	if(workingRelays.len <= 0 && !tracking_beacon)
		addLog("Unable to start path traversal: No calculation equipment available.")
		return FALSE
	if(dangerous && workingRelays.len < 4)
		addLog("Unable to start path traversal: Four relays are required for complex interference bypass calculations.")
		return FALSE
	ready = FALSE
	delayStages = list()
	totalDelay = 0
	totalProgress = 0
	totalDelay += baseDelay
	delayStages += baseDelay
	if(!tracking_beacon || dangerous)
		for(var/i in 1 to min(getDigitRequirement(), workingRelays.len))
			delayStages += totalDelay + workingRelays[i].pathfinding_speed
			totalDelay += workingRelays[i].pathfinding_speed
			telepad.relaysInUse += workingRelays[i]
			workingRelays[i].inUse = TRUE
			workingRelays[i].update_icon()
	if(dangerous)
		delayStages += totalDelay + 2 * baseDelay
		totalDelay += 2 * baseDelay
	ticking = TRUE
	telepad.calculating = TRUE
	telepad.update_icon()
	telegraph = new(get_turf(locate(targetX,targetY,targetZ)))
	construct = new(get_turf(telepad))
	progressMessage = "Initializing gateway pathing calculations..."
	return TRUE

/obj/machinery/computer/telesci_console/attack_hand(mob/user)
	if(..())
		return TRUE
	nano_ui_interact(user)

/obj/machinery/computer/telesci_console/nano_ui_interact(mob/user, ui_key = "main", datum/nanoui/ui = null, force_open = NANOUI_FOCUS)
	var/list/data = form_data()
	ui = SSnano.try_update_ui(user, src, ui_key, ui, data, force_open)
	if(!ui)
		ui = new(user, src, ui_key, "telesci_console.tmpl", "TelesciPad", 600, 600)
		ui.set_initial_data(data)
		ui.open()
		ui.set_auto_update(TRUE)
		ui.set_auto_update_layout(TRUE)

/obj/machinery/computer/telesci_console/proc/form_data()
	if(!istype(telepad) || QDELETED(telepad))
		telepad = null
	if(!istype(tracked_beacon))
		tracked_beacon = null
		if(tracking_beacon)
			addLog("Connection to beacon timed out after [rand(10,400)]ms. No longer tracking.")
			tracking_beacon = FALSE
	else
		targetX = tracked_beacon.x
		targetY = tracked_beacon.y
		targetZ = tracked_beacon.z
	var/list/data = list()
	data["telepadPresent"] = telepad ? TRUE : FALSE
	data["targetX"] = targetX
	data["targetY"] = targetY
	data["targetZ"] = targetZ
	data["dangerous"] = dangerous
	data["invalid"] = invalid
	if(istype(telepad))
		data["digitRequirement"] = getDigitRequirement()
		data["telepadOpen"] = telepad.panel_open
		var/workingRelays = 0
		for(var/obj/machinery/telesci_relay/relay in telepad.findRelays())
			if(relay.checkCrystal())
				workingRelays++
		data["workingRelays"] = workingRelays
	else
		data["digitRequirement"] = 0
	data["beaconPanel"] = beaconPanel
	var/list/beacons = list()
	temp_beacons_list = list()
	for(var/obj/item/device/radio/beacon/R in world)
		var/turf/T = get_turf(R)
		if(!T)
			continue
		if(!isPlayerLevel(T.z))
			continue
		var/list/beacondata = list()
		var/newIndex = temp_beacons_list.len+1
		temp_beacons_list["[newIndex]"] = R //In text, because assoc lists have arbitrary size.
		beacondata["text"] = "([T.x],[T.y],[T.z]) - \"[T.loc.name]\""
		beacondata["ref"] = "[newIndex]"
		if(istype(tracked_beacon) && R == tracked_beacon)
			beacondata["selected"] = 1
		else
			beacondata["selected"] = 0
		beacons.Add(list(beacondata))
	data["beacons"] = beacons
	if(telepad)
		data["power"] = telepad.stored_power
		data["maxpower"] = telepad.max_power
	data["menu"] = menuOption
	var/keyString = ""
	for(var/c in inputKey)
		keyString += c
	data["ready"] = ready
	data["ticking"] = ticking
	data["progress"] = totalProgress
	data["delay"] = totalDelay
	data["currentStage"] = currentStage
	data["stageText"] = progressMessage
	data["inputKey"] = keyString
	data["log"] = teleLog
	return data

/obj/machinery/computer/telesci_console/Topic(href, href_list)
	if(..())
		return TRUE
	if(!telepad)
		return TRUE
	var/mob/living/user = null
	if(isliving(usr))
		user = usr

	if(menuOption == BS_MENU_SELECT)
		if(href_list["setX"])
			var/new_x = input("Please input desired X coordinate.", name, targetX) as num
			if(..()) // Check after we input a value, as they could've moved after they entered something
				return
			if(tracking_beacon)
				tracked_beacon = null
				tracking_beacon = FALSE
				addLog("Manual coordinate input detected. Cancelling beacon tracking.")
			targetX = CLAMP(new_x, 0, world.maxx)
			targetX = round(targetX)

		if(href_list["setY"])
			var/new_y = input("Please input desired Y coordinate.", name, targetY) as num
			if(..()) // Check after we input a value, as they could've moved after they entered something
				return
			if(tracking_beacon)
				tracked_beacon = null
				tracking_beacon = FALSE
				addLog("Manual coordinate input detected. Cancelling beacon tracking.")
			targetY = CLAMP(new_y, 0, world.maxy)
			targetY = round(targetY)

		if(href_list["setZ"])
			var/new_z = input("Please input desired sector.", name, targetZ) as num
			if(..())
				return
			if(tracking_beacon)
				tracked_beacon = null
				tracking_beacon = FALSE
				addLog("Manual coordinate input detected. Cancelling beacon tracking.")
			targetZ = CLAMP(round(new_z), 1, 25)

		if(getDigitRequirement() == BS_DISTANCE_STRESSFUL)
			dangerous = TRUE
		else
			dangerous = FALSE

		if(getDigitRequirement() == BS_DISTANCE_INVALID)
			invalid = TRUE
		else
			invalid = FALSE

		if(href_list["unselectBeacon"])
			tracked_beacon = null
			tracking_beacon = FALSE
			addLog("Beacon deselected. Resuming relay-based calculations.")

		if(href_list["selectBeacon"])
			var/obj/item/L = temp_beacons_list[href_list["selectBeacon"]]
			temp_beacons_list = null
			if(istype(L, /obj/item/device/radio/beacon))
				tracked_beacon = L
				var/turf/T = get_turf(tracked_beacon)
				tracking_beacon = TRUE
				addLog("Selected beacon at ([T.x],[T.y],[T.z]). Offloading pathfinding calculations.")
			else
				addLog("Beacon selection failed. Contact a system administrator for further assistance.")

		if(href_list["toggleBeaconPanel"])
			beaconPanel = !beaconPanel

		if(href_list["pathing"])
			if(invalid)
				addLog("Unable to pathfind to selected coordinates. Terminating calculation.")
			else if(tracking_beacon)
				addLog("Beginning automatic pathfinding calculations for bluespace tunnel to ([targetX],[targetY],[targetZ]).")
				startPathfinding()
			else if(dangerous)
				addLog("Beginning manual calculations for bluespace tunnel to ([targetX],[targetY],[targetZ]). Warning: Bluespace interference detected.")
				startMastermind()
			else
				addLog("Beginning manual calculations for bluespace tunnel to ([targetX],[targetY],[targetZ]).")
				startMastermind()

	if(menuOption == BS_MENU_MASTERMIND)
		if(href_list["keyInput"])
			var/new_key = input("Please input a path to test.", name) as text
			if(..()) // Check after we input a value, as they could've moved after they entered something
				return
			if(!storeInputKey(new_key))
				addLog("Invalid key input. Please input instructions in the format of digits 1-9.")

		if(href_list["tryCalc"])
			if(compareKeys())
				startPathfinding()
			else if(properInput)
				if(user)
					if(rand(1, 100) < user.stats.getStat(STAT_COG))
						var/pathHint = ""
						var/identifiedIndex = rand(1, mastermindKey.len)
						for(var/i in 1 to mastermindKey.len)
							if(i == identifiedIndex)
								pathHint += mastermindKey[i]
							else
								pathHint += "_"
							if(i < mastermindKey.len)
								pathHint += " "
						addLog("User input pattern extrapolated. Effective instruction identified: ([pathHint])")
				else
					addLog("Error: No user detected. Please contact a system administrator.")
	if(menuOption == BS_MENU_PATHFINDING)
		if(href_list["startTimer"])
			addLog("Starting path traversal for bluespace tunnel to ([targetX],[targetY],[targetZ]).")
			if(user)
				var/cogBonus = min(user.stats.getStat(STAT_COG)/10, 4)
				startTimer(baseDelay = (BS_PATHING_DELAY - cogBonus))
			else
				startTimer()
	if(href_list["cancel"])
		if(!portalOpened)
			addLog("Pathfinding cancelled. Returning to selection menu.")
			closePortal() //closePortal works while portal is not open, and clears relays in use.
		else
			addLog("Closing bluespace tunnel by user request.")
			closePortal()

	nano_ui_interact(user)
	return FALSE

/obj/machinery/computer/telesci_console/Destroy()
	closePortal()
	return ..()

// Effects that telegraph the portal to onlookers.

/obj/effect/telesci_ping
	name = "bluespace flicker"
	icon = 'icons/obj/telescience.dmi'
	layer = ABOVE_LIGHTING_LAYER

/obj/effect/telesci_ping/New(turf/loc)
	. = ..(loc)
	flick("calc-attempt",src)
	playsound(src,'sound/effects/telesci_sparkles.ogg',20,FALSE, 7, is_global = FALSE, ignore_walls = FALSE)
	QDEL_IN(src, 1 SECOND)

/obj/effect/telesci_portal_telegraph
	name = "bluespace rift"
	icon = 'icons/obj/telescience.dmi'
	icon_state = "portal-telegraph-startup"
	layer = ABOVE_LIGHTING_LAYER

/obj/effect/telesci_portal_construct
	name = "bluespace rift"
	icon = 'icons/obj/telescience.dmi'
	icon_state = "portal-telegraph"
	layer = ABOVE_LIGHTING_LAYER

#undef BS_MENU_SELECT
#undef BS_MENU_MASTERMIND
#undef BS_MENU_PATHFINDING
#undef BS_MENU_PORTAL

#undef BS_DISTANCE_INVALID
#undef BS_DISTANCE_SHORT
#undef BS_DISTANCE_MEDIUM
#undef BS_DISTANCE_LONG
#undef BS_DISTANCE_FAR
#undef BS_DISTANCE_STRESSFUL
#undef BS_RANGE_SHORT
#undef BS_RANGE_MEDIUM
#undef BS_RANGE_LONG

#undef BS_PATHING_DELAY
