/mob/living/carbon/superior/roach/hunter
	name = "Jager Roach"
	desc = "A monstrous, dog-sized cockroach. This one has bigger claws."
	icon_state = "jager"

	turns_per_move = 3
	maxHealth = 30 * ROACH_HEALTH_MOD
	health = 30 * ROACH_HEALTH_MOD
	move_to_delay = 3.5

	blattedin_revives_left = 2

	knockdown_odds = 5
	melee_damage_lower = 3
	melee_damage_upper = 10

	meat_type = /obj/item/reagent_containers/snacks/meat/roachmeat/jager
	meat_amount = 3
	armor_divisor = 1.1
	research_value = 200 // Medium hunter roach
