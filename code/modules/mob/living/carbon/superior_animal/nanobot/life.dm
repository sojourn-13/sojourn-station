/mob/living/carbon/superior_animal/nanobot/Life()
	. = ..()

	if(repair_rate)
		heal_overall_damage(repair_rate, repair_rate)
