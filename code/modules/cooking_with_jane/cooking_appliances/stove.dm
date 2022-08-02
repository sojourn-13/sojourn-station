#define ICON_SPLIT world.icon_size/2
#define ON 1
#define OFF 0


/obj/machinery/cooking_with_jane/stove
	name = "Stovetop"
	desc = "A set of four burners for cooking food. There seems to be other equipment built into the machine. Is... That a camera?"
	icon = 'icons/obj/cwj_kitchen/eris_kitchen.dmi'
	icon_state = "grill"
	density = TRUE
	anchored = TRUE
	layer = BELOW_OBJ_LAYER
	cooking = FALSE
	var/list/temperature= list("Low", "Low", "Low", "Low")
	var/list/timer = list(1 MINUTE, 1 MINUTE, 1 MINUTE, 1 MINUTE)
	var/list/switches = list(OFF, OFF, OFF, OFF)
	var/list/cooking_timestamp = list(0, 0, 0, 0) //Timestamp of when cooking initialized so we know if the prep was disturbed at any point.
	var/list/items[4]

	var/active_input //The input that cooking tracker objects look at
	var/reference_time = 0 //The exact moment when we call the process routine, just to account for lag.

	var/power_cost = 2500 //Power cost per process step for a particular burner
	var/check_on_10 = 0
	
	var/on_fire = FALSE //if the stove has caught fire or not.
	
	circuit = /obj/item/circuitboard/cooking_with_jane/stove

//Did not want to use this...
/obj/machinery/cooking_with_jane/stove/Process()

	if(on_fire)
		//Do bad things if it is on fire.

	//Under normal circumstances, Only process this thing every 10 process calls; it doesn't need to be hyper-accurate.
	if(check_on_10 != 10)
		check_on_10++
		return
	else
		check_on_10 = 0
	
	if(switches[1] == ON)
		cook_checkin(1)
	if(switches[2] == ON)
		cook_checkin(2)
	if(switches[3] == ON)
		cook_checkin(3)
	if(switches[4] == ON)
		cook_checkin(4)

//Process how a specific stove is interacting with material
/obj/machinery/cooking_with_jane/stove/proc/cook_checkin(var/input)
	use_power(power_cost)
	log_debug("/cooking_with_jane/stove/proc/cook_checkin called on burner [input]")

	if(items[input])
		switch(temperature[input])
			if("Low")
				if( (world.time - cooking_timestamp[input]) > CWJ_BURN_TIME_LOW)
					handle_burning(input)
				if( (world.time - cooking_timestamp[input]) > CWJ_IGNITE_TIME_LOW)
					handle_ignition(input)

			if("Medium")
				if( (world.time - cooking_timestamp[input]) > CWJ_BURN_TIME_MEDIUM)
					handle_burning(input)
				if( (world.time - cooking_timestamp[input]) > CWJ_IGNITE_TIME_MEDIUM)
					handle_ignition(input)

			if("High")
				if( (world.time - cooking_timestamp[input]) > CWJ_BURN_TIME_HIGH)
					handle_burning(input)
				if( (world.time - cooking_timestamp[input]) > CWJ_IGNITE_TIME_HIGH)
					handle_ignition(input)
	
/obj/machinery/cooking_with_jane/stove/proc/handle_burning(input)
	if(!(items[input] && istype(items[input], /obj/item/cooking_with_jane/cooking_container)))
		return
	
	var/obj/item/cooking_with_jane/cooking_container/container = items[input]
	container.handle_burning()

/obj/machinery/cooking_with_jane/stove/proc/handle_ignition(input)
	if(!(items[input] && istype(items[input], /obj/item/cooking_with_jane/cooking_container)))
		return
	
	var/obj/item/cooking_with_jane/cooking_container/container = items[input]
	if(container.handle_ignition())
		on_fire = TRUE

//Retrieve which quadrant of the baking pan is being used.
/obj/machinery/cooking_with_jane/stove/proc/getInput(params)
	var/input
	var/icon_x = text2num(click_params["icon-x"])
	var/icon_y = text2num(click_params["icon-y"])
	if(icon_x < ICON_SPLIT && icon_y < ICON_SPLIT)
		input = 1
	else if(icon_x > ICON_SPLIT && icon_y < ICON_SPLIT)
		input = 2
	else if(icon_x < ICON_SPLIT && icon_y > ICON_SPLIT)
		input = 3
	else if(icon_x > ICON_SPLIT && icon_y > ICON_SPLIT)
		input = 4
	
	log_debug("cooking_with_jane/stove/proc/getInput returned burner [input]")
	return input

/obj/machinery/cooking_with_jane/stove/attackby(var/obj/item/used_item, var/mob/user, params)
	if(!(QUALITY_SCREW_DRIVING in used_item.tool_qualities))
		return ..()
	var/list/click_params = params2list(params)
	var/input = getInput(params)
	
	if(item[input] != null)
		to_chat(usr, SPAN_NOTICE("That burner already has something on it!"))		
	else
		to_chat(usr, SPAN_NOTICE("You put a [used_item] on the stove."))
		if(usr.canUnEquip(used_item))
			usr.unEquip(used_item, src)
		else
			used_item.forceMove(src)
		items[input] = used_item
		if(switches[input] == ON)
			cooking_timestamp[input] = world.time
	update_icon()

/obj/machinery/cooking_with_jane/stove/attack_hand(mob/user as mob, params)
	var/list/click_params = params2list(params)
	var/input = getInput(params)
	if(item[input] != null)
		if(switches[item] == ON)
			
			handle_cooking(user, input)
			
			if(ishuman(user) && (temperature[input] == "High" || temperature[input] == "Medium" ))
				var/mob/living/carbon/human/burn_victim = user
				if(!burn_victim.gloves)
					var/damage = 0
					switch(temperature[input])
						if("High")
							burn_victim.adjustFireLoss(5)
						if("Medium")
							burn_victim.adjustFireLoss(2)
					to_chat(burn_victim, SPAN_DANGER("You burn your hand a little taking the [item[input]] off of the stove."))
		user.put_in_hands(item[input])
		item[input] = null
		update_icon()

/obj/machinery/cooking_with_jane/stove/CtrlClick(/var/mob/user, params)
	if(!(user.stat || user.restrained() || (!in_range(src, user))))
		return

	var/input = getInput(params)
	
	var/choice = alert(user,"Select an action to take on burner [input]","Set temperature","Set timer")
	switch(choice)
		if("Set temperature")
			handle_temperature(user, input)
		if("Set timer")
			handle_timer(user, input)

//Switch the cooking device on or off with alt+click
/obj/machinery/cooking_with_jane/stove/AltClick(/var/mob/user, params)
	if(!(user.stat || user.restrained() || (!in_range(src, user))))
		return
	var/input = getInput(params)
	handle_switch(user, input)

/obj/machinery/cooking_with_jane/stove/proc/handle_temperature(user, input)
	var/old_temp = temperature[input]
	var/choice = alert(user,"Select a heat setting for burner [input]. Current temperature: [old_temp]","High","Medium","Low","Cancel")
	if(choice && choice != "Cancel" && choice != old_temp)
		temperature[input] = choice
		if(switches[input] = ON)
			handle_cooking(user, input)
			cooking_timestamp[input] = world.time

/obj/machinery/cooking_with_jane/stove/proc/handle_timer(user, input)
	var/timer[input] = input(user, "Enter a number on the timer for burner [input]", "Minutes") as num

/obj/machinery/cooking_with_jane/stove/proc/handle_switch(user, input)


	playsound(src, 'sound/items/lighter.ogg', 100, 1, 0)
	if(switches[input] == ON)
		switches[input] = OFF
		handle_cooking(user, input)
		cooking_timestamp[input] = world.time
	else
		switches[input] = ON
		cooking_timestamp[input] = world.time
		if(timer[input] != 0)
			spawn(timer[input])
				if(switches[input] = ON)
					playsound(src, 'sound/items/lighter.ogg', 100, 1, 0)
					switches[input] = OFF
					handle_cooking(user, input)
	update_icon()

/obj/machinery/cooking_with_jane/stove/proc/handle_cooking(var/mob/user, var/input)
	
	if(!(items[input] && istype(items[input], /obj/item/cooking_with_jane/cooking_container)))
		return
		
	var/obj/item/cooking_with_jane/cooking_container/container = items[input]
	if(set_timer)
		reference_time = set_timer
	else
		reference_time = world.time - cooking_timestamp[input]

	var/qual_reduction = 0
	switch(temperature[input])
		if("Low")
			qual_reduction = (reference_time / 1 MINUTES)

		if("Medium")
			qual_reduction = (reference_time / 30 SECONDS)

		if("High")
			qual_reduction = (reference_time / 20 SECONDS)

	active_input = input
	container.process_item(src, user, lower_quality_on_fail = qual_reduction)




/obj/machinery/cooking_with_jane/stove/update_icon()
	cut_overlays()
	for(var/i=contents.len, i>=1, i--)
		var/obj/item/our_item = contents[i]
		switch(i)
			if(1)
				our_item.pixel_x = 13
				our_item.pixel_y = 20
			if(1)
				our_item.pixel_x = 24
				our_item.pixel_y = 20
		src.add_to_visible(our_item)
	if(cooking)
		add_overlay(grill)


#undef ICON_SPLIT
