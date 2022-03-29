//Macro: MUTATION_MKNEWAIFUHAIR
/datum/genetics/mutation/bald
	name = "Bald"
	key = "MUTATION_MKNEWAIFUHAIR"
	desc = "Causes your hairline to recede... by alot."
	gain_text = "Your head feels a little itchy."

/datum/genetics/mutation/bald/onPlayerImplant()
	var/mob/living/carbon/human/human_holder = container.holder
	to_chat(human_holder, SPAN_DANGER("Your head feels a little cold."))
	human_holder.ChangeHairToBald()
	//For those who are willing to take the hit and powergame. Fucking savages.
	container.holder.stats.changeStat(STAT_COG, 10)

/datum/genetics/mutation/bald/onPlayerRemove()
	container.holder.stats.changeStat(STAT_COG, -10)
