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

	armor = list(melee = 5, bullet = 0, energy = 0, bomb = 0, bio = 5, rad = 0, agony = 0)

	meat_type = /obj/item/reagent_containers/food/snacks/meat/roachmeat
	meat_amount = 1
	eating_time = 1200 //Takes longer for small roaches to eat
	life_cycles_before_sleep = 800 //We need more time to eat
	probability_egg_laying = 0
	var/amount_grown = 0
	var/big_boss = FALSE


/mob/living/carbon/superior_animal/roach/roachling/Life()
	.=..()
	if(!stat)
		amount_grown += rand(0,2) // Roachling growing up

		if(amount_grown >= 100) // Old enough to turn into an adult
			var/spawn_type
			if (fed > 0) // If roachling has eaten a corpse
				if (big_boss == TRUE && prob(fed)) // has eaten a fuhrer roach and has eaten a bunch otherwise
					spawn_type = /mob/living/carbon/superior_animal/roach/kaiser// or got lucky
				else
					spawn_type = pickweight(list(/mob/living/carbon/superior_animal/roach = 0.5,
						/mob/living/carbon/superior_animal/roach/tank = 4,
						/mob/living/carbon/superior_animal/roach/toxic = 6,
						/mob/living/carbon/superior_animal/roach/nanite = 0.5,
						/mob/living/carbon/superior_animal/roach/glowing = 1,
						/mob/living/carbon/superior_animal/roach/hunter = 2,
						/mob/living/carbon/superior_animal/roach/support = 6,
						/mob/living/carbon/superior_animal/roach/fuhrer = 2))
			else
				spawn_type = pickweight(list(/mob/living/carbon/superior_animal/roach = 9,
					/mob/living/carbon/superior_animal/roach/tank = 2,
					/mob/living/carbon/superior_animal/roach/toxic = 2,
					/mob/living/carbon/superior_animal/roach/nanite = 2,
					/mob/living/carbon/superior_animal/roach/glowing = 1,
					/mob/living/carbon/superior_animal/roach/hunter = 4,
					/mob/living/carbon/superior_animal/roach/support = 4,
					/mob/living/carbon/superior_animal/roach/fuhrer = 0.5))

			if (ispath(spawn_type, /mob/living/carbon/superior_animal/roach))
				new spawn_type(src.loc, src, list("friends" = src.friends.Copy()))
			else if(ispath(spawn_type, /mob))
				var/mob/living/carbon/superior_animal/roach/roach = new spawn_type(src.loc, src)
				roach.friends += src.friends
			qdel(src)