/datum/species/human
	name = "Human"
	name_plural = "Humans"
	default_form = FORM_HUMAN
	obligate_name = FALSE
	unarmed_types = list(/datum/unarmed_attack/punch, /datum/unarmed_attack/stomp,  /datum/unarmed_attack/kick, /datum/unarmed_attack/bite)
	blurb = "Humanity originated in the Sol system, and over the last five centuries has spread \
	colonies across a wide swathe of space. They hold a wide range of forms and creeds.<br/><br/> \
	While the central Sol Federation maintains control of much of the known star space \
	interests, rampant cyber and bio-augmentation and secretive factions make life on most human \
	worlds tumultous at best in the far flung galactic rim."
	num_alternate_languages = 2
	name_language = null // Use the first-name last-name generator rather than a language scrambler
	min_age = 18
	max_age = 110

	dark_color = "#ffffff"
	light_color = "#000000"

	stat_modifiers = list(
		STAT_BIO = 2,
		STAT_COG = 2,
		STAT_MEC = 2,
		STAT_ROB = 2,
		STAT_TGH = 2,
		STAT_VIG = 2
	)


	perks = list(/datum/perk/tenacity, /datum/perk/gutsandglory)

	spawn_flags = CAN_JOIN

/datum/species/human/get_bodytype()
	return "Human"

/datum/species/sablekyne
	name = "Sablekyne"
	name_plural = "Sablekynes"
	default_form = FORM_SABLEKYNE
	obligate_form = TRUE
	reagent_tag = IS_SABLEKYNE
	unarmed_types = list(/datum/unarmed_attack/claws/strong, /datum/unarmed_attack/punch, /datum/unarmed_attack/stomp,  /datum/unarmed_attack/kick, /datum/unarmed_attack/bite/strong, /datum/unarmed_attack/horns)
	darksight = 8
	num_alternate_languages = 2
	name_language = null
	min_age = 18
	max_age = 110
	blurb = "The Sablekyne are a mammalian alien species vaguely resembling felines with horns, hailing from Onkarth in the Gamma Minoris system. \
	Sablekyne were originally uplifted by the aid of human colonization and human corporations, aiding them by \
	accelerating the fledgling culture into the interstellar age. Their history is full of war and highly fractious \
	ethnicities, something that permeates even to today's times. Northlander sablekyne perfer colder winter enviroments and speak with gaelic influences while \
	southlanders prefer hot dry deserts and speak with japanese influences. Both groups are stocky, strong, and thickly built and few have the lithe feline qualities \
	one would expect."
	taste_sensitivity = TASTE_SENSITIVE                 // How sensitive the species is to minute tastes.

	dark_color = "#00ff00"
	light_color = "#008000"

	cold_level_1 = 200 //Default 260
	cold_level_2 = 140 //Default 200
	cold_level_3 = 80  //Default 120

	heat_level_1 = 420 //Default 360
	heat_level_2 = 460 //Default 400
	heat_level_3 = 1200 //Default 1000

	heat_discomfort_level = 340
	heat_discomfort_strings = list(
		"Your fur prickles in the heat.",
		"You feel uncomfortably warm.",
		"Your overheated skin itches."
		)

	cold_discomfort_level = 275
	list/cold_discomfort_strings = list(
		"You feel chilly.",
		"You shiver suddenly.",
		"Your chilly flesh stands out in goosebumps."
		)
	spawn_flags = CAN_JOIN

	stat_modifiers = list(
		STAT_ROB = 5,
		STAT_TGH = 5
	)

	permitted_ears  = list("Sablekyne Large Horns",
		"Sablekyne Curled Horns",
		"Sablekyne Curled Horns (small)",
		"Sablekyne Small Horns 1",
		"Sablekyne Small Horns 2",
		"Sablekyne Small Horns 3"
		)
	permitted_tail  = list("Sablekyne Tail")
	permitted_wings = list()

	perks = list(/datum/perk/laststand,/datum/perk/bone)

/datum/species/sablekyne/get_bodytype()
	return "Sablekyne"

/datum/species/marqua
	name = "Mar'Qua"
	name_plural = "Mar'quas"
	default_form = FORM_MARQUA
	obligate_form = TRUE
	unarmed_types = list(/datum/unarmed_attack/punch, /datum/unarmed_attack/stomp,  /datum/unarmed_attack/kick)
	darksight = 4
	num_alternate_languages = 2
	name_language = null
	min_age = 18
	max_age = 160
	blurb = "How did you find this? Report this to Kazkin if you're reading it."
	hunger_factor = DEFAULT_HUNGER_FACTOR/2
	taste_sensitivity = TASTE_HYPERSENSITIVE

	dark_color = "#afeeee"
	light_color = "#20b2aa"

	cold_level_1 = 140 //Default 260
	cold_level_2 = 80 //Default 200
	cold_level_3 = 20  //Default 120

	cold_discomfort_level = 200
	list/cold_discomfort_strings = list(
		"You feel chilly.",
		"You shiver suddenly.",
		"Your chilly flesh stands out in goosebumps."
		)
	spawn_flags = CAN_JOIN

	stat_modifiers = list(
		STAT_BIO = 10,
		STAT_COG = 10,
		STAT_MEC = 10
	)

	permitted_ears  = list()
	permitted_tail  = list()
	permitted_wings = list()

	perks = list(/datum/perk/suddenbrilliance,/datum/perk/inspired)

/datum/species/marqua/get_bodytype()
	return "Mar'Qua"

/datum/species/kriosan
	name = "Kriosan"
	name_plural = "Kriosans"
	default_form = FORM_KRIOSAN
	obligate_form = TRUE
	unarmed_types = list(/datum/unarmed_attack/needle, /datum/unarmed_attack/punch, /datum/unarmed_attack/stomp,  /datum/unarmed_attack/kick, /datum/unarmed_attack/bite)
	darksight = 8
	num_alternate_languages = 2
	name_language = null
	min_age = 18
	max_age = 110
	blurb = "How did you find this? Report this to Kazkin if you're reading it."
	taste_sensitivity = TASTE_HYPERSENSITIVE
	hunger_factor = DEFAULT_HUNGER_FACTOR * 1.25
	radiation_mod = 0.5
	toxins_mod = 0.75
	brute_mod = 0.75
	siemens_coefficient = 2

	dark_color = "#ff0000"
	light_color = "#990000"

	spawn_flags = CAN_JOIN

	stat_modifiers = list(
		STAT_TGH = 5,
		STAT_VIG = 5
	)

	permitted_ears  = list("Fennec Ears",
		"Fox Ears",
		"Hound Ears",
		"Jagged Ears",
		"Kitsune Ears",
		"Doberman Ears",
		"Sleek Ears",
		"Vulpkanin Ears",
		"Wolf Ears"
		)
	permitted_tail  = list("Cross Fox Tail",
		"Curly Tail",
		"Docked Tail",
		"Fennec Tail, Downwards",
		"Fennec Tail, Upwards",
		"Fennecsune Tails",
		"Fennix Tail",
		"Fox Tail, Downwards",
		"Fox Tail, Upwards",
		"Otie Tail",
		"Vulpkanin Tail",
		"Vulpkanin Tail 2",
		"Vulpkanin Tail 3",
		"Wolf Tail"
		)
	permitted_wings = list()

	perks = list(/datum/perk/enhancedsenses)

/datum/species/kriosan/get_bodytype()
	return "Kriosan"

/datum/species/akula
	name = "Akula"
	name_plural = "Akulas"
	default_form = FORM_AKULA
	obligate_form = TRUE
	unarmed_types = list(/datum/unarmed_attack/punch, /datum/unarmed_attack/stomp,  /datum/unarmed_attack/kick, /datum/unarmed_attack/tail, /datum/unarmed_attack/bite/strong)
	darksight = 4
	num_alternate_languages = 2
	name_language = null
	min_age = 18
	max_age = 130
	blurb = "How did you find this? Report this to Kazkin if you're reading it."
	taste_sensitivity = TASTE_DULL
	hunger_factor = DEFAULT_HUNGER_FACTOR*1.25

	cold_level_1 = 200 //Default 260
	cold_level_2 = 140 //Default 200
	cold_level_3 = 80  //Default 120

	cold_discomfort_level = 200
	list/cold_discomfort_strings = list(
		"You feel chilly.",
		"You shiver suddenly.",
		"Your chilly flesh stands out in goosebumps."
		)
	spawn_flags = CAN_JOIN

	dark_color = "#0000ff"
	light_color = "#0000ff"

	stat_modifiers = list(
		STAT_TGH = 10
	)

	permitted_ears  = list("Sleek Ears")
	permitted_tail  = list("Akula Tail")
	permitted_wings = list()

	perks = list(/datum/perk/recklessfrenzy)

/datum/species/akula/get_bodytype()
	return "Akula"

/datum/species/naramad
	name = "Naramad"
	name_plural = "Naramadi"
	default_form = FORM_NARAMAD
	obligate_form = TRUE
	unarmed_types = list(/datum/unarmed_attack/claws/strong, /datum/unarmed_attack/punch, /datum/unarmed_attack/stomp,  /datum/unarmed_attack/kick, /datum/unarmed_attack/bite/strong, /datum/unarmed_attack/tail)
	num_alternate_languages = 0
	name_language = null
	min_age = 18
	max_age = 60
	slowdown = -0.5
	blurb = "How did you find this? Report this to Kazkin if you're reading it."

	spawn_flags = CAN_JOIN

	stat_modifiers = list(
		STAT_TGH = 10,
		STAT_ROB = 10,
		STAT_VIG = -10,
		STAT_COG = -10
	)

	dark_color = "#ffff00"
	light_color = "#ffff00"

	permitted_ears  = list("Naramad Ears", "Sleek Ears")
	permitted_tail  = list("Naramad Tail", "Naramad Tail 2")
	permitted_wings = list()

	perks = list(/datum/perk/adrenalineburst,/datum/perk/born_warrior)

/datum/species/naramad/get_bodytype()
	return "Naramad"

/datum/species/vox
	name = "Opifex"
	name_plural = "Opifexi"
	default_form = FORM_OPIFEX
	obligate_form = TRUE
	reagent_tag = IS_OPIFEX
	unarmed_types = list(/datum/unarmed_attack/claws, /datum/unarmed_attack/punch, /datum/unarmed_attack/stomp,  /datum/unarmed_attack/kick, /datum/unarmed_attack/bite)
	num_alternate_languages = 2
	name_language = null
	min_age = 18
	max_age = 80
	blurb = "How did you find this? Report this to Kazkin if you're reading it."
	breath_type = "nitrogen"                        // Non-oxygen gas breathed, if any.
	poison_type = "oxygen"                        // Poisonous air.
	exhale_type = "carbon_dioxide"
	siemens_coefficient = 0.5
	spawn_flags = CAN_JOIN
	hunger_factor = DEFAULT_HUNGER_FACTOR/2

	stat_modifiers = list(
		STAT_MEC = 5,
		STAT_COG = 5
	)

	dark_color = "#dddddd"
	light_color = "#dddddd"

	permitted_ears  = list()
	permitted_tail  = list("Avian Wagtail", "Avian Fantail")
	permitted_wings = list("Harpy Wings",
		"Fantail Wings",
		"Feathered Wings, Small",
		"Feathered Wings, Medium",
		"Feathered Wings, Large"
		)

	perks = list(/datum/perk/opifex_backup,/datum/perk/opifex_turret,/datum/perk/opifex_patchkit)

/datum/species/vox/get_bodytype()
	return "Opifex"

/datum/species/chtmant
	name = "Cht'mant"
	name_plural = "Cht'mants"
	default_form = FORM_CHTMANT
	obligate_form = TRUE
	reagent_tag = IS_CHTMANT
	unarmed_types = list(/datum/unarmed_attack/punch, /datum/unarmed_attack/stomp,  /datum/unarmed_attack/kick, /datum/unarmed_attack/bite)
	num_alternate_languages = 2
	name_language = null
	min_age = 18
	max_age = 120
	blurb = "How did you find this? Report this to Kazkin if you're reading it."
	flags = NO_PAIN
	spawn_flags = CAN_JOIN
	taste_sensitivity = TASTE_HYPERSENSITIVE

	brute_mod =     1.25                    // Physical damage multiplier.
	burn_mod =      0.85                    // Burn damage multiplier.
	flash_mod =     3

	stat_modifiers = list(
		STAT_BIO = 5,
		STAT_COG = 5
	)

	dark_color = "#5ac18e"
	light_color = "#5ac18e"

	permitted_ears  = list("Bee Antennae",
		"Citheronia Antennae",
		"Curly Antennae"
		)
	permitted_tail  = list("Bug Abdomen",
		"Bug Abdomen, Bee Top",
		"Bug Abdomen, Bee Full",
		"Bug Abdomen, Underside",
		"Bug Abdomen, Firefly",
		"Large Bug Abdomen",
		"Large Bug Abdomen, Bee Top",
		"Large Bug Abdomen, Bee Full",
		"Large Bug Abdomen, Underside",
		"Large Bug Abdomen, Firefly",
		"Alternate Bug Abdomen",
		"Alternate Bug Abdomen, Bee Top",
		"Alternate Bug Abdomen, Bee Full",
		"Alternate Bug Abdomen, Underside",
		"Alternate Bug Abdomen, Firefly",
		"Alternate Bug Abdomen 2",
		"Alternate Bug Abdomen 2, Bee Top",
		"Alternate Bug Abdomen 2, Bee Full",
		"Alternate Bug Abdomen 2, Underside",
		"Alternate Bug Abdomen 2, Firefly",
		"Alternate Large Bug Abdomen",
		"Alternate Large Bug Abdomen, Bee Top",
		"Alternate Large Bug Abdomen, Bee Full",
		"Alternate Large Bug Abdomen, Underside",
		"Alternate Large Bug Abdomen, Firefly",
		"Alternate Bug Abdomen 3",
		"Alternate Bug Abdomen 3, Bee Top",
		"Alternate Bug Abdomen 3, Bee Full",
		"Alternate Bug Abdomen 3, Underside",
		"Alternate Bug Abdomen 3, Firefly"
		)
	permitted_wings = list("Bee Wings",
		"Butterfly Wings",
		"Dragonfly Wings",
		"Moth Wings, Burned",
		"Moth Wings, Citheronia",
		"Moth Wings, Deathhead",
		"Moth Wings, Firewatch",
		"Moth Wings, Gothic",
		"Moth Wings, Lover",
		"Moth Wings, Monarch",
		"Moth Wings, Moonfly",
		"Moth Wings, Poison",
		"Moth Wings, Ragged",
		"Moth Wings, Red",
		"Moth Wings, Royal",
		"Moth Wings, Royal Unfluffed",
		"Moth Wings, Snowy",
		"Moth Wings, White",
		"Moth Wings, Worker",
		"Spider Legs"
		)

/datum/species/chtmant/get_bodytype()
	return "Cht'mant"

/datum/species/cindarite
	name = "Cindarite"
	name_plural = "Cindarites"
	default_form = FORM_CINDAR
	obligate_form = TRUE
	unarmed_types = list(/datum/unarmed_attack/punch, /datum/unarmed_attack/stomp,  /datum/unarmed_attack/kick, /datum/unarmed_attack/bite, /datum/unarmed_attack/tail)
	num_alternate_languages = 2
	name_language = null
	min_age = 18
	max_age = 90
	blurb = "How did you find this? Report this to Kazkin if you're reading it."
	spawn_flags = CAN_JOIN
	burn_mod = 0.85                    // Burn damage multiplier.
	radiation_mod = 0
	toxins_mod = 0.5

	stat_modifiers = list(
		STAT_BIO = 2,
		STAT_COG = 2,
		STAT_MEC = 2,
		STAT_TGH = 2
	)

	cold_level_1 = 280 //Default 260
	cold_level_2 = 220 //Default 200
	cold_level_3 = 140  //Default 120

	heat_level_1 = 450 //Default 360
	heat_level_2 = 520 //Default 400
	heat_level_3 = 1400 //Default 1000

	heat_discomfort_level = 400
	heat_discomfort_strings = list(
		"Your scales prickles in the heat.",
		"You feel uncomfortably warm.",
		"Your overheated scales itch."
		)

	dark_color = "#660066"
	light_color = "#660066"

	cold_discomfort_level = 300
	list/cold_discomfort_strings = list(
		"You feel chilly.",
		"You shiver suddenly.",
		"Your chilly scales stands out in goosebumps."
		)

	has_organ = list(    // which required-organ checks are conducted.
		BP_HEART =    /obj/item/organ/internal/heart,
		BP_LUNGS =    /obj/item/organ/internal/lungs,
		BP_LIVER =    /obj/item/organ/internal/liver,
		BP_KIDNEYS =  /obj/item/organ/internal/kidneys/quad,
		BP_BRAIN =    /obj/item/organ/internal/brain,
		BP_APPENDIX = /obj/item/organ/internal/appendix,
		BP_EYES =     /obj/item/organ/internal/eyes
		)

	permitted_ears  = list("Frills, Aquatic",
		"Frills, Drake",
		"Frills, Short",
		"Frills, Simple"
		)
	permitted_tail  = list("Render Tail",
		"Snake Tail",
		"Lizard Tail",
		"Lizard Tail, Short"
		)
	permitted_wings = list()

	perks = list(/datum/perk/purgetoxins,/datum/perk/purgeinfections)

/datum/species/cindarite/get_bodytype()
	return "Cindarite"