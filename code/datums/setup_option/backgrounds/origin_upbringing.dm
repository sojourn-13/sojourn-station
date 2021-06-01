/datum/category_item/setup_option/background/bckgrnd/poor
	name = "Poor Upbringing"
	desc = "Your early life was spent in a poor environment, be it from your family's economical position or the place you lived in. This barred access to education, but it let you learn fast \
	that desperate people will use force as commonly as they'll beg for aid. A sharp eye and careful or creative thinking let you avoid getting hurt and allowed you to thrive, so at least you got \
	that going for you."

	stat_modifiers = list(
		STAT_ROB = 0,
		STAT_TGH = 3,
		STAT_VIG = 5,
		STAT_BIO = 0,
		STAT_MEC = -8,
		STAT_COG = 5
	)

/datum/category_item/setup_option/background/bckgrnd/pressered_in_life
	name = "Overwhelming Upbringing"
	desc = "You had quite the start in life, nothing ever was laid back or easy. Always being pressured into things you didn't care for or like. This may have come from parents, peers, or even schools. \
	Your mind is as sharp as ever as a result, but you almost never set foot in a gym, making you physically deficient."

//Idea behind this is that well in younger years you pushed your body to hard and now your paying for it in TOB/TGH
//The main boon of this being a better mind and understanding.
//-14Loss Stats +15Gained Stats

	stat_modifiers = list(
		STAT_ROB = -6,
		STAT_TGH = -6,
		STAT_VIG = -2,
		STAT_BIO = 5,
		STAT_MEC = 5,
		STAT_COG = 5
	)


/datum/category_item/setup_option/background/bckgrnd/wealthy
	name = "Wealthy Upbringing"
	desc = "You grew up with a silver spoon in your mouth all your life. Education, leisure time, and relaxation allowed you to indulge in scholarly pursuits to a degree, letting you pick up a few \
	randomly useful facts about many things. A shame that easy living left you a bit naive and physically weak albeit healthier than most. Not to mention you never quite developed the sense of when \
	danger is present. This certainly made switching to regular life a bit of a culture shock."

	stat_modifiers = list(
		STAT_ROB = 0,
		STAT_TGH = 2,
		STAT_VIG = -4,
		STAT_BIO = 5,
		STAT_MEC = 5,
		STAT_COG = -3
	)

/datum/category_item/setup_option/background/bckgrnd/refugee
	name = "Refugee"
	desc = "Where ever you came from is no more, torn apart by conflict and war. It may have been a civil war or conquest by the Terran Federation, whatever the reason it has long since lost any \
	meaning after the destruction of your home-world. Or maybe it wasn't your homeworld that was destroyed, maybe it was just your way of life. Regardless, you've left a burned bridge behind you and \
	can no longer go back. Your rough life has hardened you against the worst possible situations."

	perks = list(/datum/perk/space_asshole)

	stat_modifiers = list(
		STAT_ROB = 0,
		STAT_TGH = 0,
		STAT_VIG = 0,
		STAT_BIO = 0,
		STAT_MEC = 0,
		STAT_COG = 0
	)

/datum/category_item/setup_option/background/bckgrnd/drugaddict
	name = "Chem Addict"
	desc = "For whatever reason, be it from an early age and bad parenting or personal choice you became a devout user of illicit drugs. The constant use over the years has weakened your body \
	and made you extra paranoid, which can be a good thing when evading the law. Your experience with your own body has also let you learn a few medical tricks over the years, along with a tolerance \
	to most drugs so you can inject more varied amounts than others."

	perks = list(/datum/perk/addict)
	restricted_to_species = list(FORM_KRIOSAN, FORM_AKULA, FORM_MARQUA, FORM_NARAMAD, FORM_OPIFEX, FORM_CHTMANT, FORM_CINDAR)

	stat_modifiers = list(
		STAT_ROB = -5,
		STAT_TGH = -5,
		STAT_VIG = 4,
		STAT_BIO = 6,
		STAT_MEC = 0,
		STAT_COG = 5
	)

/datum/category_item/setup_option/background/bckgrnd/klutz
	name = "Klutz"
	desc = "Your entire life has been a series of unlucky and often self inflicted accidents, you spent enough time hurting yourself due to your own clumsiness that you've built up a bit more \
	pain tolerance than most. A shame this doesn't stop you from failing even the most basic tasks at times. In fact, you find some tasks that require precision damn near impossible."

	perks = list(/datum/perk/klutz)

	stat_modifiers = list(
		STAT_ROB = 0,
		STAT_TGH = 20,
		STAT_VIG = -5,
		STAT_BIO = 0,
		STAT_MEC = 0,
		STAT_COG = 0
	)

/datum/category_item/setup_option/background/bckgrnd/no_light
	name = "Achromatic Lifestyle"
	desc = "Much of your early life was spent in areas which did not have much, if any, natural light. This may have been planetary where stretches of time hid your world from the sun's light \
	or you lived in an area where light wasn't a feasible resource due to economic, biological, or local reasons. Whatever the specifics, you've gotten highly adapted to finding your way through the \
	dark, a shame this lifestyle didn't sharpen your eyesight as much as you'd have liked."

	perks = list(/datum/perk/nightcrawler)

	stat_modifiers = list(
		STAT_ROB = 0,
		STAT_TGH = 0,
		STAT_VIG = 0,
		STAT_BIO = 0,
		STAT_MEC = 0,
		STAT_COG = 0
	)

/datum/category_item/setup_option/background/bckgrnd/gifted
	name = "Gifted"
	desc = "You were a smart child, gifted in any particular area you wished to embark upon be it intellectual or physical. Unfortunately this approach made you a jack of all trades and severely  \
	hampered your ability to master any one discipline. Sure, you're smart, but without the experience and discipline of practical application it doesn't help you as much as anyone could hope."

	stat_modifiers = list(
		STAT_ROB = 0,
		STAT_TGH = 0,
		STAT_VIG = -2,
		STAT_BIO = -4,
		STAT_MEC = -4,
		STAT_COG = 15
	)


/datum/category_item/setup_option/background/bckgrnd/idiotsavant
	name = "Idiot Savant"
	desc = "You're an idiot, no really, you're just a complete brainlet when it comes to anything you're not hyper-focused on. You have an innate knack and understanding with the most conceptual  \
	applications of technology, medicine, and even firearms. The problem is this understanding is instinctual, not intellectual, you have no idea how you know, you just do. You're stuck in the odd \
	position of being able to do complex difficult tasks related to your areas of interest but completely incapable of doing the most basic things in other areas."

	stat_modifiers = list(
		STAT_ROB = 0,
		STAT_TGH = 0,
		STAT_VIG = 4,
		STAT_BIO = 8,
		STAT_MEC = 8,
		STAT_COG = -15
	)