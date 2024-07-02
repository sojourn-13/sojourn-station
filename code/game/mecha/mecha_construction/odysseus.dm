// ODYSSEUS ===========================================================================

/datum/construction/mecha/odysseus_chassis
	steps = list(
		list("key" = /obj/item/mecha_parts/part/odysseus_torso,
			"desc" = "The chassis for an Odysseus mech. Needs an Odysseus head, arms and legs."
		), // 1
		list("key" = /obj/item/mecha_parts/part/odysseus_head,
			"desc" = "The chassis for an Odysseus mech. Needs an Odysseus head, arms and legs."
		), // 2
		list("key" = /obj/item/mecha_parts/part/odysseus_left_arm,
			"desc" = "The chassis for an Odysseus mech. Needs an Odysseus head, arms and legs."
		), // 3
		list("key" = /obj/item/mecha_parts/part/odysseus_right_arm,
			"desc" = "The chassis for an Odysseus mech. Needs an Odysseus head, arms and legs."
		), // 4
		list("key" = /obj/item/mecha_parts/part/odysseus_left_leg,
			"desc" = "The chassis for an Odysseus mech. Needs an Odysseus head, arms and legs."
		), // 5
		list("key" = /obj/item/mecha_parts/part/odysseus_right_leg,
			"desc" = "The chassis for an Odysseus mech. Needs an Odysseus head, arms and legs."
		) // 6 
	)

/datum/construction/mecha/odysseus_chassis/spawn_result()
	var/obj/item/mecha_parts/chassis/const_holder = holder
	const_holder.construct = new /datum/construction/reversible/mecha/odysseus(const_holder)
	const_holder.icon = 'icons/mecha/mech_construction.dmi'
	const_holder.icon_state = "odysseus0"
	const_holder.density = 1
	spawn()
		qdel(src)

/datum/construction/reversible/mecha/odysseus
	give_points = 17500 //How many points do we give?
	rnd_point_giver = TRUE //Do we even give points?

	result = /obj/mecha/medical/odysseus
	steps = list(
		//1
		list("key" = QUALITY_WELDING,
			//"backkey" = QUALITY_BOLT_TURNING,
			"desc"="The exosuit is almost ready. All that is left is a little spot-welding to touch things up."),
		//2
		list("key" = QUALITY_BOLT_TURNING,
			//"backkey" = QUALITY_PRYING,
			"desc"="The heatsink hangs loose on the chassis and needs to be bolted down."),
		//3
		list("key" = /obj/item/tool_upgrade/reinforcement/heatsink,
			//"backkey" = QUALITY_PRYING,
			"desc"="The External armor plating leaves a gap for a heatsink to be installed."),
		//4
		list("key" = /obj/item/stack/material/plasteel,
			//"backkey" = QUALITY_WELDING,
			"desc"="The Medical HUD is installed. 5 sheets of plasteel are needed to form the external armor."),
		//5
		list("key" = /obj/item/stack/cable_coil,
			//"backkey" = QUALITY_SCREW_DRIVING,
			"desc"="The medical HUD must be wired to the peripherals on the chassis."),
		//6
		list("key" = /obj/item/rig_module/vision/medhud,
			//"backkey" = QUALITY_PRYING,
			"desc"="Internal armor is installed. A rig-mounted medical HUD must be added to the cockpit."),
		//7
		list("key" = QUALITY_WELDING,
			//"backkey" = QUALITY_BOLT_TURNING,
			"desc"="The plastic joint protectors need to be welded into place."),
		//8
		list("key" = /obj/item/stack/material/plastic,
			//"backkey" = QUALITY_PRYING,
			"desc"="Internal armor is secured. 5 sheets of plastic are needed to cover gaps in the joints."),
		//9
		list("key" = QUALITY_BOLT_TURNING,
			//"backkey" = QUALITY_PRYING,
			"desc"="The circuit shielding has been placed in the chassis, but needs to be bolted down."),
		//10
		list("key" = /obj/item/stack/material/steel,
			//"backkey" = QUALITY_SCREW_DRIVING,
			"desc"="The internal circutry is installed. 5 sheets of steel are needed to shield it."),
		//11
		list("key" = QUALITY_SCREW_DRIVING,
			//"backkey" = QUALITY_PRYING,
			"desc"="The peripherals control board hangs loose in the chassis, and must be screwed into place."),
		//12
		list("key" = /obj/item/circuitboard/mecha/peripherals,
			//"backkey" = QUALITY_SCREW_DRIVING,
			"desc"="The central control board is secured. It requires a peripherals control board to function properly."),
		//13
		list("key" = QUALITY_SCREW_DRIVING,
			//"backkey" = QUALITY_PRYING,
			"desc"="The central control board hangs loose in the chassis, and must be screwed into place."),
		//14
		list("key" = /obj/item/circuitboard/mecha/main,
			//"backkey" = QUALITY_SCREW_DRIVING,
			"desc"="The hydraulic wiring is adjusted, and the chassis is ready for a central control board."),
		//15
		list("key" = QUALITY_WIRE_CUTTING,
			//"backkey" = QUALITY_SCREW_DRIVING,
			"desc"="The wiring is connected, but needs to be organized with a wire-cutting tool."),
		//16
		list("key" = /obj/item/stack/cable_coil,
			//"backkey" = QUALITY_SCREW_DRIVING,
			"desc"="The hydraulic systems on the chassis requires wiring."),
		//17
		list("key" = QUALITY_SCREW_DRIVING,
			//"backkey" = QUALITY_BOLT_TURNING,
			"desc"="The hydraulic systems are bolted down, but the interconnected components must be screwed into place."),
		//18
		list("key" = QUALITY_BOLT_TURNING,
			//"backkey" = QUALITY_PRYING,
			"desc"="The hydraulic circuits hang loose from the chassis, they need to be bolted down."),
		//19
		list("key" = /obj/item/tool_upgrade/augment/hydraulic,
			//"backkey" = QUALITY_PRYING,
			"desc"="With the heavy cell mount added, it can now have hydraulic circuits inserted."),
		//20
		list("key" = /obj/item/tool_upgrade/augment/cell_mount,
			//"backkey" = QUALITY_PRYING,
			"desc"="The basic chassis is assembled. A heavy cell mount is needed to power it."),
		//21
		list("key" = QUALITY_SCREW_DRIVING,
			"desc"="The case of the chassis is screwed shut. It must be unscrewed to continue.") //So we can successfully keyback to this for getting back tool mods
	)

/datum/construction/reversible/mecha/odysseus/custom_action(index, diff, atom/used_atom, mob/user)
	if(!..())
		return 0

	//TODID: better messages.
	switch(index)
		if(21)
			usr.visible_message(
				"[usr] opens the internal cover of the [holder]", \
				"You open the internal cover of the [holder]."
			)
			holder.icon_state = "odysseus1"
		if(20)
			if(diff == FORWARD)
				usr.visible_message(
					"[usr] adds a heavy cell mount to the [holder].", \
					"You add a heavy cell mount to the [holder]."
				)
				holder.icon_state = "odysseus0"
			else
				usr.visible_message(
					"[usr] screws back [holder] cover", \
					"You screw [holder] internal cover back."
				)
				holder.icon_state = "odysseus0"
		if(19)
			if(diff == FORWARD)
				usr.visible_message(
					"[usr] adds a hydraulic system to the [holder].", \
					"You add a hydraulic system to the [holder]."
				)
				holder.icon_state = "odysseus1"
			else
				usr.visible_message(
					"[usr] takes out [holder] hydraulic systems", \
					"You disconnect and remove [holder] hydraulic systems."
				)
				holder.icon_state = "odysseus0"
				new /obj/item/tool_upgrade/augment/cell_mount(get_turf(holder))
		if(18)
			if(diff == FORWARD)
				usr.visible_message(
					"[usr] secures hydraulic systems inside the [holder].", \
					"You secure hydraulic systems inside the [holder]."
				)
				holder.icon_state = "odysseus1"
			else
				usr.visible_message(
					"[usr] takes out [holder] hydraulic systems", \
					"You disconnect and remove [holder] hydraulic systems."
				)
				holder.icon_state = "odysseus0"
				new /obj/item/tool_upgrade/augment/hydraulic(get_turf(holder))
		if(17)
			if(diff == FORWARD)
				usr.visible_message(
					"[usr] connects the hydraulic systems inside the [holder].", \
					"You connect the hydraulic systems inside the [holder]."
				)
				holder.icon_state = "odysseus2"
			else
				usr.visible_message(
					"[usr] disconnects [holder] hydraulic systems", \
					"You disconnect [holder] hydraulic systems."
				)
				holder.icon_state = "odysseus0"
		if(16)
			if(diff == FORWARD)
				usr.visible_message(
					"[usr] adds wiring to the [holder]", \
					"You add wiring to the [holder]."
				)
				holder.icon_state = "odysseus3"
			else
				usr.visible_message(
					"[usr] deactivates [holder] hydraulic systems.", \
					"You deactivate [holder] hydraulic systems."
				)
				holder.icon_state = "odysseus1"
		if(15)
			if(diff == FORWARD)
				usr.visible_message(
					"[usr] organizes the wiring in the [holder].", \
					"You organize the wiring in the [holder]."
				)
				holder.icon_state = "odysseus4"
			else
				usr.visible_message(
					"[usr] removes the wiring from [holder].", \
					"You remove the wiring from [holder]."
				)
				new /obj/item/stack/cable_coil (get_turf(holder), 5)
				holder.icon_state = "odysseus2"
		if(14)
			if(diff == FORWARD)
				usr.visible_message(
					"[usr] installs the central control board into the [holder].", \
					"You install the central control board into the [holder]."
				)
				holder.icon_state = "odysseus5"
			else
				usr.visible_message(
					"[usr] disconnects the wiring of [holder].", \
					"You disconnect the wiring of [holder]."
				)
				holder.icon_state = "odysseus3"
		if(13)
			if(diff == FORWARD)
				usr.visible_message(
					"[usr] secures the central control board inside the [holder].", \
					"You secure the central control board inside the [holder]."
				)
				holder.icon_state = "odysseus6"
			else
				usr.visible_message(
					"[usr] removes the central control module from [holder].", \
					"You remove the central computer mainboard from [holder]."
				)
				new /obj/item/circuitboard/mecha/main(get_turf(holder))
				holder.icon_state = "odysseus4"
		if(12)
			if(diff == FORWARD)
				usr.visible_message(
					"[usr] installs the peripherals control board into the [holder].", \
					"You install the peripherals control board into the [holder]."
				)
				holder.icon_state = "odysseus7"
			else
				usr.visible_message(
					"[usr] unfastens the mainboard.", \
					"You unfasten the mainboard."
				)
				holder.icon_state = "odysseus5"
		if(11)
			if(diff == FORWARD)
				usr.visible_message(
					"[usr] secures the peripherals control board inside the [holder].", \
					"You secure the peripherals control board inside the [holder]."
				)
				holder.icon_state = "odysseus8"
			else
				usr.visible_message(
					"[usr] removes the peripherals control module from [holder].", \
					"You remove the peripherals control module from [holder]."
				)
				new /obj/item/circuitboard/mecha/peripherals(get_turf(holder))
				holder.icon_state = "odysseus6"
		if(10)
			if(diff == FORWARD)
				usr.visible_message(
					"[usr] installs the circuit shielding inside the [holder].", \
					"You install the circuit shielding inside the [holder]."
				)
				holder.icon_state = "odysseus9"
			else
				usr.visible_message(
					"[usr] unfastens the peripherals control module.", \
					"You unfasten the peripherals control module."
				)
				holder.icon_state = "odysseus7"
		if(9)
			if(diff == FORWARD)
				usr.visible_message(
					"[usr] bolts down the circuit shielding on the [holder].", \
					"You bolt down the circuit shielding on the [holder]."
				)
				holder.icon_state = "odysseus10"
			else
				usr.visible_message(
					"[usr] pries internal armor layer from [holder].", \
					"You prie internal armor layer from [holder]."
				)
				new /obj/item/stack/material/steel (get_turf(holder), 5)
				holder.icon_state = "odysseus8"
		if(8)
			if(diff == FORWARD)
				usr.visible_message(
					"[usr] adds plastic joint protectors to the [holder].", \
					"You add plastic joint protectors to the [holder]."
				)
				holder.icon_state = "odysseus10"
			else
				usr.visible_message(
					"[usr] pries internal fittings from [holder].", \
					"You prie internal fitting from [holder]."
				)
				new /obj/item/stack/material/plastic (get_turf(holder), 5)
				holder.icon_state = "odysseus8"
		if(7)
			if(diff == FORWARD)
				usr.visible_message(
					"[usr] welds the plastic joint protectors onto the [holder].", \
					"You weld the plastic joint protectors onto the [holder]."
				)
				holder.icon_state = "odysseus11"
			else
				usr.visible_message(
					"[usr] unfastens the internal armor layer.", \
					"You unfasten the internal armor layer."
				)
				holder.icon_state = "odysseus9"
		if(6)
			if(diff == FORWARD)
				usr.visible_message(
					"[usr] installs a medical HUD into the cockpit of the [holder].", \
					"You install a medical HUD into the cockpit of the [holder]."
				)
				holder.icon_state = "odysseus11"
			else
				usr.visible_message(
					"[usr] unfastens the internal armor layer.", \
					"You unfasten the internal armor layer."
				)
				holder.icon_state = "odysseus9"
		if(5)
			if(diff == FORWARD)
				usr.visible_message(
					"[usr] wires the medical hud HUD to the peripherals of the [holder].", \
					"You wire the medical hud HUD to the peripherals of the [holder]."
				)
				holder.icon_state = "odysseus12"
			else
				usr.visible_message(
					"[usr] takes out [holder] mounted HUD", \
					"You disconnect and remove [holder] the Medical Huds."
				)
				holder.icon_state = "odysseus11"
				new /obj/item/rig_module/vision/medhud(get_turf(holder))
		if(4)
			if(diff == FORWARD)
				usr.visible_message(
					"[usr] installs an external armor layer to the [holder].", \
					"You install an external armor layer to the [holder]."
				)
				holder.icon_state = "odysseus13"
			else
				usr.visible_message(
					"[usr] removes wire form [holder].", \
					"You unscrews and take out wiring from [holder]."
				)
				new /obj/item/stack/cable_coil (get_turf(holder), 5)
				holder.icon_state = "odysseus11"
		if(3)
			if(diff == FORWARD)
				usr.visible_message(
					"[usr] places a heatsink in the conduction port of the [holder]",
					"You place a heatsink in the conduction port of the [holder]."
				)
				holder.icon_state = "odysseus11"
			else
				usr.visible_message(
					"[usr] takes out a heat sink form [holder]", \
					"You disconnect and remove [holder] heat sink."
				)
				holder.icon_state = "odysseus13"
				new /obj/item/tool_upgrade/reinforcement/heatsink(get_turf(holder))
		if(2)
			if(diff == FORWARD)
				usr.visible_message(
					"[usr] secures the heat sink to the [holder].", \
					"You secure the heat sink to the [holder]."
				)
				holder.icon_state = "odysseus13"
			else
				var/obj/item/stack/material/plasteel/MS = new (get_turf(holder), 5)
				usr.visible_message(
					"[usr] pries [MS] from [holder].", \
					"You prie [MS] from [holder]."
				)
				holder.icon_state = "odysseus11"
		if(1)
			if(diff == FORWARD)
				usr.visible_message(
					"[usr] finishes construction on the exosuit.", \
					"You finish construction on the exosuit."
				)
				holder.icon_state = "odysseus14"
			else
				usr.visible_message(
					"[usr] begins to disassemble the [holder].", \
					"You begin to disassemble the [holder]."
				)
				holder.icon_state = "odysseus12"
	return 1
