/**
  * The root perk datum. All perks inherit properties from this one.
  *
  * A perk is basically a talent that livings may have. This talent could be something like damage reduction, or some other passive benefit.
  * Some jobs have perks that are assigned to the human during role assignment.
  * Perks can be assigned or removed. To handle this, use the mob stats datum, with the helper procs addPerk, removePerk and getPerk.
  * The static effects are given in assign, and removed in remove.
  * Perks are stored in a list within a stat_holder datum.
  */

// /datum/action/innate/perk

// /datum/action/innate/perk/Checks()
// 	// These are redundant, these should only be false if someone is misusing this action
// 	// if(!istype(target, /datum/perk))
// 	// 	return FALSE
// 	var/datum/perk/P = target
// 	// if(P.passivePerk)
// 	// 	return FALSE
// 	if(P.cooldown_time > world.time) // On cooldown
// 		return FALSE
// 	. = ..()

// /datum/action/innate/perk/Activate()
// 	var/datum/perk/P = target
// 	P.invoke()

/datum/perk
	var/name = "Perk"
	var/desc = ""
	var/icon = 'icons/effects/perks.dmi'
	var/icon_state = "missing_perk_icon"
	var/mob/living/holder
	var/gain_text
	var/lose_text
	var/active = TRUE
	var/passivePerk = TRUE
	// var/datum/action/innate/perk/perk_action
	var/cooldown_time = 0
	var/perk_shared_ability
	var/copy_protected = FALSE //Handles being able to potentially copy PERKS between hosts for Borers and Carrions. Currenly unused.

/datum/perk/New()
	..()
	// if(!passivePerk)
	// 	perk_action = new(src)
	// 	perk_action.name = name
	// 	perk_action.desc = desc
	// 	perk_action.button_icon = icon
	// 	perk_action.button_icon_state = icon_state

/datum/perk/Destroy()
	if(holder)
		if (holder.stats && holder.stats.perks)
			holder.stats.perks -= src
		if (!((QDELETED(holder)) || (QDESTROYING(holder)))) //since this can happen during the destroy of the holder
			to_chat(holder, SPAN_NOTICE("[lose_text]"))
	holder = null

	// if(perk_action)
	// 	QDEL_NULL(perk_action)
	. = ..()

/datum/perk/proc/on_process()
	SHOULD_CALL_PARENT(TRUE)
	if(!holder)
		return FALSE
	if(holder.stat == DEAD)
		return FALSE
	return TRUE

/// Proc called when the perk is assigned to a being. Should be the first thing to be called.
/datum/perk/proc/assign(mob/living/L)
	SHOULD_CALL_PARENT(TRUE)
	if(istype(L))
		holder = L
		RegisterSignal(holder, COMSIG_MOB_LIFE, PROC_REF(on_process))
		to_chat(holder, SPAN_NOTICE("[gain_text]"))
		// if(perk_action)
		// 	perk_action.Grant(holder)
		return TRUE

/datum/perk/proc/remove()
	SHOULD_CALL_PARENT(TRUE)
	// Also handled by qdelling the action but it's fine
	// if(perk_action)
	// 	perk_action.Remove(holder)
	qdel(src)

/datum/perk/proc/invoke()
	if(passivePerk)
		log_debug("[usr] attempted to invoke a passive perk [src] - how?")
		return

	if(active && deactivate(holder))
		to_chat(usr, "You deactivate [src]")
	else if(activate(holder))
		to_chat(usr, "You activate [src]")

/datum/perk/proc/activate()
	//log_debug("Ah, fuck, I can't believe you've done this.  Perk [src] without a custom defined activate called")

/datum/perk/proc/deactivate()
	//log_debug("Ah, fuck, I can't believe you've done this.  Perk [src] without a custom defined deactivate called")

/// Proc called , a bitflag is always expected.
/datum/perk/proc/check_shared_ability(ability_bitflag)
	if(!(perk_shared_ability & ability_bitflag))
		return FALSE
	return TRUE

/// This is called from inside the stat panel
/datum/perk/Topic(href, href_list)
	if(usr != holder) // only our holder is allowed to trigger us
		return

	if(href_list["trigger"] && !passivePerk && holder.client)
		invoke()
		// Immediately hit them with an update
		SSstatpanels.set_perks_tab(holder?.client, holder)

/* Uncomment this when more shared abilities are used
/datum/perk/proc/check_shared_abilities(list/ability_bitflags)
	var/accumulated_bitflags = 0
	for(var/bitflag in ability_bitflags)
		if(!check_shared_ability(bitflag))
			continue
		accumulated_bitflags++
	return ability_bitflags.len == accumulated_bitflags ? TRUE : FALSE
*/
