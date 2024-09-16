// System for a terminal emulator.
/datum/terminal
	var/name = "Terminal"
	var/datum/weakref/user_ref = null
	var/list/history = list()
	var/list/history_max_length = 20
	var/obj/item/modular_computer/computer

/datum/terminal/New(mob/user, obj/item/modular_computer/computer)
	..()
	src.computer = computer
	if(user && can_use(user))
		user_ref = WEAKREF(user)
		ui_interact(user)
	START_PROCESSING(SSprocessing, src)

/datum/terminal/Destroy()
	STOP_PROCESSING(SSprocessing, src)
	if(computer && computer.terminals)
		computer.terminals -= src
	computer = null
	return ..()

/datum/terminal/ui_status(mob/user, datum/ui_state/state)
	. = ..()
	if(!can_use(user))
		. = UI_CLOSE

/datum/terminal/ui_host(mob/user)
	return computer ? computer.ui_host() : src

/datum/terminal/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "Terminal", name)
		ui.open()

/datum/terminal/ui_data(mob/user)
	var/list/data = list()

	data["history"] = history

	return data

/datum/terminal/ui_act(action, list/params, datum/tgui/ui, datum/ui_state/state)
	. = ..()
	if(.)
		return

	switch(action)
		if("command")
			var/input = params["input"]
			history += "> [input]"
			input_command(usr, input)
			. = TRUE

/datum/terminal/ui_close(mob/user)
	. = ..()
	qdel(src)

/datum/terminal/proc/get_user()
	var/mob/user = user_ref.resolve()
	if(istype(user))
		return user

/datum/terminal/proc/can_use(mob/user)
	if(!user)
		return FALSE
	if(!CanInteractWith(user, computer, GLOB.default_state))
		return FALSE
	if(!computer || !computer.enabled)
		return FALSE
	return TRUE

/datum/terminal/proc/input_command(mob/user, command)
	var/output = parse(command, user)
	history += output
	if(length(history) > history_max_length)
		history.Cut(1, length(history) - history_max_length + 1)

/datum/terminal/Process()
	if(!can_use(get_user()))
		qdel(src)

/datum/terminal/proc/command_by_name(name)
	for(var/command in GLOB.terminal_commands)
		var/datum/terminal_command/command_datum = command
		if(command_datum.name == name)
			return command

/datum/terminal/proc/parse(text, mob/user)
	if(user.stat_check(STAT_COG, STAT_LEVEL_BASIC))
		for(var/datum/terminal_command/command in GLOB.terminal_commands)
			. = command.parse(text, user, src)
			if(!isnull(.))
				return
	else
		. = skill_critical_fail(user)
		if(!isnull(.)) // If it does something silently, we give generic text.
			return
	return "Command [text] not found."

/datum/terminal/proc/skill_critical_fail(user)
	var/list/candidates = list()
	for(var/datum/terminal_skill_fail/scf in GLOB.terminal_fails)
		if(scf.can_run(user, src))
			candidates[scf] = scf.weight
	var/datum/terminal_skill_fail/chosen = pickweight(candidates)
	return chosen.execute()
