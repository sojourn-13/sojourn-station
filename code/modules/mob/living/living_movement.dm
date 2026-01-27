/mob/living/movement_delay()

	var/tally = ..()

	if(entanglement)
		//We first shake off are entanglement
		entanglement -= entanglement * 0.45
		//If we are ever negitive or less then 1 then dont bother
		if(entanglement < 1)
			entanglement = 0
		entanglement = round(entanglement)
		tally += entanglement

	//As the fight goes on we get faster and faster
	if(stats.getPerk(PERK_IGA))
		var/datum/perk/cooldown/ignis_gladius_artium/IGA = stats.getPerk(PERK_IGA)
		tally -= IGA.sezionatura / 100
		tally -= IGA.ammo_shots
		IGA.ammo_shots -= 1

	return tally