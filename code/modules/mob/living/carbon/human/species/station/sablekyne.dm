
/datum/species/sablekyne
	name = "Sablekyne"
	name_plural = "Sablekynes"
	default_form = FORM_SABLEKYNE
	obligate_form = TRUE
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

	cold_level_1 = 240 //Default 270
	cold_level_2 = 215 //Default 230
	cold_level_3 = 190  //Default 200

	heat_level_1 = 340 //Default 330
	heat_level_2 = 400 //Default 380
	heat_level_3 = 480 //Default 460

	heat_discomfort_level = 340
	heat_discomfort_strings = list(
		"Your fur prickles in the heat.",
		"You feel uncomfortably warm.",
		"Your overheated skin itches."
		)

	cold_discomfort_level = 240
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

	perks = list(/datum/perk/laststand,/datum/perk/bone, /datum/perk/brawn, /datum/perk/carnivore)

/datum/species/sablekyne/get_bodytype()
	return "Sablekyne"