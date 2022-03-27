// Smol but fast variant of the golem
/mob/living/carbon/superior_animal/ameridian_golem/runner
	name = "ameridian runner"
	desc = "A weird creature made of ameridian. It is smaller and weaker, but numerous and fast."
	health = 75
	maxHealth = 75
	move_to_delay = 1 // Very fast
	armor = list(melee = 20, bullet = 10, energy = 25, bomb = 15, bio = 100, rad = 100) //We want to be gunned down, not lasered
	drop_amount = 0 // No loot
	var/pack_size = 2 // How many runners are spawned alongside it.

/mob/living/carbon/superior_animal/ameridian_golem/runner/New(loc, var/from_crystal = TRUE)
	..()
	transform = initial(transform)
	transform *= 0.75 // 25% smoller
	if(from_crystal)
		for(var/I = 0, I < pack_size, I++)
			new /mob/living/carbon/superior_animal/ameridian_golem/runner(get_turf(src), FALSE)
