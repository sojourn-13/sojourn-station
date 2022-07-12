/mob/living/carbon/superior_animal/robot/greyson
	name = "Greyson Positronic RMB-A unit"
	desc = "A small round drone, usually tasked with carrying out menial tasks. This one seems pretty harmless."
	icon = 'icons/mob/battle_roomba.dmi'
	icon_state = "roomba"
	faction = "greyson"
	cant_be_pulled = TRUE

	get_stat_modifier = TRUE

	allowed_stat_modifiers = list(
		/datum/stat_modifier/none = 25,
		/datum/stat_modifier/mob/living/carbon/superior_animal/durable = 10,
		/datum/stat_modifier/mob/living/carbon/superior_animal/quick = 3,
		/datum/stat_modifier/mob/living/carbon/superior_animal/brutish/robotic = 4,
		/datum/stat_modifier/mob/living/carbon/superior_animal/aggressive = 6,
	)

