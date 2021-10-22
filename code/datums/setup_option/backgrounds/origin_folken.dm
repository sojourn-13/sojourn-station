/datum/category_item/setup_option/background/ethnicity/folken_elder
	name = "Elder"
	desc = "Elders are folken who have lived for longer than a century and are often highly spiritual but not quite shamans. An elder will have cultivated for themselves an \
	extensive network of personal philosophies, goals, and friends both within and without their tribe. An elder knows that his place is to focus heavily on being an intellectual \
	and discussing the best way to lead their people. Elders within the colony generally come to learn from other races to then give the information back to their tribe to improve them."

	restricted_to_species = list(FORM_FOLKEN)

	perks = list()

	stat_modifiers = list(
		STAT_ROB = 0,
		STAT_TGH = 0,
		STAT_VIG = 0,
		STAT_BIO = 10,
		STAT_MEC = 0,
		STAT_COG = 20
	)

/datum/category_item/setup_option/background/ethnicity/folken_sprout
	name = "Sproutling"
	desc = "Sproutlings are folken less than a century old who have yet to decide what they seek. These folken are common, often later in life choosing to become elders or shamans \
	depending on which clique they fall into. Sproutlings have the advantage of refreshed bodies unaffected by age and thus are the most adept for dangerous or risky tasks. \
	Unlike other folken, a sproutling’s healing organ has yet to wear down from use and thus works far more effectively."

	restricted_to_species = list(FORM_FOLKEN)

	perks = list(PERK_FOLKEN_HEALING_YOUNG)

	stat_modifiers = list(
		STAT_ROB = 0,
		STAT_TGH = 0,
		STAT_VIG = 0,
		STAT_BIO = 0,
		STAT_MEC = 0,
		STAT_COG = 0
	)

/datum/category_item/setup_option/background/ethnicity/folken_shaman
	name = "Shaman"
	desc = "Shamans are folken who have spent years or decades understanding the natural processes of the planet, in particular the anomalous nature of it and the objects it creates. \
	A shaman can intuitively understand some anomalous objects, in particular oddities, allow them to use certain chants and rites to enhance them by either improving their current \
	stats or rerolling them entirely"

	restricted_to_species = list(FORM_FOLKEN)

	perks = list(PERK_ODD_REROLL)

	stat_modifiers = list(
		STAT_ROB = 0,
		STAT_TGH = 0,
		STAT_VIG = 0,
		STAT_BIO = 0,
		STAT_MEC = 0,
		STAT_COG = 0
	)
