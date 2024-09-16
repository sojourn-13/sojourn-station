//To do, make matter bins, do something
//To do, make micro lasers do something
/obj/machinery/sleeper
	name = "sleeper"
	desc = "A fancy bed with built-in injectors, a dialysis machine, and a limited health scanner."
	icon = 'icons/obj/Cryogenic2.dmi'
	icon_state = "sleeper"
	density = 1
	anchored = 1
	circuit = /obj/item/circuitboard/sleeper
	var/scanning = 2 // How many units are we removing per filter cycle? - Basic has 2 Scanners
	var/mob/living/carbon/human/occupant = null
	var/list/available_chemicals
	var/list/level0 = list(
		"inaprovaline" = "Inaprovaline", "stoxin" = "Soporific", "paracetamol" = "Paracetamol", "anti_toxin" = "Dylovene", "dexalin" = "Dexalin")
	var/obj/item/reagent_containers/glass/beaker = null
	var/filtering = 0 //FALSE
	var/pump

	var/list/level1 = list("tricordrazine" ="Tricordrazine")
	var/list/level2 = list("spaceacillin" = "Spaceacillin")
	var/list/level3 = list("alkysine" = "Alkysine")
	var/list/level4 = list("hyronalin" = "Hyronalin")
	var/list/level5 = list("arithrazine" = "Arithrazine")

	use_power = IDLE_POWER_USE
	idle_power_usage = 15
	active_power_usage = 200 //builtin health analyzer, dialysis machine, injectors.

/obj/machinery/sleeper/hyper
	name = "hyper-sleeper"
	desc = "A fancy bed with built-in injectors, a dialysis machine, and a limited health scanner. Unlike standard sleepers, this one comes with additional chemical synthesizers, but is one of a kind."
	icon = 'icons/obj/Cryogenic2.dmi'
	icon_state = "hypersleeper"
	scanning = 4 //Hyper has 4 scanners.
	idle_power_usage = 30 // Complicated, high power machinery
	active_power_usage = 400
	color = "#a4bdba"
	circuit = /obj/item/circuitboard/sleeper/hyper
	level0 = list(
		"tramadol" = "Tramadol", "dexalinp" = "Dexalin Plus", "bicaridine" = "Bicaridine", "dermaline" = "Dermaline", "carthatoline" = "Carthatoline", "peridaxon" = "Peridaxon")

/obj/machinery/sleeper/Initialize()
	. = ..()
	beaker = new /obj/item/reagent_containers/glass/beaker/large(src)
	update_icon()
	RefreshParts()

/obj/machinery/sleeper/RefreshParts()
	..()
	var/man_rating = 0
	var/man_amount = 0
	for(var/obj/item/stock_parts/manipulator/M in component_parts)
		man_rating += M.rating
		man_amount++
	man_rating -= man_amount

	available_chemicals = level0.Copy()

			//We start out (2 - 2) for are man_rating

	if(man_rating >= 2) //Needs both manips to be level 2 - Nano (4 - 2)
		available_chemicals += level1
	if(man_rating >= 4) //Needs both manips to be level 3 - Pico (6 - 2)
		available_chemicals += level2
	if(man_rating >= 6) //Needs both manips to be level 4 - Greyson (8 - 2)
		available_chemicals += level3
	if(man_rating >= 8) //Needs both manips to be level 5 - Excel (10 - 2)
		available_chemicals += level4
	if(man_rating >= 10) //Needs both manips to be level 6 - Alien (12 - 2)
		available_chemicals += level5

	var/scanning_rating = 0
	var/scanning_amount = 0
	for(var/obj/item/stock_parts/scanning_module/S in component_parts)
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
	cut_overlays()
	if(occupant)
		icon_state = "[initial(icon_state)]-occupied"
		return
	else
		icon_state = "[initial(icon_state)]"
	if(panel_open)
		add_overlay(image(icon, "sleeper-panel"))

/obj/machinery/sleeper/attack_hand(var/mob/user)
	if(!user.stats?.getPerk(PERK_MEDICAL_EXPERT) && !usr.stat_check(STAT_BIO, STAT_LEVEL_EXPERT) && !usr.stat_check(STAT_COG, 50)) //Are we missing the perk AND to low on bio? Needs bio 25 so cog 50 to bypass
		to_chat(usr, SPAN_WARNING("Your biological understanding isn't enough to use this."))
		return

	if(..())
		return 1

	nano_ui_interact(user)

/obj/machinery/sleeper/nano_ui_interact(var/mob/user, var/ui_key = "main", var/datum/nanoui/ui = null, var/force_open = NANOUI_FOCUS, var/datum/nano_topic_state/state =GLOB.outside_state)
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
		data["crit_health"] = round((occupant.health / occupant.maxHealth) * 100)
		if(ishuman(occupant))
			var/mob/living/carbon/human/H = occupant
			data["pulse"] = H.get_pulse(GETPULSE_TOOL)
			var/organ_health
			var/organ_damage
			for(var/obj/item/organ/external/E in H.organs)
				organ_health += E.total_internal_health
				organ_damage += E.severity_internal_wounds
			data["internal_health"] = round((1 - (organ_health ? organ_damage / organ_health : 0)) * 100)
		data["brute"] = occupant.getBruteLoss()
		data["burn"] = occupant.getFireLoss()
		data["oxy"] = occupant.getOxyLoss()

		var/tox_content = occupant.chem_effects[CE_TOXIN] + occupant.chem_effects[CE_ALCOHOL_TOXIC]
		data["tox"] = tox_content ? tox_content : "0"
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
	if(istype(I, /obj/item/reagent_containers/glass))
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
	if(src.occupant)
		to_chat(user, SPAN_NOTICE("The [src] is already occupied!"))
		return
	if(target.buckled)
		to_chat(user, SPAN_NOTICE("Unbuckle the subject before attempting to move them."))
		return
	go_in(target, user) // Instant as with the body scanner, some patients require speed.
	src.add_fingerprint(user)
	return TRUE

/obj/machinery/sleeper/MouseDrop_T(var/mob/target, var/mob/user)
	if(!ismob(target))
		return
	if (src.occupant)
		to_chat(user, SPAN_WARNING("The scanner is already occupied!"))
		return
	if (target.buckled)
		to_chat(user, SPAN_NOTICE("Unbuckle the subject before attempting to move them."))
		return
	var/mob/living/carbon/human/H = target
	if(H.species.reagent_tag == IS_SYNTHETIC)
		if(target == user)
			visible_message("\The [user] tries climbing into \the [src] but it refuses a synthetic life form.")
			return
		else
			visible_message("\The [user] tries putting [target] into \the [src] but it refuses a synthetic life form.")
			return
	if(target == user)
		visible_message("\The [user] starts climbing into \the [src].")
	else
		visible_message("\The [user] starts putting [target] into \the [src].")

	if(!do_after(user, 30, src) || !Adjacent(target))
		return
	go_in(target)
	src.add_fingerprint(user)
	return

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
	M.stop_pulling()
	if(M.client)
		M.client.perspective = EYE_PERSPECTIVE
		M.client.eye = src
	M.loc = src
	update_use_power(2)
	occupant = M
	flick("[initial(icon_state)]-anim", src)
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
	flick("[initial(icon_state)]-anim", src)
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
