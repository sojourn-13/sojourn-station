/mob/living/carbon/superior/roach/roachling
	name = "Roachling"
	desc = "A tiny cockroach. It never stays still for long."
	icon_state = "roachling"

	turns_per_move = 3
	maxHealth = 10 * ROACH_HEALTH_MOD
	health = 10 * ROACH_HEALTH_MOD
	move_to_delay = 3.5

	knockdown_odds = 3
	melee_damage_lower = 2
	melee_damage_upper = 3

	armor = list(melee = 1, bullet = 0, energy = 0, bomb = 0, bio = 5, rad = 0, agony = 0)

	meat_type = /obj/item/reagent_containers/snacks/meat/roachmeat
	meat_amount = 1
	eating_time = 90 SECONDS //Takes less time
	life_cycles_before_sleep = 800 //We need more time to eat
	probability_egg_laying = 95 //We are the quickest are we dont want to waste eggs!
	var/amount_grown = 0
	var/big_boss = FALSE


/mob/living/carbon/superior/roach/roachling/Life()
	.=..()
	if(!stat)
		amount_grown += rand(0,2) // Roachling growing up

		if(amount_grown >= 50) // Old enough to turn into an adult
			var/spawn_type
			if (fed > 0) // If roachling has eaten a corpse
				if (big_boss == TRUE && prob(fed)) // has eaten a fuhrer roach and has eaten a bunch otherwise
					spawn_type = /mob/living/carbon/superior/roach/kaiser// or got lucky
				else
					spawn_type = pickweight(list(/mob/living/carbon/superior/roach = 0.5,
						/mob/living/carbon/superior/roach/tank = 4,
						/mob/living/carbon/superior/roach/toxic = 6,
						/mob/living/carbon/superior/roach/nanite = 0.5,
						/mob/living/carbon/superior/roach/glowing = 1,
						/mob/living/carbon/superior/roach/hunter = 2,
						/mob/living/carbon/superior/roach/support = 6,
						/mob/living/carbon/superior/roach/fuhrer = 2))
			else
				spawn_type = pickweight(list(/mob/living/carbon/superior/roach = 9,
					/mob/living/carbon/superior/roach/tank = 2,
					/mob/living/carbon/superior/roach/toxic = 2,
					/mob/living/carbon/superior/roach/nanite = 2,
					/mob/living/carbon/superior/roach/glowing = 1,
					/mob/living/carbon/superior/roach/hunter = 4,
					/mob/living/carbon/superior/roach/support = 4,
					/mob/living/carbon/superior/roach/fuhrer = 0.5))

			if (ispath(spawn_type, /mob/living/carbon/superior/roach))
				new spawn_type(src.loc, src, list("friends" = src.friends.Copy()))
			else if(ispath(spawn_type, /mob))
				var/mob/living/carbon/superior/roach/roach = new spawn_type(src.loc, src)
				roach.friends += src.friends
			qdel(src)
