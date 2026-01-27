/mob/living/carbon/superior/movement_delay()

	var/tally = ..()

	tally += move_to_delay

	return tally