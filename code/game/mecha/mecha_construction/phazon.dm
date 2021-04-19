
//PHAZON ===========================================================================
//Hardest mech to made on start do to its components being rather costly and unable to be given back making it a investement
/datum/construction/mecha/phazon_chassis
	steps = list(
		list("key"=/obj/item/mecha_parts/part/phazon_torso),//1
		list("key"=/obj/item/mecha_parts/part/phazon_left_arm),//2
		list("key"=/obj/item/mecha_parts/part/phazon_right_arm),//3
		list("key"=/obj/item/mecha_parts/part/phazon_left_leg),//4
		list("key"=/obj/item/mecha_parts/part/phazon_right_leg),//5
		list("key"=/obj/item/mecha_parts/part/phazon_head), //6,
		list("key"=/obj/item/bluespace_crystal/artificial), //7,
		list("key"=/obj/item/weapon/stock_parts/smes_coil/super_capacity), //8,
		list("key"=/obj/item/weapon/gun_upgrade/mechanism/overdrive), //9,
		list("key"=/obj/item/weapon/cell/large/moebius/nuclear) //10
	)

	spawn_result()
		var/obj/item/mecha_parts/chassis/const_holder = holder
		const_holder.construct = new /datum/construction/reversible/mecha/phazon(const_holder)
		const_holder.icon = 'icons/mecha/mech_construction.dmi'
		const_holder.icon_state = "phazon0"
		const_holder.density = 1
		spawn()
			qdel(src)
		return


/datum/construction/reversible/mecha/phazon
	result = /obj/mecha/combat/phazon
	steps = list(
		//1
		list("key"=/obj/item/weapon/hand_tele,
			"backkey"=QUALITY_PRYING,
			"desc"="The hand tele is to be installed."),
		//2
		list("key"=QUALITY_WELDING,
			"backkey"=QUALITY_BOLT_TURNING,
			"desc"="External armor is wrenched but not welded down."),
		//3
		list("key"=QUALITY_BOLT_TURNING,
			"backkey"=QUALITY_PRYING,
			"desc"="External armor is installed not not bolted in place."),
		//4
		list("key"=/obj/item/mecha_parts/part/phazon_armor,
			"backkey"=QUALITY_WELDING,
			"desc"="Phase armor is welded but missing phazon armor external plate."),
		//5
		list("key"=QUALITY_WELDING,
			"backkey"=QUALITY_BOLT_TURNING,
			"desc"="Phase internal armor is wrenched down and waits welding."),
		//6
		list("key"=QUALITY_BOLT_TURNING,
			"backkey"=QUALITY_PRYING,
			"desc"="Phase armor is installed and needs bolting."),
		//7
		list("key"=/obj/item/stack/material/plasteel,
			"backkey"=QUALITY_SCREW_DRIVING,
			"desc"="The bluespace crystal is engaged and can be protected over with plasteel plates."),
		//8
		list("key"=QUALITY_SCREW_DRIVING,
			"backkey"=QUALITY_WIRE_CUTTING,
			"desc"="The bluespace crystal is connected but needs to be set with a screwdriver."),
		//9
		list("key"=/obj/item/stack/cable_coil,
			"backkey"=QUALITY_PRYING,
			"desc"="The bluespace crystal is installed but unwired."),
		//10
		list("key"=/obj/item/weapon/stock_parts/subspace/crystal,
			"backkey"=QUALITY_SCREW_DRIVING,
			"desc"="Super capacitor is secured and bluespace crystal is awaiting to be subspace tooned with a crystal."),
		//12
		list("key"=QUALITY_SCREW_DRIVING,
			"backkey"=QUALITY_PRYING,
			"desc"="Super capacitor is installed but unscrewed."),
		//12
		list("key"=/obj/item/weapon/stock_parts/capacitor/super,
			"backkey"=QUALITY_SCREW_DRIVING,
			"desc"="Phasic scanner module is secured and can connect to a super capacitor."),
		//13
		list("key"=QUALITY_SCREW_DRIVING,
			"backkey"=QUALITY_PRYING,
			"desc"="Phasic scanner module is installed but unscrewed."),
		//14
		list("key"=/obj/item/weapon/stock_parts/scanning_module/phasic,
			"backkey"=QUALITY_SCREW_DRIVING,
			"desc"="Weapon control module is secured and can connect to a phasic scanning module"),
		//15
		list("key"=QUALITY_SCREW_DRIVING,
			"backkey"=QUALITY_PRYING,
			"desc"="Weapon control is installed and can be screwed down."),
		//16
		list("key"=/obj/item/weapon/circuitboard/mecha/targeting,
			"backkey"=QUALITY_SCREW_DRIVING,
			"desc"="Peripherals control module is secured and waiting a targeting board."),
		//17
		list("key"=QUALITY_SCREW_DRIVING,
			"backkey"=QUALITY_PRYING,
			"desc"="Peripherals control module is installed and needs to be screwed down"),
		//18
		list("key"=/obj/item/weapon/circuitboard/mecha/peripherals,
			"backkey"=QUALITY_SCREW_DRIVING,
			"desc"="Central control module is secured and ready for a peripherals control module."),
		//19
		list("key"=QUALITY_SCREW_DRIVING,
			"backkey"=QUALITY_PRYING,
			"desc"="Central control module is installed, but unscrewed."),
		//20
		list("key"=/obj/item/weapon/circuitboard/mecha/main,
			"backkey"=QUALITY_SCREW_DRIVING,
			"desc"="The wiring is adjusted for connecting to a central control board."),
		//21
		list("key"=QUALITY_WIRE_CUTTING,
			"backkey"=QUALITY_SCREW_DRIVING,
			"desc"="The wiring is added but needs adjustments."),
		//22
		list("key"=/obj/item/stack/cable_coil,
			"backkey"=QUALITY_SCREW_DRIVING,
			"desc"="The hydraulic systems are active but unlinked to internal power systems."),
		//23
		list("key"=QUALITY_SCREW_DRIVING,
			"backkey"=QUALITY_BOLT_TURNING,
			"desc"="The hydraulic systems are connected but not screwed into place."),
		//24
		list("key"=QUALITY_BOLT_TURNING,
			"desc"="The hydraulic systems are disconnected and unbolted.")
		)


	custom_action(index, diff, atom/used_atom, mob/user)
		if(!..())
			return 0

		//TODO: better messages.
		switch(index)
			if(24)
				usr.visible_message(
					"[usr] connects the [holder] hydraulic systems", \
					"You connect [holder] hydraulic systems."
				)
				holder.icon_state = "phazon1"
			if(23)
				if(diff==FORWARD)
					usr.visible_message(
						"[usr] activates the [holder] hydraulic systems.", \
						"You activate [holder] hydraulic systems."
					)
					holder.icon_state = "phazon2"
				else
					usr.visible_message(
						"[usr] disconnects the [holder] hydraulic systems", \
						"You disconnect [holder] hydraulic systems."
					)
					holder.icon_state = "phazon0"
			if(22)
				if(diff==FORWARD)
					usr.visible_message(
						"[usr] adds the wiring to the [holder].", \
						"You add the wiring to [holder]."
					)
					holder.icon_state = "phazon3"
				else
					usr.visible_message(
						"[usr] deactivates the [holder] hydraulic systems.", \
						"You deactivate [holder] hydraulic systems."
					)
					holder.icon_state = "phazon1"
			if(21)
				if(diff==FORWARD)
					usr.visible_message(
						"[usr] adjusts the wiring of the [holder].", \
						"You adjust the wiring of [holder]."
					)
					holder.icon_state = "phazon4"
				else
					usr.visible_message(
						"[usr] removes the wiring from the [holder].", \
						"You remove the wiring from [holder]."
					)
					new /obj/item/stack/cable_coil (get_turf(holder), 4)
					holder.icon_state = "phazon2"
			if(20)
				if(diff==FORWARD)
					usr.visible_message(
						"[usr] installs the central control module into the [holder].",  \
						"You install the central computer mainboard into [holder]."
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
				if(diff==FORWARD)
					usr.visible_message(
						"[usr] secures the mainboard.", \
						"You secure the mainboard."
					)
					holder.icon_state = "phazon6"
				else
					usr.visible_message(
						"[usr] removes the central control module from the [holder].", \
						"You remove the central computer mainboard from [holder]."
					)
					new /obj/item/weapon/circuitboard/mecha/main(get_turf(holder))
					holder.icon_state = "phazon4"
			if(18)
				if(diff==FORWARD)
					usr.visible_message(
						"[usr] installs the peripherals control module into the [holder].", \
						"You install the peripherals control module into [holder]."
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
				if(diff==FORWARD)
					usr.visible_message(
						"[usr] secures the peripherals control module.", \
						"You secure the peripherals control module."
					)
					holder.icon_state = "phazon8"
				else
					usr.visible_message(
						"[usr] removes the peripherals control module from the [holder].", \
						"You remove the peripherals control module from [holder]."
					)
					new /obj/item/weapon/circuitboard/mecha/peripherals(get_turf(holder))
					holder.icon_state = "phazon6"
			if(16)
				if(diff==FORWARD)
					usr.visible_message(
						"[usr] installs the weapon control module into the [holder].", \
						"You install the weapon control module into [holder]."
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
				if(diff==FORWARD)
					usr.visible_message(
						"[usr] secures the weapon control module.", \
						"You secure the weapon control module."
					)
					holder.icon_state = "phazon10"
				else
					usr.visible_message(
						"[usr] removes the weapon control module from the [holder].", \
						"You remove the weapon control module from [holder]."
					)
					new /obj/item/weapon/circuitboard/mecha/targeting(get_turf(holder))
					holder.icon_state = "phazon8"
			if(14)
				if(diff==FORWARD)
					usr.visible_message(
						"[usr] installs [used_atom] to the [holder].", \
						"You install [used_atom] to [holder]."
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
				if(diff==FORWARD)
					var/obj/item/weapon/stock_parts/scanning_module/S = locate() in holder
					if(!S)
						S = "phasic scanner module"
					usr.visible_message(
						"[usr] secures the [S].", \
						"You secure the [S]."
					)
					holder.icon_state = "phazon12"
				else
					var/obj/item/weapon/stock_parts/scanning_module/S = locate() in holder
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
				if(diff==FORWARD)
					usr.visible_message(
						"[usr] installs [used_atom] to the [holder].", \
						"You install [used_atom] to [holder]."
					)
					qdel(used_atom)
					holder.icon_state = "phazon13"
				else
					var/obj/item/weapon/stock_parts/scanning_module/S = locate() in holder
					if(!S)
						S = "phasic scanner module"
					usr.visible_message(
						"[usr] unfastens the [S].", \
						"You unfasten the [S]."
					)
					holder.icon_state = "phazon11"
			if(11)
				if(diff==FORWARD)
					var/obj/item/weapon/stock_parts/capacitor/C = locate() in holder
					if(!C)
						C = "super capacitor"
					usr.visible_message(
						"[usr] secures the [C].", \
						"You secure the [C]."
					)
					holder.icon_state = "phazon14"
				else
					var/obj/item/weapon/stock_parts/capacitor/C = locate() in holder
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
				if(diff==FORWARD)
					usr.visible_message(
						"[usr] installs the bluespace crystal.", \
						"You install the bluespace crystal"
					)
					qdel(used_atom)
					holder.icon_state = "phazon15"
				else
					var/obj/item/weapon/stock_parts/capacitor/C = locate() in holder
					if(!C)
						C = "super capacitor"
					usr.visible_message(
						"[usr] unfastens the [C].", \
						"You unfasten the [C]."
					)
					holder.icon_state = "phazon13"
			if(9)
				if(diff==FORWARD)
					usr.visible_message(
						"[usr] connects the bluespace crystal.", \
						"You connect the bluespace crystal."
					)
					holder.icon_state = "phazon16"
				else
					usr.visible_message(
						"[usr] removes the bluespace crystal from the [holder].", \
						"You remove the bluespace crystal from the [holder]."
					)
					new /obj/item/weapon/stock_parts/subspace/crystal(get_turf(holder))
					holder.icon_state = "phazon14"
			if(8)
				if(diff==FORWARD)
					usr.visible_message(
						"[usr] engages the bluespace crystal.", \
						"You engage the bluespace crystal."
					)
					holder.icon_state = "phazon17"
				else
					usr.visible_message(
						"[usr] disconnects the bluespace crystal from the [holder].", \
						"You disconnect the bluespace crystal from the [holder]."
					)
					holder.icon_state = "phazon15"
			if(7)
				if(diff==FORWARD)
					usr.visible_message(
						"[usr] installs the phase armor layer to the [holder].", \
						"You install the phase armor layer to the [holder]."
					)
					holder.icon_state = "phazon18"
				else
					usr.visible_message(
						"[usr] disengages the bluespace crystal.", \
						"You disengage the bluespace crystal."
					)
					holder.icon_state = "phazon16"
			if(6)
				if(diff==FORWARD)
					usr.visible_message(
						"[usr] secures the phase armor layer.", \
						"You secure the phase armor layer."
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
				if(diff==FORWARD)
					usr.visible_message(
						"[usr] welds the phase armor layer to the [holder].", \
						"You weld the phase armor layer to the [holder]."
					)
					holder.icon_state = "phazon20"
				else
					usr.visible_message(
						"[usr] unfastens the phase armor layer.", \
						"You unfasten the phase armor layer."
					)
					holder.icon_state = "phazon18"
			if(4)
				if(diff==FORWARD)
					usr.visible_message(
						"[usr] installs Phazon Armor Plates to the [holder].", \
						"You install Phazon Armor Plates to the [holder]."
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
				if(diff==FORWARD)
					usr.visible_message(
						"[usr] secures Phazon Armor Plates.", \
						"You secure Phazon Armor Plates."
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
				if(diff==FORWARD)
					usr.visible_message(
						"[usr] welds Phazon Armor Plates to the [holder].", \
						"You weld Phazon Armor Plates to the [holder]."
					)
				else
					usr.visible_message(
						"[usr] unfastens Phazon Armor Plates.", \
						"You unfasten Phazon Armor Plates."
					)
					holder.icon_state = "phazon21"
			if(1)
				if(diff==FORWARD)
					usr.visible_message(
						"[usr] carefully inserts the anomaly core into \the [holder] and secures it.", \
						"You carefully insert the hand tele into \the [holder] and secures it."
					)
					qdel(used_atom)
		return 1
