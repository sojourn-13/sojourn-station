//Where we worked our entire life or perhaps not even that, what existence we went throught
/datum/category_group/setup_option_category/background/profession
	name = "Profession"
	category_item_type = /datum/category_item/setup_option/background/profession

/datum/category_item/setup_option/background/profession

/*
	With professions (formerly carreers this just sounds better) due to overall reduction in points gained should go way more ham
	general rule of thumb should be, compensate those that give perks with way less stats gained than those that don't IF you even
	give away perks to make it more attractive to some people but to others just who cares.
	Without perk it should amount to around 25-30 points
	With perk keep the minuses at around 10-15 in the minus or keep the balance equilibrium at least even
*/

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////
/* General */
/////////////
/datum/category_item/setup_option/background/profession/jack
	name = "Jack-of-all-trades"
	desc = "Average Joe, good for nothing, never learned anything useful, all of these describe you perfectly. \
	You never were one for learning, you never excelled at anything particular and here you are now, useless slab of meat in the grinder of space. \
	But just because you don't excel in one field doesn't make you unusable, prove for all the non-believers you are just as good as them."

	stat_modifiers = list(
		STAT_ROB = 5,
		STAT_TGH = 5,
		STAT_VIG = 5,
		STAT_BIO = 5,
		STAT_MEC = 5,
		STAT_COG = 5
	)

/datum/category_item/setup_option/background/profession/alcoholic
	name = "Career Alcoholic"
	desc = "From the second you first tasted alcohol you knew it was your calling, from bitter beer to strongest whiskey none stay safe in your vicinity. \
	Your body is incapable of living without daily dose and as such results in violent withdrawal making day to day tasks extremely difficult. \
	But just one sip makes you feel alive again, allowing you to even remember the basics of drunk-fu."

	perks = list(PERK_ALCOHOLIC)

	stat_modifiers = list(
		STAT_ROB = 0,
		STAT_TGH = 0,
		STAT_VIG = 0,
		STAT_BIO = -5,
		STAT_MEC = -5,
		STAT_COG = -6
	)

////////////
/* Combat */
////////////

/datum/category_item/setup_option/background/profession/military
	name = "Former Military"
	desc = "The Solarian Federation is the largest industrial military complex in the galaxy, former members are extremely common be they conscripts of conquered empires or citizens seeking \
	to serve their nation. Some individuals may come from their own planetary defense forces, serving as a combination of planetary guard and soldier. Military training has the benefit \
	of physical conditioning and marksmanship training, but the stamping out of the individual makes most lose their creativity."

	stat_modifiers = list(
		STAT_ROB = 7,
		STAT_TGH = 8,
		STAT_VIG = 10,
		STAT_BIO = -2,
		STAT_MEC = -2,
		STAT_COG = -6
	)

/datum/category_item/setup_option/background/profession/criminal
	name = "Former Criminal"
	desc = "Maybe you were a low tier ganger, a mafioso, or a professional with a criminal syndicate. Whatever you were it wasn't honest, nor was it something any good person could take pride in. \
	Your former connections, for they are former as you've left that life behind, still haunt you as your record is known by security. As such your records should contain a detailed list of \
	your past and history, after all, its the frontier and the colony can't be as picky as bigger empires. But that life has at least gifted you with some broad if boorish skills and a quick fingered \
	disposition for snatching objects off of people without them noticing."

	perks = list(/datum/perk/fast_fingers)

	stat_modifiers = list(
		STAT_ROB = 4,
		STAT_TGH = 0,
		STAT_VIG = 6,
		STAT_BIO = -4,
		STAT_MEC = -4,
		STAT_COG = -2 //Dumb as a stump
	)

///////////
/* Brain */
///////////

/datum/category_item/setup_option/background/profession/doctor
	name = "Former Doctor"
	desc = "You used to be or perhaps still are to some degree a doctor be it qualified and licensed or just some poor quack.\
	You posses basic knowledge on how to keep a person alive or at least way more than average person around. "

	stat_modifiers = list(
		STAT_ROB = -10,
		STAT_TGH = -5,
		STAT_VIG = 0,
		STAT_BIO = 15,
		STAT_MEC = -10,
		STAT_COG = 10 //So you can straight up use syringes
	)

/datum/category_item/setup_option/background/profession/doctor
	name = "Former Engineer"
	desc = "You used to be or perhaps still are a qualified engineer or tinkerer with some knack for machinery and devices.\
	You posses basic knowledge how to take apart and put together entire machines but dealing with flesh is entirely foreing to you."

	stat_modifiers = list(
		STAT_ROB = 5,
		STAT_TGH = -5,
		STAT_VIG = -10,
		STAT_BIO = -15,
		STAT_MEC = 15,
		STAT_COG = 10
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
		STAT_ROB = -3,
		STAT_TGH = -3,
		STAT_VIG = -3,
		STAT_BIO = 0,
		STAT_MEC = 0,
		STAT_COG = 10
	)

