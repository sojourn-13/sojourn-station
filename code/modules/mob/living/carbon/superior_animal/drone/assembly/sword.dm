// SI Sword Drone Assembly Steps
/obj/item/weapon/bot_part/sword_part/main_frame/attackby(obj/item/weapon/W as obj, mob/user as mob)
	..() // Default stuff.

	// Name the drone
	if(istype(W, /obj/item/weapon/pen))
		var/t = input(user, "Enter new robot name", name, created_name) as text
		t = sanitize(t, MAX_NAME_LEN)
		if(!t)
			return
		if(!in_range(src, usr) && loc != usr)
			return
		created_name = t
		user.visible_message(
								SPAN_NOTICE("[user] write [t] on the drone's nametag."),
								SPAN_NOTICE("You write [t] on the drone's nametag.")
							)

	// Step 1, Adding the left arm
	else if((istype(W, /obj/item/weapon/bot_part/left_arm_frame)) && (build_step == 0))
		build_step++ // Go to the next assembly part.
		user.visible_message(
								SPAN_NOTICE("[user] add the [W.name] to the [src]."),
								SPAN_NOTICE("You add the [W.name] to the [src].")
							)
		step_message = "It is missing a right arm frame." // Next step
		playsound(src.loc, 'sound/effects/insert.ogg', 50, 1)

		// Remove the arm
		user.remove_from_mob(W)
		qdel(W)

	// Step 2, Adding the right arm
	else if((istype(W, /obj/item/weapon/bot_part/right_arm_frame)) && (build_step == 1))
		build_step++ // Go to the next assembly part.
		user.visible_message(
								SPAN_NOTICE("[user] add the [W.name] to the [src]."),
								SPAN_NOTICE("You add the [W.name] to the [src].")
							)
		step_message = "It is missing a left leg frame." // Next step
		playsound(src.loc, 'sound/effects/insert.ogg', 50, 1)

		// Remove the arm
		user.remove_from_mob(W)
		qdel(W)

	// Step 3, Adding the left leg
	else if((istype(W, /obj/item/weapon/bot_part/left_leg_frame)) && (build_step == 2))
		build_step++ // Go to the next assembly part.
		user.visible_message(
								SPAN_NOTICE("[user] add the [W.name] to the [src]."),
								SPAN_NOTICE("You add the [W.name] to the [src].")
							)
		step_message = "It is missing a right leg frame." // Next step
		playsound(src.loc, 'sound/effects/insert.ogg', 50, 1)

		// Remove the leg
		user.remove_from_mob(W)
		qdel(W)

	// Step 4, Adding the right leg
	else if((istype(W, /obj/item/weapon/bot_part/right_leg_frame)) && (build_step == 3))
		build_step++ // Go to the next assembly part.
		user.visible_message(
								SPAN_NOTICE("[user] add the [W.name] to the [src]."),
								SPAN_NOTICE("You add the [W.name] to the [src].")
							)
		step_message = "It is missing an head frame." // Next step
		playsound(src.loc, 'sound/effects/insert.ogg', 50, 1)

		// Remove the leg
		user.remove_from_mob(W)
		qdel(W)

	// Step 5, Adding the head
	else if((istype(W, /obj/item/weapon/bot_part/head_frame)) && (build_step == 4))
		build_step++ // Go to the next assembly part.
		user.visible_message(
								SPAN_NOTICE("[user] add the [W.name] to the [src]."),
								SPAN_NOTICE("You add the [W.name] to the [src].")
							)
		step_message = "The frames are not secured." // Next step
		playsound(src.loc, 'sound/effects/insert.ogg', 50, 1)

		// Remove the head
		user.remove_from_mob(W)
		qdel(W)

	// Step 6, Wrenching the bolts.
	else if((QUALITY_BOLT_TURNING) && (build_step == 5))
		var/obj/item/weapon/tool/T = W // New var to use tool-only procs.
		if(T.use_tool(user, src, WORKTIME_NORMAL, QUALITY_BOLT_TURNING, FAILCHANCE_NORMAL, required_stat = STAT_MEC)) // Skill check.
			build_step++ // Go to the next assembly part.
			user.visible_message(
								SPAN_NOTICE("[user] wrench the frames together."),
								SPAN_NOTICE("You wrench the frames together.")
							)
			step_message = "The screws are lose." // Next step

	// Step 7, Securing the screws
	else if((QUALITY_SCREW_DRIVING) && (build_step == 6))
		var/obj/item/weapon/tool/T = W // New var to use tool-only procs.
		if(T.use_tool(user, src, WORKTIME_NORMAL, QUALITY_SCREW_DRIVING, FAILCHANCE_NORMAL, required_stat = STAT_MEC)) // Skill check.
			build_step++ // Go to the next assembly part.
			user.visible_message(
								SPAN_NOTICE("[user] tighten the screws."),
								SPAN_NOTICE("You tighten the screws.")
							)
			step_message = "It is missing the hydraulics." // Next step

	// Step 8, Adding the hydraulics
	else if((istype(W, /obj/item/weapon/tool_upgrade/augment/hydraulic)) && (build_step == 7))
		build_step++ // Go to the next assembly part.
		user.visible_message(
								SPAN_NOTICE("[user] add the [W.name] to the [src]."),
								SPAN_NOTICE("You add the [W.name] to the [src].")
							)
		step_message = "The hydraulics aren't secured." // Next step
		playsound(src.loc, 'sound/effects/insert.ogg', 50, 1)

		// Remove the hydraulics
		user.remove_from_mob(W)
		qdel(W)

	// Step 9, Secure the hydraulics.
	else if((QUALITY_BOLT_TURNING) && (build_step == 8))
		var/obj/item/weapon/tool/T = W // New var to use tool-only procs.
		if(T.use_tool(user, src, WORKTIME_NORMAL, QUALITY_BOLT_TURNING, FAILCHANCE_NORMAL, required_stat = STAT_MEC)) // Skill check.
			build_step++ // Go to the next assembly part.
			user.visible_message(
								SPAN_NOTICE("[user] secure the hydraulic system."),
								SPAN_NOTICE("You secure the hydraulic system.")
							)
			step_message = "It is missing an energy armblade module." // Next step

	// Step 10, Add the armblade
	else if((istype(W, /obj/item/organ_module/active/simple/armblade/energy_blade)) && (build_step == 9))
		build_step++ // Go to the next assembly part.
		user.visible_message(
								SPAN_NOTICE("[user] add the [W.name] to the [src]."),
								SPAN_NOTICE("You add the [W.name] to the [src].")
							)
		step_message = "It is missing a large power cell." // Next step
		playsound(src.loc, 'sound/effects/insert.ogg', 50, 1)

		// Remove the armblade
		user.remove_from_mob(W)
		qdel(W)

	// Step 11, Install the power cell
	else if((istype(W, /obj/item/weapon/cell/large)) && (build_step == 10))
		build_step++ // Go to the next assembly part.
		user.visible_message(
								SPAN_NOTICE("[user] add the [W.name] to [src]."),
								SPAN_NOTICE("You add the [W.name] to [src].")
							)
		step_message = "The power cell is unsecured." // Next step
		playsound(src.loc, 'sound/effects/insert.ogg', 50, 1)
		power_cell = W //Store the power cell for later usage.

		// Remove the cell
		user.remove_from_mob(W)
		W.forceMove(src)

	// Step 12, Secure the cell
	else if((QUALITY_SCREW_DRIVING) && (build_step == 11))
		var/obj/item/weapon/tool/T = W // New var to use tool-only procs.
		if(T.use_tool(user, src, WORKTIME_NEAR_INSTANT, QUALITY_SCREW_DRIVING, FAILCHANCE_VERY_EASY, required_stat = STAT_MEC)) // Skill check.
			build_step++ // Go to the next assembly part.
			user.visible_message(
								SPAN_NOTICE("[user] secure the power cell."),
								SPAN_NOTICE("You secure the power cell.")
							)
			step_message = "It is missing the circuit board." // Next step

	// Step 13, Add the circuit board
	else if((istype(W, /obj/item/weapon/bot_part/control)) && (build_step == 12))
		build_step++ // Go to the next assembly part.
		user.visible_message(
								SPAN_NOTICE("[user] add the [W.name] to the [src]."),
								SPAN_NOTICE("You add the [W.name] to the [src].")
							)
		step_message = "The board is unsecured." // Next step
		playsound(src.loc, 'sound/effects/insert.ogg', 50, 1)

		// Remove the board
		user.remove_from_mob(W)
		qdel(W)

	// Step 14, Secure the board
	else if((QUALITY_SCREW_DRIVING) && (build_step == 13))
		var/obj/item/weapon/tool/T = W // New var to use tool-only procs.
		if(T.use_tool(user, src, WORKTIME_NEAR_INSTANT, QUALITY_SCREW_DRIVING, FAILCHANCE_VERY_EASY, required_stat = STAT_MEC)) // Skill check.
			build_step++ // Go to the next assembly part.
			user.visible_message(
								SPAN_NOTICE("[user] secured the board."),
								SPAN_NOTICE("You secured the board.")
							)
			step_message = "The wiring is missing." // Next step

	// Step 15, Wire the drone
	else if((istype(W, /obj/item/stack/cable_coil)) && (build_step == 14))
		var/obj/item/stack/cable_coil/C = W // New var to use cable-only procs.
		if(C.get_amount() < 10) // Is there enough cables?
			to_chat(user, ("There's not enough material in this stack."))
			return
		user.visible_message(
								SPAN_NOTICE("[user] start to wire the [src]."),
								SPAN_NOTICE("You start to wire the [src].")
							)
		if(!do_after(user, WORKTIME_DELAYED, src))
			return
		build_step++ // Go to the next assembly part.
		user.visible_message(
								SPAN_NOTICE("[user] wire the drone."),
								SPAN_NOTICE("You wire the drone.")
							)
		step_message = "The circuit board is unprogrammed." // Next step
		playsound(src.loc, 'sound/effects/insert.ogg', 50, 1)
		C.use(10) // use five cables.

	// Step 16, Program the drone.
	else if((QUALITY_PULSING) && (build_step == 15))
		var/obj/item/weapon/tool/T = W // New var to use tool-only procs.
		if(T.use_tool(user, src, WORKTIME_DELAYED, QUALITY_PULSING, FAILCHANCE_NORMAL, required_stat = STAT_MEC)) // Skill check.
			build_step++ // Go to the next assembly part.
			user.visible_message(
								SPAN_NOTICE("[user] program the drone."),
								SPAN_NOTICE("You program the drone.")
							)
			step_message = "The panel is open." // Next step

	// Step 17, Close the panel.
	else if((QUALITY_SCREW_DRIVING) && (build_step == 16))
		var/obj/item/weapon/tool/T = W // New var to use tool-only procs.
		if(T.use_tool(user, src, WORKTIME_NEAR_INSTANT, QUALITY_SCREW_DRIVING, FAILCHANCE_VERY_EASY, required_stat = STAT_MEC)) // Skill check.
			build_step++ // Go to the next assembly part.
			user.visible_message(
								SPAN_NOTICE("[user] close the panel."),
								SPAN_NOTICE("You close the panel.")
							)
			step_message = "The panel is closed, it need armor now though." // Next step

	// Step 18, Add the armor
	if((istype(W, /obj/item/clothing/suit/armor/vest/soteriasuit)) && (build_step == 17))
		build_step++ // Go to the next assembly part.
		user.visible_message(
								SPAN_NOTICE("[user] add the [W.name] to the [src]."),
								SPAN_NOTICE("You add the [W.name] to the [src].")
							)
		step_message = "The armor need to be welded in place." // Next step
		playsound(src.loc, 'sound/effects/insert.ogg', 50, 1)

		// Remove the armor
		user.remove_from_mob(W)
		qdel(W)

	// Step 19, Weld the armor.
	else if((QUALITY_WELDING) && (build_step == 18))
		var/obj/item/weapon/tool/T = W // New var to use tool-only procs.
		if(T.use_tool(user, src, WORKTIME_NEAR_INSTANT, QUALITY_WELDING, FAILCHANCE_VERY_EASY, required_stat = STAT_MEC)) // Skill check.
			build_step++ // Go to the next assembly part.
			user.visible_message(
								SPAN_NOTICE("[user] weld the armor in place."),
								SPAN_NOTICE("You weld the armor in place.")
							)
			step_message = "It need to be painted in red." // Next step

	// Step 20, Add the paint.
	else if((istype(W, /obj/item/weapon/tool_upgrade/productivity/red_paint)) && (build_step == 19))
		user.visible_message(
								SPAN_NOTICE("[user] start to paint the [src] red."),
								SPAN_NOTICE("You start to paint the [src] red.")
							)
		if(!do_after(user, WORKTIME_DELAYED, src))
			return
		build_step++ // Go to the next assembly part.
		user.visible_message(
								SPAN_NOTICE("[user] paint the [src] red."),
								SPAN_NOTICE("You paint the [src] red.")
							)
		step_message = "All it need is a swipe of your ID." // Next step
		playsound(src.loc, 'sound/effects/insert.ogg', 50, 1)

		// Remove the paint
		user.remove_from_mob(W)
		qdel(W)

	// Step 21, Swipe the ID to activate it.
	else if((istype(W, /obj/item/weapon/card/id)) && (build_step == 20))
		var/obj/item/weapon/card/id/C = W // New var to use ID-only vars.
		if(!access_robotics in C.access) // Are you authorized to start the roomba ?
			to_chat(user, "You do not have the autorization to start the drone.")
			return
		build_step++
		user.visible_message(
								SPAN_NOTICE("[user] activate [created_name]! Beep boop."),
								SPAN_NOTICE("You activate [created_name]! Beep boop.")
							)
		var/mob/living/carbon/superior_animal/handmade/sword/R = new /mob/living/carbon/superior_animal/handmade/sword(get_turf(src)) // Spawn the sword drone
		R.cell = power_cell // Give the roomba the cell used.
		power_cell.forceMove(R) // Give the cell
		R.name = created_name // Pass it the custom name
		R.friends += user // Make the creator a friend.
		R.creator += user
		qdel(src)

	// Change the icon_state based on which build step it is.
	icon_state = "sword_frame_[build_step]"
