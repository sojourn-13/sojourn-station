
//FIREFUIGHTER ===========================================================================

/datum/construction/mecha/firefighter_chassis
	steps = list(
		list(
			"key" = /obj/item/mecha_parts/part/ripley_torso,
			"desc" = "A chassis for a Firefighter mech. Needs a Ripley torso, arms and legs, as well as a fire suit."
		), // 1
		list(
			"key" = /obj/item/mecha_parts/part/ripley_left_arm,
			"desc" = "A chassis for a Firefighter mech. Needs a Ripley torso, arms and legs, as well as a fire suit."
		), // 2
		list(
			"key" = /obj/item/mecha_parts/part/ripley_right_arm,
			"desc" = "A chassis for a Firefighter mech. Needs a Ripley torso, arms and legs, as well as a fire suit."
		), // 3
		list(
			"key" = /obj/item/mecha_parts/part/ripley_left_leg,
			"desc" = "A chassis for a Firefighter mech. Needs a Ripley torso, arms and legs, as well as a fire suit."
		), // 4
		list(
			"key" = /obj/item/mecha_parts/part/ripley_right_leg,
			"desc" = "A chassis for a Firefighter mech. Needs a Ripley torso, arms and legs, as well as a fire suit."
		), // 5
		list(
			"key" = /obj/item/clothing/suit/fire,
			"desc" = "A chassis for a Firefighter mech. Needs a Ripley torso, arms and legs, as well as a fire suit."
		) // 6
	)

/datum/construction/mecha/firefighter_chassis/spawn_result()
	var/obj/item/mecha_parts/chassis/const_holder = holder
	const_holder.construct = new /datum/construction/reversible/mecha/firefighter(const_holder)
	const_holder.icon = 'icons/mecha/mech_construction.dmi'
	const_holder.icon_state = "firefirefighter0"
	const_holder.density = 1
	spawn()
		qdel(src)


/datum/construction/reversible/mecha/firefighter
	give_points = 15000 //How many points do we give?
	rnd_point_giver = TRUE //Do we even give points?

	result = /obj/mecha/working/ripley/firefighter
	steps = list(
		//1
		list("key"=QUALITY_WELDING,
			//"backkey"=QUALITY_BOLT_TURNING,
			"desc"="The exosuit is almost ready. All that is left is a little spot-welding to touch things up."),
		//2
		list("key"=QUALITY_SCREW_DRIVING,
			//"backkey"=QUALITY_PRYING,
			"desc"="The windshield hangs loose in the chassis, and must be screwed into place."),
		//3
		list("key"=/obj/item/stack/material/glass/reinforced,
			//"backkey"=QUALITY_WELDING,
			"desc"="External armor is installed. 5 sheets of reinforced glass are needed for the windshield."),
		//4
		list("key"=QUALITY_BOLT_TURNING,
			//"backkey"=QUALITY_PRYING,
			"desc"="The heatsink hangs loose on the chassis and needs to be bolted down."),
		//5
		list("key"=/obj/item/tool_upgrade/reinforcement/heatsink,
			//"backkey"=QUALITY_PRYING,
			"desc"="The External armor plating leaves a gap for a heatsink to be installed."),
		//6
		list("key"=/obj/item/stack/material/plasteel,
			//"backkey"=QUALITY_WELDING,
			"desc"="The insulation is finished and can be covered. 5 sheets of plasteel are needed to form the external armor."),
		//7
		list("key"=QUALITY_WELDING,
			//"backkey"=QUALITY_BOLT_TURNING,
			"desc"="The insulation is installed, but segmented. It must be welded together"),
		//8
		list("key"=/obj/item/stack/material/plastic,
			//"backkey"=QUALITY_PRYING,
			"desc"="The internal armor is finished, but needs 5 plastic sheets for insulation."),
		//9
		list("key"=/obj/item/stack/material/silver,
			//"backkey"=QUALITY_PRYING,
			"desc"="Internal armor is secured. The chassis needs 5 silver ingots to form a conduction port for a heat sink."),
		//10
		list("key"=/obj/item/stack/material/gold,
			//"backkey"=QUALITY_PRYING,
			"desc"="The circuit shielding needs 5 gold ingots to form a gold foil lining."),
		//11
		list("key"=QUALITY_BOLT_TURNING,
			//"backkey"=QUALITY_PRYING,
			"desc"="The circuit shielding has been placed in the chassis, but needs to be bolted down."),
		//12
		list("key"=/obj/item/stack/material/steel,
			//"backkey"=QUALITY_SCREW_DRIVING,
			"desc"="The internal circutry is installed. 5 sheets of steel are needed to shield it."),
		//13
		list("key"=QUALITY_SCREW_DRIVING,
			//"backkey"=QUALITY_PRYING,
			"desc"="The peripherals control board hangs loose in the chassis, and must be screwed into place."),
		//14
		list("key"=/obj/item/circuitboard/mecha/peripherals,
			//"backkey"=QUALITY_SCREW_DRIVING,
			"desc"="The central control board is secured. It requires a peripherals control board to function properly."),
		//15
		list("key"=QUALITY_SCREW_DRIVING,
			//"backkey"=QUALITY_PRYING,
			"desc"="The central control board hangs loose in the chassis, and must be screwed into place."),
		//16
		list("key"=/obj/item/circuitboard/mecha/main,
			//"backkey"=QUALITY_SCREW_DRIVING,
			"desc"="The hydraulic wiring is adjusted, and the chassis is ready for a central control board."),
		//17
		list("key"=QUALITY_WIRE_CUTTING,
			//"backkey"=QUALITY_SCREW_DRIVING,
			"desc"="The wiring is connected, but needs to be organized with a wire-cutting tool."),
		//18
		list("key"=/obj/item/stack/cable_coil,
			//"backkey"=QUALITY_SCREW_DRIVING,
			"desc"="The hydraulic systems on the chassis requires wiring."),
		//19
		list("key"=QUALITY_SCREW_DRIVING,
			//"backkey"=QUALITY_BOLT_TURNING,
			"desc"="The hydraulic systems are bolted down, but the interconnected components must be screwed into place."),
		//20
		list("key"=QUALITY_BOLT_TURNING,
			//"backkey"=QUALITY_PRYING,
			"desc"="The high power motor hangs loose from the chassis, it needs to be bolted down."),
		//21
		list("key"=/obj/item/tool_upgrade/productivity/motor,
			//"backkey"=QUALITY_PRYING,
			"desc"="The hydraulic circuits require a high power motor to actuate."),
		//22
		list("key"=/obj/item/tool_upgrade/augment/hydraulic,
			//"backkey"=QUALITY_PRYING,
			"desc"="With the heavy cell mount added, it can now have hydraulic circuits inserted."),
		//23
		list("key"=/obj/item/tool_upgrade/augment/cell_mount,
			//"backkey"=QUALITY_PRYING,
			"desc"="The basic chassis is assembled. A heavy cell mount is needed to power it."),
		//24
		list("key"=QUALITY_SCREW_DRIVING,
			"desc"="The case of the chassis is screwed shut. It must be unscrewed to continue.") //So we can successfully keyback to this for getting back tool mods
	)


/datum/construction/reversible/mecha/firefighter/custom_action(index, diff, atom/used_atom, mob/user)
	if(!..())
		return 0
	
	if(!usr.stat_check(STAT_MEC, STAT_LEVEL_ADEPT))
		to_chat(usr, SPAN_WARNING("You lack the mechanical knowledge to do this!"))
		return

	switch(index)
		if(24)
			usr.visible_message(
				"[usr] opens the internal cover of the [holder]", \
				"You open the internal cover of the [holder]."
			)
			holder.icon_state = "firefighter1"
		if(23)
			if(diff == FORWARD)
				usr.visible_message(
					"[usr] adds a heavy cell mount to the [holder].", \
					"You add a heavy cell mount to the [holder]."
				)
				holder.icon_state = "firefighter0"
			else
				usr.visible_message(
					"[usr] removes the heavy cell mount from the [holder].", \
					"You remove the heavy cell mount from the [holder]."
				)
				holder.icon_state = "firefighter0"
				new /obj/item/tool_upgrade/augment/cell_mount(get_turf(holder))
		if(22)
			if(diff == FORWARD)
				usr.visible_message(
					"[usr] adds a hydraulic system to the [holder].", \
					"You add a hydraulic system to the [holder]."
				)
				holder.icon_state = "firefighter1"
			else
				usr.visible_message(
					"[usr] takes out the [holder]'s hydraulic systems", \
					"You disconnect and remove the [holder]'s hydraulic systems."
				)
				holder.icon_state = "firefighter0"
				new /obj/item/tool_upgrade/augment/cell_mount(get_turf(holder))
		if(21)
			if(diff == FORWARD)
				usr.visible_message(
					"[usr] installs a high powered motor in the [holder].", \
					"You install a high powered motor in the [holder]."
				)
				holder.icon_state = "firefighter1"
			else
				usr.visible_message(
					"[usr] removes a high powered motor from the [holder].", \
					"You disconnect and remove a high powered motor from the [holder]."
				)
				holder.icon_state = "firefighter0"
				new /obj/item/tool_upgrade/augment/hydraulic(get_turf(holder))
		if(20)
			if(diff == FORWARD)
				usr.visible_message(
					"[usr] secures hydraulic systems inside the [holder].", \
					"You secure hydraulic systems inside the [holder]."
				)
				holder.icon_state = "firefighter1"
			else
				usr.visible_message(
					"[usr] unsecures the [holder]'s hydraulic system", \
					"You unsecure the [holder]'s hydraulic system."
				)
				holder.icon_state = "firefighter0"
				new /obj/item/tool_upgrade/productivity/motor(get_turf(holder))
		if(19)
			if(diff == FORWARD)
				usr.visible_message(
					"[usr] connects the hydraulic systems inside the [holder].", \
					"You connect the hydraulic systems inside the [holder]."
				)
				holder.icon_state = "firefighter2"
			else
				usr.visible_message(
					"[usr] disconnects the [holder]'s hydraulic systems", \
					"You disconnect the [holder]'s hydraulic systems."
				)
				holder.icon_state = "firefighter0"
		if(18)
			if(diff == FORWARD)
				usr.visible_message(
					"[usr] adds wiring to the [holder]", \
					"You add wiring to the [holder]."
				)
				holder.icon_state = "firefighter3"
			else
				usr.visible_message(
					"[usr] removes the [holder]'s wiring", \
					"You remove the [holder]'s wiring."
				)
				holder.icon_state = "firefighter1"
		if(17)
			if(diff == FORWARD)
				usr.visible_message(
					"[usr] organizes the wiring in the [holder].", \
					"You organize the wiring in the [holder]."
				)
				holder.icon_state = "firefighter4"
			else
				usr.visible_message(
					"[usr] unsets the wiring from the [holder].", \
					"You unset the wiring from the [holder]."
				)
				new /obj/item/stack/cable_coil (get_turf(holder), 5)
				holder.icon_state = "firefighter2"
		if(16)
			if(diff == FORWARD)
				usr.visible_message(
					"[usr] installs the central control board into the [holder].", \
					"You install the central control board into the [holder]."
				)
				holder.icon_state = "firefighter5"
			else
				usr.visible_message(
					"[usr] removes the central control board from the [holder].", \
					"You remove the central control board from the [holder]."
				)
				holder.icon_state = "firefighter3"
		if(15)
			if(diff == FORWARD)
				usr.visible_message(
					"[usr] secures the central control board inside the [holder].", \
					"You secure the central control board inside the [holder]."
				)
				holder.icon_state = "firefighter6"
			else
				usr.visible_message(
					"[usr] unsecures the central control board inside the [holder].", \
					"You unsecure the central control board inside the [holder]."
				)
				new /obj/item/circuitboard/mecha/main(get_turf(holder))
				holder.icon_state = "firefighter4"
		if(14)
			if(diff == FORWARD)
				usr.visible_message(
					"[usr] installs the peripherals control board into the [holder].", \
					"You install the peripherals control board into the [holder]."
				)
				holder.icon_state = "firefighter7"
			else
				usr.visible_message(
					"[usr] removes the peripherals control board from the [holder].", \
					"You remove the peripherals control board from the [holder]."
				)
				new /obj/item/circuitboard/mecha/peripherals(get_turf(holder))
				holder.icon_state = "firefighter5"
		if(13)
			if(diff == FORWARD)
				usr.visible_message(
					"[usr] secures the peripherals control board inside the [holder].", \
					"You secure the peripherals control board inside the [holder]."
				)
				holder.icon_state = "firefighter8"
			else
				usr.visible_message(
					"[usr] unsecures the peripherals control board inside the [holder].", \
					"You unsecure the peripherals control board inside the [holder]."
				)
				holder.icon_state = "firefighter6"
		if(12)
			if(diff == FORWARD)
				usr.visible_message(
					"[usr] installs the circuit shielding inside the [holder].", \
					"You install the circuit shielding inside the [holder]."
				)
				holder.icon_state = "firefighter9"
			else
				usr.visible_message(
					"[usr] pries the circuit shielding from the [holder].", \
					"You pry the circuit shielding from the [holder]."
				)
				new /obj/item/stack/material/steel (get_turf(holder), 5)
				holder.icon_state = "firefighter7"
		if(11)
			if(diff == FORWARD)
				usr.visible_message(
					"[usr] bolts down the circuit shielding on the [holder].", \
					"You bolt down the circuit shielding on the [holder]."
				)
				holder.icon_state = "firefighter10"
			else
				usr.visible_message(
					"[usr] unsecures the circuit shielding on the [holder].", \
					"You unsecure the circuit shielding on the [holder]."
				)
				holder.icon_state = "firefighter8"
		if(10)
			if(diff == FORWARD)
				usr.visible_message(
					"[usr] installs a gold foil lining on the [holder].", \
					"You install a gold foil lining on the [holder]."
				)
				holder.icon_state = "firefighter10"
			else
				usr.visible_message(
					"[usr] scrapes the gold foil lining from the [holder].", \
					"You scrape the gold foil lining from the [holder]."
				)
				new /obj/item/stack/material/gold (get_turf(holder), 5)
				
				holder.icon_state = "firefighter8"
		if(9)
			if(diff == FORWARD)
				usr.visible_message(
					"[usr] fabricates a heatsink conduction port on the [holder].", \
					"You fabricate a heatsink conduction port on the [holder]."
				)
				holder.icon_state = "firefighter10"
			else
				usr.visible_message(
					"[usr] pries the heatsink conduction port from the [holder].", \
					"You pry the heatsink conduction port from the [holder]."
				)
				new /obj/item/stack/material/silver (get_turf(holder), 5)
				holder.icon_state = "firefighter8"
		if(8)
			if(diff == FORWARD)
				usr.visible_message(
					"[usr] adds an insulating layer to the [holder].", \
					"You add an insulating layer to the [holder]."
				)
				holder.icon_state = "firefighter10"
			else
				usr.visible_message(
					"[usr] rips out the insulating layer from the [holder].", \
					"You rip out the insulating layer from the [holder]"
				)
				new /obj/item/stack/material/plastic (get_turf(holder), 5)
				holder.icon_state = "firefighter8"
		if(7)
			if(diff == FORWARD)
				usr.visible_message(
					"[usr] welds together the insulating layer on the [holder].", \
					"You weld together the insulating layer on the [holder]."
				)
				holder.icon_state = "firefighter11"
			else
				usr.visible_message(
					"[usr] cuts the insulating layer on the [holder] into pieces.", \
					"You cut the insulating layer on the [holder] into pieces."
				)
				holder.icon_state = "firefighter9"
		if(6)
			if(diff == FORWARD)
				usr.visible_message(
					"[usr] installs an external armor layer to the [holder].", \
					"You install an external armor layer to the [holder]."
				)
				holder.icon_state = "firefighter12"
			else
				usr.visible_message(
					"[usr] removes the external armor layer from the [holder].", \
					"You remove the external armor layer from the [holder]."
				)
				new /obj/item/stack/material/plasteel (get_turf(holder), 5)
				holder.icon_state = "firefighter10"
		if(5)
			if(diff == FORWARD)
				usr.visible_message(
				"[usr] places a heatsink in the conduction port of the [holder]",
				"You place a heatsink in the conduction port of the [holder]."
				)
				holder.icon_state = "firefirefighter11"
			else
				usr.visible_message(
					"[usr] removes the heatsink from the conduction port of the [holder]", \
					"You remove the heatsink from the conduction port of the [holder]."
				)
				new /obj/item/tool_upgrade/reinforcement/heatsink(get_turf(holder))
				holder.icon_state = "firefirefighter13"
		if(4)
			if(diff == FORWARD)
				usr.visible_message(
					"[usr] secures the heat sink to the [holder].", \
					"You secure the heat sink to the [holder]."
				)
				holder.icon_state = "firefighter13"
			else
				usr.visible_message(
					"[usr] unsecures the heat sink from the [holder].", \
					"You unsecure the heat sink from the [holder]."
				)
				holder.icon_state = "firefighter11"
		if(3)
			if(diff == FORWARD)
				usr.visible_message(
					"[usr] installs the windshield on the [holder].", \
					"You install the windshield on the [holder]."
				)
			else
				usr.visible_message(
					"[usr] removes the windshield from the [holder].", \
					"You remove the windshield from the [holder]."
				)
				holder.icon_state = "firefirefighter13"
				new /obj/item/stack/material/glass/reinforced (get_turf(holder), 5)
		if(2)
			if(diff == FORWARD)
				usr.visible_message(
					"[usr] screws down the windshield on the [holder].", \
					"You screw down the windshield on the [holder]."
				)
			else
				usr.visible_message(
					"[usr] unscrews the windshield from the [holder].", \
					"You unscrew the windshield from the [holder]."
				)
				holder.icon_state = "firefighter12"
		if(1)
			if(diff == FORWARD)
				usr.visible_message(
					"[usr] finishes construction on the exosuit.", \
					"You finish construction on the exosuit."
				)
			else
				usr.visible_message(
					"[usr] begins to disassemble the [holder].", \
					"You begin to disassemble the [holder]."
				)
				holder.icon_state = "firefighter12"
	return 1
