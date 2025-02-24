/mob/living/carbon/superior/xenomorph/Life()
	. = ..()

/mob/living/carbon/superior/xenomorph/handle_breath(datum/gas_mixture/breath) //we dont care about the air
	return

/mob/living/carbon/superior/xenomorph/handle_environment(var/datum/gas_mixture/environment) //were space proof
	return
