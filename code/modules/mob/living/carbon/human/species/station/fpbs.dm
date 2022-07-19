
/datum/species/full_body_prosthetic
	name = "Full Body Prosthetic"
	default_form = FORM_FBP
	obligate_form = TRUE
	obligate_name = FALSE
	name_plural = "FBPs"
	unarmed_types = list(/datum/unarmed_attack/punch, /datum/unarmed_attack/stomp,  /datum/unarmed_attack/kick, /datum/unarmed_attack/bite)
	blurb = "no."
	reagent_tag = IS_SYNTHETIC
	hunger_factor = 0
	flags = NO_BREATHE | NO_PAIN | NO_BLOOD | NO_SCAN | NO_POISON | NO_MINOR_CUT
	radiation_mod = 0
	total_health = 75
	virus_immune = TRUE
	breath_type = null
	poison_type = null

	has_limbs = list(
		BP_CHEST =  new /datum/organ_description/chest/full_body_prosthetic,
		BP_GROIN =  new /datum/organ_description/groin/full_body_prosthetic,
		BP_HEAD =   new /datum/organ_description/head/full_body_prosthetic,
		BP_L_ARM =  new /datum/organ_description/arm/left/full_body_prosthetic/full,
		BP_R_ARM =  new /datum/organ_description/arm/right/full_body_prosthetic/full,
		BP_L_LEG =  new /datum/organ_description/leg/left/full_body_prosthetic/full,
		BP_R_LEG =  new /datum/organ_description/leg/right/full_body_prosthetic/full
		)

	has_process = list(    // which required-process checks are conducted and default organs for them.
		OP_HEART = /obj/item/organ/internal/cell,
		BP_BRAIN = /obj/item/organ/internal/brain,
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

	spawn_flags = CAN_JOIN

/datum/species/full_body_prosthetic/get_bodytype()
	return "Full Body Prosthetic"

/datum/species/unbranded_synth
	name = "Unbranded Full Body Prosthetic"
	default_form = FORM_UNBRANDED
	obligate_form = TRUE
	obligate_name = FALSE
	name_plural = "FBPs"
	unarmed_types = list(/datum/unarmed_attack/punch, /datum/unarmed_attack/stomp,  /datum/unarmed_attack/kick, /datum/unarmed_attack/bite)
	blurb = "no"
	reagent_tag = IS_SYNTHETIC
	hunger_factor = 0
	flags = NO_BREATHE | NO_PAIN | NO_BLOOD | NO_SCAN | NO_POISON | NO_MINOR_CUT
	radiation_mod = 0
	total_health = 75
	virus_immune = TRUE
	breath_type = null
	poison_type = null

	has_limbs = list(
		BP_CHEST =  new /datum/organ_description/chest/unbranded,
		BP_GROIN =  new /datum/organ_description/groin/unbranded,
		BP_HEAD =   new /datum/organ_description/head/unbranded,
		BP_L_ARM =  new /datum/organ_description/arm/left/unbranded/full,
		BP_R_ARM =  new /datum/organ_description/arm/right/unbranded/full,
		BP_L_LEG =  new /datum/organ_description/leg/left/unbranded/full,
		BP_R_LEG =  new /datum/organ_description/leg/right/unbranded/full
		)

	has_process = list(    // which required-process checks are conducted and default organs for them.
		OP_HEART = /obj/item/organ/internal/cell,
		BP_BRAIN = /obj/item/organ/internal/brain,
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

	spawn_flags = CAN_JOIN

/datum/species/unbranded_synth/get_bodytype()
	return "Unbranded Full Body Prosthetic"

/datum/species/soteria_synthetic
	name = "Soteria Synthetic"
	name_plural = "synthetics"
	default_form = FORM_SOTSYNTH
	obligate_name = TRUE
	obligate_form = TRUE
	unarmed_types = list(/datum/unarmed_attack/punch, /datum/unarmed_attack/stomp,  /datum/unarmed_attack/kick, /datum/unarmed_attack/bite)
	blurb = "no."
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
	total_health = 75
	virus_immune = TRUE
	breath_type = null
	poison_type = null

	dark_color = "#ffffff"
	light_color = "#000000"

	has_limbs = list(
		BP_CHEST =  new /datum/organ_description/chest/soteria_synthetic,
		BP_GROIN =  new /datum/organ_description/groin/soteria_synthetic,
		BP_HEAD =   new /datum/organ_description/head/soteria_synthetic,
		BP_L_ARM =  new /datum/organ_description/arm/left/soteria_synthetic/full,
		BP_R_ARM =  new /datum/organ_description/arm/right/soteria_synthetic/full,
		BP_L_LEG =  new /datum/organ_description/leg/left/soteria_synthetic/full,
		BP_R_LEG =  new /datum/organ_description/leg/right/soteria_synthetic/full
		)

	has_process = list(    // which required-process checks are conducted and default organs for them.
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
	return "Soteria Synthetic"

/datum/species/artificer_guild_synthetic
	name = "Artificer Guild Synthetic"
	name_plural = "synthetics"
	default_form = FORM_AGSYNTH
	obligate_name = TRUE
	obligate_form = TRUE
	unarmed_types = list(/datum/unarmed_attack/punch, /datum/unarmed_attack/stomp,  /datum/unarmed_attack/kick, /datum/unarmed_attack/bite)
	blurb = "no."
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
	total_health = 75

	dark_color = "#FA8128"
	light_color = "#FCAE1E"

	has_limbs = list(
		BP_CHEST =  new /datum/organ_description/chest/artificer_guild_synthetic,
		BP_GROIN =  new /datum/organ_description/groin/artificer_guild_synthetic,
		BP_HEAD =   new /datum/organ_description/head/artificer_guild_synthetic,
		BP_L_ARM =  new /datum/organ_description/arm/left/artificer_guild_synthetic/full,
		BP_R_ARM =  new /datum/organ_description/arm/right/artificer_guild_synthetic/full,
		BP_L_LEG =  new /datum/organ_description/leg/left/artificer_guild_synthetic/full,
		BP_R_LEG =  new /datum/organ_description/leg/right/artificer_guild_synthetic/full
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
	return "Artificer Guild Synthetic"

/datum/species/blackshield_synthetic
	name = "Blackshield Synthetic"
	name_plural = "synthetics"
	default_form = FORM_BSSYNTH
	obligate_name = TRUE
	obligate_form = TRUE
	unarmed_types = list(/datum/unarmed_attack/punch, /datum/unarmed_attack/stomp,  /datum/unarmed_attack/kick, /datum/unarmed_attack/bite)
	blurb = "no."
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
	total_health = 75
	dark_color = "#FFFFFF"
	light_color = "#000000"

	has_limbs = list(
		BP_CHEST =  new /datum/organ_description/chest/blackshield_synthetic,
		BP_GROIN =  new /datum/organ_description/groin/blackshield_synthetic,
		BP_HEAD =   new /datum/organ_description/head/blackshield_synthetic,
		BP_L_ARM =  new /datum/organ_description/arm/left/blackshield_synthetic/full,
		BP_R_ARM =  new /datum/organ_description/arm/right/blackshield_synthetic/full,
		BP_L_LEG =  new /datum/organ_description/leg/left/blackshield_synthetic/full,
		BP_R_LEG =  new /datum/organ_description/leg/right/blackshield_synthetic/full
		)

	has_process = list(    // which required-process checks are conducted and default organs for them.
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
	return "Blackshield Synthetic"

/datum/species/church_synthetic
	name = "Absolute Synthetic"
	name_plural = "synthetics"
	default_form = FORM_CHURCHSYNTH
	obligate_name = TRUE
	obligate_form = TRUE
	unarmed_types = list(/datum/unarmed_attack/punch, /datum/unarmed_attack/stomp,  /datum/unarmed_attack/kick, /datum/unarmed_attack/bite)
	blurb = "no."
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
	total_health = 75

	dark_color = "#FFFFFF"
	light_color = "#000000"

	has_limbs = list(
		BP_CHEST =  new /datum/organ_description/chest/church_synthetic,
		BP_GROIN =  new /datum/organ_description/groin/church_synthetic,
		BP_HEAD =   new /datum/organ_description/head/church_synthetic,
		BP_L_ARM =  new /datum/organ_description/arm/left/church_synthetic/full,
		BP_R_ARM =  new /datum/organ_description/arm/right/church_synthetic/full,
		BP_L_LEG =  new /datum/organ_description/leg/left/church_synthetic/full,
		BP_R_LEG =  new /datum/organ_description/leg/right/church_synthetic/full
		)

	has_process = list(    // which required-process checks are conducted and default organs for them.
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
	return "Absolute Synthetic"

/datum/species/nashef_synthetic
	name = "Nashef-Agunabi"
	name_plural = "synthetics"
	default_form = FORM_NASHEF
	obligate_name = TRUE
	obligate_form = TRUE
	unarmed_types = list(/datum/unarmed_attack/punch, /datum/unarmed_attack/stomp,  /datum/unarmed_attack/kick, /datum/unarmed_attack/bite)
	blurb = "no."
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
		BP_L_ARM =  new /datum/organ_description/arm/left/nashef_synthetic/full,
		BP_R_ARM =  new /datum/organ_description/arm/right/nashef_synthetic/full,
		BP_L_LEG =  new /datum/organ_description/leg/left/nashef_synthetic/full,
		BP_R_LEG =  new /datum/organ_description/leg/right/nashef_synthetic/full
		)

	has_process = list(    // which required-process checks are conducted and default organs for them.
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