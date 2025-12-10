#define TANK_MAX_RELEASE_PRESSURE (3*ONE_ATMOSPHERE)
#define TANK_DEFAULT_RELEASE_PRESSURE 24
#define TANK_IDEAL_PRESSURE 1015 //Arbitrary.

var/list/global/tank_gauge_cache = list()

/obj/item/tank
	name = "tank"
	icon = 'icons/obj/tank.dmi'

	var/gauge_icon = "indicator-tank-big"
	var/last_gauge_pressure
	var/gauge_cap = 6

	flags = CONDUCT
	slot_flags = SLOT_BACK
	w_class = ITEM_SIZE_NORMAL

	force = WEAPON_FORCE_NORMAL
	throwforce = 10.0
	throw_speed = 1
	throw_range = 4

	var/datum/gas_mixture/air_contents = null
	var/distribute_pressure = ONE_ATMOSPHERE
	var/default_pressure = 3*ONE_ATMOSPHERE
	var/default_gas = null
	var/integrity = 3
	var/volume = 70 //liters
	var/manipulated_by = null		//Used by _onclick/hud/screen_objects.dm internals to determine if someone has messed with our tank or not.
						//If they have and we haven't scanned it with the PDA or gas analyzer then we might just breath whatever they put in it.

/obj/item/tank/Initialize(mapload, ...)
	. = ..()
	air_contents = new /datum/gas_mixture(volume)
	air_contents.temperature = T20C
	spawn_gas()
	START_PROCESSING(SSobj, src)
	update_gauge()

/obj/item/tank/Destroy()
	if(air_contents)
		QDEL_NULL(air_contents)

	STOP_PROCESSING(SSobj, src)

	if(istype(loc, /obj/item/device/transfer_valve))
		var/obj/item/device/transfer_valve/TTV = loc
		TTV.remove_tank(src)

	. = ..()

// Override in subtypes
/obj/item/tank/proc/spawn_gas()
	if(default_gas)
		air_contents.adjust_gas(default_gas, default_pressure*volume/(R_IDEAL_GAS_EQUATION*T20C))

/obj/item/tank/examine(mob/user)
	. = ..(user, 0)
	if(.)
		var/celsius_temperature = air_contents.temperature - T0C
		var/descriptive
		switch(celsius_temperature)
			if(300 to INFINITY)
				descriptive = "furiously hot"
			if(100 to 300)
				descriptive = "hot"
			if(80 to 100)
				descriptive = "warm"
			if(40 to 80)
				descriptive = "lukewarm"
			if(20 to 40)
				descriptive = "room temperature"
			else
				descriptive = "cold"
		to_chat(user, SPAN_NOTICE("\The [src] feels [descriptive]."))

/obj/item/tank/attackby(obj/item/W, mob/living/user)
	..()
	if (istype(src.loc, /obj/item/assembly))
		icon = src.loc
	else if (istype(W,/obj/item/latexballon))
		var/obj/item/latexballon/LB = W
		LB.blow(src)
		src.add_fingerprint(user)

	if(istype(W, /obj/item/device/assembly_holder))
		bomb_assemble(W,user)

/obj/item/tank/attack_self(mob/living/user)
	add_fingerprint(user)
	if (!(src.air_contents))
		return

	ui_interact(user)

/obj/item/tank/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "Tank", name)
		ui.open()

/obj/item/tank/ui_data(mob/user)
	var/list/data = list()
	data["tankPressure"] = round(air_contents.return_pressure() ? air_contents.return_pressure() : 0)
	data["releasePressure"] = round(distribute_pressure ? distribute_pressure : 0)
	data["defaultReleasePressure"] = round(TANK_DEFAULT_RELEASE_PRESSURE)
	data["minReleasePressure"] = 0
	data["maxReleasePressure"] = round(TANK_MAX_RELEASE_PRESSURE)
	data["showToggle"] = TRUE

	var/mob/living/carbon/C = loc
	if(!istype(C))
		C = loc.loc
		// Don't show a toggle that will never work
		data["showToggle"] = FALSE
	if(!istype(C))
		return data

	if(C.internal == src)
		data["connected"] = TRUE
	else
		data["connected"] = FALSE

	data["maskConnected"] = FALSE
	if(C.wear_mask && (C.wear_mask.item_flags & AIRTIGHT))
		data["maskConnected"] = TRUE
	else if(ishuman(C))
		var/mob/living/carbon/human/H = C
		if(H.head && (H.head.item_flags & AIRTIGHT))
			data["maskConnected"] = TRUE

	return data

/obj/item/tank/ui_act(action, list/params, datum/tgui/ui, datum/ui_state/state)
	. = ..()
	if(.)
		return

	switch(action)
		if("pressure")
			var/pressure = params["pressure"]
			if(pressure == "reset")
				pressure = TANK_DEFAULT_RELEASE_PRESSURE
				. = TRUE
			else if(pressure == "min")
				pressure = 0
				. = TRUE
			else if(pressure == "max")
				pressure = TANK_MAX_RELEASE_PRESSURE
				. = TRUE
			else if(text2num(pressure) != null)
				pressure = text2num(pressure)
				. = TRUE
			if(.)
				distribute_pressure = clamp(round(pressure), 0, TANK_MAX_RELEASE_PRESSURE)
		if("toggle")
			toggle_valve(usr)
			. = TRUE

	add_fingerprint(usr)

/obj/item/tank/ui_state(mob/user)
	return GLOB.deep_inventory_state

/obj/item/tank/proc/toggle_valve(var/mob/user)
	if(iscarbon(loc))
		var/mob/living/carbon/location = loc
		if(location.internal == src)
			location.internal = null
			to_chat(usr, SPAN_NOTICE("You close the tank release valve."))
		else
			var/can_open_valve
			if(location.wear_mask && (location.wear_mask.item_flags & AIRTIGHT))
				can_open_valve = 1
			else if(ishuman(location))
				var/mob/living/carbon/human/H = location
				if(H.head && (H.head.item_flags & AIRTIGHT))
					can_open_valve = 1
			if(can_open_valve)
				location.internal = src
				to_chat(usr, SPAN_NOTICE("You open \the [src] valve."))
				playsound(usr, 'sound/effects/Custom_internals.ogg', 100, 0)
			else
				to_chat(usr, SPAN_WARNING("You need something to connect to \the [src]."))
			if(location.HUDneed.Find("internal"))
				var/obj/screen/HUDelm = location.HUDneed["internal"]
				HUDelm.update_icon()
		src.add_fingerprint(usr)

/obj/item/tank/remove_air(amount)
	return air_contents.remove(amount)

/obj/item/tank/return_air()
	return air_contents

/obj/item/tank/assume_air(datum/gas_mixture/giver)
	air_contents.merge(giver)

	check_status()
	return 1

/obj/item/tank/proc/remove_air_volume(volume_to_return)
	if(!air_contents)
		return null

	var/tank_pressure = air_contents.return_pressure()
	if(tank_pressure < distribute_pressure)
		distribute_pressure = tank_pressure

	var/moles_needed = distribute_pressure*volume_to_return/(R_IDEAL_GAS_EQUATION*air_contents.temperature)

	return remove_air(moles_needed)

/obj/item/tank/proc/get_total_moles()
	if (air_contents)
		return air_contents.total_moles
	return 0

/obj/item/tank/Process()
	//Allow for reactions
	air_contents.react() //cooking up air tanks - add plasma and oxygen, then heat above PLASMA_MINIMUM_BURN_TEMPERATURE
	if(gauge_icon)
		update_gauge()
	check_status()

/obj/item/tank/proc/update_gauge()
	var/gauge_pressure = 0
	if(air_contents)
		gauge_pressure = air_contents.return_pressure()

	if(gauge_pressure == last_gauge_pressure)
		return

	last_gauge_pressure = gauge_pressure

	var/indicator
	if(gauge_pressure > TANK_IDEAL_PRESSURE)
		indicator = "[gauge_icon]-overload"
	else
		indicator = "[gauge_icon]-[round((gauge_pressure/default_pressure)*gauge_cap)]"

	cut_overlays()
	if(!tank_gauge_cache[indicator])
		tank_gauge_cache[indicator] = image(icon, indicator)
	add_overlay(tank_gauge_cache[indicator])

/obj/item/tank/proc/check_status()
	//Handle exploding, leaking, and rupturing of the tank

	if(!air_contents)
		return 0

	var/pressure = air_contents.return_pressure()
	if(pressure > TANK_FRAGMENT_PRESSURE)
		if(!istype(src.loc,/obj/item/device/transfer_valve))
			message_admins("Explosive tank rupture! last key to touch the tank was [src.fingerprintslast].")
			log_game("Explosive tank rupture! last key to touch the tank was [src.fingerprintslast].")

		//Give the gas a chance to build up more pressure through reacting
		air_contents.react()
		air_contents.react()
		air_contents.react()

		pressure = air_contents.return_pressure()
		var/range = (pressure-TANK_FRAGMENT_PRESSURE)/TANK_FRAGMENT_SCALE

		explosion(
			get_turf(loc),
			round(min(BOMBCAP_DVSTN_RADIUS, range*0.25)),
			round(min(BOMBCAP_HEAVY_RADIUS, range*0.50)),
			round(min(BOMBCAP_LIGHT_RADIUS, range*1.00)),
			round(min(BOMBCAP_FLASH_RADIUS, range*1.50)),
			)
		qdel(src)

	else if(pressure > TANK_RUPTURE_PRESSURE)
		#ifdef FIREDBG
		log_debug(SPAN_WARNING("[x],[y] tank is rupturing: [pressure] kPa, integrity [integrity]"))
		#endif

		if(integrity <= 0)
			var/turf/simulated/T = get_turf(src)
			if(!T)
				return
			T.assume_air(air_contents)
			playsound(src.loc, 'sound/effects/spray.ogg', 10, 1, -3)
			qdel(src)
		else
			integrity--

	else if(pressure > TANK_LEAK_PRESSURE && integrity <= 1)
		#ifdef FIREDBG
		log_debug(SPAN_WARNING("[x],[y] tank is leaking: [pressure] kPa, integrity [integrity]"))
		#endif

		if(integrity <= 0)
			var/turf/simulated/T = get_turf(src)
			if(!T)
				return
			var/datum/gas_mixture/leaked_gas = air_contents.remove_ratio(0.25)
			T.assume_air(leaked_gas)
		else
			integrity--

	else if(integrity < 3)
		integrity++
