/mob/living/carbon/superior_animal/fungi/Life()
	..()

	// Start following.
	if(following && !findTarget()) // Are we following someone and not attacking something?
		walk_to(src, following, 2, move_to_delay) // Follow the mob referenced in 'following' and stand almost next to them.

	// Stop following if we got no one to follow and no ennemies nearby
	if(!following && !findTarget())
		walk_to(src, 0)

	// Check for food only when no ennemies are nearby
	if(!findTarget())
		handle_foodscanning()
