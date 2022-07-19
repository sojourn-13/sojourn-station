
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
	max_age = 200
	burn_mod = 2						// Burn damage multiplier.
	light_dam = 1 // Same threshold as the Nightcrawler perk
	vision_flags = SEE_SELF
	flags = NO_PAIN | IS_PLANT
	taste_sensitivity = TASTE_NUMB

	dark_color = "#93eb9e"
	light_color = "#93eb9e"

	has_process = list(    // which required-organ checks are conducted.
		OP_HEART =    /obj/item/organ/internal/heart/plant,
		OP_STOMACH =  /obj/item/organ/internal/stomach/plant,
		OP_LUNGS =    /obj/item/organ/internal/lungs/plant,
		BP_BRAIN =    /obj/item/organ/internal/brain/plant,
		OP_EYES =     /obj/item/organ/internal/eyes
		)

	perks = list(PERK_FOLKEN_HEALING)

	stat_modifiers = list(
		STAT_BIO = 10,
		STAT_COG = 0,
		STAT_MEC = 0,
		STAT_ROB = 0,
		STAT_TGH = 0,
		STAT_VIG = 10
	)

	spawn_flags = CAN_JOIN

/datum/species/folken/get_bodytype()
	return "Folken"