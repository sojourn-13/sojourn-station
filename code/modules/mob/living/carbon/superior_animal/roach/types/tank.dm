/mob/living/carbon/superior/roach/tank
	name = "Panzer Roach"
	desc = "A monstrous, dog-sized cockroach. This one looks more robust than others."
	icon_state = "panzer"
	meat_amount = 4
	turns_per_move = 2
	maxHealth = 50 * ROACH_HEALTH_MOD
	health = 50 * ROACH_HEALTH_MOD
	move_to_delay = 7
	mob_size = MOB_MEDIUM
	density = TRUE
	meat_type = /obj/item/reagent_containers/snacks/meat/roachmeat/panzer
	knockdown_odds = 3
	get_stat_modifier = TRUE //we're big boys, we get a little mod as a treat.

	armor = list(melee = 3, bullet = 1, energy = 0, bomb = 5, bio = 20, rad = 0, agony = 0)
	armor_divisor = 1.2
	research_value = 300 // Tank roach - medium armored

// Panzers won't slip over on water or soap.
/mob/living/carbon/superior/roach/tank/slip(slipped_on,stun_duration=8)
	return FALSE
