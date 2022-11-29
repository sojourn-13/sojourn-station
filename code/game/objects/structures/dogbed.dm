/obj/structure/dogbed
	name = "dog bed"
	desc = "A bed made especially for dogs or other similarly sized pets."
	icon = 'icons/obj/furniture.dmi'
	icon_state = "dogbed"
	can_buckle = 1
	buckle_dir = SOUTH
	buckle_lying = 1

/// SNOWFLAKE RUNTIME CARDBOARD BOX BED HERE ///

/obj/structure/cardboardbox
	name = "Runtime's emotional support box"
	desc = "An opened carboard box, presumably from some shipping company, that was used to transport goods to the CBO's office. \
			It has now been appropiated by Runtime as its favorite (and exclusive) bed."
	icon = 'icons/obj/furniture.dmi'
	icon_state = "cardboard_box_empty"
	density = FALSE
	anchored = TRUE
	var/mob/living/simple_animal/cat/sitting = null // No one else shall use her favorite bed!

/obj/structure/cardboardbox/proc/sit_inside(var/mob/R, var/mob/user)
	if(!R)
		return

	if(sitting)
		to_chat(user, SPAN_WARNING("[src] is already occupied by \the [R]."))
		return

	var/mob/living/simple_animal/cat/C = R
	if(!iscatto(C)) // Cardboard boxes are just for cats!
		if(R == user) // Sanity check for player-controlled cat mobs
			visible_message("[user] tries climbing into [src] but bluespace force pushes them back outside!")
		else
			visible_message("[user] tries putting [R] into [src] but it can only be occupied by cats!.")
		return
	if(R == user)
		visible_message("[user] starts climbing into [src].")
	else
		visible_message("[user] starts putting [R] into [src].")

	if(do_after(user, 10, src)) // A short window.
		if(sitting)
			to_chat(user, SPAN_WARNING("[src] is already occupied.")) // Sanity check in case the animal climbed first on its own before the usr does the proc
			return
		R.stop_pulling()
		if(R.client) // For player controlled cats to shift point of view
			R.client.perspective = EYE_PERSPECTIVE
			R.client.eye = src
		R.loc = src
		sitting = R
		update_icon()

/obj/structure/cardboardbox/proc/get_out()
	if(!sitting)
		return
	if(sitting.client)
		sitting.client.eye = sitting.client.mob
		sitting.client.perspective = MOB_PERSPECTIVE
	sitting.loc = loc
	sitting = null
	update_icon()

// Basic clickdrag action
/obj/structure/cardboardbox/MouseDrop_T(var/mob/target, var/mob/user)
	if(user.stat || user.lying || !Adjacent(user) || !target.Adjacent(user)|| !iscatto(target))
		return
	sit_inside(target, user)

// We need to be able to take out the cat from the box, from the outside.
/obj/structure/cardboardbox/verb/scoop_out_catto()
	set name = "Scoop out cat"
	set desc = "Take the cat out of the box."
	set category = "Object"
	set src in view(1)

	if (usr.incapacitated() || sitting == usr)
		return

	get_out()

// Or we can do it by hand.
/obj/structure/cardboardbox/attack_hand(var/mob/user)
	get_out()

/obj/structure/cardboardbox/update_icon()
	cut_overlays()
	icon_state = "cardboard_box_empty"

	if(sitting)
		if(istype(sitting, /mob/living/simple_animal/cat/runtime))
			add_overlay("trilby_sit")
		else if(istype(sitting, /mob/living/simple_animal/cat/fluff)) // Not making another overlay for just one pixel of an eye, sorry Bones!
			add_overlay("runtime_sit")
		else
			add_overlay("catto_sit")

