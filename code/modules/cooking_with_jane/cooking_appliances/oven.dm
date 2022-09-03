#define ICON_SPLIT_X 16
#define ICON_SPLIT_Y 21

/obj/machinery/cooking_with_jane/oven
	name = "Oven"
	desc = "A cozy oven for baking food. For some reason, it feels like it is watching you... \nCtrl+Click: Set Temperatures / Timers \nShift+Ctrl+Click: Turn on a burner."
	icon = 'icons/obj/cwj_cooking/oven.dmi'
	icon_state = "oven"
	density = TRUE
	anchored = TRUE
	layer = BELOW_OBJ_LAYER
	cooking = FALSE
	var/temperature= J_LO
	var/timer = 0
	var/timerstamp = 0
	var/on_switch = 0
	var/opened = 0
	var/cooking_timestamp = 0 //Timestamp of when cooking initialized so we know if the prep was disturbed at any point.
	var/item = null

	var/reference_time = 0 //The exact moment when we call the process routine, just to account for lag.

	var/quality_mod = 1

	var/power_cost = 3000 //Power cost per process step for a particular burner
	var/check_on_10 = 0

	var/on_fire = FALSE //if the oven has caught fire or not.

	circuit = /obj/item/circuitboard/cooking_with_jane/oven

//Did not want to use this...
/obj/machinery/cooking_with_jane/oven/Process()

	//if(on_fire)
		//Do bad things if it is on fire.

	//Under normal circumstances, Only process this thing every 10 process calls; it doesn't need to be hyper-accurate.
	if(check_on_10 != 10)
		check_on_10++
		return
	else
		check_on_10 = 0

	if(on_switch)
		use_power(power_cost)

/obj/machinery/cooking_with_jane/oven/RefreshParts()
	var/man_rating = 0
	for(var/obj/item/stock_parts/manipulator/M in component_parts)
		man_rating += M.rating
	quality_mod = round(man_rating/2)

//Process how a specific oven is interacting with material
/obj/machinery/cooking_with_jane/oven/proc/cook_checkin(var/input)
	#ifdef CWJ_DEBUG
	log_debug("/cooking_with_jane/oven/proc/cook_checkin called on burner [input]")
	#endif
	if(items[input])
		var/old_timestamp = cooking_timestamp[input]
		switch(temperature[input])
			if("Low")
				spawn(CWJ_BURN_TIME_LOW)
					if(cooking_timestamp[input] == old_timestamp)
						handle_burning(input)
				spawn(CWJ_IGNITE_TIME_LOW)
					if(cooking_timestamp[input] == old_timestamp)
						handle_ignition(input)

			if("Medium")
				spawn(CWJ_BURN_TIME_MEDIUM)
					if(cooking_timestamp[input] == old_timestamp)
						handle_burning(input)
				spawn(CWJ_IGNITE_TIME_MEDIUM)
					if(cooking_timestamp[input] == old_timestamp)
						handle_ignition(input)

			if("High")
				spawn(CWJ_BURN_TIME_HIGH)
					if(cooking_timestamp[input] == old_timestamp)
						handle_burning(input)
				spawn(CWJ_IGNITE_TIME_HIGH)
					if(cooking_timestamp[input] == old_timestamp)
						handle_ignition(input)

/obj/machinery/cooking_with_jane/oven/proc/handle_burning(input)
	if(!(items[input] && istype(items[input], /obj/item/reagent_containers/cooking_with_jane/cooking_container)))
		return

	var/obj/item/reagent_containers/cooking_with_jane/cooking_container/container = items[input]
	container.handle_burning()

/obj/machinery/cooking_with_jane/oven/proc/handle_ignition(input)
	if(!(items[input] && istype(items[input], /obj/item/reagent_containers/cooking_with_jane/cooking_container)))
		return

	var/obj/item/reagent_containers/cooking_with_jane/cooking_container/container = items[input]
	if(container.handle_ignition())
		on_fire = TRUE

//Retrieve which quadrant of the baking pan is being used.
/obj/machinery/cooking_with_jane/oven/proc/getInput(params)
	var/list/click_params = params2list(params)
	var/input
	var/icon_x = text2num(click_params["icon-x"])
	var/icon_y = text2num(click_params["icon-y"])
	if(icon_x <= ICON_SPLIT_X && icon_y <= ICON_SPLIT_Y)
		input = 1
	else if(icon_x > ICON_SPLIT_X && icon_y <= ICON_SPLIT_Y)
		input = 2
	else if(icon_x <= ICON_SPLIT_X && icon_y > ICON_SPLIT_Y)
		input = 3
	else if(icon_x > ICON_SPLIT_X && icon_y > ICON_SPLIT_Y)
		input = 4

	#ifdef CWJ_DEBUG
	log_debug("cooking_with_jane/oven/proc/getInput returned burner [input]. icon-x: [click_params["icon-x"]], icon-y: [click_params["icon-y"]]")
	#endif
	return input

/obj/machinery/cooking_with_jane/oven/attackby(var/obj/item/used_item, var/mob/user, params)
	if(default_deconstruction(used_item, user))
		return

	var/input = getInput(params)

	if(items[input] != null)
		to_chat(usr, SPAN_NOTICE("That burner already has something on it!"))
	else
		to_chat(usr, SPAN_NOTICE("You put a [used_item] on the oven."))
		if(usr.canUnEquip(used_item))
			usr.unEquip(used_item, src)
		else
			used_item.forceMove(src)
		items[input] = used_item
		if(switches[input] == 1)
			cooking_timestamp[input] = world.time
	update_icon()

/obj/machinery/cooking_with_jane/oven/attack_hand(mob/user as mob, params)
	var/input = getInput(params)
	if(items[input] != null)
		if(switches[input] == 1)
			handle_cooking(user, input)
			cooking_timestamp[input] = world.time
			if(ishuman(user) && (temperature[input] == "High" || temperature[input] == "Medium" ))
				var/mob/living/carbon/human/burn_victim = user
				if(!burn_victim.gloves)
					switch(temperature[input])
						if("High")
							burn_victim.adjustFireLoss(5)
						if("Medium")
							burn_victim.adjustFireLoss(2)
					to_chat(burn_victim, SPAN_DANGER("You burn your hand a little taking the [items[input]] off of the oven."))
		user.put_in_hands(items[input])
		items[input] = null
		update_icon()

/obj/machinery/cooking_with_jane/oven/CtrlClick(var/mob/user, params)
	if(user.stat || user.restrained() || (!in_range(src, user)))
		return

	var/input = getInput(params)
	#ifdef CWJ_DEBUG
	log_debug("/cooking_with_jane/oven/CtrlClick called on burner [input]")
	#endif
	var/choice = alert(user,"Select an action for burner #[input]","Select One:","Set temperature","Set timer","Cancel")
	switch(choice)
		if("Set temperature")
			handle_temperature(user, input)
		if("Set timer")
			handle_timer(user, input)

//Switch the cooking device on or off
/obj/machinery/cooking_with_jane/oven/CtrlShiftClick(var/mob/user, params)

	if(user.stat || user.restrained() || (!in_range(src, user)))
		return
	var/input = getInput(params)

	#ifdef CWJ_DEBUG
	log_debug("/cooking_with_jane/oven/CtrlClick called on burner [input]")
	#endif
	handle_switch(user, input)

/obj/machinery/cooking_with_jane/oven/proc/handle_temperature(user, input)
	var/old_temp = temperature[input]
	var/choice = input(user,"Select a heat setting for burner #[input].\nCurrent temp :[old_temp]","Select Temperature",old_temp) in list("High","Medium","Low","Cancel")
	if(choice && choice != "Cancel" && choice != old_temp)
		temperature[input] = choice
		if(switches[input] == 1)
			handle_cooking(user, input)
			cooking_timestamp[input] = world.time
			timerstamp[input]=world.time
			#ifdef CWJ_DEBUG
			log_debug("Timerstamp no. [input] set! New timerstamp: [timerstamp[input]]")
			#endif


/obj/machinery/cooking_with_jane/oven/proc/handle_timer(user, input)
	var/old_time = timer[input]? round((timer[input]/(1 SECONDS)), 1 SECONDS): 1
	timer[input] = (input(user, "Enter a timer for burner #[input] (In Seconds)","Set Timer", old_time) as num) SECONDS
	if(timer[input] != 0 && switches[input] == 1)
		timer_act(user, input)
	update_icon()

//input: 1 thru 4, depends on which burner was selected
/obj/machinery/cooking_with_jane/oven/proc/timer_act(var/mob/user, var/input)

	timerstamp[input]=round(world.time)
	#ifdef CWJ_DEBUG
	log_debug("Timerstamp no. [input] set! New timerstamp: [timerstamp[input]]")
	#endif
	var/old_timerstamp = timerstamp[input]
	spawn(timer[input])
		log_debug("Comparimg timerstamp([input]) of [timerstamp[input]] to old_timerstamp [old_timerstamp]")
		if(old_timerstamp == timerstamp[input])
			playsound(src, 'sound/items/lighter.ogg', 100, 1, 0)

			handle_cooking(user, input, TRUE) //Do a check in the cooking interface
			switches[input] = 0
			timerstamp[input]=world.time
			cooking_timestamp[input] = world.time
			update_icon()
	update_icon()

/obj/machinery/cooking_with_jane/oven/proc/handle_switch(user, input)
	playsound(src, 'sound/items/lighter.ogg', 100, 1, 0)
	if(switches[input] == 1)
		handle_cooking(user, input)
		switches[input] = 0
		timerstamp[input]=world.time
		#ifdef CWJ_DEBUG
		log_debug("Timerstamp no. [input] set! New timerstamp: [timerstamp[input]]")
		#endif
		cooking_timestamp[input] = world.time
	else
		switches[input] = 1
		cooking_timestamp[input] = world.time
		cook_checkin(input)
		if(timer[input] != 0)
			timer_act(user, input)
	update_icon()



/obj/machinery/cooking_with_jane/oven/proc/handle_cooking(var/mob/user, var/input, set_timer=FALSE)

	if(!(items[input] && istype(items[input], /obj/item/reagent_containers/cooking_with_jane/cooking_container)))
		return

	var/obj/item/reagent_containers/cooking_with_jane/cooking_container/container = items[input]
	if(set_timer)
		reference_time = timer[input]
	else
		reference_time = world.time - cooking_timestamp[input]

	var/qual_reduction = 0
	switch(temperature[input])
		if("Low")
			qual_reduction = (reference_time / (1 MINUTES))

		if("Medium")
			qual_reduction = (reference_time / (30 SECONDS))

		if("High")
			qual_reduction = (reference_time / (20 SECONDS))


	#ifdef CWJ_DEBUG
	log_debug("oven/proc/handle_cooking data:")
	log_debug("     qual_reduction: [qual_reduction]")
	log_debug("     temperature: [temperature[input]]")
	log_debug("     reference_time: [reference_time]")
	log_debug("     world.time: [world.time]")
	log_debug("     cooking_timestamp: [cooking_timestamp[input]]")
	log_debug("     cook_data: [container.cook_data]")
	#endif


	if(container.cook_data[temperature[input]])
		container.cook_data[temperature[input]] += reference_time
	else
		container.cook_data[temperature[input]] = reference_time


	if(user.Adjacent(src))
		container.process_item(src, user, lower_quality_on_fail = qual_reduction, send_message=TRUE)
	else
		container.process_item(src, user, lower_quality_on_fail = qual_reduction)



/obj/machinery/cooking_with_jane/oven/update_icon()
	cut_overlays()

	for(var/obj/item/our_item in vis_contents)
		src.remove_from_visible(our_item)

	if(panel_open)
		icon_state="oven_open"
	else
		icon_state="oven"

	var/oven_on = FALSE
	for(var/i=1, i<=4, i++)
		if(switches[i] == TRUE)
			if(!oven_on)
				oven_on = TRUE
			add_overlay(image(src.icon, icon_state="[panel_open?"open_":""]burner_[i]"))

	if(oven_on)
		add_overlay(image(src.icon, icon_state="indicator"))


	for(var/i=1, i<=4, i++)
		if(!(items[i]))
			continue
		var/obj/item/our_item = items[i]
		switch(i)
			if(1)
				our_item.pixel_x = -7
				our_item.pixel_y = 0
			if(2)
				our_item.pixel_x = 7
				our_item.pixel_y = 0
			if(3)
				our_item.pixel_x = -7
				our_item.pixel_y = 9
			if(4)
				our_item.pixel_x = 7
				our_item.pixel_y = 9
		src.add_to_visible(our_item, i)
		if(switches[i] == 1)
			add_overlay(image(src.icon, icon_state="steam_[i]", layer=ABOVE_OBJ_LAYER))

/obj/machinery/cooking_with_jane/oven/proc/add_to_visible(var/obj/item/our_item, input)
	our_item.vis_flags = VIS_INHERIT_LAYER | VIS_INHERIT_PLANE | VIS_INHERIT_ID
	src.vis_contents += our_item
	if(input == 2 || input == 4)
		var/matrix/M = matrix()
		M.Scale(-1,1)
		our_item.transform = M
	our_item.transform *= 0.8

/obj/machinery/cooking_with_jane/oven/proc/remove_from_visible(var/obj/item/our_item, input)
	our_item.vis_flags = 0
	our_item.blend_mode = 0
	our_item.transform =  null
	src.vis_contents.Remove(our_item)


#undef ICON_SPLIT_X
#undef ICON_SPLIT_Y
