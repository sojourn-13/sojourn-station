//Macro: MUTATION_COW_SKIN
/datum/genetics/mutation/cow_skin
	name = "Cow Skin"
	key = "MUTATION_COW_SKIN"
	desc = "Causes the skin to become a little more leathery- the uncured sort."
	exclusive_type = MUT_TYPE_SKIN
	gain_text = "Your skin feels a little thicker than usual. Wait, are those... Cow splotches?"
	instability = 20

/datum/genetics/mutation/cow_skin/onMobImplant()
	..()
	container.holder.brute_mod_perk *= 0.75

/datum/genetics/mutation/cow_skin/onMobRemove()
	..()
	container.holder.brute_mod_perk /= 0.75
