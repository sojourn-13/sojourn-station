/datum/perk/oddity
	gain_text = "You feel different. Exposure to oddities has changed you. Now you can't go back."

/datum/perk/oddity/toxic_revenger
	name = "Anomalous Radioactivity"
	desc = "You've been cursed by the latent effects of an oddity and now emit toxins harmful to you and everyone around you. It will be a long time before this wears off..."
	gain_text = "You feel a terrible aching pain in your lungs, the anomalous radiation from an oddity has infused your body with accursed toxins!"
	//icon_state = "Hazmat" // https://game-icons.net
	var/cooldown = 10 MINUTES
	var/initial_time

/datum/perk/oddity/toxic_revenger/assign(mob/living/carbon/human/H)
	..()
	initial_time = world.time

/datum/perk/oddity/toxic_revenger/on_process()
	if(!..())
		return
	if(holder.species.flags & NO_BREATHE || holder.internal)
		return
	if(world.time < initial_time + cooldown)
		return
	initial_time = world.time
	for(var/mob/living/L in viewers(holder, 5))
		if(!L)
			continue
		if(ishuman(L))
			var/mob/living/carbon/human/H = L
			if(H.stat == DEAD || H.internal || H.stats.getPerk(PERK_TOXIC_REVENGER) || (H.species.flags & NO_BREATHE))
				continue
		L.reagents.add_reagent("toxin", 5)
		L.emote("cough")
		to_chat(L, SPAN_WARNING("[holder] emits a strange smell."))
		usr.reagents.add_reagent("toxin", 5)

/datum/perk/oddity/gunslinger
	name = "Gunslinger"
	desc = "The latent effects of an oddity have granted you an insight into firing bullets faster than anyone else, a shame it doesn't make you immune to recoil."
	gain_text = "You feel different, as if time has slowed and your hands can move with an easy grace. The oddity your carrying has changed you, for now."
	//icon_state = "dual_shot" // https://game-icons.net/1x1/delapouite/bullet-impacts.html

/datum/perk/oddity/balls_of_plasteel
	name = "True Grit"
	desc = "Pain comes and goes, you feel as though can withstand far worse than ever before."
	gain_text = "You feel a numbing senstation spreading through out your body. The oddity your carrying has changed you, for now."
	//icon_state = "golem" // https://game-icons.net

/datum/perk/oddity/fast_walker
	name = "Springheel"
	desc = "You're sure of your movements now, slow and steady may win the race but you can prove them wrong."
	gain_text = "You feel your pace quickening, your thoughts barely catching up with your stride. The oddity your carrying has changed you, for now."
	//icon_state = "fast" // https://game-icons.net/1x1/delapouite/fast-forward-button.html