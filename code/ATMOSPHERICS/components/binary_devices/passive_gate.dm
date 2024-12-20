#define REGULATE_NONE	0
#define REGULATE_INPUT	1	//shuts off when input side is below the target pressure
#define REGULATE_OUTPUT	2	//shuts off when output side is above the target pressure

/obj/machinery/atmospherics/binary/passive_gate
	icon = 'icons/atmos/passive_gate.dmi'
	icon_state = "map"
	level = BELOW_PLATING_LEVEL

	name = "pressure regulator"
	desc = "A one-way air valve that can be used to regulate input or output pressure, and flow rate. Does not require power."

	use_power = NO_POWER_USE
	interact_offline = 1
	var/unlocked = 0	//If 0, then the valve is locked closed, otherwise it is open(-able, it's a one-way valve so it closes if gas would flow backwards).
	var/target_pressure = ONE_ATMOSPHERE
	var/max_pressure_setting = 15000	//kPa
	var/set_flow_rate = ATMOS_DEFAULT_VOLUME_PUMP * 2.5
	var/regulate_mode = REGULATE_OUTPUT

	var/flowing = 0	//for icons - becomes zero if the valve closes itself due to regulation mode

	var/frequency = 0
	var/id
	var/datum/radio_frequency/radio_connection

/obj/machinery/atmospherics/binary/passive_gate/New()
	..()
	air1.volume = ATMOS_DEFAULT_VOLUME_PUMP * 2.5
	air2.volume = ATMOS_DEFAULT_VOLUME_PUMP * 2.5

/obj/machinery/atmospherics/binary/passive_gate/update_icon()
	icon_state = (unlocked && flowing)? "on" : "off"

/obj/machinery/atmospherics/binary/passive_gate/update_underlays()
	if(..())
		underlays.Cut()
		var/turf/T = get_turf(src)
		if(!istype(T))
			return
		add_underlay(T, node1, turn(dir, 180))
		add_underlay(T, node2, dir)

/obj/machinery/atmospherics/binary/passive_gate/hide(var/i)
	update_underlays()

/obj/machinery/atmospherics/binary/passive_gate/Process()
	..()

	last_flow_rate = 0

	if(!unlocked)
		return 0

	var/output_starting_pressure = air2.return_pressure()
	var/input_starting_pressure = air1.return_pressure()

	var/pressure_delta
	switch (regulate_mode)
		if (REGULATE_INPUT)
			pressure_delta = input_starting_pressure - target_pressure
		if (REGULATE_OUTPUT)
			pressure_delta = target_pressure - output_starting_pressure

	//-1 if pump_gas() did not move any gas, >= 0 otherwise
	var/returnval = -1
	if((regulate_mode == REGULATE_NONE) || (pressure_delta > 0.01))
		flowing = 1

		//flow rate limit
		var/transfer_flow_rate_limit = (set_flow_rate/air1.volume)*air1.total_moles
		var/transfer_moles = 0
		//Figure out how much gas to transfer to meet the target pressure.
		switch (regulate_mode)
			if (REGULATE_INPUT)
				if (input_starting_pressure > output_starting_pressure)
					transfer_moles = calculate_equalize_moles(air1, air2)
			if (REGULATE_OUTPUT)
				transfer_moles = calculate_transfer_moles(air1, air2, pressure_delta, (network2)? network2.volume : 0)
			if (REGULATE_NONE)
				transfer_moles = transfer_flow_rate_limit

		if (transfer_moles > 0)
			//pump_gas() will return a negative number if no flow occurred
			returnval = pump_gas_passive(src, air1, air2, min(transfer_flow_rate_limit,transfer_moles))

	if (returnval >= 0)
		if(network1)
			network1.update = 1

		if(network2)
			network2.update = 1

	if (last_flow_rate)
		flowing = 1

	update_icon()


//Radio remote control

/obj/machinery/atmospherics/binary/passive_gate/proc/set_frequency(new_frequency)
	SSradio.remove_object(src, frequency)
	frequency = new_frequency
	if(frequency)
		radio_connection = SSradio.add_object(src, frequency, filter = RADIO_ATMOSIA)

/obj/machinery/atmospherics/binary/passive_gate/proc/broadcast_status()
	if(!radio_connection)
		return 0

	var/datum/signal/signal = new
	signal.transmission_method = 1 //radio signal
	signal.source = src

	signal.data = list(
		"tag" = id,
		"device" = "AGP",
		"power" = unlocked,
		"target_output" = target_pressure,
		"regulate_mode" = regulate_mode,
		"set_flow_rate" = set_flow_rate,
		"sigtype" = "status"
	)

	radio_connection.post_signal(src, signal, filter = RADIO_ATMOSIA)

	return 1

/obj/machinery/atmospherics/binary/passive_gate/atmos_init()
	..()
	if(frequency)
		set_frequency(frequency)

/obj/machinery/atmospherics/binary/passive_gate/receive_signal(datum/signal/signal)
	if(!signal.data["tag"] || (signal.data["tag"] != id) || (signal.data["sigtype"]!="command"))
		return 0

	if("power" in signal.data)
		unlocked = text2num(signal.data["power"])
		investigate_log("was [unlocked ? "enabled" : "disabled"] by a remote signal", "atmos")

	if("power_toggle" in signal.data)
		investigate_log("was [unlocked ? "disabled" : "enabled"] by a remote signal", "atmos")
		unlocked = !unlocked

	if("set_target_pressure" in signal.data)
		target_pressure = between(
			0,
			text2num(signal.data["set_target_pressure"]),
			max_pressure_setting
		)
		investigate_log("had it's pressure changed to [target_pressure] by a remote signal", "atmos")

	if("set_regulate_mode" in signal.data)
		regulate_mode = text2num(signal.data["set_regulate_mode"])

	if("set_flow_rate" in signal.data)
		regulate_mode = text2num(signal.data["set_flow_rate"])

	if("status" in signal.data)
		spawn(2)
			broadcast_status()
		return //do not update_icon

	spawn(2)
		broadcast_status()
	update_icon()
	return

/obj/machinery/atmospherics/binary/passive_gate/attack_hand(user as mob)
	if(..())
		return
	src.add_fingerprint(usr)
	if(!src.allowed(user))
		to_chat(user, SPAN_WARNING("Access denied."))
		return
	usr.set_machine(src)
	ui_interact(user)
	return

/obj/machinery/atmospherics/binary/passive_gate/attackby(var/obj/item/I, var/mob/user)
	if(!(QUALITY_BOLT_TURNING in I.tool_qualities))
		return ..()
	if (unlocked)
		to_chat(user, SPAN_WARNING("You cannot unwrench \the [src], turn it off first."))
		return 1
	var/datum/gas_mixture/int_air = return_air()
	var/datum/gas_mixture/env_air = loc.return_air()
	if ((int_air.return_pressure()-env_air.return_pressure()) > 2*ONE_ATMOSPHERE)
		to_chat(user, SPAN_WARNING("You cannot unwrench \the [src], it too exerted due to internal pressure."))
		add_fingerprint(user)
		return 1
	to_chat(user, SPAN_NOTICE("You begin to unfasten \the [src]..."))
	if(I.use_tool(user, src, WORKTIME_FAST, QUALITY_BOLT_TURNING, FAILCHANCE_EASY, required_stat = STAT_MEC))
		user.visible_message( \
			SPAN_NOTICE("\The [user] unfastens \the [src]."), \
			SPAN_NOTICE("You have unfastened \the [src]."), \
			"You hear ratchet.")
		investigate_log("was unfastened by [key_name(user)]", "atmos")
		new /obj/item/pipe(loc, make_from=src)
		qdel(src)

//tgui stuff
/obj/machinery/atmospherics/binary/passive_gate/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "AtmosPump", name)
		ui.open()

/obj/machinery/atmospherics/binary/passive_gate/ui_data()
	var/data = list()
	data["on"] = unlocked
	data["pressure"] = round(target_pressure)
	data["max_pressure"] = round(max_pressure_setting)
	return data

/obj/machinery/atmospherics/binary/passive_gate/ui_act(action, params)
	. = ..()
	if(.)
		return
	switch(action)
		if("power")
			unlocked = !unlocked
			investigate_log("was [unlocked ? "disabled" : "enabled"] by [key_name(usr)]", "atmos")
			. = TRUE
		if("pressure")
			var/pressure = params["pressure"]
			if(pressure == "max")
				pressure = max_pressure_setting
				. = TRUE
			else if(text2num(pressure) != null)
				pressure = text2num(pressure)
				. = TRUE
			if(.)
				target_pressure = clamp(pressure, 0, ONE_ATMOSPHERE*100)
				investigate_log("had it's pressure changed to [target_pressure] by [key_name(usr)]", "atmos")
	update_icon()



#undef REGULATE_NONE
#undef REGULATE_INPUT
#undef REGULATE_OUTPUT
