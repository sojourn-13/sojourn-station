/*/datum/category_group/setup_option_category/background/example
	name = "Example"
	category_item_type = /datum/category_item/setup_option/background/example

/datum/category_item/setup_option/background/example

/datum/category_item/setup_option/background/example/example
	name = "Example"
	desc = "Example background"
	restricted_depts = MEDICAL | SCIENCE
	restricted_jobs = list(/datum/job/captain)
	stat_modifiers = list(
		STAT_ROB = 1,
		STAT_TGH = 2,
		STAT_BIO = 3,
		STAT_MEC = 4,
		STAT_VIG = 5,
		STAT_COG = 6
	)
	perks = list(/datum/perk)

/*
/datum/category_item/setup_option/background/origin/streltsy
	name = "Wandering Streltsy"
	desc = "The Streltsy are known for their actions during the corporate wars on certain worlds such as Eureka and Predstraza. Serbians know them as valuable debt settlers and an escape from the conditions of their worlds, while more civilized worlds view them as despoilers and raiders. \
			While both of these preconceptions are correct in their own right, a less known fact is that most Streltsy who've survived the corporate war are still suffering the consequences of their participation due to the decimation of their numbers during the war, leading to a miserable quality of life and forcing them to start recruitment from wartorn worlds to desperately replenish their numbers from before the war. \
			Despite this, the survivors and their newer members are unparalleled in the arts of war, but lacking in the art of general technomancy."
	stat_modifiers = list(
		STAT_ROB = 5,
		STAT_TGH = 10,
		STAT_BIO = -10,
		STAT_MEC = -5,
		STAT_VIG = 10,
		STAT_COG = -10
	)

	restricted_jobs = list(/datum/job/captain, /datum/job/hop, /datum/job/chaplain, /datum/job/merchant, /datum/job/cmo, /datum/job/rd, /datum/job/ihc)
	restricted_depts = IRONHAMMER | MEDICAL | SCIENCE | CHURCH | GUILD | CIVILIAN | SERVICE
	*/
