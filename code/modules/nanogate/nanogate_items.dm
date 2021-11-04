// Here is where we store the items made by the nanogate organ.
/obj/item/rig/nanite
	name = "nanite suit control module"
	desc = "A lighter, less armoured rig suit made from nanites and attached to someone's spine."
	icon_state = "ihs_rig_old"
	suit_type = "nanite suit"
	armor = list(
		melee = 30,
		bullet = 30,
		energy = 30,
		bomb = 25,
		bio = 100,
		rad = 100
	) // the suit is less armored than a psion suit but provides alot more utility. -Kaz.
	emp_protection = 10
	slowdown = 0
	item_flags = STOPPRESSUREDAMAGE | THICKMATERIAL | DRAG_AND_DROP_UNEQUIP | EQUIP_SOUNDS
	offline_slowdown = 0
	offline_vision_restriction = 0
	drain = 2
	canremove = FALSE // It is attached to your back

	chest_type = /obj/item/clothing/suit/space/rig/nanite
	helm_type =  /obj/item/clothing/head/helmet/space/rig/nanite
	boot_type =  /obj/item/clothing/shoes/magboots/rig/nanite
	glove_type = /obj/item/clothing/gloves/rig/nanite
	cell_type =  /obj/item/cell/large/moebius/super

	var/charge_tick = 10
	var/recharge_time = 10

/obj/item/rig/nanite/opifex
	air_type = /obj/item/tank/nitrogen
	air_supply = /obj/item/tank/nitrogen

/obj/item/rig/nanite/New()
	..()
	Initialize()

/obj/item/rig/nanite/Process()
	..()
	charge_tick++
	if(charge_tick < recharge_time) return 0
		charge_tick = 0

	if(!cell || cell.charge >= cell.maxcharge)
		return FALSE // check if we actually need to recharge

	if(drain_apc(drain)) //Take power from the APC...
		cell.give(drain) //... to recharge the shot
	return TRUE

/obj/item/rig/nanite/proc/drain_apc(var/power_usage)
	var/area/A = get_area(src)
	if(!istype(A) || !A.powered(STATIC_EQUIP))
		return FALSE

	A.use_power(power_usage, STATIC_EQUIP)
	return TRUE

/obj/item/rig/nanite/emp_act(severity_class)
	if(severity_class >= 5)
		src.visible_message("The [src.name] has been destroyed by an EMP!")
		spawn(20) qdel(src)
	else
		..()

/obj/item/clothing/suit/space/rig/nanite
	name = "suit"

/obj/item/clothing/gloves/rig/nanite
	name = "gloves"

/obj/item/clothing/shoes/magboots/rig/nanite
	name = "shoes"

/obj/item/clothing/head/helmet/space/rig/nanite
	name = "hood"

/obj/item/rig/nanite/attackby(obj/item/I, mob/user)

	if(!isliving(user))
		return

	if(electrified != 0)
		if(shock(user)) //Handles removing charge from the cell, as well. No need to do that here.
			return



	// Lock or unlock the access panel.
	if(I.GetIdCard())
		if(subverted)
			locked = 0
			to_chat(user, SPAN_DANGER("It looks like the locking system has been shorted out."))
			return

		if(locked == -1)
			to_chat(user, SPAN_DANGER("The lock clicks uselessly."))
			return

		if((!req_access || !req_access.len) && (!req_one_access || !req_one_access.len))
			locked = 0
			to_chat(user, SPAN_DANGER("\The [src] doesn't seem to have a locking mechanism."))
			return

		if(security_check_enabled && !src.allowed(user))
			to_chat(user, SPAN_DANGER("Access denied."))
			return

		locked = !locked
		to_chat(user, "You [locked ? "lock" : "unlock"] \the [src] access panel.")
		return

	var/list/usable_qualities = list(QUALITY_PRYING, QUALITY_WELDING,QUALITY_WIRE_CUTTING, QUALITY_PULSING, QUALITY_CUTTING, QUALITY_BOLT_TURNING, QUALITY_SCREW_DRIVING)
	var/tool_type = I.get_tool_type(user, usable_qualities, src)
	switch(tool_type)
		if(QUALITY_SCREW_DRIVING)

			if(open)
				if(I.use_tool(user, src, WORKTIME_NEAR_INSTANT, tool_type, FAILCHANCE_VERY_EASY, required_stat = STAT_MEC))
					var/list/current_mounts = list()
					if(cell) current_mounts   += "cell"
					if(installed_modules && installed_modules.len) current_mounts += "system module"

					var/to_remove = input("Which would you like to modify?") as null|anything in current_mounts
					if(!to_remove)
						return


					switch(to_remove)
						if("cell")
							if(cell)
								to_chat(user, "You detatch \the [cell] from \the [src]'s battery mount.")
								for(var/obj/item/rig_module/module in installed_modules)
									module.deactivate()
								user.put_in_hands(cell)
								cell = null
							else
								to_chat(user, "There is nothing loaded in that mount.")

						if("system module")
							var/list/possible_removals = list()
							for(var/obj/item/rig_module/module in installed_modules)
								if(module.permanent)
									continue
								possible_removals[module.name] = module

							if(!possible_removals.len)
								to_chat(user, "There are no installed modules to remove.")
								return

							var/removal_choice = input("Which module would you like to remove?") as null|anything in possible_removals
							if(!removal_choice)
								return

							if (can_uninstall(possible_removals[removal_choice], user, TRUE))
								uninstall(possible_removals[removal_choice], user)
							return TRUE
			else
				to_chat(user, "\The [src] access panel is closed.")
				return

		if(QUALITY_WIRE_CUTTING)
			if(open)
				wires.Interact(user)
				return
			else
				to_chat(user, "\The [src] access panel is closed.")
				return

		if(QUALITY_PULSING)
			if(open)
				wires.Interact(user)
				return
			else
				to_chat(user, "\The [src] access panel is closed.")
				return

		if(QUALITY_CUTTING)
			if(open)
				wires.Interact(user)
				return
			else
				to_chat(user, "\The [src] access panel is closed.")
				return

		if(QUALITY_PRYING)
			if(locked != 1)
				if(I.use_tool(user, src, WORKTIME_NORMAL, tool_type, FAILCHANCE_VERY_EASY, required_stat = STAT_MEC))
					open = !open
					to_chat(user, SPAN_NOTICE("You [open ? "open" : "close"] the access panel."))
					return
			else
				to_chat(user, SPAN_DANGER("\The [src] access panel is locked."))
				return

		if(QUALITY_BOLT_TURNING)
			if(open)
				if(!air_supply)
					to_chat(user, "There is not tank to remove.")
					return

				if(I.use_tool(user, src, WORKTIME_NEAR_INSTANT, tool_type, FAILCHANCE_VERY_EASY, required_stat = STAT_MEC))
					user.put_in_hands(air_supply)
					to_chat(user, "You detach and remove \the [air_supply].")
					air_supply = null
					return
			else
				to_chat(user, "\The [src] access panel is closed.")
				return

		if(QUALITY_WELDING)
			//Cutting through the cover lock. This allows access to the wires inside so you can disable access requirements
			//Ridiculously difficult to do, hijacking a rig will take a long time if you don't have good mechanical training
			if(locked == 1)
				to_chat(user, SPAN_NOTICE("You start cutting through the access panel's cover lock. This is a delicate task."))
				if(I.use_tool(user, src, WORKTIME_EXTREMELY_LONG, tool_type, FAILCHANCE_VERY_HARD, required_stat = STAT_MEC))
					locked = -1 //Broken, it can never be locked again
					to_chat(user, SPAN_NOTICE("Success! The tension in the panel loosens with a dull click"))
					playsound(src.loc, 'sound/weapons/guns/interact/pistol_magin.ogg', 75, 1)
				return
			else
				to_chat(user, "\The [src] access panel is not locked, there's no need to cut it.")
				//No return here, incase they're trying to repair

		if(ABORT_CHECK)
			return

	// Pass repair items on to the chestpiece.
	if(chest && (istype(I,/obj/item/stack/material) || (QUALITY_WELDING in I.tool_qualities)))
		return chest.attackby(I,user)

	if(open)
		// Air tank.
		if(istype(I,/obj/item/tank)) //Todo, some kind of check for suits without integrated air supplies.
			if(air_supply)
				to_chat(user, "\The [src] already has a tank installed.")
				return

			if(!user.unEquip(I))
				return
			air_supply = I
			I.forceMove(src)
			to_chat(user, "You slot [I] into [src] and tighten the connecting valve.")
			return

		// Check if this is a hardsuit upgrade or a modification.
		else if(istype(I,/obj/item/rig_module))
			if (can_install(I, user, TRUE))
				install(I, user)
			return TRUE
		else if(!cell && istype(I,/obj/item/cell/large))
			if(!user.unEquip(I))
				return
			to_chat(user, "You jack \the [I] into \the [src]'s battery mount.")
			I.forceMove(src)
			src.cell = I
			return

		return

	// If we've gotten this far, all we have left to do before we pass off to root procs
	// is check if any of the loaded modules want to use the item we've been given.
	for(var/obj/item/rig_module/module in installed_modules)
		if(module.accepts_item(I,user)) //Item is handled in this proc
			return
	..()

/obj/item/rig/nanite/can_install(var/obj/item/rig_module/mod, var/mob/user, var/feedback = FALSE)
	if(installed_modules.len)
		for(var/obj/item/rig_module/installed_mod in installed_modules)
			if(!installed_mod.redundant && istype(installed_mod,mod.type))
				if (user && feedback)
					to_chat(user, "The hardsuit already has a module of that class installed.")
				return FALSE

	if (!mod.can_install(src, user, feedback))
		return FALSE

	return TRUE
