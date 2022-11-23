/mob/living/carbon/superior_animal/roach/tazntz
	name = "Tazntz Roach"
	desc = "A mass of twitching and squirming limbs, the seemingly apperent abomination of a frog and roach melded together. It seems to despise all life, even its own."
	icon_state = "tzantz"
	meat_amount = 2
	turns_per_move = 4
	maxHealth = 115
	health = 115
	move_to_delay = 4
	mob_size = MOB_MEDIUM
	density = TRUE
	knockdown_odds = 1

	armor = list(melee = 15, bullet = 10, energy = 5, bomb = 5, bio = 20, rad = 0, agony = 0)
	armor_penetration = 15

// frogs dont slip over on water or soap.
/mob/living/carbon/superior_animal/roach/tazntz/slip(slipped_on,stun_duration=8)
	return FALSE
