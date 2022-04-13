/obj/machinery/slime_compresser
	name = "slime compresser"
	desc = "This state of the art compresser is designed to take in slime body remains and compresses them into one more slime core."
	icon = 'icons/obj/kitchen.dmi'
	icon_state = "compresser"
	density = TRUE
	anchored = TRUE
	layer = BELOW_OBJ_LAYER

	circuit = /obj/item/circuitboard/slime_compresser

	use_power = IDLE_POWER_USE
	idle_power_usage = 2
	active_power_usage = 500

/obj/machinery/slime_compresser/update_icon()
	return //Were boring and have no alt icons

/obj/machinery/slime_compresser/affect_grab(var/mob/user, var/mob/target, var/state)
	if(state < GRAB_NECK)
		to_chat(user, SPAN_DANGER("You need a better grip to do that!"))
		return FALSE
	move_into_gibber(user, target)
	return TRUE

/obj/machinery/slime_compresser/MouseDrop_T(mob/target, mob/user)
	if(user.stat || user.restrained())
		return
	move_into_gibber(user,target)

/obj/machinery/slime_compresser/attackby(var/obj/item/I, var/mob/user as mob)

	if(default_deconstruction(I, user))
		return

	if(default_part_replacement(I, user))
		return

	..()

/obj/machinery/slime_compresser/proc/move_into_gibber(mob/user,mob/living/carbon/slime/victim)

	if(!isslime(victim))
		to_chat(user, SPAN_DANGER("This is not suitable for the gibber!"))
		return

	user.visible_message(SPAN_DANGER("[user] starts to put [victim] into the slime compresser!"))
	src.add_fingerprint(user)
	if(do_after(user, 30, src) && victim.Adjacent(src) && user.Adjacent(src) && victim.Adjacent(user))
		user.visible_message(SPAN_DANGER("\The [user] stuffs \the [victim] into the compresser!"))
		flick("compressering", src)
		new victim.coretype(user.loc)
		qdel(victim)

// Dye vat and its various procs and checks --- Currently a work in progress but dosn't break anything ---
/obj/machinery/slime_dye_vat
	name = "slime dye vat"
	desc = "This machine holds slime that changes color! Makes it easy to apply to clothing."
	icon = 'icons/obj/xenobio.dmi'
	icon_state = "slime_vat"
	density = TRUE
	anchored = TRUE
	layer = BELOW_OBJ_LAYER

	use_power = IDLE_POWER_USE
	idle_power_usage = 2
	active_power_usage = 500

	var uses = 0
	var colour = "grey"
	var dirty = 0
	var effect = "null"

/obj/machinery/slime_dye_vat/update_icon()
	// the fun part of mixing the sprite pieces together
	return


//should be used to "eject" whatever item was placed inside to dye it.
/obj/machinery/slime_dye_vat/attack_hand(mob/user as mob)
	return

/obj/machinery/slime_dye_vat/proc/dyinginside()
	if (dirty >= 5)
		dirty = 0
		var/mob/living/carbon/slime/S = new /mob/living/carbon/slime
		S.loc = src.loc
		var/list/colors = list("grey" = 10,
		"purple" = 4,
		"metal" = 4,
		"orange" = 4,
		"blue" = 4,
		"dark blue" = 2,
		"dark purple" = 2,
		"yellow" = 2,
		"silver" = 2,
		"pink" = 1,
		"red" = 1,
		"gold" = 1,
		"green" = 1)
		S.set_mutation(pickweight(colors))
	//colors items, applies effects if dye color is from potion and uses isn't 0

/obj/machinery/slime_dye_vat/examine(mob/user)
	..()
	if(uses >= 1)
		to_chat(user, SPAN_NOTICE("The dye vat has some slime prepped in it!"))
	else to_chat(user, SPAN_NOTICE("Only useless jelly remains inside."))

//keep the vat clean or it releases weak slimes. Keeps people from constantly switching out colors or effects.
/obj/machinery/slime_dye_vat/verb/clean()
	set name = "Scrub Vat"
	set category = "Object"
	set src in oview(1)

	if(!isliving(usr))
		return

	uses = 0
	colour = "grey"
	dirty = 0
