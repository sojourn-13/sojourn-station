// Air Sensors
/obj/machinery/air_sensor
	icon = 'icons/obj/stationobjs.dmi'
	icon_state = "gsensor1"
	name = "gas sensor"

	anchored = 1
	var/state = 0

	var/id_tag
	var/frequency = 1439

	var/on = 1
	var/output = 3
	//Flags:
	// 1 for pressure
	// 2 for temperature
	// Output >= 4 includes gas composition
	// 4 for oxygen concentration
	// 8 for plasma concentration
	// 16 for nitrogen concentration
	// 32 for carbon dioxide concentration

	var/datum/radio_frequency/radio_connection

/obj/machinery/air_sensor/update_icon()
	icon_state = "gsensor[on]"

/obj/machinery/air_sensor/Process()
	if(on)
		var/datum/signal/signal = new
		signal.transmission_method = 1 //radio signal
		signal.data["tag"] = id_tag
		signal.data["timestamp"] = world.time

		var/datum/gas_mixture/air_sample = return_air()

		if(output&1)
			signal.data["pressure"] = num2text(round(air_sample.return_pressure(),0.1),)
		if(output&2)
			signal.data["temperature"] = round(air_sample.temperature,0.1)

		if(output>4)
			var/total_moles = air_sample.total_moles
			if(total_moles > 0)
				if(output&4)
					signal.data["oxygen"] = round(100*air_sample.gas["oxygen"]/total_moles,0.1)
				if(output&8)
					signal.data["plasma"] = round(100*air_sample.gas["plasma"]/total_moles,0.1)
				if(output&16)
					signal.data["nitrogen"] = round(100*air_sample.gas["nitrogen"]/total_moles,0.1)
				if(output&32)
					signal.data["carbon_dioxide"] = round(100*air_sample.gas["carbon_dioxide"]/total_moles,0.1)
			else
				signal.data["oxygen"] = 0
				signal.data["plasma"] = 0
				signal.data["nitrogen"] = 0
				signal.data["carbon_dioxide"] = 0
		signal.data["sigtype"]="status"
		radio_connection.post_signal(src, signal, filter = RADIO_ATMOSIA)

/obj/machinery/air_sensor/proc/set_frequency(new_frequency)
	SSradio.remove_object(src, frequency)
	frequency = new_frequency
	radio_connection = SSradio.add_object(src, frequency, RADIO_ATMOSIA)

/obj/machinery/air_sensor/Initialize()
	set_frequency(frequency)
	. = ..()

/obj/machinery/air_sensor/Destroy()
	SSradio.remove_object(src,frequency)
	. = ..()

// General Air Control
/obj/machinery/computer/general_air_control
	icon = 'icons/obj/computer.dmi'
	icon_keyboard = "atmos_key"
	icon_screen = "tank"

	name = "computer"

	var/frequency = 1439
	var/list/sensors = list()

	var/list/sensor_information = list()
	var/datum/radio_frequency/radio_connection
	circuit = /obj/item/circuitboard/air_management

	// For TGUI
	var/waiting_on_signal = FALSE

/obj/machinery/computer/general_air_control/Initialize()
	. = ..()
	set_frequency(frequency)

/obj/machinery/computer/general_air_control/Destroy()
	SSradio.remove_object(src, frequency)
	. = ..()

/obj/machinery/computer/general_air_control/attack_hand(mob/user)
	if(..(user))
		return
	ui_interact(user)

/obj/machinery/computer/general_air_control/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "GeneralAirControl", name)
		ui.open()

/obj/machinery/computer/general_air_control/ui_data(mob/user)
	var/list/data = list()

	data["waiting_on_signal"] = waiting_on_signal

	var/list/sensor_data = list()
	for(var/id_tag in sensors)
		var/list/sensor_part = list(
			"long_name" = sensors[id_tag],
			"pressure" = null,
			"temperature" = null,
			// Percentages
			"gas" = list(
				"oxygen" = null,
				"plasma" = null,
				"nitrogen" = null,
				"carbon_dioxide" = null
			)
		)

		var/list/info = sensor_information[id_tag]
		if(info)
			if(info["pressure"])
				sensor_part["pressure"] = text2num(info["pressure"])
			if(info["temperature"])
				sensor_part["temperature"] = info["temperature"]
			if(info["oxygen"])
				sensor_part["gas"]["oxygen"] = info["oxygen"]
			if(info["plasma"])
				sensor_part["gas"]["plasma"] = info["plasma"]
			if(info["nitrogen"])
				sensor_part["gas"]["nitrogen"] = info["nitrogen"]
			if(info["carbon_dioxide"])
				sensor_part["gas"]["carbon_dioxide"] = info["carbon_dioxide"]

		sensor_data += list(sensor_part)

	data["sensors"] = sensor_data

	return data

/obj/machinery/computer/general_air_control/receive_signal(datum/signal/signal)
	if(!signal || signal.encryption) return

	var/id_tag = signal.data["tag"]
	if(!id_tag || !sensors.Find(id_tag)) return

	waiting_on_signal = FALSE

	sensor_information[id_tag] = signal.data

/obj/machinery/computer/general_air_control/proc/set_frequency(new_frequency)
	SSradio.remove_object(src, frequency)
	frequency = new_frequency
	radio_connection = SSradio.add_object(src, frequency, RADIO_ATMOSIA)

// Large Tank Control
/obj/machinery/computer/general_air_control/large_tank_control
	icon = 'icons/obj/computer.dmi'

	frequency = 1441
	var/input_tag
	var/output_tag

	var/list/input_info
	var/list/output_info

	circuit = /obj/item/circuitboard/air_management/tank_control

/obj/machinery/computer/general_air_control/large_tank_control/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "GeneralAirControlInputOutput", name)
		ui.open()

/obj/machinery/computer/general_air_control/large_tank_control/ui_data(mob/user)
	var/list/data = ..()

	if(input_info)
		data["input"] = list(
			"name" = "Input",
			"power" = input_info["power"],
			"volume_rate" = round(input_info["volume_rate"], 0.01),
			"max" = ATMOS_DEFAULT_VOLUME_PUMP + 500
		)
	else
		data["input"] = null

	if(output_info)
		data["output"] = list(
			"name" = "Output",
			"power" = output_info["power"],
			"pressure" = round(output_info["internal"], 0.01),
			"max" = 50 * ONE_ATMOSPHERE
		)
	else
		data["output"] = null

	return data

/obj/machinery/computer/general_air_control/large_tank_control/ui_act(action, list/params, datum/tgui/ui, datum/ui_state/state)
	. = ..()
	if(.)
		return
	
	if(!radio_connection)
		return FALSE

	var/list/signal_data = list()
	switch(action)
		if("in_refresh_status")
			input_info = null
			signal_data = list("tag" = input_tag, "status" = 1)

		if("in_toggle_injector")
			signal_data = list("tag" = input_tag, "power_toggle" = 1)

		if("in_set_flowrate")
			var/value = between(0, text2num(params["value"]), ATMOS_DEFAULT_VOLUME_PUMP + 500)
			signal_data = list("tag" = input_tag, "set_volume_rate" = "[value]")

		if("out_refresh_status")
			output_info = null
			signal_data = list("tag" = output_tag, "status" = 1)

		if("out_toggle_power")
			signal_data = list("tag" = output_tag, "power_toggle" = 1)

		if("out_set_pressure")
			var/value = between(0, text2num(params["value"]), 50 * ONE_ATMOSPHERE)
			signal_data = list("tag" = output_tag, "set_internal_pressure" = "[value]")

		else
			return FALSE

	. = TRUE
	waiting_on_signal = TRUE
	var/datum/signal/signal = new()
	// radio signal
	signal.transmission_method = 1
	signal.source = src
	signal.data = signal_data
	signal.data["sigtype"] = "command"
	radio_connection.post_signal(src, signal, filter = RADIO_ATMOSIA)
	// We only get here by having done something, so we always click (invalid gets caught by else return FALSE)
	keyboardsound()

/obj/machinery/computer/general_air_control/large_tank_control/receive_signal(datum/signal/signal)
	if(!signal || signal.encryption) return

	var/id_tag = signal.data["tag"]

	if(input_tag == id_tag)
		input_info = signal.data
		waiting_on_signal = FALSE
	else if(output_tag == id_tag)
		output_info = signal.data
		waiting_on_signal = FALSE
	else
		..(signal)

// Supermatter Core
// TODO: This should just be a subtype of tank control
/obj/machinery/computer/general_air_control/supermatter_core
	icon = 'icons/obj/computer.dmi'

	frequency = 1438
	var/input_tag
	var/output_tag

	var/list/input_info
	var/list/output_info

	circuit = /obj/item/circuitboard/air_management/supermatter_core

/obj/machinery/computer/general_air_control/supermatter_core/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "GeneralAirControlInputOutput", name)
		ui.open()

/obj/machinery/computer/general_air_control/supermatter_core/ui_data(mob/user)
	var/list/data = ..()

	if(input_info)
		data["input"] = list(
			"name" = "Coolant Input",
			"power" = input_info["power"],
			"volume_rate" = round(input_info["volume_rate"], 0.01),
			"max" = ATMOS_DEFAULT_VOLUME_PUMP + 500,
		)
	else
		data["input"] = null

	if(output_info)
		data["output"] = list(
			"name" = "Core Outpump",
			"power" = output_info["power"],
			"pressure" = round(output_info["external"], 0.01),
			"max" = 10 * ONE_ATMOSPHERE,
		)
	else
		data["output"] = null

	return data

/obj/machinery/computer/general_air_control/supermatter_core/ui_act(action, list/params, datum/tgui/ui, datum/ui_state/state)
	. = ..()
	if(.)
		return

	if(!radio_connection)
		return FALSE
	
	var/list/signal_data = list()
	switch(action)
		if("in_refresh_status")
			input_info = null
			signal_data = list("tag" = input_tag, "status" = 1)

		if("in_toggle_injector")
			signal_data = list("tag" = input_tag, "power_toggle" = 1)

		if("in_set_flowrate")
			var/new_val = between(0, text2num(params["value"]), ATMOS_DEFAULT_VOLUME_PUMP + 500)
			signal_data = list("tag" = input_tag, "set_volume_rate" = "[new_val]")

		if("out_refresh_status")
			output_info = null
			signal_data = list("tag" = output_tag, "status" = 1)

		if("out_toggle_power")
			signal_data = list("tag" = output_tag, "power_toggle" = 1)

		if("out_set_pressure")
			var/new_val = between(0, text2num(params["value"]), 10 * ONE_ATMOSPHERE)
			signal_data = list("tag" = output_tag, "set_external_pressure" = "[new_val]", "checks" = 1)

		else
			return FALSE

	. = TRUE
	waiting_on_signal = TRUE
	var/datum/signal/signal = new
	signal.transmission_method = 1 //radio signal
	signal.source = src
	signal.data = signal_data
	signal.data["sigtype"] = "command"
	radio_connection.post_signal(src, signal, filter = RADIO_ATMOSIA)
	keyboardsound()

/obj/machinery/computer/general_air_control/supermatter_core/receive_signal(datum/signal/signal)
	if(!signal || signal.encryption) return

	var/id_tag = signal.data["tag"]

	if(input_tag == id_tag)
		input_info = signal.data
		waiting_on_signal = FALSE
	else if(output_tag == id_tag)
		output_info = signal.data
		waiting_on_signal = FALSE
	else
		..(signal)

// Fuel Injection
/obj/machinery/computer/general_air_control/fuel_injection
	icon = 'icons/obj/computer.dmi'
	icon_screen = "alert:0"

	var/device_tag
	var/list/device_info

	var/automation = 0

	var/cutoff_temperature = 2000
	var/on_temperature = 1200
	circuit = /obj/item/circuitboard/air_management/injector_control

/obj/machinery/computer/general_air_control/fuel_injection/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "GeneralAirControlFuelInjection", name)
		ui.open()

/obj/machinery/computer/general_air_control/fuel_injection/ui_data(mob/user)
	var/list/data = ..()

	data["automation"] = automation

	if(device_info)
		data["device"] = list(
			"power" = device_info["power"],
			"volume_rate" = round(device_info["volume_rate"], 0.01)
		)
	else
		data["device"] = null

	return data

/obj/machinery/computer/general_air_control/fuel_injection/ui_act(action, list/params, datum/tgui/ui, datum/ui_state/state)
	. = ..()
	if(.)
		return

	switch(action)
		if("toggle_automation")
			automation = !automation
			keyboardsound()
			return TRUE

	if(!radio_connection)
		return FALSE
	
	var/list/signal_data = list()
	switch(action)
		if("refresh_status")
			device_info = null
			signal_data = list(
				"tag" = device_tag,
				"status" = 1,
			)

		if("toggle_injector")
			signal_data = list(
				"tag" = device_tag,
				"power_toggle" = 1,
			)

		if("injection")
			signal_data = list(
				"tag" = device_tag,
				"inject" = 1,
			)

		else
			return FALSE

	. = TRUE
	waiting_on_signal = TRUE
	var/datum/signal/signal = new()
	signal.transmission_method = 1 //radio signal
	signal.source = src
	signal.data = signal_data
	signal.data["sigtype"] = "command"
	radio_connection.post_signal(src, signal, filter = RADIO_ATMOSIA)
	keyboardsound()

/obj/machinery/computer/general_air_control/fuel_injection/Process()
	if(automation)
		if(!radio_connection)
			return 0

		var/injecting = 0
		for(var/id_tag in sensor_information)
			var/list/data = sensor_information[id_tag]
			if(data["temperature"])
				if(data["temperature"] >= cutoff_temperature)
					injecting = 0
					break
				if(data["temperature"] <= on_temperature)
					injecting = 1

		var/datum/signal/signal = new
		signal.transmission_method = 1 //radio signal
		signal.source = src

		signal.data = list(
			"tag" = device_tag,
			"power" = injecting,
			"sigtype"="command"
		)

		radio_connection.post_signal(src, signal, filter = RADIO_ATMOSIA)

	..()

/obj/machinery/computer/general_air_control/fuel_injection/receive_signal(datum/signal/signal)
	if(!signal || signal.encryption) return

	var/id_tag = signal.data["tag"]

	if(device_tag == id_tag)
		device_info = signal.data
		waiting_on_signal = FALSE
	else
		..(signal)
