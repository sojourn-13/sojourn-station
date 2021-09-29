/mob/living/carbon/superior_animal/robot/mining/aether
	name = "Aether Mining Drone"
	desc = "A small Aether-model mining drone, developped by a Roboticist in Soteria and sold to Lonestar to facilitate mining operations. \
			It is autonomous and can be set to mine, pick ore and even wander on its own. Use a multitool to drop the ore it contain."
	gender = FEMALE
	viewRange = 6
	move_to_delay = 3
	mob_size = MOB_SMALL
	do_gibs = TRUE
	colony_friend = TRUE
	friendly_to_colony = TRUE
	obey_friends = FALSE // We follow everyone who ask

	wander = FALSE // We don't wander automatically
