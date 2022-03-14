/mob/living/carbon/superior_animal/robot/church/pawm
	name = "Pawn Golem"
	desc = "A rather well made but still weak golem with two swords ready to duel strike down any thing it can target. Do to its high speed its unable to take much punishment." //Todo: Have kaz rewrite this and better lore, maybe Greyson AI helped make it?
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
	melee_damage_lower = 60 //Tons of damage but a weak bot, just like a pawn
	melee_damage_upper = 90
	meat_type = /obj/item/stack/material/silver/random
	drop1 = /obj/item/tool/sword/nt/longsword
	drop2 = /obj/item/tool/sword/nt/shortsword
	armor = list(melee = 15, bullet = 15, energy = 10, bomb = 5, bio = 100, rad = 100, agony = 100)
