//Cooking containers are used in ovens, fryers and so on, to hold multiple ingredients for a recipe.
//They interact with the cooking process, and link up with the cooking code dynamically.

//Originally sourced from the Aurora, heavily retooled to actually work with CWJ


//Holder for a portion of an incomplete meal, 
//allows a cook to temporarily offload recipes to work on things factory-style, eliminating the need for 20 plates to get things done fast.

/obj/item/cooking_with_jane/cooking_container
	icon = 'icons/obj/cooking_machines.dmi'
	var/appliancetype //string
	w_class = ITEMSIZE_NORMAL
	var/datum/cooking_with_jane/recipe_tracker = NULL //To be populated the first time the plate is interacted with.
	var/list/foodstuff = list() //Whatever food is on or in the container.

/obj/item/cooking_with_jane/cooking_container/examine(var/mob/user)
	if(!..(user, 1))
		return FALSE
	if(foodstuff)
		to_chat(user, get_content_info())
	if(reagents.total_volume)
		to_chat(user, get_reagent_info())
	if(recipe_tracker && recipe_tracker.tracked_steps)
		for(var/datum/cooking_with_jane/recipe_pointer/potential_recipe in recipe_tracker.steps_taken)
			potential_recipe.current_step
			to_chat(user, "<b>A [potential_recipe.current_recipe.name] can be made with this:</b>")
			for(var/key in steps_taken)
				to_chat(user, "    -> [steps_taken[key]]")

/obj/item/reagent_containers/cooking_container/proc/get_content_info()
	var/string = "It contains:</br><ul><li>"
	string += jointext(foodstuff, "</li><li>") + "</li></ul>"
	return string

/obj/item/reagent_containers/cooking_container/proc/get_reagent_info()
	return "It contains [reagents.total_volume] units of reagents."

/obj/item/reagent_containers/cooking_container/attackby(var/obj/item/I, var/mob/user)

	if(foodstuff && !recipe_tracker)
		to_chat("The [src] is full. Remove the finished meal from it first.")

	//OK, time to load the tracker
	if(!recipe_tracker)
		recipe_tracker = new /datum/cooking_with_jane/recipe_tracker(src)
	
	switch(recipe_tracker.process_item(I))
		if(CWJ_NO_STEPS)
			to_chat("It doesn't seem like you can create a meal from that. Yet.")
		if(CWJ_CHOICE_CANCEL)
			to_chat("You decide against adding anything to the [src].")
		if(CWJ_COMPLETE)
			to_chat("You finish cooking with the [src].")
			qdel(recipe_tracker)
			recipe_tracker = NULL
			update_icon()
		if(CWJ_SUCCESS)
			update_icon()
		if(CWJ_LOCKOUT)
			to_chat("You can't make the same decision twice!")
	return
		

/obj/item/reagent_containers/cooking_container/verb/empty()
	set src in oview(1)
	set name = "Empty Container"
	set category = "Object"
	set desc = "Removes items from the container, excluding reagents."
	do_empty(usr)

/obj/item/reagent_containers/cooking_container/proc/do_empty(mob/user)
	if (use_check_and_message(user))
		return

	if (isemptylist(foodstuff))
		to_chat(user, SPAN_WARNING("There's nothing in [src] you can remove!"))
		return

	for (var/contained in foodstuff)
		var/atom/movable/AM = contained
		AM.forceMove(get_turf(src))

	qdel(recipe_tracker)
	recipe_tracker = null

	to_chat(user, SPAN_NOTICE("You remove all the solid items from [src]."))


/obj/item/reagent_containers/cooking_container/AltClick(var/mob/user)
	do_empty(user)

//Deletes contents of container.
//Used when food is burned, before replacing it with a burned mess
/obj/item/reagent_containers/cooking_container/proc/clear()
	QDEL_NULL_LIST(foodstuff)
	reagents.clear_reagents()
	if(recipe_tracker)
		qdel(recipe_tracker)
		recipe_tracker = null

/obj/item/reagent_containers/cooking_container/proc/label(var/number, var/CT = null)
	//This returns something like "Fryer basket 1 - empty"
	//The latter part is a brief reminder of contents
	//This is used in the removal menu
	. = shortname
	if (!isnull(number))
		.+= " [number]"
	.+= " - "
	if (LAZYLEN(foodstuff))
		var/obj/O = locate() in foodstuff
		return . + O.name //Just append the name of the first object
	return . + "empty"

/obj/item/reagent_containers/cooking_container/plate
	name = "serving plate"
	shortname = "plate"
	desc = "A plate. Don't put too much on it."
	icon_state = "plate"
	appliancetype = PLATE

/obj/item/reagent_containers/cooking_container/oven
	name = "oven dish"
	shortname = "shelf"
	desc = "Put ingredients in this; designed for use with an oven. Warranty void if used."
	icon_state = "ovendish"
	max_space = 30
	volume = 120
	appliancetype = OVEN

/obj/item/reagent_containers/cooking_container/skillet
	name = "skillet"
	shortname = "skillet"
	desc = "Chuck ingredients in this to fry something on the stove."
	icon_state = "skillet"
	volume = 30
	force = 11
	hitsound = 'sound/weapons/smash.ogg'
	appliancetype = SKILLET

/obj/item/reagent_containers/cooking_container/pot
	name = "cooking pot"
	shortname = "pot"
	desc = "Boil things with this. Maybe even stick 'em in a stew."
	icon_state = "pot"
	max_space = 50
	volume = 180
	force = 8
	hitsound = 'sound/weapons/smash.ogg'
	flags = OPENCONTAINER // Will still react
	appliancetype = POT
	w_class = ITEMSIZE_LARGE

/obj/item/reagent_containers/cooking_container/fryer
	name = "fryer basket"
	shortname = "basket"
	desc = "Put ingredients in this; designed for use with a deep fryer. Warranty void if used."
	icon_state = "basket"
	appliancetype = BASKET

/obj/item/reagent_containers/cooking_container/grill_grate
	name = "grill grate"
	shortname = "grate"
	place_verb = "onto"
	desc = "Primarily used to grill meat, place this on a grill and enjoy an ancient human tradition."
	icon_state = "grill_grate"
	appliancetype = GRILL

/obj/item/reagent_containers/cooking_container/bowl
	name = "serving bowl"
	shortname = "bowl"
	desc = "A bowl."
	icon = 'icons/obj/kitchen.dmi'
	icon_state = "mixingbowl"
	center_of_mass = list("x" = 17,"y" = 7)
	appliancetype = BOWL


