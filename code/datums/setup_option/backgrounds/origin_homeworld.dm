/datum/category_item/setup_option/background/homeworld
	restricted_to_species = list(FORM_HUMAN, FORM_EXALT_HUMAN, FORM_SABLEKYNE, FORM_AKULA, FORM_MARQUA, FORM_NARAMAD, FORM_OPIFEX, FORM_CHTMANT, FORM_KRIOSAN, FORM_CINDAR, FORM_SOTSYNTH, FORM_AGSYNTH, FORM_BSSYNTH, FORM_CHURCHSYNTH, FORM_FBP, FORM_UNBRANDED)

/datum/category_item/setup_option/background/homeworld/amethyn
	name = "Amethyn"
	desc = "The great jewel of the frontier, Amethyn, the place you have lived formerly as a tribal (or perhaps currently) that contains all the wonder and mystery of the realm. It's \
	natural splendor has given you an understanding of the potential green wealth on offer, but a world without written history is one of mystery. One that you may or may not know. As someone who \
	has resided here for quite some time, you've grown accustomed to the dangers and strangeness of the world. While this hasn't quite given you any advantage, surviving in the wilds requires \
	natural remedies, and as such you instinctively know your way around plants."

	restricted_to_species = list(FORM_MYCUS, FORM_FOLKEN)
	perks = list(PERK_GREENTHUMB)

	stat_modifiers = list(
		STAT_ROB = 0,
		STAT_TGH = 0,
		STAT_VIG = 0,
		STAT_BIO = 0,
		STAT_MEC = 0,
		STAT_COG = 0
	)

/datum/category_item/setup_option/background/homeworld/newdamascus
	name = "New Damascus"
	desc = "Once a bustling manufacturing world that was rich in oxygen and low in moisture, New Damascus is an arid world slowly bringing itself back from the brink of economic collapse. \
	Originally boasting three resource rich moons, this world produced a large amount of ships, weapons, and other metallic goods for the Solarian Federation. Unfortunately the mines eventually \
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
	or gasses, has so far been a boon for Neapolitians who have managed to evade major interest from their large sometimes hostile neighbors. Individuals from Neapolis are often \
	idealistic, artistic, and sometimes a little naive. As a lush garden world that boasts a highly productive and often self reliance on growable food, those from Neapolis are often \
	described as having a green thumb. Decades of living on a garden world have also made many of Neapolis obligate herbivores, preferring organic diets, but the lack of protein makes them \
	weaker on average."

	restricted_to_species = list(FORM_HUMAN, FORM_EXALT_HUMAN, FORM_KRIOSAN, FORM_MARQUA, FORM_NARAMAD, FORM_CINDAR, FORM_CHTMANT)
	perks = list(PERK_GREENTHUMB, PERK_HERBIVORE)

	stat_modifiers = list(
		STAT_ROB = -5,
		STAT_TGH = 0,
		STAT_VIG = 0,
		STAT_BIO = 5,
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
	highly adept swimmers, and usually very business minded. Due to an intense need to keep food clean and healthy for consumption, many of those from Aqua Fria treat cleaning their work spaces \
	and their equipment as second nature."

	perks = list(PERK_NEAT)

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

	perks = list(PERK_QUIET_AS_MOUSE)

	stat_modifiers = list(
		STAT_ROB = 0,
		STAT_TGH = 1,
		STAT_VIG = 2,
		STAT_BIO = 0,
		STAT_MEC = 0,
		STAT_COG = 2
	)

/datum/category_item/setup_option/background/homeworld/thalatta
	name = "Thalatta"
	desc = "Translated from the ancient Greek term for 'The Sea,' Thalatta is an aptly named city-ship that is ever sailing through the great cosmic sea. Built centuries ago by a small sect of \
	religious castaways, the ship has been making a slow journey through the Milky Way in search of a promised land for it's void-borne occupants. With no objection towards cybernetics, the \
	thousands of occupants of the Thalatta have been slowly adopting the use of implants and robotics to both prolong their lifespans and better synergize with their ship. This has led many \
	outsiders to speculate that the Thalatta and it's occupants will slowly begin mixing their religious beliefs and technology with scary and unimaginable ends. Ironically while the original \
	beliefs of the Thalattans seem mundane and inoffensive, it may be that another conflict of belief between the Thalattans and their neighbors is inevitable. Individuals from Thalatta are \
	tech savvy, reverent towards fellow believers, and skeptical of outside authority- especially if it's perceived as being Luddites or Atheists."

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
	people to settle there the toxic nature of the world proved most disastrous to kriosans, cindarites, and synthetic life forms despite their usual tolerance to such conditions. Through a quirk of biology the flora of \
	Rankorin developed toxins that attacked the immune system and turned it against the body, as such, races normally suited for this world avoided it as much as possible where in the case of synthetics, the \
	exceptional amount of pollution, radiation, dust storms, and electromagnetic pulses prevent synthetic individuals from surviving with any kind of ease. \
	The remaining people who choose to settle here and work the mines adapted over several generations to thrive in bad atmosphere and have almost become dependent on it. \
	This adaptation, coupled with working the diamond mines, have made them physically tough but comparably weak to people of other home-worlds."

	restricted_to_species = list(FORM_HUMAN, FORM_EXALT_HUMAN, FORM_SABLEKYNE, FORM_AKULA, FORM_MARQUA, FORM_NARAMAD, FORM_OPIFEX, FORM_CHTMANT)
	perks = list(PERK_CHAINGUN_SMOKER)

	stat_modifiers = list(
		STAT_ROB = -5,
		STAT_TGH = 10,
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
	technology used to produce star ship engines or planetary nuclear reactors. People from this planet tend to be physically tougher than most, cheerfully resolute and have naturally \
	evolved to resist most forms of toxins."

	restricted_to_species = list(FORM_HUMAN, FORM_EXALT_HUMAN, FORM_SABLEKYNE, FORM_AKULA, FORM_MARQUA, FORM_NARAMAD, FORM_OPIFEX, FORM_CHTMANT)
	perks = list(PERK_BLOOD_OF_LEAD)

	stat_modifiers = list(
		STAT_ROB = 0,
		STAT_TGH = 5,
		STAT_VIG = 0,
		STAT_BIO = 0,
		STAT_MEC = 0,
		STAT_COG = 0
	)

/datum/category_item/setup_option/background/homeworld/earthandmars
	name = "Earth and Mars"
	desc = "Earth and Mars are the political seat of power for the Solarian Federation and considered the wealthiest and most heavily protected planets in the known universe. \
	People from earth and mars are almost universally wealthy and worldly, with access to broad educations and understandings in philosophies that help them at every step in life. \
	The melting pot of cultures have made Sol born extremely knowledgeable of other cultures and varied even among themselves, anyone of any race could have once been born and bred in the \
	Sol system. However, most are still commonly human or abhuman even with the numerous exceptions. As a result of the clean living, free of pollution, drugs, or heavily processed foods \
	your body is healthy but can't handle as many drugs as other people and you find yourself getting addicted slightly easier."

	perks = list(PERK_SOLBORN)

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
	family members to humans, abhumans, or naramads stationed there as part of the Solarian Federation planetary defense force. "

	restricted_to_species = list(FORM_SABLEKYNE, FORM_HUMAN, FORM_EXALT_HUMAN, FORM_NARAMAD)

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
	desc = "The planet of Donbettyr is the homeworld of the akula, an old primarily water planet with two moons and few thousand separated areas of land making up a series of islands and archipelagos. \
	Donbettyr suffers heavily from extreme storms and rainfalls with weather rarely being clear for more than a handful of days. Frequent tsunamis and volcanic activity also commonly appear  \
	every few years and can have devastating impacts on those ill-prepared. Despite harsh weather however Donbettyr is a tropical paradise in many ways and contains large tropical biomes \
	that make it an appealing place both to live and visit. Donbettyr is largely home to those well adapted to living in wet environments, with humans, abhumans, akula, and very rarely mar'qua \
	choosing to live there. The harsh storms and weather, coupled with swimming as the most common leisure activity, toughens most who spend there lives here."

	restricted_to_species = list(FORM_AKULA, FORM_HUMAN, FORM_EXALT_HUMAN, FORM_MARQUA, FORM_SABLEKYNE)

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
	desc = "The mar'qua homeworlds are a massive collection of varied star systems controlled by the mar'qua empire and its allies within the Solarian Federation. While the mar'qua homeworlds are \
	largely self sufficient they follow a strict caste system and each world is largely similar to one another. Concepts of family, friendship, and leisure time are foreign ideas to  \
	worlds controlled by the mar'qua empire and people growing up here may be relocated by the government to new areas or even new worlds far from family or friends at a moments notice. \
	Mar'qua are practical above all else and as such employ the use of humans and cindarites greatly for their broader skills, allowing them to live within their borders, yet they refuse \
	citizenship to any other race. Life in the homeworlds is one of monotony, but such living enhances the intelligence of denizens as toil and reassignment happen often enough to \
	broaden your skill sets."

	restricted_to_species = list(FORM_MARQUA, FORM_HUMAN, FORM_EXALT_HUMAN, FORM_CINDAR)

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
	desc = "The Wanderer's Armada is a group of nearly a hundred repurposed ships, ranging from small corvettes to the largest Dreadnought that began the Armada. While the size of this fleet \
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
	desc = "The world of Norian is home to the physically powerful race of the Naramadi. The naramad live amongst the ruins of another civilization long forgotten with the passage of time \
	who's only remaining mark on the world is many dangerous ruins dotting the landscape. Many areas of Norian remain largely pristine and often treated as sacred locations by the local \
	naramad tribes who often plunder the location at great risk for what they consider worthwhile rewards. Norian does boast a decent human, abhuman, and sablekyne population as those races of \
	the Solarian Federation are uniquely capable of adapting to the harsh world. Unfortunately Norian has next to nothing in the way of proper education, even among the Solarian planetary defense forces. \
	People from this planet tend to be the hardiest of individuals, but just as often they prove to be dull and lacking in attention to detail."

	restricted_to_species = list(FORM_NARAMAD, FORM_HUMAN, FORM_EXALT_HUMAN, FORM_SABLEKYNE, FORM_AKULA)

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
	and rarely stay in one place for long as they make prey of enemies of the Solarian Federation, pirates, or unaligned colonies just trying to make a living. Due to the opifex superiority  \
	complexes they absolutely and resolutely refuse to allow anyone besides their own kind and synthetic life forms to even visit the various fleets they call home. Opifex fleets are strangely  \
	lawful places despite their subsistence largely based upon raiding and every opifex is trained on maintaining their various ships and robots."

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
	desc = "The homeworld of the cindarite, creatively named Cindar, is a hostile death world of radiation and heat where the inhabitants live deep underground in fortified rad proofed bunkers. \
	Cindar is a place that few can survive, even the more toxin adapted Kriosan would perish after a few years. As such only the Cindarites call this place home. \
	Life in the underground bunkers left little time for  much physical activity but leisure time spent studying, reading, or maintaining your home has give you a broad set of skills. \
	The occasional dose of light radiation has also helped improve your toughness a small bit, so maybe Cindar isn't that bad."

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
	desc = "Krios is a land steeped in conflict in the last few decades with the arrival of the Solarian Federation and a subsequent rebellion after the bluespace crash. \
	Krios is now formerly owned by itself, having opportunistically thrown off Solarian rule, though much of their society is left scarred by the conflict and citizens now spend more time \
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

/datum/category_item/setup_option/background/homeworld/lost_world
	name = "The Forgotten Empire"
	desc = "Thought by some to be less a literal time, place and culture and more so a personal ideal. The Aulvae often speak in flowery prose of the past from which they come. \
	Contradictory stories and vaguery have left many to wonder if it is not simply a collective coping mechanism as the Aulvae can recall precious little else from their past. \
	None may deny that in spite of their peculiarities the Aulvae are a skilled and capable people in spite of their malleable disposition and naivete"

	restricted_to_species = list(FORM_SLIME)
	allow_modifications = FALSE

	stat_modifiers = list(
		STAT_ROB = 4,
		STAT_TGH = 4,
		STAT_VIG = 4,
		STAT_BIO = 4,
		STAT_MEC = 4,
		STAT_COG = 4
	)
