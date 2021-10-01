/mob/living/carbon/superior_animal/robot/mining/aether
	name = "Aether Mining Drone"
	desc = "A small Aether-model mining drone, developed by a Roboticist in Soteria and sold to Lonestar to facilitate mining operations. \
			It is autonomous and can be set to mine, pick up ore and even wander on its own. A multitool can be used to have it drop its ore cache."
	gender = FEMALE
	viewRange = 6
	move_to_delay = 3
	mob_size = MOB_SMALL
	do_gibs = TRUE
	colony_friend = TRUE
	friendly_to_colony = TRUE
	obey_friends = FALSE // We follow everyone who ask

	// The vars start deactivated so that it doesn't fuck off as soon as it spawn
	wandering = FALSE
	pickup = FALSE
	mining = FALSE
