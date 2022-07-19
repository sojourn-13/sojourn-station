
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
	blurb = "no."
	taste_sensitivity = TASTE_HYPERSENSITIVE
	hunger_factor = DEFAULT_HUNGER_FACTOR * 1.25
	radiation_mod = 0.5
	total_health = 150
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
		"Wolf Tail",
		"Jackal Tail"
		)
	permitted_wings = list()

	perks = list(/datum/perk/enhancedsenses, /datum/perk/exceptional_aim)

/datum/species/kriosan/get_bodytype()
	return "Kriosan"