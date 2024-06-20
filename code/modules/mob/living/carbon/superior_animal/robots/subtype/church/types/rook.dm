/mob/living/carbon/superior_animal/robot/church/rook
	name = "Rook Golem"
	desc = "The Rook, a golem made by the church and fashioned after the time honored game of chess by Brynn. The strongest of church golems, slow, lumbering, and packing the strength to go toe \
	to toe with a primal render and win with ease. When the skill of pawns, the strength of knights, and the devastation of bishops fails, the Rook thunders forth."
	faction = "neutral"
	icon_state = "rook_golem_new"
	fleshcolor = "#964B00"
	bloodcolor = "#964B00"
	attacktext = "pumbles"
	move_to_delay = 5 //Slowdown!
	turns_per_move = 5
	meat_amount = 3 // Chunky boi
	health = 550
	maxHealth = 550
	melee_damage_lower = 60 //Big slow things dont deal a lot do to bullet sponges
	melee_damage_upper = 75
	meat_type = /obj/item/stack/material/gold/random
	drop1 = /obj/item/stack/material/gold/random
	drop2 = /obj/item/book/ritual/cruciform
	armor = list(melee = 18, bullet = 6, energy = 5, bomb = 30, bio = 100, rad = 100, agony = 100)
	target_dummy = TRUE
