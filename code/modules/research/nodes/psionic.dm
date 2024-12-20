/datum/technology/psi_uniform
	name = "S8.9-Type Outfit" //S for silk
	desc = "High-tech experimental uniform designed for Psions"
	tech_type = RESEARCH_PSI

	x = 0.5 //Middle center
	y = 0.5
	icon = "psi_uniform"

	required_technologies = list()
	required_tech_levels = list(RESEARCH_BIOTECH = 10)

	unlocks_designs = list(/datum/design/research/item/psionic_cloths)

	cost = 2500

/datum/technology/psi_glasses
	name = "Glasses P-22.1 LR" //P for plasma, LR for low risk
	desc = "High-tech stablized experimental glasses for Psions"
	tech_type = RESEARCH_PSI

	x = 0.5
	y = 0.6
	icon = "psi_glasses"

	required_technologies = list(/datum/technology/psi_uniform)
	required_tech_levels = list(RESEARCH_BIOTECH = 12, RESEARCH_ENGINEERING = 8)

	unlocks_designs = list(/datum/design/research/item/psionic_ear_rings)

	cost = 3000

/datum/technology/psi_earring
	name = "Earrings P-3.1" //P for plasma
	desc = "High-tech experimental ear accessories for Psions"
	tech_type = RESEARCH_PSI

	x = 0.6
	y = 0.5
	icon = "psi_earring"

	required_technologies = list(/datum/technology/psi_uniform)
	required_tech_levels = list(RESEARCH_BIOTECH = 13, RESEARCH_ENGINEERING = 12)

	unlocks_designs = list(/datum/design/research/item/psionic_lens)

	cost = 2000

/datum/technology/psi_pouch
	name = "Woven Pouch C-7v89" //c for cloth, 7 *ate* 9
	desc = "High-tech experimental pouch for Psions"
	tech_type = RESEARCH_PSI

	x = 0.6
	y = 0.8
	icon = "psi_pouch"

	required_technologies = list()
	required_tech_levels = list(RESEARCH_PSI = 3) //All others atm

	unlocks_designs = list(/datum/design/research/item/psionic_pouch)

	cost = 12500


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