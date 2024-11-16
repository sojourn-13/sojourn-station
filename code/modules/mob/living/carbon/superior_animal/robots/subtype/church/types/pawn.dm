/mob/living/carbon/superior_animal/robot/church/pawm
	name = "Pawn Golem"
	desc = "The Pawn, a golem made by the church and fashioned after the time honored game of chess by Brynn. Those who underestimate pawns always lose, being the weakest of church golems, \
	their twin blades and light armor make them an extremely fast and heavy striker."
	faction = "neutral"
	icon_state = "pawn_golem"
	attacktext = "duel strikes"
	fleshcolor = "#964B00"
	bloodcolor = "#964B00"
	move_to_delay = 2
	turns_per_move = 2
	pass_flags = PASSTABLE
	meat_amount = 1
	health = 250
	maxHealth = 250
	melee_damage_lower = 30 //Tons of damage but a weak bot, just like a pawn
	melee_damage_upper = 40
	meat_type = /obj/item/stack/material/silver/random
	drop1 = /obj/item/tool/sword/nt/longsword
	drop2 = /obj/item/tool/sword/nt/shortsword
	armor = list(melee = 3, bullet = 3, energy = 2, bomb = 5, bio = 100, rad = 100, agony = 100)
