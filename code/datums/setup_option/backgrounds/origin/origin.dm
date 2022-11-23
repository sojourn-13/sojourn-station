//Where do we come from, planet / system, purely freegame just don't over do it
/datum/category_group/setup_option_category/background/origin
	name = "Origin"
	category_item_type = /datum/category_item/setup_option/background/origin

/datum/category_item/setup_option/background/origin

/*
	Shrimple guide to how this somehow operates, races outside of FBP and exalts no longer recieve race bonuses hidden away
	but now within origins so that average player can view them without codediving.
	Now how this is actually calculated, for each race bit differently.
	Humans (regular) = 20 free points 0 minus points, doesn't apply to frontiersman  who uses alien calculation and vatgrown that has some minus points
	Aliens (partially applies to naramadi) = 25 points 25 minus points, some exceptions might apply like mentioned naramadi but generally should be this
	Why do humans recieve more points technically, simple, humans always were and will be generalists and with their weaker racials need something at least.
	Aliens can easily afford to lose 25 points for 25 since they get insane starting bonuses compared to humans
	Akula and Naramadi recieve 2 anatomy instead of their 10 toughness since they are supposed to be omegachonkers
*/

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/*
		STAT_BIO = 2,
		STAT_COG = 2,
		STAT_MEC = 2,
		STAT_ROB = 2,
		STAT_TGH = 2,
		STAT_VIG = 2
*/

/datum/category_item/setup_option/background/origin/spacer
	name = "Spacer"
	desc = "You come from a long line of spacefarers, explorers and general vagabounds not living on planets but space stations and ships their entire lives. \
	Whichever might be your case, time spent in zero-g around your tightly knit community or perhaps entirely alone made you accustomed to it. \
	You handle stresses of space way better than any surfacer and so does your rest of your body making you just tad bit safer in vastness of space."

	perks = list(/datum/perk/lungs_of_iron)

	restricted_to_species = list(FORM_HUMAN)

	stat_modifiers = list(
		STAT_ROB = 2,
		STAT_TGH = 8,
		STAT_VIG = 9,
		STAT_BIO = 2,
		STAT_MEC = 9,
		STAT_COG = 2
	)

/datum/category_item/setup_option/background/origin/sol
	name = "Sol-Born"
	desc = "A catch all term to describe Humans and Abhumans born within inner borders of Sol, among alien races more of a deragotary slur, as such it is within certain circles \
	viewed as a privilage. Most citizens recieve at least basic education compared to rest of the vast expanses of space so that they can become functioning members of society. \
	However this pampered upbringing tends to hamper their chances of survival outside of Mother Sol."

	perks = list(/datum/perk/solborn)

	restricted_to_species = list(FORM_HUMAN, FORM_EXALT_HUMAN)

	stat_modifiers = list(
		STAT_ROB = 2,
		STAT_TGH = 2,
		STAT_VIG = 2,
		STAT_BIO = 8,
		STAT_MEC = 5,
		STAT_COG = 13
	)

/datum/category_item/setup_option/background/origin/frontier
	name = "Frontiersman"
	desc = "You come from long line of colonists in outer rim of Sol space, far away from the sprawling metropolis of Olympus and even further from lands of your ancestors. \
	This life while much calmer than those in the 'inner sphere' leaves you leagues behind in education, but instead your body is more adapted to struggles of the frontier \
	You might not be as smart as most humans but when push comes to shove you get the job done unlike those pansies."

	restricted_to_species = list(FORM_HUMAN)

	stat_modifiers = list(
		STAT_ROB = 12,
		STAT_TGH = 17,
		STAT_VIG = 12,
		STAT_BIO = -3,
		STAT_MEC = -8,
		STAT_COG = -18
	)

/datum/category_item/setup_option/background/origin/vattie
	name = "Vat-Grown"
	desc = "Where science made living way easier for everyone, there are some places where it made horrors beyond imagination. One of these being dubbed Vat-Growns. \
	While cloning is deemed impossible flash growth on other hand is achievable with mixed results, you are what happens when one of them succeeds. \
	Mentally stunted, pumped full of steroids since your birth and lead into life of servitude, you are your own master now and it's up to you on what to do with your fate.

	perks = list(/datum/perk/solborn)

	restricted_to_species = list(FORM_HUMAN)

	stat_modifiers = list(
		STAT_ROB = 11,
		STAT_TGH = 11,
		STAT_VIG = 2,
		STAT_BIO = 2,
		STAT_MEC = 7,
		STAT_COG = -1
	)
