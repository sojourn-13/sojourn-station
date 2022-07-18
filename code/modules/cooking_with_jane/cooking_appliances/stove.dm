/obj/machinery/cooking_with_jane/stove
	name = "Default Cooking Appliance"
	desc = "Lookit me, I'm a cool machinery-doo. Hex didn't take his focus pills today."
	icon = 'icons/obj/cwj_kitchen/eris_kitchen.dmi'
	icon_state = "grill"
	density = TRUE
	anchored = TRUE
	layer = BELOW_OBJ_LAYER
	cooking = FALSE
	circuit = /obj/item/circuitboard/cooking_with_jane/stove

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