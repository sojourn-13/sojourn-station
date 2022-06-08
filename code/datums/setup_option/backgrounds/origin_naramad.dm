/datum/category_item/setup_option/background/ethnicity/naramadnorth
	name = "Northern Naramad"
	desc = "The northern naramad has a more simplistic mind compared to its sister species. \
			Having grown up in large communal families on Norian the northern naramadi hold a general if not extreme distrust of all non-Naramadi. \
			And on the other end of the spectrum they bond more easily with fellow naramdi and will perform greater acts of self-sacrifice for each other. \
			Northern naramdi are considered the best for manual within Sol Federation's military or alternatively within the rich mines upon their homeworld. \
			Their simpler lives outside of their mandatory service is focused more farming, growing food, menial labor, and care for each other. \
			Once their service is finished, it is rare for this group that is so dependant and comfortable around their own to not return home."

	restricted_to_species = list(FORM_NARAMAD)

	stat_modifiers = list(
		STAT_ROB = 0,
		STAT_TGH = 10,
		STAT_VIG = -10,
		STAT_BIO = 5,
		STAT_MEC = 0,
		STAT_COG = -5
	)

/datum/category_item/setup_option/background/ethnicity/naramadsouth
	name = "Southern Naramad"
	desc = "The southern naramad is perhaps the only thing in naramadi society considered 'intelligent' by any stretch of the word. \
			In the southern tribes the naramad people are far more enthusiastic towards scavenging the old ruins that dot the landscape of their home-world. \
			Their enthusiasm for such work borders into a cult like belief that technology brings good luck and the more advanced it is the more worthy a trophy it makes. \
			Such a focus on mental pursuits have made southern naramad a little more adept at technology then others of their kind, but the technophilia has made them poorly adapted to \
			the workings of the body."

	restricted_to_species = list(FORM_NARAMAD)

	stat_modifiers = list(
		STAT_ROB = 0,
		STAT_TGH = 0,
		STAT_VIG = 0,
		STAT_BIO = -20,
		STAT_MEC = 10,
		STAT_COG = 10
	)

/datum/category_item/setup_option/background/ethnicity/naramadeast
	name = "Eastern Naramad"
	desc = "Of naramad tribals the eastern tribes are the most primitive and most brutalistic of them. They live for hunting and fighting, making them popular conscripts for military service. \
			An eastern naramads focus on physical combat improves their already impressive strength and tough bodies but does little improve much else. \
			Even among their own kind the eastern naramads are considered Luddites, their brash natures and complete ignorance of things unrelated to combat bar them from science, medical \
			engineering, command roles, and many more complex jobs within security and prospectors."

	restricted_to_species = list(FORM_NARAMAD)

	restricted_depts = SCIENCE | MEDICAL | ENGINEERING | COMMAND
	restricted_jobs = list(/datum/job/salvager, /datum/job/supsec, /datum/job/serg, /datum/job/inspector, /datum/job/medspec, /datum/job/officer)

	stat_modifiers = list(
		STAT_ROB = 10,
		STAT_TGH = 10,
		STAT_VIG = 15,
		STAT_BIO = -20,
		STAT_MEC = -20,
		STAT_COG = -15
	)

/datum/category_item/setup_option/background/ethnicity/naramadspacer
	name = "Naramad Spacer"
	desc = "Though more uncommon than common some naramad are born and raised outside the confines of their home-world, unknowing of what their tribal affiliation is or its customs out of \
			what they are told second hand, if anything at all. A space born naramad is much better educated than their home-world tribals but this time spent being taught makes them less \
			physically imposing than the rough raised homeworlders. Unfortunately for the space born naramads not even they escape military conscription and often times, due to their relative intelligence, \
			act as desk workers for akula commanders or in logistical roles for naramadi squads and ships."

	restricted_to_species = list(FORM_NARAMAD)

	stat_modifiers = list(
		STAT_ROB = -10,
		STAT_TGH = -10,
		STAT_VIG = 0,
		STAT_BIO = 5,
		STAT_MEC = 5,
		STAT_COG = 15
	)