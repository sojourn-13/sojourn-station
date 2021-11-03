/mob/living/carbon/superior_animal/nanobot/Life()
	. = ..()

	// What it does if it can repair itself
	if(repair_rate)
		heal_overall_damage(repair_rate, repair_rate)

	// What it does if it is supposed to act as a medbot.
	if(medbot)
		if(patient)
			if(Adjacent(patient))
				if(!currently_healing)
					UnarmedAttack(patient)
				walk_to(src, 0) // Stop walking
			else
				walk_to(src, patient, 1, move_to_delay)
		else
			for(var/mob/friendtest in view(7,src)) // Time to find a patient!
				if(valid_healing_target(friendtest))
					if(friendtest in friends)
						patient = friendtest
						return
