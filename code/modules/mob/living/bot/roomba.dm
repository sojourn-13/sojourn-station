// Fabrication
/obj/item/weapon/roomba_frame
	desc = "It's a frame for a roomba."
	name = "roomba frame"
	icon = 'icons/obj/aibots.dmi'
	var/build_step = 0
	icon_state = "roomba_frame_0"
	force = 3.0
	throwforce = 10.0
	throw_speed = 2
	throw_range = 5
	w_class = ITEM_SIZE_NORMAL
	var/created_name = "Roomba"
	var/step_message = "It is missing a control board."

/obj/item/weapon/roomba_frame/examine(mob/user)
	..()
	to_chat(user, "[step_message]")

/obj/item/weapon/roomba_frame/attackby(obj/item/weapon/W as obj, mob/user as mob)
	..()
	if((istype(W, /obj/item/weapon/circuitboard/roomba/control)) && (build_step == 0))
		build_step++
		to_chat(user, "You add the control module to the [src].")
		step_message = "It is missing a medium power cell."
		playsound(src.loc, 'sound/effects/insert.ogg', 50, 1)
		user.remove_from_mob(W)
		qdel(W)

	else if((istype(W, /obj/item/weapon/cell/medium)) && (build_step == 1))
		build_step++
		to_chat(user, "You add a power cell to [src].")
		step_message = "It is missing wiring."
		playsound(src.loc, 'sound/effects/insert.ogg', 50, 1)
		user.remove_from_mob(W)
		qdel(W)

	else if((istype(W, /obj/item/stack/cable_coil)) && (build_step == 2))
		var/obj/item/stack/cable_coil/C = W
		if(C.get_amount() < 5)
			to_chat(user, ("There's not enough material in this stack."))
			return
		build_step++
		to_chat(user, "You connect the battery and the board.")
		step_message = "The panel is open."
		playsound(src.loc, 'sound/effects/insert.ogg', 50, 1)
		C.use(5)

	else if((QUALITY_SCREW_DRIVING) && (build_step == 3))
		var/obj/item/weapon/tool/T = W
		if(T.use_tool(user, src, WORKTIME_NORMAL, QUALITY_SCREW_DRIVING, FAILCHANCE_VERY_EASY, required_stat = STAT_MEC))
			build_step++
			to_chat(user, "You close the panel.")
			step_message = "The panel is closed, all it need is a swipe of your ID."
			playsound(src.loc, 'sound/effects/insert.ogg', 50, 1)

	else if((istype(W, /obj/item/weapon/card/id)) && (build_step == 4))
		var/obj/item/weapon/card/id/C = W
		if(!access_robotics in C.access)
			to_chat(user, "You do not have the autorization to start the roomba.")
			return
		build_step++
		to_chat(user, "You activate the Roomba! Beep boop.")
		playsound(src.loc, 'sound/effects/insert.ogg', 50, 1)
		var/mob/living/simple_animal/hostile/roomba/custom/R = new /mob/living/simple_animal/hostile/roomba/custom(get_turf(src))
		R.name = created_name
		qdel(src)

	else if(istype(W, /obj/item/weapon/pen))
		var/t = input(user, "Enter new robot name", name, created_name) as text
		t = sanitize(t, MAX_NAME_LEN)
		if(!t)
			return
		if(!in_range(src, usr) && loc != usr)
			return
		created_name = t

	icon_state = "roomba_frame_[build_step]"

