// The Knight Golem is between the Pawn and the Rook in term of durability, damage and speed.
/mob/living/carbon/superior_animal/robot/church/knight
	name = "Knight Golem"
	desc = "The Knight, a golem made by the church and fashioned after the time honored game of chess by Brynn. Reliable, strong, and quite sturdy compared to pawns and bishops, though not \
	nearly as much of a power house as the Rook. One of the more common sights among church golems."
	faction = "neutral"
	icon_state = "knight_golem"
	attacktext = "strikes"
	fleshcolor = "#964B00"
	bloodcolor = "#964B00"
	move_to_delay = 3
	turns_per_move = 3
	pass_flags = PASSTABLE
	meat_amount = 1
	health = 400
	maxHealth = 400
	melee_damage_lower = 45
	melee_damage_upper = 55
	meat_type = /obj/item/stack/material/platinum/random
	drop1 = /obj/item/tool/sword/nt/longsword
	drop2 = /obj/item/shield/riot/nt
	armor = list(melee = 12, bullet = 12, energy = 2, bomb = 15, bio = 100, rad = 100, agony = 100)
