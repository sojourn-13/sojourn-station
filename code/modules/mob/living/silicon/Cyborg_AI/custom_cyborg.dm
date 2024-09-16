/mob/living/silicon/robot/drone/borg
	name = "Modified Drone"
	real_name = "Custom Drone"
	icon = 'icons/mob/robot_tall/cargo.dmi'
	icon_state = "mekacargo"

	maxHealth = 400
	health = 400
	cell_emp_mult = 2
	universal_speak = 1
	universal_understand = 1


	gender = NEUTER
	density = TRUE
	mob_bump_flag = SIMPLE_ANIMAL
	mob_swap_flags = SIMPLE_ANIMAL
	mob_push_flags = SIMPLE_ANIMAL

	braintype = "Robot"
	lawupdate = 0
	req_access = list(access_robotics) //We are robotics based!
	integrated_light_power = 7
	local_transmit = 2
	possession_candidate = 0
	speed = -0.25

	mob_always_swap = 1

	//If you update this mob size, remember to update the fall damage too
	mob_size = MOB_MEDIUM // Small mobs can't open doors, it's a huge pain for drones.
	flavor_text = "It's a big repair drone."
