//Macro: MUTATION_CAT_EYES
/datum/genetics/mutation/cat_eyes
	name = "Cat Eyes"
	key = "MUTATION_CAT_EYES"
	desc = "Alters the eyes to see better in the dark."
	gain_text = "Your eyes narrow into that of a predator."
	exclusive_type = MUT_TYPE_EYES
	instability = 30
	var/old_flash
	//There is a check in mob/carbon/human/life that checks if this mutation is present to give nightvision.

/datum/genetics/mutation/cat_eyes/onPlayerImplant()
	if(!..())
		return
	var/mob/living/carbon/human/human_holder = container.holder
	old_flash = human_holder.species.flash_mod
	human_holder.species.flash_mod = 3

/datum/genetics/mutation/cat_eyes/onPlayerRemove()
	if(!..())
		return
	var/mob/living/carbon/human/human_holder = container.holder
	human_holder.species.flash_mod = old_flash
