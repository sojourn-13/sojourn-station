/* +6 Toughness as their racial */

/datum/category_item/setup_option/background/origin/akulabase
	name = "True-Born"
	desc = "You are a true akula with all the nitty gritty of it, constantly angered by the smallest inconvinience towering over everyone in your vicinity, you are the apex predator after all. \
	Or perhaps you are just more adjusted than most of your kinsmen and capable of living alongside your oppressors in space without biting their face off. \
	Whichever the case you are the definition of peak form of your species compared to your emancipated brethren, show them what it means to be a true warrior and not just a shark with makeup."

	restricted_to_species = list(FORM_AKULA)

	perks = list(PERK_RECKLESSFRENZY, PERK_CARNIVORE)

	stat_modifiers = list(
		STAT_ROB = 2,
		STAT_TGH = 6,
		STAT_VIG = 3,
		STAT_BIO = 0,
		STAT_MEC = 0,
		STAT_COG = 0
	)

/datum/category_item/setup_option/background/origin/akulasudak //Accept your fate as a worse shark :sunglasso:
	name = "Sudak"
	desc = "You are a sudak, akula that choose path of submission to human meddling losing much of the natural strenght in process, making you look almost nothing like your once kinsmen. \
	More human-like docile cutesy shark to tourists, utter abomination that deserves extermination to your brethren, this is what you have to deal with your entire world being summed up simply as prejudice. \
	There is a chance you still recall your animalistic insticts but the odds are low, will you stay a submissive akula or prove to them that you are their equal."

	restricted_to_species = list(FORM_AKULA)

	stat_modifiers = list(
		STAT_ROB = 0,
		STAT_TGH = 6,
		STAT_VIG = 1,
		STAT_BIO = 2,
		STAT_MEC = 2,
		STAT_COG = 0
	)
