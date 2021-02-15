/datum/perk/oddity
	gain_text = "You feel different. Exposure to oddities has changed you. Now you can't go back."

/datum/perk/oddity/toxic_revenger
	name = "Fungal Host"
	desc = "A small hostile fungal spores were on the oddity, hijacking your lungs and forcing them to emit toxins harmful to everyone around you every half hour. It will be a long time before your body can fight this off..."
	gain_text = "You feel a terrible aching pain in your lungs - an anomalous fungus on the oddity has infused your body!"
	//icon_state = "Hazmat" // https://game-icons.net
	var/cooldown = 30 MINUTES
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
		L.emote("cough")
		to_chat(L, SPAN_WARNING("[holder] emits a fungal smell."))
		usr.reagents?.add_reagent("toxin", 5)

/datum/perk/oddity/gunslinger
	name = "Gunslinger"
	desc = "The latent effects of an oddity have granted you an insight into firing bullets faster than anyone else; a shame it doesn't make you immune to recoil."
	gain_text = "You feel different, as if time has slowed and your hands can move with an easy grace. The oddity your carrying has changed you, for now."
	//icon_state = "dual_shot" // https://game-icons.net/1x1/delapouite/bullet-impacts.html

/datum/perk/oddity/balls_of_plasteel
	name = "True Grit"
	desc = "Pain comes and goes, you feel as though can withstand far worse than ever before."
	gain_text = "You feel a numbing sensation spreading through out your body. The oddity your carrying has changed you, for now."
	//icon_state = "golem" // https://game-icons.net

/datum/perk/oddity/fast_walker
	name = "Springheel"
	desc = "You're sure of your movements now, slow and steady may win the race but you can prove them wrong."
	gain_text = "You feel your pace quickening, your thoughts barely catching up with your stride. The oddity your carrying has changed you, for now."
	//icon_state = "fast" // https://game-icons.net/1x1/delapouite/fast-forward-button.html

/datum/perk/oddity/harden
	name = "Natural Armor"
	desc = "Your skin has become harder, more durable, able to accept blunt force and endure."
	gain_text = "After such a rest you can't help but feel tougher then normal, your skin feels like iron."
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
	desc = "The anomaly has weakened your skin, making you less resistant to blunt trauma."
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

/datum/perk/oddity/better_toxins
	name = "Toxic Resistance"
	desc = "You've been exposed to something toxic, yet your body fought it off and is now strengthened against toxins as a result."
	gain_text = "Fresh air, healthy living, and a bit of "
	//icon_state = "" // - No icon, suggestion - Anti toxin needle?

/datum/perk/oddity/better_toxins/assign(mob/living/carbon/human/H)
	..()
	holder.toxin_mod_perk -= 0.1 //Might be to high...

/datum/perk/oddity/better_toxins/remove()
	holder.toxin_mod_perk += 0.1
	..()

/datum/perk/oddity/shell_shock
	name = "Shell Shock"
	desc = "Why fight the world when it has such horrors? Your body is weakened by self doubt and despair..."
	gain_text = "Things just get harder and harder..."
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
	name = "Sharpened Mind"
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
	name = "Inner Strength"
	desc = "Maybe its the planets gravity or your body is all warmed up, none the less you feel much more physically capable."
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

///////////////////////////////////////
//////// JOB ODDITYS PERKS ////////////
///////////////////////////////////////

/datum/perk/nt_oddity
	gain_text = "The Absolute chose you to expand his will."

/datum/perk/nt_oddity/holy_light
	name = "Holy Light"
	desc = "You have been touched by the divine. You now provide a weak healing aura, healing both brute and burn damage to any cruciform bearers nearby as well as yourself."
	icon_state = "third_eye"  //https://game-icons.net/1x1/lorc/third-eye.html
	var/healing_power = 0.1
	var/cooldown = 1 SECONDS // Just to make sure that perk don't go berserk.
	var/initial_time

/datum/perk/nt_oddity/holy_light/assign(mob/living/carbon/human/H)
	..()
	initial_time = world.time

/datum/perk/nt_oddity/holy_light/on_process()
	if(!..())
		return
	if(!holder.get_core_implant(/obj/item/weapon/implant/core_implant/cruciform))
		return
	if(world.time < initial_time + cooldown)
		return
	initial_time = world.time
	for(var/mob/living/L in viewers(holder, 7))
		if(ishuman(L))
			var/mob/living/carbon/human/H = L
			if(H.stat == DEAD || !(H.get_core_implant(/obj/item/weapon/implant/core_implant/cruciform)))
				continue
			H.adjustBruteLoss(-healing_power)
			H.adjustFireLoss(-healing_power)


/datum/perk/guild/blackbox_insight
	name = "Blackbox Tinkering"
	desc = "It's sleek contours, the expert craftsmanship, the best of hand made mechanical genius."
	gain_text = "What wondrous possibilities..."
	//icon_state = "" // - No icon, suggestion, detective glass?

/datum/perk/guild/blackbox_insight/assign(mob/living/carbon/human/H)
	..()
	holder.stats.changeStat(STAT_COG, 15)
	holder.stats.changeStat(STAT_MEC, 15)

/datum/perk/guild/blackbox_insight/remove()
	holder.stats.changeStat(STAT_COG, -10) //we keep 5 of each
	holder.stats.changeStat(STAT_MEC, -10)
	..()
