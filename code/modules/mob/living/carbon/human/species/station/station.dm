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
	worlds tumultuous at best in the far flung galactic rim."
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

	perks = list(/datum/perk/tenacity, /datum/perk/iwillsurvive, /datum/perk/slymarbo)

	spawn_flags = CAN_JOIN

/datum/species/human/get_bodytype()
	return "Human"

/datum/species/sablekyne
	name = "Sablekyne"
	name_plural = "Sablekynes"
	default_form = FORM_SABLEKYNE
	obligate_form = TRUE
	reagent_tag = IS_CARNIVORE
	unarmed_types = list(/datum/unarmed_attack/claws/strong, /datum/unarmed_attack/punch, /datum/unarmed_attack/stomp,  /datum/unarmed_attack/kick, /datum/unarmed_attack/bite/strong, /datum/unarmed_attack/horns)
	darksight = 8
	num_alternate_languages = 2
	name_language = null
	min_age = 18
	max_age = 110
	blurb = "The Sablekyne are a mammalian alien species vaguely resembling felines with horns, hailing from Onkarth in the Gamma Minoris system. \
	Sablekyne were originally uplifted by the aid of human colonization and human corporations, aiding them by \
	accelerating the fledgling culture into the interstellar age. Their history is full of war and highly fractious \
	ethnicities, something that permeates even to today's times. Northlander sablekyne perfer colder winter environments and speak with Gaelic influences while \
	southlanders prefer hot dry deserts and speak with Japanese influences. Both groups are stocky, strong, and thickly built and few have the lithe feline qualities \
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

	perks = list(/datum/perk/laststand,/datum/perk/bone, /datum/perk/brawn)

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

	perks = list(/datum/perk/suddenbrilliance,/datum/perk/inspired, /datum/perk/alien_nerves)

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

	perks = list(/datum/perk/enhancedsenses, /datum/perk/exceptional_aim)

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
	hunger_factor = DEFAULT_HUNGER_FACTOR * 1.25

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

	perks = list(/datum/perk/recklessfrenzy, /datum/perk/iron_flesh)

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

	perks = list(/datum/perk/adrenalineburst,/datum/perk/born_warrior, /datum/perk/stay_hydrated)

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

	perks = list(/datum/perk/opifex_turret,/datum/perk/opifex_patchkit)

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
		"Moth Wings, Plain",
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

	has_process = list(    // which required-organ checks are conducted.
		OP_HEART =    /obj/item/organ/internal/heart,
		OP_LUNGS =    /obj/item/organ/internal/lungs,
		OP_STOMACH =  /obj/item/organ/internal/stomach,
		OP_LIVER =    /obj/item/organ/internal/liver,
		OP_KIDNEY_LEFT =  /obj/item/organ/internal/kidney/left/cindarite,
		OP_KIDNEY_RIGHT = /obj/item/organ/internal/kidney/right/cindarite,
		BP_BRAIN =    /obj/item/organ/internal/brain,
		OP_APPENDIX = /obj/item/organ/internal/appendix,
		OP_EYES =     /obj/item/organ/internal/eyes
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
	permitted_wings = list("Spines,Aquatic",
		"Spines, Long",
		"Spines, Long Membrane",
		"Spines, Short",
		"Spines, Short Membrane",
		)

	perks = list(/datum/perk/purgetoxins,/datum/perk/purgeinfections, /datum/perk/second_skin)

/datum/species/cindarite/get_bodytype()
	return "Cindarite"

/datum/species/soteria_synthetic
	name = "Soteria Synthetic"
	name_plural = "synthetics"
	default_form = FORM_SOTSYNTH
	obligate_name = TRUE
	obligate_form = TRUE
	unarmed_types = list(/datum/unarmed_attack/punch, /datum/unarmed_attack/stomp,  /datum/unarmed_attack/kick, /datum/unarmed_attack/bite)
	blurb = "How did you find this? Report this to Kazkin if you're reading it."
	num_alternate_languages = 3
	name_language = null // Use the first-name last-name generator rather than a language scrambler
	min_age = 18
	max_age = 110
	siemens_coefficient = 2
	reagent_tag = IS_SYNTHETIC
	hunger_factor = 0
	flags = NO_BREATHE | NO_PAIN | NO_BLOOD | NO_SCAN | NO_POISON | NO_MINOR_CUT
	slowdown = 0.3
	radiation_mod = 0
	virus_immune = TRUE
	breath_type = null
	poison_type = null

	dark_color = "#ffffff"
	light_color = "#000000"

	has_limbs = list(
		BP_CHEST =  new /datum/organ_description/chest/soteria_synthetic,
		BP_GROIN =  new /datum/organ_description/groin/soteria_synthetic,
		BP_HEAD =   new /datum/organ_description/head/soteria_synthetic,
		BP_L_ARM =  new /datum/organ_description/arm/left/soteria_synthetic,
		BP_R_ARM =  new /datum/organ_description/arm/right/soteria_synthetic,
		BP_L_LEG =  new /datum/organ_description/leg/left/soteria_synthetic,
		BP_R_LEG =  new /datum/organ_description/leg/right/soteria_synthetic
		)

	has_process = list(    // which required-process checks are conducted and defalut organs for them.
		OP_HEART = /obj/item/organ/internal/cell,
		BP_BRAIN = /obj/item/organ/internal/brain/synthetic,
		OP_EYES = /obj/item/organ/internal/eyes/prosthetic
		)

	heat_discomfort_strings = list(
		"System analysis reports higher than normal heat levels.",
		"System analysis reports rising tempatures!",
		"System analysis reports dangerous levels of heat!."
		)
	cold_discomfort_strings = list(
		"System analysis reports lower than normal tempature.",
		"System analysis reports rapidly decreasing tempatures!",
		"System analysis reports dangerous levels of cold!."
		)

	stat_modifiers = list(
		STAT_COG = 5,
		STAT_MEC = 5
	)

	spawn_flags = CAN_JOIN

/datum/species/soteria_synthetic/get_bodytype()
	return "Synthetic"

/datum/species/artificer_guild_synthetic
	name = "Artificer Guild Synthetic"
	name_plural = "synthetics"
	default_form = FORM_AGSYNTH
	obligate_name = TRUE
	obligate_form = TRUE
	unarmed_types = list(/datum/unarmed_attack/punch, /datum/unarmed_attack/stomp,  /datum/unarmed_attack/kick, /datum/unarmed_attack/bite)
	blurb = "How did you find this? Report this to Kazkin if you're reading it."
	num_alternate_languages = 3
	name_language = null // Use the first-name last-name generator rather than a language scrambler
	min_age = 18
	max_age = 110
	siemens_coefficient = 0
	reagent_tag = IS_SYNTHETIC
	hunger_factor = 0
	flags = NO_BREATHE | NO_PAIN | NO_BLOOD | NO_SCAN | NO_POISON | NO_MINOR_CUT
	radiation_mod = 0
	virus_immune = TRUE
	breath_type = null
	poison_type = null

	dark_color = "#FA8128"
	light_color = "#FCAE1E"

	has_limbs = list(
		BP_CHEST =  new /datum/organ_description/chest/artificer_guild_synthetic,
		BP_GROIN =  new /datum/organ_description/groin/artificer_guild_synthetic,
		BP_HEAD =   new /datum/organ_description/head/artificer_guild_synthetic,
		BP_L_ARM =  new /datum/organ_description/arm/left/artificer_guild_synthetic,
		BP_R_ARM =  new /datum/organ_description/arm/right/artificer_guild_synthetic,
		BP_L_LEG =  new /datum/organ_description/leg/left/artificer_guild_synthetic,
		BP_R_LEG =  new /datum/organ_description/leg/right/artificer_guild_synthetic
		)

	has_process = list(    // which required-process checks are conducted and defalut organs for them.
		OP_HEART = /obj/item/organ/internal/cell,
		BP_BRAIN = /obj/item/organ/internal/brain/synthetic,
		OP_EYES = /obj/item/organ/internal/eyes/prosthetic
		)

	heat_discomfort_strings = list(
		"System analysis reports higher than normal heat levels.",
		"System analysis reports rising tempatures!",
		"System analysis reports dangerous levels of heat!."
		)
	cold_discomfort_strings = list(
		"System analysis reports lower than normal tempature.",
		"System analysis reports rapidly decreasing tempatures!",
		"System analysis reports dangerous levels of cold!."
		)

	stat_modifiers = list(
		STAT_MEC = 10
	)

	spawn_flags = CAN_JOIN

/datum/species/artificer_guild_synthetic/get_bodytype()
	return "Synthetic"

/datum/species/blackshield_synthetic
	name = "Blackshield Synthetic"
	name_plural = "synthetics"
	default_form = FORM_BSSYNTH
	obligate_name = TRUE
	obligate_form = TRUE
	unarmed_types = list(/datum/unarmed_attack/punch, /datum/unarmed_attack/stomp,  /datum/unarmed_attack/kick, /datum/unarmed_attack/bite)
	blurb = "How did you find this? Report this to Kazkin if you're reading it."
	num_alternate_languages = 3
	name_language = null // Use the first-name last-name generator rather than a language scrambler
	min_age = 18
	max_age = 110
	reagent_tag = IS_SYNTHETIC
	hunger_factor = 0
	flags = NO_BREATHE | NO_PAIN | NO_BLOOD | NO_SCAN | NO_POISON | NO_MINOR_CUT
	radiation_mod = 0
	virus_immune = TRUE
	breath_type = null
	poison_type = null

	dark_color = "#FFFFFF"
	light_color = "#000000"

	has_limbs = list(
		BP_CHEST =  new /datum/organ_description/chest/blackshield_synthetic,
		BP_GROIN =  new /datum/organ_description/groin/blackshield_synthetic,
		BP_HEAD =   new /datum/organ_description/head/blackshield_synthetic,
		BP_L_ARM =  new /datum/organ_description/arm/left/blackshield_synthetic,
		BP_R_ARM =  new /datum/organ_description/arm/right/blackshield_synthetic,
		BP_L_LEG =  new /datum/organ_description/leg/left/blackshield_synthetic,
		BP_R_LEG =  new /datum/organ_description/leg/right/blackshield_synthetic
		)

	has_process = list(    // which required-process checks are conducted and defalut organs for them.
		OP_HEART = /obj/item/organ/internal/cell,
		BP_BRAIN = /obj/item/organ/internal/brain/synthetic,
		OP_EYES = /obj/item/organ/internal/eyes/prosthetic
		)

	heat_discomfort_strings = list(
		"System analysis reports higher than normal heat levels.",
		"System analysis reports rising tempatures!",
		"System analysis reports dangerous levels of heat!."
		)
	cold_discomfort_strings = list(
		"System analysis reports lower than normal tempature.",
		"System analysis reports rapidly decreasing tempatures!",
		"System analysis reports dangerous levels of cold!."
		)

	stat_modifiers = list(
		STAT_TGH = 10
	)

	spawn_flags = CAN_JOIN

/datum/species/blackshield_synthetic/get_bodytype()
	return "Synthetic"

/datum/species/church_synthetic
	name = "Absolute Synthetic"
	name_plural = "synthetics"
	default_form = FORM_CHURCHSYNTH
	obligate_name = TRUE
	obligate_form = TRUE
	unarmed_types = list(/datum/unarmed_attack/punch, /datum/unarmed_attack/stomp,  /datum/unarmed_attack/kick, /datum/unarmed_attack/bite)
	blurb = "How did you find this? Report this to Kazkin if you're reading it."
	num_alternate_languages = 3
	name_language = null // Use the first-name last-name generator rather than a language scrambler
	min_age = 18
	max_age = 110
	reagent_tag = IS_SYNTHETIC
	hunger_factor = 0
	flags = NO_BREATHE | NO_PAIN | NO_BLOOD | NO_SCAN | NO_POISON | NO_MINOR_CUT
	radiation_mod = 0
	virus_immune = TRUE
	breath_type = null
	poison_type = null

	dark_color = "#FFFFFF"
	light_color = "#000000"

	has_limbs = list(
		BP_CHEST =  new /datum/organ_description/chest/church_synthetic,
		BP_GROIN =  new /datum/organ_description/groin/church_synthetic,
		BP_HEAD =   new /datum/organ_description/head/church_synthetic,
		BP_L_ARM =  new /datum/organ_description/arm/left/church_synthetic,
		BP_R_ARM =  new /datum/organ_description/arm/right/church_synthetic,
		BP_L_LEG =  new /datum/organ_description/leg/left/church_synthetic,
		BP_R_LEG =  new /datum/organ_description/leg/right/church_synthetic
		)

	has_process = list(    // which required-process checks are conducted and defalut organs for them.
		OP_HEART = /obj/item/organ/internal/cell,
		BP_BRAIN = /obj/item/organ/internal/brain/synthetic,
		OP_EYES = /obj/item/organ/internal/eyes/prosthetic
		)

	heat_discomfort_strings = list(
		"System analysis reports higher than normal heat levels.",
		"System analysis reports rising tempatures!",
		"System analysis reports dangerous levels of heat!."
		)
	cold_discomfort_strings = list(
		"System analysis reports lower than normal tempature.",
		"System analysis reports rapidly decreasing tempatures!",
		"System analysis reports dangerous levels of cold!."
		)

	stat_modifiers = list(
		STAT_BIO = 10
	)

	spawn_flags = CAN_JOIN

/datum/species/church_synthetic/get_bodytype()
	return "Synthetic"

/datum/species/nashef_synthetic
	name = "Nashef-Agunabi"
	name_plural = "synthetics"
	default_form = FORM_NASHEF
	obligate_name = TRUE
	obligate_form = TRUE
	unarmed_types = list(/datum/unarmed_attack/punch, /datum/unarmed_attack/stomp,  /datum/unarmed_attack/kick, /datum/unarmed_attack/bite)
	blurb = "How did you find this? Report this to Kazkin if you're reading it."
	num_alternate_languages = 3
	name_language = null // Use the first-name last-name generator rather than a language scrambler
	min_age = 18
	max_age = 110
	reagent_tag = IS_SYNTHETIC
	hunger_factor = 0
	flags = NO_BREATHE | NO_PAIN | NO_BLOOD | NO_SCAN | NO_POISON | NO_MINOR_CUT
	radiation_mod = 0
	virus_immune = TRUE
	breath_type = null
	poison_type = null

	dark_color = "#FFFFFF"
	light_color = "#000000"

	has_limbs = list(
		BP_CHEST =  new /datum/organ_description/chest/nashef_synthetic,
		BP_GROIN =  new /datum/organ_description/groin/nashef_synthetic,
		BP_HEAD =   new /datum/organ_description/head/nashef_synthetic,
		BP_L_ARM =  new /datum/organ_description/arm/left/nashef_synthetic,
		BP_R_ARM =  new /datum/organ_description/arm/right/nashef_synthetic,
		BP_L_LEG =  new /datum/organ_description/leg/left/nashef_synthetic,
		BP_R_LEG =  new /datum/organ_description/leg/right/nashef_synthetic
		)

	has_process = list(    // which required-process checks are conducted and defalut organs for them.
		OP_HEART = /obj/item/organ/internal/cell,
		BP_BRAIN = /obj/item/organ/internal/brain/synthetic,
		OP_EYES = /obj/item/organ/internal/eyes/prosthetic
		)

	heat_discomfort_strings = list(
		"System analysis reports higher than normal heat levels.",
		"System analysis reports rising tempatures!",
		"System analysis reports dangerous levels of heat!."
		)
	cold_discomfort_strings = list(
		"System analysis reports lower than normal tempature.",
		"System analysis reports rapidly decreasing tempatures!",
		"System analysis reports dangerous levels of cold!."
		)

	stat_modifiers = list(
		STAT_BIO = 10
	)

	spawn_flags = IS_RESTRICTED

/*
/datum/species/full_body_prosthetic
	name = "Full Body Prosthetic"
	default_form = FORM_FBP
	name_plural = "FBPs"
	unarmed_types = list(/datum/unarmed_attack/punch, /datum/unarmed_attack/stomp,  /datum/unarmed_attack/kick, /datum/unarmed_attack/bite)
	blurb = "How did you find this? Report this to Kazkin if you're reading it."
	reagent_tag = IS_SYNTHETIC
	hunger_factor = 0
	flags = NO_BREATHE | NO_PAIN | NO_BLOOD | NO_SCAN | NO_POISON | NO_MINOR_CUT
	radiation_mod = 0
	virus_immune = TRUE

	has_limbs = list(
		BP_CHEST =  new /datum/organ_description/chest/full_body_prosthetic,
		BP_GROIN =  new /datum/organ_description/groin/full_body_prosthetic,
		BP_HEAD =   new /datum/organ_description/head/full_body_prosthetic,
		BP_L_ARM =  new /datum/organ_description/arm/left/full_body_prosthetic,
		BP_R_ARM =  new /datum/organ_description/arm/right/full_body_prosthetic,
		BP_L_LEG =  new /datum/organ_description/leg/left/full_body_prosthetic,
		BP_R_LEG =  new /datum/organ_description/leg/right/full_body_prosthetic
		)

	has_process = list(    // which required-process checks are conducted and defalut organs for them.
		OP_HEART = /obj/item/organ/internal/cell,
		BP_BRAIN = /obj/item/organ/internal/brain/synthetic,
		OP_EYES = /obj/item/organ/internal/eyes/prosthetic
		)

	heat_discomfort_strings = list(
		"System analysis reports higher than normal heat levels.",
		"System analysis reports rising tempatures!",
		"System analysis reports dangerous levels of heat!."
		)
	cold_discomfort_strings = list(
		"System analysis reports lower than normal tempature.",
		"System analysis reports rapidly decreasing tempatures!",
		"System analysis reports dangerous levels of cold!."
		)

	stat_modifiers = list(
		STAT_BIO = 2,
		STAT_COG = 2,
		STAT_MEC = 2,
		STAT_ROB = 2,
		STAT_TGH = 2,
		STAT_VIG = 2
	)

	spawn_flags = CAN_JOIN

/datum/species/full_body_prosthetic/get_bodytype()
	return "FBP"
*/

/datum/species/folken
	name = "Folken"
	name_plural = "Folkens"
	default_form = FORM_FOLKEN
	obligate_name = TRUE
	obligate_form = TRUE
	unarmed_types = list(/datum/unarmed_attack/punch, /datum/unarmed_attack/stomp,  /datum/unarmed_attack/kick, /datum/unarmed_attack/bite)
	blurb = "N/A"
	num_alternate_languages = 2
	name_language = null	// Use the first-name last-name generator rather than a language scrambler
	min_age = 18
	max_age = 110
	breath_type = "nitrogen"			// Non-oxygen gas breathed, if any.
	poison_type = "plasma"				// Poisonous air.
	exhale_type = "oxygen"
	burn_mod = 2						// Burn damage multiplier.
	light_dam = 1 // Same threshold as the Nightcrawler perk
	vision_flags = SEE_SELF
	flags = NO_PAIN

	dark_color = "#ffffff"
	light_color = "#000000"

	has_process = list(    // which required-organ checks are conducted.
		OP_HEART =    /obj/item/organ/internal/heart,
		OP_STOMACH =  /obj/item/organ/internal/stomach,
		OP_LIVER =    /obj/item/organ/internal/liver,
		OP_KIDNEY_LEFT =  /obj/item/organ/internal/kidney/left,
		OP_KIDNEY_RIGHT = /obj/item/organ/internal/kidney/right,
		BP_BRAIN =    /obj/item/organ/internal/brain,
		OP_APPENDIX = /obj/item/organ/internal/appendix,
		OP_EYES =     /obj/item/organ/internal/eyes
		)

	stat_modifiers = list(
		STAT_BIO = 10,
		STAT_COG = 0,
		STAT_MEC = 0,
		STAT_ROB = 0,
		STAT_TGH = 0,
		STAT_VIG = 10
	)

	perks = list()

	spawn_flags = IS_RESTRICTED

/datum/species/folken/get_bodytype()
	return "Folken"

/datum/species/mycus
	name = "Mycus"
	name_plural = "Myci"
	default_form = FORM_MYCUS
	obligate_name = TRUE
	obligate_form = TRUE
	unarmed_types = list(/datum/unarmed_attack/punch, /datum/unarmed_attack/stomp,  /datum/unarmed_attack/kick, /datum/unarmed_attack/bite)
	blurb = "N/A"
	num_alternate_languages = 2
	name_language = null	// Use the first-name last-name generator rather than a language scrambler
	min_age = 18
	max_age = 110

	burn_mod = 2						// Burn damage multiplier.
	light_dam = 1 // Same threshold as the Nightcrawler perk

	dark_color = "#ffffff"
	light_color = "#000000"

	perks = list(PERK_DARK_HEAL)

	stat_modifiers = list(
		STAT_BIO = 0,
		STAT_COG = 0,
		STAT_MEC = 0,
		STAT_ROB = 20,
		STAT_TGH = 0,
		STAT_VIG = 0
	)

	spawn_flags = IS_RESTRICTED

/datum/species/mycus/get_bodytype()
	return "Mycus"
