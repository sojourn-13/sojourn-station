/**
  * The root perk datum. All perks inherit properties from this one.
  *
  * A perk is basically a talent that livings may have. This talent could be something like damage reduction, or some other passive benefit.
  * Some jobs have perks that are assigned to the human during role assignment.
  * Perks can be assigned or removed. To handle this, use the mob stats datum, with the helper procs addPerk, removePerk and getPerk.
  * The static effects are given in assign, and removed in remove.
  * Perks are stored in a list within a stat_holder datum.
  */

/datum/perk
	var/name = "Perk"
	var/desc = ""
	var/icon// = 'icons/effects/perks.dmi'
	var/icon_state = ""
	var/mob/living/carbon/human/holder
	var/active = TRUE

/datum/perk/Destroy()
	holder = null
	return ..()

/// Proc called when the perk is assigned to a human. Should be the first thing to be called.
/datum/perk/proc/assign(mob/living/carbon/human/H)
	SHOULD_CALL_PARENT(TRUE)
	holder = H

/datum/perk/proc/remove()
	SHOULD_CALL_PARENT(TRUE)
	qdel(src)

/datum/perk/proc/activate()
	if(is_active() && deactivate(holder))
		to_chat(usr, "You deactivate [src]")
	else if(activate(holder))
		to_chat(usr, "You activate [src]")