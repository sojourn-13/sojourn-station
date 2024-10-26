/mob/living/carbon/superior_animal/fungi/slime
	name = "Mold-Slime"
	desc = "A mold-slime, produced by the mycus, these creatures are known for being immensely strong and incredibly durable, but short sighted and rather dimwitted. The bottom half is a slime-like core \
	but the cap is a hardened plate equal to a steel shield in density."
	icon_state = "slimemold"
	icon_living = "slimemold"
	icon_dead = "slimemold_dead"
	icon_rest = "slimemold_rest"

	// Better combat stats than other mushrooms.
	maxHealth = 400
	health = 400
	melee_damage_lower = 40
	melee_damage_upper = 45
	viewRange = 3
	armor = list(
		melee = 10,
		bullet = 5,
		energy = 5,
		bomb = 10,
		bio = 10,
		rad = 10,
		agony = 10
	)

/mob/living/carbon/superior_animal/fungi/slime/New()
	var/picked_name = "[pick("Obsidian","Rock","Iron","Shield","War","Thunk","Brick","Khan","Cutter","Knuck","Kor","Art","Moch","Krak")]"
	name = "Mold-Slime [picked_name]"
	..()
