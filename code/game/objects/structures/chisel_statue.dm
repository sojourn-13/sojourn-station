
//Chisels copied from tgstation. Thanks lads!

/obj/item/chisel
	name = "chisel"
	desc = "Breaking and making art since 4000 BC."
	icon = 'icons/obj/statue.dmi'
	icon_state = "chisel"
	flags = CONDUCT
	slot_flags = SLOT_BELT
	force = 5
	w_class = ITEM_SIZE_TINY
	throwforce = 5
	throw_speed = 3
	throw_range = 5
	matter = list(MATERIAL_STEEL = 1)
	sharp = 1
	var/chisel_speed = 3

	/// Block we're currently carving in
	var/obj/structure/carving_block/prepared_block
	/// If tracked user moves we stop sculpting
	var/mob/living/tracked_user
	/// Currently sculpting
	var/sculpting = FALSE

/*
Hit the block to start
Point with the chisel at the target to choose what to sculpt or hit block to choose from preset statue types.
Hit block again to start sculpting.
Moving interrupts
*/
/obj/item/chisel/pre_attack(atom/A, mob/living/user, params)
	. = ..()
	if(sculpting)
		return
	if(istype(A,/obj/structure/carving_block))
		if(A == prepared_block && (prepared_block.current_target || prepared_block.current_preset_type))
			start_sculpting(user)
		else if(!prepared_block)
			set_block(A,user)
		return TRUE
	else if(prepared_block) //We're aiming at something next to us with block prepared
		prepared_block.set_target(A,user)
		return TRUE

// We aim at something distant.
/obj/item/chisel/afterattack(atom/target, mob/user, proximity_flag, click_parameters)
	. = ..()
	if(!proximity_flag && !sculpting && prepared_block && ismovable(target) && prepared_block.completion == 0)
		prepared_block.set_target(target,user)

/obj/item/chisel/proc/start_sculpting(mob/living/user)
	to_chat(user,span_notice("You start sculpting [prepared_block]."))
	sculpting = TRUE
	//How long whole process takes
	var/sculpting_time = 30 SECONDS
	//Single interruptible progress period
	var/sculpting_period = round(sculpting_time / world.icon_size) //this is just so it reveals pixels line by line for each.
	var/interrupted = FALSE
	var/remaining_time = sculpting_time - (prepared_block.completion * sculpting_time)

	var/datum/progressbar/total_progress_bar = new(user, sculpting_time, prepared_block )
	while(remaining_time > 0 && !interrupted)
		if(do_after(user,sculpting_period, target = prepared_block, progress = FALSE))
			remaining_time -= sculpting_period
			prepared_block.set_completion((sculpting_time - remaining_time)/sculpting_time)
			total_progress_bar.update(sculpting_time - remaining_time)
		else
			interrupted = TRUE
	if(!interrupted && !QDELETED(prepared_block))
		prepared_block.create_statue()
		to_chat(user,span_notice("The statue is finished!"))
	break_sculpting()

/obj/item/chisel/proc/set_block(obj/structure/carving_block/B,mob/living/user)
	prepared_block = B
	tracked_user = user
	RegisterSignal(tracked_user,COMSIG_MOVABLE_MOVED,.proc/break_sculpting)
	to_chat(user,span_notice("You prepare to work on [B]."))

/obj/item/chisel/dropped(mob/user, silent)
	. = ..()
	break_sculpting()

/obj/item/chisel/proc/break_sculpting()
	SIGNAL_HANDLER
	sculpting = FALSE
	if(prepared_block && prepared_block.completion == 0)
		prepared_block.reset_target()
	prepared_block = null
	if(tracked_user)
		UnregisterSignal(tracked_user,COMSIG_MOVABLE_MOVED)
		tracked_user = null


/obj/item/chisel/Destroy()
	prepared_block = null
	tracked_user = null
	return ..()

/obj/item/statue_kit
	name = "sculpting block construction kit"
	desc = "To make a sculpting block, you need to hit this with material sheets."

/obj/item/statue_kit/attackby(obj/item/O, mob/user)
	if(!istype(O, /obj/item/stack/material))
		return ..()
	var/obj/item/stack/material/M = O
	if(M.use(2))
		var/obj/structure/carving_block/CB = new /obj/structure/carving_block(get_turf(src))
		CB.matter = list(M.material = 2)
		CB.update_icon()
	else
		to_chat(user, SPAN_NOTICE("You need 2 sheets of material to make a block."))

/obj/structure/carving_block
	name = "block"
	desc = "ready for sculpting."
	icon = 'icons/obj/statue.dmi'
	icon_state = "block"
	density = TRUE

	/// The thing it will look like - Unmodified resulting statue appearance
	var/current_target
	/// Currently chosen preset statue type
	var/current_preset_type
	//Table of required materials for each non-abstract statue type
	var/static/list/statue_costs
	/// statue completion from 0 to 1.0
	var/completion = 0
	/// Greyscaled target with cutout filter
	var/mutable_appearance/target_appearance_with_filters
	/// HSV color filters parameters
	var/static/list/greyscale_with_value_bump = list(0,0,0, 0,0,0, 0,0,1, 0,0,-0.05)

/obj/structure/carving_block/Destroy()
	current_target = null
	target_appearance_with_filters = null
	return ..()

/obj/structure/carving_block/proc/set_target(atom/movable/target,mob/living/user)
	if(!is_viable_target(target))
		to_chat(user,"You won't be able to carve that.")
		return
	if(istype(target,/obj/structure/statue/custom))
		var/obj/structure/statue/custom/original = target
		current_target = original.content_ma
	else
		current_target = target.appearance
	var/mutable_appearance/ma = current_target
	to_chat(user,span_notice("You decide to sculpt [src] into [ma.name]."))

/obj/structure/carving_block/proc/reset_target()
	current_target = null
	current_preset_type = null
	target_appearance_with_filters = null

/obj/structure/carving_block/update_icon()
	..()
	var/list/new_overlays = update_overlays()
		cut_overlay(managed_overlays)
	if(length(new_overlays))
		add_overlay(new_overlays)

/obj/structure/carving_block/proc/update_overlays()
	. = ..()
	if(matter.len)
		var/material/mat = matter[1]
		color = mat.icon_colour
	if(!target_appearance_with_filters)
		return
	//We're only keeping one instance here that changes in the middle so we have to clone it to avoid managed overlay issues
	var/mutable_appearance/clone = new(target_appearance_with_filters)
	. += clone

/obj/structure/carving_block/proc/is_viable_target(atom/movable/target)
	//Only things on turfs
	if(!isturf(target.loc))
		return FALSE
	//No big icon things
	var/icon/thing_icon = icon(target.icon, target.icon_state)
	if(thing_icon.Height() != world.icon_size || thing_icon.Width() != world.icon_size)
		return FALSE
	return TRUE

/obj/structure/carving_block/proc/create_statue()
	if(current_target)
		var/obj/structure/statue/custom/new_statue = new(get_turf(src))
		new_statue.set_visuals(current_target)
		new_statue.matter = matter
		var/mutable_appearance/ma = current_target
		new_statue.name = "statue of [ma.name]"
		new_statue.desc = "statue depicting [ma.name]"
		qdel(src)

/obj/structure/carving_block/proc/set_completion(value)
	if(!current_target)
		return
	if(!target_appearance_with_filters)
		target_appearance_with_filters = new(current_target)
		// KEEP_APART in case carving block gets KEEP_TOGETHER from somewhere like material texture filters.
		target_appearance_with_filters.appearance_flags |= KEEP_TOGETHER | KEEP_APART
		//Doesn't use filter helpers because MAs aren't atoms
		target_appearance_with_filters.filters = filter(type="color",color=greyscale_with_value_bump,space=FILTER_COLOR_HSV)
	completion = value
	var/static/icon/white = icon('icons/effects/alphacolors.dmi', "white")
	switch(value)
		if(0)
			//delete uncovered and reset filters
			remove_filter("partial_uncover")
			target_appearance_with_filters = null
		else
			var/mask_offset = min(world.icon_size,round(completion * world.icon_size))
			remove_filter("partial_uncover")
			add_filter("partial_uncover", 1, alpha_mask_filter(icon = white, y = -mask_offset))
			target_appearance_with_filters.filters = filter(type="alpha",icon=white,y=-mask_offset,flags=MASK_INVERSE)
	update_icon()




/obj/structure/statue/custom
	name = "custom statue"
	icon = 'icons/obj/statue.dmi'
	icon_state = "base"
	density = TRUE
	appearance_flags = TILE_BOUND | PIXEL_SCALE | KEEP_TOGETHER //Added keep together in case targets has weird layering
	/// primary statue overlay
	var/mutable_appearance/content_ma
	var/static/list/greyscale_with_value_bump = list(0,0,0, 0,0,0, 0,0,1, 0,0,-0.05)
	var/renamedByPlayer = FALSE

/obj/structure/statue/custom/attackby(obj/item/I, mob/user)
	if(!istype(I, /obj/item/pen))
		return ..()
	var/penchoice = input(user, "What would you like to edit?", "Rename or change description?") as null|anything in list("Rename","Change description")
	if(QDELETED(src))
		return
	if(penchoice == "Rename")
		var/input = stripped_input(user,"What do you want to name \the [name]?", ,"", 128)
		var/oldname = name
		if(QDELETED(src))
			return
		if(oldname == input)
			to_chat(user, "<span class='notice'>You changed \the [name] to... well... \the [name].</span>")
		else
			name = input
			to_chat(user, "<span class='notice'>\The [oldname] has been successfully been renamed to \the [input].</span>")
			renamedByPlayer = TRUE

	if(penchoice == "Change description")
		var/input = stripped_input(user,"Describe \the [name] here", ,"", 4096)
		if(QDELETED(src))
			return
		desc = input
		to_chat(user, "<span class='notice'>You have successfully changed \the [name]'s description.</span>")

/obj/structure/statue/custom/Destroy()
	content_ma = null
	return ..()

/obj/structure/statue/custom/proc/set_visuals(model_appearance)
	if(content_ma)
		QDEL_NULL(content_ma)
	content_ma = new
	content_ma.appearance = model_appearance
	content_ma.pixel_x = 0
	content_ma.pixel_y = 0
	content_ma.alpha = 255
	content_ma.appearance_flags &= ~KEEP_APART //Don't want this
	content_ma.filters = filter(type="color",color=greyscale_with_value_bump,space=FILTER_COLOR_HSV)
	update_icon()

/obj/structure/statue/custom/update_icon()
	..()
	if(matter.len)
		var/material/mat = matter[1]
		color = mat.icon_colour
	var/list/new_overlays = update_overlays()
	if(length(new_overlays))
		add_overlay(new_overlays)

/obj/structure/statue/custom/proc/update_overlays()
	return content_ma
