// Placeholder name
/mob/living/carbon/superior_animal/ameridian_golem/ameridian_shooter
	name = "ameridian shooter"
	desc = "A weird creature made of ameridian. It is quadruped and seems to shoot ameridian shards."
	health = 150
	maxHealth = 150
	armor = list(melee = 10, bullet = 40, energy = 45, bomb = 30, bio = 100, rad = 100) //We want to be rushed in melee, not shot.
	ranged = TRUE
	projectiletype = /obj/item/projectile/ameridian_shard/golem
	melee_damage_lower = 10
	melee_damage_upper = 15

