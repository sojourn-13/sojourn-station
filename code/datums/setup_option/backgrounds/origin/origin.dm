//Where do we come from, planet / system, purely freegame just don't over do it
/datum/category_group/setup_option_category/background/origin
	name = "Origin"
	category_item_type = /datum/category_item/setup_option/background/origin

/datum/category_item/setup_option/background/origin

/*
	Shrimple guide to how this somehow operates, races outside of FBP and exalts no longer recieve race bonuses hidden away
	but now within origins so that average player can view them without codediving.
	Now how this is actually calculated, for each race bit differently.
	Humans = Recieve 10 total points + 3 in every base stat this goes to 6 for exalts as a compensation for worse perks
	Aliens = Recieve 5 total points 6 racial points that every origin they posses gets
	Full Body Prosthetics = Outside of like 3 exceptions recieve 45 points with 0 downside, reason being they cannot gain any more stats in game so they can start with most
*/

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//This is for every race that doesn't like their other origins, so no stats and just freelancer as a treat
/datum/category_item/setup_option/background/origin/freelancer
	name = "Freelancer"
	desc = "Nobody knows where you come from not even you, your origins are a mystery and might not ever be revealed what matters now is what you do with that. \
	Are you just a nobody wanting to get by, a long distant relative to some wealthy prince, a descendant of a known bounty hunter or just orphan lost in horrors of war. \
	There are many ways you could have come to this world but it's up to you what you decide to do with it."

	perks = list(/datum/perk/freelancer)

	stat_modifiers = list(
		STAT_ROB = 0,
		STAT_TGH = 0,
		STAT_VIG = 0,
		STAT_BIO = 0,
		STAT_MEC = 0,
		STAT_COG = 0
	)

////////////
/* Humans */
////////////

/*
		STAT_BIO = 3,
		STAT_COG = 3,
		STAT_MEC = 3,
		STAT_ROB = 3,
		STAT_TGH = 3,
		STAT_VIG = 3
*/

/datum/category_item/setup_option/background/origin/spacer
	name = "Spacer"
	desc = "You come from a long line of spacefarers, explorers and general vagabounds not living on planets but space stations and ships their entire lives. \
	Whichever might be your case, time spent in zero-g around your tightly knit community or perhaps entirely alone made you accustomed to it. \
	You handle stresses of space way better than any surfacer and so does your rest of your body making you just tad bit safer in vastness of space."

	perks = list(/datum/perk/lungs_of_iron)

	restricted_to_species = list(FORM_HUMAN)
// Vig = 2 Mec = 4 Cog = 2
	stat_modifiers = list(
		STAT_ROB = 3,
		STAT_TGH = 3,
		STAT_VIG = 5,
		STAT_BIO = 3,
		STAT_MEC = 7,
		STAT_COG = 5
	)

/datum/category_item/setup_option/background/origin/sol
	name = "Sol-Born"
	desc = "A catch all term to describe Humans and Abhumans born within inner borders of Sol, among alien races more of a deragotary slur, as such it is within certain circles \
	viewed as a privilage. Most citizens recieve at least basic education compared to rest of the vast expanses of space so that they can become functioning members of society. \
	However this pampered upbringing tends to hamper their chances of survival outside of Mother Sol."

	perks = list(/datum/perk/solborn)

	restricted_to_species = list(FORM_HUMAN, FORM_EXALT_HUMAN)
// Cog = 6 Mec = 2 Bio = 2
	stat_modifiers = list(
		STAT_ROB = 3,
		STAT_TGH = 3,
		STAT_VIG = 3,
		STAT_BIO = 5,
		STAT_MEC = 5,
		STAT_COG = 9
	)

/datum/category_item/setup_option/background/origin/frontier
	name = "Frontiersman"
	desc = "You come from long line of colonists in outer rim of Sol space, far away from the sprawling metropolis of Olympus and even further from lands of your ancestors. \
	This life while much calmer than those in the 'inner sphere' leaves you leagues behind in education, but instead your body is more adapted to struggles of the frontier \
	You might not be as smart as most humans but when push comes to shove you get the job done unlike those pansies."

	restricted_to_species = list(FORM_HUMAN)
//Rob = 3 Tgh = 3 Vig = 3 Mec = 1
	stat_modifiers = list(
		STAT_ROB = 6,
		STAT_TGH = 6,
		STAT_VIG = 6,
		STAT_BIO = 3,
		STAT_MEC = 4,
		STAT_COG = 3
	)

/datum/category_item/setup_option/background/origin/vattie
	name = "Vat-Grown"
	desc = "Where science made living way easier for everyone, there are some places where it made horrors beyond imagination. One of these being dubbed Vat-Growns. \
	While cloning is deemed impossible flash growth on other hand is achievable with mixed results, you are what happens when one of them succeeds. \
	Mentally stunted, pumped full of steroids since your birth and lead into life of servitude, you are your own master now and it's up to you on what to do with your fate."

	restricted_to_species = list(FORM_HUMAN)
//Rob = 7 Tgh = 3
	stat_modifiers = list(
		STAT_ROB = 10,
		STAT_TGH = 6,
		STAT_VIG = 3,
		STAT_BIO = 3,
		STAT_MEC = 3,
		STAT_COG = 3
	)
