/obj/machinery/atmospherics/pipe/simple/sink_heat
	icon = 'icons/obj/structures.dmi'
	icon_state = "down"
	name = "heatsink network pipe"
	desc = "A sturdy pipe that connects to a vast network of heat exchangers underground."
	volume = 2000
	var/temperature = T0C + 7 //We can be used for both heating and cooling. +7C being the underground water temperature
	var/effective = 1 //Number from 0 to 1. Allows us to regulate how much gas an engineer needs to put in to cool/heat what ever system

/obj/machinery/atmospherics/pipe/simple/sink_heat/Process()
	if(!parent)
		..()
	else
		var/datum/gas_mixture/pipe_air = return_air()
		var/delta_temp = temperature - pipe_air.temperature
		pipe_air.temperature += delta_temp * clamp(effective,0,1)

/obj/machinery/atmospherics/pipe/simple/sink_heat/ex_act(severity)
	return //We are unique!

/obj/machinery/atmospherics/pipe/simple/sink_heat/attackby(obj/item/I, mob/user)
	return //Maybe for later

/obj/machinery/atmospherics/unary/sink_gas
	icon = 'icons/obj/structures.dmi'
	icon_state = "down"
	name = "air duct network pipe"
	desc = "A sturdy pipe that connects to a vast network of siphons and pumps to cycle outside air in and out."
	var/internal_volume = 200 //Depending on how big our volume is, the faster/slower we vent/siphon
	use_power = NO_POWER_USE
	var/target_pressure = ONE_ATMOSPHERE
	var/datum/gas_mixture/target_gas

/obj/machinery/atmospherics/unary/sink_gas/New()
	..()
	target_gas = new
	target_gas.volume = internal_volume
	target_gas.temperature = T20C
	air_contents.volume = internal_volume
	target_gas.adjust_multi("oxygen",  (target_pressure*O2STANDARD)*(target_gas.volume)/(R_IDEAL_GAS_EQUATION*target_gas.temperature), \
	                        "nitrogen",(target_pressure*N2STANDARD)*(target_gas.volume)/(R_IDEAL_GAS_EQUATION*target_gas.temperature))

/obj/machinery/atmospherics/unary/sink_gas/Process()
	if(network)
		air_contents.gas = target_gas.gas
		air_contents.temperature = target_gas.temperature
		network.update = 1

/obj/machinery/atmospherics/unary/sink_gas/ex_act(severity)
	return //We are unique!

/obj/machinery/atmospherics/unary/sink_gas/attackby(obj/item/I, mob/user)
	return //Maybe for later
