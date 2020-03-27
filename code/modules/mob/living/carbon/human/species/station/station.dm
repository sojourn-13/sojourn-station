/datum/species/human
	name = "Human"
	name_plural = "Humans"
	default_form = FORM_HUMAN
	unarmed_types = list(/datum/unarmed_attack/stomp, /datum/unarmed_attack/punch, /datum/unarmed_attack/kick, /datum/unarmed_attack/bite)
	blurb = "Humanity originated in the Sol system, and over the last five centuries has spread \
	colonies across a wide swathe of space. They hold a wide range of forms and creeds.<br/><br/> \
	While the central Sol Federation maintains control of much of the known star space \
	interests, rampant cyber and bio-augmentation and secretive factions make life on most human \
	worlds tumultous at best in the far flung galactic rim."
	num_alternate_languages = 2
	name_language = null // Use the first-name last-name generator rather than a language scrambler
	min_age = 18
	max_age = 110

	spawn_flags = CAN_JOIN

/datum/species/human/get_bodytype()
	return "Human"


// To Do: Get it to boot these qualities when selected, basically you can't spawn as these yet, add the +5 TGH/ROB and
// add in the custom racial perk.
/datum/species/sablekyne
	name = "Sablekyne"
	name_plural = "Sablekynes"
	default_form = FORM_SABLEKYNE
	obligate_form = TRUE
	unarmed_types = list(/datum/unarmed_attack/stomp, /datum/unarmed_attack/claws/strong, /datum/unarmed_attack/kick, /datum/unarmed_attack/bite/sharp)
	darksight = 8
	num_alternate_languages = 2
	name_language = null
	min_age = 18
	max_age = 110
	blurb = "The Sablekyne are a mammalian abhuman species resembling roughly felines, hailing from Onkarth in the Gamma Minoris system. \
	Sablekyne were originally uplifted by the aid of human colonization and human corporations, aiding them by \
	accelerating the fledgling culture into the interstellar age. Their history is full of war and highly fractious \
	ethnicities, something that permeates even to today's times. Northlander sablekyne perfer colder winter enviroments while \
	southlanders prefer hot dry areas. Both groups are stocky, strong, and thickly built and few have the lithe feline qualities \
	one would expect."

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

/datum/species/sablekyne/get_bodytype()
	return FORM_SABLEKYNE
