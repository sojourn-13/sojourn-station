/mob/living/carbon/superior_animal/robot/church/bishop
	name = "Bishop Golem"
	desc = "The Bishop, a golem made by the church and fashioned after the time honored game of chess by Brynn. Frail compared to other church golems, but his plasma infused staff can send out a \
	devastating and dangerous explosive, making him dangerous for his potential collateral. Use with caution."
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
	armor = list(melee = 3, bullet = 3, energy = 2, bomb = 5, bio = 100, rad = 100, agony = 100)
	range_telegraph = "starts to hum ominously while staring at"
