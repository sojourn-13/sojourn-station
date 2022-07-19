
/datum/species/mycus
	name = "Mycus"
	name_plural = "Myci"
	default_form = FORM_MYCUS
	obligate_name = TRUE
	obligate_form = TRUE
	unarmed_types = list(/datum/unarmed_attack/punch/hammer_fist, /datum/unarmed_attack/stomp,  /datum/unarmed_attack/kick, /datum/unarmed_attack/bite)
	blurb = "N/A"
	num_alternate_languages = 2
	name_language = null	// Use the first-name last-name generator rather than a language scrambler
	min_age = 18
	max_age = 200
	flags = NO_PAIN | IS_PLANT | NO_POISON | NO_BREATHE
	slowdown = 0.3
	hunger_factor = DEFAULT_HUNGER_FACTOR * 1.3

	burn_mod = 2						// Burn damage multiplier.
	light_dam = 1 // Same threshold as the Nightcrawler perk
	taste_sensitivity = TASTE_NUMB

	dark_color = "#49754f"
	light_color = "#49754f"

	has_process = list(    // which required-organ checks are conducted.
		OP_HEART =    /obj/item/organ/internal/heart/plant,
		OP_STOMACH =  /obj/item/organ/internal/stomach/plant,
		BP_BRAIN =    /obj/item/organ/internal/brain/plant,
		OP_EYES =     /obj/item/organ/internal/eyes
		)

	perks = list(PERK_DARK_HEAL)

	stat_modifiers = list(
		STAT_BIO = 0,
		STAT_COG = 0,
		STAT_MEC = 0,
		STAT_ROB = 20,
		STAT_TGH = 0,
		STAT_VIG = 0
	)

	spawn_flags = CAN_JOIN

/datum/species/mycus/get_bodytype()
	return "Mycus"
