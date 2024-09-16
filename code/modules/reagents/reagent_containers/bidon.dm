
//this is big movable beaker
/obj/structure/reagent_dispensers/bidon
	name = "B.I.D.O.N. canister"
	desc = "Bulk Industrial Dispenser Omnitech-Nanochem. A canister with acid-resistant linings intended for handling big volumes of chemicals."
	icon = 'icons/obj/machines/chemistry.dmi'
	icon_state = "bidon"
	reagent_flags = AMOUNT_VISIBLE
	amount_per_transfer_from_this = 30
	possible_transfer_amounts = list(10,30,60,120,200,300)
	var/filling_states = list(10,20,30,40,50,60,70,80,100)
	unacidable = 1
	anchored = 0
	var/obj/machinery/anchored_machine
	density = TRUE
	volume = 6000
	var/lid = TRUE

/obj/structure/reagent_dispensers/bidon/advanced
	name = "stasis B.I.D.O.N. canister"
	desc = "An advanced B.I.D.O.N. canister with stasis function."
	icon_state = "bidon_adv"
	reagent_flags = TRANSPARENT | NO_REACT // It's a stasis BIDON, shouldn't allow chems to react inside it.
	filling_states = list(20,40,60,80,100)
	volume = 9000

/obj/structure/reagent_dispensers/bidon/trigger
	name = "trigger-stasis B.I.D.O.N. canister"
	desc = "An advanced B.I.D.O.N. canister with stasis function that can be temporarily disabled with a multitool."
	icon_state = "bidon_adv"
	reagent_flags = TRANSPARENT | NO_REACT //Tho its not a subtype its meant to be
	filling_states = list(20,40,60,80,100)
	volume = 9000
	var/timer_till_mixing = 120
	var/timing = FALSE

/obj/structure/reagent_dispensers/bidon/trigger/examine(mob/user)
	..()
	if(timing)
		to_chat(user, SPAN_DANGER("[timer_till_mixing] seconds until stasis is disabled."))
	else
		to_chat(user, SPAN_NOTICE("[src]'s timer isn't activated."))

/obj/structure/reagent_dispensers/bidon/trigger/attackby(obj/item/I, mob/user)
	if(!timing)
		if(I.use_tool(user, src, WORKTIME_INSTANT, QUALITY_PULSING, FAILCHANCE_ZERO, required_stat = STAT_MEC))
			to_chat(user, SPAN_NOTICE("You start the timer."))
			timing = TRUE
			ticktock()
			return
	else
		. = ..()
	update_icon()

/obj/structure/reagent_dispensers/bidon/trigger/proc/timer_end()
	reagent_flags &= ~(NO_REACT)
	spawn(10)
	reagent_flags |= NO_REACT
	reagents.process_reactions()

/obj/structure/reagent_dispensers/bidon/trigger/proc/ticktock()
	if(timing && (timer_till_mixing > 0))
		timer_till_mixing--
		spawn(10)
		ticktock()
	if(timing && timer_till_mixing <= 0)
		timing = FALSE
		timer_end()
		timer_till_mixing = 120

/obj/structure/reagent_dispensers/bidon/Initialize(mapload, ...)
	. = ..()
	update_icon()

/obj/structure/reagent_dispensers/bidon/examine(mob/user)
	if(!..(user, 2))
		return
	if(lid)
		to_chat(user, SPAN_NOTICE("It has lid on it."))
	if(reagents.total_volume)
		to_chat(user, SPAN_NOTICE("It's filled with [reagents.total_volume]/[volume] units of reagents."))

/obj/structure/reagent_dispensers/bidon/attack_hand(mob/user as mob)
	//Prevent the bidon from being messed with while it is anchored.
	if(anchored)
		to_chat(user, SPAN_NOTICE("You can't remove the lid while the canister is anchored!"))
		return
	lid = !lid
	if(lid)
		to_chat(user, SPAN_NOTICE("You put the lid on."))
		reagent_flags &= ~(REFILLABLE | DRAINABLE | DRAWABLE | INJECTABLE)
	else
		reagent_flags |= REFILLABLE | DRAINABLE | DRAWABLE | INJECTABLE
		to_chat(user, SPAN_NOTICE("You removed the lid."))
	playsound(src,'sound/items/trayhit2.ogg',50,1)
	update_icon()

/obj/structure/reagent_dispensers/bidon/attackby(obj/item/I, mob/user)
	//Handle attaching the BIDON to a valid machine
	var/tool_type = I.get_tool_type(user, list(QUALITY_BOLT_TURNING), src)
	if(tool_type)
		if(anchored && I.use_tool(user, src, WORKTIME_NEAR_INSTANT, tool_type, FAILCHANCE_VERY_EASY, required_stat = STAT_BIO))
			anchored = FALSE
			anchored_machine = null
		else
			var/list/directions = list(WEST, NORTH, SOUTH, EAST)
			for(var/direction_from_obj in directions)
				for (var/obj/machinery/valid_machine in get_step(get_turf(src), direction_from_obj))
					if(valid_machine.anchor_type && ispath(valid_machine.anchor_type, /obj/structure/reagent_dispensers/bidon))
						if(valid_machine.anchor_direction)
							if(valid_machine.anchor_direction == reverse_direction(direction_from_obj))
								anchored_machine = valid_machine
								break
						else
							anchored_machine = valid_machine
							break
			if(anchored_machine && I.use_tool(user, src, WORKTIME_NEAR_INSTANT, tool_type, FAILCHANCE_VERY_EASY, required_stat = STAT_BIO))
				to_chat(user, SPAN_NOTICE("You [anchored ? "detach" : "attach"] the B.I.D.O.N canister to the [anchored_machine]."))
				anchored = TRUE

				//Remove the lid if it is currently sealed, so we don't have to deal with checking for it
				if(lid)
					to_chat(user, SPAN_NOTICE("The machine removes the lid automatically!"))
					lid = FALSE
					reagent_flags |= REFILLABLE | DRAINABLE | DRAWABLE | INJECTABLE
					playsound(src,'sound/items/trayhit2.ogg',50,1)
				update_icon()
				return
	else if(lid)
		to_chat(user, SPAN_NOTICE("Remove the lid first."))
		return
	else
		. = ..()
	update_icon()

/obj/structure/reagent_dispensers/bidon/update_icon()
	cut_overlays()
	if(lid)
		var/mutable_appearance/lid_icon = mutable_appearance(icon, "[icon_state]_lid")
		add_overlay(lid_icon)
	if(anchored)
		var/mutable_appearance/anchor_icon = mutable_appearance(icon, "bidon_anchored")
		add_overlay(anchor_icon)
	if(reagents.total_volume)
		var/mutable_appearance/filling = mutable_appearance('icons/obj/reagentfillings.dmi', "[icon_state][get_filling_state()]")
		if(!istype(src,/obj/structure/reagent_dispensers/bidon/advanced))
			filling.color = reagents.get_color()
		add_overlay(filling)

/obj/structure/reagent_dispensers/bidon/proc/get_filling_state()
	var/percent = round((reagents.total_volume / volume) * 100)
	for(var/increment in filling_states)
		if(increment >= percent)
			return increment

/obj/structure/reagent_dispensers/bidon/advanced/examine(mob/user)
	if(!..(user, 2))
		return
	if(reagents.reagent_list.len)
		for(var/I in reagents.reagent_list)
			var/datum/reagent/R = I
			to_chat(user, "<span class='notice'>[R.volume] units of [R.name]</span>")

//Preset Bidon of Animal Protein for testing
/obj/structure/reagent_dispensers/bidon/protein_can
	starting_reagent = "protein"

//Department starting protein to get the process off the ground
/obj/structure/reagent_dispensers/bidon/protein_can/si
	starting_reagent = "protein"
	starting_volume = 1000