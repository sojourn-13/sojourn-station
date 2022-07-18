
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
	blurb = "no."
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