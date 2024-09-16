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
		playsound(loc, 'sound/machines/juicer.ogg', 50, 1)
		flick("compressering", src)
		var/number_of_cores
		for(number_of_cores=0, number_of_cores <victim.cores, number_of_cores++)
			new victim.coretype(user.loc)
		qdel(victim)

//Dye vat and its various procs and checks
/obj/machinery/slime_dye_vat
	name = "slime dye vat"
	desc = "This machine takes slimes and crayons of different colors to dye clothing! Remember to scrub it to keep it clean after use, or else..."
	icon = 'icons/obj/xenobio.dmi'
	icon_state = "slime_vat"
	density = TRUE
	anchored = TRUE
	layer = BELOW_OBJ_LAYER

	use_power = IDLE_POWER_USE
	idle_power_usage = 2
	active_power_usage = 500

	var/uses = 0
	var/colour = "grey"
	var/dirty = 0
	var/running = FALSE
	var/obj/item/clothing/C = null
	var/list/allowed_devices = list(
		/obj/item/clothing,
		/obj/item/pen/crayon,
		/obj/item/slime_potion
	)

/obj/machinery/slime_dye_vat/update_icon()
	//checks to see if we need the slime ontop. Updates colours and changes the face plate.
	if(C == null)
		cut_overlays()
		var/mutable_appearance/slime_vat_soup = mutable_appearance('icons/obj/xenobio.dmi', "slime_vat_soup")
		slime_vat_soup.color = colour
		add_overlay(slime_vat_soup)
		return
	cut_overlays()
	var/mutable_appearance/slime_vat_soup_slime = mutable_appearance('icons/obj/xenobio.dmi', "slime_vat_soup_slime")
	slime_vat_soup_slime.color = colour
	add_overlay(slime_vat_soup_slime)

/obj/machinery/slime_dye_vat/attackby(obj/item/I, mob/user)
	if(!user.canUnEquip(I))
		return
	if(is_type_in_list(I, allowed_devices))
		if(C)
			to_chat(user, SPAN_WARNING("\ [C] is inside! Remove that first!"))
			return
		if(!powered())
			to_chat(user, SPAN_WARNING("[src] isn't powered. You can't access inside it."))
			return
		if(istype(I, /obj/item/slime_potion))
			user.unEquip(I, src)
			qdel(I)
			uses += 1
			user.visible_message(SPAN_DANGER("[user] melts down [I] in the dye vat!"))
			return
		if(istype(I, /obj/item/pen/crayon))
			var/obj/item/pen/crayon/Holder = I
			if (Holder.colourName == "orange")
				colour = "#FF9300"
			if (Holder.colourName == "mime")
				colour = "grey"
			else colour = Holder.colourName
			update_icon()
			user.unEquip(I, src)
			qdel(I)
			dirty += 1
			user.visible_message(SPAN_DANGER("[user] mixes [I] into the slime!"))
			return
		if(istype(I, /obj/item/clothing))
			C = I
			insert_item(I, user)
			update_icon()
			return

//should be used to "eject" whatever item was placed inside.
/obj/machinery/slime_dye_vat/attack_hand(mob/user as mob)
	if(issilicon(user))
		return

	add_fingerprint(user)
	if(C)
		C.update_icon()
		eject_item(C, user)
		C = null
		update_icon()

//the actual proc that colors things and makes slimes when dirty!
/obj/machinery/slime_dye_vat/proc/dyinginside(mob/user)
	running = TRUE
	flick("slime_vat_front", src)
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
		if (colour == "rainbow")
			S.set_mutation("rainbow")
		else S.set_mutation(pickweight(colors))
		uses = 0
		user.visible_message(SPAN_DANGER("Slime breaks free from the dye vat!"))
	//colors items! And updates our icons.
	if (uses >= 1 && C != null)
		C.color = colour
		uses -= 1
		C.update_icon()
	running = FALSE
	update_icon()

/obj/machinery/slime_dye_vat/examine(mob/user)
	..()
	if(uses >= 1)
		to_chat(user, SPAN_NOTICE("The dye vat has some slime prepped in it."))
	else to_chat(user, SPAN_NOTICE("Only useless fluids remain inside."))

//keep the vat clean or it releases rainbow slimes!
/obj/machinery/slime_dye_vat/verb/clean(mob/user)
	set name = "Scrub vat"
	set category = "Object"
	set src in oview(1)
	if(!isliving(usr) || running)
		return
	uses = 0
	colour = "grey"
	dirty = 0
	src.add_fingerprint(user)
	if(do_after(user, 30, src) && user.Adjacent(src))
		user.visible_message(SPAN_DANGER("[user] scrubs the dye vat clean!"))
		update_icon()

//The current way to run the machine.
/obj/machinery/slime_dye_vat/verb/start(mob/user)
	set name = "Start vat"
	set category = "Object"
	set src in oview(1)
	if(!isliving(usr) || running)
		return
	src.add_fingerprint(user)
	if(do_after(user, 30, src) && user.Adjacent(src))
		user.visible_message(SPAN_DANGER("[user] starts up the dye vat!"))
		dyinginside(user)
