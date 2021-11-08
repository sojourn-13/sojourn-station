/mob/living/carbon/superior_animal/roach/New()
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



/mob/living/carbon/superior_animal/roach/pick_armor()
	switch (pickweight(list("basic" = 15, "Biosilicified" = 5, "Lambertian" = 3, "Insensitive" = 4)))

		if("basic") //No changes, we are base level
			return

		if("Biosilicified")
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
			prefex = "Biosilicified"
			return

		if("Lambertian")
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
			prefex = "Lambertian"
			flash_resistances += 2
			return

		if("Insensitive")
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
			prefex = "Insensitive"
			return
