/////////////////
//Task Perks//
/////////////////

/datum/perk/forceful_rejection
	name = "Forecful Rejection"
	desc = "At the cost of a lot of your mental health, and willpower, remove a perk of your choice!"
	gain_text = "This reality is unfair and cruel! I should just forget about it..."
	lose_text = "It takes a lot of effort to reject reality."
	icon_state = "reject_reality"
	active = FALSE
	passivePerk = FALSE
	var/anti_cheat= FALSE

/datum/perk/forceful_rejection/assign(mob/living/carbon/human/H)
	..()

/datum/perk/forceful_rejection/remove()
	holder.stats.changeStat(STAT_VIV, -15)
	if(ishuman(usr))
		var/mob/living/carbon/human/user = usr
		user.metabolism_effects.calculate_nsa()
		user.sanity.change_max_level(-10)
	..()

/datum/perk/forceful_rejection/activate()
	var/mob/living/carbon/human/user = usr
	if(!istype(user))
		return ..()
	if(anti_cheat)
		to_chat(usr, SPAN_NOTICE("You cant reject while rejecting!"))
		return FALSE

	anti_cheat = TRUE

	if(user.stats.perks.len ==0)
		to_chat(user, "Creature has no perks to remove, not sure how that's possible.")
		return
	to_chat(user, SPAN_NOTICE("Rejecting reality, but what aspect to remove?"))
	var/datum/perk/perkname = input("What perk do you want to reject?") as null|anything in user.stats.perks
	if (!perkname)
		anti_cheat = FALSE
		to_chat(user, SPAN_NOTICE("No need to reject some of my past."))
		return
	if(QDELETED(user))
		to_chat(user, "You cant reject being removed from this plane of reality...")
		return
	anti_cheat = FALSE
	user.stats.removePerk(perkname.type)
	user.stats.removePerk(PERK_FORCEFUL_REJECTION)
	message_admins("\blue [key_name(user)] removed the perk [perkname] by using forceful rejection.", 1)


	return ..()


