//Macro: MUTATION_ECHOLOCATION
/datum/genetics/mutation/echolocation
	name = "Echolocation"
	key = "MUTATION_ECHOLOCATION"
	desc = "Causes one to see with thier ears."
	gain_text = "You see the world thru sound."
	exclusive_type = MUT_TYPE_EYES
	instability = 40
	var/old_vision
	var/old_flash

/datum/genetics/mutation/echolocation/onPlayerImplant()
	if(!..())
		return
	var/mob/living/carbon/human/human_holder = container.holder
	old_flash = human_holder.species.flash_mod
	if(human_holder.species.vision_organ)
		old_vision = human_holder.species.vision_organ
		human_holder.species.vision_organ = null

/datum/genetics/mutation/echolocation/onPlayerRemove()
	if(!..())
		return
	var/mob/living/carbon/human/human_holder = container.holder
	human_holder.species.flash_mod = old_flash
	human_holder.species.vision_organ = old_vision

