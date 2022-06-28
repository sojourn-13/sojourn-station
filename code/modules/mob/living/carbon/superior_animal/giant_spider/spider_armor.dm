/mob/living/carbon/superior_animal/giant_spider/New()
	..()

	if(give_randomized_armor)
		pick_armor()
	if(gives_prefex)
		name = "[prefex] [name]"
	for(var/key in add_armor)
		if(key in armor)
			armor[key] += add_armor[key]
		else
			armor[key] = add_armor[key]

/mob/living/carbon/superior_animal/giant_spider/pick_armor()
	switch (pickweight(list("basic" = 6, "padded" = 1, "lustrous" = 2, "durable" = 3, "young" = 2, "old" = 3, "venomous" = 1, "brutish" = 1)))

		if("basic") //No changes, we are base level
			return

		if("padded")
			add_armor = list(
			melee = 10,
			bullet = 5,
			energy = 0,
			bomb = 10,
			bio = 0,
			rad = 0,
			agony = 15 //Rubbers deal way less to us!
			)
			gives_prefex = TRUE
			maxHealth += 10
			health += 10
			prefex = "padded"
			return

		if("lustrous")
			add_armor = list(
			melee = 0,
			bullet = 0,
			energy = 10,
			bomb = 0,
			bio = 0,
			rad = 0,
			agony = 10
			)
			gives_prefex = TRUE
			prefex = "lustrous"
			armor_penetration += 15
			flash_resistances += 2
			return

		if("durable")
			add_armor = list(
			melee = 5,
			bullet = 5,
			energy = 0,
			bomb = 15,
			bio = 0,
			rad = 0,
			agony = 30
			)
			gives_prefex = TRUE
			armor_penetration += 5
			flash_resistances += 1
			maxHealth += 20
			health += 20
			prefex = "durable"
			return

		if("young")
			add_armor = list(
			melee = -5,
			bullet = -5,
			energy = -5,
			bomb = 0,
			bio = 0,
			rad = 0,
			agony = -5 //Rubbers deal way less to us!
			)
			gives_prefex = TRUE
			maxHealth -= 10 //0 hardship yet
			health -= 10
			move_to_delay -= 0.5 // faster
			poison_per_bite -= 1
			prefex = "young"
			return

		if("old")
			add_armor = list(
			melee = 5,
			bullet = 5,
			energy = 0,
			bomb = 10,
			bio = 0,
			rad = 0,
			agony = 20 //just cant feel it
			)
			gives_prefex = TRUE
			maxHealth += 20 //life already seen them by
			health += 20
			move_to_delay += 1 // Very slow
			poison_per_bite -= 1
			prefex = "aged"
			return

		if("venomous")
			add_armor = list(
			melee = 0,
			bullet = 0,
			energy = 0,
			bomb = 5,
			bio = 15,
			rad = 15,
			agony = 10
			)
			gives_prefex = TRUE
			poison_per_bite += 1
			prefex = "venomous"
			return

		if("brutish")
			add_armor = list(
			melee = 5,
			bullet = 5,
			energy = -5,
			bomb = 5,
			bio = 0,
			rad = 0,
			agony = 15
			)
			melee_damage_lower += 2
			melee_damage_upper += 2
			maxHealth += 5
			health += 5
			armor_penetration += 2
			gives_prefex = TRUE
			prefex = "brutish"
			return