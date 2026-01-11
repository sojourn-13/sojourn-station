/mob/living/movement_delay()

	var/tally = ..()

	if(entanglement)
		//We first shake off are entanglement
		entanglement -= floor(entanglement * 0.45)
		//If we are ever negitive or less then 1 then dont bother
		if(entanglement < 1)
			entanglement = 0
		tally += entanglement

	return tally