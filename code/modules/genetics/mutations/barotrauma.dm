//Macro: MUTATION_BAROTRAUMA
/datum/genetics/mutation/barotrauma
	name = "Barotrauma"
	key = "MUTATION_BAROTRAUMA"
	desc = "Alters the body to rapidly adjust to pressures way beyond normal ranges."
	gain_text = "Your ears pop loudly."
	instability = 20
	var/old_hazard

/datum/genetics/mutation/barotrauma/onPlayerImplant()
	if(!..())
		return
	var/mob/living/carbon/human/human_holder = container.holder
	old_hazard = human_holder.species.hazard_low_pressure
	human_holder.species.hazard_low_pressure = -1

/datum/genetics/mutation/barotrauma/onPlayerRemove()
	if(!..())
		return
	var/mob/living/carbon/human/human_holder = container.holder
	human_holder.species.hazard_low_pressure = old_hazard
