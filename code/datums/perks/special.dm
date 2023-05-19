/////////////////
/* Ghost Perks */
/////////////////

/datum/perk/special/true_name //Only in here cause there is legitimetly no better place to put it in
	name = "Rename Self"
	desc = "No one knows you thus your name is what ever you need or want to be."
	icon_state = "family"
	active = FALSE
	passivePerk = FALSE
	var/anti_cheat = FALSE

/datum/perk/special/true_name/activate()
	..()
	if(anti_cheat)
		to_chat(holder, "You can only keep up so many personallitys.")
		return FALSE
	anti_cheat = TRUE
	var/mob/M = usr
	var/npc_name = input(M, "Choose your name: ", "Superstar Name", "VIP") as text
	if(src && npc_name)
		M.real_name = npc_name
		M.stats.removePerk(PERK_TRUE_NAME)
	anti_cheat = FALSE
	return TRUE

/datum/perk/special/true_name/remove()
	..()

////////////////
//Crayon Magic//
////////////////

/datum/perk/alchemist
	name = "Alchemy"
	desc = "Whether from fun study or natural talent in the field of brewing random things together you know how to gather basic chemical compounds. \
			Your NSA also has been slightly improved due to self experimentation. You can also see all reagents in beakers."
	perk_shared_ability = PERK_SHARED_SEE_REAGENTS
	icon_state = "alch"

/datum/perk/alchemist/assign(mob/living/carbon/human/H)
	..()
	if(holder)
		holder.metabolism_effects.nsa_mult += 0.05
		holder.metabolism_effects.calculate_nsa()

/datum/perk/alchemist/remove()
	if(holder)
		holder.metabolism_effects.nsa_mult -= 0.05
		holder.metabolism_effects.calculate_nsa()
	..()

/datum/perk/scribe
	name = "Scribe"
	desc = "Your ability to turn experiences into words knows no bounds. Paper at this point is hardly able to hold the power of your writing."
	icon_state = "knowledge"

/datum/perk/scribe/assign(mob/living/carbon/human/H)
	..()
	if(holder)
		holder.sdisabilities|=BLIND

/datum/perk/scribe/remove()
	if(holder)
		holder.sdisabilities&=BLIND
	..()

//////////////
//Drug Perks//
//////////////

//Basically for drugs to apply a perk for a set amount of time..

/datum/perk/drug/ultrasurgeon
	name = "Ultrasurgeon Knowledge"
	desc = "After your fix of ultrasurgeon you can feel your mind ease just as your muscles relax."
	icon_state = "generic"

/datum/perk/njoy
	name = "Njoy (Active)"
	desc = "Your mind can focus on what is real, just like when you get rid of a painful earring."
	icon_state = "generic"

	gain_text = "Your mind feels much clearer now."
	lose_text = "You feel the shadows once more."

/datum/perk/njoy/assign(mob/living/carbon/human/H)
	if(..())
		holder.sanity.insight_gain_multiplier *= 0.5

/datum/perk/njoy/remove()
	if(holder)
		holder.sanity.insight_gain_multiplier *= 2
	..()

/////////////////
//Lecture Perks//
/////////////////

/datum/perk/lecture/scorching_shell //Slowdown is 2.5 and is located in human_movement.dm, search "tally +="
	name = "Scorching Shell"
	desc = "Great burden comes to the protectors."
	gain_text = "You feel your body stiffening, your stout refusal to change slowing down the world around you as you remain at a fixed point."
	lose_text = "Your body feels lighter, weaker, you've returned to normal."
	icon_state = "armor"

/datum/perk/lecture/scorching_shell/assign(mob/living/carbon/human/H)
	..()
	holder.brute_mod_perk -= 0.2
	holder.burn_mod_perk -= 0.2
	holder.toxin_mod_perk -= 0.2
	holder.oxy_mod_perk -= 0.2

/datum/perk/lecture/scorching_shell/remove()
	holder.brute_mod_perk += 0.2
	holder.burn_mod_perk += 0.2
	holder.toxin_mod_perk += 0.2
	holder.oxy_mod_perk += 0.2
	..()

/////////////////
//Task Perks//
/////////////////

/datum/perk/forceful_rejection
	name = "Forecful Rejection"
	desc = "At the cost of a lot of your mental health, and willpower, remove a perk of your choice!"
	gain_text = "This reality is unfair and cruel! I should just forget about it..."
	lose_text = "It takes a lot of effert to reject reality."
	icon_state = "reject_reality"
	active = FALSE
	passivePerk = FALSE
	var/anti_cheat= FALSE

/datum/perk/forceful_rejection/assign(mob/living/carbon/human/H)
	..()

/datum/perk/forceful_rejection/remove()
	holder.stats.changeStat(STAT_WIL, -15)
	if(ishuman(usr))
		var/mob/living/carbon/human/user = usr
		user.sanity.change_max_level(-10)
	..()

/datum/perk/forceful_rejection/activate()
	var/mob/living/carbon/human/user = usr
	if(!istype(user))
		return ..()
	if(anti_cheat)
		to_chat(usr, SPAN_NOTICE("You cant reject well rejecting!"))
		return FALSE

	anti_cheat = TRUE

	if(user.stats.perks.len ==0)
		to_chat(user, "Creature has no perks to remove, not sure how thats possable")
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
	message_admins("\blue [key_name(user)] removed the perk [perkname] from using forceful rejection.", 1)


	return ..()


