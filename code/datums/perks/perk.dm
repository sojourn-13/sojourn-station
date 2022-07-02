/**
  * The root perk datum. All perks inherit properties from this one.
  *
  * A perk is basically a talent that livings may have. This talent could be something like damage reduction, or some other passive benefit.
  * Some jobs have perks that are assigned to the human during role assignment.
  * Perks can be assigned or removed. To handle this, use the mob stats datum, with the helper procs addPerk, removePerk and getPerk.
  * The static effects are given in assign, and removed in remove.
  * Perks are stored in a list within a stat_holder datum.
  */

/obj/effect/statclick/perk
	var/datum/perk/target_perk

/obj/effect/statclick/perk/Initialize(_, datum/perk/perk)
	target_perk = perk
	return ..(_, perk.name, perk)

/obj/effect/statclick/perk/Destroy()

	if (target_perk.holder && target_perk && target_perk.holder.stats)
		var/datum/stat_holder/parent_stat_holder = target_perk.holder.stats

		parent_stat_holder.perk_stats -= src

	if (target_perk)
		target_perk.statclick = null
		target_perk = null

	. = ..()

/obj/effect/statclick/perk/update()
	if(target_perk.cooldown_time > world.time)
		name = "[target_perk.name] ([(target_perk.cooldown_time - world.time)/10] seconds)"
	else if (target_perk.passivePerk)
		name = "\[PASSIVE\] [target_perk.name]"
	else
		name = target_perk.name

	desc = target_perk.desc
	icon = target_perk.icon
	//icon_state = target_perk.icon_state + (target_perk.active ? "-on" : "-off")

/obj/effect/statclick/perk/Click()
	if(!target_perk.passivePerk)
		target_perk.invoke()

/datum/perk
	var/name = "Perk"
	var/desc = ""
	var/icon// = 'icons/effects/perks.dmi'
	var/icon_state = ""
	var/mob/living/carbon/human/holder
	var/gain_text
	var/lose_text
	var/active = TRUE
	var/passivePerk = TRUE
	var/obj/effect/statclick/perk/statclick
	var/cooldown_time = 0
	var/perk_shared_ability

/datum/perk/proc/update_stat()
	statclick.update()

/datum/perk/New()
	..()
	statclick = new(null, src)

/datum/perk/Destroy()
	if(holder)
		if (holder.stats && holder.stats.perks)
			holder.stats.perks -= src
		if (!((QDELETED(holder)) || (QDESTROYING(holder)))) //since this can happen during the destroy of the holder
			to_chat(holder, SPAN_NOTICE("[lose_text]"))
	holder = null

	if (statclick)
		statclick.target_perk = null
		statclick = null
	. = ..()

/datum/perk/proc/on_process()
	SHOULD_CALL_PARENT(TRUE)
	if(!holder)
		return FALSE
	if(holder.stat == DEAD)
		return FALSE
	return TRUE

/// Proc called when the perk is assigned to a human. Should be the first thing to be called.
/datum/perk/proc/assign(mob/living/carbon/human/H)
	if(istype(H))
		SHOULD_CALL_PARENT(TRUE)
		holder = H
		RegisterSignal(holder, COMSIG_MOB_LIFE, .proc/on_process)
		to_chat(holder, SPAN_NOTICE("[gain_text]"))
		return TRUE

/datum/perk/proc/remove()
	SHOULD_CALL_PARENT(TRUE)
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

/* Uncomment this when more shared abilities are used
/datum/perk/proc/check_shared_abilities(list/ability_bitflags)
	var/accumulated_bitflags = 0
	for(var/bitflag in ability_bitflags)
		if(!check_shared_ability(bitflag))
			continue
		accumulated_bitflags++
	return ability_bitflags.len == accumulated_bitflags ? TRUE : FALSE
*/
