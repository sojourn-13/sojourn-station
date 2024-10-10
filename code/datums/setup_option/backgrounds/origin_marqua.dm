/datum/category_item/setup_option/background/ethnicity/marquaintelligensia
	name = "Observer"
	desc = "Your studies have been done at a distance, collecting information through watching other skill professions work their labors. \
	Due to this, you lack physical ability to pass basic training for most outdoor roles that would require it."

	restricted_to_species = list(FORM_MARQUA)

	restricted_depts = SECURITY
	restricted_jobs = list(/datum/job/pro, /datum/job/foreman, /datum/job/off_colony_hunt_master, /datum/job/off_colony_hunter)

	stat_modifiers = list(
		STAT_ROB = -10,
		STAT_TGH = -10,
		STAT_VIG = -10,
		STAT_BIO = 10,
		STAT_MEC = 10,
		STAT_COG = 10
	)


/datum/category_item/setup_option/background/ethnicity/marquamenial
	name = "Practical"
	desc = "Your studies have been from your own labor, leading you to be more physically able than many others of your kind."

	restricted_to_species = list(FORM_MARQUA)

	stat_modifiers = list(
		STAT_ROB = -2,
		STAT_TGH = -2,
		STAT_VIG = -2,
		STAT_BIO = 5,
		STAT_MEC = 5,
		STAT_COG = 5
	)


/datum/category_item/setup_option/background/ethnicity/marquamartial
	name = "Martial"
	desc = "Your studies and training were done for physical confrontations, learning ways to better aim, adjust armor, and similar techniques for combat."

	restricted_to_species = list(FORM_MARQUA)

	stat_modifiers = list(
		STAT_ROB = 8,
		STAT_TGH = 12,
		STAT_VIG = 16,
		STAT_BIO = -7,
		STAT_MEC = -12,
		STAT_COG = -12
	)
