// SI Sword Drone Assembly Steps
/obj/item/bot_part/sword_part/main_frame/attackby(obj/item/W as obj, mob/user as mob)
	..() // Default stuff.

	// Name the drone
	if(istype(W, /obj/item/pen))
		var/t = input(user, "Enter new robot name", name, created_name) as text
		t = sanitize(t, MAX_NAME_LEN)
		if(!t)
			return
		if(!in_range(src, usr) && loc != usr)
			return
		created_name = t
		user.visible_message(
			SPAN_NOTICE("[user] writes [t] on the drone's nametag."),
			SPAN_NOTICE("You write [t] on the drone's nametag.")
		)

	// Step 1, Adding the left arm
	else if((istype(W, /obj/item/bot_part/left_arm_frame)) && (build_step == 0))
		build_step++ // Go to the next assembly part.
		user.visible_message(
			SPAN_NOTICE("[user] adds the [W.name] to the [src]."),
			SPAN_NOTICE("You add the [W.name] to the [src].")
		)
		step_message = "It is missing a right arm frame." // Next step
		playsound(src.loc, 'sound/effects/insert.ogg', 50, 1)

		// Remove the arm
		user.remove_from_mob(W)
		qdel(W)

	// Step 2, Adding the right arm
	else if((istype(W, /obj/item/bot_part/right_arm_frame)) && (build_step == 1))
		build_step++ // Go to the next assembly part.
		user.visible_message(
			SPAN_NOTICE("[user] adds the [W.name] to the [src]."),
			SPAN_NOTICE("You add the [W.name] to the [src].")
		)
		step_message = "It is missing a left leg frame." // Next step
		playsound(src.loc, 'sound/effects/insert.ogg', 50, 1)

		// Remove the arm
		user.remove_from_mob(W)
		qdel(W)

	// Step 3, Adding the left leg
	else if((istype(W, /obj/item/bot_part/left_leg_frame)) && (build_step == 2))
		build_step++ // Go to the next assembly part.
		user.visible_message(
			SPAN_NOTICE("[user] adds the [W.name] to the [src]."),
			SPAN_NOTICE("You add the [W.name] to the [src].")
		)
		step_message = "It is missing a right leg frame." // Next step
		playsound(src.loc, 'sound/effects/insert.ogg', 50, 1)

		// Remove the leg
		user.remove_from_mob(W)
		qdel(W)

	// Step 4, Adding the right leg
	else if((istype(W, /obj/item/bot_part/right_leg_frame)) && (build_step == 3))
		build_step++ // Go to the next assembly part.
		user.visible_message(
			SPAN_NOTICE("[user] adds the [W.name] to the [src]."),
			SPAN_NOTICE("You add the [W.name] to the [src].")
		)
		step_message = "It is missing a head frame." // Next step
		playsound(src.loc, 'sound/effects/insert.ogg', 50, 1)

		// Remove the leg
		user.remove_from_mob(W)
		qdel(W)

	// Step 5, Adding the head
	else if((istype(W, /obj/item/bot_part/head_frame)) && (build_step == 4))
		build_step++ // Go to the next assembly part.
		user.visible_message(
			SPAN_NOTICE("[user] adds the [W.name] to the [src]."),
			SPAN_NOTICE("You add the [W.name] to the [src].")
		)
		step_message = "The frames are not secured and must be bolted down." // Next step
		playsound(src.loc, 'sound/effects/insert.ogg', 50, 1)

		// Remove the head
		user.remove_from_mob(W)
		qdel(W)

	// Step 6, Wrenching the bolts.
	else if((QUALITY_BOLT_TURNING) && (build_step == 5))
		var/obj/item/tool/T = W // New var to use tool-only procs.
		if(T.use_tool(user, src, WORKTIME_NORMAL, QUALITY_BOLT_TURNING, FAILCHANCE_NORMAL, required_stat = STAT_MEC)) // Skill check.
			build_step++ // Go to the next assembly part.
			user.visible_message(
				SPAN_NOTICE("[user] wrenches the frames together."),
				SPAN_NOTICE("You wrench the frames together.")
			)
			step_message = "The screws on the frame are loose." // Next step

	// Step 7, Securing the screws
	else if((QUALITY_SCREW_DRIVING) && (build_step == 6))
		var/obj/item/tool/T = W // New var to use tool-only procs.
		if(T.use_tool(user, src, WORKTIME_NORMAL, QUALITY_SCREW_DRIVING, FAILCHANCE_NORMAL, required_stat = STAT_MEC)) // Skill check.
			build_step++ // Go to the next assembly part.
			user.visible_message(
				SPAN_NOTICE("[user] tightens the screws on the [src]."),
				SPAN_NOTICE("You tighten the screws on the [src].")
			)
			step_message = "The hydraulics system is missing." // Next step

	// Step 8, Adding the hydraulics
	else if((istype(W, /obj/item/tool_upgrade/augment/hydraulic)) && (build_step == 7))
		build_step++ // Go to the next assembly part.
		user.visible_message(
			SPAN_NOTICE("[user] add the [W.name] to the [src]."),
			SPAN_NOTICE("You add the [W.name] to the [src].")
		)
		step_message = "The hydraulics aren't secured and must be bolted down." // Next step
		playsound(src.loc, 'sound/effects/insert.ogg', 50, 1)

		// Remove the hydraulics
		user.remove_from_mob(W)
		qdel(W)

	// Step 9, Secure the hydraulics.
	else if((QUALITY_BOLT_TURNING) && (build_step == 8))
		var/obj/item/tool/T = W // New var to use tool-only procs.
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
	else if((istype(W, /obj/item/cell/large)) && (build_step == 10))
		build_step++ // Go to the next assembly part.
		user.visible_message(
			SPAN_NOTICE("[user] adds the [W.name] to the [src].")
		)
		step_message = "The power cell is not secured and must be screwed into place." // Next step
		playsound(src.loc, 'sound/effects/insert.ogg', 50, 1)
		power_cell = W //Store the power cell for later usage.

		// Remove the cell
		insert_item(W, user)

	// Step 12, Secure the cell
	else if((QUALITY_SCREW_DRIVING) && (build_step == 11))
		var/obj/item/tool/T = W // New var to use tool-only procs.
		if(T.use_tool(user, src, WORKTIME_NEAR_INSTANT, QUALITY_SCREW_DRIVING, FAILCHANCE_VERY_EASY, required_stat = STAT_MEC)) // Skill check.
			build_step++ // Go to the next assembly part.
			user.visible_message(
				SPAN_NOTICE("[user] secures the power cell in the [src]."),
				SPAN_NOTICE("You secure the power cell in the [src].")
			)
			step_message = "The custom control module is missing and must be installed." // Next step

	// Step 13, Add the circuit board
	else if((istype(W, /obj/item/bot_part/control)) && (build_step == 12))
		build_step++ // Go to the next assembly part.
		user.visible_message(
			SPAN_NOTICE("[user] adds the [W.name] to the [src]."),
			SPAN_NOTICE("You add the [W.name] to the [src].")
		)
		step_message = "The custom control module is not secured and must be screwed into place." // Next step
		playsound(src.loc, 'sound/effects/insert.ogg', 50, 1)

		// Remove the board
		user.remove_from_mob(W)
		qdel(W)

	// Step 14, Secure the board
	else if((QUALITY_SCREW_DRIVING) && (build_step == 13))
		var/obj/item/tool/T = W // New var to use tool-only procs.
		if(T.use_tool(user, src, WORKTIME_NEAR_INSTANT, QUALITY_SCREW_DRIVING, FAILCHANCE_VERY_EASY, required_stat = STAT_MEC)) // Skill check.
			build_step++ // Go to the next assembly part.
			user.visible_message(
				SPAN_NOTICE("[user] secures the custom control module inside the [src]."),
				SPAN_NOTICE("You secure the custom control module inside the [src].")
			)
			step_message = "The wiring is missing and must be installed." // Next step

	// Step 15, Wire the drone
	else if((istype(W, /obj/item/stack/cable_coil)) && (build_step == 14))
		var/obj/item/stack/cable_coil/C = W // New var to use cable-only procs.
		if(C.get_amount() < 10) // Is there enough cables?
			to_chat(user, ("There's not enough material in this stack."))
			return
		user.visible_message(
			SPAN_NOTICE("[user] starts to wire the [src]."),
			SPAN_NOTICE("You start to wire the [src].")
		)
		if(!do_after(user, WORKTIME_DELAYED, src))
			return
		build_step++ // Go to the next assembly part.
		user.visible_message(
			SPAN_NOTICE("[user] wires the [src]."),
			SPAN_NOTICE("You wire the [src].")
		)
		step_message = "The circuitry must be programmed with a multitool or another pulsing instrument." // Next step
		playsound(src.loc, 'sound/effects/insert.ogg', 50, 1)
		C.use(10) // use five cables.

	// Step 16, Program the drone.
	else if((QUALITY_PULSING) && (build_step == 15))
		var/obj/item/tool/T = W // New var to use tool-only procs.
		if(T.use_tool(user, src, WORKTIME_DELAYED, QUALITY_PULSING, FAILCHANCE_NORMAL, required_stat = STAT_MEC)) // Skill check.
			build_step++ // Go to the next assembly part.
			user.visible_message(
				SPAN_NOTICE("[user] programs the drone."),
				SPAN_NOTICE("You program the drone.")
			)
			step_message = "The maintenance panel is open and must be screwed shut." // Next step

	// Step 17, Close the panel.
	else if((QUALITY_SCREW_DRIVING) && (build_step == 16))
		var/obj/item/tool/T = W // New var to use tool-only procs.
		if(T.use_tool(user, src, WORKTIME_NEAR_INSTANT, QUALITY_SCREW_DRIVING, FAILCHANCE_VERY_EASY, required_stat = STAT_MEC)) // Skill check.
			build_step++ // Go to the next assembly part.
			user.visible_message(
				SPAN_NOTICE("[user] screws the maintenance panel on the [src] shut."),
				SPAN_NOTICE("You screw the maintenance panel on the [src] shut.")
			)
			step_message = "The maintenance panel is closed. The drone needs to be outfitted with a Mark II environmental protection suit." // Next step

	// Step 18, Add the armor
	if((istype(W, /obj/item/clothing/suit/armor/vest/soteriasuit)) && (build_step == 17))
		build_step++ // Go to the next assembly part.
		user.visible_message(
			SPAN_NOTICE("[user] outfits the [src] with the [W.name]."),
			SPAN_NOTICE("You outfit the [src] with the [W.name].")
		)
		step_message = "The armor must be welded onto the frame." // Next step
		playsound(src.loc, 'sound/effects/insert.ogg', 50, 1)

		// Remove the armor
		user.remove_from_mob(W)
		qdel(W)

	// Step 19, Weld the armor.
	else if((QUALITY_WELDING) && (build_step == 18))
		var/obj/item/tool/T = W // New var to use tool-only procs.
		if(T.use_tool(user, src, WORKTIME_NEAR_INSTANT, QUALITY_WELDING, FAILCHANCE_VERY_EASY, required_stat = STAT_MEC)) // Skill check.
			build_step++ // Go to the next assembly part.
			user.visible_message(
				SPAN_NOTICE("[user] welds the armor onto the [src]."),
				SPAN_NOTICE("You weld the armor onto the [src].")
			)
			step_message = "Company guidelines require you to paint the chassis red." // Next step

	// Step 20, Add the paint.
	else if((istype(W, /obj/item/tool_upgrade/productivity/red_paint)) && (build_step == 19))
		user.visible_message(
			SPAN_NOTICE("[user] starts to paint the [src] red."),
			SPAN_NOTICE("You start to paint the [src] red.")
		)
		if(!do_after(user, WORKTIME_DELAYED, src))
			return
		build_step++ // Go to the next assembly part.
		user.visible_message(
			SPAN_NOTICE("[user] paints the [src] red."),
			SPAN_NOTICE("You paint the [src] red.")
		)
		step_message = "Almost done. The drone needs the swipe of an ID with robotics access. Hopefully, yours." // Next step

		// Remove the paint
		user.remove_from_mob(W)
		qdel(W)

	// Step 21, Swipe the ID to activate it.
	else if((istype(W, /obj/item/card/id)) && (build_step == 20))
		var/obj/item/card/id/C = W // New var to use ID-only vars.
		if(!(access_robotics in C.access)) // Are you authorized to start the roomba ?
			to_chat(user, "You do not have the authorization to start the drone.")
			return
		build_step++
		user.visible_message(
								SPAN_NOTICE("[user] activates [created_name]! Beep boop."),
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
