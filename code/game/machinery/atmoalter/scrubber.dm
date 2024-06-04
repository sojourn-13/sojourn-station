/obj/machinery/portable_atmospherics/powered/scrubber
	name = "portable air scrubber"

	icon = 'icons/obj/atmos.dmi'
	icon_state = "pscrubber:0"
	density = 1
	w_class = ITEM_SIZE_NORMAL

	var/on = 0
	var/volume_rate = 800

	volume = 750

	power_rating = 7500 //7500 W ~ 10 HP
	power_losses = 150

	var/minrate = 0
	var/maxrate = 10 * ONE_ATMOSPHERE

	var/list/scrubbing_gas = list("plasma", "carbon_dioxide", "sleeping_agent")

/obj/machinery/portable_atmospherics/powered/scrubber/New()
	..()
	cell = new/obj/item/cell/large/high(src)

/obj/machinery/portable_atmospherics/powered/scrubber/emp_act(severity)
	if(stat & (BROKEN|NOPOWER))
		..(severity)
		return

	if(prob(50/severity))
		on = !on
		update_icon()

	..(severity)

/obj/machinery/portable_atmospherics/powered/scrubber/update_icon()
	src.cut_overlays()

	if(on && cell && cell.charge)
		icon_state = "pscrubber:1"
	else
		icon_state = "pscrubber:0"

	if(holding)
		add_overlay("scrubber-open")

	if(connected_port)
		add_overlay("scrubber-connector")

	return

/obj/machinery/portable_atmospherics/powered/scrubber/Process()
	..()

	var/power_draw = -1

	if(on && cell && cell.charge)
		var/datum/gas_mixture/environment
		if(holding)
			environment = holding.air_contents
		else
			environment = loc.return_air()

		var/transfer_moles = min(1, volume_rate/environment.volume)*environment.total_moles

		power_draw = scrub_gas(src, scrubbing_gas, environment, air_contents, transfer_moles, power_rating)

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

	//src.update_icon()
	src.updateDialog()

/obj/machinery/portable_atmospherics/powered/scrubber/return_air()
	return air_contents

/obj/machinery/portable_atmospherics/powered/scrubber/attack_ai(var/mob/user)
	src.add_hiddenprint(user)
	return src.attack_hand(user)

/obj/machinery/portable_atmospherics/powered/scrubber/attack_ghost(var/mob/user)
	return src.attack_hand(user)

/obj/machinery/portable_atmospherics/powered/scrubber/attack_hand(var/mob/user)
	return ui_interact(user)

/obj/machinery/portable_atmospherics/powered/scrubber/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "AtmosScrubberPortable", name)
		ui.open()

/obj/machinery/portable_atmospherics/powered/scrubber/ui_data(mob/user)
	var/list/data = list()

	data["on"] = !!on
	data["connected"] = !!connected_port
	data["pressure"] = round(air_contents.return_pressure() > 0 ? air_contents.return_pressure() : 0)
	data["rate"] =  round(volume_rate)
	data["defaultRate"] = initial(volume_rate)
	data["minRate"] = round(minrate)
	data["maxRate"] = round(maxrate)
	data["powerDraw"] = round(last_power_draw)

	if(holding)
		data["holding"] = list(
			"name" = holding.name,
			"pressure" = round(holding.air_contents.return_pressure() > 0 ? holding.air_contents.return_pressure() : 0)
		)
	else
		data["holding"] = null

	if(cell)
		data["cell"] = list(
			"charge" = cell.charge,
			"maxCharge" = cell.maxcharge,
		)
	else
		data["cell"] = null

	return data

/obj/machinery/portable_atmospherics/powered/scrubber/ui_act(action, list/params, datum/tgui/ui, datum/ui_state/state)
	. = ..()
	if(.)
		return

	switch(action)
		if("power")
			on = !on
			. = TRUE
		if("remove_tank")
			if(holding)
				holding.forceMove(loc)
				holding = null
			. = TRUE
		if("set_volume")
			volume_rate = CLAMP(params["volume"], minrate, maxrate)
			. = TRUE

	if(.)
		add_fingerprint(usr)
		playsound(src, 'sound/machines/machine_switch.ogg', 100, 1)
		update_icon()

//Huge scrubber
/obj/machinery/portable_atmospherics/powered/scrubber/huge
	name = "huge air scrubber"
	icon_state = "scrubber:0"
	anchored = 1
	volume = 50000
	volume_rate = 5000

	use_power = IDLE_POWER_USE
	idle_power_usage = 500		//internal circuitry, friction losses and stuff
	active_power_usage = 100000	//100 kW ~ 135 HP

	var/global/gid = 1
	var/id = 0

/obj/machinery/portable_atmospherics/powered/scrubber/huge/New()
	..()
	cell = null

	id = gid
	gid++

	name = "[name] (ID [id])"

/obj/machinery/portable_atmospherics/powered/scrubber/huge/attack_hand(var/mob/user as mob)
		to_chat(usr, SPAN_NOTICE("You can't directly interact with this machine. Use the scrubber control console."))

/obj/machinery/portable_atmospherics/powered/scrubber/huge/update_icon()
	src.cut_overlays()

	if(on && !(stat & (NOPOWER|BROKEN)))
		icon_state = "scrubber:1"
	else
		icon_state = "scrubber:0"

/obj/machinery/portable_atmospherics/powered/scrubber/huge/power_change()
	var/old_stat = stat
	..()
	if (old_stat != stat)
		update_icon()

/obj/machinery/portable_atmospherics/powered/scrubber/huge/Process()
	if(!on || (stat & (NOPOWER|BROKEN)))
		update_use_power(0)
		last_flow_rate = 0
		last_power_draw = 0
		return 0

	var/power_draw = -1

	var/datum/gas_mixture/environment = loc.return_air()

	var/transfer_moles = min(1, volume_rate/environment.volume)*environment.total_moles

	power_draw = scrub_gas(src, scrubbing_gas, environment, air_contents, transfer_moles, active_power_usage)

	if (power_draw < 0)
		last_flow_rate = 0
		last_power_draw = 0
	else
		use_power(power_draw)
		update_connected_network()

/obj/machinery/portable_atmospherics/powered/scrubber/huge/attackby(var/obj/item/I as obj, var/mob/user as mob)
	if(QUALITY_BOLT_TURNING in I.tool_qualities)
		if(on)
			to_chat(user, SPAN_WARNING("Turn \the [src] off first!"))
			return

		anchored = !anchored
		playsound(src.loc, 'sound/items/Ratchet.ogg', 50, 1)
		to_chat(user, "<span class='notice'>You [anchored ? "wrench" : "unwrench"] \the [src].</span>")

		return

	//doesn't use power cells
	if(istype(I, /obj/item/cell/large))
		return
	if (istype(I, /obj/item/tool/screwdriver))
		return

	//doesn't hold tanks
	if(istype(I, /obj/item/tank))
		return

	return


/obj/machinery/portable_atmospherics/powered/scrubber/huge/stationary
	name = "stationary air scrubber"

/obj/machinery/portable_atmospherics/powered/scrubber/huge/stationary/attackby(var/obj/item/I as obj, var/mob/user as mob)
	if(QUALITY_BOLT_TURNING in I.tool_qualities)
		to_chat(user, SPAN_WARNING("The bolts are too tight for you to unscrew!"))
		return

	..()






/obj/machinery/portable_atmospherics/powered/scrubber/yggdrasil
	name = "Yggdrasil"
	desc = "You feel warm being near the tree that holds up the heavens."
	icon = 'icons/obj/flora/jungletree.dmi'
	icon_state = "tree"
	anchored = 1
	pixel_x = -48
	pixel_y = -16
	var/target_temperature = T20C

	use_power = NO_POWER_USE
	idle_power_usage = 0
	active_power_usage = 0



/obj/machinery/portable_atmospherics/powered/scrubber/yggdrasil/attackby(var/obj/item/I as obj, var/mob/user as mob)
	to_chat(user, SPAN_WARNING("You reach out to the world tree, but something stops your hand."))
	return

/obj/machinery/portable_atmospherics/powered/scrubber/yggdrasil/attack_hand(var/mob/user)
	to_chat(user, SPAN_WARNING("You reach out to the world tree, but something stops your hand."))
	return

/obj/machinery/portable_atmospherics/powered/scrubber/yggdrasil/Process()

	var/datum/gas_mixture/environment = loc.return_air()

	if(environment)
		environment.temperature = target_temperature
		environment.gas = list("oxygen" = O2STANDARD * MolesForPressure(environment.volume), \
							   "nitrogen" = N2STANDARD *  MolesForPressure(environment.volume))

/obj/machinery/portable_atmospherics/powered/scrubber/yggdrasil/update_icon()
	return

/obj/machinery/portable_atmospherics/powered/scrubber/yggdrasil/MolesForPressure(var/gasVolume)
	return (ONE_ATMOSPHERE * gasVolume) / (R_IDEAL_GAS_EQUATION * target_temperature)

/obj/machinery/portable_atmospherics/powered/scrubber/yggdrasil/cold
	name = "Coldrasil"
	desc = "You feel cold being near the tree that holds up the mountains."
	icon = 'icons/obj/flora/snowtree.dmi'
	icon_state = "tree3"
	target_temperature = 240

/obj/machinery/portable_atmospherics/powered/scrubber/yggdrasil/kriostree
	name = "Kriosan Tree"
	desc = "Strange dog tree."
	var/damage = 0.3
	var/NOLAG = 0

/obj/machinery/portable_atmospherics/powered/scrubber/yggdrasil/kriostree/attackby(var/obj/item/I as obj, var/mob/user as mob)
	to_chat(user, SPAN_WARNING("This is a dog tree, no cutting."))
	return

/obj/machinery/portable_atmospherics/powered/scrubber/yggdrasil/kriostree/attack_hand(var/mob/user)
	to_chat(user, SPAN_WARNING("This is a dog tree, no cutting."))
	return

/obj/machinery/portable_atmospherics/powered/scrubber/yggdrasil/kriostree/Process()

	var/datum/gas_mixture/environment = loc.return_air()

	if(environment)
		environment.temperature = target_temperature
		environment.gas = list("carbon_dioxide" = MolesForPressure(environment.volume))

	if(NOLAG)
		var/list/affected = list()
		spawn()
			for(var/mob/living/carbon/human/H in GLOB.human_mob_list)
				if (H.z == src.z)
					affected.Add(H)
			for(var/mob/living/carbon/human/affected_guy in affected)
				affected_guy.damage_through_armor(damage, TOX, attack_flag = ARMOR_BIO)
	else
		var/list/affected = list()
		for(var/mob/living/carbon/human/H in GLOB.human_mob_list)
			if (H.z == src.z)
				affected.Add(H)
		for(var/mob/living/carbon/human/affected_guy in affected)
			affected_guy.damage_through_armor(damage, TOX, attack_flag = ARMOR_BIO)

/obj/machinery/portable_atmospherics/powered/scrubber/yggdrasil/kriostree/update_icon()
	return
