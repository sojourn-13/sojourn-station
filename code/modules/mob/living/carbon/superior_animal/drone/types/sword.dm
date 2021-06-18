// More armor, HP and damage, but move slower
/mob/living/carbon/superior_animal/handmade/sword
	name = "Custom-made Sword Drone"
	desc = "Built from the Soteria robotics division's craftsmanship, and gathered designs of Greyson positronics, each of these fully robotic automatons is a unique, handmade, heavily armored assembly."
	icon = 'icons/mob/custom_bot.dmi'
	icon_state = "soteria_sword_handmade"
	health = 500
	maxHealth = 500
	melee_damage_lower = 40
	melee_damage_upper = 50

/mob/living/carbon/superior_animal/handmade/sword/examine(mob/user)
	..()
	to_chat(user, SPAN_NOTICE("This one bears a large sword to cut problems in half."))
