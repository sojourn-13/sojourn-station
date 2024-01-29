//Macro: MUTATION_SEASONED_MIND
/datum/genetics/mutation/seasoned_mind
	name = "Seasoned Mind"
	key = "MUTATION_SEASONED_MIND"
	desc = "Increases the resistance to mental breakdowns"
	gain_text = "Your mind feels a bit more balanced in flavour"
	exclusive_type = MUT_TYPE_NONE
	instability = 5

/datum/genetics/mutation/seasoned_mind/onPlayerImplant()
	if(!..())
		return
	var/mob/living/carbon/human/human_holder = container.holder
	human_holder.sanity.change_max_level(15)

/datum/genetics/mutation/seasoned_mind/onPlayerRemove()
	if(!..())
		return
	var/mob/living/carbon/human/human_holder = container.holder
	human_holder.sanity.change_max_level(-15)