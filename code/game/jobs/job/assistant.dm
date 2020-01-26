/datum/job/assistant
	title = "Assistant"
	flag = ASSISTANT
	department = DEPARTMENT_CIVILIAN
	department_flag = CIVILIAN
	faction = MAP_FACTION
	total_positions = -1
	spawn_positions = -1
	supervisors = "anyone who pays you"
	selection_color = "#dddddd"
	initial_balance	= 800
	wage = WAGE_NONE //Get a job ya lazy bum
	//alt_titles = list("Guild Novice","Soteria Intern","Lonestar Intern")
	also_known_languages = list(LANGUAGE_CYRILLIC = 15, LANGUAGE_SERBIAN = 5)

	access = list(access_maint_tunnels)
	outfit_type = /decl/hierarchy/outfit/job/assistant

	stat_modifiers = list(
		STAT_ROB = 8,
		STAT_TGH = 8,
		STAT_BIO = 8,
		STAT_MEC = 8,
		STAT_VIG = 8,
		STAT_COG = 8
	)

	description = "You don't hold an official job amongst the colony. You will not be paid a wage.<br>\
Where did you come from, why are you here? These things are up to you.<br>\

Perhaps you're a fresh faced member of the work force, having just come of age or got out of higher schooling.<br>\
Perhaps you're a new arrival, who paid for transit. Where are you going or what are you running from?<br>\
Perhaps you're a friend, relative, spouse or lover of an existing crewmember. How can you support them in their work?<br>\
Perhaps you're a young apprentice, signed on with the promise of starting a new and exciting career.<br>\
Perhaps you're a former prisoner, ready to join the crew after their served time.<br>\
Perhaps you were marooned on an asteroid and rescued by the colonist?<br>\

Your story is yours to write. What matters is, you're here now, and you should find purpose.<br>\
As an assistant, you should strive to help out anyone you can. Or at least, anyone who offers you a paying job.<br>\
Find a way to make money, stay out of trouble, and survive."

	loyalties = "Your loyalty is yours to decide."

/obj/landmark/join/start/assistant
	name = "Assistant"
	icon_state = "player-grey"
	join_tag = /datum/job/assistant
