// ODYSSEUS ===========================================================================

/datum/construction/mecha/odysseus_chassis
	steps = list(
		list("key"=/obj/item/mecha_parts/part/odysseus_torso, desc = "The chassis for an Odysseus mech. Needs an Odysseus head, arms and legs."),//1
		list("key"=/obj/item/mecha_parts/part/odysseus_head, desc = "The chassis for an Odysseus mech. Needs an Odysseus head, arms and legs."),//2
		list("key"=/obj/item/mecha_parts/part/odysseus_left_arm, desc = "The chassis for an Odysseus mech. Needs an Odysseus head, arms and legs."),//3
		list("key"=/obj/item/mecha_parts/part/odysseus_right_arm, desc = "The chassis for an Odysseus mech. Needs an Odysseus head, arms and legs."),//4
		list("key"=/obj/item/mecha_parts/part/odysseus_left_leg, desc = "The chassis for an Odysseus mech. Needs an Odysseus head, arms and legs."),//5
		list("key"=/obj/item/mecha_parts/part/odysseus_right_leg, desc = "The chassis for an Odysseus mech. Needs an Odysseus head, arms and legs.")//6
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
	give_points = 17500 //How many points do we give?
	rnd_point_giver = TRUE //Do we even give points?

	result = /obj/mecha/medical/odysseus
	steps = list(
		//1
		list("key"=QUALITY_WELDING,
			//"backkey"=QUALITY_BOLT_TURNING,
			"desc"="External armor is bolted and just needs some flash welding."),
		//2
		list("key"=QUALITY_BOLT_TURNING,
			//"backkey"=QUALITY_PRYING,
			"desc"="External armor is installed but unbolted."),
		//3
		list("key"=/obj/item/stack/material/plasteel,
			//"backkey"=QUALITY_WELDING,
			"desc"="Internal armor is welded, heatsinked and ready for plasteel external armor."),
		//4
		list("key"=/obj/item/tool_upgrade/reinforcement/heatsink,
			//"backkey"=QUALITY_PRYING,
			"desc"="Internal armor and HUD is installed and the case is ready for a heatsink."),
		//5
		list("key"=/obj/item/stack/cable_coil,
			//"backkey"=QUALITY_SCREW_DRIVING,
			"desc"="The health HUD is installed but not wired."),
		//6
		list("key"=/obj/item/rig_module/vision/medhud,
			//"backkey"=QUALITY_PRYING,
			"desc"="Internal armor is installed and now the pilot mounted health HUD slot can be installed."),
		//7
		list("key"=QUALITY_WELDING,
			//"backkey"=QUALITY_BOLT_TURNING,
			"desc"="Internal armor is fitted and needs to be welded down."),
		//8
		list("key"=/obj/item/stack/material/plastic,
			//"backkey"=QUALITY_PRYING,
			"desc"="Internal armor is secured but needs plastic fitting."),
		//9
		list("key"=QUALITY_BOLT_TURNING,
			//"backkey"=QUALITY_PRYING,
			"desc"="Internal armor is installed, but missing securing bolts."),
		//10
		list("key"=/obj/item/stack/material/steel,
			//"backkey"=QUALITY_SCREW_DRIVING,
			"desc"="Peripherals control module is secured and screwed. Steel platting for outer armor is needed."),
		//11
		list("key"=QUALITY_SCREW_DRIVING,
			//"backkey"=QUALITY_PRYING,
			"desc"="Peripherals control module is installed but unscrewed."),
		//12
		list("key"=/obj/item/circuitboard/mecha/peripherals,
			//"backkey"=QUALITY_SCREW_DRIVING,
			"desc"="Central control module is secured and waiting for a peripherals board."),
		//13
		list("key"=QUALITY_SCREW_DRIVING,
			//"backkey"=QUALITY_PRYING,
			"desc"="Central control module is installed but unscrewed."),
		//14
		list("key"=/obj/item/circuitboard/mecha/main,
			//"backkey"=QUALITY_SCREW_DRIVING,
			"desc"="The wiring is adjusted and setted, waiting for a Central control board."),
		//15
		list("key"=QUALITY_WIRE_CUTTING,
			//"backkey"=QUALITY_SCREW_DRIVING,
			"desc"="The wiring is added but unset."),
		//16
		list("key"=/obj/item/stack/cable_coil,
			//"backkey"=QUALITY_SCREW_DRIVING,
			"desc"="The hydraulic systems are active, and the case can be wired."),
		//17
		list("key"=QUALITY_SCREW_DRIVING,
			//"backkey"=QUALITY_BOLT_TURNING,
			"desc"="The hydraulic systems screws are unsecured."),
		//18
		list("key"=QUALITY_BOLT_TURNING,
			//"backkey"=QUALITY_PRYING,
			"desc"="The hydraulic systems are unbolted."),
		//19
		list("key"=/obj/item/tool_upgrade/augment/hydraulic,
			//"backkey"=QUALITY_PRYING,
			"desc"="With the cell mount added it can now have the hydraulics added."),
		//20
		list("key"=/obj/item/tool_upgrade/augment/cell_mount,
			//"backkey"=QUALITY_PRYING,
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
				usr.visible_message(
					"[usr] opens [holder] internal cover box", \
					"You openn [holder] internal cover box."
				)
				holder.icon_state = "odysseus1"
			if(20)
				if(diff==FORWARD)
					usr.visible_message(
					"[usr] adds in [holder] cell box systems", \
					"You adds in [holder]'s cell box systems."
					)
					holder.icon_state = "odysseus0"
				else
					usr.visible_message(
						"[usr] screws back [holder] cover", \
						"You screw [holder] internal cover back."
					)
					holder.icon_state = "odysseus0"
			if(19)
				if(diff==FORWARD)
					usr.visible_message(
					"[usr] adds in [holder] hydraulic systems", \
					"You adds in [holder]'s hydraulic systems."
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
				if(diff==FORWARD)
					usr.visible_message(
						"[usr] connects [holder] hydraulic systems", \
						"You connect [holder] hydraulic systems."
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
				if(diff==FORWARD)
					usr.visible_message(
						"[usr] activates [holder] hydraulic systems.", \
						"You activate [holder] hydraulic systems."
					)
					holder.icon_state = "odysseus2"
				else
					usr.visible_message(
						"[usr] disconnects [holder] hydraulic systems", \
						"You disconnect [holder] hydraulic systems."
					)
					holder.icon_state = "odysseus0"
			if(16)
				if(diff==FORWARD)
					usr.visible_message(
						"[usr] adds the wiring to [holder].", \
						"You add the wiring to [holder]."
					)
					holder.icon_state = "odysseus3"
				else
					usr.visible_message(
						"[usr] deactivates [holder] hydraulic systems.", \
						"You deactivate [holder] hydraulic systems."
					)
					holder.icon_state = "odysseus1"
			if(15)
				if(diff==FORWARD)
					usr.visible_message(
						"[usr] adjusts the wiring of [holder].", \
						"You adjust the wiring of [holder]."
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
				if(diff==FORWARD)
					usr.visible_message(
						"[usr] installs the central control module into [holder].", \
						"You install the central computer mainboard into [holder]."
					)
					holder.icon_state = "odysseus5"
				else
					usr.visible_message(
						"[usr] disconnects the wiring of [holder].", \
						"You disconnect the wiring of [holder]."
					)
					holder.icon_state = "odysseus3"
			if(13)
				if(diff==FORWARD)
					usr.visible_message(
						"[usr] secures the mainboard.", \
						"You secure the mainboard."
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
				if(diff==FORWARD)
					usr.visible_message(
						"[usr] installs the peripherals control module into [holder].", \
						"You install the peripherals control module into [holder]."
					)
					holder.icon_state = "odysseus7"
				else
					usr.visible_message(
						"[usr] unfastens the mainboard.", \
						"You unfasten the mainboard."
					)
					holder.icon_state = "odysseus5"
			if(11)
				if(diff==FORWARD)
					usr.visible_message(
						"[usr] secures the peripherals control module.", \
						"You secure the peripherals control module."
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
				if(diff==FORWARD)
					usr.visible_message(
						"[usr] installs internal armor layer to [holder].", \
						"You install internal armor layer to [holder]."
					)
					holder.icon_state = "odysseus9"
				else
					usr.visible_message(
						"[usr] unfastens the peripherals control module.", \
						"You unfasten the peripherals control module."
					)
					holder.icon_state = "odysseus7"
			if(9)
				if(diff==FORWARD)
					usr.visible_message(
						"[usr] secures internal armor layer.", \
						"You secure internal armor layer."
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
				if(diff==FORWARD)
					usr.visible_message(
						"[usr] secures internal armor layer.", \
						"You secure internal armor layer."
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
				if(diff==FORWARD)
					usr.visible_message(
						"[usr] welds internal armor layer to [holder].", \
						"You weld the internal armor layer to [holder]."
					)
					holder.icon_state = "odysseus11"
				else
					usr.visible_message(
						"[usr] unfastens the internal armor layer.", \
						"You unfasten the internal armor layer."
					)
					holder.icon_state = "odysseus9"
			if(6)
				if(diff==FORWARD)
					usr.visible_message(
						"[usr] welds internal armor layer to [holder].", \
						"You weld the internal armor layer to [holder]."
					)
					holder.icon_state = "odysseus11"
				else
					usr.visible_message(
						"[usr] unfastens the internal armor layer.", \
						"You unfasten the internal armor layer."
					)
					holder.icon_state = "odysseus9"
			if(5)
				if(diff==FORWARD)
					usr.visible_message(
						"[usr] a [used_atom] mounted HUD to [holder].", \
						"You install Med Hud to [holder]."
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
				if(diff==FORWARD)
					usr.visible_message(
						"[usr] adds connections to the Medical Hud.", \
						"You adds wiring connecting the Medical Hud."
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
				if(diff==FORWARD)
					usr.visible_message(
					"[usr] adds in a [holder]", \
					"You adds in [holder]."
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
				if(diff==FORWARD)
					usr.visible_message(
						"[usr] secures external armor layer.", \
						"You secure external reinforced armor layer."
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
				if(diff==FORWARD)
					usr.visible_message(
						"[usr] welds external armor layer to [holder].", \
						"You weld external armor layer to [holder]."
					)
					holder.icon_state = "odysseus14"
				else
					usr.visible_message(
						"[usr] unfastens the external armor layer.", \
						"You unfasten the external armor layer."
					)
					holder.icon_state = "odysseus12"
		return 1
