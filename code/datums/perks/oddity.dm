/datum/perk/oddity
	gain_text = "You feel different. Exposure to oddities has changed you. Now you can't go back."

/datum/perk/oddity/toxic_revenger
	name = "Fungal Host"
	desc = "A small hostile fungal spores were on the oddity, hijacking your longs forcing them to emit toxins harmful to everyone around you. It will be a long time before your body can fight this off..."
	gain_text = "You feel a terrible aching pain in your lungs, the anomalous fungal from the oddity that infused your body with accursed toxic spores!"
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
		to_chat(L, SPAN_WARNING("[holder] emits a fungal smell."))
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
	desc = "Your sure of your movements now, slow and steady may win the race but you can prove them wrong."
	gain_text = "You feel your pace quickening, your thoughts barely catching up with your stride. The oddity your carrying has changed you, for now."
	//icon_state = "fast" // https://game-icons.net/1x1/delapouite/fast-forward-button.html

/datum/perk/oddity/bad_knees
	name = "Sore Body"
	desc = "Your body is just sore, carrying or being in more heavy gear slows you do more so."
	gain_text = "You feel your back ack, and your knees crack. The oddity your carrying has weakened you, for now."
	//icon_state = "" // - No icon, suggestion - Cane?

/datum/perk/oddity/weak_mind
	name = "Nausea"
	desc = "The roaches, the old food, and the other discusting images around has weaken your tolerance."
	gain_text = "The oddity has just made you unable to stomach this world as much as you could."
	//icon_state = "" // - No icon, suggestion - Vomit splash 2?

/datum/perk/oddity/weak_mind/assign(mob/living/carbon/human/H)
	..()
	holder.metabolism_effects.nsa_threshold -= 20

/datum/perk/oddity/weak_mind/remove()
	holder.metabolism_effects.nsa_threshold += 20
	..()

/datum/perk/oddity/harden
	name = "Harden"
	desc = "The anomaly has harden your skin making you more resistant to blunt trauma."
	gain_text = "After such a rest you can't help but feel tougher then normal."
	//icon_state = "" // - No icon, suggestion - Riot Shield?

/datum/perk/oddity/harden/assign(mob/living/carbon/human/H)
	..()
	holder.brute_mod_perk -= 0.1 // One third of subdermal armor
	holder.mob_bomb_defense += 5
	holder.falls_mod -= 0.2

/datum/perk/oddity/harden/remove()
	holder.brute_mod_perk += 0.1
	holder.mob_bomb_defense -= 5
	holder.falls_mod += 0.2
	..()

/datum/perk/oddity/thin_skin
	name = "Thin Skin"
	desc = "The anomaly has weaken your skin making you less resistant to blunt trauma."
	gain_text = "After such a rest you can't help but feel much more sensitive then normal."
	//icon_state = "" // - No icon, suggestion - Paper?

/datum/perk/oddity/thin_skin/assign(mob/living/carbon/human/H)
	..()
	holder.brute_mod_perk += 0.1
	holder.mob_bomb_defense -= 5
	holder.falls_mod += 0.2

/datum/perk/oddity/thin_skin/remove()
	holder.brute_mod_perk -= 0.1 // One third of subdermal armor
	holder.mob_bomb_defense += 5
	holder.falls_mod -= 0.2
	..()

/datum/perk/oddity/drug_consumer
	name = "Easy Addiction"
	desc = "The anomaly has weaken your will making you want to use drugs more."
	gain_text = "A smoke, a needle, and a pill. All things to get out of here."
	//icon_state = "" // - No icon, suggestion - Riot Shield?

/datum/perk/oddity/drug_consumer/assign(mob/living/carbon/human/H)
	..()
	holder.metabolism_effects.addiction_chance_multiplier = 4

//Same as chem addion
/datum/perk/oddity/drug_consumer/remove()
	holder.metabolism_effects.addiction_chance_multiplier = 2
	..()

/datum/perk/oddity/better_toxins
	name = "Toxic Resistance"
	desc = "Weather it is some deadly toxin or a fungal spore, a healthy lifestyle is makes them less deadly."
	gain_text = "Fresh air, and some green tea are the natural detoxins."
	//icon_state = "" // - No icon, suggestion - Anti toxin needle?

/datum/perk/oddity/drug_consumer/assign(mob/living/carbon/human/H)
	..()
	holder.toxin_mod_perk -= 0.1 //Might be to high...

/datum/perk/oddity/drug_consumer/remove()
	holder.toxin_mod_perk += 0.1
	..()

/datum/perk/oddity/shell_shock
	name = "Shell Shock"
	desc = "Why fight the world when it has such horrors? Your body is weaken by self doubt and despair..."
	gain_text = "Things just get harder and harder."
	//icon_state = "" // - No icon, suggestion, old knife?

/datum/perk/oddity/shell_shock/assign(mob/living/carbon/human/H)
	..()
	holder.stats.changeStat(STAT_ROB, -5)
	holder.stats.changeStat(STAT_TGH, -5)
	holder.stats.changeStat(STAT_VIG, -5)

/datum/perk/oddity/shell_shock/remove()
	holder.stats.changeStat(STAT_ROB, 5)
	holder.stats.changeStat(STAT_TGH, 5)
	holder.stats.changeStat(STAT_VIG, 5)
	..()

/datum/perk/oddity/failing_mind
	name = "Failing Mind"
	desc = "The mind fogs, blanking out, always distracted."
	gain_text = "The world is not as clear as it once was."
	//icon_state = "" // - No icon, suggestion, old newspaper?

/datum/perk/oddity/failing_mind/assign(mob/living/carbon/human/H)
	..()
	holder.stats.changeStat(STAT_COG, -5)
	holder.stats.changeStat(STAT_MEC, -5)
	holder.stats.changeStat(STAT_BIO, -5)

/datum/perk/oddity/failing_mind/remove()
	holder.stats.changeStat(STAT_COG, 5)
	holder.stats.changeStat(STAT_MEC, 5)
	holder.stats.changeStat(STAT_BIO, 5)
	..()

/datum/perk/oddity/sharp_mind
	name = "Sharpen Mind"
	desc = "Narrowing in and extrapolating the workings of the world has never felt so much easier."
	gain_text = "The mind can over come any puzzle thrown at it."
	//icon_state = "" // - No icon, suggestion, detective glass?

/datum/perk/oddity/sharp_mind/assign(mob/living/carbon/human/H)
	..()
	holder.stats.changeStat(STAT_COG, 5)
	holder.stats.changeStat(STAT_MEC, 5)
	holder.stats.changeStat(STAT_BIO, 5)

/datum/perk/oddity/sharp_mind/remove()
	holder.stats.changeStat(STAT_COG, -5)
	holder.stats.changeStat(STAT_MEC, -5)
	holder.stats.changeStat(STAT_BIO, -5)
	..()

/datum/perk/oddity/strangth
	name = "Strangth"
	desc = "Maybe its the planets gravity or the body is all warmed up, none the less you feel much more physically capable."
	gain_text = "Nothing like a rest good after a good work out."
	//icon_state = "" // - No icon, suggestion, detective glass?

/datum/perk/oddity/strangth/assign(mob/living/carbon/human/H)
	..()
	holder.stats.changeStat(STAT_ROB, 5)
	holder.stats.changeStat(STAT_TGH, 5)
	holder.stats.changeStat(STAT_VIG, 5)

/datum/perk/oddity/strangth/remove()
	holder.stats.changeStat(STAT_ROB, -5)
	holder.stats.changeStat(STAT_TGH, -5)
	holder.stats.changeStat(STAT_VIG, -5)
	..()
