#define ICON_SPLIT world.icon_size/2
#define HI "High"
#define MED "Medium"
#define LOW "Low"
#define ON 1
#define OFF 0

/obj/machinery/cooking_with_jane/stove
	name = "Default Cooking Appliance"
	desc = "Lookit me, I'm a cool machinery-doo. Hex didn't take his focus pills today."
	icon = 'icons/obj/cwj_kitchen/eris_kitchen.dmi'
	icon_state = "grill"
	density = TRUE
	anchored = TRUE
	layer = BELOW_OBJ_LAYER
	cooking = FALSE
	var/list/temperature= list(HI, HI, HI, HI)
	var/list/timer = list(1 MINUTE, 1 MINUTE, 1 MINUTE, 1 MINUTE)
	var/list/switch = list(OFF, OFF, OFF, OFF)
	var/list/items[4]
	circuit = /obj/item/circuitboard/cooking_with_jane/stove

/obj/machinery/cooking_with_jane/stove/attackby(var/obj/item/used_item, var/mob/user, params)

	if(!(QUALITY_SCREW_DRIVING in used_item.tool_qualities))
		return ..()
	var/list/click_params = params2list(params)
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

	if(item[input] != null)
		user.put_in_hands(item[input])
		item[input] = null

	
	



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