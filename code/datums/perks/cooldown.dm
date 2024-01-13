/datum/perk/cooldown
	var/perk_lifetime = 5 MINUTES
	var/timestamp_start
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
	//icon_state = "exertion" //https://game-icons.net/1x1/delapouite/weight-lifting-up.html

/datum/perk/cooldown/exertion/on_process()
	if(holder.reagents.has_reagent("protein_shake"))
		perk_lifetime -= 3 SECONDS
	else if(holder.reagents.has_reagent("protein_shake_commercial"))
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
	//icon_state = "reason" //https://game-icons.net/1x1/lorc/brainstorm.html

/datum/perk/cooldown/reason/assign(mob/living/carbon/human/H)
	if(..())
		holder.stats.changeStat(STAT_COG, -5)

/datum/perk/cooldown/reason/remove()
	if(holder)
		holder.stats.changeStat(STAT_COG, 5)
	..()

/////////////////
/* Death Perks */
/////////////////

/datum/perk/cooldown/rezsickness
	name = "Revival Sickness"
	desc = "You've recently died and have been brought back to life, the experience leaving you weakened and thus unfit for fighting for a while. You better find a bed or chair to rest into until you've fully recuperated."
	gain_text = "Your body aches from the pain of returning from death, you better find a chair or bed to rest in so you can heal properly."
	lose_text = "You finally feel like you recovered from the ravages of your body."
	icon_state = "revival"
	perk_lifetime = 25 MINUTES

/datum/perk/cooldown/rezsickness/assign(mob/living/carbon/human/H)
	..()
	holder.brute_mod_perk += 0.10
	holder.burn_mod_perk += 0.10
	holder.oxy_mod_perk += 0.10
	holder.toxin_mod_perk += 0.10
	holder.stats.changeStat(STAT_ROB, -10)
	holder.stats.changeStat(STAT_TGH, -10)
	holder.stats.changeStat(STAT_VIG, -10)
	H.learnt_tasks.attempt_add_task_mastery(/datum/task_master/task/poors, "POORS", skill_gained = 0.5, learner = H)

/datum/perk/cooldown/rezsickness/remove()
	holder.brute_mod_perk -= 0.10
	holder.burn_mod_perk -= 0.10
	holder.oxy_mod_perk -= 0.10
	holder.toxin_mod_perk -= 0.10
	holder.stats.changeStat(STAT_ROB, 10)
	holder.stats.changeStat(STAT_TGH, 10)
	holder.stats.changeStat(STAT_VIG, 10)
	..()

/datum/perk/cooldown/rezsickness/on_process()
	if(holder.buckled)
		perk_lifetime -= 2 SECONDS
	..()

/datum/perk/cooldown/rezsickness/severe
	name = "Severe Revival Sickness"
	desc = "You've recently died and have been brought back to life. Your body cannot handle this traumatic experience very well, to the point where you struggle to complete even basic tasks. You better rest in a bed until it subsides before going back to work."
	icon_state = "revival_harsh"
	perk_lifetime = 30 MINUTES

/datum/perk/cooldown/rezsickness/severe/assign(mob/living/carbon/human/H)
	..()
	holder.brute_mod_perk += 0.15
	holder.burn_mod_perk += 0.15
	holder.oxy_mod_perk += 0.15
	holder.toxin_mod_perk += 0.15
	holder.stats.changeStat(STAT_COG, -15)
	holder.stats.changeStat(STAT_MEC, -15)
	holder.stats.changeStat(STAT_BIO, -15)

/datum/perk/cooldown/rezsickness/severe/remove()
	holder.brute_mod_perk -= 0.15
	holder.burn_mod_perk -= 0.15
	holder.oxy_mod_perk -= 0.15
	holder.toxin_mod_perk -= 0.15
	holder.stats.changeStat(STAT_COG, 15)
	holder.stats.changeStat(STAT_MEC, 15)
	holder.stats.changeStat(STAT_BIO, 15)
	..()

/datum/perk/cooldown/rezsickness/severe/fatal
	name = "Fatal Revival Sickness"
	desc = "You've recently died and have been brought back to life. Your frail constitution can barely handle the process, leaving you utterly physically and mentally wrecked. You better stay in bed for now and rest, or you risk dying even easier than before."
	icon_state = "revival_critical"
	perk_lifetime = 35 MINUTES

/datum/perk/rezsickness/severe/fatal/assign(mob/living/carbon/human/H)
	..()
	holder.brute_mod_perk += 0.25
	holder.burn_mod_perk += 0.25
	holder.oxy_mod_perk += 0.25
	holder.toxin_mod_perk += 0.25
	holder.stats.changeStat(STAT_ROB, -20)
	holder.stats.changeStat(STAT_TGH, -20)
	holder.stats.changeStat(STAT_VIG, -20)
	holder.stats.changeStat(STAT_COG, -20)
	holder.stats.changeStat(STAT_MEC, -20)
	holder.stats.changeStat(STAT_BIO, -20)

/datum/perk/rezsickness/severe/fatal/remove()
	holder.brute_mod_perk -= 0.25
	holder.burn_mod_perk -= 0.25
	holder.oxy_mod_perk -= 0.25
	holder.toxin_mod_perk -= 0.25
	holder.stats.changeStat(STAT_ROB, 20)
	holder.stats.changeStat(STAT_TGH, 20)
	holder.stats.changeStat(STAT_VIG, 20)
	holder.stats.changeStat(STAT_COG, 20)
	holder.stats.changeStat(STAT_MEC, 20)
	holder.stats.changeStat(STAT_BIO, 20)
	..()
