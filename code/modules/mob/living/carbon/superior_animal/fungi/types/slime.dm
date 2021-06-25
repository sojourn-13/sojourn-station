/mob/living/carbon/superior_animal/fungi/slime
	name = "Slime Follower"
	desc = "A slime-mold follower, made by a Slime-mold Mycus. It will produce random medicine when fed."

	// Better combat stats than other mushrooms.
	maxHealth = 250
	health = 250
	melee_damage_lower = 40
	melee_damage_upper = 45
	viewRange = 8
	armor = list(
		melee = 30,
		bullet = 20,
		energy = 20,
		bomb = 10,
		bio = 10,
		rad = 10,
		agony = 10
	)
