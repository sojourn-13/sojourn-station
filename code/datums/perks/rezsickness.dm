/datum/perk/rezsickness
	name = "Revival Sickness"
	desc = "You've recently died and have been brought back to life, the experience leaving you weakened and thus unfit for fighting for a while. You better find a bed or chair to rest into until you've fully recuperated."
	icon_state = "revivalsickness"
	gain_text = "Your body aches from the pain of returning from death, you better find a chair or bed to rest in so you can heal properly."
	lose_text = "You finally feel like you recovered from the ravages of your body."
	var/initial_time

/datum/perk/rezsickness/assign(mob/living/L)
	..()

	initial_time = world.time
	cooldown_time = world.time + 30 MINUTES
	holder.brute_mod_perk *= 1.10
	holder.burn_mod_perk *= 1.10
	holder.oxy_mod_perk *= 1.10
	holder.toxin_mod_perk *= 1.10
	holder.stats.changeStat(STAT_ROB, -10)
	holder.stats.changeStat(STAT_TGH, -10)
	holder.stats.changeStat(STAT_VIG, -10)
	if(isliving(holder))
		var/mob/living/H = holder
		H.learnt_tasks.attempt_add_task_mastery(/datum/task_master/task/pours, "POURS", skill_gained = 0.5, learner = H)
		if(ishuman(H))
			var/mob/living/carbon/human/M = H
			if(M.stats.getPerk(PERK_OVERBREATH))
				M.mob_ablative_armor += 5

/datum/perk/rezsickness/remove()
	holder.brute_mod_perk /= 1.10
	holder.burn_mod_perk /= 1.10
	holder.oxy_mod_perk /= 1.10
	holder.toxin_mod_perk /= 1.10
	holder.stats.changeStat(STAT_ROB, 10)
	holder.stats.changeStat(STAT_TGH, 10)
	holder.stats.changeStat(STAT_VIG, 10)
	..()

/datum/perk/rezsickness/severe
	name = "Severe Revival Sickness"
	desc = "You've recently died and have been brought back to life. Your body cannot handle this traumatic experience very well, to the point where you struggle to complete even basic tasks. You better rest in a bed until it subsides before going back to work."
	icon_state = "severerevivalsickness"

/datum/perk/rezsickness/severe/assign(mob/living/L)
	..()
	holder.brute_mod_perk *= 1.15
	holder.burn_mod_perk *= 1.15
	holder.oxy_mod_perk *= 1.15
	holder.toxin_mod_perk *= 1.15
	holder.stats.changeStat(STAT_COG, -15)
	holder.stats.changeStat(STAT_MEC, -15)
	holder.stats.changeStat(STAT_BIO, -15)
	if(ishuman(L))
		var/mob/living/carbon/human/M = L
		if(M.stats.getPerk(PERK_OVERBREATH))
			M.mob_ablative_armor += 5

/datum/perk/rezsickness/severe/remove()
	holder.brute_mod_perk /= 1.15
	holder.burn_mod_perk /= 1.15
	holder.oxy_mod_perk /= 1.15
	holder.toxin_mod_perk /= 1.15
	holder.stats.changeStat(STAT_COG, 15)
	holder.stats.changeStat(STAT_MEC, 15)
	holder.stats.changeStat(STAT_BIO, 15)
	..()

/datum/perk/rezsickness/severe/fatal
	name = "Fatal Revival Sickness"
	desc = "You've recently died and have been brought back to life. Your frail constitution can barely handle the process, leaving you utterly physically and mentally wrecked. You better stay in bed for now and rest, or you risk dying even easier than before."
	icon_state = "fatalrevivalsickness"

/datum/perk/rezsickness/severe/fatal/assign(mob/living/L)
	..()
	holder.brute_mod_perk *= 1.25
	holder.burn_mod_perk *= 1.25
	holder.oxy_mod_perk *= 1.25
	holder.toxin_mod_perk *= 1.25
	holder.stats.changeStat(STAT_ROB, -20)
	holder.stats.changeStat(STAT_TGH, -20)
	holder.stats.changeStat(STAT_VIG, -20)
	holder.stats.changeStat(STAT_COG, -20)
	holder.stats.changeStat(STAT_MEC, -20)
	holder.stats.changeStat(STAT_BIO, -20)
	if(ishuman(L))
		var/mob/living/carbon/human/M = L
		if(M.stats.getPerk(PERK_OVERBREATH))
			M.mob_ablative_armor += 10

/datum/perk/rezsickness/severe/fatal/remove()
	holder.brute_mod_perk /= 1.25
	holder.burn_mod_perk /= 1.25
	holder.oxy_mod_perk /= 1.25
	holder.toxin_mod_perk /= 1.25
	holder.stats.changeStat(STAT_ROB, 20)
	holder.stats.changeStat(STAT_TGH, 20)
	holder.stats.changeStat(STAT_VIG, 20)
	holder.stats.changeStat(STAT_COG, 20)
	holder.stats.changeStat(STAT_MEC, 20)
	holder.stats.changeStat(STAT_BIO, 20)
	..()

/datum/perk/rezsickness/on_process()
	if(!..())
		return
	if(cooldown_time <= world.time)
		holder.stats.removePerk(type)
		to_chat(holder, SPAN_NOTICE("[lose_text]"))
		return
	if(holder.buckled)
		cooldown_time -= 2 SECONDS

/datum/perk/racial/slime_rez_sickness
	name = "Aulvae Decohesion Syndrome"
	desc = "You've recently been returned to cohesion via the use of high-energy toxins which have left your form in a semi-stable state."
	gain_text = "Your core vibrates and crackles with barely contained energy as you're revived. You feel stronger than ever, but your form is unstable and fragile. Perhaps it'd be best to lie down and allow time for this to pass, lest you loose cohesion once again."
	lose_text = "The thunder bouncing around just beneath your dermis has passed and you feel stable once again."
	var/initial_time
	icon_state = "slime_rez"

/datum/perk/racial/slime_rez_sickness/assign(mob/living/L)
	..()
	initial_time = world.time
	cooldown_time = world.time + 30 MINUTES
	holder.brute_mod_perk *= 1.3
	holder.burn_mod_perk *= 1.3
	holder.stats.changeStat(STAT_ROB, 30)
	holder.stats.changeStat(STAT_TGH, -30)
	holder.stats.changeStat(STAT_VIG, -30)

/datum/perk/racial/slime_rez_sickness/remove()
	holder.brute_mod_perk /= 1.3
	holder.burn_mod_perk /= 1.3
	holder.stats.changeStat(STAT_ROB, -30)
	holder.stats.changeStat(STAT_TGH, 30)
	holder.stats.changeStat(STAT_VIG, 30)
	..()

/datum/perk/racial/slime_rez_sickness/on_process()
	if(!..())
		return
	if(cooldown_time <= world.time)
		holder.stats.removePerk(type)
		to_chat(holder, SPAN_NOTICE("[lose_text]"))
		return
	if(holder.buckled)
		cooldown_time -= 2 SECONDS
