//Macro: MUTATION_RAD_PROTECTION
/datum/genetics/mutation/rad_protection
	name = "Radiation Protection"
	key = "MUTATION_RAD_PROTECTION"
	desc = "Causes one to become immune to the negative effect of radiation."
	gain_text = "You feel protected from an invisible threat"
	instability = 40
	var/old_rad_mod = 1 // In case we don't corrently store the old radiation modifier.

/datum/genetics/mutation/rad_protection/onPlayerImplant()
	if(!..())
		return
	var/mob/living/carbon/human/human_holder = container.holder
	old_rad_mod = human_holder.species.radiation_mod
	human_holder.species.radiation_mod = 0 // Make the player immune to the effect of radiation

/datum/genetics/mutation/rad_protection/onPlayerRemove()
	if(!..())
		return
	var/mob/living/carbon/human/human_holder = container.holder
	human_holder.species.radiation_mod = old_rad_mod
