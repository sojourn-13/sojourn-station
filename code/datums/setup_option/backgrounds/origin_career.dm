/datum/category_item/setup_option/background/career/pirate
	name = "Former Pirate"
	desc = "Early on in your life you became a pirate for personal reasons. You may have been a void wolf or apart of a named group of space raiders, regardless of your decisions you spent a \
	period attacking other ships, frontier colonies, and looting the aftermaths of battles for anything of value. For whatever reason you gave up that life to become an honest \
	(or dishonest) citizen of the colony. One benefit at least of your raider life style is you got good at getting in and out quickly, regardless of any barriers in your way. Sadly your past is \
	a known factor and while here on the frontier security can overlook a checkered past, your records should contain a detailed and accurate report of your history."

	perks = list(PERK_PARKOUR )

	stat_modifiers = list(
		STAT_ROB = 0,
		STAT_TGH = 5,
		STAT_VIG = 0,
		STAT_BIO = 0,
		STAT_MEC = 0,
		STAT_COG = 0
	)

/datum/category_item/setup_option/background/career/laborer
	name = "Former Laborer"
	desc = "Unlike the rest of these special snowflakes wandering around the colony you worked for a long period as a laborer, doing some simple heavy work with your hands. \
	It certainly wasn't glamorous or special but hey, it was a living and it was good work experience for the job you have now. The years working with your muscles has left you quite hardy \
	but it wasn't exactly stimulating for more then the practical things needed in life."

	stat_modifiers = list(
		STAT_ROB = 4,
		STAT_TGH = 5,
		STAT_VIG = 0,
		STAT_BIO = 2,
		STAT_MEC = 2,
		STAT_COG = -8
	)

/datum/category_item/setup_option/background/career/laborer_miner
	name = "Former Miner"
	desc = "Mining, the not well respected but needed none the less job. Pay ranges from work to work sometimes and the hazards are always an unknown, making it not as mindless of a job as one might think."

//This allows you to if your a miner, to get just the stats you need to do your job well not hurting as much of the smarter stats
//The main boon of this being a better digging and maintaining tools/drills
//-8Loss Stats +10Gained Stats


	stat_modifiers = list(
		STAT_ROB = 5,
		STAT_TGH = 0,
		STAT_VIG = -4,
		STAT_BIO = -2,
		STAT_MEC = 5,
		STAT_COG = -2
	)

/datum/category_item/setup_option/background/career/former_servest
	name = "Former Service Worker"
	desc = "From a janitor to cook or even accountant, work has been quite colorful for you. \
	Hopefully one of those taught you something of use to a colony."

//REALLY open ended this one, thus is a bit of everything!
//Main boon is that you dont lose or gain a lot, making it ideal for roleplay without lossing out on other jobs/skills
//-9Loss Stats +11Gained Stats

	stat_modifiers = list(
		STAT_ROB = -2,
		STAT_TGH = -3,
		STAT_VIG = -4,
		STAT_BIO = 4,
		STAT_MEC = 3,
		STAT_COG = 4
	)

/datum/category_item/setup_option/background/career/mechanic
	name = "Former Mechanic"
	desc = "You like machines, from cars to hover bikes to electrical equipment you've worked on them all. Maybe you were a minor technician, working on general maintenance for a few vehicles \
	or basic electrical equipment. Maybe you were a full licensed mechanic with plenty of experience. Whatever you were you picked up quite a few tricks over the years with various bits of tech \
	ranging from robots, autolathes, and other fancy machines."

	stat_modifiers = list(
		STAT_ROB = 0,
		STAT_TGH = 0,
		STAT_VIG = 0,
		STAT_BIO = -7,
		STAT_MEC = 10,
		STAT_COG = 2
	)

/datum/category_item/setup_option/background/career/medtech
	name = "Former Medical Intern"
	desc = "At one point you served as a medical intern, this can range from a paramedic, nurse, orderly, and even a field medic. Your training wasn't exactly advanced but had the benefit of \
	teaching you how to properly set a bandage and spot the differences and uses of various medical chemicals. Later on in life you might have taken your medical career further or chosen a different path. \
	Whatever happened, you haven't forgotten the few tricks you learned."

	perks = list(PERK_CHEM_CONTRABAND)

	stat_modifiers = list(
		STAT_ROB = 0,
		STAT_TGH = 0,
		STAT_VIG = 0,
		STAT_BIO = 10,
		STAT_MEC = -7,
		STAT_COG = 2
	)

/datum/category_item/setup_option/background/career/military
	name = "Former Military"
	desc = "The Solarian Federation is the largest industrial military complex in the galaxy, former members are extremely common be they conscripts of conquered empires or citizens seeking \
	to serve their nation. Some individuals may come from their own planetary defense forces, serving as a combination of planetary guard and soldier. Military training has the benefit \
	of physical conditioning and marksmanship training, but the stamping out of the individual makes most lose their creativity."

	perks = list(PERK_SURVIVOR)

	stat_modifiers = list(
		STAT_ROB = 2,
		STAT_TGH = 4,
		STAT_VIG = 4,
		STAT_BIO = 0,
		STAT_MEC = 0,
		STAT_COG = -5
	)

/datum/category_item/setup_option/background/career/militarymedical
	name = "Former Military (Medical)"
	desc = "The Solarian Federation is the largest industrial military complex in the galaxy, former members are extremely common be they conscripts of conquered empires or citizens seeking \
	to serve their nation. Some individuals may come from their own planetary defense forces, serving as a combination of planetary guard and soldier. Military training has the benefit \
	of physical conditioning and as a combat medic you got the benefit of additional medical training, though not as good as what you'd get in a hospital, it has its benefits."

	perks = list(PERK_CHEM_CONTRABAND)

	stat_modifiers = list(
		STAT_ROB = 0,
		STAT_TGH = 2,
		STAT_VIG = 1,
		STAT_BIO = 5,
		STAT_MEC = -5,
		STAT_COG = 4
	)

/datum/category_item/setup_option/background/career/militaryengineer
	name = "Former Military (Engineering)"
	desc = "The Solarian Federation is the largest industrial military complex in the galaxy, former members are extremely common be they conscripts of conquered empires or citizens seeking \
	to serve their nation. Some individuals may come from their own planetary defense forces, serving as a combination of planetary guard and soldier. Military training has the benefit \
	of physical conditioning and as a member of the logistics/armor core you've gained a few tips and tricks when dealing with machines."

	stat_modifiers = list(
		STAT_ROB = 1,
		STAT_TGH = 2,
		STAT_VIG = 0,
		STAT_BIO = -5,
		STAT_MEC = 3,
		STAT_COG = 4
	)

/datum/category_item/setup_option/background/career/criminal
	name = "Former Criminal"
	desc = "Maybe you were a low tier ganger, a mafioso, or a professional with a criminal syndicate. Whatever you were it wasn't honest, nor was it something any good person could take pride in. \
	Your former connections, for they are former as you've left that life behind, still haunt you as your record is known by security. As such your records should contain a detailed list of \
	your past and history, after all, its the frontier and the colony can't be as picky as bigger empires. But that life has at least gifted you with some broad if boorish skills and a quick fingered \
	disposition for snatching objects off of people without them noticing."

	perks = list(PERK_FAST_FINGERS, PERK_CHEM_CONTRABAND)

	stat_modifiers = list(
		STAT_ROB = 0,
		STAT_TGH = 0,
		STAT_VIG = 5,
		STAT_BIO = 0,
		STAT_MEC = 0,
		STAT_COG = 0
	)

/datum/category_item/setup_option/background/career/asteroid
	name = "Former Space Contractor"
	desc = "Maybe you were an asteroid miner, hull repair technician, or simply worked a job where oxygen was a rarity. Whatever your job, it was so far from civilization and people you \
	developed a hearty constitution and self reliant attitude. Yet the boredom of being cut off from the general population and the lack of more intellectual stimulation did a number on your \
	creativity. All that time spent working in low oxygen environments and the occasional oxygen breach has adapted you to dealing with such events, your lungs may as well be made of metal now."

	perks = list(PERK_LUNGS_OF_IRON)

	stat_modifiers = list(
		STAT_ROB = 3,
		STAT_TGH = 3,
		STAT_VIG = 0,
		STAT_BIO = 0,
		STAT_MEC = 4,
		STAT_COG = -5
	)

/datum/category_item/setup_option/background/career/social
	name = "Former Social Worker"
	desc = "As a former social worker you spent a great deal of time helping the dregs of society, be it from mental illness, drug addiction, or them just being a completely inept loser. \
	Whatever your case loads, you learned to come up with creative solutions to the problems people faced and directed them to where they could get help as they tried to escape the \
	system of bureaucracy. All that time spent at a office desk though didn't exactly improve your health however."

	stat_modifiers = list(
		STAT_ROB = -4,
		STAT_TGH = -4,
		STAT_VIG = 0,
		STAT_BIO = 2,
		STAT_MEC = 0,
		STAT_COG = 8
	)

/datum/category_item/setup_option/background/career/entrepreneur
	name = "Entrepreneur"
	desc = "When life gives you lemons make lemonade then sell that drink at a profit and corner the lemonade market. That is exactly what you may have set out to do, making it on your own! \
	This can range from starting your own shop to small business making stuff. Who knows how many tried and failed but your one of them, the market back in Sol Fed was just to crowed, that must be it. \
	The system of bureaucracy and its regulations have pushed out many like you but it really gets the old noggin working in overtime."

	perks = list(PERK_MARKET_PROF) //YOU GOT THIS, YOU KNOW WHATS UP AND HOW TO TURN TRASH INTO GOLD! BE YOUR OWN BOSS, GONE ON TO DO IT!

	stat_modifiers = list(
		STAT_ROB = -4,
		STAT_TGH = -4,
		STAT_VIG = -3,
		STAT_BIO = 3,
		STAT_MEC = 3,
		STAT_COG = 10 //So many psions are going to fucking pick this.
	)

/datum/category_item/setup_option/background/career/scavenger
	name = "Former Scavenger"
	desc = "As a scavenger you spent a great deal of time charting pathways through the unexplored areas of space, scanning planets for old ruins that might have valuables, or exploring forgotten battlefields. \
	Sometimes it was more localized, crawling to the abandoned tunnels of destroyed and long forgotten ship looking for valuables and answers to why they were brought to this state. \
	Life as a scavenger was rough, but it did let you adjust to frontier work comfortably. Your life of avoiding hazards be they incidental or made with malcontent has at least made you more ready \
	to dodge potential traps."
	perks = list(PERK_SURE_STEP)

	stat_modifiers = list(
		STAT_ROB = 0,
		STAT_TGH = 0,
		STAT_VIG = 0,
		STAT_BIO = 0,
		STAT_MEC = 0,
		STAT_COG = 0
	)

/datum/category_item/setup_option/background/career/psi_sufficiency
	name = "Former Scholar"
	desc = "Once in life, you were a scholar and researcher. This may have been academic, personal interest, or hobbyist but regardless the reason you spent a great deal of time collecting massive \
	amounts of information from various cultures, planets, and sectors both advanced and primitive. Regardless of where your focus laid, you became quite used to piecing together and categorizing \
	details to such an extent that it became second nature. As a result, should you ever become a psion, your ability to hyper focus without losing the bigger picture allows you to lessen the \
	negative side effects of your powers and use some abilities at no cost."

	perks = list(PERK_PSI_ATTUNEMENT)

	stat_modifiers = list(
		STAT_ROB = 0,
		STAT_TGH = 0,
		STAT_VIG = 0,
		STAT_BIO = 0,
		STAT_MEC = 0,
		STAT_COG = 0
	)

/datum/category_item/setup_option/background/career/nepotism
	name = "Product of Nepotism"
	desc = "Your existence has been deemed to be \"of particular worth to the colony.\" you were either head-hunted for a position here, or simply knew the right people to talk to.\
	As a result, you've earned yourself a contract granting higher pay than other colonists on the station. Whether or not you earned that pay is up for debate, but for now,\
	you can enjoy the closest thing to the high life that this backwater dump has going for it."
	perks = list(PERK_NEPOTISM)
	stat_modifiers = list(
		STAT_ROB = 0,
		STAT_TGH = 0,
		STAT_VIG = 0,
		STAT_BIO = 0,
		STAT_MEC = 0,
		STAT_COG = 0
	)
