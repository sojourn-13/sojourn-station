//Manmade horrors beyond my comprehension.
/mob/living/carbon/superior_animal/roach/plasmaroach
	name = "Brennbar Roach"
	desc = "An abomination of an insect, made by infusing Plasma Spider genes with a Gluhend Roach. It likes to explode when hit."
	icon_state = "plasmaroach"

	meat_amount = 2
	turns_per_move = 10 //fast boy
	maxHealth = 15 * ROACH_HEALTH_MOD
	health = 15 * ROACH_HEALTH_MOD

	contaminant_immunity = TRUE

	melee_damage_lower = 3
	melee_damage_upper = 5
	move_to_delay = 4

/mob/living/carbon/superior_animal/roach/plasmaroach/UnarmedAttack(atom/A, proximity)
	. = ..()
	explosion(loc, 0,1,2) //slightly weaker radius than a plasma spider, still hurts like a bitch
	gib()
