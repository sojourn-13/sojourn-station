/*
		STAT_BIO = 4
		STAT_COG = 2
*/

/datum/category_item/setup_option/background/origin/chtmantro
	name = "Ro Caste"
	desc = "Ro are the worker class, and were the most varied in terms of genetic alterations. Their purpose was always \
			chosen at birth and their bodies altered to fit whatever best aids in this goal. Their tasks ranged from cutting through \
			tough rock, processing raw ore into mineral rich gels for consumption, to even simple crop and animal care. They only \
			knew what was needed for their purpose and literally nothing else."

	restricted_to_species = list(FORM_CHTMANT)
	allow_modifications = FALSE
	perks = list(/datum/perk/scuttlebug, /datum/perk/repair_goo)
// Mec = 5
	stat_modifiers = list(
		STAT_ROB = 0,
		STAT_TGH = 0,
		STAT_VIG = 0,
		STAT_BIO = 4,
		STAT_MEC = 5,
		STAT_COG = 2
	)

/datum/category_item/setup_option/background/origin/chtmantru
	name = "Ru Caste"
	desc = "Ru are the primary brain power of the hives. Possessing incredibly weak bodies and short stature, a hive would  \
			usually have less than ten at most and use them to perform primitive medical care, research, and genetic alterations to  \
			the rest of their hives. Being pre stone age at the time, their research mostly consisted of consuming any and  \
			everything to unravel its genetic code. Because of this the Ru brain and body was, and still is, a complex mystery. \
			Due to the physical weakness of the Ru caste they are barred from taking roles as security, as their importance to their relative hive structure makes them far more suited in other roles.."

	restricted_to_species = list(FORM_CHTMANT)
	restricted_depts = SECURITY

	allow_modifications = FALSE
	perks = list(/datum/perk/ichor)
	racial_implants = (/obj/item/organ_module/active/simple/surgical/cht_mant)
	restricted_jobs = list(/datum/job/pro)
// Cog = 3 Bio = 2
	stat_modifiers = list(
		STAT_ROB = 0,
		STAT_TGH = 0,
		STAT_VIG = 0,
		STAT_BIO = 6,
		STAT_MEC = 0,
		STAT_COG = 5
	)

/datum/category_item/setup_option/background/origin/chtmantra
	name = "Ra Caste"
	desc = "Ra are the warriors and sentries of the hives. Numbering in the hundreds they would tower over Ru�s and even \
			most workers, the Ro. Their bodies were highly adapted for combat and they know only loyalty unto death for the good of \
			the hive. Due to this, and the existence of the Ru, they often heavily lack any cognitive thinking skills and would \
			rely on winning battles by sheer weight of numbers or pure attrition. The severe lack of intelligence they exhibit also bars them from most medical roles and all of science, engineering, and command roles."

	restricted_to_species = list(FORM_CHTMANT)
	allow_modifications = FALSE
	restricted_depts = SCIENCE | ENGINEERING
	restricted_jobs = list(/datum/job/cmo, /datum/job/rd, /datum/job/smc, /datum/job/swo, /datum/job/cmo, /datum/job/doctor, /datum/job/psychiatrist, /datum/job/premier, /datum/job/pg, /datum/job/chief_engineer, /datum/job/chaplain, /datum/job/merchant)

	perks = list(/datum/perk/chitinarmor)
	racial_implants = (/obj/item/organ_module/active/simple/cht_mant_claws)
// Rob = 3 Vig = 2
	stat_modifiers = list(
		STAT_ROB = 3,
		STAT_TGH = 0,
		STAT_VIG = 2,
		STAT_BIO = 4,
		STAT_MEC = 0,
		STAT_COG = 0
	)
