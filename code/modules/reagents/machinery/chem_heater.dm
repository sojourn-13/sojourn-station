/obj/machinery/chem_heater
	name = "chemical heater"
	density = TRUE
	anchored = TRUE
	icon = 'icons/obj/chemical.dmi'
	icon_state = "mixer0b"
	use_power = IDLE_POWER_USE
	idle_power_usage = 40
	//resistance_flags = FIRE_PROOF | ACID_PROOF
	circuit = /obj/item/circuitboard/chem_heater
	var/obj/item/reagent_containers/beaker = null
	var/target_temperature = 300
	var/heater_coefficient = 0.2
	var/on = FALSE

/obj/machinery/chem_heater/Destroy()
	QDEL_NULL(beaker)
	return ..()

/obj/machinery/chem_heater/handle_atom_del(atom/A)
	. = ..()
	if(A == beaker)
		beaker = null
		update_icon()

/obj/machinery/chem_heater/update_icon()
	if(beaker)
		icon_state = "mixer1b"
	else
		icon_state = "mixer0b"

/obj/machinery/chem_heater/AltClick(mob/living/user)
	if(!istype(user) || user.incapacitated())
		return

	if(!in_range(src, user))
		return

	replace_beaker(user)

/obj/machinery/chem_heater/proc/replace_beaker(mob/living/user, obj/item/reagent_containers/new_beaker)
	if(beaker)
		beaker.forceMove(drop_location())
		if(istype(user) && Adjacent(user))
			user.put_in_hands(beaker)
	if(new_beaker)
		beaker = new_beaker
	else
		beaker = null
	update_icon()
	return TRUE

/obj/machinery/chem_heater/RefreshParts()
	heater_coefficient = initial(heater_coefficient)
	for(var/obj/item/stock_parts/micro_laser/M in component_parts)
		heater_coefficient *= M.rating

/obj/machinery/chem_heater/Process()
	..()
	if(stat & NOPOWER)
		return
	if(on && beaker && beaker.reagents.total_volume)
		beaker.reagents.adjust_thermal_energy((target_temperature - beaker.reagents.chem_temp) * heater_coefficient * SPECIFIC_HEAT_DEFAULT * beaker.reagents.total_volume)
		beaker.reagents.handle_reactions()
		SStgui.update_uis(src)

/obj/machinery/chem_heater/attackby(obj/item/I, mob/user, params)
	if(default_deconstruction(I, user))
		return

	if(default_part_replacement(I, user))
		return

	if(istype(I, /obj/item/reagent_containers) && I.is_open_container())
		. = TRUE //no afterattack
		var/obj/item/reagent_containers/B = I
		if(!user.unEquip(B, src))
			return
		replace_beaker(user, B)
		to_chat(user, SPAN_NOTICE("You add [B] to [src]."))
		update_icon()
		SStgui.update_uis(src)
		return
	return ..()

/obj/machinery/chem_heater/on_deconstruction()
	replace_beaker()
	..()

/obj/machinery/chem_heater/attack_hand(mob/user)
	if(!user.stats?.getPerk(PERK_MEDICAL_EXPERT) && !user.stat_check(STAT_BIO, STAT_LEVEL_BASIC) && !usr.stat_check(STAT_COG, 30)) //Are we missing the perk AND to low on bio? Needs bio 25 so cog 50 to bypass
		to_chat(usr, SPAN_WARNING("Your biological understanding isn't enough to use this."))
		return

	if(..())
		return TRUE

	user.set_machine(src)
	ui_interact(user)

/obj/machinery/chem_heater/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "ChemHeater", name)
		ui.open()

/obj/machinery/chem_heater/ui_data(mob/user)
	var/list/data = list()

	data["target_temperature"] = target_temperature
	data["on"] = on

	if(beaker)
		data["beaker"] = beaker.reagents.nano_ui_data()
	else
		data["beaker"] = null

	return data

/obj/machinery/chem_heater/ui_act(action, list/params, datum/tgui/ui, datum/ui_state/state)
	. = ..()
	if(.)
		return

	switch(action)
		if("eject")
			on = FALSE
			replace_beaker(usr)
			. = TRUE
		if("temperature")
			target_temperature = CLAMP(text2num(params["temp"]), 0, 1000)
			. = TRUE
		if("power")
			on = !on
			. = TRUE

	if(.)
		playsound(src, 'sound/machines/button.ogg', 100, 1)
