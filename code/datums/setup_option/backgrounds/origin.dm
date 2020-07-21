//As a general rule, all origin backgrounds should have sum of +0 of stat values


//Race/Ethnicity is a subclass of each race and should be locked to their specific race category. Race bonuses should compliment base racial bonuses.
/datum/category_group/setup_option_category/background/ethnicity
	name = "Ethnicity"
	category_item_type = /datum/category_item/setup_option/background/ethnicity

/datum/category_item/setup_option/background/ethnicity

/datum/category_item/setup_option/background/ethnicity/northlander
	name = "Northlander"
	desc = "The northlander sablekyne are a people devoted to family and tradition, built to survive in the cold mountainous regions they call home. \
			Northlanders live in a tougher environment then their southlander cousins, where fights and conflict between each other happens as commonly as attacks from the local wildlife. \
			The focus on physical martial success leaves far less time for study and as a result while you are a bit tougher you are not as learned. \
			Then again, when all else fails and diplomacy falls through you can always rely on your claws."

	stat_modifiers = list(
		STAT_ROB = 5,
		STAT_TGH = 5,
		STAT_VIG = 0,
		STAT_BIO = 0,
		STAT_MEC = 0,
		STAT_COG = 0
	)

	restricted_to_species = list(FORM_SABLEKYNE)

/datum/category_item/setup_option/background/ethnicity/southlander
	name = "Southlander"
	desc = "The southlander sablekyne are a people who consider themselves simply better than anyone else, be it through martial or mental tasks. \
			Southlanders hail from the brutally hot desert along the equator of Onkarth living behind fortified walls where they conduct most of the planets commerce. \
			Southlanders are not shy about combat but their focus on more mental pursuits leave them less capable than their northern cousins. \
			After all, only a brute needs to resort to violence when so many other options exists."

	stat_modifiers = list(
		STAT_ROB = 0,
		STAT_TGH = 5,
		STAT_VIG = 0,
		STAT_BIO = 0,
		STAT_MEC = 0,
		STAT_COG = 5
	)

	restricted_to_species = list(FORM_SABLEKYNE)

/datum/category_item/setup_option/background/ethnicity/maunkyne
	name = "Maunkyne"
	desc = "The maunkyne are the absolute lowest dregs of sablekyne society, users of a highly addictive drug they are permanently enslaved to. \
			On their home-planet maunkyne are outcasts, executed in the north for the crime of existing and exiled in the south to the unforgiving desert wastes. \
			As a maunkyne you might be able to pass as a normal sablekyne, even among your more aware kin, but the colonies strict regulation on demon powder has left you without your fix. \
			Without it, your body is weak and prone to further addiction but your upbringing in the criminal underworld of Onkarth has left you with a feral cunning and tolerance to most drugs. \
			Even the most 'noble' maunkyne knows much about medicine, in particular the creation of highly profitable and illegal drugs. \
			Due to maunkyne's innate addictions they are barred from command and security roles."

	restricted_depts = SECURITY | COMMAND

	restricted_to_species = list(FORM_SABLEKYNE)

	perks = list(/datum/perk/addict)

	stat_modifiers = list(
		STAT_ROB = -10,
		STAT_TGH = -10,
		STAT_VIG = 0,
		STAT_BIO = 10,
		STAT_MEC = 0,
		STAT_COG = 10
	)

/datum/category_item/setup_option/background/ethnicity/jaeger
	name = "Jaeger"
	desc = "The jaegers are a group of frontier kriosan who plot the course for the spread of the kriosan civilization. \
			Jaegers are practical, individualistic, and self reliant with a rigid set of personal beliefs and stubbornness to the point of coming off as arrogant. \
			While to outsiders most jaegers come across as gun obsessed hermits, a fact not helped with their penchant for trophy taking, none can deny their skill with rifles. \
			Unfortunately all that time at the range and tinkering with their rifles hasn't improved much else."

	restricted_to_species = list(FORM_KRIOSAN)

	stat_modifiers = list(
		STAT_ROB = 0,
		STAT_TGH = 0,
		STAT_VIG = 5,
		STAT_BIO = 0,
		STAT_MEC = 5,
		STAT_COG = 0
	)

/datum/category_item/setup_option/background/ethnicity/vorhut
	name = "Former Vorhut Soldier"
	desc = "All Vorhut technically are soldiers, but a very real distinction is drawn between the civilians and the dedicated soldiers who serve as their empire's career stormtroopers. \
	Vorhut battalions were originally formed and trained by the survivors of the rebellion with experience fighting the Terran military, and were seen as fanatical and violent extremists. \
	Nowadays, Vorhut are far more focused on military superiority than racial, and have a reputation for following orders ruthlessly and without question. They often hold the belief that \
	their deaths are pre-determined, and that if their time has come, they must face it with courage and dignity. If it has not, then their Corpsmen will see to it they live to battle another \
	day. As a result, they are fearless warriors with no patience for engineering or science, and their ultimately violent doctrines leave them barred from serving in \
	command roles."

	restricted_to_species = list(FORM_KRIOSAN)

	restricted_depts = COMMAND | ENGINEERING | SCIENCE

	stat_modifiers = list(
		STAT_ROB = 5,
		STAT_TGH = 10,
		STAT_VIG = 5,
		STAT_BIO = 5,
		STAT_MEC = -10,
		STAT_COG = -15
	)

/datum/category_item/setup_option/background/ethnicity/castallen
	name = "Castellen"
	desc = "The castellen are the noble elite and highborn of the kriosan, genetically superior to the common folk they rule over but rarely found outside their own empire. \
			Castellens are widely known for their considerable size and physical merit but lack the practical training in most areas compared to others, in particular those dealing with people or \
			kriosans trademark rifles. A lifetime of being trained for the realm of politics and artisanship has made them quick to understand new things but abyssal at more other pursuits. \
			On top of all that, a castellens political affiliations, be it present or former, bar them from command roles due to the very obvious conflict of interests."

	restricted_to_species = list(FORM_KRIOSAN)

	restricted_depts = COMMAND

	stat_modifiers = list(
		STAT_ROB = 5,
		STAT_TGH = 5,
		STAT_VIG = -10,
		STAT_BIO = -10,
		STAT_MEC = 5,
		STAT_COG = 5
	)


/datum/category_item/setup_option/background/ethnicity/akulaganger
	name = "Former Ganger"
	desc = "Akula are a brutal people and some take this to another level. The fondness they possess for motor cycles and hover bikes have given way to a rise in gang-like culture. \
			While the common akula is strong, most gangers train themselves in the 'honorable' way of fighting, favoring melee. Fixing up their bikes so often has also given them some mechanical knack.  \
			Days and weeks of patching themselves up after a bar fight or gang-land style shooting have made most pretty self reliant but, sadly even the clever gangers eventually get caught. \
			While criminal backgrounds are often overlooked, yours is one of public record and far more brutal than most, made known by either your boasting, tattoos, or records. \
			Because of that security has no interest in hiring you, even as a militia grunt."

	restricted_to_species = list(FORM_AKULA)

	restricted_depts = SECURITY

	stat_modifiers = list(
		STAT_ROB = 10,
		STAT_TGH = 0,
		STAT_VIG = -6,
		STAT_BIO = 4,
		STAT_MEC = 7,
		STAT_COG = -15
	)


/datum/category_item/setup_option/background/ethnicity/akulacommander
	name = "Former Commander"
	desc = "Military service for an akula is considered one of the most honorable professions one can take. Many become commanders within the Terran Federation military, often leading small squads \
			of Naramadi in ship to ship breaching squads or strike teams in ground assaults. Akula commanders are better trained with guns than most and adapt well to new things.  \
			Service in the military, however, has its draw backs. Much of an akula's training is steeped solely in marksmanship as they cannot keep pace with the faster naramads and must take \
			great care not to cause a friendly fire incident."

	restricted_to_species = list(FORM_AKULA)

	stat_modifiers = list(
		STAT_ROB = 0,
		STAT_TGH = 0,
		STAT_VIG = 9,
		STAT_BIO = 0,
		STAT_MEC = -5,
		STAT_COG = 4
	)

/datum/category_item/setup_option/background/ethnicity/akulabreacher
	name = "Former Breacher"
	desc = "Military service for an akula is considered one of the most honorable professions one can take. Those who lack the skill and cunning for a command position are often designated as breachers. \
			Akula breachers serve a single purpose, being the first person into a conflict that serves as a meat shield for those behind them in a stack.  \
			While impressive, this position strains even the well known toughness of most akula and leaves them with lasting injuries. \
			The training breachers get is also exclusive, focused entirely on melee assisted by large shields as a hulking charging akula rushing a position attracts more concentrated \
			fire, thus freeing up the soldiers in the back to make clear picked shots."

	restricted_to_species = list(FORM_AKULA)

	stat_modifiers = list(
		STAT_ROB = 10,
		STAT_TGH = -10,
		STAT_VIG = 5,
		STAT_BIO = 0,
		STAT_MEC = 0,
		STAT_COG = -5
	)

/datum/category_item/setup_option/background/ethnicity/marquaintelligensia
	name = "Intelligensia"
	desc = "The intelligensia of the mar'qua are the formally trained and 'think-tank' of mar'qua society, making up most of their scientists in the fields of biology and mathematics. \
			As someone who has left the higher folds of the intelligensia you are one of skilled rapport but a life of easy living has made you quite physically weak. \
			You lack of physically capability also makes you ineligible for the colony security forces or as a prospector (except salvager), further locking you into your role as an intellectual."

	restricted_to_species = list(FORM_MARQUA)

	restricted_depts = SECURITY
	restricted_jobs = list(/datum/job/pro, /datum/job/foreman)

	stat_modifiers = list(
		STAT_ROB = -10,
		STAT_TGH = -10,
		STAT_VIG = -10,
		STAT_BIO = 5,
		STAT_MEC = 5,
		STAT_COG = 5
	)


/datum/category_item/setup_option/background/ethnicity/marquamenial
	name = "Menial"
	desc = "Unfortunately for many mar'qua they are born as the gaaran-geraa, often called the menial castes. Your existence, much like your family and friends, was one of toil. \
			Menials are trained from early childhood to be pragmatic above all else and enjoy the simple toil of their work. Appearance and taste is secondary to function, always. \
			As a menial you lack the higher training of most mar'qua but a life of labor has made you toughened to the rigors of life, the sole benefit of low born status."

	restricted_to_species = list(FORM_MARQUA)

	stat_modifiers = list(
		STAT_ROB = 2,
		STAT_TGH = 5,
		STAT_VIG = 0,
		STAT_BIO = 2,
		STAT_MEC = 0,
		STAT_COG = 1
	)


/datum/category_item/setup_option/background/ethnicity/marquamartial
	name = "Martial"
	desc = "Also known as the quoqa-geraa, the martial caste of the mar'qua spends their entire lives training to defend the mar'qua empire. \
			The martial caste is strong, decisive, and extremely focused on the here and now of a situation to ensure the best choices are made. \
			While the martial caste is intelligent, after all they are still mar'qua, they lack the formal education even a menial is afforded, but a life of disciplined training has \
			improved their physical ability quite well."

	restricted_to_species = list(FORM_MARQUA)

	stat_modifiers = list(
		STAT_ROB = 4,
		STAT_TGH = 8,
		STAT_VIG = 12,
		STAT_BIO = -4,
		STAT_MEC = -10,
		STAT_COG = -10
	)


/datum/category_item/setup_option/background/ethnicity/naramadsouth
	name = "Southern Naramad"
	desc = "The southern naramad is perhaps the only thing in naramadi society considered 'intelligent' by any stretch of the word. \
			In the southern tribes the naramad people are far more enthusiastic towards scavenging the old ruins that dot the landscape of their home-world. \
			Their enthusiasm for such work borders into a cult like belief that technology brings good luck and the more advanced it is the more worthy a trophy it makes. \
			Such a focus on mental pursuits have made southern naramad a little more adept at technology then others of their kind, but the technophilia has made them poorly adapted to \
			the workings of the body."

	restricted_to_species = list(FORM_NARAMAD)

	stat_modifiers = list(
		STAT_ROB = 0,
		STAT_TGH = 0,
		STAT_VIG = 0,
		STAT_BIO = -20,
		STAT_MEC = 10,
		STAT_COG = 10
	)

/datum/category_item/setup_option/background/ethnicity/naramadeast
	name = "Eastern Naramad"
	desc = "Of naramad tribals the eastern tribes are the most primitive and most brutalistic of them. They live for hunting and fighting, making them popular conscripts for military service. \
			An eastern naramads focus on physical combat improves their already impressive strength and tough bodies but does little improve much else. \
			Even among their own kind the eastern naramads are considered Luddites, their brash natures and complete ignorance of things unrelated to combat bar them from science, medical \
			engineering, command roles, and many more complex jobs within security and prospectors."

	restricted_to_species = list(FORM_NARAMAD)

	restricted_depts = SCIENCE | MEDICAL | ENGINEERING | COMMAND
	restricted_jobs = list(/datum/job/salvager, /datum/job/supsec, /datum/job/serg, /datum/job/inspector, /datum/job/medspec, /datum/job/officer)

	stat_modifiers = list(
		STAT_ROB = 10,
		STAT_TGH = 10,
		STAT_VIG = 15,
		STAT_BIO = -20,
		STAT_MEC = -20,
		STAT_COG = -15
	)

/datum/category_item/setup_option/background/ethnicity/naramadspacer
	name = "Naramad Spacer"
	desc = "Though more uncommon than common some naramad are born and raised outside the confines of their home-world, unknowing of what their tribal affiliation is or its customs out of \
			what they are told second hand, if anything at all. A space born naramad is much better educated than their home-world tribals but this time spent being taught makes them less \
			physically imposing than the rough raised homeworlders. Unfortunately for the space born naramads not even they escape military conscription and often times, due to their relative intelligence, \
			act as desk workers for akula commanders or in logistical roles for naramadi squads and ships."

	restricted_to_species = list(FORM_NARAMAD)

	stat_modifiers = list(
		STAT_ROB = -10,
		STAT_TGH = -10,
		STAT_VIG = 0,
		STAT_BIO = 5,
		STAT_MEC = 5,
		STAT_COG = 15
	)

/datum/category_item/setup_option/background/ethnicity/opifexbiomech
	name = "Biomechanist"
	desc = "While all opifex are trained in the workings of machines some are reserved for the biological aspect of their respective scavenger fleet. \
			This training is usually towards the goal of maintaining the bio-mechanical augmentations used by the opifex, from installing nano-gates to replacing lost limbs with synthetic copies. \
			The additional biological training, while helpful, does hamper the average opifexes ability to study machines, lessening their ability to quickly adapt to situations and new \
			technology. After all, to the average opifex a biological entity is far less complex and nuisanced than even the most basic of robots."

	restricted_to_species = list(FORM_OPIFEX)

	stat_modifiers = list(
		STAT_ROB = 0,
		STAT_TGH = 0,
		STAT_VIG = 0,
		STAT_BIO = 10,
		STAT_MEC = -5,
		STAT_COG = -5
	)

/datum/category_item/setup_option/background/ethnicity/opifexcombattech
	name = "Combat Technician"
	desc = "Some opifex are assigned the tasks of dealing with the hostile entities aboard ships they loot, be it creatures living on space hulks, machines still defending lost ships, \
			or the crew of a recently boarded ship being mercilessly slaughtered so they can peacefully strip the shuttles tech. Combat technicians favor the use of range weaponry, often \
			times supported by combat drones with which they lead into conflict. Their skills towards repairing and salvaging technology isn't as good as the average opifex, but their concern \
			is only on making areas safe for the lesser technicians to do the grunt labors."

	restricted_to_species = list(FORM_OPIFEX)

	stat_modifiers = list(
		STAT_ROB = 0,
		STAT_TGH = 4,
		STAT_VIG = 10,
		STAT_BIO = 0,
		STAT_MEC = -7,
		STAT_COG = -7
	)

/datum/category_item/setup_option/background/ethnicity/chtmantro
	name = "Ro Caste"
	desc = "Ro’s are the worker class, and were the most varied in terms of genetic alterations. Their purpose was always \
			chosen at birth and their bodies altered to fit whatever best aids in this goal. Their tasks ranged from cutting through \
			tough rock, processing raw ore into mineral rich gels for consumption, to even simple crop and animal care. They only \
			knew what was needed for their purpose and literally nothing else."

	restricted_to_species = list(FORM_CHTMANT)

	stat_modifiers = list(
		STAT_ROB = 4,
		STAT_TGH = 3,
		STAT_VIG = 3,
		STAT_BIO = 3,
		STAT_MEC = -7,
		STAT_COG = -6
	)

/datum/category_item/setup_option/background/ethnicity/chtmantru
	name = "Ru Caste"
	desc = "Ru’s are the primary brain power of the hives. Possessing incredibly weak bodies and short stature, a hive would  \
			usually have less than ten at most and use them to perform primitive medical care, research, and genetic alterations to  \
			the rest of their hives. Being pre stone age at the time, their research mostly consisted of consuming any and  \
			everything to unravel its genetic code. Because of this the Ru brain and body was, and still is, a complex mystery. \
			Due to the physical weakness of the Ru caste they are barred from taking roles as security and due to their importance to their respective hive restricted from work as prospectors."

	restricted_to_species = list(FORM_CHTMANT)
	restricted_depts = SECURITY | PROSPECTOR

	stat_modifiers = list(
		STAT_ROB = -8,
		STAT_TGH = -8,
		STAT_VIG = -8,
		STAT_BIO = 8,
		STAT_MEC = 3,
		STAT_COG = 8
	)

/datum/category_item/setup_option/background/ethnicity/chtmantra
	name = "Ra Caste"
	desc = "Ra’s are the warriors and sentries of the hives. Numbering in the hundreds they would tower over Ru’s and even \
			most workers, the Ro. Their bodies were highly adapted to fight and they knew only loyalty unto death for the good of \
			the hive’s. Due to this, and the existence of the Ru, they often heavily lacked any cognitive thinking skills and would \
			rely on winning battles by sheer weight of numbers or attrition. The severe lack of intelligence they exibit also bars them from most medicalroles and all of science, engineering, and command roles."

	restricted_to_species = list(FORM_CHTMANT)

	restricted_depts = SCIENCE | ENGINEERING | COMMAND
	restricted_jobs = list(/datum/job/cmo, /datum/job/doctor, /datum/job/psychiatrist, /datum/job/paramedic)

	stat_modifiers = list(
		STAT_ROB = 15,
		STAT_TGH = 15,
		STAT_VIG = 5,
		STAT_BIO = -10,
		STAT_MEC = -15,
		STAT_COG = -10
	)

/datum/category_item/setup_option/background/ethnicity/cindarbunker
	name = "Bunker Born"
	desc = "Cindarites born on their death world of Cindar now reside in the radiation proofed bunkers deep underground. \
			Such a living has its advantages and disadvantages, bunker born cindarites are very communal and focus heavily on maintaining over their domains to keep them in top condition. \
			After all, even a single breach could spell the end for the dwellers despite their in-born resistance to their toxic homeworld. Such a confined life style though spells poorly for \
			their physical health, so biological maintenance is just as important as physical."

	restricted_to_species = list(FORM_CINDAR)

	stat_modifiers = list(
		STAT_ROB = -5,
		STAT_TGH = -5,
		STAT_VIG = 0,
		STAT_BIO = 5,
		STAT_MEC = 5,
		STAT_COG = 0
	)

/datum/category_item/setup_option/background/ethnicity/cindarspacer
	name = "Spacer"
	desc = "Many cindarites choose to leave the confines of their deathworld of Cindar and instead choose to become spacers, spending ther entire lives living on traveling ships. \
			Spacers often take work as engineers, merchants, and sometimes pirates as jobs are rarely ever steady. This broadens the already wide range of skills that most cindarites have, but \
			most of this knowledge is learned practically, making them poor studies on more advanced careers that can't be as easily learned from a hands on approach."

	restricted_to_species = list(FORM_CINDAR)

	stat_modifiers = list(
		STAT_ROB = 5,
		STAT_TGH = 0,
		STAT_VIG = 0,
		STAT_BIO = 0,
		STAT_MEC = 5,
		STAT_COG = -10
	)

/datum/category_item/setup_option/background/ethnicity/humancolony
	name = "Colony Ancestry"
	desc = "A catch all term to describe Humans and Abhumans born within Terran Colonies. Those born here have access to much more prestigious and advanced education facilities, \
	along with various military pathways to choose from. Colony born humans tend to be widely skilled and physically better off than most as a result of clean living and access to \
	beffter form of education than most. You may have been born on a colony world or be the child of those that were, in either case you still reap the benefits of good genetics."

	restricted_to_species = list(FORM_HUMAN)

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

	restricted_to_species = list(FORM_HUMAN)

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
	a solid comprehension of engineering is required, which leads to Spacers quickly coming to learn their enviroment and technology exceptionally well. Living in a confined and enviromentally \
	controlled space, however, weakens the body. You might have been born to spacers who finally put down roots on a planet or stayed in space, in either case they made sure to pass along \
	their technical skills to you."

	restricted_to_species = list(FORM_HUMAN)

	stat_modifiers = list(
		STAT_ROB = 0,
		STAT_TGH = 0,
		STAT_VIG = 0,
		STAT_BIO = 6,
		STAT_MEC = 6,
		STAT_COG = 6
	)

//Homeworlds are where a character is from and includes racial and expanded homeworlds. Homeworlds apart of the federation should be restricted to humans and their respective natives.
/datum/category_group/setup_option_category/background/homeworld
	name = "Homeworld"
	category_item_type = /datum/category_item/setup_option/background/homeworld

/datum/category_item/setup_option/background/homeworld

/datum/category_item/setup_option/background/homeworld/newdamascus
	name = "New Damascus"
	desc = "Once a bustling manufacturing world that was rich in oxygen and low in moisture, New Damascus is an arid world slowly bringing itself back from the brink of economic collapse. \
	Originally boasting three resource rich moons, this world produced a large amount of ships, weapons, and other metallic goods for the Terran Federation. Unfortunately the mines eventually \
	ran dry and it left New Damascus in a state of stagnation with local rulers growing more draconian and desperate as they watched their reserves and their populations slowly drop. Since \
	the bluespace crash however, New Damascus has seen a resurgence in it's forges with neighboring systems diverting resources to them due to their proximity. Today, New Damascus has tried to \
	cultivate a reputation for openness and quality of life to draw back expats, however their outlying colonies and stations are still known for being extremely restrictive. Individuals from \
	New Damascus are often diligent, resourceful, rough mannered, and seeking a better future."

	stat_modifiers = list(
		STAT_ROB = 0,
		STAT_TGH = 0,
		STAT_VIG = 5,
		STAT_BIO = -5,
		STAT_MEC = 5,
		STAT_COG = 0
	)

/datum/category_item/setup_option/background/homeworld/neapolis
	name = "Neapolis"
	desc = "With a reputation as a resort, this lush garden world has modeled itself as an escape for repressed artists, political exiles, and individuals who would largely be ostracized \
	by most major powers. Neapolis is covered with endless plains of Vermillion grass, migratory forests, and deep violet colored oceans and it's marble white settlements have proven to be \
	highly attractive destinations for tourists and vacationers, but the planet does have a number of drawbacks. The primary issue facing the residents of Neapolis is the lack of settle-able \
	land with only a smattering of plateaus being safe enough for permanent settlements in the face of the ever transient forests. Fortunately the second issue- a lack of valuable ores \
	or gasses, has so far been a boon for Neapolitians who have managed to evade major interest from their large- sometimes hostile, neighbors. Individuals from Neapolis are often \
	idealistic, artistic, and sometimes a little naive."

	stat_modifiers = list(
		STAT_ROB = 0,
		STAT_TGH = 0,
		STAT_VIG = 0,
		STAT_BIO = 0,
		STAT_MEC = 0,
		STAT_COG = 5
	)

/datum/category_item/setup_option/background/homeworld/aquafria
	name = "Aqua Fria"
	desc = "Tucked away in a heavily populated system, this large aquatic world has made a reputation for being a substantial food source and home to a number of research institutes. \
	While neighboring worlds boast sprawling hive worlds and smog-filled industrial continents, Agua Fria has raging oceans, thousands of massive fishing trawlers, and less than a dozen \
	star-ports scattered across rocky, wave battered islands. This has led to a number of local rivalries and power struggles as each of the star-ports harness their fleets of fishmongers to \
	compete for market shares as they engage in a desperate contest to feed the massive population of their neighboring worlds. These conflicts are often economic, territorial, and electronic, \
	but since the crash the massive ocean trawlers have begun arming themselves more. These conflicts are becoming increasingly frustrating for local researchers who are being \
	treated with more and more hostility from both the fish mongers and their port masters. Individuals from Agua Fria are often skeptical of those outside their social circle, \
	highly adept swimmers, and usually very business minded."

	stat_modifiers = list(
		STAT_ROB = 0,
		STAT_TGH = 5,
		STAT_VIG = 0,
		STAT_BIO = 0,
		STAT_MEC = -5,
		STAT_COG = 5
	)

/datum/category_item/setup_option/background/homeworld/kurilskaya
	name = "Kurilskaya"
	desc = "Originally a small mining facility dug into the crust of a gas giant's moon, Kurilskaya has since been turned into a hive of scum and villainy. With a unique culture of crime \
	and an overbearing prerogative of secrecy. The people of this rusting, dust filled facility are ruled by a kleptocracy council of ship captains, marine officers, and ore barons. The \
	pathways and housing habs are often prone to tremors from mining operations, the landing bays are often turned into impromptu market bazaars, and the local restaurants often serve a \
	variety of seafood which is gathered directly from the station's water filtration systems. Individuals from Kurilskaya are often cut throat, roguish, share a grim sense of humor, and \
	are very secretive about where Kurilskaya is actually located. A benefit of living in a dangerous world is you knew how not to draw attention to yourself, taking care so often to keep yourself \
	quiet that its become second nature to you now."

	perks = list(/datum/perk/quiet_as_mouse)

	stat_modifiers = list(
		STAT_ROB = 0,
		STAT_TGH = 0,
		STAT_VIG = 0,
		STAT_BIO = 0,
		STAT_MEC = 0,
		STAT_COG = 0
	)

/datum/category_item/setup_option/background/homeworld/thalatta
	name = "Thalatta"
	desc = "Translated from the ancient Greek term for 'The Sea,' Thalatta is an aptly named city-ship that is ever sailing through the great cosmic sea. Built centuries ago by a small sect of \
	religious castaways, the ship has been making a slow journey through the Milky Way in search of a promised land for it's void-borne occupants. With no objection towards cybernetics, the \
	thousands of occupants of the Thalatta have been slowly adopting the use of implants and robotics to both prolong their lifespans and better synergize with their ship. This has led many \
	outsiders to speculate that the Thalatta and it's occupants will slowly begin mixing their religious beliefs and technology with scary and unimaginable ends. Ironically while the original \
	beliefs of the Thalattans seem mundane and inoffensive, it may be that another conflict of belief between the Thalattans and their neighbors is inevitable. Individuals from Thalatta are \
	tech savvy, reverent towards fellow believers, and skeptical of outside authority- especially when it's perceived as being luddic or atheistic."

	stat_modifiers = list(
		STAT_ROB = -5,
		STAT_TGH = 0,
		STAT_VIG = 5,
		STAT_BIO = 0,
		STAT_MEC = 5,
		STAT_COG = 0
	)

/datum/category_item/setup_option/background/homeworld/madinatyunan
	name = "Madinat Yunan"
	desc = "Initially selected for habitation for its rich gasses and potential for being located on an upcoming trade lane, this gas giant had many of its economic dreams dashed, with \
	the gaseous mixture of the atmosphere being poor for fuel production and the trade lane never materializing. The initial colonization efforts soon dried up, and the thousands of colonists \
	that had been shipped to the low orbit habitats soon found themselves stranded without supplies and had only just begun requesting evacuation when the Bluespace Crash occurred. As contact \
	was made with the planet again it was discovered that the habitats were destroyed or abandoned and yet the colonists had found a way to survive and thrive. Forming a symbiotic relationship \
	with a bizarre species of titanic whale-like creature, the colonists had taken to hunting and slaughtering them for food only to discover they were sapient but incapable of communication. \
	The whale-like creatures saw feeding the struggling colonists as a necessity and had offered their weakest for slaughter for reasons yet unknown. The grizzly almost sacrificial nature of it \
	makes many outsiders few madinat's as monsters, but their focus on medical pursuits help belay some suspicions."

	stat_modifiers = list(
		STAT_ROB = 0,
		STAT_TGH = 0,
		STAT_VIG = -5,
		STAT_BIO = 10,
		STAT_MEC = 0,
		STAT_COG = 0
	)

/datum/category_item/setup_option/background/homeworld/rankorin
	name = "Rankorin"
	desc = "Rankorin was originally classified as a death world due to its highly toxic atmosphere caused by a combination of natural flora and common storms of poisonous dusts clouds. \
	However the discovery of immense diamonds deposits lured potential companies to establish colonies on the planet for a highly lucrative mining operation. Much to misfortune of the first \
	people to settle there the toxic nature of the world proved most disastrous to kriosans and cindarites despite their usual tolerance to such conditions. Through a quirk of biology the flora of \
	Rankorin developed toxins that attacked the immune system and turned it against the body, as such, races normally suited for this world avoided it as much as possible. \
	The remaining people who choose to settle here and work the mines adapted over several generations to thrive in bad atmosphere and have almost become dependent on it. \
	This adaptation, coupled with working the diamond mines, have made them physically strong but comparably weak to people of other home-worlds."

	perks = list(/datum/perk/chaingun_smoker)

	stat_modifiers = list(
		STAT_ROB = 0,
		STAT_TGH = 0,
		STAT_VIG = 0,
		STAT_BIO = 0,
		STAT_MEC = 0,
		STAT_COG = 0
	)

/datum/category_item/setup_option/background/homeworld/sanperitor
	name = "Sanperitor"
	desc = "Sanperitor is a low atmosphere world closer to its systems star then most species are comfortable living with. The intense solar radiation of the planet has caused those who reside their to \
	naturally adapt to the toxins present in every day life. Sanperitor itself first came to be colonized due to its larger than normal core and already lightly radioactive atmosphere that allowed \
	for massive thermonuclear power generators to be built. The planet itself supplies a great number of worlds with super charged power cores, artificially crafted super matters, and \
	technology used to produce star ship engines or planetary nuclear reactors. People from this planet tend to be physically weaker than most but cheerfully resolute and have naturally \
	evolved to resist most forms of toxins."

	restricted_to_species = list(FORM_SABLEKYNE, FORM_AKULA, FORM_MARQUA, FORM_NARAMAD, FORM_OPIFEX, FORM_CHTMANT)
	perks = list(/datum/perk/blood_of_lead)

	stat_modifiers = list(
		STAT_ROB = 0,
		STAT_TGH = 0,
		STAT_VIG = 0,
		STAT_BIO = 0,
		STAT_MEC = 0,
		STAT_COG = 0
	)

/datum/category_item/setup_option/background/homeworld/earthandmars
	name = "Earth and Mars"
	desc = "Earth and Mars are the political seat of power for the Terran Federation and considered the wealthiest and most heavily protected planets in the known universe. \
	People from earth and mars are almost universally wealthy and worldly, with access to broad educations and understandings in philosophies that help them at every step in life. \
	The melting pot of cultures have made Sol born extremely knowledgeable of other cultures and varied even among themselves, anyone of any race could have once been born and bred in the \
	Sol system. However, most are still commonly human or abhuman even with the numerous exceptions. As a result of the clean living, free of pollution, drugs, or heavily processed foods \
	your body is healthy but can't handle as many drugs as other people and you find yourself getting addicted slightly easier."

	perks = list(/datum/perk/solborn)

	stat_modifiers = list(
		STAT_ROB = 3,
		STAT_TGH = 3,
		STAT_VIG = 3,
		STAT_BIO = 3,
		STAT_MEC = 3,
		STAT_COG = 3
	)

/datum/category_item/setup_option/background/homeworld/onkarth
	name = "Onkarth"
	desc = "The planet of Onkarth is the homeworld of the sablekyne, a desert planet of extreme conditions along the equator and northern \
	fringes of civilization. The conditions on Onkarth are brutal with long blazingly hot days and freezing ice cold nights in even the hottest regions. The planet is also plagued with common \
	and vicious animals that often attempt to make a meal of anything they find. Native fauna to the planet also have evolved with chitinous or bone-like growths that create a durable layer of \
	natural armor that require either great strength to break or superior firepower. Due to the planets hostility few other than sablekyne choose to live on the planet, those that do are often \
	family members to humans, abhumans, or naramads stationed there as part of the Terran Federation planteary defense force. "

	restricted_to_species = list(FORM_SABLEKYNE, FORM_HUMAN, FORM_NARAMAD)

	stat_modifiers = list(
		STAT_ROB = 5,
		STAT_TGH = 5,
		STAT_VIG = 0,
		STAT_BIO = 0,
		STAT_MEC = 0,
		STAT_COG = 0
	)

/datum/category_item/setup_option/background/homeworld/donbettyr
	name = "Donbettyr"
	desc = "The planet of Donbettyr is the homeworld of the akula, an old primarily water planet with two moons and few thosuand seperated areas of land making up a series of islands and archapelos. \
	Donbettyr suffers heavily from extreme storms and rainfalls with weather rarely being clear for more than a handful of days. Frequent tsunamis and volcanic activity also commonly appear  \
	every few years and can have devistating impacts on those ill-prepared. Despite harsh weather however Donbettyr is a tropical paradise in many ways and contains large tropical biomes \
	that make it an appealing place both to live and visit. Donbettyr is largely home to those well adapted to living in wet enviroments, with humans, abhumans, akula, and very rarely mar'qua \
	choosing to live there. The harsh storms and weather, coupled with swimming being the most common leisure activity, toughens most who spend there lives here."

	restricted_to_species = list(FORM_AKULA, FORM_HUMAN, FORM_MARQUA, FORM_SABLEKYNE)

	stat_modifiers = list(
		STAT_ROB = 0,
		STAT_TGH = 10,
		STAT_VIG = 0,
		STAT_BIO = 0,
		STAT_MEC = 0,
		STAT_COG = 0
	)

/datum/category_item/setup_option/background/homeworld/marquahomeworlds
	name = "Marqua Homeworlds"
	desc = "The mar'qua homeworlds are a massive collection of varied star systems controlled by the mar'qua empire and its allies within the Terran Federation. While the mar'qua homeworlds are \
	largely self sufficient they follow a strict caste system and each world is largely similar to one another. Concepts of family, friendship, and leisure time are foreign ideas to  \
	worlds controlled by the mar'qua empire and people growing up here may be relocated by the government to new areas or even new worlds far from family or friends at a moments notice. \
	Mar'qua are practical above all else and as such employ the use of humans and cindarites greatly for their broader skills, allowing them to live within their borders, yet they refuse \
	citizenship to any other race. Life in the homeworlds is one of monotany, but such living enhances the intelligence of denizens as toil and reassignment happen often enough to \
	broaden your skill sets."

	restricted_to_species = list(FORM_MARQUA, FORM_HUMAN, FORM_CINDAR)

	stat_modifiers = list(
		STAT_ROB = 0,
		STAT_TGH = 0,
		STAT_VIG = 0,
		STAT_BIO = 5,
		STAT_MEC = 5,
		STAT_COG = 5
	)

/datum/category_item/setup_option/background/homeworld/marquawanderer
	name = "Wanderers Armada"
	desc = "The Wanderer's Armada is a group of nearly a hundred repourposed ships, ranging from small corvettes to the largest Dreadnought that began the Armada. While the size of this fleet \
	rivals certain Federation fleets, it focuses on being the wandering black market, visiting each system and recruiting those that wish to join them. While originally it was composed of \
	Mar'Qua exiles, currently nearly every race in the known space has it's part in the Armada."

	stat_modifiers = list(
		STAT_ROB = 0,
		STAT_TGH = 4,
		STAT_VIG = 4,
		STAT_BIO = 0,
		STAT_MEC = 0,
		STAT_COG = 4
	)

/datum/category_item/setup_option/background/homeworld/norian
	name = "Norian"
	desc = "The world of Norian is home to the physically powerful race of the Naramadi. The naramad live amoungst the ruins of another civilzation long forgotten with the passage of time \
	who's only remaining mark on the world is many dangerous ruins dotting the landscape. Many areas of Norian remain largely unplundered and often treated as sacred locations by the local \
	naramad tribes who often plunder the location at great risk for what they consider worthwhile rewards. Norian does boast a decent human, abhuman, and sablekyne population as those races of \
	the Terran Federation are uniquely capable of adapting to the harsh world. Unfortunately Norian has next to nothing in the way of proper education, even among the Terran plantary defence forces. \
	People from this planet tend to be the hardiest of individuals, but just as often they prove to be dull and lacking in attention to detail."

	restricted_to_species = list(FORM_NARAMAD, FORM_HUMAN, FORM_SABLEKYNE, FORM_AKULA)

	stat_modifiers = list(
		STAT_ROB = 10,
		STAT_TGH = 10,
		STAT_VIG = -10,
		STAT_BIO = 0,
		STAT_MEC = 0,
		STAT_COG = -10
	)

/datum/category_item/setup_option/background/homeworld/scavengerfleet
	name = "Scavenger Fleet"
	desc = "The scavenger fleets of the Opifex are a mix of massive ships miles long and smaller skip jacks housing clans of populi and dominus opifex. Scavenger fleets are always on the move \
	and rarely stay in one place for long as they make prey of enemies of the Terran Federation, pirates, or unaligned colonies just trying to make a living. Due to the opifex superiority  \
	complexes they absolutely and resolutely refuse to allow anyone besides their own kind and synthetic life forms to even visit the various fleets they call home. Opifex fleets are strangely  \
	lawful places despite their subsistance largely based upon raiding and every opifex is trained on maintaining their various ships and robots."

	restricted_to_species = list(FORM_OPIFEX)

	stat_modifiers = list(
		STAT_ROB = 0,
		STAT_TGH = 0,
		STAT_VIG = 0,
		STAT_BIO = 0,
		STAT_MEC = 5,
		STAT_COG = 5
	)

/datum/category_item/setup_option/background/homeworld/cindar
	name = "Cindar"
	desc = "The homeworld of the cindarite, creatively named Cindar, is a hostile deathworld of radiation and heat where the inhabitants live deep underground in fortified rad proofed bunkers. \
	Cindar is a place that few can survive, even the more toxin adapted Kriosan would perish after a few years. As such only the Cindarites call this place home. \
	Life in the underground bunkers left little time for  much physical activity but leisure time spent studying, reading, or maintaining your home has give you a broad set of skills. \
	The occassional dose of light radiation has also helped improve your toughness a small bit, so maybe Cindar isn't that bad."

	restricted_to_species = list(FORM_CINDAR)

	stat_modifiers = list(
		STAT_ROB = 0,
		STAT_TGH = 3,
		STAT_VIG = 0,
		STAT_BIO = 3,
		STAT_MEC = 3,
		STAT_COG = 3
	)

/datum/category_item/setup_option/background/homeworld/krios
	name = "Krios"
	desc = "Krios is a land steeped in conflict in the last few decades with the arrival of the Terran Federation and a subsequent rebellion after the bluespace crash. \
	Krios is now formerly owned by itself, having opportunistically thrown off Terran rule, though much of their society is left scarred by the conflict and citizens now spend more time \
	training and drilling themselves should the federation ever come back. Krios itself is still a toxic and hostile planet with poisonous fauna, as such few federation races choose to live there \
	except for the cindarite, who due to their own world being even worse, thrive in the conditions of krios better than the natives."

	restricted_to_species = list(FORM_KRIOSAN, FORM_CINDAR)

	stat_modifiers = list(
		STAT_ROB = 0,
		STAT_TGH = 5,
		STAT_VIG = 5,
		STAT_BIO = 0,
		STAT_MEC = 0,
		STAT_COG = 0
	)

//Careers represent former and current careers, showing the adjustment to skills based on years of work in a field.
/datum/category_group/setup_option_category/background/career
	name = "Career"
	category_item_type = /datum/category_item/setup_option/background/career

/datum/category_item/setup_option/background/career

/datum/category_item/setup_option/background/career/pirate
	name = "Former Pirate"
	desc = "Early on in your life you became a pirate for personal reasons. You may have been a void wolf or apart of a named group of space raiders, regardless of your decisions you spent a \
	period attacking other ships, frontier colonies, and looting the aftermaths of battles for anything of value. For whatever reason you gave up that life to become an honest \
	(or dishonest) citizen of the colony. One benefit at least of your raider life style is you got good at getting in and out quickly, regardless of any barriers in your way. Sadly your past is \
	a known factor and while here on the frontier security can overlook a checkered past, command positions are still barred for you."

	restricted_depts = COMMAND
	perks = list(/datum/perk/parkour)

	stat_modifiers = list(
		STAT_ROB = 0,
		STAT_TGH = 0,
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

/datum/category_item/setup_option/background/career/mechanic
	name = "Former Mechanic"
	desc = "You like mechanics, from cars to hover bikes to electrical equipment you've worked on them all. Maybe you were a minor technician, working on general maintenance for a few vehicles \
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
	desc = "The Terran Federation is the largest industrial military complex in the galaxy, former members are extremely common be they conscripts of conquered empires or citizens seeking \
	to serve their nation. Some individuals may come from their own planetary defense forces, serving as a combination of planetary guard and soldier. Military training has the benefit \
	of physical conditioning and marksmenship training, but the stamping out of the individual makes most lose their creativity."

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
	desc = "The Terran Federation is the largest industrial military complex in the galaxy, former members are extremely common be they conscripts of conquered empires or citizens seeking \
	to serve their nation. Some individuals may come from their own planetary defense forces, serving as a combination of planetary guard and soldier. Military training has the benefit \
	of physical conditioning and as a combat medic you got the benefit of additional medical training, though not as good as what you'd get in a hospital, it has its benefits."

	stat_modifiers = list(
		STAT_ROB = 0,
		STAT_TGH = 2,
		STAT_VIG = 1,
		STAT_BIO = 3,
		STAT_MEC = -5,
		STAT_COG = 4
	)

/datum/category_item/setup_option/background/career/militaryengineer
	name = "Former Military (Engineering)"
	desc = "The Terran Federation is the largest industrial military complex in the galaxy, former members are extremely common be they conscripts of conquered empires or citizens seeking \
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
	Your former connections, for they are former as you've left that life behind, still haunt you as your record is known by security. As such you are barred from command positions, though not from \
	security itself, after all, its the frontier and the colony can't be as picky as bigger empires. But that life has at least gifted you with some broad if boorish skills and a quick fingered \
	disposition for snatching objects off of people without them noticing."

	restricted_depts = COMMAND
	perks = list(/datum/perk/fast_fingers)

	stat_modifiers = list(
		STAT_ROB = 0,
		STAT_TGH = 0,
		STAT_VIG = 0,
		STAT_BIO = 0,
		STAT_MEC = 0,
		STAT_COG = 0
	)

/datum/category_item/setup_option/background/career/asteroid
	name = "Former Space Contractor"
	desc = "Maybe you were an asteroid miner, hull repair technician, or simply worked a job where oxygen was a rarity. Whatever your job, it was so far from civilization and people you \
	developed a hearty constitution and self reliant attitude. Yet the boredom of being cut off from the general population and the lack of more intellectual stimulation did a number on your \
	creativity. All that time spent working in low oxygen enviroments and the occassional oxygen breach has adapted you to dealing with such events, your lungs may as well be made of metal now."

	perks = list(/datum/perk/lungs_of_iron)

	stat_modifiers = list(
		STAT_ROB = 0,
		STAT_TGH = 0,
		STAT_VIG = 0,
		STAT_BIO = 0,
		STAT_MEC = 0,
		STAT_COG = 0
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
		STAT_BIO = 0,
		STAT_MEC = 0,
		STAT_COG = 13
	)


/datum/category_item/setup_option/background/career/scavenger
	name = "Former Scavenger"
	desc = "As a scavenger you spent a great deal of time charting pathways through the unexplored areas of space, scanning planets for old ruins that might have valuables, or exploring forgotten battlefields. \
	Sometimes it was more localized, crawling to the abandoned tunnels of destroyed and long forgotten ship looking for valuables and answers to why they were brought to this state. \
	Life as a scavenger was rough, but it did let you adjust to frontier work comfortably. Your life of avoiding hazards be they incidental or made with malcontent has at least made you more ready \
	to dodge potential traps."

	perks = list(/datum/perk/sure_step)

	stat_modifiers = list(
		STAT_ROB = 0,
		STAT_TGH = 0,
		STAT_VIG = 0,
		STAT_BIO = 0,
		STAT_MEC = 0,
		STAT_COG = 0
	)

//Backgrounds are usually representations of childhoods or how a person grew up, not where. This ranges from being wealthy, poor, a refugee, or having specific influences.
/datum/category_group/setup_option_category/background/bckgrnd
	name = "Upbringing"
	category_item_type = /datum/category_item/setup_option/background/bckgrnd

/datum/category_item/setup_option/background/bckgrnd

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

/datum/category_item/setup_option/background/bckgrnd/wealthy
	name = "Wealthy Upbringing"
	desc = "You grew up with a silver spoon in your mouth all your life. Education, leisure time, and relaxation allowed you to indulge in scholarly pursuits to a degree, letting you pick up a few \
	randomly useful facts about many things. A shame that easy living left you a bit naive and physically weak albiet healthier than most. Not to mention you never quite developed the sense of when \
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
	meaning after the destruction of your home-world. Or maybe it wasn't your homeworld that was destoyed, maybe it was just your way of life. Regardless, you've left a burned bridge behind you and \
	can no longer go back. Your rough life has hardened you to the worst troubles you may face."

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
	desc = "You're an idiot, no really, you're just a complete brainlet when it comes to anything you're not hyper focused on. You have an innate knack and understanding with the most conceptual  \
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

/datum/category_item/setup_option/background/bckgrnd/chtmantspider
	name = "Eight-Legged Ally"
	desc = "As a cht'mant you have an innate understanding towards insects and crawling things. While most of your kin are naturally adapted to roaches you've developed a sense of  \
	control and understanding to spiders. Over time a subtle shift in your pheramones allowed you to interact with spiders much in the same way your kin do with roaches. \
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