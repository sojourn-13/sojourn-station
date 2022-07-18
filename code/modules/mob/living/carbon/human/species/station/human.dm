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


/datum/species/exalt_human
	name = "Exalt Human"
	name_plural = "Exalt Humans"
	default_form = FORM_EXALT_HUMAN
	obligate_name = FALSE
	unarmed_types = list(/datum/unarmed_attack/punch, /datum/unarmed_attack/stomp,  /datum/unarmed_attack/kick, /datum/unarmed_attack/bite)
	blurb = "Since its inception, Humankind has always sought to become something beyond itself- Exalts were their answer. Starting with baseline human DNA, \
	an Exalt's genetic code has been tweaked to make them healthier, smarter, and stronger. Their metabolism is modified to predispose them towards staying \
	fit and athletic for the duration of an extended lifespan. Their organs are specially modified to operate with greater efficiency than the average human's. \
	However, no life is perfect. Life as an Exalt is an expensive one, and low-income humans can't support. A combination of royalty fees for licensed genomes \
	and costly maintenance leave even middle-class exalts paying huge sums of money, often taken directly from their paychecks. Exalts usually resemble \
	especially handsome humans, but anything is possible with enough splicing."
	num_alternate_languages = 2
	name_language = null // Use the first-name last-name generator rather than a language scrambler
	min_age = 18
	max_age = 200 //Effectively ageless, but human history is only so long.
	hunger_factor = DEFAULT_HUNGER_FACTOR * 1.1

	dark_color = "#ffffff"
	light_color = "#000000"

	stat_modifiers = list(
		STAT_BIO = 5,
		STAT_COG = 5,
		STAT_MEC = 5,
		STAT_ROB = 5,
		STAT_TGH = 5,
		STAT_VIG = 5
	)

	darksight = 6

	perks = list(/datum/perk/debtor, /datum/perk/splicer)

	has_limbs = list(
		BP_CHEST =  new /datum/organ_description/chest/exalt,
		BP_GROIN =  new /datum/organ_description/groin/exalt,
		BP_HEAD  =  new /datum/organ_description/head/exalt,
		BP_L_ARM =  new /datum/organ_description/arm/left/exalt/full,
		BP_R_ARM =  new /datum/organ_description/arm/right/exalt/full,
		BP_L_LEG =  new /datum/organ_description/leg/left/exalt/full,
		BP_R_LEG =  new /datum/organ_description/leg/right/exalt/full
	)

	has_process = list(    // which required-organ checks are conducted.
		OP_HEART        = /obj/item/organ/internal/heart/huge/exalt,
		OP_LUNGS        = /obj/item/organ/internal/lungs/long/exalt,
		OP_STOMACH      = /obj/item/organ/internal/stomach/improved/exalt,
		OP_LIVER        = /obj/item/organ/internal/liver/big/exalt,
		OP_KIDNEY_LEFT  = /obj/item/organ/internal/kidney/left/exalt,
		OP_KIDNEY_RIGHT = /obj/item/organ/internal/kidney/right/exalt,
		BP_BRAIN        = /obj/item/organ/internal/brain,
		OP_APPENDIX     = /obj/item/organ/internal/appendix,
		OP_EYES         = /obj/item/organ/internal/eyes
	)

	spawn_flags = CAN_JOIN

/datum/species/exalt_human/get_bodytype()
	return "Exalt Human"
