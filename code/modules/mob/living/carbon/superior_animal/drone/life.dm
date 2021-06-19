/mob/living/carbon/superior_animal/handmade/Life()
	. = ..()

	if(following) // Are we following someone?
		if(get_dist(src, following) >= 3) //Never get further than 2 tiles.
			step_to(src, following) // Take a step toward the creator
