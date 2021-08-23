// Custom Roomba. Actual item located in custom_bot_part.dm
/obj/item/bot_part/roomba/roomba_frame/attackby(obj/item/W as obj, mob/user as mob)
	..() // Default stuff.

	// Name the roomba.
	if(istype(W, /obj/item/pen))
		var/t = input(user, "Enter new robot name", name, created_name) as text
		t = sanitize(t, MAX_NAME_LEN)
		if(!t)
			return
		if(!in_range(src, usr) && loc != usr)
			return
		created_name = t
		user.visible_message(
								SPAN_NOTICE("[user] write [t] on the roomba's nametag."),
								SPAN_NOTICE("You write [t] on the roomba's nametag.")
							)

	// Step 1, it need a circuit board.
	else if((istype(W, /obj/item/bot_part/control)) && (build_step == 0))
		build_step++ // Go to the next assembly part.
		user.visible_message(
								SPAN_NOTICE("[user] add the [W.name] to the [src]."),
								SPAN_NOTICE("You add the [W.name] to the [src].")
							)
		step_message = "It is missing a medium power cell." // Next step
		playsound(src.loc, 'sound/effects/insert.ogg', 50, 1)

		// Remove the board
		user.remove_from_mob(W)
		qdel(W)

	// Step 2, Install the power cell
	else if((istype(W, /obj/item/cell/medium)) && (build_step == 1))
		build_step++ // Go to the next assembly part.
		user.visible_message(
								SPAN_NOTICE("[user] add the [W.name] to [src]."),
								SPAN_NOTICE("You add the [W.name] to [src].")
							)
		step_message = "It is missing treads." // Next step
		playsound(src.loc, 'sound/effects/insert.ogg', 50, 1)
		power_cell = W //Store the power cell for later usage.

		// Remove the cell
		insert_item(W, user)

	// Step 3, it need wheels.
	else if((istype(W, /obj/item/bot_part/roomba/roomba_treads)) && (build_step == 2))
		build_step++ // Go to the next assembly part.
		user.visible_message(
								SPAN_NOTICE("[user] add the [W.name] to the [src]."),
								SPAN_NOTICE("You add the [W.name] to the [src].")
		)
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
		user.visible_message(
								SPAN_NOTICE("[user] start to wire the [src]."),
								SPAN_NOTICE("You start to wire the [src].")
							)
		if(!do_after(user, WORKTIME_FAST, src))
			return
		build_step++ // Go to the next assembly part.
		user.visible_message(
								SPAN_NOTICE("[user] wire the roomba."),
								SPAN_NOTICE("You wire the roomba.")
		)
		step_message = "The circuit board is unprogrammed." // Next step
		playsound(src.loc, 'sound/effects/insert.ogg', 50, 1)
		C.use(5) // use five cables.

	// Step 5, Program the roomba.
	else if((QUALITY_PULSING) && (build_step == 4))
		var/obj/item/tool/T = W // New var to use tool-only procs.
		user.visible_message(
								SPAN_NOTICE("[user] start to program the [src]."),
								SPAN_NOTICE("You start to program the [src].")
							)
		if(T.use_tool(user, src, WORKTIME_NORMAL, QUALITY_PULSING, FAILCHANCE_NORMAL, required_stat = STAT_MEC)) // Skill check.
			build_step++ // Go to the next assembly part.
			user.visible_message(
								SPAN_NOTICE("[user] program the roomba."),
								SPAN_NOTICE("You program the roomba.")
		)
			step_message = "The panel is open." // Next step
			playsound(src.loc, 'sound/effects/insert.ogg', 50, 1)

	// Step 6, Close the panel.
	else if((QUALITY_SCREW_DRIVING) && (build_step == 5))
		var/obj/item/tool/T = W // New var to use tool-only procs.
		if(T.use_tool(user, src, WORKTIME_NEAR_INSTANT, QUALITY_SCREW_DRIVING, FAILCHANCE_VERY_EASY, required_stat = STAT_MEC)) // Skill check.
			build_step++ // Go to the next assembly part.
			user.visible_message(
								SPAN_NOTICE("[user] close the panel."),
								SPAN_NOTICE("You close the panel.")
							)
			step_message = "The panel is closed, all it need is a swipe of your ID." // Next step
			playsound(src.loc, 'sound/effects/insert.ogg', 50, 1)

	// Step 7, Swipe the ID to activate it.
	else if((istype(W, /obj/item/card/id)) && (build_step == 6))
		var/obj/item/card/id/C = W // New var to use ID-only vars.
		if(!access_robotics in C.access) // Are you authorized to start the roomba ?
			to_chat(user, "You do not have the autorization to start the roomba.")
			return
		build_step++
		user.visible_message(
								SPAN_NOTICE("[user] activate the Roomba! Beep boop."),
								SPAN_NOTICE("You activate the Roomba! Beep boop.")
							)
		playsound(src.loc, 'sound/effects/insert.ogg', 50, 1)
		var/mob/living/carbon/superior_animal/handmade/roomba/R = new /mob/living/carbon/superior_animal/handmade/roomba(get_turf(src)) // Spawn the roomba.
		R.cell = power_cell // Give the roomba the cell used.
		power_cell.forceMove(R) // Give the cell
		R.name = created_name // Pass it the custom name
		R.friends += user // Make the creator a friend.
		R.creator += user
		qdel(src)

	// Change the icon_state based on which build step it is.
	icon_state = "roomba_frame_[build_step]"
