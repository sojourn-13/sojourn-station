/mob/living/carbon/superior_animal/handmade/Life()
	. = ..()

	if((following) && !(findTarget())) // Are we following someone and not attacking something?
		walk_to(src, following, 2, move_to_delay) // Follow the mob referenced in 'following' and stand almost next to them.

	if(!following && !(findTarget())) // Stop following
		walk_to(src, 0)
