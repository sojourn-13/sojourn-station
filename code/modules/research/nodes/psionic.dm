/datum/technology/psi_uniform
	name = "Psionic Uniform"
	desc = "A high-tech uniform designed for Psions"
	tech_type = RESEARCH_PSI

	x = 0.5 //Middle center
	y = 0.5
	icon = "psi_uniform"

	required_technologies = list()
	required_tech_levels = list(RESEARCH_BIOTECH = 10)

	unlocks_designs = list(/datum/design/research/item/psionic_cloths)

	cost = 2500

/datum/technology/psi_glasses
	name = "Psionic Glasses"
	desc = "High-tech glasses for Psions"
	tech_type = RESEARCH_PSI

	x = 0.5
	y = 0.6
	icon = "psi_glasses"

	required_technologies = list(/datum/technology/psi_uniform)
	required_tech_levels = list(RESEARCH_BIOTECH = 12, RESEARCH_ENGINEERING = 8)

	unlocks_designs = list(/datum/design/research/item/psionic_ear_rings)

	cost = 3000

/datum/technology/psi_earring
	name = "Psionic Ear Rings"
	desc = "High-tech ear accessories for Psions"
	tech_type = RESEARCH_PSI

	x = 0.6
	y = 0.5
	icon = "psi_earring"

	required_technologies = list(/datum/technology/psi_uniform)
	required_tech_levels = list(RESEARCH_BIOTECH = 13, RESEARCH_ENGINEERING = 12)

	unlocks_designs = list(/datum/design/research/item/psionic_lens)

	cost = 2000

/*
/datum/technology/psi_wand_basic
	name = "W.A.N.D Type-2"
	desc = "The improved protoyped verson of the WAND"
	tech_type = RESEARCH_PSI

	x = 0.1
	y = 0.1
	icon = "psi_wand_b"

	required_technologies = list()
	required_tech_levels = list(RESEARCH_BIOTECH = 13, RESEARCH_ENGINEERING = 12, RESEARCH_COMBAT = 5)

	unlocks_designs = list(/datum/design/research/item/wand)

	cost = 8000
*/

/*
/datum/technology/psi_wand_adv
	name = "S.T.A.F.F Stub8v5"
	desc = "The improved protoyped verson of the STAFF, subtype 8v5"
	tech_type = RESEARCH_PSI

	x = 0.2
	y = 0.1
	icon = "psi_wand_b"

	required_technologies = list(/datum/technology/psi_wand_basic)
	required_tech_levels = list(RESEARCH_ENGINEERING = 20, RESEARCH_COMBAT = 15)

	unlocks_designs = list(/datum/design/research/item/wand_adv)

	cost = 15000
*/