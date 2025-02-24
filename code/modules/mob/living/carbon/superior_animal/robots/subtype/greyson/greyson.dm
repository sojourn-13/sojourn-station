/mob/living/carbon/superior/robot/gp
	name = "Greyson Positronic RMB-A unit"
	desc = "A small round drone, usually tasked with carrying out menial tasks. This one seems pretty harmless."
	icon = 'icons/mob/battle_roomba.dmi'
	icon_state = "roomba"
	faction = "greyson"
	cant_be_pulled = TRUE

	get_stat_modifier = TRUE

	allowed_stat_modifiers = list(
		/datum/stat_modifier/mob/living/carbon/superior/durable = 15,
		/datum/stat_modifier/mob/living/carbon/superior/armor/mult/negative/low = 7,
		/datum/stat_modifier/mob/living/carbon/superior/armor/mult/negative/medium = 3,
		/datum/stat_modifier/mob/living/carbon/superior/young/robotic = 5, //we dont want them ALWAYS to be mega super fast
		/datum/stat_modifier/mob/living/carbon/superior/old/robotic = 15,
		/datum/stat_modifier/mob/living/carbon/superior/brutish/robotic = 15,
		/datum/stat_modifier/mob/living/damage/negative/mixed/flat/low = 6,
		/datum/stat_modifier/mob/living/carbon/superior/brutal/robotic = 6,
		/datum/stat_modifier/mob/living/carbon/superior/aggressive/savage/robotic = 2,
		/datum/stat_modifier/mob/living/carbon/superior/aggressive = 8,
		/datum/stat_modifier/mob/living/carbon/superior/deadeye = 12,
		/datum/stat_modifier/mob/living/carbon/superior/triggerfinger/robotic = 7,
		/datum/stat_modifier/mob/living/carbon/superior/quickdraw = 3,
		/datum/stat_modifier/mob/living/carbon/superior/slowdraw = 8,
		/datum/stat_modifier/mob/living/carbon/superior/slowaimed = 8,
	)
