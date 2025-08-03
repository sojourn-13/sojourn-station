/datum/perk/cooldown
	var/perk_lifetime = 5 MINUTES
	var/timestamp_start
	copy_protected = TRUE
	gain_text = "You feel tired. Your body needs some time to recover from all this training."
	lose_text = "You feel a bit more rested from the training."

/datum/perk/cooldown/assign(mob/living/carbon/human/H)
	if(..())
		timestamp_start = world.time

/datum/perk/cooldown/on_process()
	if(!..() || ((timestamp_start + perk_lifetime) < world.time))
		holder.stats.removePerk(type)

/datum/perk/cooldown/exertion
	name = "Overexertion"
	desc = "Your muscles hurt after an intense workout. \
			Your TGH stat is reduced for some time. \
			A protein shake might help with recovery."
	icon_state = "exertion" //https://game-icons.net/1x1/delapouite/weight-lifting-up.html

/datum/perk/cooldown/exertion/on_process()
	if(ishuman(holder))
		var/mob/living/carbon/human/H = holder
		if(H.ingested.has_reagent("protein_shake"))
			perk_lifetime -= 3 SECONDS
		else if(H.ingested.has_reagent("protein_shake_commercial"))
			perk_lifetime -= 2 SECONDS
	..()

/datum/perk/cooldown/exertion/assign(mob/living/carbon/human/H)
	if(..())
		holder.stats.changeStat(STAT_TGH, -5)

/datum/perk/cooldown/exertion/remove()
	if(holder)
		holder.stats.changeStat(STAT_TGH, 5)
	..()

/datum/perk/cooldown/reason
	name = "Dimmed reason"
	desc = "Your mind had soaked up a lot of knowledge. \
			Your COG stat is reduced for some time."
	icon_state = "reason" //https://game-icons.net/1x1/lorc/brainstorm.html

/datum/perk/cooldown/reason/assign(mob/living/carbon/human/H)
	if(..())
		holder.stats.changeStat(STAT_COG, -5)

/datum/perk/cooldown/reason/remove()
	if(holder)
		holder.stats.changeStat(STAT_COG, 5)
	..()

/datum/perk/cooldown/artist_no
	name = "Burnout"
	desc = "Art as taken its toll and you are resting the soul. Tea would help."
	icon_state = "paintbrush_no"
	perk_lifetime = 10 MINUTES //6 arts an hour or if you drink enuff green tea it should be more
	gain_text = "You feel tired. Your mind needs some time to recover from all this exspression."
	lose_text = "You feel a bit more rested from the burnout."


/datum/perk/cooldown/artist_no/on_process()
	if(ishuman(holder))
		var/mob/living/carbon/human/H = holder
		if(H.ingested.has_reagent("icegreentea"))
			perk_lifetime -= 2 SECONDS
		else if(H.ingested.has_reagent("greentea"))
			perk_lifetime -= 1.5 SECONDS
		else if(H.ingested.has_reagent("icetea"))
			perk_lifetime -= 1 SECONDS
		else if(H.ingested.has_reagent("tea"))
			perk_lifetime -= 0.5 SECONDS
	..()
