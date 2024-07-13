
//PHAZON ===========================================================================
//Hardest mech to made on start do to its components being rather costly and unable to be given back making it a investement
/datum/construction/mecha/phazon_chassis
	steps = list(
		list(
			"key" = /obj/item/mecha_parts/part/phazon_torso,
			"desc" = "The chassis for a Phazon mech. Needs a Phazon head, torso, arms and legs, as well as an artificial bluespace crystal, \"Tesla\" overdrive chip, large atomic cell, and a super capacity SMES coil."
		), //1
		list(
			"key" = /obj/item/mecha_parts/part/phazon_left_arm,
			"desc" = "The chassis for a Phazon mech. Needs a Phazon head, torso, arms and legs, as well as an artificial bluespace crystal, \"Tesla\" overdrive chip, large atomic cell, and a super capacity SMES coil."
		), //2
		list(
			"key" = /obj/item/mecha_parts/part/phazon_right_arm,
			"desc" = "The chassis for a Phazon mech. Needs a Phazon head, torso, arms and legs, as well as an artificial bluespace crystal, \"Tesla\" overdrive chip, large atomic cell, and a super capacity SMES coil."
		), //3
		list(
			"key" = /obj/item/mecha_parts/part/phazon_left_leg,
			"desc" = "The chassis for a Phazon mech. Needs a Phazon head, torso, arms and legs, as well as an artificial bluespace crystal, \"Tesla\" overdrive chip, large atomic cell, and a super capacity SMES coil."
		), //4
		list(
			"key" = /obj/item/mecha_parts/part/phazon_right_leg,
			"desc" = "The chassis for a Phazon mech. Needs a Phazon head, torso, arms and legs, as well as an artificial bluespace crystal, \"Tesla\" overdrive chip, large atomic cell, and a super capacity SMES coil."
		), //5
		list(
			"key" = /obj/item/mecha_parts/part/phazon_head,
			"desc" = "The chassis for a Phazon mech. Needs a Phazon head, torso, arms and legs, as well as an artificial bluespace crystal, \"Tesla\" overdrive chip, large atomic cell, and a super capacity SMES coil."
		), // 6
		list(
			"key" = /obj/item/bluespace_crystal/artificial,
			"desc" = "The chassis for a Phazon mech. Needs a Phazon head, torso, arms and legs, as well as an artificial bluespace crystal, \"Tesla\" overdrive chip, large atomic cell, and a super capacity SMES coil."
		), // 7
		list(
			"key" = /obj/item/stock_parts/smes_coil/super_capacity,
			"desc" = "The chassis for a Phazon mech. Needs a Phazon head, torso, arms and legs, as well as an artificial bluespace crystal, \"Tesla\" overdrive chip, large atomic cell, and a super capacity SMES coil."
		), // 8
		list(
			"key" = /obj/item/gun_upgrade/mechanism/overdrive,
			"desc" = "The chassis for a Phazon mech. Needs a Phazon head, torso, arms and legs, as well as an artificial bluespace crystal, \"Tesla\" overdrive chip, large atomic cell, and a super capacity SMES coil."
		), // 9
		list(
			"key" = /obj/item/cell/large/moebius/nuclear,
			"desc" = "The chassis for a Phazon mech. Needs a Phazon head, torso, arms and legs, as well as an artificial bluespace crystal, \"Tesla\" overdrive chip, large atomic cell, and a super capacity SMES coil."
		) //10
	)

/datum/construction/mecha/phazon_chassis/spawn_result()
	var/obj/item/mecha_parts/chassis/const_holder = holder
	const_holder.construct = new /datum/construction/reversible/mecha/phazon(const_holder)
	const_holder.icon = 'icons/mecha/mech_construction.dmi'
	const_holder.icon_state = "phazon0"
	const_holder.density = 1
	spawn()
		qdel(src)


/datum/construction/reversible/mecha/phazon
	give_points = 50000 //How many points do we give?
	rnd_point_giver = TRUE //Do we even give points?

	result = /obj/mecha/combat/phazon
	steps = list(
		//1
		list("key" = QUALITY_WELDING,
			//"backkey" = QUALITY_BOLT_TURNING,
			"desc"="The exosuit is almost ready. All that is left is a little spot-welding to touch things up."),
		//2
		list("key" = /obj/item/hand_tele,
			//"backkey" = QUALITY_PRYING,
			"desc"="The external armor is installed. There is a slot in the cockpit for a NT BSD \"Jumper\", AKA a Hand Teleporter, to be inserted."),
		//3
		list("key" = QUALITY_BOLT_TURNING,
			//"backkey" = QUALITY_PRYING,
			"desc"="The external armor is installed on the chassis, but needs to be bolted down."),
		//4
		list("key" = /obj/item/mecha_parts/part/phazon_armor,
			//"backkey" = QUALITY_WELDING,
			"desc"="The internal armor is welded together, and the full chassis is ready for phazon armor plates."),
		//5
		list("key" = QUALITY_WELDING,
			//"backkey" = QUALITY_BOLT_TURNING,
			"desc"="The Internal armor is secured, but its components are segmented. They need to be welded together."),
		//6
		list("key" = QUALITY_BOLT_TURNING,
			//"backkey" = QUALITY_PRYING,
			"desc"="The circuit shielding has been placed in the chassis, but needs to be bolted down."),
		//7
		list("key" = /obj/item/stack/material/plasteel,
			//"backkey" = QUALITY_SCREW_DRIVING,
			"desc"="The ansible crystal is wired and the internal circuitry is complete. 5 sheets of plasteel are needed to shield the circuitry."),
		//8
		list("key" = QUALITY_SCREW_DRIVING,
			//"backkey" = QUALITY_WIRE_CUTTING,
			"desc"="The ansible crystal hangs loose in the chassis, and must be screwed into place."),
		//9
		list("key" = /obj/item/stack/cable_coil,
			//"backkey" = QUALITY_PRYING,
			"desc"="The ansible crystal is installed but requires additional wiring to power it."),
		//10
		list("key" = /obj/item/stock_parts/subspace/crystal,
			//"backkey" = QUALITY_SCREW_DRIVING,
			"desc"="The super capacitor is secured and the targeting system is complete. Next, the bluespace crystal must be subspace-tuned with an ansible crystal."),
		//12
		list("key" = QUALITY_SCREW_DRIVING,
			//"backkey" = QUALITY_PRYING,
			"desc"="The super capacitor hangs loose in the chassis, and must be screwed into place."),
		//12
		list("key" = /obj/item/stock_parts/capacitor/super,
			//"backkey" = QUALITY_SCREW_DRIVING,
			"desc"="The phasic scanner module module is secured, but requires a super capacitor."),
		//13
		list("key" = QUALITY_SCREW_DRIVING,
			//"backkey" = QUALITY_PRYING,
			"desc"="The phasic scanner module hangs loose in the chassis, and must be screwed into place."),
		//14
		list("key" = /obj/item/stock_parts/scanning_module/phasic,
			//"backkey" = QUALITY_SCREW_DRIVING,
			"desc"="The weapon control and targeting board is secured. It will require a phasic scanner module for identifying hostiles."),
		//15
		list("key" = QUALITY_SCREW_DRIVING,
			//"backkey" = QUALITY_PRYING,
			"desc"="The weapon control and targeting board hangs loose in the chassis, and must be screwed into place."),
		//16
		list("key" = /obj/item/circuitboard/mecha/targeting,
			//"backkey" = QUALITY_SCREW_DRIVING,
			"desc"="The Peripherals control board is secured. However, a weapon control and targeting board is also required for this chassis."),
		//17
		list("key" = QUALITY_SCREW_DRIVING,
			//"backkey" = QUALITY_PRYING,
			"desc"="The peripherals control board hangs loose in the chassis, and must be screwed into place."),
		//18
		list("key" = /obj/item/circuitboard/mecha/peripherals,
			//"backkey" = QUALITY_SCREW_DRIVING,
			"desc"="The central control board is secured. It requires a peripherals control board to function properly."),
		//19
		list("key" = QUALITY_SCREW_DRIVING,
			//"backkey" = QUALITY_PRYING,
			"desc"="The central control board hangs loose in the chassis, and must be screwed into place."),
		//20
		list("key" = /obj/item/circuitboard/mecha/main,
			//"backkey" = QUALITY_SCREW_DRIVING,
			"desc"="The wiring is adjusted, and the chassis is ready for a central control board."),
		//21
		list("key" = QUALITY_WIRE_CUTTING,
			//"backkey" = QUALITY_SCREW_DRIVING,
			"desc"="The wiring is connected, but needs to be organized with a wire-cutting tool."),
		//22
		list("key" = /obj/item/stack/cable_coil,
			//"backkey" = QUALITY_SCREW_DRIVING,
			"desc"="The electromagnetic actuators require wiring."),
		//23
		list("key" = QUALITY_SCREW_DRIVING,
			//"backkey" = QUALITY_BOLT_TURNING,
			"desc"="The electromagnetic actuators are unlinked and must be screwed together."),
		//24
		list("key" = QUALITY_BOLT_TURNING,
			"desc"="The electromagnetic actuators hang loose on the chassis and need to be bolted down.")
		)

/datum/construction/reversible/mecha/phazon/custom_action(index, diff, atom/used_atom, mob/user)
	if(!..())
		return 0

	if(!usr.stat_check(STAT_MEC, STAT_LEVEL_ADEPT))
		to_chat(usr, SPAN_WARNING("You lack the mechanical knowledge to do this!"))
		return

	switch(index)
		if(24)
			usr.visible_message(
				"[usr] secures the electromagnetic actuators in the [holder].", \
				"You secure the electromagnetic actuators in the [holder]."
			)
			holder.icon_state = "phazon1"
		if(23)
			if(diff == FORWARD)
				usr.visible_message(
					"[usr] connects the electromagnetic actuators in the [holder].", \
					"You connect the electromagnetic actuators in the [holder]."
				)
				holder.icon_state = "phazon2"
			else
				usr.visible_message(
					"[usr] disconnects the [holder] hydraulic systems", \
					"You disconnect [holder] hydraulic systems."
				)
				holder.icon_state = "phazon0"
		if(22)
			if(diff == FORWARD)
				usr.visible_message(
					"[usr] adds the wiring to the [holder].", \
					"You add the wiring to the [holder]."
				)
				holder.icon_state = "phazon3"
			else
				usr.visible_message(
					"[usr] deactivates the [holder] hydraulic systems.", \
					"You deactivate [holder] hydraulic systems."
				)
				holder.icon_state = "phazon1"
		if(21)
			if(diff == FORWARD)
				usr.visible_message(
					"[usr] organizes the wiring in the [holder].", \
					"You organize the wiring in the [holder]."
				)
				holder.icon_state = "phazon4"
			else
				usr.visible_message(
					"[usr] removes the wiring from the [holder].", \
					"You remove the wiring from [holder]."
				)
				new /obj/item/stack/cable_coil (get_turf(holder), 5)
				holder.icon_state = "phazon2"
		if(20)
			if(diff == FORWARD)
				usr.visible_message(
					"[usr] installs the central control board into the [holder].",  \
					"You install the central control board into the [holder]."
				)
				qdel(used_atom)
				holder.icon_state = "phazon5"
			else
				usr.visible_message(
					"[usr] disconnects the wiring of the [holder].", \
					"You disconnect the wiring of [holder]."
				)
				holder.icon_state = "phazon3"
		if(19)
			if(diff == FORWARD)
				usr.visible_message(
					"[usr] secures the central control board inside the [holder].", \
					"You secure the central control board inside the [holder]."
				)
				holder.icon_state = "phazon6"
			else
				usr.visible_message(
					"[usr] removes the central control module from the [holder].", \
					"You remove the central computer mainboard from [holder]."
				)
				new /obj/item/circuitboard/mecha/main(get_turf(holder))
				holder.icon_state = "phazon4"
		if(18)
			if(diff == FORWARD)
				usr.visible_message(
					"[usr] installs the peripherals control module into the [holder].", \
					"You install the peripherals control board into the [holder]."
				)
				qdel(used_atom)
				holder.icon_state = "phazon7"
			else
				usr.visible_message(
					"[usr] unfastens the mainboard.", \
					"You unfasten the mainboard."
				)
				holder.icon_state = "phazon5"
		if(17)
			if(diff == FORWARD)
				usr.visible_message(
					"[usr] secures the peripherals control board inside the [holder].", \
					"You secure the peripherals control board inside the [holder]."
				)
				holder.icon_state = "phazon8"
			else
				usr.visible_message(
					"[usr] removes the peripherals control module from the [holder].", \
					"You remove the peripherals control module from [holder]."
				)
				new /obj/item/circuitboard/mecha/peripherals(get_turf(holder))
				holder.icon_state = "phazon6"
		if(16)
			if(diff == FORWARD)
				usr.visible_message(
					"[usr] installs the weapon control and targeting board into the [holder].", \
					"You install the weapon control and targeting board into the [holder]."
				)
				qdel(used_atom)
				holder.icon_state = "phazon9"
			else
				usr.visible_message(
					"[usr] unfastens the peripherals control module.", \
					"You unfasten the peripherals control module."
				)
				holder.icon_state = "phazon7"
		if(15)
			if(diff == FORWARD)
				usr.visible_message(
					"[usr] secures the weapon control and targeting board inside the [holder].", \
					"You secure the weapon control and targeting board inside the [holder]."
				)
				holder.icon_state = "phazon10"
			else
				usr.visible_message(
					"[usr] removes the weapon control module from the [holder].", \
					"You remove the weapon control module from [holder]."
				)
				new /obj/item/circuitboard/mecha/targeting(get_turf(holder))
				holder.icon_state = "phazon8"
		if(14)
			if(diff == FORWARD)
				usr.visible_message(
					"[usr] installs [used_atom] into the [holder].", \
					"You install the [used_atom] into [holder]."
				)
				qdel(used_atom)
				holder.icon_state = "phazon11"
			else
				usr.visible_message(
					"[usr] unfastens the weapon control module.", \
					"You unfasten the weapon control module."
				)
				holder.icon_state = "phazon9"
		if(13)
			if(diff == FORWARD)
				var/obj/item/stock_parts/scanning_module/S = locate() in holder
				if(!S)
					S = "phasic scanner module"
				usr.visible_message(
					"[usr] secures the [S] into the [holder].", \
					"You secure the [S] into the [holder]."
				)
				holder.icon_state = "phazon12"
			else
				var/obj/item/stock_parts/scanning_module/S = locate() in holder
				if(S)
					S.forceMove(get_turf(holder))
				else
					S = "phasic scanner module"
				usr.visible_message(
					"[usr] removes the [S] from [holder].", \
					"You remove the [S] from [holder]."
				)
				holder.icon_state = "phazon10"
		if(12)
			if(diff == FORWARD)
				usr.visible_message(
					"[usr] installs the [used_atom] into the [holder].", \
					"You install the [used_atom] into [holder]."
				)
				qdel(used_atom)
				holder.icon_state = "phazon13"
			else
				var/obj/item/stock_parts/scanning_module/S = locate() in holder
				if(!S)
					S = "phasic scanner module"
				usr.visible_message(
					"[usr] unfastens the [S].", \
					"You unfasten the [S]."
				)
				holder.icon_state = "phazon11"
		if(11)
			if(diff == FORWARD)
				var/obj/item/stock_parts/capacitor/C = locate() in holder
				if(!C)
					C = "super capacitor"
				usr.visible_message(
					"[usr] secures the [C] into the [holder].", \
					"You secure the [C] into the [holder]."
				)
				holder.icon_state = "phazon14"
			else
				var/obj/item/stock_parts/capacitor/C = locate() in holder
				if(C)
					C.forceMove(get_turf(holder))
				else
					C = "super capacitor"
				usr.visible_message(
					"[usr] removes the [C] from [holder].", \
					"You remove the [C] from [holder]."
				)
				holder.icon_state = "phazon12"
		if(10)
			if(diff == FORWARD)
				usr.visible_message(
					"[usr] installs the ansible crystal into the [holder].", \
					"You install the ansible crystal into the [holder]"
				)
				qdel(used_atom)
				holder.icon_state = "phazon15"
			else
				var/obj/item/stock_parts/capacitor/C = locate() in holder
				if(!C)
					C = "super capacitor"
				usr.visible_message(
					"[usr] unfastens the [C].", \
					"You unfasten the [C]."
				)
				holder.icon_state = "phazon13"
		if(9)
			if(diff == FORWARD)
				usr.visible_message(
					"[usr] connects the ansible crystal inside the [holder].", \
					"You connect the ansible crystal inside the [holder]."
				)
				holder.icon_state = "phazon16"
			else
				usr.visible_message(
					"[usr] removes the ansible crystal from the [holder].", \
					"You remove the ansible crystal from the [holder]."
				)
				new /obj/item/stock_parts/subspace/crystal(get_turf(holder))
				holder.icon_state = "phazon14"
		if(8)
			if(diff == FORWARD)
				usr.visible_message(
					"[usr] adds wiring for the ansible crystal inside the [holder].", \
					"You add wiring for the ansible crystal inside the [holder]."
				)
				holder.icon_state = "phazon17"
			else
				usr.visible_message(
					"[usr] disconnects the ansible crystal from the [holder].", \
					"You disconnect the ansible crystal from the [holder]."
				)
				holder.icon_state = "phazon15"
		if(7)
			if(diff == FORWARD)
				usr.visible_message(
					"[usr] installs the circuit shielding inside the [holder].", \
					"You install the circuit shielding inside the [holder]."
				)
				holder.icon_state = "phazon18"
			else
				usr.visible_message(
					"[usr] disengages the ansible crystal.", \
					"You disengage the ansible crystal."
				)
				holder.icon_state = "phazon16"
		if(6)
			if(diff == FORWARD)
				usr.visible_message(
					"[usr] bolts down the circuit shielding on the [holder].", \
					"You bolt down the circuit shielding on the [holder]."
				)
				holder.icon_state = "phazon19"
			else
				usr.visible_message(
					"[usr] pries the phase armor layer from the [holder].", \
					"You pry the phase armor layer from the [holder]."
				)
				new /obj/item/stack/material/plasteel (get_turf(holder), 5)
				holder.icon_state = "phazon17"
		if(5)
			if(diff == FORWARD)
				usr.visible_message(
					"[usr] welds together the internal armor of the [holder].", \
					"You weld together the internal armor of the [holder]."
				)
				holder.icon_state = "phazon20"
			else
				usr.visible_message(
					"[usr] unfastens the phase armor layer.", \
					"You unfasten the phase armor layer."
				)
				holder.icon_state = "phazon18"
		if(4)
			if(diff == FORWARD)
				usr.visible_message(
					"[usr] installs Phazon Armor Plates on the [holder].", \
					"You install Phazon Armor Plates on the [holder]."
				)
				qdel(used_atom)
				holder.icon_state = "phazon21"
			else
				usr.visible_message(
					"[usr] cuts phase armor layer from the [holder].", \
					"You cut phase armor layer from the [holder]."
				)
				holder.icon_state = "phazon19"
		if(3)
			if(diff == FORWARD)
				usr.visible_message(
					"[usr] secures the Phazon armor plates on the [holder].", \
					"You secure the Phazon armor plates on the [holder]."
				)
				holder.icon_state = "phazon22"
			else
				usr.visible_message(
					"[usr] pries Phazon Armor Plates from the [holder].", \
					"You pry Phazon Armor Plates from the [holder]."
				)
				new /obj/item/mecha_parts/part/phazon_armor(get_turf(holder))
				holder.icon_state = "phazon20"
		if(2)
			if(diff == FORWARD)
				if(diff == FORWARD)
					usr.visible_message(
						"[usr] carefully slots the hand teleporter into the cockpit of the [holder].", \
						"You carefully slots the hand teleporter into the cockpit of the [holder]."
					)
				qdel(used_atom)
			else
				usr.visible_message(
					"[usr] unfastens Phazon Armor Plates.", \
					"You unfasten Phazon Armor Plates."
				)
				holder.icon_state = "phazon21"
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
				holder.icon_state = "phazon22"
	return 1
