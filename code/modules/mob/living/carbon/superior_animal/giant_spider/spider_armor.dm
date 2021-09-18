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
/*
//We'll assume that damage is list(brute = 5, burn = 5) and armor is a list(brute = 5, toxin = 5)
	var/list/result = list() //Creates a new list
	for(var/key in damage) //gets every entry in the damage list and sets 'key' to it one at a time. Because of how byond lists work, however, key will be set to 'brute' for the first loop, then 'burn'
		if(key in armor) //brute is in armor too
			result[key] = max(damage[key] - armor[key], 0) //So you just take the difference between them and put the result in the result list.
		else //burn is not in armor
			result[key] = damage[key] //So you just deal the damage directly to the player's life points.
  //You'll notice that at no point did toxin matter. Yes, armor blocks toxin, but because no toxin damage was actually done, in the end we didn't need to add it to the result damage list.
  //So, at the very end, result = list(brute = 0, burn = 5)
*/
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