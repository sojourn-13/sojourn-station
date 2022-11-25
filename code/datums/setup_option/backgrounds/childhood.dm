//Under what conditions we grew up in and what skills that gave us
/datum/category_group/setup_option_category/background/childhood
	name = "Childhood"
	category_item_type = /datum/category_item/setup_option/background/childhood

/datum/category_item/setup_option/background/childhood

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/datum/category_item/setup_option/background/childhood/orphan
	name = "War Orphan"
	desc = "Where ever you came from is no more, torn apart by conflict and war. It may have been a civil war or conquest by the Solarian Federation, whatever the reason it has long since lost any \
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

/datum/category_item/setup_option/background/childhood/nepotism
	name = "Product of Nepotism"
	desc = "Your existence has been deemed to be \"of particular worth to the colony.\" you were either head-hunted for a position here, or simply knew the right people to talk to.\
	As a result, you've earned yourself a contract granting higher pay than other colonists on the station. Whether or not you earned that pay is up for debate, but for now,\
	you can enjoy the closest thing to the high life that this backwater dump has going for it."

	perks = list(/datum/perk/nepotism)

	stat_modifiers = list(
		STAT_ROB = 0,
		STAT_TGH = 0,
		STAT_VIG = 0,
		STAT_BIO = 0,
		STAT_MEC = 0,
		STAT_COG = 0
	)

/datum/category_item/setup_option/background/childhood/linguist
	name = "Aspiring Linguist"
	desc = "Be it from your education or from a multi-lingual family, you've found yourself studying languages non-stop throughout your childhood and early adulthood. Unlike most you're silver-tongued \
	in both your knowledge of English, your secondary or native language - and your tertiary! Being tri-lingual has its upsides, making you an adept trader of sorts. Though its downside is that you may \
	have not studied as hard as some others have in other subjects."

	perks = list(/datum/perk/linguist)

	stat_modifiers = list(
		STAT_ROB = 0,
		STAT_TGH = 0,
		STAT_VIG = 0,
		STAT_BIO = 0,
		STAT_MEC = 0,
		STAT_COG = 0
	)

/datum/category_item/setup_option/background/childhood/drug_addict
	name = "Chem Addict"
	desc = "For whatever reason, be it from an early age and bad parenting or personal choice you became a devout user of illicit drugs. The constant use over the years has weakened your body \
	and made you extra paranoid, which can be a good thing when evading the law. Your experience with your own body has also let you learn a few medical tricks over the years, along with a tolerance \
	to most drugs so you can inject more varied amounts than others."

	perks = list(/datum/perk/addict)

	restricted_to_species = list(FORM_HUMAN, FORM_KRIOSAN, FORM_AKULA, FORM_MARQUA, FORM_NARAMAD, FORM_OPIFEX, FORM_CHTMANT, FORM_CINDAR)

	stat_modifiers = list(
		STAT_ROB = -5,
		STAT_TGH = -5,
		STAT_VIG = 4,
		STAT_BIO = 6,
		STAT_MEC = 0,
		STAT_COG = -5, // Brain fried from drugs
		STAT_VIV = 5
	)

/datum/category_item/setup_option/background/childhood/klutz
	name = "Klutz"
	desc = "Your entire life has been a series of unlucky and often self-inflicted accidents, you spent enough time hurting yourself due to your own clumsiness that you've built up a more \
	pain tolerance than most of common folks, meaning that due to this clumsiness problem, you've become quite tough and a little stronger too. A shame, this doesn't stop you from time to time failing even the most basic tasks at times. In fact, you find some tasks that require precision damn near impossible, and even handling or using guns is a dangerous prospect. Due to this problem, you have a terrible perception around the area around you."

	perks = list(/datum/perk/klutz)

	stat_modifiers = list(
		STAT_ROB = 10,
		STAT_TGH = 20,
		STAT_VIG = -20,
		STAT_BIO = 0,
		STAT_MEC = 0,
		STAT_COG = -5 // Dumb, or just careless
	)

/datum/category_item/setup_option/background/childhood/no_light
	name = "Umbral Upbringing"
	desc = "Much of your early life was spent in areas which did not have much, if any, natural light. This may have been planetary where stretches of time hid your world from the sun's light \
	or you lived in an area where light wasn't a feasible resource due to economic, biological, or local reasons. Whatever the specifics, you've gotten highly adapted to finding your way through the \
	dark, your pupils widening faster to better take in your surroundings. This quick adaptation however, has led you to become more photosensitive to sudden bright lights and flashes."

	perks = list(/datum/perk/nightcrawler)

	stat_modifiers = list(
		STAT_ROB = 0,
		STAT_TGH = 0,
		STAT_VIG = 0,
		STAT_BIO = 0,
		STAT_MEC = 0,
		STAT_COG = 0
	)

/datum/category_item/setup_option/background/childhood/gifted
	name = "Gifted"
	desc = "You were a smart child, gifted in any particular area you wished to embark upon be it intellectual or physical. Unfortunately this approach made you a jack of all trades and severely  \
	hampered your ability to master any one discipline. Sure, you're smart, but without the experience and discipline of practical application it doesn't help you as much as anyone could hope."

	perks = list(/datum/perk/oddity/sharp_mind)

	stat_modifiers = list(
		STAT_ROB = 0,
		STAT_TGH = 0,
		STAT_VIG = 0,
		STAT_BIO = 0,
		STAT_MEC = 0,
		STAT_COG = 0 //Why would Bio and Mec be reduced if you are better at.... Whatever have a perk
	)

/datum/category_item/setup_option/background/childhood/razor_maniac
	name = "Razor Girl/Boy"
	desc = "Razor Girls/Boys are those who heavily augment themselves, often times for the purpose of combat or merely because they enjoy the utility offered. Razors, sometimes called metal heads, \
	are a distinctly human and abhuman sub-culture and benefit greatly from the advanced cybernetics humans are known, though outliers from other races also adopt it. The most common and consistent \
	sign that someone is a razor is the implantation of metal claws implanted in the arm, serving as a hidden and potentially deadly weapon. Most razors further augment this by using cybernetics to \
	enhance their physical strength and endurance or replace organic limbs with stronger synthetics."

	restricted_to_species = list(
		FORM_HUMAN, FORM_EXALT_HUMAN, FORM_SABLEKYNE, FORM_KRIOSAN,
		FORM_AKULA, FORM_MARQUA, FORM_NARAMAD,
		FORM_CINDAR)

	racial_implants = (/obj/item/organ_module/active/simple/wolverine)

	stat_modifiers = list(
		STAT_ROB = 3,
		STAT_TGH = 0,
		STAT_VIG = 0,
		STAT_BIO = 0,
		STAT_MEC = 0,
		STAT_COG = 0
	)

/datum/category_item/setup_option/background/childhood/entrepreneur
	name = "Entrepreneur"
	desc = "When life gives you lemons make lemonade then sell that drink at a profit and corner the lemonade market. That is exactly what you may have set out to do, making it on your own! \
	This can range from starting your own shop to small business making stuff. Who knows how many tried and failed but your one of them, the market back in Sol Fed was just to crowed, that must be it. \
	The system of bureaucracy and its regulations have pushed out many like you but it really gets the old noggin working in overtime."

	perks = list(/datum/perk/market_prof) //YOU GOT THIS, YOU KNOW WHATS UP AND HOW TO TURN TRASH INTO GOLD! BE YOUR OWN BOSS, GONE ON TO DO IT!

	stat_modifiers = list(
		STAT_ROB = 0,
		STAT_TGH = 0,
		STAT_VIG = 0,
		STAT_BIO = 0,
		STAT_MEC = 0,
		STAT_COG = 2
	)



/*
	perks = list(/datum/perk/parkour, /datum/perk/chem_contraband)

*/
//////////////
/* Psionics */
//////////////

/datum/category_item/setup_option/background/childhood/psionic_harmony
	name = "Peaceful Life"
	desc = "You've lived a life of peace and harmony so idyllic that is has given you a special bit of enlightenment. This is not to say your life was easy, nor without trial or consequence, \
	it merely speaks of your approach being serene in ways that have left lasting effects upon you. This early life has left you so deeply effected that your mind is the calm within the storm, \
	no matter the scenario you cannot be left in turmoil for long. You always find contentment, you always find peace. As such, should you ever become a psion, you're mind is perfectly adapted \
	to make the most of the essence from which your powers are called, granting you three additional uses of your abilities."

	perks = list(/datum/perk/psi_harmony)

	stat_modifiers = list(
		STAT_ROB = -4,
		STAT_TGH = -4,
		STAT_VIG = -4,
		STAT_BIO = -4,
		STAT_MEC = -4,
		STAT_COG = 0 // A peaceful mind is a lazy mind
	)

/datum/category_item/setup_option/background/childhood/psionic_mania
	name = "Bedlam"
	desc = "Your life has been nothing but conflict, violence, and bedlam for as long as you can remember. You were fighting the moment you can stand and nothing has changed. You're always \
	ready to throw down. You may not be outwardly confrontational, hell, people might not even know the capacity for hurting others you have deep down. But you cannot see violence as anything \
	but the ultimate authority from which all authority is granted. This bedlam has changed how your mind works and, should you ever become a psion, has made you the perfect example of what \
	a destructive mind can do. You always deal the maximum level of destruction when using your psionic powers which scale with your body and mind."

	perks = list(/datum/perk/psi_mania)

	stat_modifiers = list(
		STAT_ROB = 4,
		STAT_TGH = 4, // Hardened by violent thoughts probably put to practice
		STAT_VIG = -4,
		STAT_BIO = -4,
		STAT_MEC = -4,
		STAT_COG = -5 // Violence clouds the mind, tradeoff for a good perk that never had any mechanical drawbacks
	)

////////////
/* Racial */
////////////

/datum/category_item/setup_option/background/childhood/chtmantspider
	name = "Eight-Legged Ally"
	desc = "As a cht-mant you have an innate understanding towards insects and crawling things. While most of your kin are naturally adapted to roaches you've developed a sense of  \
	control and understanding to spiders. Over time a subtle shift in your pheromones allowed you to interact with spiders much in the same way your kin do with roaches. \
	Unfortunately this shift in biology has made roaches innately hostile to you, viewing you as a spider from the smell alone. A secondary side effect of your biological adjustment has \
	given you the ability to generate webs like a spider."

	restricted_to_species = list(FORM_CHTMANT)
	perks = list(/datum/perk/spiderfriend, /datum/perk/webmaker)

	stat_modifiers = list(
		STAT_ROB = 0,
		STAT_TGH = 0,
		STAT_VIG = 0,
		STAT_BIO = 0,
		STAT_MEC = 0,
		STAT_COG = 0
	)
