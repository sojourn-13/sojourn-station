/* Racial
	stat_modifiers = list(
		STAT_VIG = 6 // Castellan has Toughness instead
	)
*/

/datum/category_item/setup_option/background/origin/jaeger
	name = "Jaeger"
	desc = "The jaegers are a group of frontier kriosan who plot the course for the spread of the kriosan civilization. \
			Jaegers are practical, individualistic, and self reliant with a rigid set of personal beliefs and stubbornness to the point of coming off as arrogant. \
			While to outsiders most jaegers come across as gun obsessed hermits, a fact not helped with their penchant for trophy taking, none can deny their skill with rifles. \
			Unfortunately all that time at the range and tinkering with their rifles hasn't improved much else."

	restricted_to_species = list(FORM_KRIOSAN)

	perks = list(PERK_GUNSMITH)

	stat_modifiers = list(
		STAT_ROB = 0,
		STAT_TGH = 0,
		STAT_VIG = 6,
		STAT_BIO = 0,
		STAT_MEC = 5,
		STAT_COG = 0
	)

/datum/category_item/setup_option/background/origin/vorhut
	name = "Former Vorhut Soldier"
	desc = "All Vorhut technically are soldiers, but a very real distinction is drawn between the civilians and the dedicated soldiers who serve as their empire's career storm troopers. \
	Vorhut battalions were originally formed and trained by the survivors of the rebellion with experience fighting the Solarian military, and were seen as fanatical and violent extremists. \
	Nowadays, Vorhut are far more focused on military superiority than racial, and have a reputation for following orders ruthlessly and without question. They often hold the belief that \
	their deaths are predetermined, and that if their time has come, they must face it with courage and dignity. If it has not, then their Corpsmen will see to it they live to battle another \
	day."

	restricted_to_species = list(FORM_KRIOSAN)

	perks = list(PERK_PERFECT_SHOT)

	stat_modifiers = list(
		STAT_ROB = 0,
		STAT_TGH = 0,
		STAT_VIG = 11,
		STAT_BIO = 0,
		STAT_MEC = 0,
		STAT_COG = 0
	)

/datum/category_item/setup_option/background/origin/castallen
	name = "Castellen"
	desc = "The castellen are the noble elite and highborn of the kriosan, genetically superior to the common folk they rule over but rarely found outside their own empire. \
			Castellens are widely known for their considerable size and physical merit but lack the practical training in most areas compared to others, in particular those dealing with people or \
			kriosans trademark rifles. A lifetime of being trained for the realm of politics and artisanship has made them quick to understand new things but abyssal at more other pursuits."

	restricted_to_species = list(FORM_KRIOSAN)

	perks = list(PERK_PRESENCE)

	stat_modifiers = list(
		STAT_ROB = 5,
		STAT_TGH = 6,
		STAT_VIG = 0,
		STAT_BIO = 0,
		STAT_MEC = 0,
		STAT_COG = 0
	)
