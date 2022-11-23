//Macro: MUTATION_BOTTOMLESS_BELLY
/datum/genetics/mutation/bottomless_belly
	name = "Bottomless"
	key = "MUTATION_BOTTOMLESS_BELLY"
	desc = "This is what allows dogs to eat and eat and eat."
	gain_text = "You have the munchies."
	var/old_max_nutrition

/datum/genetics/mutation/bottomless_belly/onPlayerImplant()
	if(!..())
		return
	var/mob/living/carbon/human/human_holder = container.holder
	old_max_nutrition = human_holder.max_nutrition
	human_holder.max_nutrition = human_holder.max_nutrition * 4

/datum/genetics/mutation/bottomless_belly/onPlayerRemove()
	if(!..())
		return
	var/mob/living/carbon/human/human_holder = container.holder
	human_holder.max_nutrition = old_max_nutrition
