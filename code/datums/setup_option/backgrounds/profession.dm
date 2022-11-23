//Where we worked our entire life or perhaps not even that, what existence we went throught
/datum/category_group/setup_option_category/background/profession
	name = "Profession"
	category_item_type = /datum/category_item/setup_option/background/profession

/datum/category_item/setup_option/background/profession

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

////////////
/* Combat */
////////////

/datum/category_item/setup_option/background/profession/military
	name = "Former Military"
	desc = "The Solarian Federation is the largest industrial military complex in the galaxy, former members are extremely common be they conscripts of conquered empires or citizens seeking \
	to serve their nation. Some individuals may come from their own planetary defense forces, serving as a combination of planetary guard and soldier. Military training has the benefit \
	of physical conditioning and marksmanship training, but the stamping out of the individual makes most lose their creativity."

	stat_modifiers = list(
		STAT_ROB = 3,
		STAT_TGH = 5,
		STAT_VIG = 5,
		STAT_BIO = -2,
		STAT_MEC = -2,
		STAT_COG = -5
	)

/datum/category_item/setup_option/background/profession/criminal
	name = "Former Criminal"
	desc = "Maybe you were a low tier ganger, a mafioso, or a professional with a criminal syndicate. Whatever you were it wasn't honest, nor was it something any good person could take pride in. \
	Your former connections, for they are former as you've left that life behind, still haunt you as your record is known by security. As such your records should contain a detailed list of \
	your past and history, after all, its the frontier and the colony can't be as picky as bigger empires. But that life has at least gifted you with some broad if boorish skills and a quick fingered \
	disposition for snatching objects off of people without them noticing."

	perks = list(/datum/perk/fast_fingers)

	stat_modifiers = list(
		STAT_ROB = 0,
		STAT_TGH = 0,
		STAT_VIG = 2,
		STAT_BIO = -2,
		STAT_MEC = -2,
		STAT_COG = -2 //Dumb as a stump
	)


//////////////
/* Psionics */
//////////////

/datum/category_item/setup_option/background/profession/psi_sufficiency
	name = "Psionic Scholar"
	desc = "Once in life, you were a scholar and researcher. This may have been academic, personal interest, or hobbyist but regardless the reason you spent a great deal of time collecting massive \
	amounts of information from various cultures, planets, and sectors both advanced and primitive. Regardless of where your focus laid, you became quite used to piecing together and categorizing \
	details to such an extent that it became second nature. As a result, should you ever become a psion, your ability to hyper focus without losing the bigger picture allows you to lessen the \
	negative side effects of your powers and use some abilities at no cost."

	perks = list(/datum/perk/psi_attunement)

	stat_modifiers = list(
		STAT_ROB = 0,
		STAT_TGH = 0,
		STAT_VIG = 0,
		STAT_BIO = 0,
		STAT_MEC = 0,
		STAT_COG = 0
	)

