// More armor, HP and damage, but move slower
/mob/living/carbon/superior_animal/handmade/sword
	name = "Custom-made Sword Drone"
	desc = "Built from the Soteria robotics division's craftsmanship, and gathered designs of Greyson positronics, each of these fully robotic automatons is a unique, handmade, heavily armored assembly."
	icon_state = "soteria_sword_handmade"
	attack_sound = 'sound/weapons/blade1.ogg'
	health = 500
	maxHealth = 500
	melee_damage_lower = 40
	melee_damage_upper = 50
	move_to_delay = 4
	cell = new /obj/item/cell/large/moebius // Hold the drone's power cell, default to a cheap one.
	exam_message = "This one bears a large sword to cut problems in half."
