
//FIREFUIGHTER ===========================================================================

/datum/construction/mecha/firefighter_chassis
	steps = list(
		list("key"=/obj/item/mecha_parts/part/ripley_torso),//1
		list("key"=/obj/item/mecha_parts/part/ripley_left_arm),//2
		list("key"=/obj/item/mecha_parts/part/ripley_right_arm),//3
		list("key"=/obj/item/mecha_parts/part/ripley_left_leg),//4
		list("key"=/obj/item/mecha_parts/part/ripley_right_leg),//5
		list("key"=/obj/item/clothing/suit/fire)//6
	)

	spawn_result()
		var/obj/item/mecha_parts/chassis/const_holder = holder
		const_holder.construct = new /datum/construction/reversible/mecha/firefighter(const_holder)
		const_holder.icon = 'icons/mecha/mech_construction.dmi'
		const_holder.icon_state = "firefirefighter0"
		const_holder.density = 1
		spawn()
			qdel(src)
		return


/datum/construction/reversible/mecha/firefighter
	result = /obj/mecha/working/ripley/firefighter
	steps = list(
		//1
		list("key"=QUALITY_WELDING,
			"backkey"=QUALITY_BOLT_TURNING,
			"desc"="External armor is wrenched and glass case if fully installed. Last step is just to weld it down."),
		//2
		list("key"=QUALITY_SCREW_DRIVING,
			"backkey"=QUALITY_PRYING,
			"desc"="External armor is installed and needs glass a to be screwed down."),
		//3
		list("key"=/obj/item/stack/material/glass/reinforced,
			"backkey"=QUALITY_WELDING,
			"desc"="External armor is installed and needs glass a to be installed."),
		//4
		list("key"=QUALITY_BOLT_TURNING,
			"backkey"=QUALITY_PRYING,
			"desc"="External armor is installed leaving room for a reinforced glass panles."),
		//5
		list("key"=/obj/item/weapon/tool_upgrade/reinforcement/heatsink,
			"backkey"=QUALITY_PRYING,
			"desc"="External armor plating leaves a gap for the heatsink."),
		//6
		list("key"=/obj/item/stack/material/plasteel,
			"backkey"=QUALITY_WELDING,
			"desc"="Internal armor is welded and needs a plasteel external armor plate."),
		//7
		list("key"=QUALITY_WELDING,
			"backkey"=QUALITY_BOLT_TURNING,
			"desc"="Internal armor is wrenched but not welded down"),
		//8
		list("key"=/obj/item/stack/material/plastic,
			"backkey"=QUALITY_PRYING,
			"desc"="Internal armor is secured but needs plastic fitting."),
		//9
		list("key"=/obj/item/stack/material/silver,
			"backkey"=QUALITY_PRYING,
			"desc"="Internal armor is secured but needs silver heat sinking."),
		//10
		list("key"=/obj/item/stack/material/gold,
			"backkey"=QUALITY_PRYING,
			"desc"="Internal armor is secured but needs gold foil."),
		//11
		list("key"=QUALITY_BOLT_TURNING,
			"backkey"=QUALITY_PRYING,
			"desc"="Internal armor is installed but not bolted down."),
		//12
		list("key"=/obj/item/stack/material/steel,
			"backkey"=QUALITY_SCREW_DRIVING,
			"desc"="Peripherals control module is secured and ready for a steel armor plate."),
		//13
		list("key"=QUALITY_SCREW_DRIVING,
			"backkey"=QUALITY_PRYING,
			"desc"="Peripherals control module is installed but not screwed down."),
		//14
		list("key"=/obj/item/weapon/circuitboard/mecha/peripherals,
			"backkey"=QUALITY_SCREW_DRIVING,
			"desc"="Central control module is secured and ready to sync to a peripherals control module."),
		//15
		list("key"=QUALITY_SCREW_DRIVING,
			"backkey"=QUALITY_PRYING,
			"desc"="Central control module is installed but not screwed down."),
		//16
		list("key"=/obj/item/weapon/circuitboard/mecha/main,
			"backkey"=QUALITY_SCREW_DRIVING,
			"desc"="The wiring is adjusted and ready to be connected to a central controle module"),
		//17
		list("key"=QUALITY_WIRE_CUTTING,
			"backkey"=QUALITY_SCREW_DRIVING,
			"desc"="The wiring is added but needs to be fixed up with a wirecutter"),
		//18
		list("key"=/obj/item/stack/cable_coil,
			"backkey"=QUALITY_SCREW_DRIVING,
			"desc"="The hydraulic systems are active and ready for wiring."),
		//19
		list("key"=QUALITY_SCREW_DRIVING,
			"backkey"=QUALITY_BOLT_TURNING,
			"desc"="The hydraulic systems are connected but unscrewed."),
		//20
		list("key"=QUALITY_BOLT_TURNING,
				"backkey"=QUALITY_PRYING,
			"desc"="The hydraulic systems are disconnected and unbolted down."),
		//21
		list("key"=/obj/item/weapon/tool_upgrade/productivity/motor,
			"backkey"=QUALITY_PRYING,
			"desc"="Hydraulics set inside need to be linked to a eletric moter."),
		//22
		list("key"=/obj/item/weapon/tool_upgrade/augment/hydraulic,
			"backkey"=QUALITY_PRYING,
			"desc"="With the cell mount added it can now have the hydraulics added."),
		//23
		list("key"=/obj/item/weapon/tool_upgrade/augment/cell_mount,
			"backkey"=QUALITY_PRYING,
			"desc"="Mech case is made and needs to start with a cell mount."),
		//24
		list("key"=QUALITY_SCREW_DRIVING,
			"desc"="Mech case cover is screwed close.") //So we can successfully keyback to this for getting back tool mods
	)


	custom_action(index, diff, atom/used_atom, mob/user)
		if(!usr.stat_check(STAT_MEC, STAT_LEVEL_ADEPT))
			to_chat(usr, SPAN_WARNING("You lack the mechanical knowledge to do this!"))
			return

		if(!..())
			return 0
			if(24)
				usr.visible_message(
					"[usr] opens [holder] internal cover box", \
					"You openn [holder] internal cover box."
				)
				holder.icon_state = "firefighter1"
			if(23)
				if(diff==FORWARD)
					usr.visible_message(
					"[usr] adds in [holder] cell box systems", \
					"You adds in [holder]'s cell box systems."
					)
					holder.icon_state = "firefighter0"
				else
					usr.visible_message(
						"[usr] screws back [holder] cover", \
						"You screw [holder] internal cover back."
					)
					holder.icon_state = "firefighter0"
			if(22)
				if(diff==FORWARD)
					usr.visible_message(
					"[usr] adds in [holder] hydraulic systems", \
					"You adds in [holder]'s hydraulic systems."
					)
					holder.icon_state = "firefighter1"
				else
					usr.visible_message(
						"[usr] takes out [holder] hydraulic systems", \
						"You disconnect and remove [holder] hydraulic systems."
					)
					holder.icon_state = "firefighter0"
					new /obj/item/weapon/tool_upgrade/augment/cell_mount(get_turf(holder))
			if(21)
				if(diff==FORWARD)
					usr.visible_message(
						"[usr] connects [holder] hydraulic systems", \
						"You connect [holder] hydraulic systems."
					)
					holder.icon_state = "firefighter1"
				else
					usr.visible_message(
						"[usr] takes out [holder] hydraulic systems", \
						"You disconnect and remove [holder] hydraulic systems."
					)
					holder.icon_state = "firefighter0"
					new /obj/item/weapon/tool_upgrade/augment/hydraulic(get_turf(holder))
			if(20)
				if(diff==FORWARD)
					usr.visible_message(
						"[usr] connects [holder] the motor to the hydraulic systems", \
						"You connect [holder] to the hydraulic systems."
					)
					holder.icon_state = "firefighter1"
				else
					usr.visible_message(
						"[usr] takes out [holder] a high power motor", \
						"You disconnect and remove [holder] form the hydraulic systems."
					)
					holder.icon_state = "firefighter0"
					new /obj/item/weapon/tool_upgrade/productivity/motor(get_turf(holder))
			if(19)
				if(diff==FORWARD)
					usr.visible_message(
						"[usr] activates [holder] hydraulic systems.", \
						"You activate [holder] hydraulic systems."
					)
					holder.icon_state = "firefighter2"
				else
					usr.visible_message(
						"[usr] disconnects [holder] hydraulic systems", \
						"You disconnect [holder] hydraulic systems."
					)
					holder.icon_state = "firefighter0"
			if(18)
				if(diff==FORWARD)
					usr.visible_message(
						"[usr] adds the wiring to [holder].", \
						"You add the wiring to [holder]."
					)
					holder.icon_state = "firefighter3"
				else
					usr.visible_message(
						"[usr] deactivates [holder] hydraulic systems.", \
						"You deactivate [holder] hydraulic systems."
					)
					holder.icon_state = "firefighter1"
			if(17)
				if(diff==FORWARD)
					usr.visible_message(
						"[usr] adjusts the wiring of [holder].", \
						"You adjust the wiring of [holder]."
					)
					holder.icon_state = "firefighter4"
				else
					usr.visible_message(
						"[usr] removes the wiring from [holder].", \
						"You remove the wiring from [holder]."
					)
					new /obj/item/stack/cable_coil (get_turf(holder), 4)
					holder.icon_state = "firefighter2"
			if(16)
				if(diff==FORWARD)
					usr.visible_message(
						"[usr] installs the central control module into [holder].", \
						"You install the central computer mainboard into [holder]."
					)
					qdel(used_atom)
					holder.icon_state = "firefighter5"
				else
					usr.visible_message(
						"[usr] disconnects the wiring of [holder].", \
						"You disconnect the wiring of [holder]."
					)
					holder.icon_state = "firefighter3"
			if(15)
				if(diff==FORWARD)
					usr.visible_message(
						"[usr] secures the mainboard.", \
						"You secure the mainboard."
					)
					holder.icon_state = "firefighter6"
				else
					usr.visible_message(
						"[usr] removes the central control module from [holder].", \
						"You remove the central computer mainboard from [holder]."
					)
					new /obj/item/weapon/circuitboard/mecha/main(get_turf(holder))
					holder.icon_state = "firefighter4"
			if(14)
				if(diff==FORWARD)
					usr.visible_message(
						"[usr] installs the peripherals control module into [holder].", \
						"You install the peripherals control module into [holder]."
					)
					qdel(used_atom)
					holder.icon_state = "firefighter7"
				else
					usr.visible_message(
						"[usr] unfastens the mainboard.", \
						"You unfasten the mainboard."
					)
					holder.icon_state = "firefighter5"
			if(13)
				if(diff==FORWARD)
					usr.visible_message(
						"[usr] secures the peripherals control module.", \
						"You secure the peripherals control module."
					)
					holder.icon_state = "firefighter8"
				else
					usr.visible_message(
						"[usr] removes the peripherals control module from [holder].", \
						"You remove the peripherals control module from [holder]."
					)
					new /obj/item/weapon/circuitboard/mecha/peripherals(get_turf(holder))
					holder.icon_state = "firefighter6"
			if(12)
				if(diff==FORWARD)
					usr.visible_message(
						"[usr] installs internal armor layer to [holder].", \
						"You install internal armor layer to [holder]."
					)
					holder.icon_state = "firefighter9"
				else
					usr.visible_message(
						"[usr] unfastens the peripherals control module.", \
						"You unfasten the peripherals control module."
					)
					holder.icon_state = "firefighter7"
			if(11)
				if(diff==FORWARD)
					usr.visible_message(
						"[usr] secures internal armor layer.", \
						"You secure internal armor layer."
					)
					holder.icon_state = "firefighter10"
				else
					usr.visible_message(
						"[usr] pries internal armor layer from [holder].", \
						"You prie internal armor layer from [holder]."
					)
					new /obj/item/stack/material/gold (get_turf(holder), 5)
					holder.icon_state = "firefighter8"
			if(10)
				if(diff==FORWARD)
					usr.visible_message(
						"[usr] secures internal armor layer.", \
						"You secure internal armor layer."
					)
					holder.icon_state = "firefighter10"
				else
					usr.visible_message(
						"[usr] pries internal armor layer from [holder].", \
						"You prie internal armor layer from [holder]."
					)
					new /obj/item/stack/material/silver (get_turf(holder), 5)
					holder.icon_state = "firefighter8"
			if(9)
				if(diff==FORWARD)
					usr.visible_message(
						"[usr] secures internal armor layer.", \
						"You secure internal armor layer."
					)
					holder.icon_state = "firefighter10"
				else
					usr.visible_message(
						"[usr] pries internal armor layer from [holder].", \
						"You prie internal armor layer from [holder]."
					)
					new /obj/item/stack/material/steel (get_turf(holder), 5)
					holder.icon_state = "firefighter8"
			if(8)
				if(diff==FORWARD)
					usr.visible_message(
						"[usr] adds plastic fittings to internal armor layer.", \
						"You secure internal armor layer with plastic fittings."
					)
					holder.icon_state = "firefighter10"
				else
					usr.visible_message(
						"[usr] pries out fittings from [holder].", \
						"You prie internal armor plastic fitting layer from [holder]."
					)
					new /obj/item/stack/material/plastic (get_turf(holder), 5)
					holder.icon_state = "firefighter8"
			if(7)
				if(diff==FORWARD)
					usr.visible_message(
						"[usr] welds internal armor layer to [holder].", \
						"You weld the internal armor layer to [holder]."
					)
					holder.icon_state = "firefighter11"
				else
					usr.visible_message(
						"[usr] unfastens the internal armor layer.", \
						"You unfasten the internal armor layer."
					)
					holder.icon_state = "firefighter9"
			if(6)
				if(diff==FORWARD)
					usr.visible_message(
						"[usr] installs external reinforced armor layer to [holder].", \
						"You install external reinforced armor layer to [holder]."
					)
					holder.icon_state = "firefighter12"
				else
					usr.visible_message(
						"[usr] cuts internal armor layer from [holder].", \
						"You cut the internal armor layer from [holder]."
					)
					holder.icon_state = "firefighter10"
			if(5)
				if(diff==FORWARD)
					usr.visible_message(
						"[usr] secures external armor layer.", \
						"You secure external reinforced armor layer."
					)
					holder.icon_state = "firefighter13"
				else
					usr.visible_message(
						"[usr] pries external armor layer from [holder].", \
						"You prie external armor layer from [holder]."
					)
					new /obj/item/stack/material/plasteel (get_turf(holder), 5)
					holder.icon_state = "firefighter11"
			if(4)
				if(diff==FORWARD)
					usr.visible_message(
					"[usr] adds in a [holder]",
					"You adds in [holder]."
					)
					holder.icon_state = "firefirefighter11"
				else
					usr.visible_message(
						"[usr] unbolts the external armor layer from [holder]", \
						"You disconnect the external armor form [holder]."
					)
					holder.icon_state = "firefirefighter13"
			if(3)
				if(diff==FORWARD)
					usr.visible_message(
						"[usr] places in glass [holder].", \
						"You install glass to [holder]."
					)
				else
					usr.visible_message(
						"[usr] takes out a heat sink form [holder]", \
						"You disconnect and remove [holder] heat sink."
					)
					holder.icon_state = "firefirefighter13"
					new /obj/item/weapon/tool_upgrade/reinforcement/heatsink(get_turf(holder))
			if(2)
				if(diff==FORWARD)
					usr.visible_message(
						"[usr] screws down the glass case on [holder].", \
						"You fasten the glass to [holder]."
					)
				else
					usr.visible_message(
						"[usr] removes glass form.", \
						"You take out the glass casing."
					)
					holder.icon_state = "firefighter12"
					new /obj/item/stack/material/glass/reinforced (get_turf(holder), 5)
			if(1)
				if(diff==FORWARD)
					usr.visible_message(
						"[usr] welds external armor layer to [holder].", \
						"You weld external armor layer to [holder]."
					)
				else
					usr.visible_message(
						"[usr] unscrews the mech cases glass.", \
						"You unscrew the mech cases glass pannle."
					)
					holder.icon_state = "firefighter12"

		return 1