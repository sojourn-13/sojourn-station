/datum/category_item/setup_option/background/ethnicity/marquaintelligensia
	name = "Intelligensia"
	desc = "The intelligensia of the mar'qua are the formally trained and 'think-tank' of mar'qua society, making up most of their scientists in the fields of biology and mathematics. \
			As someone who has left the higher folds of the intelligensia you are one of skilled rapport but a life of easy living has made you quite physically weak. \
			You lack of physically capability also makes you ineligible for the colony security forces or as a prospector (except salvager), further locking you into your role as an intellectual."

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
	name = "Menial"
	desc = "Unfortunately for many mar'qua they are born as the gaaran-geraa, often called the menial castes. Your existence, much like your family and friends, was one of toil. \
			Menials are trained from early childhood to be pragmatic above all else and enjoy the simple toil of their work. Appearance and taste is secondary to function, always. \
			As a menial you lack the higher training of most mar'qua but a life of labor has made you toughened to the rigors of life, the sole benefit of low born status."

	restricted_to_species = list(FORM_MARQUA)

	stat_modifiers = list(
		STAT_ROB = 2,
		STAT_TGH = 5,
		STAT_VIG = 0,
		STAT_BIO = 2,
		STAT_MEC = 0,
		STAT_COG = 1
	)


/datum/category_item/setup_option/background/ethnicity/marquamartial
	name = "Martial"
	desc = "Also known as the quoqa-geraa, the martial caste of the mar'qua spends their entire lives training to defend the mar'qua empire. \
			The martial caste is strong, decisive, and extremely focused on the here and now of a situation to ensure the best choices are made. \
			While the martial caste is intelligent, after all they are still mar'qua, they lack the formal education even a menial is afforded, but a life of disciplined training has \
			improved their physical ability quite well."

	restricted_to_species = list(FORM_MARQUA)

	stat_modifiers = list(
		STAT_ROB = 4,
		STAT_TGH = 8,
		STAT_VIG = 12,
		STAT_BIO = -4,
		STAT_MEC = -10,
		STAT_COG = -10
	)
