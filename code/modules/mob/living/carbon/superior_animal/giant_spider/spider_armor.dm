/mob/living/carbon/superior_animal/giant_spider/New()
	..()

	if(give_randomized_armor)
		pick_armor()
		armor += add_armor
		if(gives_prefex)
			name = "[prefex] [name]"



/mob/living/carbon/superior_animal/giant_spider/pick_armor()
	switch (pickweight(list("basic" = 5, "padded" = 1, "lustrous" = 1, "insensitive" = 3)))

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
			flash_resistances += 2
			return

		if("insensitive")
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
			flash_resistances += 1
			prefex = "insensitive"
			return