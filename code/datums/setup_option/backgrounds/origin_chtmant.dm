/datum/category_item/setup_option/background/ethnicity/chtmantro
	name = "Ro Caste"
	desc = "Ro are the worker class, and were the most varied in terms of genetic alterations. Their purpose was always \
			chosen at birth and their bodies altered to fit whatever best aids in this goal. Their tasks ranged from cutting through \
			tough rock, processing raw ore into mineral rich gels for consumption, to even simple crop and animal care. They only \
			knew what was needed for their purpose and literally nothing else."

	restricted_to_species = list(FORM_CHTMANT)
	allow_modifications = FALSE
	perks = list(PERK_SCUTTLEBUG, PERK_REPAIR_GOO)

	stat_modifiers = list(
		STAT_ROB = 4,
		STAT_TGH = 3,
		STAT_VIG = 3,
		STAT_BIO = 3,
		STAT_MEC = -7,
		STAT_COG = -6
	)

/datum/category_item/setup_option/background/ethnicity/chtmantru
	name = "Ru Caste"
	desc = "Ru are the primary brain power of the hives. Possessing incredibly weak bodies and short stature, a hive would  \
			usually have less than ten at most and use them to perform primitive medical care, research, and genetic alterations to  \
			the rest of their hives. Being pre stone age at the time, their research mostly consisted of consuming any and  \
			everything to unravel its genetic code. Because of this the Ru brain and body was, and still is, a complex mystery. \
			Due to the physical weakness of the Ru caste they are barred from taking roles as security, as their importance to their relative hive structure makes them far more suited in other roles.."

	restricted_to_species = list(FORM_CHTMANT)

	allow_modifications = FALSE
	perks = list(PERK_ICHOR)
	racial_implants = (/obj/item/organ_module/active/simple/surgical/cht_mant)
	restricted_jobs = list(/datum/job/pro,/datum/job/smc,/datum/job/swo, /datum/job/supsec, /datum/job/serg, /datum/job/inspector, /datum/job/trooper, /datum/job/officer, /datum/job/officerjr, /datum/job/cadet)

	stat_modifiers = list(
		STAT_ROB = -8,
		STAT_TGH = -8,
		STAT_VIG = -8,
		STAT_BIO = 8,
		STAT_MEC = 3,
		STAT_COG = 8
	)

/datum/category_item/setup_option/background/ethnicity/chtmantra
	name = "Ra Caste"
	desc = "Ra are the warriors and sentries of the hives. Numbering in the hundreds they would tower over Ru�s and even \
			most workers, the Ro. Their bodies were highly adapted for combat and they know only loyalty unto death for the good of \
			the hive. Due to this, and the existence of the Ru, they often heavily lack any cognitive thinking skills and would \
			rely on winning battles by sheer weight of numbers or pure attrition. The severe lack of intelligence they exhibit also bars them from most medical roles and all of science, engineering, and command roles."

	restricted_to_species = list(FORM_CHTMANT)
	allow_modifications = FALSE
	restricted_depts = SCIENCE | ENGINEERING
	restricted_jobs = list(/datum/job/cmo, /datum/job/rd, /datum/job/smc, /datum/job/swo, /datum/job/cmo, /datum/job/doctor, /datum/job/psychiatrist, /datum/job/premier, /datum/job/pg, /datum/job/chief_engineer, /datum/job/chaplain, /datum/job/merchant, /datum/job/medstudent)

	perks = list(PERK_CHITINARMOR)
	racial_implants = (/obj/item/organ_module/active/simple/cht_mant_claws)

	stat_modifiers = list(
		STAT_ROB = 15,
		STAT_TGH = 15,
		STAT_VIG = 5,
		STAT_BIO = -10,
		STAT_MEC = -15,
		STAT_COG = -10
	)

//Background perk, but placed here since its cht'mant only. -Kaz
/datum/category_item/setup_option/background/bckgrnd/chtmantspider
	name = "Eight-Legged Ally"
	desc = "As a cht-mant you have an innate understanding towards insects and crawling things. While most of your kin are naturally adapted to roaches you've developed a sense of  \
	control and understanding to spiders. Over time a subtle shift in your pheromones allowed you to interact with spiders much in the same way your kin do with roaches. \
	Unfortunately this shift in biology has made roaches innately hostile to you, viewing you as a spider from the smell alone. A secondary side effect of your biological adjustment has \
	given you the ability to generate webs like a spider."

	restricted_to_species = list(FORM_CHTMANT)
	perks = list(PERK_SPIDER_FRIEND, PERK_WEBMAKER)

	stat_modifiers = list(
		STAT_ROB = 0,
		STAT_TGH = 0,
		STAT_VIG = 0,
		STAT_BIO = 0,
		STAT_MEC = 0,
		STAT_COG = 0
	)
