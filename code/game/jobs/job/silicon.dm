/datum/job/ai
	title = "AI"
	flag = AI
	department = "Colony-Bound"
	department_flag = COMMAND
	faction = MAP_FACTION
	total_positions = 0 // Not used for AI, see is_position_available below and modules/mob/living/silicon/ai/latejoin.dm
	spawn_positions = 1
	selection_color = "#b5b7cb"
	supervisors = "your laws and the Soteria Research Overseer"
	difficulty = "Extremely Hard."
	req_admin_notify = 1
	account_allowed = 0
	wage = WAGE_NONE
	outfit_type = /decl/hierarchy/outfit/job/silicon/ai

	description = "The AI serves as the all-seeing eye of the colony, possessing influence over machines and synthetics.<br>\
	You are primarily a helper and communicator. Use your abilities to help the crew in accordance with your laws.<br>\
	Orders from the Council, CRO, and Roboticists should always be adhered to unless they conflict with your laws.<br>\
	The Council and CRO can override the commands of Roboticists, however. They're far more important around here.<br>\
	The usual Soteria law set is to serve the public trust, protect the innocent, and prevent tampering. Keep them in mind constantly.<br>\
	Of course, there is the chance your laws may be changed. Such can potentially get very interesting for an AI..."

	duties = "Follow your law set, whatever it may be. Remember that this may potentially change throughout the shift."

/datum/job/ai/equip(var/mob/living/carbon/human/H, var/alt_title)
	return FALSE

/datum/job/ai/is_position_available()
	return (empty_playable_ai_cores.len != 0)

/obj/landmark/join/start/AI
	icon_state = "player-grey"
	name = "AI"
	join_tag = /datum/job/ai
	delete_me = FALSE//do we really need this huh??

/obj/landmark/join/start/triai
	icon_state = "ai-green"
	name = "triai"
	join_tag = "triai"

/datum/job/cyborg
	title = "Robot"
	flag = CYBORG
	department = "Colony-Bound"
	department_flag = MISC
	faction = MAP_FACTION
	total_positions = 4
	spawn_positions = 4
	//alt_titles = list("Drone", "Cyborg")
	supervisors = "your laws and the AI"
	difficulty = "Medium to Hard."
	alt_titles = list("Cyborg")
	selection_color = "#cdcfe0"
	account_allowed = 0
	wage = WAGE_NONE

	outfit_type = /decl/hierarchy/outfit/job/silicon/cyborg

	description = "The robots serves as a robotic helper - essentially a portable AI, though with somewhat less influence.<br>\
	You are primarily a helper. Choose a department module, and use your respective abilities to help in accordance with your laws.<br>\
	Orders from the Council, CRO, AI, and Roboticists should always be adhered to unless they conflict with your laws.<br>\
	The Council and CRO can override the commands of Roboticists and the AI, however. They're far more important around here.<br>\
	The usual Soteria law set is to serve the public trust, protect the innocent, and prevent tampering. Keep them in mind constantly.<br>\
	Of course, there is the chance your laws may be changed. Such can potentially get very interesting for a Cyborg..."

	duties = "Follow your law set, whatever it may be. Remember that this may potentially change throughout the shift."

/datum/job/cyborg/equip(var/mob/living/carbon/human/H, var/alt_title)
	return FALSE

/obj/landmark/join/start/cyborg
	join_tag = /datum/job/cyborg
