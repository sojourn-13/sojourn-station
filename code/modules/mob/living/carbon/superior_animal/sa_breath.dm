//SOJ's attempt to fix and optimize npcs atmos intractions
//First optimization is to stop having mobs eat air and less new gas mixtures
/mob/living/carbon/superior_animal/proc/sa_handle_breath()
	var/datum/gas_mixture/environment = loc.return_air_for_internal_lifeform()
	handle_breath(environment)
	handle_environment(environment) //it should be pretty safe to move this out of ai inactive if this causes problems.
	if(can_burrow && bad_environment)
		evacuate()

// massively reduces code to a be bare minium
/mob/living/carbon/superior_animal/handle_breath(datum/gas_mixture/environment as anything)
	var/damage = 0
	if(breath_required_type)
		if(environment.gas[breath_required_type] < min_breath_required_type)
			damage = min_breath_required_type - environment.gas[breath_required_type]
			adjustOxyLoss(damage)

	if(breath_poison_type)
		if(environment.gas[breath_poison_type] > min_breath_poison_type)
			damage = environment.gas[breath_poison_type] * (min_breath_poison_type + 1)
			adjustOxyLoss(damage)

	if(damage)
		bad_environment = TRUE
	else
		bad_environment = FALSE

	return

/mob/living/carbon/superior_animal/handle_environment(datum/gas_mixture/environment as anything)
	var/pressure = environment.return_pressure()
	var/damage = 0
//	message_admins("pressure = [pressure] temp = [environment.temperature]")

	if(pressure < min_air_pressure)
		damage = min_air_pressure - pressure
		adjustBruteLoss(damage)
	if(pressure > max_air_pressure)
		damage = pressure - max_air_pressure
		adjustBruteLoss(damage)

//	message_admins("environment.temperature [environment.temperature] <  [min_bodytemperature] min_bodytemperature")

	if(environment.temperature < min_bodytemperature)
		damage = min_bodytemperature - environment.temperature
//		message_admins("i did cold run and delt [damage]")

		if(cold_protection)
			if(cold_protection >= 1)
				damage = 0
			var/cold_protected = damage * cold_protection
			damage = damage - cold_protected

		adjustFireLoss(damage)

//	message_admins("environment.temperature [environment.temperature] > [max_bodytemperature] max_bodytemperature")


	if(environment.temperature > max_bodytemperature)
		damage = environment.temperature - max_bodytemperature
//		message_admins("i did run hot and delt [damage]")
		if(heat_protection)
			if(heat_protection >= 1)
				damage = 0
			var/heat_protected = damage * heat_protection
			damage = damage - heat_protected
		adjustFireLoss(damage)

	//Pasma in the air is bad
	if(!contaminant_immunity)
		if(environment.gas["plasma"] > 25)
			damage = environment.gas["plasma"] * 0.1 //This can get to crazy high damage
			adjustToxLoss(damage)


	if(damage)
		bad_environment = TRUE
	else
		bad_environment = FALSE

	return








