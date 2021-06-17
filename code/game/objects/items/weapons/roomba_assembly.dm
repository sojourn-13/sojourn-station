// Fabrication
/obj/item/weapon/roomba_part/roomba_frame
	desc = "It's a frame for a roomba."
	name = "roomba frame"
	icon_state = "roomba_frame_0"
	force = 3.0
	throwforce = 10.0
	throw_speed = 2
	throw_range = 5
	w_class = ITEM_SIZE_NORMAL
	var/build_step = 0 // Used to know at which part of the assembly process we are.
	var/created_name = "Roomba" // The name the roomba will start with.
	var/step_message = "It is missing a control board." // What does the assembly need next.
	var/obj/item/weapon/cell/medium/power_cell // The power cell the roomba has

/obj/item/weapon/roomba_part/roomba_frame/examine(mob/user)
	..() // Default stuff
	to_chat(user, "[step_message]") // Let the user know what he need to do next.

// Assembly of the roomba. Basically a massive switch. Mostly code stolen from the farmbot.
/obj/item/weapon/roomba_part/roomba_frame/attackby(obj/item/weapon/W as obj, mob/user as mob)
	..() // Default stuff.

	// Step 1, it need a circuit board.
	if((istype(W, /obj/item/weapon/roomba_part/control)) && (build_step == 0))
		build_step++ // Go to the next assembly part.
		to_chat(user, "You add the [W.name] to the [src].")
		step_message = "It is missing a medium power cell." // Next step
		playsound(src.loc, 'sound/effects/insert.ogg', 50, 1)

		// Remove the board
		user.remove_from_mob(W)
		qdel(W)

	// Step 2, Install the power cell
	else if((istype(W, /obj/item/weapon/cell/medium)) && (build_step == 1))
		build_step++ // Go to the next assembly part.
		to_chat(user, "You add the [W.name] to [src].")
		step_message = "It is missing treads." // Next step
		playsound(src.loc, 'sound/effects/insert.ogg', 50, 1)
		power_cell = W //Store the power cell for later usage.

		// Remove the cell
		user.remove_from_mob(W)
		W.forceMove(src)

	// Step 3, it need wheels.
	if((istype(W, /obj/item/weapon/roomba_part/treads)) && (build_step == 2))
		build_step++ // Go to the next assembly part.
		to_chat(user, "You add the [W.name] to the [src].")
		step_message = "It is missing wiring." // Next step
		playsound(src.loc, 'sound/effects/insert.ogg', 50, 1)

		// Remove the wheel
		user.remove_from_mob(W)
		qdel(W)

	// Step 4, Wire the roomba
	else if((istype(W, /obj/item/stack/cable_coil)) && (build_step == 3))
		var/obj/item/stack/cable_coil/C = W // New var to use cable-only procs.
		if(C.get_amount() < 5) // Is there enough cables?
			to_chat(user, ("There's not enough material in this stack."))
			return
		build_step++ // Go to the next assembly part.
		to_chat(user, "You wire up the roomba.")
		step_message = "The circuit board is unprogrammed." // Next step
		playsound(src.loc, 'sound/effects/insert.ogg', 50, 1)
		C.use(5) // use five cables.

	// Step 5, Close the panel.
	else if((QUALITY_PULSING) && (build_step == 4))
		var/obj/item/weapon/tool/T = W // New var to use tool-only procs.
		if(T.use_tool(user, src, WORKTIME_LONG, QUALITY_PULSING, FAILCHANCE_NORMAL, required_stat = STAT_MEC)) // Skill check.
			build_step++ // Go to the next assembly part.
			to_chat(user, "You program the roomba.")
			step_message = "The panel is open." // Next step
			playsound(src.loc, 'sound/effects/insert.ogg', 50, 1)

	// Step 6, Close the panel.
	else if((QUALITY_SCREW_DRIVING) && (build_step == 5))
		var/obj/item/weapon/tool/T = W // New var to use tool-only procs.
		if(T.use_tool(user, src, WORKTIME_NORMAL, QUALITY_SCREW_DRIVING, FAILCHANCE_VERY_EASY, required_stat = STAT_MEC)) // Skill check.
			build_step++ // Go to the next assembly part.
			to_chat(user, "You close the panel.")
			step_message = "The panel is closed, all it need is a swipe of your ID." // Next step
			playsound(src.loc, 'sound/effects/insert.ogg', 50, 1)

	// Step 7, Swipe the ID to activate it.
	else if((istype(W, /obj/item/weapon/card/id)) && (build_step == 6))
		var/obj/item/weapon/card/id/C = W // New var to use ID-only vars.
		if(!access_robotics in C.access) // Are you authorized to start the roomba ?
			to_chat(user, "You do not have the autorization to start the roomba.")
			return
		build_step++
		to_chat(user, "You activate the Roomba! Beep boop.")
		playsound(src.loc, 'sound/effects/insert.ogg', 50, 1)
		var/mob/living/simple_animal/hostile/roomba/custom/R = new /mob/living/simple_animal/hostile/roomba/custom(get_turf(src)) // Spawn the roomba.
		R.cell = power_cell // Give the roomba the cell used.
		power_cell.forceMove(R) // Give the cell
		R.name = created_name // Pass it the custom name
		qdel(src)

	// Name the roomba.
	else if(istype(W, /obj/item/weapon/pen))
		var/t = input(user, "Enter new robot name", name, created_name) as text
		t = sanitize(t, MAX_NAME_LEN)
		if(!t)
			return
		if(!in_range(src, usr) && loc != usr)
			return
		created_name = t

	// Change the icon_state based on which build step it is.
	icon_state = "roomba_frame_[build_step]"
