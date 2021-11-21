
#define PERK_HUMAN_ARMOUR_BOOST /datum/perk/job/natural_armour
/datum/perk/job/natural_armour
	name = "Natural Rough Body"
	desc = "You've been through EVERYTHING due to your frontier origins. Spider bites, random cuts, and slashes on rusted metal and wood, animal clawing and bitting. As a result, via natural adaptation using some sorta exoskeleton or just more resistant fur/skin/scales due to your ancestors, or simply you are stronger due to your rough body, you resist every type of damage just a little bit better than others due to your origins."

/datum/perk/job/natural_armour/assign(mob/living/carbon/human/H)
	..()
	holder.brute_mod_perk += 0.2
	holder.burn_mod_perk += 0.2
	holder.oxy_mod_perk += 0.1

/datum/perk/job/natural_armour/remove()
	holder.brute_mod_perk -= 0.2
	holder.burn_mod_perk -= 0.2
	holder.oxy_mod_perk -= 0.1

//======================================

#define PERK_HUMAN_BOOST /datum/perk/intelligenceboost

/datum/perk/intelligenceboost
	name = "Brain Workout"
	desc = "Your intelligence is somehow above average, and due to your origins, you can push your brain capacity to limits enhancing your mental capacity due to your adapted biology, but everything has a price to pay and due to that you get absolutely wrecked after using it. Use this to center your thoughts and increase your mental abilities and make your ancestor proud."
	active = FALSE
	passivePerk = FALSE

/datum/perk/intelligenceboost/activate()
	var/mob/living/carbon/human/user = usr
	if(!istype(user))
		return ..()
	if(world.time < cooldown_time)
		to_chat(usr, SPAN_NOTICE("You are mentally and physically exhausted, you'll need more rest before you can attempt that again."))
		return FALSE
	cooldown_time = world.time + 10 MINUTES
	if(holder.buckled)
		cooldown_time -= 2 SECONDS
	user.visible_message("[user] suddenly looks lost in thought, their focus elsewhere for a moment.", "You push your brain capacity to its limit trying to focus!", "You hear a worrying silence as if someone nearby is thinking very deeply.")
	user.reagents.add_reagent("satarotol", 10)
	return ..()

/datum/reagent/stim/satarotol
	name = "Satarotol"
	id = "satarotol"
	description = "A chemical naturally produced by some species that allows them to force the brain to work harder."
	taste_description = "brain freeze"
	reagent_state = LIQUID
	color = "#5f95a3"
	nerve_system_accumulations = 0.5
	appear_in_default_catalog = FALSE
	metabolism = REM/2

/datum/reagent/stim/satarotol/affect_blood(mob/living/carbon/M, alien, effect_multiplier)
	M.stats.addTempStat(STAT_COG, STAT_LEVEL_BASIC, STIM_TIME, "satarotol")
	M.stats.addTempStat(STAT_VIG, STAT_LEVEL_BASIC, STIM_TIME, "satarotol")


//======================================

#define PERK_HUMAN_SKILL_BOOST /datum/perk/factotum

/datum/perk/factotum
	name = "Naturaly Handyman"
	desc = "You were always the different one, always dedicated, always working hard, the life on the Colony was somehow easy, you always had that education at hands, always had a bountiful of friends, and generally you always had a lot of skills to spare!"

	active = FALSE
	passivePerk = FALSE

/datum/perk/factotum/activate()
	var/mob/living/carbon/human/user = usr
	if(!istype(user))
		return ..()
	if(world.time < cooldown_time)
		to_chat(usr, SPAN_NOTICE("You are so physically exhausted, you'll need more rest before you can do that again."))
		return FALSE
	cooldown_time = world.time + 10 MINUTES
	if(holder.buckled)
		cooldown_time -= 2 SECONDS
	user.visible_message("[user] suddenly looks clumsy.", "You push your body capacity to its limit trying to focus on your current job!")
	user.reagents.add_reagent("ritalinail ", 10)
	return ..()

/datum/reagent/stim/ritalinail 
	name = "Ritalinail"
	id = "ritalinail "
	description = "A chemical naturally produced by some species that allows them to force their body to work harder."
	taste_description = "muscle freeze"
	reagent_state = LIQUID
	color = "#5f95a3"
	nerve_system_accumulations = 0.5
	appear_in_default_catalog = FALSE
	metabolism = REM/2

/datum/reagent/stim/ritalinail/affect_blood(mob/living/carbon/M, alien, effect_multiplier)
	M.stats.addTempStat(STAT_MEC, STAT_LEVEL_BASIC, STIM_TIME, "ritalinail")
	M.stats.addTempStat(STAT_BIO, STAT_LEVEL_BASIC, STIM_TIME, "ritalinail")
