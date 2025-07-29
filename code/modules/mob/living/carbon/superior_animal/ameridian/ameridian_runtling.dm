// Smol but fast variant of the golem
/mob/living/carbon/superior/ameridian_golem/runtling
	name = "ameridian runtling"
	desc = "A weird creature made of ameridian. It is smaller and weaker, but numerous and fast."
	icon_state = "golem_ameridian_blue"
	health = 30 * AMGOLEM_HEALTH_MOD
	maxHealth = 30 * AMGOLEM_HEALTH_MOD
	move_to_delay = 3 // Very fast
	armor = list(melee = 1, bullet = -2, energy = 2, bomb = 15, bio = 100, rad = 100) //We want to be gunned down, not lasered
	drop_amount = 1
	size_factor = 0.75 // 25% Smaller

	mob_ablative_armor = 4
	ablative_retaining = ABLATION_CERAMIC
	research_value = 1000
