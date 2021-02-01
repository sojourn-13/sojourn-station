/mob/living/carbon/superior_animal/roach/roachling
	name = "Roachling"
	desc = "A tiny cockroach. It never stays still for long."
	icon_state = "roachling"

	turns_per_move = 3
	maxHealth = 10
	health = 10
	move_to_delay = 3.5

	knockdown_odds = 3
	melee_damage_lower = 2
	melee_damage_upper = 3

	meat_type = /obj/item/weapon/reagent_containers/food/snacks/meat/roachmeat
	meat_amount = 1
	eating_time = 1200 //Takes longer for small roaches to eat
	probability_egg_laying = 0
	var/amount_grown = 0

/mob/living/carbon/superior_animal/roach/roachling/Life()
	.=..()
	if(!stat)
		amount_grown += rand(0,1) // Roachling growing up

		if(amount_grown >= 100) // Old enough to turn into an adult
			var/spawn_type
			if (fed > 0) // If roachling has eaten a corpse
				spawn_type = pickweight(list(/mob/living/carbon/superior_animal/roach = 0.5,
					/mob/living/carbon/superior_animal/roach/tank = 4,
					/mob/living/carbon/superior_animal/roach/toxic = 6,
					/mob/living/carbon/superior_animal/roach/nanite = 0.5,
					/mob/living/carbon/superior_animal/roach/glowing = 2,
					/mob/living/carbon/superior_animal/roach/hunter = 2,
					/mob/living/carbon/superior_animal/roach/support = 6,
					/mob/living/carbon/superior_animal/roach/fuhrer = 2))
			else
				spawn_type = pickweight(list(/mob/living/carbon/superior_animal/roach = 9,
					/mob/living/carbon/superior_animal/roach/tank = 2,
					/mob/living/carbon/superior_animal/roach/toxic = 2,
					/mob/living/carbon/superior_animal/roach/nanite = 2,
					/mob/living/carbon/superior_animal/roach/glowing = 4,
					/mob/living/carbon/superior_animal/roach/hunter = 4,
					/mob/living/carbon/superior_animal/roach/support = 4,
					/mob/living/carbon/superior_animal/roach/fuhrer = 0.5))
			new spawn_type(src.loc, src)
			qdel(src)
