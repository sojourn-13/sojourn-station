/datum/computer_file/program/remote_cyborg_controle
	filename = "remote_borg_controle"
	filedesc = "Cyborg Remote Access"
	program_icon_state = "generic"
	program_key_state = "mining_key"
	program_menu_icon = "robot"
	extended_desc = "This program lets the user remotely see the condiction of Cyborgs, remotely lock them down and denate them."
	size = 9 //Not a lot here but still some
	requires_ntnet = TRUE
	required_access = access_robotics
	requires_access_to_run = TRUE
	available_on_ntnet = TRUE
	nanomodule_path = /datum/nano_module/program/remote_cyborg_controle/

/datum/nano_module/program/remote_cyborg_controle
	name = "Cyborg Remote Access & Monitor"
	available_to_ai = TRUE

/datum/nano_module/program/remote_cyborg_controle/nano_ui_interact(mob/user, ui_key = "main", var/datum/nanoui/ui = null, var/force_open = NANOUI_FOCUS, var/datum/nano_topic_state/state = GLOB.default_state)
	var/list/data = nano_ui_data(user)
	var/safety = 1
	data["robots"] = get_cyborgs(user)
	data["safety"] = safety
	// Also applies for cyborgs. Hides the manual self-destruct button.
	data["is_ai"] = issilicon(user)


	ui = SSnano.try_update_ui(user, src, ui_key, ui, data, force_open)
	if (!ui)
		ui = new(user, src, ui_key, "robot_control.tmpl", "Robotic Control Console", 400, 500, state = state)
		ui.set_initial_data(data)
		ui.open()
		ui.set_auto_update(1)

/datum/nano_module/program/remote_cyborg_controle/Topic(href, href_list)
	var/safety = 1
	if(..())
		return
	var/mob/user = usr

	// Destroys the cyborg
	if(href_list["detonate"])
		var/mob/living/silicon/robot/target = get_cyborg_by_name(href_list["detonate"])
		if(!target || !istype(target))
			return
		if(isAI(user) && (target.connected_ai != user))
			to_chat(user, "Access Denied. This robot is not linked to you.")
			return
		// Cyborgs may blow up themselves via the console
		if(isrobot(user) && user != target)
			to_chat(user, "Access Denied.")
			return
		var/choice = input("Really detonate [target.name]?") in list ("Yes", "No")
		if(choice != "Yes")
			return
		if(!target || !istype(target))
			return

		// Antagonistic cyborgs? Left here for downstream
		if(target.mind && player_is_antag(target.mind) && target.HasTrait(CYBORG_TRAIT_EMAGGED))
			to_chat(target, "Extreme danger.  Termination codes detected.  Scrambling security codes and automatic AI unlink triggered.")
			target.ResetSecurityCodes()
		else
			message_admins(SPAN_NOTICE("[key_name_admin(usr)] detonated [target.name]!"))
			log_game("[key_name(usr)] detonated [target.name]!")
			to_chat(target, SPAN_DANGER("Self-destruct command received."))
			spawn(10)
				target.self_destruct()



	// Locks or unlocks the cyborg
	else if (href_list["lockdown"])
		var/mob/living/silicon/robot/target = get_cyborg_by_name(href_list["lockdown"])
		if(!target || !istype(target))
			return

		if(isAI(user) && (target.connected_ai != user))
			to_chat(user, "Access Denied. This robot is not linked to you.")
			return

		if(isrobot(user))
			to_chat(user, "Access Denied.")
			return

		var/choice = input("Really [target.lockcharge ? "unlock" : "lockdown"] [target.name] ?") in list ("Yes", "No")
		if(choice != "Yes")
			return

		if(!target || !istype(target))
			return

		message_admins("<span class='notice'>[key_name_admin(usr)] [target.canmove ? "locked down" : "released"] [target.name]!</span>")
		log_game("[key_name(usr)] [target.canmove ? "locked down" : "released"] [target.name]!")
		target.canmove = !target.canmove
		if (target.lockcharge)
			target.lockcharge = !target.lockcharge
			to_chat(target, "Your lockdown has been lifted!")
		else
			target.lockcharge = !target.lockcharge
			to_chat(target, "You have been locked down!")

	// Remotely hacks the cyborg. Only antag AIs can do this and only to linked cyborgs.
	else if (href_list["hack"])
		var/mob/living/silicon/robot/target = get_cyborg_by_name(href_list["hack"])
		if(!target || !istype(target))
			return

		// Antag AI checks
		if(!isAI(user) || !(user.mind.antagonist.len && user.mind.original == user))
			to_chat(user, "Access Denied")
			return

		if(target.HasTrait(CYBORG_TRAIT_EMAGGED))
			to_chat(user, "Robot is already hacked.")
			return

		var/choice = input("Really hack [target.name]? This cannot be undone.") in list("Yes", "No")
		if(choice != "Yes")
			return

		if(!target || !istype(target))
			return

		message_admins(SPAN_NOTICE("[key_name_admin(usr)] emagged [target.name] using robotic console!"))
		log_game("[key_name(usr)] emagged [target.name] using robotic console!")
		target.AddTrait(CYBORG_TRAIT_EMAGGED)
		to_chat(target, SPAN_NOTICE("Failsafe protocols overriden. New tools available."))

	// Arms the emergency self-destruct system
	else if(href_list["arm"])
		if(issilicon(user))
			to_chat(user, "Access Denied")
			return

		safety = !safety
		to_chat(user, "You [safety ? "disarm" : "arm"] the emergency self destruct")

	// Destroys all accessible cyborgs if safety is disabled
	else if(href_list["nuke"])
		if(issilicon(user))
			to_chat(user, "Access Denied")
			return
		if(safety)
			to_chat(user, "Self-destruct aborted - safety active")
			return

		message_admins(SPAN_NOTICE("[key_name_admin(usr)] detonated all cyborgs!"))
		log_game("[key_name(usr)] detonated all cyborgs!")

		for(var/mob/living/silicon/robot/R in SSmobs.mob_list)
			if(isdrone(R))
				continue
			// Ignore antagonistic cyborgs
			if(R.scrambledcodes)
				continue
			to_chat(R, SPAN_DANGER("Self-destruct command received."))
			spawn(10)
				R.self_destruct()


// Proc: get_cyborgs()
// Parameters: 1 (operator - mob which is operating the console.)
// Description: Returns NanoUI-friendly list of accessible cyborgs.
/datum/nano_module/program/remote_cyborg_controle/proc/get_cyborgs(var/mob/operator)
	var/list/robots = list()

	for(var/mob/living/silicon/robot/R in SSmobs.mob_list)
		// Ignore drones
		if(isdrone(R))
			continue
		// Ignore antagonistic cyborgs
		if(R.scrambledcodes)
			continue

		var/list/robot = list()
		robot["name"] = R.name
		if(R.stat)
			robot["status"] = "Not Responding"
		else if (!R.canmove)
			robot["status"] = "Lockdown"
		else
			robot["status"] = "Operational"

		if(R.cell)
			robot["cell"] = 1
			robot["cell_capacity"] = R.cell.maxcharge
			robot["cell_current"] = R.cell.charge
			robot["cell_percentage"] = round(R.cell.percent())
		else
			robot["cell"] = 0

		robot["module"] = R.module ? R.module.name : "None"
		robot["master_ai"] = R.connected_ai ? R.connected_ai.name : "None"

		// Add location information with GPS coordinates
		var/area/robot_area = get_area(R)
		if(robot_area)
			robot["location"] = "[robot_area.name] ([R.x], [R.y], [R.z])"
		else
			robot["location"] = "Unknown ([R.x], [R.y], [R.z])"

		robot["hackable"] = 0
		/* Antag AIs know whether linked cyborgs are hacked or not.
		if(operator && isAI(operator) && (R.connected_ai == operator) && (operator.mind.antagonist.len && operator.mind.original == operator))
			robot["hacked"] = HasTrait(CYBORG_TRAIT_EMAGGED) ? 1 : 0
			robot["hackable"] = HasTrait(CYBORG_TRAIT_EMAGGED) ? 0 : 1*/
		robots.Add(list(robot))
	return robots

// Proc: get_cyborg_by_name()
// Parameters: 1 (name - Cyborg we are trying to find)
// Description: Helper proc for finding cyborg by name
/datum/nano_module/program/remote_cyborg_controle/proc/get_cyborg_by_name(var/name)
	if (!name)
		return
	for(var/mob/living/silicon/robot/R in SSmobs.mob_list)
		if(R.name == name)
			return R
