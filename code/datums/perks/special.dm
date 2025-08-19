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

/datum/perk/skill_cap_addition/assign(mob/living/L)
	..()
	for(var/stat in ALL_STATS)
		holder.stats.add_Stat_cap(stat, 30)

/datum/perk/skill_cap_addition/remove()
	for(var/stat in ALL_STATS)
		holder.stats.add_Stat_cap(stat, -30)
	..()

/datum/perk/ally_armor_adder
	name = "Rally Cry"
	desc = "Call to arms, Call to protect and Call to victory, increases armor and damage done by same faction creatures."
	gain_text = "One must simply be the one to make the call."
	lose_text = "The voice grows meeker against the odds or struggles."
	icon_state = "calling"
	active = FALSE
	passivePerk = FALSE

/datum/perk/ally_armor_adder/activate()
	var/mob/living/user = usr
	if(!istype(user))
		return ..()
	if(world.time < cooldown_time)
		to_chat(usr, SPAN_NOTICE("You cannot muster the willpower to have a heroic moment just yet."))
		return FALSE
	cooldown_time = world.time + 15 MINUTES
	log_and_message_admins("used their [src] perk.")
	for(var/mob/living/L in view(user))
		if(L != user && L.stat == CONSCIOUS && L.faction == user.faction)
			to_chat(L, SPAN_NOTICE("You feel inspired by the heroic leader [user]!"))
			L.stats.addPerk(PERK_ARMOR_UP)
	user.stats.addPerk(PERK_ARMOR_UP)
	return ..()

/datum/perk/stillpoint_charge
	name = "Augment: Stillpoint Charge Bank"
	desc = "Advanced storage unit that is the princeable of Stillpoints power, has an inbuilt micro AI with an artificial EGO."
	gain_text = "A robotic voice informs you on how to use the Charge Bank. Quite handy."
	lose_text = "A robotic voice lists off reasons your a villainess person, before frying itself."
	var/charge = 0
	active = FALSE
	passivePerk = FALSE

datum/perk/stillpoint_charge/activate()
	var/mob/living/user = usr
	if(!istype(user))
		return ..()
	if(world.time < cooldown_time)
		to_chat(usr, SPAN_NOTICE("The robotic voice tells you that this feature is not ready to be used yet so soon after last deploy."))
		return FALSE
	var/area/A = get_area(get_turf(user))
	if(A)
		if(A.bluespace_entropy <= 0)
			to_chat(usr, SPAN_NOTICE("The robotic voice tells you that this area has no entropy to collect!"))
			return FALSE

		if(A.bluespace_entropy >= 500)
			charge += 500
			A.bluespace_entropy -= 500
			to_chat(usr, SPAN_NOTICE("The robotic voice tells that you have collected the maxium amount of charge in the area per a deployment. \
			Then suggests staying around to collect the rest."))

		else
			charge = A.bluespace_entropy
			A.bluespace_entropy = 0
			to_chat(usr, SPAN_NOTICE("The robotic voice tells you that this area has no more entropy to collect! Then praises you for saving the day."))

		cooldown_time = world.time + 5 MINUTES

/datum/perk/stillpoint_charge/assign(mob/living/L)
	..()
	var/area/A = get_area(get_turf(L))
	if(A)
		if(A.bluespace_entropy <= 0)
			return

		if(A.bluespace_entropy >= 5000)
			charge = 5000
			A.bluespace_entropy -= 5000
		else
			charge = A.bluespace_entropy
			A.bluespace_entropy = 0

/datum/perk/stillpoint_armor
	name = "Augment: Stillpoint Statis Armor Gen MK XI"
	desc = "A Stillpoint Supportive Entropy, When holding onto a living being, active this perk to give said being armor - Costs 500 Charge from a Charge Bank"
	gain_text = "A robotic voice informs you on how to use the Statis Armor Gen. Quite handy."
	lose_text = "A robotic voice lists off reasons your a villainess person, before locking away this feature."
	active = FALSE
	passivePerk = FALSE

/datum/perk/stillpoint_armor/activate()
	var/mob/living/user = usr
	if(!istype(user))
		return ..()
	if(world.time < cooldown_time)
		to_chat(usr, SPAN_NOTICE("The robotic voice tells you that this feature is not ready to be used yet so soon after last deploy."))
		return FALSE
	if(user.stats.getPerk(PERK_STILLPONT_CHARGE))
		var/datum/perk/stillpoint_charge/Charge = user.stats.getPerk(PERK_STILLPONT_CHARGE)
		if(Charge < 500)
			to_chat(usr, SPAN_NOTICE("The robotic voice tells you that this feature is unable to be deployed do to low charge."))
			return FALSE
		var/mob/living/G = get_grabbed_mob(user)
		if(!G)
			to_chat(usr, SPAN_NOTICE("The robotic voice tells that you must grab ahold of someone in order to deploy the Statis Armor."))
			return FALSE
		if(G.mob_ablative_armor >= 20)
			to_chat(usr, SPAN_NOTICE("The robotic voice tells that whoever you are grabing already has protection, denieing your request to shield them further."))
			return FALSE

		G.mob_ablative_armor += 5 //1000 per 5, limited by max 20, assuming you dont already have armor form other perks
		Charge.charge -= 1000

		cooldown_time = world.time + 5 MINUTES
		log_and_message_admins("used their [src] perk.")
	else
		to_chat(usr, SPAN_NOTICE("Without proper supporting aguments you are unable to activate this."))
	return ..()

