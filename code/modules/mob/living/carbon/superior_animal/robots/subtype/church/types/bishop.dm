/mob/living/carbon/superior_animal/robot/church/bishop
	name = "Bishop Golem"
	desc = "A tall but frail imposing golem that has a rather powerful staff to strike down anything it can target, just make sure to not stand anywae near its gazing view..." //Todo: Have kaz rewrite this and better lore, maybe Greyson AI helped make it?
	faction = "neutral"
	fleshcolor = "#964B00"
	bloodcolor = "#964B00"
	icon_state = "bishop_golem"
	attacktext = "glares"
	fire_verb = "casts a flarming ball of plasma"
	ranged = TRUE
	move_to_delay = 4
	turns_per_move = 4
	meat_amount = 1
	health = 150 //not a melee bot
	maxHealth = 150
	ranged_cooldown = 20
	melee_damage_lower = 5 //not a melee bot
	melee_damage_upper = 8
	meat_type = /obj/item/stack/material/gold/random
	projectiletype = /obj/item/projectile/plasma/aoe/heat/strong
	drop1 = /obj/item/book/ritual/cruciform/priest
	drop2 = /obj/item/stack/material/gold/random
	armor = list(melee = 15, bullet = 15, energy = 10, bomb = 5, bio = 100, rad = 100, agony = 100)
