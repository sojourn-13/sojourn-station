/datum/category_item/setup_option/background/ethnicity/humancolony
	name = "Colony Ancestry"
	desc = "A catch all term to describe Humans and Abhumans born within Solarian Colonies. Those born here have access to much more prestigious and advanced education facilities, \
	along with various military pathways to choose from. Colony born humans tend to be widely skilled and physically better off than most as a result of clean living and access to \
	better form of education than most. You may have been born on a colony world or be the child of those that were, in either case you still reap the benefits of good genetics."

	restricted_to_species = list(FORM_HUMAN, FORM_EXALT_HUMAN)

	stat_modifiers = list(
		STAT_ROB = 3,
		STAT_TGH = 3,
		STAT_VIG = 3,
		STAT_BIO = 3,
		STAT_MEC = 3,
		STAT_COG = 3
	)

/datum/category_item/setup_option/background/ethnicity/humanfrontier
	name = "Frontier Ancestry"
	desc = "Frontier Space is the term for the fringes of known space and are often not as advanced as core world colonies. As a result, Frontier colonies are often beset upon by Void Wolves \
	and hostile fauna. Only the strong survive out here, thus Frontier Space is often populated by the toughest of humanity, yet such living rarely comes with a proper education. \
	You may not have been born on the frontier but your parents were and they gave you a what you needed to be tough and independent like them."

	restricted_to_species = list(FORM_HUMAN, FORM_EXALT_HUMAN)

	stat_modifiers = list(
		STAT_ROB = 6,
		STAT_TGH = 6,
		STAT_VIG = 6,
		STAT_BIO = 0,
		STAT_MEC = 0,
		STAT_COG = 0
	)

/datum/category_item/setup_option/background/ethnicity/humanspacer
	name = "Space Ancestry"
	desc = "Spacers have no planets nor lands to call their own, instead being born on ships and orbital stations. Due to such areas needing constant upkeep to remain functioning (and habitable), \
	a solid comprehension of engineering is required, which leads to Spacers quickly coming to learn their environment and technology exceptionally well. Living in a confined and environmentally \
	controlled space, however, weakens the body. You might have been born to spacers who finally put down roots on a planet or stayed in space, in either case they made sure to pass along \
	their technical skills to you."

	restricted_to_species = list(FORM_HUMAN, FORM_EXALT_HUMAN)

	stat_modifiers = list(
		STAT_ROB = 0,
		STAT_TGH = 0,
		STAT_VIG = 0,
		STAT_BIO = 6,
		STAT_MEC = 6,
		STAT_COG = 6
	)