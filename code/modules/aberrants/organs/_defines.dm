#define LOW_REAGENT_THRESHOLD 4
#define MID_REAGENT_THRESHOLD 13
#define HIGH_REAGENT_THRESHOLD 28

#define LOW_DAMAGE_THRESHOLD 5
#define MID_DAMAGE_THRESHOLD 25
#define HIGH_DAMAGE_THRESHOLD 50

#define VERY_LOW_OUTPUT 0.5
#define LOW_OUTPUT 2
#define MID_OUTPUT 5
#define HIGH_OUTPUT 10

#define STANDARD_ABERRANT_COOLDOWN 10 SECONDS
#define DEPENDENT_ABERRANT_COOLDOWN 15 MINUTES

#define STANDARD_ABERRANT_STIM_TIME 11 SECONDS
#define DEPENDENT_ABERRANT_STIM_TIME 901 SECONDS

#define ALL_STANDARD_ORGAN_EFFICIENCIES list(OP_EYES, OP_HEART, OP_LUNGS, OP_LIVER, OP_KIDNEYS, OP_APPENDIX, OP_STOMACH, OP_BONE, OP_MUSCLE, OP_NERVE, OP_BLOOD_VESSEL)
#define ALL_ORGAN_STATS list(\
		OP_EYES			= list(100,   1,   20,  2,   1,   1,   list("e", "y", "es"), list()),\
		OP_HEART		= list(100,   2,   0,   0,   10,  10,  list("he", "ar", "t"), list()),\
		OP_LUNGS		= list(100,   2,   50,	10,  10,  0,   list("l", "un", "gs"), list()),\
		OP_LIVER		= list(100,   1,   25,	5,   5,   7,   list("l", "iv", "er"), list()),\
		OP_KIDNEYS		= list(50,    1,   7.5, 1.5, 2,   2.5, list("k", "idn", "ey"), list()),\
		OP_APPENDIX		= list(100,   0,   0,	0,   0,   0,   list("app", "end", "ix"), list()),\
		OP_STOMACH		= list(100,   1,   25,	5,   0,   5,   list("st", "om", "ach"), list()),\
		OP_BONE			= list(100,   1,   0,	0,   0,   0,   list("b", "on", "e"), list()),\
		OP_MUSCLE		= list(100,   0.5, 2.5, 0.5, 0.5, 0,   list("m", "us", "cle"), list()),\
		OP_NERVE		= list(100,   0,   2.5, 0.5, 0.5, 0,   list("n", "er", "ve"), list()),\
		OP_BLOOD_VESSEL	= list(100,   0.5, 100, 0,   1,   2,   list("blood v", "ess", "el"), list())\
	)	//organ			= eff, size, max blood, blood req, nutriment req, oxygen req, name chunks, verbs
#define ALL_NANITES list(/datum/reagent/nanites/arad, /datum/reagent/nanites/implant_medics, /datum/reagent/nanites/nantidotes, /datum/reagent/nanites/nanosymbiotes,\
						/datum/reagent/nanites/oxyrush, /datum/reagent/nanites/trauma_control_system, /datum/reagent/nanites/purgers,\
						/datum/reagent/nanites/uncapped/control_booster_utility, /datum/reagent/nanites/uncapped/control_booster_combat, /datum/reagent/nanites/uncapped/dynamic_handprints)
#define ALL_USABLE_DAMAGE_TYPES list(BRUTE, BURN, TOX, OXY, CLONE, HALLOSS)
//#define ALL_STATS list(STAT_MEC, STAT_COG, STAT_BIO, STAT_ROB, STAT_TGH, STAT_VIG)
#define ALL_USABLE_POSITIVE_CHEM_EFFECTS list(CE_BLOODRESTORE = 0.1, CE_BLOODCLOT = 0.1, CE_PAINKILLER = 3, CE_ANTITOX = 0.1, CE_SPEEDBOOST = 0.1)
#define ALL_USABLE_POWER_SOURCES list(/obj/item/cell/small, /obj/item/cell/medium, /obj/item/cell/large, /obj/item/stack/material/plasma, /obj/item/stack/material/uranium, /obj/item/stack/material/tritium)

// Blacklist all reagents with no name or ones that cannot be produced
#define REAGENT_BLACKLIST list(/datum/reagent/organic, /datum/reagent/metal, /datum/reagent/drug,\
								/datum/reagent/other, /datum/reagent/nanites, /datum/reagent/medicine,\
								/datum/reagent/stim, /datum/reagent/adminordrazine, /datum/reagent/other/matter_deconstructor,\
								/datum/reagent/other/xenomicrobes)

#define NOT_USED 1
