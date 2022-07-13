/mob/living/carbon/superior_animal/robot/greyson
	name = "Greyson Positronic RMB-A unit"
	desc = "A small round drone, usually tasked with carrying out menial tasks. This one seems pretty harmless."
	icon = 'icons/mob/battle_roomba.dmi'
	icon_state = "roomba"
	faction = "greyson"
	cant_be_pulled = TRUE

	get_stat_modifier = TRUE

	allowed_stat_modifiers = list(
		/datum/stat_modifier/none = 100, //50% chance to have no prefix if we add all others up to this value i think
		/datum/stat_modifier/mob/living/carbon/superior_animal/durable = 20,
		/datum/stat_modifier/mob/living/carbon/superior_animal/young/robotic = 5,
		/datum/stat_modifier/mob/living/carbon/superior_animal/old/robotic = 10,
		/datum/stat_modifier/mob/living/carbon/superior_animal/brutish/robotic = 15,
		/datum/stat_modifier/mob/living/carbon/superior_animal/brutal/robotic = 5,
		/datum/stat_modifier/mob/living/carbon/superior_animal/aggressive/savage/robotic = 1,
		/datum/stat_modifier/mob/living/carbon/superior_animal/aggressive/ = 10,
		/datum/stat_modifier/mob/living/carbon/superior_animal/deadeye = 5,
		/datum/stat_modifier/mob/living/carbon/superior_animal/triggerfinger/robotic = 5,
		/datum/stat_modifier/mob/living/carbon/superior_animal/quickdraw = 5,
	)

