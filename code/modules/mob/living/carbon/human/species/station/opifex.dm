
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
	blurb = "no."
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