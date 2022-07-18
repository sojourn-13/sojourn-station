/mob/living/carbon/superior_animal/robot/greyson
	name = "Greyson Positronic RMB-A unit"
	desc = "A small round drone, usually tasked with carrying out menial tasks. This one seems pretty harmless."
	icon = 'icons/mob/battle_roomba.dmi'
	icon_state = "roomba"
	faction = "greyson"
	cant_be_pulled = TRUE

	get_stat_modifier = TRUE

	allowed_stat_modifiers = list(
		/datum/stat_modifier/mob/living/carbon/superior_animal/durable = 15,
		/datum/stat_modifier/mob/living/carbon/superior_animal/armor/mult/negative/low = 7,
		/datum/stat_modifier/mob/living/carbon/superior_animal/armor/mult/negative/medium = 3,
		/datum/stat_modifier/mob/living/carbon/superior_animal/young/robotic = 5, //we dont want them ALWAYS to be mega super fast
		/datum/stat_modifier/mob/living/carbon/superior_animal/old/robotic = 15,
		/datum/stat_modifier/mob/living/carbon/superior_animal/brutish/robotic = 15,
		/datum/stat_modifier/mob/living/damage/negative/mixed/flat/low = 6,
		/datum/stat_modifier/mob/living/carbon/superior_animal/brutal/robotic = 6,
		/datum/stat_modifier/mob/living/carbon/superior_animal/aggressive/savage/robotic = 2,
		/datum/stat_modifier/mob/living/carbon/superior_animal/aggressive = 8,
		/datum/stat_modifier/mob/living/carbon/superior_animal/deadeye = 12,
		/datum/stat_modifier/mob/living/carbon/superior_animal/triggerfinger/robotic = 7,
		/datum/stat_modifier/mob/living/carbon/superior_animal/quickdraw = 3,
		/datum/stat_modifier/mob/living/carbon/superior_animal/slowdraw = 8,
		/datum/stat_modifier/mob/living/carbon/superior_animal/slowaimed = 8,
	)
