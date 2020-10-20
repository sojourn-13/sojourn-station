//To do, make matter bins, do something
//To do, make micro lasers do something
/obj/machinery/sleeper
	name = "sleeper"
	desc = "A fancy bed with built-in injectors, a dialysis machine, and a limited health scanner."
	icon = 'icons/obj/Cryogenic2.dmi'
	icon_state = "sleeper_0"
	density = 1
	anchored = 1
	circuit = /obj/item/weapon/circuitboard/sleeper
	var/scanning = 2 // How many units are we removing per filter cycle? - Basic has 2 Scanners
	var/mob/living/carbon/human/occupant = null
	var/list/available_chemicals
	var/list/level0 = list(
		"inaprovaline" = "Inaprovaline", "stoxin" = "Soporific", "paracetamol" = "Paracetamol", "anti_toxin" = "Dylovene", "dexalin" = "Dexalin")
	var/obj/item/weapon/reagent_containers/glass/beaker = null
	var/filtering = 0 //FALSE
	var/pump

	var/list/level1 = list("tricordrazine" ="Tricordrazine")
	var/list/level2 = list("spaceacillin" = "Spaceacillin")
	var/list/level3 = list("alkysine" = "Alkysine")
	var/list/level4 = list("leporazine" = "Leporazine")
	var/list/level5 = list("oxycodone" = "Oxycodone")

	use_power = IDLE_POWER_USE
	idle_power_usage = 15
	active_power_usage = 200 //builtin health analyzer, dialysis machine, injectors.

/obj/machinery/sleeper/hyper
	name = "hyper-sleeper"
	desc = "A fancy bed with built-in injectors, a dialysis machine, and a limited health scanner. Unlike standard sleepers this one comes with additional chemical synthesizers but is one of a kind."
	icon = 'icons/obj/Cryogenic2.dmi'
	icon_state = "sleeper_0"
	scanning = 4 //Hyper has 4 scanners.
	color = "#a4bdba"
	circuit = /obj/item/weapon/circuitboard/sleeper/hyper
	level0 = list(
		"inaprovaline" = "Inaprovaline", "chloralhydrate" = "Chloral Hydrate", "tramadol" = "Tramadol", "carthatoline" = "Carthatoline", "dexalinp" = "Dexalin Plus", "bicaridine" = "Bicaridine", "dermaline" = "Dermaline")

/obj/machinery/sleeper/Initialize()
	. = ..()
	beaker = new /obj/item/weapon/reagent_containers/glass/beaker/large(src)
	update_icon()
	RefreshParts()

/obj/machinery/sleeper/RefreshParts()
	..()
	var/man_rating = 0
	var/man_amount = 0
	for(var/obj/item/weapon/stock_parts/manipulator/M in component_parts)
		man_rating += M.rating
		man_amount++
	man_rating -= man_amount

	available_chemicals = level0.Copy() 

			//We start out (2 - 2) for are man_rating

	if(man_rating >= 2) //Needs both manips to be level 2 - Nano (4 - 2)
		available_chemicals += level1
	if(man_rating >= 4) //Needs both manips to be level 3 - Pico (6 - 2)
		available_chemicals += level2
	if(man_rating >= 6) //Needs both manips to be level 4 - Exl (8 - 2)
		available_chemicals += level3
	if(man_rating >= 8) //Needs both manips to be level 5 - Greyson (10 - 2)
		available_chemicals += level4
	if(man_rating >= 10) //Needs both manips to be level 6 - Alien (12 - 2)
		available_chemicals += level5

	var/scanning_rating = 0
	var/scanning_amount = 0
	for(var/obj/item/weapon/stock_parts/scanning_module/S in component_parts)
		scanning_rating += S.rating
		scanning_amount++
	scanning_rating -= scanning_amount

	scanning = initial(scanning) + scanning_rating

/obj/machinery/sleeper/Process()
	if(stat & (NOPOWER|BROKEN))
		return

	if(filtering > 0)
		if(beaker)
			if(beaker.reagents.total_volume < beaker.reagents.maximum_volume)
				var/pumped = 0
				for(var/datum/reagent/x in occupant.reagents.reagent_list)
					occupant.reagents.trans_to_obj(beaker, scanning)
					pumped++
				if(ishuman(occupant))
					occupant.vessel.trans_to_obj(beaker, pumped + 1)
		else
			toggle_filter()

	if(pump > 0)
		if(beaker && istype(occupant))
			if(beaker.reagents.total_volume < beaker.reagents.maximum_volume)
				var/datum/reagents/ingested = occupant.ingested
				if(ingested)
					ingested.trans_to(beaker, scanning)
		else
			toggle_pump()

/obj/machinery/sleeper/update_icon()
	icon_state = "sleeper_[occupant ? "1" : "0"]"

/obj/machinery/sleeper/attack_hand(var/mob/user)
	if(!usr.stat_check(STAT_BIO, STAT_LEVEL_ADEPT))
		to_chat(usr, SPAN_WARNING("Your biological understanding isn't enough to use this."))
		return

	if(..())
		return 1

	ui_interact(user)

/obj/machinery/sleeper/ui_interact(var/mob/user, var/ui_key = "main", var/datum/nanoui/ui = null, var/force_open = NANOUI_FOCUS, var/datum/topic_state/state =GLOB.outside_state)
	var/data[0]

	data["power"] = stat & (NOPOWER|BROKEN) ? 0 : 1

	var/list/reagents = list()
	for(var/T in available_chemicals)
		var/list/reagent = list()
		reagent["id"] = T
		reagent["name"] = available_chemicals[T]
		if(occupant)
			reagent["amount"] = occupant.reagents.get_reagent_amount(T)
		reagents += list(reagent)
	data["reagents"] = reagents.Copy()

	if(occupant)
		data["occupant"] = 1
		switch(occupant.stat)
			if(CONSCIOUS)
				data["stat"] = "Conscious"
			if(UNCONSCIOUS)
				data["stat"] = "Unconscious"
			if(DEAD)
				data["stat"] = "<font color='red'>Dead</font>"
		data["health"] = occupant.health
		if(ishuman(occupant))
			var/mob/living/carbon/human/H = occupant
			data["pulse"] = H.get_pulse(GETPULSE_TOOL)
		data["brute"] = occupant.getBruteLoss()
		data["burn"] = occupant.getFireLoss()
		data["oxy"] = occupant.getOxyLoss()
		data["tox"] = occupant.getToxLoss()
	else
		data["occupant"] = 0
	if(beaker)
		data["beaker"] = beaker.reagents.get_free_space()
	else
		data["beaker"] = -1
	data["filtering"] = filtering
	data["pump"] = pump

	ui = SSnano.try_update_ui(user, src, ui_key, ui, data, force_open)
	if(!ui)
		ui = new(user, src, ui_key, "sleeper.tmpl", "Sleeper UI", 600, 600, state = state)
		ui.set_initial_data(data)
		ui.open()
		ui.set_auto_update(1)

/obj/machinery/sleeper/Topic(href, href_list)
	if(..())
		return 1

	if(usr == occupant)
		to_chat(usr, SPAN_WARNING("You can't reach the controls from the inside."))
		return

	add_fingerprint(usr)

	if(href_list["eject"])
		go_out()
	if(href_list["beaker"])
		remove_beaker()
	if(href_list["filter"])
		if(filtering != text2num(href_list["filter"]))
			toggle_filter()
	if(href_list["pump"])
		if(filtering != text2num(href_list["pump"]))
			toggle_pump()
	if(href_list["chemical"] && href_list["amount"])
		if(occupant && occupant.stat != DEAD)
			if(href_list["chemical"] in available_chemicals) // Your hacks are bad and you should feel bad
				inject_chemical(usr, href_list["chemical"], text2num(href_list["amount"]))

	playsound(loc, 'sound/machines/button.ogg', 100, 1)
	return 1

/obj/machinery/sleeper/attackby(var/obj/item/I, var/mob/user)
	add_fingerprint(user)
	if(istype(I, /obj/item/weapon/reagent_containers/glass))
		if(!beaker)
			beaker = I
			user.drop_item()
			I.loc = src
			user.visible_message(SPAN_NOTICE("\The [user] adds \a [I] to \the [src]."), SPAN_NOTICE("You add \a [I] to \the [src]."))
		else
			to_chat(user, SPAN_WARNING("\The [src] has a beaker already."))
		return

	if(default_deconstruction(I, user))
		return

	if(default_part_replacement(I, user))
		return


/obj/machinery/sleeper/affect_grab(var/mob/user, var/mob/target)
	go_in(target, user)

/obj/machinery/sleeper/MouseDrop_T(var/mob/target, var/mob/user)
	if(user.stat || user.lying || !Adjacent(user) || !target.Adjacent(user)|| !ishuman(target))
		return
	go_in(target, user)

/obj/machinery/sleeper/relaymove(var/mob/user)
	..()
	go_out()

/obj/machinery/sleeper/emp_act(var/severity)
	if(filtering)
		toggle_filter()
	if(pump)
		toggle_pump()

	if(stat & (BROKEN|NOPOWER))
		..(severity)
		return

	if(occupant)
		go_out()

	..(severity)
/obj/machinery/sleeper/proc/toggle_filter()
	if(!occupant || !beaker)
		filtering = 0
		return
	filtering = !filtering

/obj/machinery/sleeper/proc/toggle_pump()
	if(!occupant || !beaker)
		pump = FALSE
		return
	pump = !pump


/obj/machinery/sleeper/proc/go_in(var/mob/M, var/mob/user)
	if(!M)
		return
	if(stat & (BROKEN|NOPOWER))
		return
	if(occupant)
		to_chat(user, SPAN_WARNING("\The [src] is already occupied."))
		return

	if(M == user)
		visible_message("\The [user] starts climbing into \the [src].")
	else
		visible_message("\The [user] starts putting [M] into \the [src].")

	if(do_after(user, 20, src))
		if(occupant)
			to_chat(user, SPAN_WARNING("\The [src] is already occupied."))
			return
		M.stop_pulling()
		if(M.client)
			M.client.perspective = EYE_PERSPECTIVE
			M.client.eye = src
		M.loc = src
		update_use_power(2)
		occupant = M
		update_icon()

/obj/machinery/sleeper/verb/eject_occupant_verb()
	set name = "Eject Occupant"
	set desc = "Force eject occupant."
	set category = "Object"
	set src in view(1)

	if (usr.incapacitated() || occupant == usr)
		return

	go_out()

/obj/machinery/sleeper/proc/go_out()
	if(!occupant)
		return
	if(occupant.client)
		occupant.client.eye = occupant.client.mob
		occupant.client.perspective = MOB_PERSPECTIVE
	occupant.loc = loc
	occupant = null
	for(var/atom/movable/A in src) // In case an object was dropped inside or something
		if(A == beaker)
			continue
		A.loc = loc
	update_use_power(1)
	update_icon()
	toggle_filter()

/obj/machinery/sleeper/proc/remove_beaker()
	if(beaker)
		beaker.loc = loc
		beaker = null
		toggle_filter()

/obj/machinery/sleeper/proc/inject_chemical(var/mob/living/user, var/chemical, var/amount)
	if(stat & (BROKEN|NOPOWER))
		return

	if(occupant && occupant.reagents)
		if(occupant.reagents.get_reagent_amount(chemical) + amount <= 20)
			use_power(amount * CHEM_SYNTH_ENERGY)
			occupant.reagents.add_reagent(chemical, amount)
			to_chat(user, "Occupant now has [occupant.reagents.get_reagent_amount(chemical)] units of [available_chemicals[chemical]] in their bloodstream.")
		else
			to_chat(user, "The subject has too many chemicals.")
	else
		to_chat(user, "There's no suitable occupant in \the [src].")
