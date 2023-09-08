/datum/job/foreigner
	title = "Visitor"
	flag = VISITOR
	department = DEPARTMENT_CIVILIAN
	department_flag = CIVILIAN
	faction = MAP_FACTION
	total_positions = -1
	spawn_positions = -1
	supervisors = "Your own desires."
	difficulty = "Very Easy."
	selection_color = "#dddddd"
	initial_balance = 800
	wage = WAGE_NONE //Get a job ya lazy bum

	outfit_type = /decl/hierarchy/outfit/job/foreigner

	stat_modifiers = list(
		STAT_ROB = 8,
		STAT_TGH = 8,
		STAT_BIO = 8,
		STAT_MEC = 8,
		STAT_VIG = 8,
		STAT_COG = 8
	)

	description = "The ideal role for new characters. You are not a member of the colony(yet) and as such do not require records, but as a foreigner who's been allowed in<br>\
you're held to very different standards.Use this freedom to determine your place in the world; Have you come from space, hoping to make a home in this place?<br>\
Are you a straggler from the woods, just looking for a few nights reprieve from the horrors of this planet?<br>\
Perhaps your intent for the colony is less charitable, intent to take advantage of your hosts misplaced trust?<br>\
<br>\
Regardless of what your reasons may be, remember that you are a guest in this place. If you create issues the Marshals or Shield may simply show you the gate, or worse."

/obj/landmark/join/start/foreigner
	name = "Visitor"
	icon_state = "player-grey"
	join_tag = /datum/job/foreigner