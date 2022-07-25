#define ICON_SPLIT world.icon_size/2
#define T_HI "High"
#define T_MED "Medium"
#define T_LOW "Low"
#define T_NONE "None"
#define ON 1
#define OFF 0

/obj/machinery/cooking_with_jane/stove
	name = "Stovetop"
	desc = "A set of four burners for cooking food. There seems to be other equipment built into the machine. Is... That a camera?"
	icon = 'icons/obj/cwj_kitchen/eris_kitchen.dmi'
	icon_state = "grill"
	density = TRUE
	anchored = TRUE
	layer = BET_LOW_OBJ_LAYER
	cooking = FALSE
	var/list/temperature= list(T_HI, T_HI, T_HI, T_HI)
	var/list/timer = list(1 MINUTE, 1 MINUTE, 1 MINUTE, 1 MINUTE)
	var/list/switches = list(OFF, OFF, OFF, OFF)
	var/list/cooking_timestamp = list(0, 0, 0, 0) //Timestamp of when cooking initialized so we know if the prep was disturbed at any point.
	var/list/items[4]
	var/reference_time = 0 //The exact moment when we call the process routine, just to account for lag.
	circuit = /obj/item/circuitboard/cooking_with_jane/stove

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
	return input

/obj/machinery/cooking_with_jane/stove/attackby(var/obj/item/used_item, var/mob/user, params)

	if(!(QUALITY_SCREW_DRIVING in used_item.tool_qualities))
		return ..()
	var/list/click_params = params2list(params)
	var/input = getInput(params)
	
	if(item[input] != null)
		to_chat(usr, SPAN_NOTICE("That burner already has something on it!"))		
	else if(istype(used_item, /obj/item/cooking_with_jane/cooking_container))
		to_chat(usr, SPAN_NOTICE("You put a [used_item] on the stove."))
		if(usr.canUnEquip(used_item))
			usr.unEquip(used_item, src)
		else
			used_item.forceMove(src)
		items[input] = used_item

/obj/machinery/cooking_with_jane/stove/attack_hand(mob/user as mob, params)
	var/list/click_params = params2list(params)
	var/input = getInput(params)
	if(item[input] != null)
		if(switches[item] == ON)
			if(istype(items[input], /obj/item/cooking_with_jane/cooking_container))
				var/obj/item/cooking_with_jane/cooking_container/container = items[input]
				reference_time = world.time
				container.tracker.process_item(src)
			if(ishuman(user) && (temperature[input] == T_HI || temperature[input] == T_MED))
				var/mob/living/carbon/human/burn_victim = user
				if(!burn_victim.gloves)
					var/damage = 0
					switch(temperature[input])
						if(T_HI)
							burn_victim.adjustFireLoss(5)
						if(T_MED)
							burn_victim.adjustFireLoss(2)
					to_chat(burn_victim, SPAN_DANGER("You burn your hand a little taking the [item[input]] off of the stove."))
		user.put_in_hands(item[input])
		item[input] = null

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
	var/choice = alert(user,"Select a heat setting for burner [input]. Current temperature: [temperature[input]]",T_HI,T_MED,T_LOW,T_NONE,"Cancel")
	if(choice && choice != "Cancel")
		temperature[input] = choice

/obj/machinery/cooking_with_jane/stove/proc/handle_timer(user, input)
	var/timer[input] = input(user, "Enter a number on the timer for burner [input]", "Minutes") as num

/obj/machinery/cooking_with_jane/stove/proc/handle_switch(user, input)
	var/obj/item/cooking_with_jane/cooking_container/container = items[input]
	if(!istype(container, /obj/item/cooking_with_jane/cooking_container))
		log_debug("stove/proc/handle_switch: Non cooking container item on the stove.")
		return
	
	if(switches[input] == ON)
		switches[input] = OFF
		reference_time = world.time - cooking_timestamp[input]
		container.tracker.process_item(src)
		cooking_timestamp[input] = world.time
	else
		switches[input] = ON
		cooking_timestamp[input] = world.time
		if(timer[input] != 0)
			var/old_timestamp = cooking_timestamp[input]
			spawn(timer[input])
				if(old_timestamp == cooking_timestamp[input])
					reference_time = timer[input]


		
	



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