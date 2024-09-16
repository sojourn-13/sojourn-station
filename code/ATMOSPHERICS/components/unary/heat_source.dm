//TODO: Put this under a common parent type with freezers to cut down on the copypasta
#define HEATER_PERF_MULT 2.5

/obj/machinery/atmospherics/unary/heater
	name = "gas heating system"
	desc = "Heats gas when connected to a pipe network"
	icon = 'icons/obj/Cryogenic2.dmi'
	icon_state = "heater_0"
	density = TRUE
	anchored = TRUE
	use_power = NO_POWER_USE
	idle_power_usage = 5			//5 Watts for thermostat related circuitry
	circuit = /obj/item/circuitboard/unary_atmos/heater

	var/max_temperature = T20C + 680
	var/internal_volume = 600	//L

	var/max_power_rating = 20000	//power rating when the usage is turned up to 100
	var/power_setting = 100

	var/set_temperature = T20C	//thermostat
	var/heating = 0		//mainly for icon updates

/obj/machinery/atmospherics/unary/heater/New()
	initialize_directions = dir
	..()

/obj/machinery/atmospherics/unary/heater/atmos_init()
	if(node1)
		return

	var/node1_connect = dir

	//check that there is something to connect to
	for(var/obj/machinery/atmospherics/target in get_step(src, node1_connect))
		if(target.initialize_directions & get_dir(target, src))
			node1 = target
			break

	//copied from pipe construction code since heaters/freezers don't use fittings and weren't doing this check - this all really really needs to be refactored someday.
	//check that there are no incompatible pipes/machinery in our own location
	for(var/obj/machinery/atmospherics/M in src.loc)
		if(M != src && (M.initialize_directions & node1_connect) && M.check_connect_types(M, src))	// matches at least one direction on either type of pipe & same connection type
			node1 = null
			break

	update_icon()


/obj/machinery/atmospherics/unary/heater/update_icon()
	if(node1)
		if(use_power && heating)
			icon_state = "heater_1"
		else
			icon_state = "heater"
	else
		icon_state = "heater_0"
	return


/obj/machinery/atmospherics/unary/heater/Process()
	..()

	if(stat & (NOPOWER|BROKEN) || !use_power)
		heating = 0
		update_icon()
		return

	if(network && air_contents.total_moles && air_contents.temperature < set_temperature)
		air_contents.add_thermal_energy(power_rating * HEATER_PERF_MULT)
		use_power(power_rating)

		heating = 1
		network.update = 1
	else
		heating = 0

	update_icon()

/obj/machinery/atmospherics/unary/heater/attack_hand(mob/user)
	ui_interact(user)

/obj/machinery/atmospherics/unary/heater/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "GasTemperatureControl", name)
		ui.open()

/obj/machinery/atmospherics/unary/heater/ui_data(mob/user)
	var/list/data = list()

	data["on"] = !!use_power
	data["gasPressure"] = round(air_contents.return_pressure())
	data["gasTemperature"] = round(air_contents.temperature)
	data["minGasTemperature"] = 0
	data["maxGasTemperature"] = round(max_temperature)
	data["targetGasTemperature"] = round(set_temperature)
	data["powerSetting"] = power_setting

	var/temp_class = "average"
	if(air_contents.temperature > (T20C+40))
		temp_class = "bad"
	data["gasTemperatureClass"] = temp_class

	return data

/obj/machinery/atmospherics/unary/heater/ui_act(action, list/params, datum/tgui/ui, datum/ui_state/state)
	. = ..()
	if(.)
		return

	switch(action)
		if("toggleStatus")
			use_power = !use_power
			update_icon()
			. = TRUE
		if("temp")
			set_temperature = clamp(text2num(params["temp"]), 0, max_temperature)
			. = TRUE
		if("setPower")
			var/new_setting = clamp(text2num(params["setPower"]), 0, 100)
			set_power_level(new_setting)
			. = TRUE

	if(.)
		playsound(loc, 'sound/machines/machine_switch.ogg', 100, 1)
		add_fingerprint(usr)

//upgrading parts
/obj/machinery/atmospherics/unary/heater/RefreshParts()
	..()
	var/cap_rating = 0
	var/bin_rating = 0

	for(var/obj/item/stock_parts/P in component_parts)
		if(istype(P, /obj/item/stock_parts/capacitor))
			cap_rating += P.rating
		if(istype(P, /obj/item/stock_parts/matter_bin))
			bin_rating += P.rating

	max_power_rating = initial(max_power_rating) * cap_rating / 2
	max_temperature = max(initial(max_temperature) - T20C, 0) * ((bin_rating * 4 + cap_rating) / 5) + T20C
	if(air_contents)
		air_contents.volume = max(initial(internal_volume) - 200, 0) + 200 * bin_rating
	set_power_level(power_setting)

/obj/machinery/atmospherics/unary/heater/proc/set_power_level(var/new_power_setting)
	power_setting = new_power_setting
	power_rating = max_power_rating * (power_setting/100)

/obj/machinery/atmospherics/unary/heater/attackby(var/obj/item/I as obj, var/mob/user as mob)

	if(default_deconstruction(I, user))
		return

	if(default_part_replacement(I, user))
		return

	return

/obj/machinery/atmospherics/unary/heater/examine(mob/user)
	..(user)
	if(panel_open)
		to_chat(user, "The maintenance hatch is open.")
