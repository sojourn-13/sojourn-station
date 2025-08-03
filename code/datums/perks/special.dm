/////////////////
//Task Perks//
/////////////////

/datum/perk/forceful_rejection
	name = "Forceful Rejection"
	desc = "At the cost of a lot of your mental health and willpower, remove a perk of your choice!"
	gain_text = "This reality is unfair and cruel! I should just forget about it..."
	lose_text = "It takes a lot of effort to reject reality."
	icon_state = "reject_reality"
	active = FALSE
	passivePerk = FALSE
	var/anti_cheat= FALSE
	copy_protected = TRUE

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


///////////////////
//Bluecross Perks//
///////////////////

/datum/perk/skill_cap_expanding
	name = "Celestial Gift"
	desc = "The normal limit of the mind has been exspanded by 50%"
	gain_text = "It came in a dream."
	lose_text = "It was but a nightmare."
	icon_state = "celestial"
	var/statis_amount = 0
	copy_protected = TRUE // absolutely not

/datum/perk/skill_cap_expanding/assign(mob/living/L)
	..()
	for(var/stat in ALL_STATS)
		var/gather_increase = holder.stats.grab_Stat_cap(stat)
		gather_increase *= 0.5
		statis_amount = gather_increase
		holder.stats.add_Stat_cap(stat, gather_increase)

/datum/perk/skill_cap_expanding/remove()
	for(var/stat in ALL_STATS)
		holder.stats.add_Stat_cap(stat, -statis_amount)
	..()

/datum/perk/skill_cap_addition
	name = "Cosmic Gazing"
	desc = "The normal limit of the mind has been exspanded by 30"
	gain_text = "Looking into the stars is starting to becoming productive!"
	lose_text = "The void above is the same as below."
	icon_state = "void_eye"
	copy_protected = TRUE

/datum/perk/skill_cap_addition/assign(mob/living/L)
	..()
	for(var/stat in ALL_STATS)
		holder.stats.add_Stat_cap(stat, 30)

/datum/perk/skill_cap_addition/remove()
	for(var/stat in ALL_STATS)
		holder.stats.add_Stat_cap(stat, -30)
	..()

