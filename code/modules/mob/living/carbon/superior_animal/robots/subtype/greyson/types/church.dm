/mob/living/carbon/superior_animal/robot/greyson/synthetic/allied/rook
	name = "Rook Golem"
	desc = "A massive gold gilded robotic golem designed by Augustine to help protect the church and guard areas of hostile local wildlife. Strong and heavily suited for melee combat, but easily \
	destroyed by bullets or energy blasts." //Todo: Have kaz rewrite this and better lore, maybe Greyson AI helped make it?
	faction = "neutral"
	icon = 'icons/mob/mobs-humanoid.dmi'
	icon_state = "rook_golem_new"
	fleshcolor = "#964B00"
	bloodcolor = "#964B00"
	attacktext = "pumbles"
	termiation = FALSE
	move_to_delay = 6 //Slowdown!
	turns_per_move = 6
	meat_amount = 1
	health = 550
	maxHealth = 550
	melee_damage_lower = 30 //Big slow things dont deal a lot do to bullet sponges
	melee_damage_upper = 40
	meat_type = /obj/item/stack/material/gold/random
	drop1 = /obj/item/stack/material/gold/random
	drop2 = /obj/item/book/ritual/cruciform
	armor = list(melee = 75, bullet = 25, energy = 20, bomb = 30, bio = 100, rad = 100, agony = 100)

/mob/living/carbon/superior_animal/robot/greyson/synthetic/allied/pawm
	name = "Pawn Bot"
	desc = "A rather well made but still weak bot with two swords ready to duel strike down any thing it can target. Do to its high speed its unable to take much punishment." //Todo: Have kaz rewrite this and better lore, maybe Greyson AI helped make it?
	faction = "neutral"
	icon = 'icons/mob/mobs-humanoid.dmi'
	icon_state = "pawn_golem"
	attacktext = "duel strikes"
	fleshcolor = "#964B00"
	bloodcolor = "#964B00"
	termiation = FALSE
	move_to_delay = 2
	turns_per_move = 2
	meat_amount = 1
	health = 250
	maxHealth = 250
	melee_damage_lower = 60 //Tons of damage but a weak bot, just like a pawn
	melee_damage_upper = 90
	meat_type = /obj/item/stack/material/silver/random
	drop1 = /obj/item/tool/sword/nt/longsword
	drop2 = /obj/item/tool/sword/nt/shortsword
	armor = list(melee = 15, bullet = 15, energy = 10, bomb = 5, bio = 100, rad = 100, agony = 100)

/mob/living/carbon/superior_animal/robot/greyson/synthetic/allied/bishop
	name = "Bishop Bot"
	desc = "A tall but frail imposing bot that has a rather powerful staff to strike down anything it can target, just make sure to not stand anywae near its gazing view..." //Todo: Have kaz rewrite this and better lore, maybe Greyson AI helped make it?
	faction = "neutral"
	icon = 'icons/mob/mobs-humanoid.dmi'
	fleshcolor = "#964B00"
	bloodcolor = "#964B00"
	icon_state = "bishop_golem"
	attacktext = "glares"
	fire_verb = "casts a flarming ball of plasma"
	termiation = FALSE
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

