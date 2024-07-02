
//IVAN ===========================================================================

/datum/construction/mecha/ivan_chassis
	steps = list(
		list(
			"key" = /obj/item/mecha_parts/part/ivan_torso,
			"desc" = "A chassis or case for a Ivan mech, needs a Ivan torso, arms and legs."
		), // 1
		list(
			"key" = /obj/item/mecha_parts/part/ivan_left_arm,
			"desc" = "A chassis or case for a Ivan mech, needs a Ivan torso, arms and legs."
		), // 2
		list(
			"key" = /obj/item/mecha_parts/part/ivan_right_arm,
			"desc" = "A chassis or case for a Ivan mech, needs a Ivan torso, arms and legs."
		), // 3
		list(
			"key" = /obj/item/mecha_parts/part/ivan_left_leg,
			"desc" = "A chassis or case for a Ivan mech, needs a Ivan torso, arms and legs."
		), // 4
		list(
			"key" = /obj/item/mecha_parts/part/ivan_right_leg,
			"desc" = "A chassis or case for a Ivan mech, needs a Ivan torso, arms and legs."
		) // 5
	)

/datum/construction/mecha/ivan_chassis/spawn_result()
	var/obj/item/mecha_parts/chassis/const_holder = holder
	const_holder.construct = new /datum/construction/reversible/mecha/ivan(const_holder)
	const_holder.icon = 'icons/mecha/mech_construction.dmi'
	const_holder.icon_state = "ripley0"
	const_holder.density = 1
	const_holder.cut_overlays()
	spawn()
		qdel(src)


/datum/construction/reversible/mecha/ivan
	give_points = 5000 //How many points do we give?
	rnd_point_giver = TRUE //Do we even give points?

	result = /obj/mecha/working/ivan
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
		list("key"=/obj/item/stack/material/glass,
			//"backkey"=QUALITY_WELDING,
			"desc"="External armor is installed. 5 sheets of glass are needed for the windshield."),
		//4
		list("key"=QUALITY_BOLT_TURNING,
			//"backkey"=QUALITY_PRYING,
			"desc"="The radio hangs loose on the chassis and needs to be bolted down."),
		//5
		list("key"=/obj/item/robot_parts/robot_component/radio,
			//"backkey"=QUALITY_PRYING,
			"desc"="The mech is missing its radio."),
		//6
		list("key"=/obj/item/robot_parts/robot_component/armour/mkii,
			//"backkey"=QUALITY_WELDING,
			"desc"="The joint protectors are welded. A Mark II armour plating is needed as the external armor."),
		//7
		list("key"=QUALITY_WELDING,
			//"backkey"=QUALITY_BOLT_TURNING,
			"desc"="The plastic joint protectors need to be welded into place."),
		//8
		list("key"=/obj/item/stack/material/plastic,
			//"backkey"=QUALITY_PRYING,
			"desc"="Internal armor is secured. 5 sheets of plastic are needed to cover gaps in the joints."),
		//9
		list("key"=QUALITY_BOLT_TURNING,
			//"backkey"=QUALITY_PRYING,
			"desc"="The circuit shielding has been placed in the chassis, but needs to be bolted down."),
		//10
		list("key"=/obj/item/stack/material/steel,
			//"backkey"=QUALITY_SCREW_DRIVING,
			"desc"="The internal circutry is installed. 5 sheets of steel are needed to shield it."),
		//11
		list("key"=QUALITY_SCREW_DRIVING,
			//"backkey"=QUALITY_PRYING,
			"desc"="The peripherals control board hangs loose in the chassis, and must be screwed into place."),
		//12
		list("key"=/obj/item/circuitboard/mecha/peripherals,
			//"backkey"=QUALITY_SCREW_DRIVING,
			"desc"="The central control board is secured. It requires a peripherals control board to function properly."),
		//13
		list("key"=QUALITY_SCREW_DRIVING,
			//"backkey"=QUALITY_PRYING,
			"desc"="The central control board hangs loose in the chassis, and must be screwed into place."),
		//14
		list("key"=/obj/item/circuitboard/mecha/main,
			//"backkey"=QUALITY_SCREW_DRIVING,
			"desc"="The hydraulic wiring is adjusted, and the chassis is ready for a central control board."),
		//15
		list("key"=QUALITY_WIRE_CUTTING,
			//"backkey"=QUALITY_SCREW_DRIVING,
			"desc"="The wiring is connected, but needs to be organized with a wire-cutting tool."),
		//16
		list("key"=/obj/item/stack/cable_coil,
			//"backkey"=QUALITY_SCREW_DRIVING,
			"desc"="The hydraulic systems on the chassis requires wiring."),
		//17
		list("key"=QUALITY_SCREW_DRIVING,
			//"backkey"=QUALITY_BOLT_TURNING,
			"desc"="The components are bolted down, but they must be screwed into place."),
		//18
		list("key"=QUALITY_BOLT_TURNING,
			//"backkey"=QUALITY_PRYING,
			"desc"="The various parts hangs loose from the chassis, they need to be bolted down."),
		//19
		list("key"=/obj/item/robot_parts/robot_component/diagnosis_unit,
			//"backkey"=QUALITY_PRYING,
			"desc"="The mech is missing its diagnosis unit."),
		//20
		list("key"=/obj/item/robot_parts/robot_component/actuator,
			//"backkey"=QUALITY_PRYING,
			"desc"="With the camera added, it can now have actuators inserted."),
		//21
		list("key"=/obj/item/robot_parts/robot_component/camera,
			//"backkey"=QUALITY_PRYING,
			"desc"="The basic chassis is assembled. A camera is needed for the operator to see."),
		//22
		list("key"=QUALITY_SCREW_DRIVING,
			"desc"="The case of the chassis is screwed shut. It must be unscrewed to continue.") //So we can successfully keyback to this for getting back tool mods
	)


/datum/construction/reversible/mecha/ivan/custom_action(index, diff, atom/used_atom, mob/user)
	if(!..())
		return 0

	if(!usr.stat_check(STAT_MEC, STAT_LEVEL_ADEPT))
		to_chat(usr, SPAN_WARNING("You lack the mechanical knowledge to do this!"))
		return

	switch(index)
		if(22)
			usr.visible_message(
				"[usr] opens the internal cover of the [holder]", \
				"You open the internal cover of the [holder]."
			)
			holder.icon_state = "ripley1"
		if(21)
			if(diff == FORWARD)
				usr.visible_message(
					"[usr] adds a camera to the [holder].", \
					"You add a camera to the [holder]."
				)
				holder.icon_state = "ripley0"
			else
				usr.visible_message(
					"[usr] removes the camera from the [holder].", \
					"You remove the camera from the [holder]."
				)
				new /obj/item/robot_parts/robot_component/camera(get_turf(holder))
				holder.icon_state = "ripley0"
		if(20)
			if(diff == FORWARD)
				usr.visible_message(
					"[usr] adds actuators to the [holder].", \
					"You add actuators to the [holder]."
				)
				holder.icon_state = "ripley1"
			else
				usr.visible_message(
					"[usr] takes out the [holder]'s actuators", \
					"You disconnect and remove the [holder]'s actuators."
				)
				new /obj/item/robot_parts/robot_component/actuator(get_turf(holder))
				holder.icon_state = "ripley0"
		if(19)
			if(diff == FORWARD)
				usr.visible_message(
					"[usr] installs a diagnosis unit in the [holder].", \
					"You install a diagnosis unit in the [holder]."
				)
				holder.icon_state = "ripley1"
			else
				usr.visible_message(
					"[usr] removes the diagnosis unit from the [holder].", \
					"You disconnect and remove the diagnosis unit from the [holder]."
				)
				new /obj/item/robot_parts/robot_component/diagnosis_unit(get_turf(holder))
				holder.icon_state = "ripley0"
		if(18)
			if(diff == FORWARD)
				usr.visible_message(
					"[usr] bolt various components inside the [holder].", \
					"You bolt various components inside the [holder]."
				)
				holder.icon_state = "ripley1"
			else
				usr.visible_message(
					"[usr] unbolt the [holder]'s various components", \
					"You unbolt the [holder]'s various components."
				)
				holder.icon_state = "ripley0"
		if(17)
			if(diff == FORWARD)
				usr.visible_message(
					"[usr] secure the various components inside the [holder].", \
					"You secure the various components inside the [holder]."
				)
				holder.icon_state = "ripley2"
			else
				usr.visible_message(
					"[usr] unsecure the various components inside the [holder].", \
					"You unsecure the various components inside the [holder]."
				)
				holder.icon_state = "ripley0"
		if(16)
			if(diff == FORWARD)
				usr.visible_message(
					"[usr] adds wiring to the [holder]", \
					"You add wiring to the [holder]."
				)
				holder.icon_state = "ripley3"
			else
				usr.visible_message(
					"[usr] removes the [holder]'s wiring", \
					"You remove the [holder]'s wiring."
				)
				holder.icon_state = "ripley1"
		if(15)
			if(diff == FORWARD)
				usr.visible_message(
					"[usr] organizes the wiring in the [holder].", \
					"You organize the wiring in the [holder]."
				)
				holder.icon_state = "ripley4"
			else
				usr.visible_message(
					"[usr] unsets the wiring from the [holder].", \
					"You unset the wiring from the [holder]."
				)
				new /obj/item/stack/cable_coil (get_turf(holder), 5)
				holder.icon_state = "ripley2"
		if(14)
			if(diff == FORWARD)
				usr.visible_message(
					"[usr] installs the central control board into the [holder].", \
					"You install the central control board into the [holder]."
				)
				holder.icon_state = "ripley5"
			else
				usr.visible_message(
					"[usr] removes the central control board from the [holder].", \
					"You remove the central control board from the [holder]."
				)
				new /obj/item/circuitboard/mecha/main(get_turf(holder))
				holder.icon_state = "ripley3"
		if(13)
			if(diff == FORWARD)
				usr.visible_message(
					"[usr] secures the central control board inside the [holder].", \
					"You secure the central control board inside the [holder]."
				)
				holder.icon_state = "ripley6"
			else
				usr.visible_message(
					"[usr] unsecures the central control board inside the [holder].", \
					"You unsecure the central control board inside the [holder]."
				)
				holder.icon_state = "ripley4"
		if(12)
			if(diff == FORWARD)
				usr.visible_message(
					"[usr] installs the peripherals control board into the [holder].", \
					"You install the peripherals control board into the [holder]."
				)
				holder.icon_state = "ripley7"
			else
				usr.visible_message(
					"[usr] removes the peripherals control board from the [holder].", \
					"You remove the peripherals control board from the [holder]."
				)
				new /obj/item/circuitboard/mecha/peripherals(get_turf(holder))
				holder.icon_state = "ripley5"
		if(11)
			if(diff == FORWARD)
				usr.visible_message(
					"[usr] secures the peripherals control board inside the [holder].", \
					"You secure the peripherals control board inside the [holder]."
				)
				holder.icon_state = "ripley8"
			else
				usr.visible_message(
					"[usr] unsecures the peripherals control board inside the [holder].", \
					"You unsecure the peripherals control board inside the [holder]."
				)
				holder.icon_state = "ripley6"
		if(10)
			if(diff == FORWARD)
				usr.visible_message(
					"[usr] installs the circuit shielding inside the [holder].", \
					"You install the circuit shielding inside the [holder]."
				)
				holder.icon_state = "ripley9"
			else
				usr.visible_message(
					"[usr] pries the circuit shielding from the [holder].", \
					"You pry the circuit shielding from the [holder]."
				)
				new /obj/item/stack/material/steel (get_turf(holder), 5)
				holder.icon_state = "ripley7"
		if(9)
			if(diff == FORWARD)
				usr.visible_message(
					"[usr] bolts down the circuit shielding on the [holder].", \
					"You bolt down the circuit shielding on the [holder]."
				)
				holder.icon_state = "ripley10"
			else
				usr.visible_message(
					"[usr] unsecures the circuit shielding on the [holder].", \
					"You unsecure the circuit shielding on the [holder]."
				)
				holder.icon_state = "ripley8"
		if(8)
			if(diff == FORWARD)
				usr.visible_message(
					"[usr] adds plastic joint protectors to the [holder].", \
					"You add plastic joint protectors to the [holder]."
				)
				holder.icon_state = "ripley10"
			else
				usr.visible_message(
					"[usr] pries plastic joint protectors from the [holder].", \
					"You pry plastic joint protectors from the [holder]."
				)
				new /obj/item/stack/material/plastic (get_turf(holder), 5)
				holder.icon_state = "ripley8"
		if(7)
			if(diff == FORWARD)
				usr.visible_message(
					"[usr] welds the plastic joint protectors onto the [holder].", \
					"You weld the plastic joint protectors onto the [holder]."
				)
				holder.icon_state = "ripley11"
			else
				usr.visible_message(
					"[usr] cuts the plastic joint protectors from the [holder].", \
					"You cut the plastic joint protectors from the [holder]."
				)
				holder.icon_state = "ripley9"
		if(6)
			if(diff == FORWARD)
				usr.visible_message(
					"[usr] installs an external armor layer to the [holder].", \
					"You install an external armor layer to the [holder]."
				)
				holder.icon_state = "ripley12"
			else
				usr.visible_message(
					"[usr] removes the external armor layer from the [holder].", \
					"You remove the external armor layer from the [holder]."
				)
				new /obj/item/stack/material/plasteel (get_turf(holder), 5)
				holder.icon_state = "ripley10"
		if(5)
			if(diff == FORWARD)
				usr.visible_message(
				"[usr] places a radio in the conduction port of the [holder]",
				"You place a radio in the conduction port of the [holder]."
				)
				holder.icon_state = "ripley13"
			else
				usr.visible_message(
					"[usr] removes the radio from the conduction port of the [holder]", \
					"You remove the radio from the conduction port of the [holder]."
				)
				new /obj/item/robot_parts/robot_component/radio(get_turf(holder))
				holder.icon_state = "ripley11"
		if(4)
			if(diff == FORWARD)
				usr.visible_message(
					"[usr] secures the radio to the [holder].", \
					"You secure the radio to the [holder]."
				)
				holder.icon_state = "fireripley11"
			else
				usr.visible_message(
					"[usr] unsecures the radio from the [holder].", \
					"You unsecure the radio from the [holder]."
				)
				holder.icon_state = "ripley12"
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
				new /obj/item/stack/material/glass (get_turf(holder), 5)
				holder.icon_state = "ripley12"

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
				holder.icon_state = "ripley12"

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
				holder.icon_state = "ripley12"
	return 1
