/datum/computer_file/program/rcon_console
	filename = "rconconsole"
	filedesc = "RCON Remote Control"
	tguimodule_path = /datum/tgui_module/rcon
	program_icon_state = "generic"
	program_key_state = "rd_key"
	program_menu_icon = "car-battery"
	extended_desc = "This program allows remote control of power distribution systems. Cannot be run on tablet computers."
	required_access = access_engine
	requires_ntnet = 1
	network_destination = "RCON remote control system"
	requires_ntnet_feature = NTNET_SYSTEMCONTROL
	usage_flags = PROGRAM_LAPTOP | PROGRAM_CONSOLE
	size = 19

/datum/tgui_module/rcon
	name = "Power RCON"
	tgui_id = "Rcon"
	ntos = TRUE

	var/list/known_SMESs = null
	var/list/known_breakers = null

/datum/tgui_module/rcon/ui_data(mob/user)
	var/list/data = ..()

	if(known_SMESs == null || known_breakers == null)
		FindDevices()

	var/list/smeses = list()
	for(var/obj/machinery/power/smes/buildable/SMES in known_SMESs)
		smeses += list(list(
			"charge" = round(SMES.Percentage()),
			"input_set" = SMES.input_attempt,
			"input_val" = round(SMES.input_level, 0.1),
			"input_load" = round(SMES.input_available, 0.1),
			"input_max" = SMES.input_level_max,
			"output_set" = SMES.output_attempt,
			"output_val" = round(SMES.output_level, 0.1),
			"output_load" = round(SMES.output_used, 0.1),
			"output_max" = SMES.output_level_max,
			"RCON_tag" = SMES.RCon_tag
		))
	data["smeses"] = smeses

	var/list/breakers = list()
	for(var/obj/machinery/power/breakerbox/BR in known_breakers)
		breakers += list(list(
			"RCON_tag" = BR.RCon_tag,
			"enabled" = BR.on
		))
	data["breakers"] = breakers

	return data

/datum/tgui_module/rcon/ui_act(action, list/params, datum/tgui/ui, datum/ui_state/state)
	. = ..()
	if(.)
		return

	switch(action)
		if("smes_in_toggle")
			var/obj/machinery/power/smes/buildable/SMES = GetSMESByTag(params["smes"])
			if(SMES)
				SMES.toggle_input()
			. = TRUE

		if("smes_out_toggle")
			var/obj/machinery/power/smes/buildable/SMES = GetSMESByTag(params["smes"])
			if(SMES)
				SMES.toggle_output()
			. = TRUE

		if("smes_in_set")
			var/obj/machinery/power/smes/buildable/SMES = GetSMESByTag(params["smes"])
			if(SMES)
				var/new_val = CLAMP(params["value"], 0, SMES.input_level_max)
				SMES.set_input(new_val)
			. = TRUE

		if("smes_out_set")
			var/obj/machinery/power/smes/buildable/SMES = GetSMESByTag(params["smes"])
			if(SMES)
				var/new_val = CLAMP(params["value"], 0, SMES.output_level_max)
				SMES.set_output(new_val)
			. = TRUE

		if("toggle_breaker")
			var/obj/machinery/power/breakerbox/toggle = GetBreakerByTag(params["breaker"])
			if(toggle)
				if(toggle.update_locked)
					to_chat(usr, "The breaker box was recently toggled. Please wait before toggling it again.")
				else
					toggle.auto_toggle()
			. = TRUE

/datum/tgui_module/rcon/proc/FindDevices()
	known_SMESs = list()
	for(var/obj/machinery/power/smes/buildable/SMES in GLOB.machines)
		if(SMES.RCon_tag && (SMES.RCon_tag != "NO_TAG") && SMES.RCon)
			known_SMESs.Add(SMES)

	known_breakers = list()
	for(var/obj/machinery/power/breakerbox/breaker in GLOB.machines)
		if(breaker.RCon_tag != "NO_TAG")
			known_breakers.Add(breaker)

/datum/tgui_module/rcon/proc/GetSMESByTag(var/tag)
	if(!tag)
		return

	for(var/obj/machinery/power/smes/buildable/S in known_SMESs)
		if(S.RCon_tag == tag)
			return S

/datum/tgui_module/rcon/proc/GetBreakerByTag(var/tag)
	if(!tag)
		return

	for(var/obj/machinery/power/breakerbox/breaker in known_breakers)
		if(breaker.RCon_tag == tag)
			return breaker
