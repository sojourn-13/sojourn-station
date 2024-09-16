// TODO: update tool mod components to use this since it's basically the same
/datum/component/modification
	dupe_mode = COMPONENT_DUPE_UNIQUE
	can_transfer = TRUE

	var/install_start_action = "attaching"
	var/install_success_action = "attached"
	var/install_time = WORKTIME_FAST
	//var/install_tool_quality = null
	var/install_difficulty = FAILCHANCE_ZERO
	var/install_stat = STAT_COG
	var/install_stat_robotic = STAT_COG //Used for robotic organs like FPB bones
	var/install_sound = WORKSOUND_HONK

	var/removal_time = WORKTIME_SLOW
	var/removal_tool_quality = QUALITY_CLAMPING
	var/removal_difficulty = FAILCHANCE_CHALLENGING
	var/removal_stat = STAT_COG
	var/removal_stat_robotic = STAT_COG //Used for robotic organs like FPB bones

	var/mod_time = WORKTIME_FAST
	var/mod_tool_quality = QUALITY_CLAMPING
	var/mod_difficulty = FAILCHANCE_ZERO
	var/mod_stat = STAT_COG
	var/mod_stat_robotic = STAT_COG //Used for robotic organs like FPB bones
	var/mod_sound = WORKSOUND_HONK

	var/bypass_perk = null

	var/adjustable = FALSE
	var/destroy_on_removal = FALSE
	var/removable = TRUE
	var/breakable = FALSE //Some mods are meant to be tamper-resistant and should be removed only in a hard way

	var/list/apply_to_types = list()  		// The mod can be applied to an item of these types
	var/list/blacklisted_types = list()		// The mod can not be applied to an item of these types
	var/exclusive_type						// Use if children of a mod path should be checked

	var/examine_msg = null	// Examine message for the mod, not the item it is attached to

	// Stat-gated details
	var/examine_stat = STAT_COG
	var/examine_difficulty = STAT_LEVEL_BASIC

	// Trigger
	var/trigger_signal

	// Applied to holder object
	var/prefix
	var/new_name
	var/new_desc
	var/new_color

/datum/component/modification/RegisterWithParent()
	RegisterSignal(parent, COMSIG_IATTACK, PROC_REF(attempt_install))
	RegisterSignal(parent, COMSIG_ATTACKBY, PROC_REF(try_modify))
	RegisterSignal(parent, COMSIG_EXAMINE, PROC_REF(on_examine))
	RegisterSignal(parent, COMSIG_REMOVE, PROC_REF(uninstall))

/datum/component/modification/proc/attempt_install(atom/A, mob/living/user, params)
	return can_apply(A, user) && apply(A, user)

/datum/component/modification/proc/can_apply(atom/A, mob/living/user)
	if(isitem(A))
		var/obj/item/I = A
		//No using multiples of the same upgrade
		for (var/obj/item/item in I.item_upgrades)
			if(item.type == parent.type || (exclusive_type && istype(item, exclusive_type)))
				if(user)
					to_chat(user, SPAN_WARNING("A modification of this type is already attached!"))
				return FALSE

	if(istype(A, /obj/item))
		return check_item(A, user)

	return FALSE

/datum/component/modification/proc/check_item(obj/item/I, mob/living/user)
	if(LAZYLEN(I.item_upgrades) >= I.max_upgrades)
		if(user)
			to_chat(user, SPAN_WARNING("\The [I] can not fit anymore modifications!"))
		return FALSE

	if(apply_to_types.len)
		var/type_match = FALSE
		for(var/path in apply_to_types)
			if(istype(I, path))
				type_match = TRUE
				break

		if(!type_match)
			if(user)
				to_chat(user, SPAN_WARNING("\The [parent] can not be attached to \the [I]!"))
			return FALSE

	if(blacklisted_types.len)
		for(var/path in blacklisted_types)
			if(istype(I, path))
				if(user)
					to_chat(user, SPAN_WARNING("\The [parent] can not be attached to \the [I]!"))
				return FALSE

	return TRUE

/datum/component/modification/proc/apply(obj/item/A, mob/living/user)
	if(user)
		var/time_adjust = 0
		var/difficulty_adjust = 0
		if(user.stats?.getPerk(bypass_perk))
			time_adjust = install_time
			difficulty_adjust = install_difficulty
		var/final_install_time = install_time - time_adjust
		var/final_install_difficulty = install_difficulty - difficulty_adjust

		user.visible_message(SPAN_NOTICE("[user] starts [install_start_action] [parent] to [A]"), SPAN_NOTICE("You start [install_start_action] \the [parent] to \the [A]"))
		var/obj/item/I = parent
		var/stat_to_use = install_stat
		if(istype(A, /obj/item/organ))
			var/obj/item/organ/ro = A
			if(BP_IS_ROBOTIC(ro))
				stat_to_use = install_stat_robotic

		if(!I.use_tool(user = user, target = A, base_time = final_install_time, required_quality = null, fail_chance = final_install_difficulty, required_stat = stat_to_use, forced_sound = install_sound))
			return FALSE
		to_chat(user, SPAN_NOTICE("You have successfully [install_success_action] \the [parent] to \the [A]"))
		user.drop_from_inventory(parent)
	//If we get here, we succeeded in the applying
	var/obj/item/I = parent
	I.forceMove(A)
	LAZYADD(A.item_upgrades, I)
	RegisterSignal(A, trigger_signal, PROC_REF(trigger))
	RegisterSignal(A, COMSIG_APPVAL, PROC_REF(apply_values))

	var/datum/component/modification_removal/MR = A.AddComponent(/datum/component/modification_removal)
	MR.removal_tool_quality = removal_tool_quality

	A.refresh_upgrades()
	return TRUE

/datum/component/modification/proc/try_modify(obj/item/I, mob/living/user)
	if(user)
		var/time_adjust = 0
		var/difficulty_adjust = 0
		if(user.stats.getPerk(bypass_perk))
			time_adjust = mod_time
			difficulty_adjust = mod_difficulty
		var/final_install_time = mod_time - time_adjust
		var/final_install_difficulty = mod_difficulty - difficulty_adjust

		var/stat_to_use = mod_stat
		var/obj/item/O = parent
		if(istype(O, /obj/item/organ))
			var/obj/item/organ/ro = O
			if(BP_IS_ROBOTIC(ro))
				stat_to_use = mod_stat_robotic

		if(!I.use_tool(user = user, target = parent, base_time = final_install_time, required_quality = mod_tool_quality, fail_chance = final_install_difficulty, required_stat = stat_to_use, forced_sound = mod_sound))
			return FALSE
		modify(I, user)

/datum/component/modification/proc/modify(obj/item/I, mob/living/user)
	return TRUE

/datum/component/modification/proc/trigger(obj/item/I, mob/living/user)
	return TRUE

/datum/component/modification/proc/apply_values(atom/holder)
	ASSERT(holder)
	if(new_name)
		holder.name = new_name
	if(prefix)
		holder.name = "[prefix] [holder.name]"
	if(new_desc)
		holder.desc = new_desc
	if(new_color)
		holder.color = new_color
	return TRUE

/datum/component/modification/proc/on_examine(mob/user)
	if(examine_msg)
		to_chat(user, SPAN_WARNING(examine_msg))

	var/stat_req_bypassed = FALSE
	if(bypass_perk)
		stat_req_bypassed = user.stats?.getPerk(bypass_perk) ? TRUE : FALSE
	if(stat_req_bypassed || user.stats?.getStat(examine_stat) >= examine_difficulty)
		var/function_info = get_function_info()
		if(function_info)
			to_chat(user, SPAN_NOTICE(function_info))

/datum/component/modification/proc/get_function_info()
	return

/datum/component/modification/proc/uninstall(obj/item/I, mob/living/user)
	var/obj/item/P = parent
	LAZYREMOVE(I.item_upgrades, P)
	if(destroy_on_removal)
		UnregisterSignal(I, trigger_signal)
		UnregisterSignal(I, COMSIG_APPVAL)
		qdel(P)
		return
	P.forceMove(get_turf(I))
	UnregisterSignal(I, trigger_signal)
	UnregisterSignal(I, COMSIG_APPVAL)

/datum/component/modification/UnregisterFromParent()
	UnregisterSignal(parent, COMSIG_IATTACK)
	UnregisterSignal(parent, COMSIG_ATTACKBY)
	UnregisterSignal(parent, COMSIG_EXAMINE)
	UnregisterSignal(parent, COMSIG_REMOVE)

/datum/component/modification/PostTransfer()
	return COMPONENT_TRANSFER


/datum/component/modification_removal
	dupe_mode = COMPONENT_DUPE_UNIQUE
	var/removal_tool_quality = QUALITY_CLAMPING

// Signal thingy should change from attackby to something else when the modification extraction machines are coded
/datum/component/modification_removal/RegisterWithParent()
	RegisterSignal(parent, COMSIG_ATTACKBY, PROC_REF(attempt_uninstall))

/datum/component/modification_removal/UnregisterFromParent()
	UnregisterSignal(parent, COMSIG_ATTACKBY)

/datum/component/modification_removal/proc/attempt_uninstall(obj/item/C, mob/living/user)
	if(!isitem(C))
		return 0

	var/obj/item/upgrade_loc = parent

	ASSERT(istype(upgrade_loc))

	if(LAZYLEN(upgrade_loc.item_upgrades) && C.has_quality(removal_tool_quality))
		var/obj/item/modification/toremove
		if(LAZYLEN(upgrade_loc.item_upgrades) == 1)
			toremove = upgrade_loc.item_upgrades[1]
		else
			var/list/possibles = upgrade_loc.item_upgrades.Copy()
			toremove = input("Which modification would you like to try to extract? The modification will likely be destroyed in the process","Removing Modifications") as null|anything in possibles
			if(!toremove)
				return TRUE
		var/datum/component/modification/M = toremove.GetComponent(/datum/component/modification)
		if(M.removable == FALSE)
			to_chat(user, SPAN_DANGER("\the [toremove] seems to be permanently attached to the [upgrade_loc]"))
		else
			var/difficulty_adjust = 0
			var/time_adjust = 0
			if(user.stats?.getPerk(M.bypass_perk))
				difficulty_adjust = M.removal_difficulty
				time_adjust = M.removal_time
			var/removal_time = M.removal_time - time_adjust
			var/removal_difficulty = M.removal_difficulty - difficulty_adjust

			var/stat_to_use = M.removal_stat
			var/obj/item/O = upgrade_loc
			if(istype(O, /obj/item/organ))
				var/obj/item/organ/ro = O
				if(BP_IS_ROBOTIC(ro))
					stat_to_use = M.removal_stat_robotic

			if(C.use_tool(user = user, target = upgrade_loc, base_time = removal_time, required_quality = removal_tool_quality, fail_chance = removal_difficulty, required_stat = stat_to_use))
				// If you pass the check, then you manage to remove the upgrade intact
				if(!M.destroy_on_removal && user)
					to_chat(user, SPAN_NOTICE("You successfully extract \the [toremove] while leaving it intact."))
				LEGACY_SEND_SIGNAL(toremove, COMSIG_REMOVE, upgrade_loc)
				upgrade_loc.refresh_upgrades()
				return TRUE
			else
				//You failed the check, lets see what happens
				if(M.breakable == FALSE || user.stats?.getPerk(M.bypass_perk))
					to_chat(user, SPAN_DANGER("You failed to extract \the [toremove]."))
					upgrade_loc.refresh_upgrades()
					user.update_action_buttons()
				else if(prob(50))
					//50% chance to break the upgrade and remove it
					to_chat(user, SPAN_DANGER("You successfully extract \the [toremove], but destroy it in the process."))
					LEGACY_SEND_SIGNAL(toremove, COMSIG_REMOVE, parent)
					QDEL_NULL(toremove)
					upgrade_loc.refresh_upgrades()
					user.update_action_buttons()
					return TRUE

	return FALSE

/obj/item/modification
	name = "modification"
	icon = 'icons/obj/organ_mods.dmi'
	force = WEAPON_FORCE_HARMLESS
	w_class = ITEM_SIZE_SMALL
	price_tag = 0
