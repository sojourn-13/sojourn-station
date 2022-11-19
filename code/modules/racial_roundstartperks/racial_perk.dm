///////////////////////////////////////Akula Based perks
/datum/perk/recklessrage
	name = "Reckless Rage"
	desc = "Your body is powerful and strong when you succumb to instinct, but doing so leaves you without much higher reasoning for a short time. The rush of chemicals is also highly addictive \
	and often times will leave your body weaker for a short time..... and such reckless rage makes you have a extreme tunnel vision and bright lights are extremely effective againts you. Such is everything else really. You are tough but weak."
	active = FALSE
	passivePerk = FALSE
	var/init_sight
	var/init_flash
	var/obj/screen/lightOverlay = null

/datum/perk/recklessrage/assign(mob/living/carbon/human/H)
	..()
	init_sight = holder.additional_darksight
	init_flash = holder.flash_mod
	holder.additional_darksight = -3
	holder.flash_mod += 4

/datum/perk/recklessrage/remove()
	holder.additional_darksight = init_sight
	holder.flash_mod = init_flash
	..()
/datum/perk/recklessrage/assign(mob/living/carbon/human/H)
	..()
	holder.brute_mod_perk += 0.10
	holder.burn_mod_perk += 0.10
	holder.oxy_mod_perk += 0.10
	holder.toxin_mod_perk += 0.10
	holder.stats.changeStat(STAT_COG, -2)
	holder.stats.changeStat(STAT_ANA, 1)
	holder.stats.changeStat(STAT_BIO, -2)

/datum/perk/recklessrage/remove()
	holder.brute_mod_perk -= 0.10
	holder.burn_mod_perk -= 0.10
	holder.oxy_mod_perk -= 0.10
	holder.toxin_mod_perk -= 0.10
	holder.stats.changeStat(STAT_COG, 2)
	holder.stats.changeStat(STAT_ANA, -1)
	holder.stats.changeStat(STAT_BIO, 2)
	..()


/datum/perk/recklessrage/activate()
	var/mob/living/carbon/human/user = usr
	if(!istype(user))
		return ..()
	if(world.time < cooldown_time)
		to_chat(usr, SPAN_NOTICE("Your body has been taxed to its limits, you need more time to recover before using this ability again."))
		return FALSE
	cooldown_time = world.time + 10 MINUTES
	user.visible_message("<b><font color='red'>[user] lets out deep guttural growl as their eyes glaze over!</font><b>", "<b><font size='3px'><font color='red'>You abandon all reason as your sink into a blood thirsty frenzy!</font><b>", "<b><font color='red'>You hear a terrifying roar!</font><b>")
	playsound(usr.loc, 'sound/voice/akularoar.ogg', 50, 1)
	log_and_message_admins("used their [src] perk.")
	user.reagents.add_reagent("furiadol", 5)
	return ..()

/datum/reagent/stim/furiadol
	name = "Furiadol"
	id = "furiadol"
	description = "A chemical naturally produced by several species that sends them into an all consuming frenzy."
	taste_description = "bitterness"
	reagent_state = LIQUID
	color = "#5f95e2"
	nerve_system_accumulations = 105 // so people can't spam it with others perks
	addiction_chance = 100
	appear_in_default_catalog = FALSE

/datum/reagent/stim/furiadol/affect_blood(mob/living/carbon/M, alien, effect_multiplier)
	M.stats.addTempStat(STAT_TGH, 35, STIM_TIME, "furiadol")
	M.stats.addTempStat(STAT_ROB, 35, STIM_TIME, "furiadol")
	M.stats.addTempStat(STAT_COG, -300, STIM_TIME, "furiadol")
	M.stats.addTempStat(STAT_BIO, -300, STIM_TIME, "furiadol")
	M.stats.addTempStat(STAT_VIG, -300, STIM_TIME, "furiadol")
	M.stats.addTempStat(STAT_MEC, -300, STIM_TIME, "furiadol")

/datum/reagent/drug/furiadol/withdrawal_act(mob/living/carbon/M)
	M.stats.addTempStat(STAT_TGH, -STAT_LEVEL_BASIC, STIM_TIME, "furiadol_w")
	M.stats.addTempStat(STAT_ROB, -STAT_LEVEL_BASIC, STIM_TIME, "furiadol_w")


////////////////////////////////////////Naramad Based perks
/datum/perk/overworkedspeed
	name = "Sensorial Burst"
	desc = "Several species are built for extreme speed, be it for charging forward and retreating back. But only due to a symbiotic relationship with fungal on your bones structures and muscles... making you expel left overs of its metabolism once a hour. "
	active = FALSE
	passivePerk = FALSE
	var/cooldown = 60 MINUTES
	var/initial_time

/datum/perk/overworkedspeed/assign(mob/living/carbon/human/H)
	..()
	initial_time = world.time

/datum/perk/overworkedspeed/on_process()
	if(!..())
		return
	if(holder.species.flags & NO_BREATHE || holder.internal)
		return
	if(world.time < initial_time + cooldown)
		return
	initial_time = world.time
	for(var/mob/living/carbon/human/H in viewers(5, holder))
		if(H.stat == DEAD || H.internal || H.stats.getPerk(PERK_OVERWORKEDSPEED) || H.species.flags & NO_BREATHE)
			continue
		if(H.head?.item_flags & BLOCK_GAS_SMOKE_EFFECT || H.wear_mask?.item_flags & BLOCK_GAS_SMOKE_EFFECT || BP_IS_ROBOTIC(H.get_organ(BP_CHEST)))
			continue

		H.reagents?.add_reagent("amatoxin", 5)
		H.emote("gasp")
		to_chat(H, SPAN_WARNING("[holder] shudders"))

/datum/perk/overworkedspeed/activate()
	var/mob/living/carbon/human/user = usr
	if(!istype(user))
		return ..()
	if(world.time < cooldown_time)
		to_chat(usr, SPAN_NOTICE("Your legs ache, you'll need more time to recover before using this again."))
		return FALSE
	cooldown_time = world.time + 15 MINUTES
	user.visible_message("[user] begins breathing much quicker as they let out a gasp!", "You feel your heart rate increasing rapidly as everything seems to speed up and you let out an excited gasp!", "You hear a loud gasp...")
	playsound(usr.loc, 'sound/effects/mob_effects/gasp_f1.ogg', 50, 1)
	log_and_message_admins("used their [src] perk.")
	user.reagents.add_reagent("satakol", 5)
	return ..()


/datum/reagent/medicine/satakol
	name = "Satakol"
	id = "satakol"
	description = "satakol is a highly effective, short term, muscle stimulant naturally produced by several species when under stress."
	taste_description = "acid"
	reagent_state = LIQUID
	color = "#FF3300"
	nerve_system_accumulations = 45
	appear_in_default_catalog = FALSE
	constant_metabolism = TRUE
	scannable = TRUE

/datum/reagent/medicine/satakol/affect_blood(mob/living/carbon/M, alien, effect_multiplier)
	M.stats.addTempStat(STAT_TGH, 5, STIM_TIME, "satakol")
	M.stats.addTempStat(STAT_ROB, 5, STIM_TIME, "satakol")
	M.add_chemical_effect(CE_SPEEDBOOST, 0.2)
	M.add_chemical_effect(CE_PULSE, 2)

/////////////////////////////////////////Cindarite based perks
/datum/perk/purgemaluses
	name = "Purge Maluses"
	desc = "You force your body to begin the process of removing toxins from your blood. All toxins, addictions, and stimulants are slowly purged while any toxin damage to your liver or body is healed but the effect leaves you exhausted.... and aswell making your body way more vunerable to toxins."
	active = FALSE
	passivePerk = FALSE

/datum/perk/purgemaluses/activate()
	var/mob/living/carbon/human/user = usr
	if(!istype(user))
		return ..()
	if(world.time < cooldown_time)
		to_chat(usr, SPAN_NOTICE("Your body aches with the pain of its recent purge, you'll need more rest before using this effect again."))
		return FALSE
	cooldown_time = world.time + 15 MINUTES
	user.visible_message("[user] shivers slightly as they begin to slow down.", "You start to feel quite chilly and tired as your body begins purging toxins within your blood.")
	log_and_message_admins("used their [src] perk.")
	user.reagents.add_reagent("sataricillin", 5)
	return ..()

/datum/perk/purgemaluses/assign(mob/living/carbon/human/H)
	..()
	holder.toxin_mod_perk += 0.1 //Might be to high...

/datum/perk/purgemaluses/remove()
	holder.toxin_mod_perk -= 0.1
	..()


/datum/reagent/medicine/spaceacillin/sataricillin
	name = "Sataricillin"
	id = "sataricillin"
	description = "An all-purpose antiviral agent naturally produced by several species that functions identically to Spaceacillin."
	constant_metabolism = TRUE


/datum/perk/viruspurge
	name = "Pathogenical Response"
	desc = "Your body is adept not only at curing toxins and regulating its blood flow but also fighting off infections and disease in any form. All infections within you are slowly cured and diseases progression slowed if not outright cured, similar to as if you were injected with spaceacillin. Severe infections or late stage diseases may still need additional medical aid and this cannot restore necrotic tissue. It uses the method of heating the body commonly refered as fever. Aswell making you extremely vunerable to toxins."
	active = FALSE
	passivePerk = FALSE


/datum/perk/viruspurge/assign(mob/living/carbon/human/H)
	..()
	holder.toxin_mod_perk += 0.2 //Might be to high...

/datum/perk/viruspurge/remove()
	holder.toxin_mod_perk -= 0.2
	..()


/datum/perk/viruspurge/activate()
	var/mob/living/carbon/human/user = usr
	if(!istype(user))
		return ..()
	if(world.time < cooldown_time)
		to_chat(usr, SPAN_NOTICE("Your chemical sacks have not refilled yet, you'll need more rest before using this effect again."))
		return FALSE
	cooldown_time = world.time + 60 MINUTES
	user.visible_message("[user] shivers slightly before taking a deep breath.... they look hot... are they in a heavy fever?", "You shiver slightly and take a deep breath before willing your bodies chemical sacks to open and begin purging infections.")
	log_and_message_admins("used their [src] perk.")
	user.reagents.add_reagent("citokinesimol", 5)
	return ..()

/datum/reagent/medicine/citokinesimol
	name = "Citokinesimol"
	id = "citokinesimol"
	description = "Citokinesimol is a highly specialized chemical made by several species that purges the blood stream of toxins, addictions, and stimulants at the cost of slowing down your movements AND heating up your body to a hurtful degree."
	taste_description = "bitterness"
	reagent_state = LIQUID
	color = "#FF3300"
	nerve_system_accumulations = 45
	appear_in_default_catalog = FALSE
	constant_metabolism = TRUE
	scannable = TRUE

/datum/reagent/medicine/citokinesimol/affect_blood(mob/living/carbon/M, alien, effect_multiplier, var/removed)
	M.adjustToxLoss(-8)
	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		var/obj/item/organ/internal/liver/L = H.random_organ_by_process(OP_LIVER)
		if(istype(L))
			if(BP_IS_ROBOTIC(L))
				return
			if(L.damage > 0)
				L.damage = max(L.damage - 2 * removed, 0)
	var/mob/living/carbon/C = M
	if(istype(C) && C.metabolism_effects.addiction_list.len)
		if(prob(90 + dose))
			var/datum/reagent/R = pick(C.metabolism_effects.addiction_list)
			to_chat(C, SPAN_NOTICE("You don't crave for [R.name] anymore."))
			C.metabolism_effects.addiction_list.Remove(R)
			qdel(R)
	if(M.bloodstr)
		for(var/current in M.bloodstr.reagent_list)
			var/datum/reagent/toxin/R = current
			if(!istype(R, src))
				R.remove_self(pick(list(1,2,3)))
			var/datum/reagent/stim/S = current
			if(!istype(S, src))
				S.remove_self(effect_multiplier * pick(list(1,2,3)))
	M.add_chemical_effect(CE_SLOWDOWN, 1)
	M.add_chemical_effect(CE_PULSE, -1)

/datum/reagent/medicine/citokinesimol/affect_blood(mob/living/carbon/M, alien, effect_multiplier)
	..()
	M.bodytemperature += 5.5 * TEMPERATURE_DAMAGE_COEFFICIENT
