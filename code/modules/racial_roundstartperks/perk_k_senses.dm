//////////////////////////////////////Kriosan perks
/datum/perk/bodysense
	name = "Enhance Body"
	desc = "You're a predator at heart and have the senses to match, for a short time your body toughens and your aim improves drastically as your senses enhance."
	active = FALSE
	passivePerk = FALSE

/datum/perk/bodysense/activate()
	var/mob/living/carbon/human/user = usr
	if(!istype(user))
		return ..()
	if(world.time < cooldown_time)
		to_chat(usr, SPAN_NOTICE("You haven't quite recovered yet, your senses need more time before you may use this again."))
		return FALSE
	cooldown_time = world.time + 5 MINUTES
	user.visible_message("<b><font color='red'>[user] sneers lightly as their pupils dilate and tension builds in their body!</font><b>", "<b><font color='red'>You feel your senses focusing, sound becomes crystal clear and your reflexes as fluid as water.</font><b>")
	log_and_message_admins("used their [src] perk.")
	user.reagents.add_reagent("trakritol", 3)
	return ..()

/datum/perk/greataim
	name = "Instinctual Skill"
	desc = "Alot of species understand the dynamics of air, to such a degree that guns are more extensions to one's hand than weapon."

/datum/reagent/stim/trakritol
	name = "Trakritol"
	id = "trakritol"
	description = "A chemical naturally produced by the several species that works like a form of adrenaline to enhance their bodies."
	taste_description = "bitterness"
	reagent_state = LIQUID
	color = "#1226e7"
	nerve_system_accumulations = 20
	appear_in_default_catalog = TRUE

/datum/reagent/stim/trakritol/affect_blood(mob/living/carbon/M, alien, effect_multiplier)
	M.stats.addTempStat(STAT_TGH, 5, STIM_TIME, "trakritol")
	M.stats.addTempStat(STAT_VIG, 10, STIM_TIME, "trakritol")
	M.add_chemical_effect(CE_DARKSIGHT)
	M.add_chemical_effect(CE_SPEEDBOOST, 0.01)
	M.add_chemical_effect(CE_PULSE, 1)
