/obj/machinery/portable_atmospherics/powered/pump
	name = "portable air pump"

	icon = 'icons/obj/atmos.dmi'
	icon_state = "psiphon:0"
	density = 1
	w_class = ITEM_SIZE_NORMAL

	var/on = 0
	var/direction_out = 0 //0 = siphoning, 1 = releasing
	var/target_pressure = ONE_ATMOSPHERE

	var/pressuremin = 0
	var/pressuremax = 10 * ONE_ATMOSPHERE

	volume = 1000

	power_rating = 7500 //7500 W ~ 10 HP
	power_losses = 150

/obj/machinery/portable_atmospherics/powered/pump/filled
	start_pressure = 90 * ONE_ATMOSPHERE

/obj/machinery/portable_atmospherics/powered/pump/New()
	..()
	cell = new/obj/item/cell/large/high(src)

	var/list/air_mix = StandardAirMix()
	src.air_contents.adjust_multi("oxygen", air_mix["oxygen"], "nitrogen", air_mix["nitrogen"])

/obj/machinery/portable_atmospherics/powered/pump/update_icon()
	src.cut_overlays()

	if(on && cell && cell.charge)
		icon_state = "psiphon:1"
	else
		icon_state = "psiphon:0"

	if(holding)
		add_overlay("siphon-open")

	if(connected_port)
		add_overlay("siphon-connector")

	return

/obj/machinery/portable_atmospherics/powered/pump/emp_act(severity)
	if(stat & (BROKEN|NOPOWER))
		..(severity)
		return

	if(prob(50/severity))
		on = !on

	if(prob(100/severity))
		direction_out = !direction_out

	target_pressure = rand(0,1300)
	update_icon()

	..(severity)

/obj/machinery/portable_atmospherics/powered/pump/Process()
	..()
	var/power_draw = -1

	if(on && cell && cell.charge)
		var/datum/gas_mixture/environment
		if(holding)
			environment = holding.air_contents
		else
			environment = loc.return_air()

		var/pressure_delta
		var/output_volume
		var/air_temperature
		if(direction_out)
			pressure_delta = target_pressure - environment.return_pressure()
			output_volume = environment.volume * environment.group_multiplier
			air_temperature = environment.temperature? environment.temperature : air_contents.temperature
		else
			pressure_delta = environment.return_pressure() - target_pressure
			output_volume = air_contents.volume * air_contents.group_multiplier
			air_temperature = air_contents.temperature? air_contents.temperature : environment.temperature

		var/transfer_moles = pressure_delta*output_volume/(air_temperature * R_IDEAL_GAS_EQUATION)

		if (pressure_delta > 0.01)
			if (direction_out)
				power_draw = pump_gas(src, air_contents, environment, transfer_moles, power_rating)
			else
				power_draw = pump_gas(src, environment, air_contents, transfer_moles, power_rating)

	if (power_draw < 0)
		last_flow_rate = 0
		last_power_draw = 0
	else
		power_draw = max(power_draw, power_losses)
		cell.use(power_draw * CELLRATE)
		last_power_draw = power_draw

		update_connected_network()

		//ran out of charge
		if (!cell.charge)
			power_change()
			update_icon()

	src.updateDialog()

/obj/machinery/portable_atmospherics/powered/pump/return_air()
	return air_contents

/obj/machinery/portable_atmospherics/powered/pump/attack_ai(var/mob/user)
	src.add_hiddenprint(user)
	return src.attack_hand(user)

/obj/machinery/portable_atmospherics/powered/pump/attack_ghost(var/mob/user)
	return src.attack_hand(user)

/obj/machinery/portable_atmospherics/powered/pump/attack_hand(var/mob/user)
	return ui_interact(user)

/obj/machinery/portable_atmospherics/powered/pump/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "AtmosPumpPortable", name)
		ui.open()

/obj/machinery/portable_atmospherics/powered/pump/ui_data(mob/user)
	var/list/data = list()

	data["on"] = !!on
	data["connected"] = !!connected_port
	data["pressure"] = round(air_contents.return_pressure() > 0 ? air_contents.return_pressure() : 0)
	data["pumpDir"] = direction_out
	data["targetpressure"] = round(target_pressure)
	data["defaultPressure"] =  initial(target_pressure)
	data["minPressure"] = round(pressuremin)
	data["maxPressure"] = round(pressuremax)
	data["powerDraw"] = round(last_power_draw)

	if(cell)
		data["cell"] = list(
			"charge" = cell.charge,
			"maxCharge" = cell.maxcharge
		)
	else
		data["cell"] = null

	if(holding)
		data["holding"] = list(
			"name" = holding.name,
			"pressure" = round(holding.air_contents.return_pressure())
		)
	else
		data["holding"] = null

	return data

/obj/machinery/portable_atmospherics/powered/pump/ui_act(action, list/params, datum/tgui/ui, datum/ui_state/state)
	. = ..()
	if(.)
		return

	switch(action)
		if("power")
			on = !on
			. = TRUE
		if("direction")
			direction_out = !direction_out
			. = TRUE
		if("remove_tank")
			if(holding)
				holding.forceMove(loc)
				holding = null
			. = TRUE
		if("set_pressure")
			target_pressure = CLAMP(params["pressure"], 0, 10 * ONE_ATMOSPHERE)
			. = TRUE

	if(.)
		add_fingerprint(usr)
		playsound(src, 'sound/machines/machine_switch.ogg', 100, 1)
		update_icon()
