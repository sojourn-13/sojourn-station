//Manmade horrors beyond my comprehension.
/mob/living/carbon/superior_animal/roach/plasmaroach
	name = "Brennbar Roach"
	desc = "An abomination of an insect, made by infusing Plasma Spider genes with a Gluhend Roach. It likes to explode."
	icon = 'icons/mob/plasma_roach.dmi'
	icon_state = "plasmaroach"

	turns_per_move = 10 //fast boy
	maxHealth = 25
	health = 25
	blattedin_revives_left = 0
	eating_time = 2 MINUTES
	snacker = TRUE
	clone_difficulty = CLONE_EASY
	can_burrow = FALSE
	colony_friend = FALSE
	friendly_to_colony = FALSE //Should be ignored if you have the roach friend gene. 
inherent_mutations = list(MUTATION_ROACH_BLOOD , MUTATION_DEAF, MUTATION_TOURETTES, MUTATION_EPILEPSY, MUTATION_NERVOUSNESS,)

	contaminant_immunity = TRUE

	melee_damage_lower = 3
	melee_damage_upper = 5
		poison_per_bite = 2
	poison_type = "plasma"
	move_to_delay = 4
	meat_type = /obj/item/reagent_containers/food/snacks/meat/roach/plasma
	
/mob/living/carbon/superior_animal/roach/plasmaroach/UnarmedAttack(var/atom/A, var/proximity)
	. = ..()
	src.gib()
	explosion(src.loc, 0,0.5,3) //Same radius, weaker explosive damage.