/mob/living/carbon/superior_animal/handmade/Life()
	. = ..()

	if((following) && !(findTarget())) // Are we following someone and not attacking something?
		while(get_dist(src, following) >= 3) // Keep walking until we get there.
			step_to(src, following) // Take a step toward the friend

