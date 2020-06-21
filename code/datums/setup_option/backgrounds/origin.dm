//As a general rule, all origin backrounds must have summ of +0 of stat values

/datum/category_group/setup_option_category/background/origin
	name = "Origin"
	category_item_type = /datum/category_item/setup_option/background/origin

/datum/category_item/setup_option/background/origin

/datum/category_item/setup_option/background/origin/northlander
	name = "Sablekyne - Northlander"
	desc = "The northlander sablekyne are a people devoted to family and tradition, built to survive in the cold mountanous regions they call home. \
			Northlanders live in a tougher enviroment then their southlander cousins, where fights and conflict between each other are as common as with the dangerous wildlife. \
			The focus on physical martial success though leaves far less time for study and as a result while you are a bit tougher you are not as learned. \
			Then again, when all else fails and diplomacy falls through you can always rely on your claws."

	stat_modifiers = list(
		STAT_ROB = 7,
		STAT_TGH = 7,
		STAT_VIG = -7,
		STAT_BIO = 0,
		STAT_MEC = 0,
		STAT_COG = -7
	)

	restricted_to_species = list(SPECIES_TAJ)

/datum/category_item/setup_option/background/origin/southlander
	name = "Sablekyne - Southlander"
	desc = "The southlander sablekyne are a people who consider themselves simply better than anyone else, be it through martial or mental tasks. \
			Southlanders hail from the brutally hot desert along the equator of Onkarth behind fortified walls where they conduct most of the planets commerce. \
			Southlanders are not shy about combat but their focus on more mental pursuits leave them less capable than their northern cousins. \
			After all, only a brute needs to resort to violence when so many other options exists."

	stat_modifiers = list(
		STAT_ROB = -5,
		STAT_TGH = -5,
		STAT_VIG = -5,
		STAT_BIO = 5,
		STAT_MEC = 5,
		STAT_COG = 5
	)

	restricted_to_species = list(SPECIES_TAJ)

/datum/category_item/setup_option/background/origin/maunkyne
	name = "Sablekyne - Maunkyne"
	desc = "The maunkyne are the absolute lowest dregs of sablekyne society, users of a highly addictive drug they are permanately enslaved to. \
			On their homeplanet maunkyne are outcasts, executed in the north for the crime of existing and exiled in the south to the unforgiving desert wastes. \
			As a maunkyne you might be able to pass as a normal sablekyne, even amoung your more aware kin, but the colonies strict regulation on demon powder has left you without your fix. \
			Without it, your body is weak, extremely so but your upbringing in the criminal underworld of Onkarth has left you with a feral cunning. \
			Even the most 'noble' maunkyne knows much about medicine, in particular the creation of highly profitable and illegal drugs. \
			Due to maunkyne's innate addictions they are barred from command and security roles."

	restricted_depts = SECURITY | COMMAND
	restricted_jobs = list(/datum/job/chaplain)
	

	stat_modifiers = list(
		STAT_ROB = -10,
		STAT_TGH = -10,
		STAT_VIG = 0,
		STAT_BIO = 10,
		STAT_MEC = 0,
		STAT_COG = 10
	)

/datum/category_item/setup_option/background/origin/jaeger
	name = "Kriosan - Jaeger"
	desc = "The jaegers are a group of frontier kriosan who plot the course for the spread of the kriosan civilization. \
			Jaegers are practical, individualistic, and self reliant with a rigid set of personal beliefs and stubborness to the point of coming off as arrogant. \
			While to outsiders most jaegers come across as gun obsessed hermits, a fact not helped with their penchant for trophy taking, none can deny their skill with rifles. \
			Unfortunately all that time at the range hasn't improved much else."

	stat_modifiers = list(
		STAT_ROB = -2,
		STAT_TGH = 3,
		STAT_VIG = 10,
		STAT_BIO = -3,
		STAT_MEC = -3,
		STAT_COG = -5
	)


/datum/category_item/setup_option/background/origin/castallen
	name = "Kriosan - Castellen"
	desc = "The castellen are the noble elite of the kriosan, genetically superior to the common folk they rule over but rarely found outside their own empire. \
			Castellens are widely known for their considerable size and physical merit but lack the practical training in most areas compared to others. \
			A lifetime of being trained for the realm of politics has made them quick to understand new things but abyssmal at more practical pursuits. \
			On top of all that, a castellens political affiliations, be it present or former, bar them from command roles due to the very obvious conflict of interests."

	restricted_depts = COMMAND
	restricted_jobs = list(/datum/job/chaplain)

	stat_modifiers = list(
		STAT_ROB = 10,
		STAT_TGH = 10,
		STAT_VIG = 0,
		STAT_BIO = -10,
		STAT_MEC = -20,
		STAT_COG = 10
	)


/datum/category_item/setup_option/background/origin/akulaganger
	name = "Akula - Former Ganger"
	desc = "Akula are a brutal people and some take this to another level. The fondness they possess for motor cycles and hover bikes have given way to a rise in gang-like culture. \
			While the common akula is strong, most gangers train themselves in the 'honorable' way of fighting, favoring melee. Fixing up their bikes so often has also given them some mechanical knack.  \
			Days and weeks of patching themselves up after a bar fight or gang-land style shooting have made most pretty self reliant, sadly even the clever gangers eventually get caught. \
			While criminal backgrounds are often overlooked, yours is one of public record, be it your own boasting or gang tattoos. Because of that security has no interest in hiring you, \
			even as a militia grunt."

	restricted_depts = SECURITY

	stat_modifiers = list(
		STAT_ROB = 10,
		STAT_TGH = 0,
		STAT_VIG = -6,
		STAT_BIO = 4,
		STAT_MEC = 7,
		STAT_COG = -15
	)


/datum/category_item/setup_option/background/origin/akulacommander
	name = "Akula - Former Commander"
	desc = "Military service for an akula is considered one of the most honorable professions one can take. Many become commanders within the Terran Federation military, often leading small squads \
			of Naramadi in ship to ship breaching squads or strike teams in ground assaults. Akula commanders are better trained with guns than most and adapt well to new things.  \
			Service in the military, however, has its draw backs. Much of an akula's training is steeped solely in marksmenship as they cannot keep pace with the faster naramads and must take \
			great care not to cause a friendly fire incident."

	stat_modifiers = list(
		STAT_ROB = -4,
		STAT_TGH = 0,
		STAT_VIG = 9,
		STAT_BIO = -4,
		STAT_MEC = -5,
		STAT_COG = 4
	)

/datum/category_item/setup_option/background/origin/akulabreacher
	name = "Akula - Former Breacher"
	desc = "Military service for an akula is considered one of the most honorable professions one can take. Those who lack the skill and cunning for a command position are often designated as breachers. \
			Akula breachers serve a single purpose, being the first person into a conflict that serves as a meat shield for those behind them in a stack.  \
			While impressive, this position attracts the less intelligent akulas who often become reliant on painkillers and stimulents to withstand the pain of their armor absorbing shots, \
			something that further dulls their already blunted minds. Training is also exclusive, focused entirely on melee as a hulking charging akula rushing a position attracts more concentrated \
			fire, thus freeing up the soldiers in the back to make clear picked shots."

	stat_modifiers = list(
		STAT_ROB = 20,
		STAT_TGH = 10,
		STAT_VIG = -10,
		STAT_BIO = -10,
		STAT_MEC = -10,
		STAT_COG = -10
	)

/datum/category_item/setup_option/background/origin/marquaintelligensia
	name = "Marqua - Intelligensia"
	desc = "The intelligensia of the mar'qua are the formally trained and 'think-tank' of mar'qua society, making up most of their scientists in the fields of biology and mathematics. \
			As someone who has left the higher folds of the intelligensia you are one of skilled rapport but a life of easy living has made you quite physically weak. \
			You lack of physically capability also makes you inelligable for the colony security forces, further locking you into your role as an intellectual."

	restricted_depts = SECURITY

	stat_modifiers = list(
		STAT_ROB = -10,
		STAT_TGH = -10,
		STAT_VIG = -10,
		STAT_BIO = 5,
		STAT_MEC = 5,
		STAT_COG = 5
	)


/datum/category_item/setup_option/background/origin/marquamenial
	name = "Marqua - Menial"
	desc = "Unfortunately for many mar'qua they are born as the gaaran-geraa, often called the menial castes. Your existance, much like your family and friends, was one of toil. \
			Meanials are trained from early childhood to be pragmatic above all else and enjoy the simple toil of their work. Appearence and taste is secondary to function, always. \
			As a meanial you lack the higher training of most mar'qua but a life of labour has made you toughened to the rigours of life, the sole benefit of heavy labour."

	stat_modifiers = list(
		STAT_ROB = 6,
		STAT_TGH = 7,
		STAT_VIG = 0,
		STAT_BIO = -5,
		STAT_MEC = -3,
		STAT_COG = -5
	)


/datum/category_item/setup_option/background/origin/marquamartial
	name = "Marqua - Martial"
	desc = "Also known as the quoqa-geraa, the martial caste of the mar'qua spends their entire lives training to defend the mar'qua empire. \
			The martial caste is strong, decisive, and extremely focused on the here and now of a situation to ensure the best choices are made. \
			While the martial caste is intelligent, after all they are still mar'qua, they lack the formal education even a menial is afforded, but a life of disciplined training has \
			improved their physical ability quite well."

	stat_modifiers = list(
		STAT_ROB = 4,
		STAT_TGH = 8,
		STAT_VIG = 12,
		STAT_BIO = -4,
		STAT_MEC = -10,
		STAT_COG = -10
	)


/datum/category_item/setup_option/background/origin/naramadsouth
	name = "Naramad - Southern"
	desc = "The southern naramad is perhaps the only thing in naramadi society considered 'intelligent' by any stretch of the word. \
			In the southern tribes the naramad people are far more enthusiastic towards scavenging the old ruins that dot the landscape of their homeworld. \
			Their enthusiasm for such work borders into a cult like belief that technology brings good luck and the more advanced it is the more worthy a trophy it makes. \
			Such a focus on mental pursuits have made southern naramad a little more adept at technology then others of their kind, but the technophilia has made them poorly adapted to \
			the workings of the body."

	stat_modifiers = list(
		STAT_ROB = 0,
		STAT_TGH = 0,
		STAT_VIG = 0,
		STAT_BIO = -20,
		STAT_MEC = 10,
		STAT_COG = 10
	)

/datum/category_item/setup_option/background/origin/naramadeast
	name = "Naramad - Eastern"
	desc = "Of naramad tribals the eastern tribes are the most primitive and most brutalistic of them. They live for hunting and fighting, making them popular conscripts for military service. \
			An eastern naramads focus on physical combat improves their already impressive strength and tough bodies but does little improve much else. \
			Even among their own kind the eastern naramads are considered luddites, their brash natures and complete ignorance of things unrelated to combat bar them from science, medical \
			engineering, and command roles."

	restricted_depts = SCIENCE | MEDICAL | ENGINEERING | COMMAND
	restricted_jobs = list(/datum/job/chaplain)

	stat_modifiers = list(
		STAT_ROB = 10,
		STAT_TGH = 10,
		STAT_VIG = -5,
		STAT_BIO = -10,
		STAT_MEC = -10,
		STAT_COG = -5
	)

/datum/category_item/setup_option/background/origin/opifexbiomech
	name = "Opifex - Biomechanist"
	desc = "While all opifex are trained in the workings of machines some are reserved for the biological aspect of their respective scavenger fleet. \
			This training is usually towards the goal of maintaining the biomechanical augmentations used by the opifex, from installing nano-gates to replacing lost limbs with synthetic copies. \
			The additional biological training, while helpful, does hamper the average opifexes ability to study machines, lessening their ability to quickly adapt to situations and new \
			technology. After all, to the average opifex a biological entity is far less complex and nuisanced than even the most basic of robots."

	stat_modifiers = list(
		STAT_ROB = 0,
		STAT_TGH = 0,
		STAT_VIG = 0,
		STAT_BIO = 10,
		STAT_MEC = -5,
		STAT_COG = -5
	)

/datum/category_item/setup_option/background/origin/opifexcombattech
	name = "Opifex - Combat Technician"
	desc = "Some opifex are assigned the tasks of dealing with the hostile entities aboard ships they loot, be it creatures living on space hulks, machines still defending lost ships, \
			or the crew of a recently boarded ship being mercilessly slaughtered so they can peacefully strip the shuttles tech. Combat technicians favor the use of range weaponry, often \
			times supported by combat drones with which they lead into conflict. Their skills towards repairing and salvaging technology isn't as good as the average opifex, but their concern \
			is only on making areas safe for the lesser technicians to do the grunt labours."

	stat_modifiers = list(
		STAT_ROB = 0,
		STAT_TGH = 4,
		STAT_VIG = 10,
		STAT_BIO = 0,
		STAT_MEC = -7,
		STAT_COG = -7
	)

/datum/category_item/setup_option/background/origin/chtmantro
	name = "Chtmant - Ro Caste"
	desc = "Ro’s are the worker class, and were the most varied in terms of genetic alterations. Their purpose was always \
			chosen at birth and their bodies altered to fit whatever best aids in this goal. Their tasks ranged from cutting through \
			tough rock, processing raw ore into mineral rich gels for consumption, to even simple crop and animal care. They only \
			knew what was needed for their purpose and literally nothing else."

	stat_modifiers = list(
		STAT_ROB = 4,
		STAT_TGH = 3,
		STAT_VIG = 3,
		STAT_BIO = 3,
		STAT_MEC = -7,
		STAT_COG = -6
	)

/datum/category_item/setup_option/background/origin/chtmantru
	name = "Chtmant - Ru Caste"
	desc = "Ru’s are the primary brain power of the hives. Possessing incredibly weak bodies and short stature, a hive would  \
			usually have less than ten at most and use them to perform primitive medical care, research, and genetic alterations to  \
			the rest of their hives. Being pre stone age at the time, their research mostly consisted of consuming any and  \
			everything to unravel its genetic code. Because of this the Ru brain and body was, and still is, a complex mystery. \
			Due to the physical weakness of the Ru caste they are barred from taking roles as security and due to their importance to their respective hive restricted from work as prospectors."

	restricted_depts = SECURITY | PROSPECTOR

	stat_modifiers = list(
		STAT_ROB = -8,
		STAT_TGH = -8,
		STAT_VIG = -8,
		STAT_BIO = 8,
		STAT_MEC = 3,
		STAT_COG = 8
	)

/datum/category_item/setup_option/background/origin/chtmantra
	name = "Chtmant - Ra Caste"
	desc = "Ra’s are the warriors and sentries of the hives. Numbering in the hundreds they would tower over Ru’s and even \
			most workers, the Ro. Their bodies were highly adapted to fight and they knew only loyalty unto death for the good of \
			the hive’s. Due to this, and the existence of the Ru, they often heavily lacked any cognitive thinking skills and would \
			rely on winning battles by sheer weight of numbers or attrition. The severe lack of intelligence they exibit also bars them from medical, science, engineering, and command roles."

	restricted_depts = SCIENCE | MEDICAL | ENGINEERING | COMMAND
	restricted_jobs = list(/datum/job/chaplain)

	stat_modifiers = list(
		STAT_ROB = 15,
		STAT_TGH = 15,
		STAT_VIG = 5,
		STAT_BIO = -10,
		STAT_MEC = -15,
		STAT_COG = -10
	)

/datum/category_item/setup_option/background/origin/cindarbunker
	name = "Cindarite - Bunker Born"
	desc = "Cindarites born on their death world of Cindar now preside in the radiation proofed bunkers deep underground. \
			Such a living has its advantages and disadvantages, bunker born cindarites are very communinal and focus heavily on presiding over their domains to keep them in top condition. \
			After all, even a single breach could spell the end for the dwellers despite their in-born resistance to their toxic homeworld. Such a confined life style though spells poorly for \
			their physical health, so biological maintenance is just as important as physical."

	stat_modifiers = list(
		STAT_ROB = -5,
		STAT_TGH = -5,
		STAT_VIG = 0,
		STAT_BIO = 5,
		STAT_MEC = 5,
		STAT_COG = 0
	)

/datum/category_item/setup_option/background/origin/cindarspacer
	name = "Cindarite - Spacer"
	desc = "Many cindarites choose to leave the confines of their deathworld of Cindar and instead choose to become spacers, spending ther entire lives living on traveling ships. \
			Spacers often take work as engineers, merchants, and sometimes pirates as work is rarely ever steady. This broadens the already wide range of skills that most cindarites have, but \
			most of this knowledge is learned practically, making them poor studies on more advanced careers that can't be as easily learned from a hands on approach."

	stat_modifiers = list(
		STAT_ROB = 5,
		STAT_TGH = 0,
		STAT_VIG = 5,
		STAT_BIO = 0,
		STAT_MEC = 0,
		STAT_COG = -10
	)