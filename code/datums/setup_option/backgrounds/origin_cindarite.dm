/datum/category_item/setup_option/background/ethnicity/cindarbunker
	name = "Bunker Born"
	desc = "Cindarites born on their death world of Cindar now reside in the radiation proofed bunkers deep underground. \
			Such a living has its advantages and disadvantages, bunker born cindarites are very communal and focus heavily on maintaining over their domains to keep them in top condition. \
			After all, even a single breach could spell the end for the dwellers despite their in-born resistance to their toxic homeworld. Such a confined life style though spells poorly for \
			their physical health, so biological maintenance is just as important as physical."

	restricted_to_species = list(FORM_CINDAR)

	stat_modifiers = list(
		STAT_ROB = -5,
		STAT_TGH = -5,
		STAT_VIG = 0,
		STAT_BIO = 5,
		STAT_MEC = 5,
		STAT_COG = 0
	)

/datum/category_item/setup_option/background/ethnicity/cindarspacer
	name = "Spacer"
	desc = "Many cindarites choose to leave the confines of their death world of Cindar and instead choose to become spacers, spending their entire lives living on traveling ships. \
			Spacers often take work as engineers, merchants, and sometimes pirates as jobs are rarely ever steady. This broadens the already wide range of skills that most cindarites have, but \
			most of this knowledge is learned practically, making them poor studies on more advanced careers that can't be as easily learned from a hands on approach."

	restricted_to_species = list(FORM_CINDAR)

	stat_modifiers = list(
		STAT_ROB = 5,
		STAT_TGH = 0,
		STAT_VIG = 0,
		STAT_BIO = 0,
		STAT_MEC = 5,
		STAT_COG = -10
	)