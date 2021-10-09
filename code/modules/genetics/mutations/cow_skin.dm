//Macro: MUTATION_COW_SKIN
/datum/genetics/mutation/cow_skin
	name = "Cow Skin"
	key = "MUTATION_COW_SKIN"
	desc = "Causes the skin to become a little more leathery- the uncured sort."
	exclusive_type = MUT_TYPE_SKIN
	embryo_descriptions = list(/datum/genetics/embryo_state/cow_skin)
	gain_text = "Your skin feels a little thicker than usual. Wait, are those... Cow splotches?"

/datum/genetics/embryo_state/cow_skin
	desc = "The embryo has large splotches on its skin."
	active_stage = 1 //What stage of development the descriptor becomes active.

/datum/genetics/mutation/cow_skin/onMobImplant()
	..()
	container.holder.brute_mod_perk -= 0.1
	
/datum/genetics/mutation/cow_skin/onMobRemove()
	..()
	container.holder.brute_mod_perk += 0.1
