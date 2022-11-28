/*
		STAT_ROB = 2,
		STAT_TGH = 2,
		STAT_VIG = 2
*/

/datum/category_item/setup_option/background/origin/northlander
	name = "Northlander"
	desc = "The northlander sablekyne are a people devoted to family and tradition, built to survive in the cold mountainous regions they call home. \
			Northlanders live in a tougher environment then their southlander cousins, where fights and conflict between each other happens as commonly as attacks from the local wildlife. \
			The focus on physical martial success leaves far less time for study and as a result while you are a bit tougher you are not as learned. \
			Then again, when all else fails and diplomacy falls through you can always rely on your claws."
// Rob = 2 Tgh = 3
	stat_modifiers = list(
		STAT_ROB = 4,
		STAT_TGH = 5,
		STAT_VIG = 2,
		STAT_BIO = 0,
		STAT_MEC = 0,
		STAT_COG = 0
	)

	restricted_to_species = list(FORM_SABLEKYNE)

/datum/category_item/setup_option/background/origin/southlander
	name = "Southlander"
	desc = "The southlander sablekyne are a people who consider themselves simply better than anyone else, be it through martial or mental tasks. \
			Southlanders hail from the brutally hot desert along the equator of Onkarth living behind fortified walls where they conduct most of the planets commerce. \
			Southlanders are not shy about combat but their focus on more mental pursuits leave them less capable than their northern cousins. \
			After all, only a brute needs to resort to violence when so many other options exists."
// Rob = 1 Tgh = 1 Vig = 1 Bio = 1 Mec = 1
	stat_modifiers = list(
		STAT_ROB = 3,
		STAT_TGH = 3,
		STAT_VIG = 3,
		STAT_BIO = 1,
		STAT_MEC = 1,
		STAT_COG = 0
	)

	restricted_to_species = list(FORM_SABLEKYNE)

/datum/category_item/setup_option/background/origin/maunkyne
	name = "Maunkyne"
	desc = "The maunkyne are the absolute lowest dregs of sablekyne society, users of a highly addictive drug they are permanently enslaved to. \
			On their home-planet maunkyne are outcasts, executed in the north for the crime of existing and exiled in the south to the unforgiving desert wastes. \
			As a maunkyne you might be able to pass as a normal sablekyne, even amongst your more aware kin, but the colony's strict regulation on demon powder has left you without your fix. \
			Without it, your body is weak and prone to further addiction but your upbringing in the criminal underworld of Onkarth has left you with a feral cunning and tolerance to most drugs. \
			Even the most 'noble' maunkyne knows much about medicine, in particular the creation of highly profitable and illegal drugs."

	restricted_to_species = list(FORM_SABLEKYNE)

	perks = list(/datum/perk/addict)
//Bio = 5
	stat_modifiers = list(
		STAT_ROB = 2,
		STAT_TGH = 2,
		STAT_VIG = 2,
		STAT_BIO = 5,
		STAT_MEC = 0,
		STAT_COG = 0
	)
