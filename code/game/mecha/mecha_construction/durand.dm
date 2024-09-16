
//DURAND ===========================================================================

/datum/construction/mecha/durand_chassis
	steps = list(
		list(
			"key" = /obj/item/mecha_parts/part/durand_torso,
			"desc" = "The chassis for a Durand mech. Needs a Durand head, torso, arms and legs, as well as magboots and four brace bars."
		),//1
		list(
			"key" = /obj/item/mecha_parts/part/durand_left_arm,
			"desc" = "The chassis for a Durand mech. Needs a Durand head, torso, arms and legs, as well as magboots and four brace bars."
		),//2
		list(
			"key" = /obj/item/mecha_parts/part/durand_right_arm,
			"desc" = "The chassis for a Durand mech. Needs a Durand head, torso, arms and legs, as well as magboots and four brace bars."
		),//3
		list(
			"key" = /obj/item/mecha_parts/part/durand_left_leg,
			"desc" = "The chassis for a Durand mech. Needs a Durand head, torso, arms and legs, as well as magboots and four brace bars."
		),//4
		list(
			"key" = /obj/item/mecha_parts/part/durand_right_leg,
			"desc" = "The chassis for a Durand mech. Needs a Durand head, torso, arms and legs, as well as magboots and four brace bars."
		),//5
		list(
			"key" = /obj/item/mecha_parts/part/durand_head,
			"desc" = "The chassis for a Durand mech. Needs a Durand head, torso, arms and legs, as well as magboots and four brace bars."
		),//6
		list(
			"key" = /obj/item/clothing/shoes/magboots,
			"desc" = "The chassis for a Durand mech. Needs a Durand head, torso, arms and legs, as well as magboots and four brace bars."
		),//7
		list(
			"key" = /obj/item/tool_upgrade/reinforcement/stick,
			"desc" = "The chassis for a Durand mech. Needs a Durand head, torso, arms and legs, as well as magboots and four brace bars."
		),//8
		list(
			"key" = /obj/item/tool_upgrade/reinforcement/stick,
			"desc" = "The chassis for a Durand mech. Needs a Durand head, torso, arms and legs, as well as magboots and four brace bars."
		),//9
		list(
			"key" = /obj/item/tool_upgrade/reinforcement/stick,
			"desc" = "The chassis for a Durand mech. Needs a Durand head, torso, arms and legs, as well as magboots and four brace bars."
		),//10
		list(
			"key" = /obj/item/tool_upgrade/reinforcement/stick,
			"desc" = "The chassis for a Durand mech. Needs a Durand head, torso, arms and legs, as well as magboots and four brace bars."
		)//11
	)

/datum/construction/mecha/durand_chassis/spawn_result()
	var/obj/item/mecha_parts/chassis/const_holder = holder
	const_holder.construct = new /datum/construction/reversible/mecha/durand(const_holder)
	const_holder.icon = 'icons/mecha/mech_construction.dmi'
	const_holder.icon_state = "durand0"
	const_holder.density = 1
	spawn()
		qdel(src)


/datum/construction/reversible/mecha/durand
	give_points = 20000 //How many points do we give?
	rnd_point_giver = TRUE //Do we even give points?

	result = /obj/mecha/combat/durand
	steps = list(
		//1
		list("key"=QUALITY_WELDING,
			//"backkey"=QUALITY_BOLT_TURNING,
			"desc"="The exosuit is almost ready. All that is left is a little spot-welding to touch things up."),
		//2
		list("key"=/obj/item/tool_upgrade/reinforcement/plating,
			//"backkey"=QUALITY_PRYING,
			"desc"="The windshield is secured in place. Reinforced plating is needed to protect cockpit's hatch."),
		//3
		list("key"=QUALITY_SCREW_DRIVING,
			//"backkey"=QUALITY_PRYING,
			"desc"="The windshield hangs loose in the chassis, and must be screwed into place."),
		//4
		list("key"=/obj/item/stack/material/glass/reinforced,
			//"backkey"=QUALITY_WELDING,
			"desc"="External armor is installed. 5 sheets of reinforced glass are needed for the windshield."),
		//5
		list("key"=QUALITY_BOLT_TURNING,
			//"backkey"=QUALITY_PRYING,
			"desc"="The external armor is installed on the chassis, but needs to be bolted down."),
		//6
		list("key"=/obj/item/mecha_parts/part/durand_armour,
			//"backkey"=QUALITY_WELDING,
			"desc"="The internal armor is welded together, and the full chassis is ready for durand armour plates."),
		//7
		list("key"=QUALITY_WELDING,
			//"backkey"=QUALITY_BOLT_TURNING,
			"desc"="The Internal armor is secured, but its components are segmented. They need to be welded together."),
		//8
		list("key"=/obj/item/mecha_parts/mecha_equipment/armor_booster/anticcw_armor_booster,
			//"backkey"=QUALITY_PRYING,
			"desc"="The RW armor booster has been secured in place. A CCW armor booster is required for additional protection."),
		//9
		list("key"=QUALITY_BOLT_TURNING,
			//"backkey"=QUALITY_PRYING,
			"desc"="The RW armor booster has been placed in the chassis, but needs to be bolted down."),
		//10
		list("key"=/obj/item/mecha_parts/mecha_equipment/armor_booster/antiproj_armor_booster,
			//"backkey"=QUALITY_PRYING,
			"desc"="With the circuit shielding secured, the entire chest-piece needs a RW armor booster for further protection."),
		//11
		list("key"=QUALITY_BOLT_TURNING,
			//"backkey"=QUALITY_PRYING,
			"desc"="The circuit shielding has been placed in the chassis, but needs to be bolted down."),
		//12
		list("key"=/obj/item/stack/material/plasteel,
			//"backkey"=QUALITY_SCREW_DRIVING,
			"desc"="The advanced capacitor is secured and the internal circutry is complete. 5 sheets of plasteel are needed to shield the circuitry."),
		//13
		list("key"=QUALITY_SCREW_DRIVING,
			//"backkey"=QUALITY_PRYING,
			"desc"="The advanced capacitor hangs loose in the chassis, and must be screwed into place."),
		//14
		list("key"=/obj/item/stock_parts/capacitor,
			"rating" = 2,
			//"backkey"=QUALITY_SCREW_DRIVING,
			"desc"="The advanced scanner module module is secured, but requires an advanced capacitor."),
		//15
		list("key"=QUALITY_SCREW_DRIVING,
			//"backkey"=QUALITY_PRYING,
			"desc"="The advanced scanner module hangs loose in the chassis, and must be screwed into place."),
		//16
		list("key"=/obj/item/stock_parts/scanning_module,
			"rating" = 2,
			//"backkey"=QUALITY_SCREW_DRIVING,
			"desc"="The weapon control and targeting board is secured. It will require an advanced scanner module for identifying hostiles."),
		//17
		list("key"=QUALITY_SCREW_DRIVING,
			//"backkey"=QUALITY_PRYING,
			"desc"="The weapon control and targeting board hangs loose in the chassis, and must be screwed into place."),
		//18
		list("key"=/obj/item/circuitboard/mecha/targeting,
			//"backkey"=QUALITY_SCREW_DRIVING,
			"desc"="The Peripherals control board is secured. However, a weapon control and targeting board is also required for this chassis."),
		//19
		list("key"=QUALITY_SCREW_DRIVING,
			//"backkey"=QUALITY_PRYING,
			"desc"="The peripherals control board hangs loose in the chassis, and must be screwed into place."),
		//20
		list("key"=/obj/item/circuitboard/mecha/peripherals,
			//"backkey"=QUALITY_SCREW_DRIVING,
			"desc"="The central control board is secured. It requires a peripherals control board to function properly."),
		//21
		list("key"=QUALITY_SCREW_DRIVING,
			//"backkey"=QUALITY_PRYING,
			"desc"="The central control board hangs loose in the chassis, and must be screwed into place."),
		//22
		list("key"=/obj/item/circuitboard/mecha/main,
			//"backkey"=QUALITY_SCREW_DRIVING,
			"desc"="The hydraulic wiring is adjusted, and the chassis is ready for a central control board."),
		//23
		list("key"=QUALITY_WIRE_CUTTING,
			//"backkey"=QUALITY_SCREW_DRIVING,
			"desc"="The wiring is connected, but needs to be organized with a wire-cutting tool."),
		//24
		list("key"=/obj/item/stack/cable_coil,
			//"backkey"=QUALITY_SCREW_DRIVING,
			"desc"="The hydraulic systems on the chassis requires wiring."),
		//25
		list("key"=QUALITY_SCREW_DRIVING,
			//"backkey"=QUALITY_BOLT_TURNING,
			"desc"="The hydraulic systems are bolted down, but the interconnected components must be screwed into place."),
		//26
		list("key"=QUALITY_BOLT_TURNING,
			"desc"="The high power motor hangs loose from the chassis, it needs to be bolted down."),
		//27
		list("key"=/obj/item/tool_upgrade/productivity/motor,
			//"backkey"=QUALITY_PRYING,
			"desc"="The hydraulic circuits require a high power motor to actuate."),
		//28
		list("key"=/obj/item/tool_upgrade/augment/hydraulic,
			//"backkey"=QUALITY_PRYING,
			"desc"="With the heavy cell mount added, it can now have hydraulic circuits inserted."),
		//29
		list("key"=/obj/item/tool_upgrade/augment/cell_mount,
			//"backkey"=QUALITY_PRYING,
			"desc"="The basic chassis is assembled. A heavy cell mount is needed to power it."),
		//30
		list("key"=QUALITY_SCREW_DRIVING,
			"desc"="The case of the chassis screwed shut. It must be unscrewed to continue.") //So we can successfully keyback to this for getting back tool mods
	)

/datum/construction/reversible/mecha/durand/custom_action(index, diff, atom/used_atom, mob/user)
	. = ..()
	if(!.)
		return

	if(!usr.stat_check(STAT_MEC, STAT_LEVEL_ADEPT))
		to_chat(usr, SPAN_WARNING("You lack the mechanical knowledge to do this!"))
		return

	switch(index)
		if(30)
			usr.visible_message(
				"[usr] opens the internal cover of the [holder]", \
				"You open the internal cover of the [holder]."
			)
			holder.icon_state = "durand1"
		if(29)
			if(diff == FORWARD)
				usr.visible_message(
					"[usr] adds a heavy cell mount to the [holder].", \
					"You add a heavy cell mount to the [holder]."
				)
				holder.icon_state = "durand0"
			else
				usr.visible_message(
					"[usr] removes the heavy cell mount from the [holder].", \
					"You remove the heavy cell mount from the [holder]."
				)
				holder.icon_state = "durand0"
				new /obj/item/tool_upgrade/augment/cell_mount(get_turf(holder))
		if(28)
			if(diff == FORWARD)
				usr.visible_message(
					"[usr] adds a hydraulic system to the [holder].", \
					"You add a hydraulic system to the [holder]."
				)
				holder.icon_state = "durand1"
			else
				usr.visible_message(
					"[usr] takes out the [holder]'s hydraulic systems", \
					"You disconnect and remove the [holder]'s hydraulic systems."
				)
				holder.icon_state = "durand0"
				new /obj/item/tool_upgrade/augment/hydraulic(get_turf(holder))
		if(27)
			if(diff == FORWARD)
				usr.visible_message(
					"[usr] connects a high powered motor to the [holder].", \
					"You connect a high powered motor to the [holder]."
				)
				holder.icon_state = "durand1"
			else
				usr.visible_message(
					"[usr] removes a high powered motor from the [holder].", \
					"You disconnect and remove a high powered motor from the [holder]."
				)
				holder.icon_state = "durand0"
				new /obj/item/tool_upgrade/productivity/motor(get_turf(holder))
		if(26)
			if(diff == FORWARD)
				usr.visible_message(
					"[usr] secures hydraulic systems inside the [holder].", \
					"You secure hydraulic systems inside the [holder]."
				)
				holder.icon_state = "durand1"
			else
				usr.visible_message(
					"[usr] unsecures the [holder]'s hydraulic system", \
					"You unsecure the [holder]'s hydraulic system."
				)
				holder.icon_state = "durand0"
		if(25)
			if(diff == FORWARD)
				usr.visible_message(
					"[usr] connects the hydraulic systems inside the [holder].", \
					"You connect the hydraulic systems inside the [holder]."
				)
				holder.icon_state = "durand1"
			else
				usr.visible_message(
					"[usr] disconnects the [holder]'s hydraulic systems", \
					"You disconnect the [holder]'s hydraulic systems."
				)
				holder.icon_state = "durand0"
		if(24)
			if(diff == FORWARD)
				usr.visible_message(
					"[usr] adds wiring to the [holder]", \
					"You add wiring to the [holder]."
				)
				holder.icon_state = "durand2"
			else
				usr.visible_message(
					"[usr] removes the [holder]'s wiring", \
					"You remove the [holder]'s wiring."
				)
				holder.icon_state = "durand0"
		if(23)
			if(diff == FORWARD)
				usr.visible_message(
					"[usr] organizes the wiring in the [holder].", \
					"You organize the wiring in the [holder]."
				)
				holder.icon_state = "durand3"
			else
				usr.visible_message(
					"[usr] unsets the wiring from the [holder].", \
					"You unset the wiring from the [holder]."
				)
				holder.icon_state = "durand1"
		if(22)
			if(diff == FORWARD)
				usr.visible_message(
					"[usr] installs the central control board into the [holder].", \
					"You install the central control board into the [holder]."
				)
				holder.icon_state = "durand5"
			else
				usr.visible_message(
					"[usr] removes the central control board from the [holder].", \
					"You remove the central control board from the [holder]."
				)
				holder.icon_state = "durand3"
				new /obj/item/circuitboard/mecha/main(get_turf(holder))
		if(21)
			if(diff == FORWARD)
				usr.visible_message(
					"[usr] secures the central control board inside the [holder].", \
					"You secure the central control board inside the [holder]."
				)
				holder.icon_state = "durand6"
			else
				usr.visible_message(
					"[usr] unsecures the central control board inside the [holder].", \
					"You unsecure the central control board inside the [holder]."
				)
				holder.icon_state = "durand4"
		if(20)
			if(diff == FORWARD)
				usr.visible_message(
					"[usr] installs the peripherals control board into the [holder].", \
					"You install the peripherals control board into the [holder]."
				)
				holder.icon_state = "durand7"
			else
				usr.visible_message(
					"[usr] removes the peripherals control board from the [holder].", \
					"You remove the peripherals control board from the [holder]."
				)
				holder.icon_state = "durand5"
				new /obj/item/circuitboard/mecha/peripherals(get_turf(holder))
		if(19)
			if(diff == FORWARD)
				usr.visible_message(
					"[usr] secures the peripherals control board inside the [holder].", \
					"You secure the peripherals control board inside the [holder]."
				)
				holder.icon_state = "durand8"
			else
				usr.visible_message(
					"[usr] unsecures the peripherals control board inside the [holder].", \
					"You unsecure the peripherals control board inside the [holder]."
				)
				holder.icon_state = "durand6"
		if(18)
			if(diff == FORWARD)
				usr.visible_message(
					"[usr] installs the weapon control and targeting board into the [holder].", \
					"You install the weapon control and targeting board into the [holder]."
				)
				holder.icon_state = "durand9"
			else
				usr.visible_message(
					"[usr] removes the weapon control and targeting board from the [holder].", \
					"You remove the weapon control and targeting board from the [holder]."
				)
				holder.icon_state = "durand7"
				new /obj/item/circuitboard/mecha/targeting(get_turf(holder))
		if(17)
			if(diff == FORWARD)
				usr.visible_message(
					"[usr] secures the weapon control and targeting board inside the [holder].", \
					"You secure the weapon control and targeting board inside the [holder]."
				)
				holder.icon_state = "durand10"
			else
				usr.visible_message(
					"[usr] unsecures the weapon control and targeting board from the [holder].", \
					"You unsecure the weapon control and targeting board from the [holder]."
				)
				holder.icon_state = "durand8"
		if(16)
			if(diff == FORWARD)
				usr.visible_message(
					"[usr] installs the [used_atom] into the [holder].", \
					"You install the [used_atom] into the [holder]."
				)
				holder.icon_state = "durand11"
			else
				usr.visible_message(
					"[usr] removes the scanner from the [holder].", \
					"You remove the scanner from the [holder]."
				)
				holder.icon_state = "durand9"
		if(15)
			if(diff == FORWARD)
				var/obj/item/stock_parts/scanning_module/S = locate() in holder
				if(!S)
					S = "advanced scanner module"
				usr.visible_message(
					"[usr] secures the [S] into the [holder].", \
					"You secure the [S] into the [holder]."
				)
				holder.icon_state = "durand12"
			else
				var/obj/item/stock_parts/scanning_module/S = locate() in holder
				if(S)
					S.forceMove(get_turf(holder))
				else
					S = "advanced scanner module"
				usr.visible_message(
					"[usr] unsecures the [S] from the [holder].", \
					"You unsecures the [S] from the [holder]."
				)
				holder.icon_state = "durand10"
		if(14)
			if(diff == FORWARD)
				usr.visible_message(
					"[usr] installs the [used_atom] into the [holder].", \
					"You install the [used_atom] into the [holder]."
				)
				holder.icon_state = "durand13"
			else
				var/obj/item/stock_parts/scanning_module/S = locate() in holder
				if(!S)
					S = "advanced scanner module"
				usr.visible_message(
					"[usr] unfastens the [S] from the [holder].", \
					"You unfasten the [S] from the [holder]."
				)
				holder.icon_state = "durand11"
		if(13)
			if(diff == FORWARD)
				var/obj/item/stock_parts/capacitor/C = locate() in holder
				if(!C)
					C = "advanced capacitor"
				usr.visible_message(
					"[usr] secures the [C] into the [holder].", \
					"You secure the [C] into the [holder]."
				)
				holder.icon_state = "durand14"
			else
				var/obj/item/stock_parts/capacitor/C = locate() in holder
				if(C)
					C.forceMove(get_turf(holder))
				else
					C = "advanced capacitor"
				usr.visible_message(
					"[usr] unsecures the [C] from the [holder].", \
					"You unsecure the [C] from the [holder]."
				)
				holder.icon_state = "durand12"
		if(12)
			if(diff == FORWARD)
				usr.visible_message(
					"[usr] installs the circuit shielding inside the [holder].", \
					"You install the circuit shielding inside the [holder]."
				)
				holder.icon_state = "durand16"
			else
				usr.visible_message(
					"[usr] pries the circuit shielding from the [holder].", \
					"You pry the circuit shielding from the [holder]."
				)
				holder.icon_state = "durand14"
				new /obj/item/stack/material/plasteel (get_turf(holder), 5)
		if(11)
			if(diff == FORWARD)
				usr.visible_message(
					"[usr] bolts down the circuit shielding on the [holder].", \
					"You bolt down the circuit shielding on the [holder]."
				)
				holder.icon_state = "durand15"
			else
				usr.visible_message(
					"[usr] unsecures the circuit shielding on the [holder].", \
					"You unsecure the circuit shielding on the [holder]."
				)
				holder.icon_state = "durand13"
		if(10)
			if(diff == FORWARD)
				usr.visible_message(
					"[usr] adds the RW armor booster to the [holder].", \
					"You add the RW armor booster to the [holder]."
				)
				holder.icon_state = "durand15"
			else
				usr.visible_message(
					"[usr] removes the RW armor booster from the [holder].", \
					"You remove the RW armor booster from the [holder]."
				)
				holder.icon_state = "durand13"
				new /obj/item/mecha_parts/mecha_equipment/armor_booster/antiproj_armor_booster(get_turf(holder))
		if(9)
			if(diff == FORWARD)
				usr.visible_message(
					"[usr] bolts down the RW armor booster on the [holder].", \
					"You bolt down the RW armor booster on the [holder]."
				)
				holder.icon_state = "durand15"
			else
				usr.visible_message(
					"[usr] unsecures the RW armor booster on the [holder].", \
					"You unsecure the RW armor booster on the [holder]."
				)
				holder.icon_state = "durand13"
		if(8)
			if(diff == FORWARD)
				usr.visible_message(
					"[usr] adds the CCW armor booster to the [holder].", \
					"You add the CCW armor booster to the [holder]."
				)
				holder.icon_state = "durand17"
			else
				usr.visible_message(
					"[usr] pry the CCW armor booster from the [holder].", \
					"You pries the CCW armor booster from the [holder]."
				)
				holder.icon_state = "durand15"
				new /obj/item/mecha_parts/mecha_equipment/armor_booster/anticcw_armor_booster(get_turf(holder))
		if(7)
			if(diff == FORWARD)
				usr.visible_message(
					"[usr] welds together the internal armor of the [holder].", \
					"You weld together the internal armor of the [holder]."
				)
				holder.icon_state = "durand18"
			else
				usr.visible_message(
					"[usr] cuts apart the internal armor of the [holder].", \
					"You cuts apart the internal armor of the [holder]."
				)
				holder.icon_state = "durand16"
		if(6)
			if(diff == FORWARD)
				usr.visible_message(
					"[usr] affixes durand armor plates onto the [holder].", \
					"You affix durand armor plates onto the [holder]."
				)
				holder.icon_state = "durand19"
			else
				usr.visible_message(
					"[usr] pries the durand armor plates from the [holder].", \
					"You pry the durand armor plates from the [holder]."
				)
				holder.icon_state = "durand17"
				new /obj/item/mecha_parts/part/durand_armour(get_turf(holder))
		if(5)
			if(diff == FORWARD)
				usr.visible_message(
					"[usr] secures the durand armor plates on the [holder].", \
					"You secure the durand armor plates on the [holder]."
				)
				holder.icon_state = "durand19"
			else
				usr.visible_message(
					"[usr] unsecures the durand armor plates from the [holder].", \
					"You unsecure the durand armor plates from the [holder]."
				)
				holder.icon_state = "durand17"
		if(4)
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
				holder.icon_state = "durand19"
				new /obj/item/stack/material/glass/reinforced (get_turf(holder), 5)
		if(3)
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
				holder.icon_state = "durand18"
		if(2)
			if(diff == FORWARD)
				usr.visible_message(
					"[usr] installs reinforced plating over the cockpit of the [holder].", \
					"You install reinforced plating over the cockpit of the [holder]."
				)
			else
				usr.visible_message(
					"[usr] removes the reinforced plating from the cockpit of the [holder].", \
					"You remove the reinforced plating from the cockpit of the [holder]."
				)
				holder.icon_state = "durand18"
				new /obj/item/tool_upgrade/reinforcement/plating (get_turf(holder), 5)
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
				holder.icon_state = "durand19"
	return 1
