////////////////////////////////
///// Construction datums //////
////////////////////////////////

/datum/construction/mecha/custom_action(step, atom/used_atom, mob/user)
	user.visible_message(
		"[user] connects the [used_atom] to the [holder].", //What onlookers see
		"You connect the [used_atom] to the [holder]" //What we see in are own chat
	)
	holder.add_overlay(used_atom.icon_state+"+o") //Magic letter o in sprites to make them all different. Used for icons.
	qdel(used_atom) //We ALWAYS delete the mech lim/part used. No way to get this back.
	return 1

/datum/construction/mecha/action(atom/used_atom,mob/user as mob)
	return check_all_steps(used_atom,user)

/datum/construction/reversible/mecha/custom_action(index, diff, atom/used_atom, mob/user)
	var/list/step = steps[index]
	var/key = diff == FORWARD ? "key" : "backkey" //Were in a constent state of "We can go back a step or fordwards?" for each step,
// As of 19-Apr-2021 we soft-remove backkey form all mechs, do to balance issues and mat doups
	if(!ispath(step[key]))
		if(istype(used_atom, /obj/item))
			var/obj/item/I = used_atom
			return I.use_tool(user, holder, WORKTIME_LONG, step[key], FAILCHANCE_NORMAL, required_stat = STAT_MEC)

	else if(istype(used_atom, /obj/item/stack/cable_coil))
		var/obj/item/stack/cable_coil/C = used_atom
		if(C.use(5)) //We use 5 coils. no idea why
			playsound(holder, 'sound/items/Deconstruct.ogg', 50, 1)
		else
			to_chat(user, ("There's not enough cable to finish the task."))
			return 0
	else if(istype(used_atom, /obj/item/stack))
		var/obj/item/stack/S = used_atom
		if(S.get_amount() < 5) //Always takes 5s no modular
			to_chat(user, ("There's not enough material in this stack."))
			return 0
		else
			S.use(5)
	else if(istype(used_atom, /obj/item/stock_parts))
		var/obj/item/stock_parts/S = used_atom
		if(S.rating < step["rating"]) //Rating is used for a gate of stockparts to be better but we dont use its rating...
			return 0
		usr.drop_from_inventory(S, holder)

	else if(istype(used_atom, /obj/item/tool_upgrade))
		var/obj/item/tool_upgrade/U = used_atom
		usr.drop_from_inventory(U, holder) //U for upgrade

	else if(istype(used_atom, /obj/item/mecha_parts))
		var/obj/item/mecha_parts/M = used_atom
		usr.drop_from_inventory(M, holder) //M for mech part

	else if(istype(used_atom, /obj/item/robot_parts))
		var/obj/item/robot_parts/R = used_atom
		usr.drop_from_inventory(R, holder) //R for robot

	else if(istype(used_atom, /obj/item/circuitboard/mecha))
		var/obj/item/circuitboard/mecha/B = used_atom
		usr.drop_from_inventory(B, holder) //B for Board

	else if(istype(used_atom, /obj/item/rig_module/vision))
		var/obj/item/rig_module/vision/V = used_atom
		usr.drop_from_inventory(V, holder) //V for vision

	return 1

/datum/construction/reversible/mecha/action(atom/used_atom,mob/user as mob)
	return check_step(used_atom,user)

/* Example Mech ===========================================================================

	//Backstep Item giving
	How this works - After we install the in this case armor we then are on "step 2"
	Well were on a step think of it as a limbo state of "step.5" were they dont know if they are going
	backwords or not.
	Using this information you can see why rather then when undoing step 2, we do not get are armor back
	were basiclly at 1.5 when adding it on so we need 3.5 to take it off.
	Confusing and hard to read? Yes. Works? Also yes.

	Data of the steps
		//1
		list("key"=QUALITY_BOLT_TURNING,
			"backkey"=QUALITY_PRYING,
			"desc"="External armor is installed."),

	Well here, we HAVE bolted it and now sit here asking one of two questions
	Are we A: backkey-ing?
	Are we B: Adding in example_armor?

		//2
		list("key"=/obj/item/mecha_parts/part/example_armor,
			"backkey"=QUALITY_WELDING,
			"desc"="Example armor is welded."),

	Well here, we HAVE added the armor and now sit here asking one of two questions
	Are we A: backkey-ing?
	Are we B: welding in example_armor?

	SO if we pick A here we look at if(3) statement as we are BACKING away form it, meaning we
	give back the armor we added form if(2)

		//3
		list("key"=QUALITY_WELDING,
			"backkey"=QUALITY_BOLT_TURNING,
			"desc"="Example armor is wrenched."),

	Data of what step the mech is on and what they are doing
			if(3)
				if(diff==FORWARD)
					user.visible_message(
						"[user] secures example Armor Plates.",
						"You secure example Armor Plates."
					)
					holder.icon_state = "example22"
				else
					user.visible_message(
						"[user] pries example Armor Plates from the [holder].",
						"You pry example Armor Plates from the [holder]."
					)
					new /obj/item/mecha_parts/part/example_armor(get_turf(holder))
					holder.icon_state = "example20"




/datum/construction/mecha/example_chassis
 //This is pre-wiring/welder basiclly adding the bits onto the main torso form the exo fab.
 //Slap n add basiclly. Its quit modular an can have just about any item sloted in. But no real way to give feedback on it
	steps = list(
		list("key"=/obj/item/mecha_parts/part/example_torso),//1
		list("key"=/obj/item/mecha_parts/part/example_head),//2
		list("key"=/obj/item/mecha_parts/part/example_left_arm),//3
		list("key"=/obj/item/mecha_parts/part/example_right_arm),//4
		list("key"=/obj/item/mecha_parts/part/example_left_leg),//5
		list("key"=/obj/item/mecha_parts/part/example_right_leg)//6
	)
//The end result of above, this is the more modular constrution. Can have as many steps as you want with ever item in the game.
	spawn_result()
		var/obj/item/mecha_parts/chassis/const_holder = holder
		const_holder.construct = new /datum/construction/reversible/mecha/example(const_holder) //Links to the datum below
		const_holder.icon = 'icons/mecha/mech_construction.dmi'
		const_holder.icon_state = "example0" //Make sure these are correct with icons. They are picky about it
		const_holder.density = 1 //This is so we cant pick up or walk onto a contrustion for a mech
		const_holder.desc = "A chassis or case for a example mech." //Used to tell what lims/spare parts are needed, could be anything really.

		spawn()
			qdel(src) //Delets are mech contrution part rig thing that we used to slap on head/arms/legs
		return
//This is for the above "const_holder"
/datum/construction/reversible/mecha/example
	result = /obj/mecha/example
	steps = list(
		//1 Last step
		list("key"=QUALITY_WELDING, //This is how we move on form this step. In this case this will make the mech
			//"backkey"=QUALITY_BOLT_TURNING, //This is how we go form 1 - > 2 steps
			"desc"="External armor is wrenched."), //This is what when on this step will say in its desc.
		//2
		list("key"=QUALITY_BOLT_TURNING,
			//"backkey"=QUALITY_PRYING,
			"desc"="External armor is installed."),
		//3
		list("key"=/obj/item/stack/material/plasteel,
			//"backkey"=QUALITY_WELDING,
			"desc"="Internal armor is welded."),
		//4
		list("key"=/obj/item/tool_upgrade/reinforcement/heatsink, //In this case were using an item rather then a tool. It will delete it after.
			//"backkey"=QUALITY_PRYING,
			"desc"="Internal armor needs to be welded into place."),
		//5
		list("key"=/obj/item/stack/cable_coil, //Coils always take in 5s, dont worry it prevents 4- with
			//"backkey"=QUALITY_SCREW_DRIVING,
			"desc"="Heat Sink compartment is open."),
		//6
		list("key"=/obj/item/clothing/glasses/hud/health,
			//"backkey"=QUALITY_PRYING,
			"desc"="Health HUD Display installed, but not wired linked."),
		//7
		list("key"=QUALITY_WELDING,
			//"backkey"=QUALITY_BOLT_TURNING,
			"desc"="Internal armor is wrenched"),
		//8
		list("key"=/obj/item/stack/material/plastic, //Like coil, takes 5 and prevents 4-
			//"backkey"=QUALITY_PRYING,
			"desc"="Internal armor is plastic fitted just needs to be welded."),
		//9
		list("key"=QUALITY_BOLT_TURNING,
			//"backkey"=QUALITY_PRYING,
			"desc"="Internal armor is installed, but needs plastic fittings."),
		//10
		list("key"=/obj/item/stack/material/steel,
			//"backkey"=QUALITY_SCREW_DRIVING,
			"desc"="Peripherals control module is secured"),
		//11
		list("key"=QUALITY_SCREW_DRIVING,
			//"backkey"=QUALITY_PRYING,
			"desc"="Peripherals control module is installed"),
		//12
		list("key"=/obj/item/circuitboard/mecha/peripherals,
			//"backkey"=QUALITY_SCREW_DRIVING,
			"desc"="Central control module is secured"),
		//13
		list("key"=QUALITY_SCREW_DRIVING,
			//"backkey"=QUALITY_PRYING,
			"desc"="Central control module is installed"),
		//14
		list("key"=/obj/item/circuitboard/mecha/main,
			//"backkey"=QUALITY_SCREW_DRIVING,
			"desc"="The wiring is adjusted"),
		//15
		list("key"=QUALITY_WIRE_CUTTING,
			//"backkey"=QUALITY_SCREW_DRIVING,
			"desc"="The wiring is added"),
		//16
		list("key"=/obj/item/stack/cable_coil,
			//"backkey"=QUALITY_SCREW_DRIVING,
			"desc"="The hydraulic systems are active."),
		//17
		list("key"=QUALITY_SCREW_DRIVING,
			//"backkey"=QUALITY_BOLT_TURNING,
			"desc"="The hydraulic systems are connected."),
		//18 // First step
		list("key"=QUALITY_BOLT_TURNING,
			"desc"="The hydraulic systems are disconnected.")
	)
//Lazy so im not going to update the below to match above but i.g the commits are upto date - 2021 13 APR
	custom_action(index, diff, atom/used_atom, mob/user)
		if(!..())
			return 0

		switch(index)
			if(14) //First step
				user.visible_message(
					"[user] connects [holder] hydraulic systems", //This one is for people around them to see what they are doing
					"You connect [holder] hydraulic systems." //This one is only sent to the person working on the mech. This is for feedback so they know they are doing things correctly
				)
				holder.icon_state = "example1" //Icon setting
			if(13)
				if(diff==FORWARD) //This is checking for a backstep trigger
					user.visible_message(
						"[user] activates [holder] hydraulic systems.",
						"You activate [holder] hydraulic systems."
					)
					holder.icon_state = "example2"
				else //Else is the correct backstep item, moves us back to 14 in this case
					user.visible_message(
						"[user] disconnects [holder] hydraulic systems",
						"You disconnect [holder] hydraulic systems."
					)
					holder.icon_state = "example0"
			if(12)
				if(diff==FORWARD)
					user.visible_message(
						"[user] adds the wiring to [holder].",
						"You add the wiring to [holder]."
					)
					holder.icon_state = "example3"
				else
					user.visible_message(
						"[user] deactivates [holder] hydraulic systems.",
						"You deactivate [holder] hydraulic systems."
					)
					holder.icon_state = "example1"
			if(11)
				if(diff==FORWARD)
					user.visible_message(
						"[user] adjusts the wiring of [holder].",
						"You adjust the wiring of [holder]."
					)
					holder.icon_state = "example4"
				else
					user.visible_message(
						"[user] removes the wiring from [holder].",
						"You remove the wiring from [holder]."
					)
					new /obj/item/stack/cable_coil (get_turf(holder), 4) //Adds into the case itself 4 of 5 coils we lose 1 it seems in this prossess
					holder.icon_state = "example2"
			if(10)
				if(diff==FORWARD)
					user.visible_message(
						"[user] installs the central control module into [holder].",
						"You install the central computer mainboard into [holder]."
					)
					qdel(used_atom) //This means were deleting in this case the controle board, useful for custom items
					holder.icon_state = "example5"
				else
					user.visible_message(
						"[user] disconnects the wiring of [holder].",
						"You disconnect the wiring of [holder]."
					)
					holder.icon_state = "example3"
			if(9)
				if(diff==FORWARD)
					user.visible_message(
						"[user] secures the mainboard.",
						"You secure the mainboard."
					)
					holder.icon_state = "example6"
				else
					user.visible_message(
						"[user] removes the central control module from [holder].",
						"You remove the central computer mainboard from [holder]."
					)
					new /obj/item/circuitboard/mecha/main(get_turf(holder)) //Unlike in legitmently the board before this one in this case is saved for some reason I dont even know.
					holder.icon_state = "example4"
			if(8)
				if(diff==FORWARD)
					user.visible_message(
						"[user] installs the peripherals control module into [holder].",
						"You install the peripherals control module into [holder]."
					)
					qdel(used_atom)
					holder.icon_state = "example7"
				else
					user.visible_message(
						"[user] unfastens the mainboard.",
						"You unfasten the mainboard."
					)
					holder.icon_state = "example5"
			if(7)
				if(diff==FORWARD)
					user.visible_message(
						"[user] secures the peripherals control module.",
						"You secure the peripherals control module."
					)
					holder.icon_state = "example8"
				else
					user.visible_message(
						"[user] removes the peripherals control module from [holder].",
						"You remove the peripherals control module from [holder]."
					)
					new /obj/item/circuitboard/mecha/peripherals(get_turf(holder))
					holder.icon_state = "example6"
			if(6)
				if(diff==FORWARD)
					user.visible_message(
						"[user] installs internal armor layer to [holder].",
						"You install internal armor layer to [holder]."
					)
					holder.icon_state = "example9"
				else
					user.visible_message(
						"[user] unfastens the peripherals control module.",
						"You unfasten the peripherals control module."
					)
					holder.icon_state = "example7"
			if(5)
				if(diff==FORWARD)
					user.visible_message(
						"[user] secures internal armor layer.",
						"You secure internal armor layer."
					)
					holder.icon_state = "example10"
				else
					user.visible_message(
						"[user] pries internal armor layer from [holder].",
						"You prie internal armor layer from [holder]."
					)
					new /obj/item/stack/material/steel (get_turf(holder), 5)
					holder.icon_state = "example8"
			if(4)
				if(diff==FORWARD)
					user.visible_message(
						"[user] welds internal armor layer to [holder].",
						"You weld the internal armor layer to [holder]."
					)
					holder.icon_state = "example11"
				else
					user.visible_message(
						"[user] unfastens the internal armor layer.",
						"You unfasten the internal armor layer."
					)
					holder.icon_state = "example9"
			if(3)
				if(diff==FORWARD)
					user.visible_message(
						"[user] installs [used_atom] layer to [holder].",
						"You install external reinforced armor layer to [holder]."
					)
					holder.icon_state = "example12"
				else
					user.visible_message(
						"[user] cuts internal armor layer from [holder].",
						"You cut the internal armor layer from [holder]."
					)
					holder.icon_state = "example10"
			if(2)
				if(diff==FORWARD)
					user.visible_message(
						"[user] secures external armor layer.",
						"You secure external reinforced armor layer."
					)
					holder.icon_state = "example13"
				else
					var/obj/item/stack/material/plasteel/MS = new (get_turf(holder), 5)// Unlike coil we keep are sheets as theirs 0 loss
					user.visible_message(
						"[user] pries [MS] from [holder].",
						"You prie [MS] from [holder]."
					)
					holder.icon_state = "example11"
			if(1) //last step
				if(diff==FORWARD)
					user.visible_message(
						"[user] welds external armor layer to [holder].",
						"You weld external armor layer to [holder]."
					)
					holder.icon_state = "example14"
				else
					user.visible_message(
						"[user] unfastens the external armor layer.",
						"You unfasten the external armor layer."
					)
					holder.icon_state = "example12"
		return 1
End */
