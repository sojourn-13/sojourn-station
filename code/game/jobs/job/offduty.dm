//
// "Off-duty" jobs are for people who want to do nothing and have earned it.
//
/datum/job/visitor
	title = "Visitor"
	latejoin_only = TRUE
	timeoff_factor = -1
	total_positions = -1
	faction = MAP_FACTION
	department = "Civilian"
	supervisors = "nobody! You're a visitor"
	selection_color = "#9b633e"
//	minimal_access = list(access_maint_tunnels)
	outfit_type = /decl/hierarchy/outfit/job/visitor