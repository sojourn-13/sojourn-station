/mob/living/carbon/superior_animal/fungi/slime
	name = "Mold-Slime"
	desc = "A mold-slime, produced by the mycus, these creatures are known for being immensely strong and incredibly durable, but short sighted and rather dimwitted. The bottom half is a slime-like core \
	but the cap is a hardened plate equal to a steel shield in density."
	icon_state = "slimemold"
	icon_living = "slimemold"
	icon_dead = "slimemold_dead"
	icon_rest = "slimemold_rest"

	// Better combat stats than other mushrooms.
	maxHealth = 300
	health = 300
	melee_damage_lower = 40
	melee_damage_upper = 45
	viewRange = 6
	armor = list(
		melee = 30,
		bullet = 20,
		energy = 20,
		bomb = 10,
		bio = 10,
		rad = 10,
		agony = 10
	)
