
//DURAND ===========================================================================

/datum/construction/mecha/durand_chassis
	steps = list(
		list("key"=/obj/item/mecha_parts/part/durand_torso, desc = "A chassis or case for a Durand mech, needs Durand arms, legs, head, as well as a magboots and added four brace bars."),//1
		list("key"=/obj/item/mecha_parts/part/durand_left_arm, desc = "A chassis or case for a Durand mech, needs Durand arms, legs, head, as well as a magboots and added four brace bars."),//2
		list("key"=/obj/item/mecha_parts/part/durand_right_arm, desc = "A chassis or case for a Durand mech, needs Durand arms, legs, head, as well as a magboots and added four brace bars."),//3
		list("key"=/obj/item/mecha_parts/part/durand_left_leg, desc = "A chassis or case for a Durand mech, needs Durand arms, legs, head, as well as a magboots and added four brace bars."),//4
		list("key"=/obj/item/mecha_parts/part/durand_right_leg, desc = "A chassis or case for a Durand mech, needs Durand arms, legs, head, as well as a magboots and added four brace bars."),//5
		list("key"=/obj/item/mecha_parts/part/durand_head, desc = "A chassis or case for a Durand mech, needs Durand arms, legs, head, as well as a magboots and added four brace bars."),//6
		list("key"=/obj/item/clothing/shoes/magboots, desc = "A chassis or case for a Durand mech, needs Durand arms, legs, head, as well as a magboots and added four brace bars."),//7
		list("key"=/obj/item/weapon/tool_upgrade/reinforcement/stick, desc = "A chassis or case for a Durand mech, needs Durand arms, legs, head, as well as a magboots and added four brace bars."),//8
		list("key"=/obj/item/weapon/tool_upgrade/reinforcement/stick, desc = "A chassis or case for a Durand mech, needs Durand arms, legs, head, as well as a magboots and added four brace bars."),//9
		list("key"=/obj/item/weapon/tool_upgrade/reinforcement/stick, desc = "A chassis or case for a Durand mech, needs Durand arms, legs, head, as well as a magboots and added four brace bars."),//10
		list("key"=/obj/item/weapon/tool_upgrade/reinforcement/stick, desc = "A chassis or case for a Durand mech, needs Durand arms, legs, head, as well as a magboots and added four brace bars.")//11
	)

	spawn_result()
		var/obj/item/mecha_parts/chassis/const_holder = holder
		const_holder.construct = new /datum/construction/reversible/mecha/durand(const_holder)
		const_holder.icon = 'icons/mecha/mech_construction.dmi'
		const_holder.icon_state = "durand0"
		const_holder.density = 1
		spawn()
			qdel(src)
		return


/datum/construction/reversible/mecha/durand
	result = /obj/mecha/combat/durand
	steps = list(
		//1
		list("key"=QUALITY_WELDING,
			//"backkey"=QUALITY_BOLT_TURNING,
			"desc"="External armor is wrenched just needs to be welded."),
		//2
		list("key"=/obj/item/weapon/tool_upgrade/reinforcement/plating,
			//"backkey"=QUALITY_PRYING,
			"desc"="External armor is installed, just needs the internal reinforcement plate mod."),
		//3
		list("key"=QUALITY_SCREW_DRIVING,
			//"backkey"=QUALITY_PRYING,
			"desc"="External armor is installed and needs glass a to be screwed down."),
		//4
		list("key"=/obj/item/stack/material/glass/reinforced,
			//"backkey"=QUALITY_WELDING,
			"desc"="External armor is installed and needs reinforced glass a to be installed."),
		//5
		list("key"=QUALITY_BOLT_TURNING,
			//"backkey"=QUALITY_PRYING,
			"desc"="External armor is installed but unbolted."),
		//6
		list("key"=/obj/item/mecha_parts/part/durand_armour,
			//"backkey"=QUALITY_WELDING,
			"desc"="Internal armor is welded and ready for the durand armour plates."),
		//7
		list("key"=QUALITY_WELDING,
			//"backkey"=QUALITY_BOLT_TURNING,
			"desc"="Internal armor is wrenched but needs to be welded"),
		//8
		list("key"=/obj/item/mecha_parts/mecha_equipment/armor_booster/anticcw_armor_booster,
			//"backkey"=QUALITY_PRYING,
			"desc"="Internal armor is placed in its case and needs to a CCW plate"),
		//9
		list("key"=QUALITY_BOLT_TURNING,
			//"backkey"=QUALITY_PRYING,
			"desc"="Internal armor is placed in its case and needs to be bolted down"),
		//10
		list("key"=/obj/item/mecha_parts/mecha_equipment/armor_booster/antiproj_armor_booster,
			//"backkey"=QUALITY_PRYING,
			"desc"="Internal armor is placed in its case and needs to a Exosuit projectile armor plate"),
		//11
		list("key"=QUALITY_BOLT_TURNING,
			//"backkey"=QUALITY_PRYING,
			"desc"="Internal armor is placed in its case and needs to be bolted down"),
		//12
		list("key"=/obj/item/stack/material/plasteel,
			//"backkey"=QUALITY_SCREW_DRIVING,
			"desc"="Advanced capacitor is secured and ready for an armor plate"),
		//13
		list("key"=QUALITY_SCREW_DRIVING,
			//"backkey"=QUALITY_PRYING,
			"desc"="Advanced capacitor is installed but not screwed down"),
		//14
		list("key"=/obj/item/weapon/stock_parts/capacitor,
			"rating" = 2,
			//"backkey"=QUALITY_SCREW_DRIVING,
			"desc"="Advanced scanner module is secured and ready to connect to an advanced capacitor"),
		//15
		list("key"=QUALITY_SCREW_DRIVING,
			//"backkey"=QUALITY_PRYING,
			"desc"="Advanced scanner module is installed but not screwed down"),
		//16
		list("key"=/obj/item/weapon/stock_parts/scanning_module,
			"rating" = 2,
			//"backkey"=QUALITY_SCREW_DRIVING,
			"desc"="Targeting module is secured down and ready to connect to an advanced scanner"),
		//17
		list("key"=QUALITY_SCREW_DRIVING,
			//"backkey"=QUALITY_PRYING,
			"desc"="Targeting module is installed but unscrewed"),
		//18
		list("key"=/obj/item/weapon/circuitboard/mecha/targeting,
			//"backkey"=QUALITY_SCREW_DRIVING,
			"desc"="Peripherals control module is secured and ready to connect to a targeting board"),
		//19
		list("key"=QUALITY_SCREW_DRIVING,
			//"backkey"=QUALITY_PRYING,
			"desc"="Peripherals control module is installed and need to be screwed down"),
		//20
		list("key"=/obj/item/weapon/circuitboard/mecha/peripherals,
			//"backkey"=QUALITY_SCREW_DRIVING,
			"desc"="Central control module is secured and ready to connect to a peripherals board"),
		//21
		list("key"=QUALITY_SCREW_DRIVING,
			//"backkey"=QUALITY_PRYING,
			"desc"="Central control module is installed but is unscrewed"),
		//22
		list("key"=/obj/item/weapon/circuitboard/mecha/main,
			//"backkey"=QUALITY_SCREW_DRIVING,
			"desc"="The wiring is adjusted and ready for a central control board"),
		//23
		list("key"=QUALITY_WIRE_CUTTING,
			//"backkey"=QUALITY_SCREW_DRIVING,
			"desc"="The wiring is added but needs to be fixed up"),
		//24
		list("key"=/obj/item/stack/cable_coil,
			//"backkey"=QUALITY_SCREW_DRIVING,
			"desc"="The hydraulic systems are active but unwired."),
		//25
		list("key"=QUALITY_SCREW_DRIVING,
			//"backkey"=QUALITY_BOLT_TURNING,
			"desc"="The hydraulic systems are connected but bolted down."),
		//26
		list("key"=QUALITY_BOLT_TURNING,
			"desc"="The hydraulic systems are disconnected."),
		//27
		list("key"=/obj/item/weapon/tool_upgrade/productivity/motor,
			//"backkey"=QUALITY_PRYING,
			"desc"="Hydraulics set inside need to be linked to a eletric moter."),
		//28
		list("key"=/obj/item/weapon/tool_upgrade/augment/hydraulic,
			//"backkey"=QUALITY_PRYING,
			"desc"="With the cell mount added it can now have the hydraulics added."),
		//29
		list("key"=/obj/item/weapon/tool_upgrade/augment/cell_mount,
			//"backkey"=QUALITY_PRYING,
			"desc"="Mech case is made and needs to start with a cell mount."),
		//30
		list("key"=QUALITY_SCREW_DRIVING,
			"desc"="Mech case cover is screwed close.") //So we can successfully keyback to this for getting back tool mods
	)

	custom_action(index, diff, atom/used_atom, mob/user)
		if(!..())
			return 0

		//TODO: better messages.
		switch(index)
			if(30)
				usr.visible_message(
					"[usr] opens [holder] internal cover box", \
					"You openn [holder] internal cover box."
				)
				holder.icon_state = "durand1"
			if(29)
				if(diff==FORWARD)
					usr.visible_message(
					"[usr] adds in [holder] cell box systems", \
					"You adds in [holder]'s cell box systems."
					)
					holder.icon_state = "durand0"
				else
					usr.visible_message(
						"[usr] screws back [holder] cover", \
						"You screw [holder] internal cover back."
					)
					holder.icon_state = "durand0"
			if(28)
				if(diff==FORWARD)
					usr.visible_message(
					"[usr] adds in [holder] hydraulic systems", \
					"You adds in [holder]'s hydraulic systems."
					)
					holder.icon_state = "durand1"
				else
					usr.visible_message(
						"[usr] takes out [holder] hydraulic systems", \
						"You disconnect and remove [holder] hydraulic systems."
					)
					holder.icon_state = "durand0"
					new /obj/item/weapon/tool_upgrade/augment/cell_mount(get_turf(holder))
			if(27)
				if(diff==FORWARD)
					usr.visible_message(
						"[usr] connects [holder] a motor", \
						"You connect [holder] a motor in."
					)
					holder.icon_state = "durand1"
				else
					usr.visible_message(
						"[usr] takes out [holder] hydraulic systems", \
						"You disconnect and remove [holder] hydraulic systems."
					)
					holder.icon_state = "durand0"
					new /obj/item/weapon/tool_upgrade/augment/hydraulic(get_turf(holder))
			if(26)
				if(diff==FORWARD)
					usr.visible_message(
						"[usr] connects [holder] the motor to the hydraulic systems", \
						"You connect [holder] to the hydraulic systems."
					)
					holder.icon_state = "durand1"
				else
					usr.visible_message(
						"[usr] takes out [holder] a high power motor", \
						"You disconnect and remove [holder] form the hydraulic systems."
					)
					holder.icon_state = "durand0"
					new /obj/item/weapon/tool_upgrade/productivity/motor(get_turf(holder))
			if(25)
				if(diff==FORWARD)
					usr.visible_message(
						"[usr] activates [holder] hydraulic systems.", \
						"You activate [holder] hydraulic systems."
					)
					holder.icon_state = "durand1"
				else
					usr.visible_message(
						"[usr] disconnects [holder] hydraulic systems", \
						"You disconnect [holder] hydraulic systems."
					)
					holder.icon_state = "durand0"
			if(24)
				if(diff==FORWARD)
					usr.visible_message(
						"[usr] activates [holder] hydraulic systems.", \
						"You activate [holder] hydraulic systems."
					)
					holder.icon_state = "durand2"
				else
					usr.visible_message(
						"[usr] disconnects [holder] hydraulic systems", \
						"You disconnect [holder] hydraulic systems."
					)
					holder.icon_state = "durand0"
			if(23)
				if(diff==FORWARD)
					usr.visible_message(
						"[usr] adds the wiring to [holder].", \
						"You add the wiring to [holder]."
					)
					holder.icon_state = "durand3"
				else
					usr.visible_message(
						"[usr] deactivates [holder] hydraulic systems.", \
						"You deactivate [holder] hydraulic systems."
					)
					holder.icon_state = "durand1"
			if(22)
				if(diff==FORWARD)
					usr.visible_message(
						"[usr] adjusts the wiring of [holder].", \
						"You adjust the wiring of [holder]."
					)
					holder.icon_state = "durand4"
				else
					usr.visible_message(
						"[usr] removes the wiring from [holder].", \
						"You remove the wiring from [holder]."
					)
					new /obj/item/stack/cable_coil (get_turf(holder), 4)
					holder.icon_state = "durand2"
			if(21)
				if(diff==FORWARD)
					usr.visible_message(
						"[usr] installs the central control module into [holder].", \
						"You install the central computer mainboard into [holder]."
					)
					holder.icon_state = "durand5"
				else
					usr.visible_message(
						"[usr] disconnects the wiring of [holder].", \
						"You disconnect the wiring of [holder]."
					)
					holder.icon_state = "durand3"
			if(20)
				if(diff==FORWARD)
					usr.visible_message(
						"[usr] secures the mainboard.", \
						"You secure the mainboard."
					)
					holder.icon_state = "durand6"
				else
					usr.visible_message(
						"[usr] removes the central control module from [holder].", \
						"You remove the central computer mainboard from [holder]."
					)
					new /obj/item/weapon/circuitboard/mecha/main(get_turf(holder))
					holder.icon_state = "durand4"
			if(19)
				if(diff==FORWARD)
					usr.visible_message(
						"[usr] installs the peripherals control module into [holder].", \
						"You install the peripherals control module into [holder]."
					)
					holder.icon_state = "durand7"
				else
					usr.visible_message(
						"[usr] unfastens the mainboard.", \
						"You unfasten the mainboard."
					)
					holder.icon_state = "durand5"
			if(18)
				if(diff==FORWARD)
					usr.visible_message(
						"[usr] secures the peripherals control module.", \
						"You secure the peripherals control module."
					)
					holder.icon_state = "durand8"
				else
					usr.visible_message(
						"[usr] removes the peripherals control module from [holder].", \
						"You remove the peripherals control module from [holder]."
					)
					new /obj/item/weapon/circuitboard/mecha/peripherals(get_turf(holder))
					holder.icon_state = "durand6"
			if(17)
				if(diff==FORWARD)
					usr.visible_message(
						"[usr] installs the weapon control module into [holder].", \
						"You install the weapon control module into [holder]."
					)
					holder.icon_state = "durand9"
				else
					usr.visible_message(
						"[usr] unfastens the peripherals control module.", \
						"You unfasten the peripherals control module."
					)
					holder.icon_state = "durand7"
			if(16)
				if(diff==FORWARD)
					usr.visible_message(
						"[usr] secures the weapon control module.", \
						"You secure the weapon control module."
					)
					holder.icon_state = "durand10"
				else
					usr.visible_message(
						"[usr] removes the weapon control module from [holder].", \
						"You remove the weapon control module from [holder]."
					)
					new /obj/item/weapon/circuitboard/mecha/targeting(get_turf(holder))
					holder.icon_state = "durand8"
			if(15)
				if(diff==FORWARD)
					usr.visible_message(
						"[usr] installs [used_atom] to [holder].", \
						"You install [used_atom] to [holder]."
					)
					holder.icon_state = "durand11"
				else
					usr.visible_message(
						"[usr] unfastens the weapon control module.", \
						"You unfasten the weapon control module."
					)
					holder.icon_state = "durand9"
			if(14)
				if(diff==FORWARD)
					var/obj/item/weapon/stock_parts/scanning_module/S = locate() in holder
					if(!S)
						S = "advanced scanner module"
					usr.visible_message(
						"[usr] secures the [S].", \
						"You secure the [S]."
					)
					holder.icon_state = "durand12"
				else
					var/obj/item/weapon/stock_parts/scanning_module/S = locate() in holder
					if(S)
						S.forceMove(get_turf(holder))
					else
						S = "advanced scanner module"
					usr.visible_message(
						"[usr] removes the [S] from [holder].", \
						"You remove the [S] from [holder]."
					)
					holder.icon_state = "durand10"
			if(13)
				if(diff==FORWARD)
					usr.visible_message(
						"[usr] installs [used_atom] to [holder].", \
						"You install [used_atom] to [holder]."
					)
					holder.icon_state = "durand13"
				else
					var/obj/item/weapon/stock_parts/scanning_module/S = locate() in holder
					if(!S)
						S = "advanced scanner module"
					usr.visible_message(
						"[usr] unfastens the [S].", \
						"You unfasten the [S]."
					)
					holder.icon_state = "durand11"
			if(12)
				if(diff==FORWARD)
					var/obj/item/weapon/stock_parts/capacitor/C = locate() in holder
					if(!C)
						C = "advanced capacitor"
					usr.visible_message(
						"[usr] secures the [C].", \
						"You secure the [C]."
					)
					holder.icon_state = "durand14"
				else
					var/obj/item/weapon/stock_parts/capacitor/C = locate() in holder
					if(C)
						C.forceMove(get_turf(holder))
					else
						C = "advanced capacitor"
					usr.visible_message(
						"[usr] removes the [C] from [holder].", \
						"You remove the [C] from [holder]."
					)
					holder.icon_state = "durand12"
			if(11)
				if(diff==FORWARD)
					usr.visible_message(
						"[usr] secures internal armor layer.", \
						"You secure internal armor layer."
					)
					holder.icon_state = "durand16"
				else
					usr.visible_message(
						"[usr] pries internal armor layer from [holder].", \
						"You prie internal armor layer from [holder]."
					)
					new /obj/item/stack/material/plasteel (get_turf(holder), 5)
					holder.icon_state = "durand14"
			if(10)
				if(diff==FORWARD)
					usr.visible_message(
						"[usr] installs internal armor layer to [holder].", \
						"You install internal armor layer to [holder]."
					)
					holder.icon_state = "durand15"
				else
					new /obj/item/mecha_parts/mecha_equipment/armor_booster/antiproj_armor_booster(get_turf(holder))
					usr.visible_message(
						"[usr] removes a internal armor plate.", \
						"You unfasten and remove internal armor plating."
					)
					holder.icon_state = "durand13"
			if(9)
				if(diff==FORWARD)
					usr.visible_message(
						"[usr] bolts down armor plates to [holder].", \
						"You bolt down armor plating [holder]."
					)
					holder.icon_state = "durand15"
				else
					usr.visible_message(
						"[usr] removes a internal armor plate.", \
						"You unfasten and remove internal armor plating."
					)
					holder.icon_state = "durand13"
			if(8)
				if(diff==FORWARD)
					usr.visible_message(
						"[usr] bolts down armor plates to [holder].", \
						"You bolt down armor plating [holder]."
					)
					holder.icon_state = "durand15"
				else
					usr.visible_message(
						"[usr] removes a internal armor plate.", \
						"You unfasten and remove internal armor plating."
					)
					new /obj/item/mecha_parts/mecha_equipment/armor_booster/anticcw_armor_booster(get_turf(holder))
					holder.icon_state = "durand13"
			if(7)
				if(diff==FORWARD)
					usr.visible_message(
						"[usr] welds internal armor layer to [holder].", \
						"You weld the internal armor layer to [holder]."
					)
					holder.icon_state = "durand17"
				else
					usr.visible_message(
						"[usr] unfastens the internal armor layer.", \
						"You unfasten the internal armor layer."
					)
					holder.icon_state = "durand15"
			if(6)
				if(diff==FORWARD)
					usr.visible_message(
						"[usr] installs durand Armour Plates to [holder].", \
						"You install durand Armour Plates to [holder]."
					)
					holder.icon_state = "durand18"
				else
					usr.visible_message(
						"[usr] cuts internal armor layer from [holder].", \
						"You cut the internal armor layer from [holder]."
					)
					new /obj/item/mecha_parts/part/durand_armour(get_turf(holder))
					holder.icon_state = "durand16"
			if(5)
				if(diff==FORWARD)
					usr.visible_message(
						"[usr] secures durand Armour Plates.", \
						"You secure durand Armour Plates."
					)
					holder.icon_state = "durand19"
				else
					usr.visible_message(
						"[usr] pries durand Armour Plates from [holder].", \
						"You prie durand Armour Plates from [holder]."
					)
					holder.icon_state = "durand17"
			if(4)
				if(diff==FORWARD)
					usr.visible_message(
						"[usr] secures durand Armour Plates.", \
						"You secure durand Armour Plates."
					)
					holder.icon_state = "durand19"
				else
					usr.visible_message(
						"[usr] pries durand Armour Plates from [holder].", \
						"You prie durand Armour Plates from [holder]."
					)
					holder.icon_state = "durand17"
			if(3)
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
					holder.icon_state = "durand19"
					new /obj/item/stack/material/glass/reinforced (get_turf(holder), 5)
			if(2)
				if(diff==FORWARD)
					usr.visible_message(
						"[usr] screws down the glass case on [holder].", \
						"You fasten the glass to [holder]."
					)
				else
					usr.visible_message(
						"[usr] unfastens durand Armour Plates.", \
						"You unfasten durand Armour Plates."
					)
					holder.icon_state = "durand18"
			if(1)
				if(diff==FORWARD)
					usr.visible_message(
						"[usr] welds durand Armour Plates to [holder].", \
						"You weld durand Armour Plates to [holder]."
					)
				else
					usr.visible_message(
						"[usr] removes the reinforcement plate.", \
						"You take out the reinforcement plate mod."
					)
					holder.icon_state = "durand19"
					new /obj/item/weapon/tool_upgrade/reinforcement/plating (get_turf(holder), 5)
		return 1