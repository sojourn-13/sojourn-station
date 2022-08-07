//Cooking containers are used in ovens, fryers and so on, to hold multiple ingredients for a recipe.
//They interact with the cooking process, and link up with the cooking code dynamically.

//Originally sourced from the Aurora, heavily retooled to actually work with CWJ


//Holder for a portion of an incomplete meal,
//allows a cook to temporarily offload recipes to work on things factory-style, eliminating the need for 20 plates to get things done fast.

/obj/item/cooking_with_jane/cooking_container
	icon = 'icons/obj/cwj_cooking/eris_kitchen.dmi'
	var/shortname
	var/place_verb = "into"
	var/appliancetype //string
	w_class = ITEM_SIZE_SMALL
	var/volume = 240 //Don't make recipes using reagents in larger quantities than this amount; they won't work.
	var/datum/cooking_with_jane/recipe_tracker/tracker = null //To be populated the first time the plate is interacted with.
	var/lip //Icon state of the lip layer of the object
	var/removal_penalty = 0 //A flat quality reduction for removing an unfinished recipe from the container.
	var/list/cook_data = list("High"=0 , "Medium" = 0, "Low"=0) //Record of what cooking has been done on this food.
	reagent_flags = NO_REACT

/obj/item/cooking_with_jane/cooking_container/Initialize()
	create_reagents(volume)
	.=..()
	appearance_flags |= KEEP_TOGETHER


/obj/item/cooking_with_jane/cooking_container/examine(var/mob/user)
	if(!..(user, 1))
		return FALSE
	if(contents)
		to_chat(user, get_content_info())
	if(reagents.total_volume)
		to_chat(user, get_reagent_info())

/obj/item/cooking_with_jane/cooking_container/proc/get_content_info()
	var/string = "It contains:</br><ul><li>"
	string += jointext(contents, "</li><li>") + "</li></ul>"
	return string

/obj/item/cooking_with_jane/cooking_container/proc/get_reagent_info()
	return "It contains [reagents.total_volume] units of reagents."

/obj/item/cooking_with_jane/cooking_container/attackby(var/obj/item/I, var/mob/user)

	if((contents || (reagents.total_volume != 0)) && !tracker)
		to_chat("The [src] is full. Remove the finished meal from it first.")

	process_item(I, user)
	return

/obj/item/cooking_with_jane/cooking_container/proc/process_item(var/obj/I, var/mob/user, var/lower_quality_on_fail = 0)
	//OK, time to load the tracker
	if(!tracker)
		tracker = new /datum/cooking_with_jane/recipe_tracker(src)

	switch(tracker.process_item(I, user))
		if(CWJ_NO_STEPS)
			to_chat("It doesn't seem like you can create a meal from that. Yet.")
			if(lower_quality_on_fail != 0)
				for (var/obj/item/contained in contents)
					contained?:food_quality -= lower_quality_on_fail
		if(CWJ_CHOICE_CANCEL)
			to_chat("You decide against adding anything to the [src].")
		if(CWJ_COMPLETE)
			to_chat("You finish cooking with the [src].")
			qdel(tracker)
			tracker = null
			cook_data = list("High"=0 , "Medium" = 0, "Low"=0)
			update_icon()
		if(CWJ_SUCCESS)
			update_icon()
		if(CWJ_LOCKOUT)
			to_chat("You can't make the same decision twice!")

//TODO: Handle the contents of the container being ruined via burning.
/obj/item/cooking_with_jane/cooking_container/proc/handle_burning()
	return

//TODO: Handle the contents of the container lighting on actual fire.
/obj/item/cooking_with_jane/cooking_container/proc/handle_ignition()
	return FALSE

/obj/item/cooking_with_jane/cooking_container/verb/empty()
	set src in oview(1)
	set name = "Empty Container"
	set category = "Object"
	set desc = "Removes items from the container, excluding reagents."
	do_empty(usr)

/obj/item/cooking_with_jane/cooking_container/proc/do_empty(mob/user)
	if (contents.len == 0)
		to_chat(user, SPAN_WARNING("There's nothing in [src] you can remove!"))
		return

	if(tracker && removal_penalty)
		var/was_removed = FALSE
		for (var/obj/item/contained in contents)
			if(!was_removed)
				was_removed = TRUE
			contained?:food_quality -= removal_penalty
		to_chat(user, SPAN_WARNING("The quality of ingredients in the [src] was reduced by the extra jostling."))

	//Handle quality reduction for reagents
	if((reagents.total_volume != 0) && (contents.len != 0))
		var/reagent_qual_reduction = round(reagents.total_volume/contents.len)
		if(reagent_qual_reduction != 0)
			for (var/obj/item/contained in contents)
				contained?:food_quality -= reagent_qual_reduction
			to_chat(user, SPAN_WARNING("The quality of ingredients in the [src] was reduced by the presence of reagents in the container."))

	for (var/contained in contents)
		var/atom/movable/AM = contained
		remove_from_visible(AM)
		AM.forceMove(get_turf(src))

	//TODO: Splash the reagents somewhere
	reagents.clear_reagents()

	update_icon()
	qdel(tracker)
	tracker = null
	cook_data = list("High"=0 , "Medium" = 0, "Low"=0)

	to_chat(user, SPAN_NOTICE("You remove all the solid items from [src]."))


/obj/item/cooking_with_jane/cooking_container/AltClick(var/mob/user)
	do_empty(user)

//Deletes contents of container.
//Used when food is burned, before replacing it with a burned mess
/obj/item/cooking_with_jane/cooking_container/proc/clear()
	QDEL_LIST(contents)
	contents=list()
	reagents.clear_reagents()
	if(tracker)
		qdel(tracker)
		tracker = null
	cook_data = list("High"=0 , "Medium" = 0, "Low"=0)

/obj/item/cooking_with_jane/cooking_container/proc/label(var/number, var/CT = null)
	//This returns something like "Fryer basket 1 - empty"
	//The latter part is a brief reminder of contents
	//This is used in the removal menu
	. = shortname
	if (!isnull(number))
		.+= " [number]"
	.+= " - "
	if (LAZYLEN(contents))
		var/obj/O = locate() in contents
		return . + O.name //Just append the name of the first object
	return . + "empty"

/obj/item/cooking_with_jane/cooking_container/update_icon()
	cut_overlays()
	for(var/obj/item/our_item in vis_contents)
		src.remove_from_visible(our_item)

	for(var/i=contents.len, i>=1, i--)
		var/obj/item/our_item = contents[i]
		src.add_to_visible(our_item)
	if(lip)
		add_overlay(image(src.icon, icon_state=lip, layer=ABOVE_OBJ_LAYER))

/obj/item/cooking_with_jane/cooking_container/proc/add_to_visible(var/obj/item/our_item)
	our_item.pixel_x = initial(our_item.pixel_x)
	our_item.pixel_y = initial(our_item.pixel_y)
	our_item.vis_flags = VIS_INHERIT_LAYER | VIS_INHERIT_PLANE | VIS_INHERIT_ID
	our_item.blend_mode = BLEND_INSET_OVERLAY
	our_item.transform *= 0.6
	src.vis_contents += our_item

/obj/item/cooking_with_jane/cooking_container/proc/remove_from_visible(var/obj/item/our_item)
	our_item.vis_flags = 0
	our_item.blend_mode = 0
	our_item.transform = null
	src.vis_contents.Remove(our_item)

/obj/item/cooking_with_jane/cooking_container/plate
	name = "serving plate"
	shortname = "plate"
	desc = "A plate. Don't put too much on it."
	icon_state = "plate"
	appliancetype = PLATE

/obj/item/cooking_with_jane/cooking_container/oven
	name = "oven dish"
	shortname = "shelf"
	desc = "Put ingredients in this; designed for use with an oven. Warranty void if used."
	icon_state = "ovendish"
	appliancetype = OVEN

/obj/item/cooking_with_jane/cooking_container/skillet
	name = "skillet"
	shortname = "skillet"
	desc = "Chuck ingredients in this to fry something on the stove."
	icon_state = "skillet"
	hitsound = 'sound/weapons/smash.ogg'
	appliancetype = SKILLET

/obj/item/cooking_with_jane/cooking_container/pan
	name = "pan"
	desc = "An normal pan."
	icon = 'icons/obj/cwj_cooking/kitchen.dmi'
	icon_state = "pan" //Default state is the base icon so it looks nice in the map builder
	hitsound = 'sound/weapons/smash.ogg'
	appliancetype = SKILLET
	lip = "pan_lip"

/obj/item/cooking_with_jane/cooking_container/pot
	name = "cooking pot"
	shortname = "pot"
	desc = "Boil things with this. Maybe even stick 'em in a stew."
	icon_state = "pot"
	hitsound = 'sound/weapons/smash.ogg'
	removal_penalty = 5
	appliancetype = POT
	w_class = ITEM_SIZE_BULKY

/obj/item/cooking_with_jane/cooking_container/fryer
	name = "fryer basket"
	shortname = "basket"
	desc = "Put ingredients in this; designed for use with a deep fryer. Warranty void if used."
	icon_state = "basket"
	removal_penalty = 5
	appliancetype = BASKET

/obj/item/cooking_with_jane/cooking_container/grill_grate
	name = "grill grate"
	shortname = "grate"
	place_verb = "onto"
	desc = "Primarily used to grill meat, place this on a grill and enjoy an ancient human tradition."
	icon_state = "grill_grate"
	removal_penalty = 1
	appliancetype = GRILL

/obj/item/cooking_with_jane/cooking_container/bowl
	name = "serving bowl"
	shortname = "bowl"
	desc = "A bowl."
	icon = 'icons/obj/kitchen.dmi'
	icon_state = "mixingbowl"
	removal_penalty = 2
	appliancetype = BOWL
