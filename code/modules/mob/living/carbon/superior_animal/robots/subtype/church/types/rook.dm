/mob/living/carbon/superior_animal/robot/church/rook
	name = "Rook Golem"
	desc = "A massive gold gilded robotic golem designed by Augustine to help protect the church and guard areas of hostile local wildlife. Strong and heavily suited for melee combat, but easily \
	destroyed by bullets or energy blasts." //Todo: Have kaz rewrite this and better lore, maybe Greyson AI helped make it?
	faction = "neutral"
	icon_state = "rook_golem_new"
	fleshcolor = "#964B00"
	bloodcolor = "#964B00"
	attacktext = "pumbles"
	move_to_delay = 6 //Slowdown!
	turns_per_move = 6
	meat_amount = 3 // Chunky boi
	health = 550
	maxHealth = 550
	melee_damage_lower = 30 //Big slow things dont deal a lot do to bullet sponges
	melee_damage_upper = 40
	meat_type = /obj/item/stack/material/gold/random
	drop1 = /obj/item/stack/material/gold/random
	drop2 = /obj/item/book/ritual/cruciform
	armor = list(melee = 75, bullet = 25, energy = 20, bomb = 30, bio = 100, rad = 100, agony = 100)
