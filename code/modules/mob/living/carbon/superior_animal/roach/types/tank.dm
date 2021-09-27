/mob/living/carbon/superior_animal/roach/tank
	name = "Panzer Roach"
	desc = "A monstrous, dog-sized cockroach. This one looks more robust than others."
	icon_state = "panzer"
	meat_amount = 4
	turns_per_move = 2
	maxHealth = 60
	health = 60
	move_to_delay = 7
	mob_size = MOB_MEDIUM
	density = TRUE
	meat_type = /obj/item/reagent_containers/food/snacks/meat/roachmeat/panzer
	knockdown_odds = 3

	armor = list(melee = 15, bullet = 10, energy = 5, bomb = 5, bio = 20, rad = 0, agony = 0)

// Panzers won't slip over on water or soap.
/mob/living/carbon/superior_animal/roach/tank/slip(var/slipped_on,stun_duration=8)
	return FALSE
