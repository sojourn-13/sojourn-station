// ODYSSEUS ===========================================================================

/datum/construction/mecha/odysseus_chassis
	steps = list(
		list("key"=/obj/item/mecha_parts/part/odysseus_torso),//1
		list("key"=/obj/item/mecha_parts/part/odysseus_head),//2
		list("key"=/obj/item/mecha_parts/part/odysseus_left_arm),//3
		list("key"=/obj/item/mecha_parts/part/odysseus_right_arm),//4
		list("key"=/obj/item/mecha_parts/part/odysseus_left_leg),//5
		list("key"=/obj/item/mecha_parts/part/odysseus_right_leg)//6
	)

	spawn_result()
		var/obj/item/mecha_parts/chassis/const_holder = holder
		const_holder.construct = new /datum/construction/reversible/mecha/odysseus(const_holder)
		const_holder.icon = 'icons/mecha/mech_construction.dmi'
		const_holder.icon_state = "odysseus0"
		const_holder.density = 1
		spawn()
			qdel(src)
		return

/datum/construction/reversible/mecha/odysseus
	result = /obj/mecha/medical/odysseus
	steps = list(
		//1
		list("key"=QUALITY_WELDING,
			"backkey"=QUALITY_BOLT_TURNING,
			"desc"="External armor is bolted and just needs some flash welding."),
		//2
		list("key"=QUALITY_BOLT_TURNING,
			"backkey"=QUALITY_PRYING,
			"desc"="External armor is installed but unbolted."),
		//3
		list("key"=/obj/item/stack/material/plasteel,
			"backkey"=QUALITY_WELDING,
			"desc"="Internal armor is welded, heatsinked and ready for plasteel external armor."),
		//4
		list("key"=/obj/item/weapon/tool_upgrade/reinforcement/heatsink,
			"backkey"=QUALITY_PRYING,
			"desc"="Internal armor and HUD is installed and the case is ready for a heatsink."),
		//5
		list("key"=/obj/item/stack/cable_coil,
			"backkey"=QUALITY_SCREW_DRIVING,
			"desc"="The health HUD is installed but not wired."),
		//6 - 5
		list("key"=/obj/item/rig_module/vision/medhud,
			"backkey"=QUALITY_PRYING,
			"desc"="Internal armor is installed and now the pilot mounted health HUD slot can be installed."),
		//7
		list("key"=QUALITY_WELDING,
			"backkey"=QUALITY_BOLT_TURNING,
			"desc"="Internal armor is fitted and needs to be welded down."),
		//8
		list("key"=/obj/item/stack/material/plastic,
			"backkey"=QUALITY_PRYING,
			"desc"="Internal armor is secured but needs plastic fitting."),
		//9
		list("key"=QUALITY_BOLT_TURNING,
			"backkey"=QUALITY_PRYING,
			"desc"="Internal armor is installed, but missing securing bolts."),
		//10
		list("key"=/obj/item/stack/material/steel,
			"backkey"=QUALITY_SCREW_DRIVING,
			"desc"="Peripherals control module is secured and screwed. Steel platting for outer armor is needed."),
		//11
		list("key"=QUALITY_SCREW_DRIVING,
			"backkey"=QUALITY_PRYING,
			"desc"="Peripherals control module is installed but unscrewed."),
		//12
		list("key"=/obj/item/weapon/circuitboard/mecha/peripherals,
			"backkey"=QUALITY_SCREW_DRIVING,
			"desc"="Central control module is secured and waiting for a peripherals board."),
		//13
		list("key"=QUALITY_SCREW_DRIVING,
			"backkey"=QUALITY_PRYING,
			"desc"="Central control module is installed but unscrewed."),
		//14
		list("key"=/obj/item/weapon/circuitboard/mecha/main,
			"backkey"=QUALITY_SCREW_DRIVING,
			"desc"="The wiring is adjusted and setted, waiting for a Central control board."),
		//15
		list("key"=QUALITY_WIRE_CUTTING,
			"backkey"=QUALITY_SCREW_DRIVING,
			"desc"="The wiring is added but unset."),
		//16
		list("key"=/obj/item/stack/cable_coil,
			"backkey"=QUALITY_SCREW_DRIVING,
			"desc"="The hydraulic systems are active, and the case can be wired."),
		//17
		list("key"=QUALITY_SCREW_DRIVING,
			"backkey"=QUALITY_BOLT_TURNING,
			"desc"="The hydraulic systems screws are unsecured."),
		//18
		list("key"=QUALITY_BOLT_TURNING,
			"backkey"=QUALITY_PRYING,
			"desc"="The hydraulic systems are unbolted."),
		//19
		list("key"=/obj/item/weapon/tool_upgrade/augment/hydraulic,
			"backkey"=QUALITY_PRYING,
			"desc"="With the cell mount added it can now have the hydraulics added."),
		//20
		list("key"=/obj/item/weapon/tool_upgrade/augment/cell_mount,
			"backkey"=QUALITY_PRYING,
			"desc"="Mech case is made and needs to start with a cell mount."),
		//21
		list("key"=QUALITY_SCREW_DRIVING,
			"desc"="Mech case cover is screwed close.") //So we can successfully keyback to this for getting back tool mods
	)

	custom_action(index, diff, atom/used_atom, mob/user)
		if(!..())
			return 0

		//TODID: better messages.
		switch(index)
			if(21)
				user.visible_message(
					"[user] opens [holder] internal cover box",
					"You openn [holder] internal cover box."
				)
				holder.icon_state = "odysseus1"
			if(20)
				if(diff==FORWARD)
					user.visible_message(
					"[user] adds in [holder] cell box systems",
					"You adds in [holder]'s cell box systems."
					)
					holder.icon_state = "odysseus0"
				else
					user.visible_message(
						"[user] screws back [holder] cover",
						"You screw [holder] internal cover back."
					)
					holder.icon_state = "odysseus0"
			if(19)
				if(diff==FORWARD)
					user.visible_message(
					"[user] adds in [holder] hydraulic systems",
					"You adds in [holder]'s hydraulic systems."
					)
					holder.icon_state = "odysseus1"
				else
					user.visible_message(
						"[user] takes out [holder] hydraulic systems",
						"You disconnect and remove [holder] hydraulic systems."
					)
					holder.icon_state = "odysseus0"
					new /obj/item/weapon/tool_upgrade/augment/cell_mount(get_turf(holder))
			if(18)
				if(diff==FORWARD)
					user.visible_message(
						"[user] connects [holder] hydraulic systems",
						"You connect [holder] hydraulic systems."
					)
					holder.icon_state = "odysseus1"
				else
					user.visible_message(
						"[user] takes out [holder] hydraulic systems",
						"You disconnect and remove [holder] hydraulic systems."
					)
					holder.icon_state = "odysseus0"
					new /obj/item/weapon/tool_upgrade/augment/hydraulic(get_turf(holder))
			if(17)
				if(diff==FORWARD)
					user.visible_message(
						"[user] activates [holder] hydraulic systems.",
						"You activate [holder] hydraulic systems."
					)
					holder.icon_state = "odysseus2"
				else
					user.visible_message(
						"[user] disconnects [holder] hydraulic systems",
						"You disconnect [holder] hydraulic systems."
					)
					holder.icon_state = "odysseus0"
			if(16)
				if(diff==FORWARD)
					user.visible_message(
						"[user] adds the wiring to [holder].",
						"You add the wiring to [holder]."
					)
					holder.icon_state = "odysseus3"
				else
					user.visible_message(
						"[user] deactivates [holder] hydraulic systems.",
						"You deactivate [holder] hydraulic systems."
					)
					holder.icon_state = "odysseus1"
			if(15)
				if(diff==FORWARD)
					user.visible_message(
						"[user] adjusts the wiring of [holder].",
						"You adjust the wiring of [holder]."
					)
					holder.icon_state = "odysseus4"
				else
					user.visible_message(
						"[user] removes the wiring from [holder].",
						"You remove the wiring from [holder]."
					)
					new /obj/item/stack/cable_coil (get_turf(holder), 4)
					holder.icon_state = "odysseus2"
			if(14)
				if(diff==FORWARD)
					user.visible_message(
						"[user] installs the central control module into [holder].",
						"You install the central computer mainboard into [holder]."
					)
					qdel(used_atom)
					holder.icon_state = "odysseus5"
				else
					user.visible_message(
						"[user] disconnects the wiring of [holder].",
						"You disconnect the wiring of [holder]."
					)
					holder.icon_state = "odysseus3"
			if(13)
				if(diff==FORWARD)
					user.visible_message(
						"[user] secures the mainboard.",
						"You secure the mainboard."
					)
					holder.icon_state = "odysseus6"
				else
					user.visible_message(
						"[user] removes the central control module from [holder].",
						"You remove the central computer mainboard from [holder]."
					)
					new /obj/item/weapon/circuitboard/mecha/main(get_turf(holder))
					holder.icon_state = "odysseus4"
			if(12)
				if(diff==FORWARD)
					user.visible_message(
						"[user] installs the peripherals control module into [holder].",
						"You install the peripherals control module into [holder]."
					)
					qdel(used_atom)
					holder.icon_state = "odysseus7"
				else
					user.visible_message(
						"[user] unfastens the mainboard.",
						"You unfasten the mainboard."
					)
					holder.icon_state = "odysseus5"
			if(11)
				if(diff==FORWARD)
					user.visible_message(
						"[user] secures the peripherals control module.",
						"You secure the peripherals control module."
					)
					holder.icon_state = "odysseus8"
				else
					user.visible_message(
						"[user] removes the peripherals control module from [holder].",
						"You remove the peripherals control module from [holder]."
					)
					new /obj/item/weapon/circuitboard/mecha/peripherals(get_turf(holder))
					holder.icon_state = "odysseus6"
			if(10)
				if(diff==FORWARD)
					user.visible_message(
						"[user] installs internal armor layer to [holder].",
						"You install internal armor layer to [holder]."
					)
					holder.icon_state = "odysseus9"
				else
					user.visible_message(
						"[user] unfastens the peripherals control module.",
						"You unfasten the peripherals control module."
					)
					holder.icon_state = "odysseus7"
			if(9)
				if(diff==FORWARD)
					user.visible_message(
						"[user] secures internal armor layer.",
						"You secure internal armor layer."
					)
					holder.icon_state = "odysseus10"
				else
					user.visible_message(
						"[user] pries internal armor layer from [holder].",
						"You prie internal armor layer from [holder]."
					)
					new /obj/item/stack/material/steel (get_turf(holder), 5)
					holder.icon_state = "odysseus8"
			if(8)
				if(diff==FORWARD)
					user.visible_message(
						"[user] secures internal armor layer.",
						"You secure internal armor layer."
					)
					holder.icon_state = "odysseus10"
				else
					user.visible_message(
						"[user] pries internal fittings from [holder].",
						"You prie internal fitting from [holder]."
					)
					new /obj/item/stack/material/plastic (get_turf(holder), 5)
					holder.icon_state = "odysseus8"
			if(7)
				if(diff==FORWARD)
					user.visible_message(
						"[user] welds internal armor layer to [holder].",
						"You weld the internal armor layer to [holder]."
					)
					holder.icon_state = "odysseus11"
				else
					user.visible_message(
						"[user] unfastens the internal armor layer.",
						"You unfasten the internal armor layer."
					)
					holder.icon_state = "odysseus9"
			if(6)
				if(diff==FORWARD)
					user.visible_message(
						"[user] welds internal armor layer to [holder].",
						"You weld the internal armor layer to [holder]."
					)
					holder.icon_state = "odysseus11"
				else
					user.visible_message(
						"[user] unfastens the internal armor layer.",
						"You unfasten the internal armor layer."
					)
					holder.icon_state = "odysseus9"
			if(5)
				if(diff==FORWARD)
					user.visible_message(
						"[user] a [used_atom] mounted HUD to [holder].",
						"You install Med Hud to [holder]."
					)
					holder.icon_state = "odysseus12"
				else
					user.visible_message(
						"[user] takes out [holder] mounted HUD",
						"You disconnect and remove [holder] the Medical Huds."
					)
					holder.icon_state = "odysseus11"
					new /obj/item/rig_module/vision/medhud(get_turf(holder))
			if(4)
				if(diff==FORWARD)
					user.visible_message(
						"[user] adds connections to the Medical Hud.",
						"You adds wiring connecting the Medical Hud."
					)
					holder.icon_state = "odysseus13"
				else
					user.visible_message(
						"[user] removes wire form [holder].",
						"You unscrews and take out wiring from [holder]."
					)
					new /obj/item/stack/cable_coil (get_turf(holder), 4)
					holder.icon_state = "odysseus11"
			if(4)
				if(diff==FORWARD)
					user.visible_message(
						"[user] adds connections to the Medical Hud.",
						"You adds wiring connecting the Medical Hud."
					)
					holder.icon_state = "odysseus13"
				else
					user.visible_message(
						"[user] removes wire form [holder].",
						"You unscrews and take out wiring from [holder]."
					)
					new /obj/item/stack/cable_coil (get_turf(holder), 4)
					holder.icon_state = "odysseus11"
			if(3)
				if(diff==FORWARD)
					user.visible_message(
					"[user] adds in a [holder]",
					"You adds in [holder]."
					)
					holder.icon_state = "odysseus11"
				else
					user.visible_message(
						"[user] takes out a heat sink form [holder]",
						"You disconnect and remove [holder] heat sink."
					)
					holder.icon_state = "odysseus13"
					new /obj/item/weapon/tool_upgrade/reinforcement/heatsink(get_turf(holder))
			if(2)
				if(diff==FORWARD)
					user.visible_message(
						"[user] secures external armor layer.",
						"You secure external reinforced armor layer."
					)
					holder.icon_state = "odysseus13"
				else
					var/obj/item/stack/material/plasteel/MS = new (get_turf(holder), 5)
					user.visible_message(
						"[user] pries [MS] from [holder].",
						"You prie [MS] from [holder]."
					)
					holder.icon_state = "odysseus11"
			if(1)
				if(diff==FORWARD)
					user.visible_message(
						"[user] welds external armor layer to [holder].",
						"You weld external armor layer to [holder]."
					)
					holder.icon_state = "odysseus14"
				else
					user.visible_message(
						"[user] unfastens the external armor layer.",
						"You unfasten the external armor layer."
					)
					holder.icon_state = "odysseus12"
		return 1
